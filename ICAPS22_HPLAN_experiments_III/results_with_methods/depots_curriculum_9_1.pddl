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
      ?auto_5328 - SURFACE
      ?auto_5329 - SURFACE
    )
    :vars
    (
      ?auto_5330 - HOIST
      ?auto_5331 - PLACE
      ?auto_5333 - PLACE
      ?auto_5334 - HOIST
      ?auto_5335 - SURFACE
      ?auto_5332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5330 ?auto_5331 ) ( SURFACE-AT ?auto_5328 ?auto_5331 ) ( CLEAR ?auto_5328 ) ( IS-CRATE ?auto_5329 ) ( AVAILABLE ?auto_5330 ) ( not ( = ?auto_5333 ?auto_5331 ) ) ( HOIST-AT ?auto_5334 ?auto_5333 ) ( AVAILABLE ?auto_5334 ) ( SURFACE-AT ?auto_5329 ?auto_5333 ) ( ON ?auto_5329 ?auto_5335 ) ( CLEAR ?auto_5329 ) ( TRUCK-AT ?auto_5332 ?auto_5331 ) ( not ( = ?auto_5328 ?auto_5329 ) ) ( not ( = ?auto_5328 ?auto_5335 ) ) ( not ( = ?auto_5329 ?auto_5335 ) ) ( not ( = ?auto_5330 ?auto_5334 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5332 ?auto_5331 ?auto_5333 )
      ( !LIFT ?auto_5334 ?auto_5329 ?auto_5335 ?auto_5333 )
      ( !LOAD ?auto_5334 ?auto_5329 ?auto_5332 ?auto_5333 )
      ( !DRIVE ?auto_5332 ?auto_5333 ?auto_5331 )
      ( !UNLOAD ?auto_5330 ?auto_5329 ?auto_5332 ?auto_5331 )
      ( !DROP ?auto_5330 ?auto_5329 ?auto_5328 ?auto_5331 )
      ( MAKE-1CRATE-VERIFY ?auto_5328 ?auto_5329 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5338 - SURFACE
      ?auto_5339 - SURFACE
    )
    :vars
    (
      ?auto_5340 - HOIST
      ?auto_5341 - PLACE
      ?auto_5343 - PLACE
      ?auto_5344 - HOIST
      ?auto_5345 - SURFACE
      ?auto_5342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5340 ?auto_5341 ) ( SURFACE-AT ?auto_5338 ?auto_5341 ) ( CLEAR ?auto_5338 ) ( IS-CRATE ?auto_5339 ) ( AVAILABLE ?auto_5340 ) ( not ( = ?auto_5343 ?auto_5341 ) ) ( HOIST-AT ?auto_5344 ?auto_5343 ) ( AVAILABLE ?auto_5344 ) ( SURFACE-AT ?auto_5339 ?auto_5343 ) ( ON ?auto_5339 ?auto_5345 ) ( CLEAR ?auto_5339 ) ( TRUCK-AT ?auto_5342 ?auto_5341 ) ( not ( = ?auto_5338 ?auto_5339 ) ) ( not ( = ?auto_5338 ?auto_5345 ) ) ( not ( = ?auto_5339 ?auto_5345 ) ) ( not ( = ?auto_5340 ?auto_5344 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5342 ?auto_5341 ?auto_5343 )
      ( !LIFT ?auto_5344 ?auto_5339 ?auto_5345 ?auto_5343 )
      ( !LOAD ?auto_5344 ?auto_5339 ?auto_5342 ?auto_5343 )
      ( !DRIVE ?auto_5342 ?auto_5343 ?auto_5341 )
      ( !UNLOAD ?auto_5340 ?auto_5339 ?auto_5342 ?auto_5341 )
      ( !DROP ?auto_5340 ?auto_5339 ?auto_5338 ?auto_5341 )
      ( MAKE-1CRATE-VERIFY ?auto_5338 ?auto_5339 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5349 - SURFACE
      ?auto_5350 - SURFACE
      ?auto_5351 - SURFACE
    )
    :vars
    (
      ?auto_5353 - HOIST
      ?auto_5354 - PLACE
      ?auto_5356 - PLACE
      ?auto_5357 - HOIST
      ?auto_5355 - SURFACE
      ?auto_5360 - PLACE
      ?auto_5359 - HOIST
      ?auto_5358 - SURFACE
      ?auto_5352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5353 ?auto_5354 ) ( IS-CRATE ?auto_5351 ) ( not ( = ?auto_5356 ?auto_5354 ) ) ( HOIST-AT ?auto_5357 ?auto_5356 ) ( AVAILABLE ?auto_5357 ) ( SURFACE-AT ?auto_5351 ?auto_5356 ) ( ON ?auto_5351 ?auto_5355 ) ( CLEAR ?auto_5351 ) ( not ( = ?auto_5350 ?auto_5351 ) ) ( not ( = ?auto_5350 ?auto_5355 ) ) ( not ( = ?auto_5351 ?auto_5355 ) ) ( not ( = ?auto_5353 ?auto_5357 ) ) ( SURFACE-AT ?auto_5349 ?auto_5354 ) ( CLEAR ?auto_5349 ) ( IS-CRATE ?auto_5350 ) ( AVAILABLE ?auto_5353 ) ( not ( = ?auto_5360 ?auto_5354 ) ) ( HOIST-AT ?auto_5359 ?auto_5360 ) ( AVAILABLE ?auto_5359 ) ( SURFACE-AT ?auto_5350 ?auto_5360 ) ( ON ?auto_5350 ?auto_5358 ) ( CLEAR ?auto_5350 ) ( TRUCK-AT ?auto_5352 ?auto_5354 ) ( not ( = ?auto_5349 ?auto_5350 ) ) ( not ( = ?auto_5349 ?auto_5358 ) ) ( not ( = ?auto_5350 ?auto_5358 ) ) ( not ( = ?auto_5353 ?auto_5359 ) ) ( not ( = ?auto_5349 ?auto_5351 ) ) ( not ( = ?auto_5349 ?auto_5355 ) ) ( not ( = ?auto_5351 ?auto_5358 ) ) ( not ( = ?auto_5356 ?auto_5360 ) ) ( not ( = ?auto_5357 ?auto_5359 ) ) ( not ( = ?auto_5355 ?auto_5358 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5349 ?auto_5350 )
      ( MAKE-1CRATE ?auto_5350 ?auto_5351 )
      ( MAKE-2CRATE-VERIFY ?auto_5349 ?auto_5350 ?auto_5351 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5363 - SURFACE
      ?auto_5364 - SURFACE
    )
    :vars
    (
      ?auto_5365 - HOIST
      ?auto_5366 - PLACE
      ?auto_5368 - PLACE
      ?auto_5369 - HOIST
      ?auto_5370 - SURFACE
      ?auto_5367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5365 ?auto_5366 ) ( SURFACE-AT ?auto_5363 ?auto_5366 ) ( CLEAR ?auto_5363 ) ( IS-CRATE ?auto_5364 ) ( AVAILABLE ?auto_5365 ) ( not ( = ?auto_5368 ?auto_5366 ) ) ( HOIST-AT ?auto_5369 ?auto_5368 ) ( AVAILABLE ?auto_5369 ) ( SURFACE-AT ?auto_5364 ?auto_5368 ) ( ON ?auto_5364 ?auto_5370 ) ( CLEAR ?auto_5364 ) ( TRUCK-AT ?auto_5367 ?auto_5366 ) ( not ( = ?auto_5363 ?auto_5364 ) ) ( not ( = ?auto_5363 ?auto_5370 ) ) ( not ( = ?auto_5364 ?auto_5370 ) ) ( not ( = ?auto_5365 ?auto_5369 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5367 ?auto_5366 ?auto_5368 )
      ( !LIFT ?auto_5369 ?auto_5364 ?auto_5370 ?auto_5368 )
      ( !LOAD ?auto_5369 ?auto_5364 ?auto_5367 ?auto_5368 )
      ( !DRIVE ?auto_5367 ?auto_5368 ?auto_5366 )
      ( !UNLOAD ?auto_5365 ?auto_5364 ?auto_5367 ?auto_5366 )
      ( !DROP ?auto_5365 ?auto_5364 ?auto_5363 ?auto_5366 )
      ( MAKE-1CRATE-VERIFY ?auto_5363 ?auto_5364 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5375 - SURFACE
      ?auto_5376 - SURFACE
      ?auto_5377 - SURFACE
      ?auto_5378 - SURFACE
    )
    :vars
    (
      ?auto_5384 - HOIST
      ?auto_5383 - PLACE
      ?auto_5382 - PLACE
      ?auto_5380 - HOIST
      ?auto_5379 - SURFACE
      ?auto_5389 - PLACE
      ?auto_5386 - HOIST
      ?auto_5385 - SURFACE
      ?auto_5390 - PLACE
      ?auto_5387 - HOIST
      ?auto_5388 - SURFACE
      ?auto_5381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5384 ?auto_5383 ) ( IS-CRATE ?auto_5378 ) ( not ( = ?auto_5382 ?auto_5383 ) ) ( HOIST-AT ?auto_5380 ?auto_5382 ) ( AVAILABLE ?auto_5380 ) ( SURFACE-AT ?auto_5378 ?auto_5382 ) ( ON ?auto_5378 ?auto_5379 ) ( CLEAR ?auto_5378 ) ( not ( = ?auto_5377 ?auto_5378 ) ) ( not ( = ?auto_5377 ?auto_5379 ) ) ( not ( = ?auto_5378 ?auto_5379 ) ) ( not ( = ?auto_5384 ?auto_5380 ) ) ( IS-CRATE ?auto_5377 ) ( not ( = ?auto_5389 ?auto_5383 ) ) ( HOIST-AT ?auto_5386 ?auto_5389 ) ( AVAILABLE ?auto_5386 ) ( SURFACE-AT ?auto_5377 ?auto_5389 ) ( ON ?auto_5377 ?auto_5385 ) ( CLEAR ?auto_5377 ) ( not ( = ?auto_5376 ?auto_5377 ) ) ( not ( = ?auto_5376 ?auto_5385 ) ) ( not ( = ?auto_5377 ?auto_5385 ) ) ( not ( = ?auto_5384 ?auto_5386 ) ) ( SURFACE-AT ?auto_5375 ?auto_5383 ) ( CLEAR ?auto_5375 ) ( IS-CRATE ?auto_5376 ) ( AVAILABLE ?auto_5384 ) ( not ( = ?auto_5390 ?auto_5383 ) ) ( HOIST-AT ?auto_5387 ?auto_5390 ) ( AVAILABLE ?auto_5387 ) ( SURFACE-AT ?auto_5376 ?auto_5390 ) ( ON ?auto_5376 ?auto_5388 ) ( CLEAR ?auto_5376 ) ( TRUCK-AT ?auto_5381 ?auto_5383 ) ( not ( = ?auto_5375 ?auto_5376 ) ) ( not ( = ?auto_5375 ?auto_5388 ) ) ( not ( = ?auto_5376 ?auto_5388 ) ) ( not ( = ?auto_5384 ?auto_5387 ) ) ( not ( = ?auto_5375 ?auto_5377 ) ) ( not ( = ?auto_5375 ?auto_5385 ) ) ( not ( = ?auto_5377 ?auto_5388 ) ) ( not ( = ?auto_5389 ?auto_5390 ) ) ( not ( = ?auto_5386 ?auto_5387 ) ) ( not ( = ?auto_5385 ?auto_5388 ) ) ( not ( = ?auto_5375 ?auto_5378 ) ) ( not ( = ?auto_5375 ?auto_5379 ) ) ( not ( = ?auto_5376 ?auto_5378 ) ) ( not ( = ?auto_5376 ?auto_5379 ) ) ( not ( = ?auto_5378 ?auto_5385 ) ) ( not ( = ?auto_5378 ?auto_5388 ) ) ( not ( = ?auto_5382 ?auto_5389 ) ) ( not ( = ?auto_5382 ?auto_5390 ) ) ( not ( = ?auto_5380 ?auto_5386 ) ) ( not ( = ?auto_5380 ?auto_5387 ) ) ( not ( = ?auto_5379 ?auto_5385 ) ) ( not ( = ?auto_5379 ?auto_5388 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5375 ?auto_5376 ?auto_5377 )
      ( MAKE-1CRATE ?auto_5377 ?auto_5378 )
      ( MAKE-3CRATE-VERIFY ?auto_5375 ?auto_5376 ?auto_5377 ?auto_5378 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5393 - SURFACE
      ?auto_5394 - SURFACE
    )
    :vars
    (
      ?auto_5395 - HOIST
      ?auto_5396 - PLACE
      ?auto_5398 - PLACE
      ?auto_5399 - HOIST
      ?auto_5400 - SURFACE
      ?auto_5397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5395 ?auto_5396 ) ( SURFACE-AT ?auto_5393 ?auto_5396 ) ( CLEAR ?auto_5393 ) ( IS-CRATE ?auto_5394 ) ( AVAILABLE ?auto_5395 ) ( not ( = ?auto_5398 ?auto_5396 ) ) ( HOIST-AT ?auto_5399 ?auto_5398 ) ( AVAILABLE ?auto_5399 ) ( SURFACE-AT ?auto_5394 ?auto_5398 ) ( ON ?auto_5394 ?auto_5400 ) ( CLEAR ?auto_5394 ) ( TRUCK-AT ?auto_5397 ?auto_5396 ) ( not ( = ?auto_5393 ?auto_5394 ) ) ( not ( = ?auto_5393 ?auto_5400 ) ) ( not ( = ?auto_5394 ?auto_5400 ) ) ( not ( = ?auto_5395 ?auto_5399 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5397 ?auto_5396 ?auto_5398 )
      ( !LIFT ?auto_5399 ?auto_5394 ?auto_5400 ?auto_5398 )
      ( !LOAD ?auto_5399 ?auto_5394 ?auto_5397 ?auto_5398 )
      ( !DRIVE ?auto_5397 ?auto_5398 ?auto_5396 )
      ( !UNLOAD ?auto_5395 ?auto_5394 ?auto_5397 ?auto_5396 )
      ( !DROP ?auto_5395 ?auto_5394 ?auto_5393 ?auto_5396 )
      ( MAKE-1CRATE-VERIFY ?auto_5393 ?auto_5394 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5406 - SURFACE
      ?auto_5407 - SURFACE
      ?auto_5408 - SURFACE
      ?auto_5409 - SURFACE
      ?auto_5410 - SURFACE
    )
    :vars
    (
      ?auto_5416 - HOIST
      ?auto_5414 - PLACE
      ?auto_5411 - PLACE
      ?auto_5412 - HOIST
      ?auto_5413 - SURFACE
      ?auto_5424 - PLACE
      ?auto_5420 - HOIST
      ?auto_5421 - SURFACE
      ?auto_5419 - PLACE
      ?auto_5423 - HOIST
      ?auto_5422 - SURFACE
      ?auto_5417 - PLACE
      ?auto_5418 - HOIST
      ?auto_5425 - SURFACE
      ?auto_5415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5416 ?auto_5414 ) ( IS-CRATE ?auto_5410 ) ( not ( = ?auto_5411 ?auto_5414 ) ) ( HOIST-AT ?auto_5412 ?auto_5411 ) ( AVAILABLE ?auto_5412 ) ( SURFACE-AT ?auto_5410 ?auto_5411 ) ( ON ?auto_5410 ?auto_5413 ) ( CLEAR ?auto_5410 ) ( not ( = ?auto_5409 ?auto_5410 ) ) ( not ( = ?auto_5409 ?auto_5413 ) ) ( not ( = ?auto_5410 ?auto_5413 ) ) ( not ( = ?auto_5416 ?auto_5412 ) ) ( IS-CRATE ?auto_5409 ) ( not ( = ?auto_5424 ?auto_5414 ) ) ( HOIST-AT ?auto_5420 ?auto_5424 ) ( AVAILABLE ?auto_5420 ) ( SURFACE-AT ?auto_5409 ?auto_5424 ) ( ON ?auto_5409 ?auto_5421 ) ( CLEAR ?auto_5409 ) ( not ( = ?auto_5408 ?auto_5409 ) ) ( not ( = ?auto_5408 ?auto_5421 ) ) ( not ( = ?auto_5409 ?auto_5421 ) ) ( not ( = ?auto_5416 ?auto_5420 ) ) ( IS-CRATE ?auto_5408 ) ( not ( = ?auto_5419 ?auto_5414 ) ) ( HOIST-AT ?auto_5423 ?auto_5419 ) ( AVAILABLE ?auto_5423 ) ( SURFACE-AT ?auto_5408 ?auto_5419 ) ( ON ?auto_5408 ?auto_5422 ) ( CLEAR ?auto_5408 ) ( not ( = ?auto_5407 ?auto_5408 ) ) ( not ( = ?auto_5407 ?auto_5422 ) ) ( not ( = ?auto_5408 ?auto_5422 ) ) ( not ( = ?auto_5416 ?auto_5423 ) ) ( SURFACE-AT ?auto_5406 ?auto_5414 ) ( CLEAR ?auto_5406 ) ( IS-CRATE ?auto_5407 ) ( AVAILABLE ?auto_5416 ) ( not ( = ?auto_5417 ?auto_5414 ) ) ( HOIST-AT ?auto_5418 ?auto_5417 ) ( AVAILABLE ?auto_5418 ) ( SURFACE-AT ?auto_5407 ?auto_5417 ) ( ON ?auto_5407 ?auto_5425 ) ( CLEAR ?auto_5407 ) ( TRUCK-AT ?auto_5415 ?auto_5414 ) ( not ( = ?auto_5406 ?auto_5407 ) ) ( not ( = ?auto_5406 ?auto_5425 ) ) ( not ( = ?auto_5407 ?auto_5425 ) ) ( not ( = ?auto_5416 ?auto_5418 ) ) ( not ( = ?auto_5406 ?auto_5408 ) ) ( not ( = ?auto_5406 ?auto_5422 ) ) ( not ( = ?auto_5408 ?auto_5425 ) ) ( not ( = ?auto_5419 ?auto_5417 ) ) ( not ( = ?auto_5423 ?auto_5418 ) ) ( not ( = ?auto_5422 ?auto_5425 ) ) ( not ( = ?auto_5406 ?auto_5409 ) ) ( not ( = ?auto_5406 ?auto_5421 ) ) ( not ( = ?auto_5407 ?auto_5409 ) ) ( not ( = ?auto_5407 ?auto_5421 ) ) ( not ( = ?auto_5409 ?auto_5422 ) ) ( not ( = ?auto_5409 ?auto_5425 ) ) ( not ( = ?auto_5424 ?auto_5419 ) ) ( not ( = ?auto_5424 ?auto_5417 ) ) ( not ( = ?auto_5420 ?auto_5423 ) ) ( not ( = ?auto_5420 ?auto_5418 ) ) ( not ( = ?auto_5421 ?auto_5422 ) ) ( not ( = ?auto_5421 ?auto_5425 ) ) ( not ( = ?auto_5406 ?auto_5410 ) ) ( not ( = ?auto_5406 ?auto_5413 ) ) ( not ( = ?auto_5407 ?auto_5410 ) ) ( not ( = ?auto_5407 ?auto_5413 ) ) ( not ( = ?auto_5408 ?auto_5410 ) ) ( not ( = ?auto_5408 ?auto_5413 ) ) ( not ( = ?auto_5410 ?auto_5421 ) ) ( not ( = ?auto_5410 ?auto_5422 ) ) ( not ( = ?auto_5410 ?auto_5425 ) ) ( not ( = ?auto_5411 ?auto_5424 ) ) ( not ( = ?auto_5411 ?auto_5419 ) ) ( not ( = ?auto_5411 ?auto_5417 ) ) ( not ( = ?auto_5412 ?auto_5420 ) ) ( not ( = ?auto_5412 ?auto_5423 ) ) ( not ( = ?auto_5412 ?auto_5418 ) ) ( not ( = ?auto_5413 ?auto_5421 ) ) ( not ( = ?auto_5413 ?auto_5422 ) ) ( not ( = ?auto_5413 ?auto_5425 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_5406 ?auto_5407 ?auto_5408 ?auto_5409 )
      ( MAKE-1CRATE ?auto_5409 ?auto_5410 )
      ( MAKE-4CRATE-VERIFY ?auto_5406 ?auto_5407 ?auto_5408 ?auto_5409 ?auto_5410 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5428 - SURFACE
      ?auto_5429 - SURFACE
    )
    :vars
    (
      ?auto_5430 - HOIST
      ?auto_5431 - PLACE
      ?auto_5433 - PLACE
      ?auto_5434 - HOIST
      ?auto_5435 - SURFACE
      ?auto_5432 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5430 ?auto_5431 ) ( SURFACE-AT ?auto_5428 ?auto_5431 ) ( CLEAR ?auto_5428 ) ( IS-CRATE ?auto_5429 ) ( AVAILABLE ?auto_5430 ) ( not ( = ?auto_5433 ?auto_5431 ) ) ( HOIST-AT ?auto_5434 ?auto_5433 ) ( AVAILABLE ?auto_5434 ) ( SURFACE-AT ?auto_5429 ?auto_5433 ) ( ON ?auto_5429 ?auto_5435 ) ( CLEAR ?auto_5429 ) ( TRUCK-AT ?auto_5432 ?auto_5431 ) ( not ( = ?auto_5428 ?auto_5429 ) ) ( not ( = ?auto_5428 ?auto_5435 ) ) ( not ( = ?auto_5429 ?auto_5435 ) ) ( not ( = ?auto_5430 ?auto_5434 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5432 ?auto_5431 ?auto_5433 )
      ( !LIFT ?auto_5434 ?auto_5429 ?auto_5435 ?auto_5433 )
      ( !LOAD ?auto_5434 ?auto_5429 ?auto_5432 ?auto_5433 )
      ( !DRIVE ?auto_5432 ?auto_5433 ?auto_5431 )
      ( !UNLOAD ?auto_5430 ?auto_5429 ?auto_5432 ?auto_5431 )
      ( !DROP ?auto_5430 ?auto_5429 ?auto_5428 ?auto_5431 )
      ( MAKE-1CRATE-VERIFY ?auto_5428 ?auto_5429 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_5442 - SURFACE
      ?auto_5443 - SURFACE
      ?auto_5444 - SURFACE
      ?auto_5445 - SURFACE
      ?auto_5446 - SURFACE
      ?auto_5447 - SURFACE
    )
    :vars
    (
      ?auto_5450 - HOIST
      ?auto_5453 - PLACE
      ?auto_5452 - PLACE
      ?auto_5451 - HOIST
      ?auto_5449 - SURFACE
      ?auto_5459 - PLACE
      ?auto_5454 - HOIST
      ?auto_5460 - SURFACE
      ?auto_5465 - PLACE
      ?auto_5464 - HOIST
      ?auto_5458 - SURFACE
      ?auto_5456 - PLACE
      ?auto_5461 - HOIST
      ?auto_5462 - SURFACE
      ?auto_5455 - PLACE
      ?auto_5463 - HOIST
      ?auto_5457 - SURFACE
      ?auto_5448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5450 ?auto_5453 ) ( IS-CRATE ?auto_5447 ) ( not ( = ?auto_5452 ?auto_5453 ) ) ( HOIST-AT ?auto_5451 ?auto_5452 ) ( AVAILABLE ?auto_5451 ) ( SURFACE-AT ?auto_5447 ?auto_5452 ) ( ON ?auto_5447 ?auto_5449 ) ( CLEAR ?auto_5447 ) ( not ( = ?auto_5446 ?auto_5447 ) ) ( not ( = ?auto_5446 ?auto_5449 ) ) ( not ( = ?auto_5447 ?auto_5449 ) ) ( not ( = ?auto_5450 ?auto_5451 ) ) ( IS-CRATE ?auto_5446 ) ( not ( = ?auto_5459 ?auto_5453 ) ) ( HOIST-AT ?auto_5454 ?auto_5459 ) ( AVAILABLE ?auto_5454 ) ( SURFACE-AT ?auto_5446 ?auto_5459 ) ( ON ?auto_5446 ?auto_5460 ) ( CLEAR ?auto_5446 ) ( not ( = ?auto_5445 ?auto_5446 ) ) ( not ( = ?auto_5445 ?auto_5460 ) ) ( not ( = ?auto_5446 ?auto_5460 ) ) ( not ( = ?auto_5450 ?auto_5454 ) ) ( IS-CRATE ?auto_5445 ) ( not ( = ?auto_5465 ?auto_5453 ) ) ( HOIST-AT ?auto_5464 ?auto_5465 ) ( AVAILABLE ?auto_5464 ) ( SURFACE-AT ?auto_5445 ?auto_5465 ) ( ON ?auto_5445 ?auto_5458 ) ( CLEAR ?auto_5445 ) ( not ( = ?auto_5444 ?auto_5445 ) ) ( not ( = ?auto_5444 ?auto_5458 ) ) ( not ( = ?auto_5445 ?auto_5458 ) ) ( not ( = ?auto_5450 ?auto_5464 ) ) ( IS-CRATE ?auto_5444 ) ( not ( = ?auto_5456 ?auto_5453 ) ) ( HOIST-AT ?auto_5461 ?auto_5456 ) ( AVAILABLE ?auto_5461 ) ( SURFACE-AT ?auto_5444 ?auto_5456 ) ( ON ?auto_5444 ?auto_5462 ) ( CLEAR ?auto_5444 ) ( not ( = ?auto_5443 ?auto_5444 ) ) ( not ( = ?auto_5443 ?auto_5462 ) ) ( not ( = ?auto_5444 ?auto_5462 ) ) ( not ( = ?auto_5450 ?auto_5461 ) ) ( SURFACE-AT ?auto_5442 ?auto_5453 ) ( CLEAR ?auto_5442 ) ( IS-CRATE ?auto_5443 ) ( AVAILABLE ?auto_5450 ) ( not ( = ?auto_5455 ?auto_5453 ) ) ( HOIST-AT ?auto_5463 ?auto_5455 ) ( AVAILABLE ?auto_5463 ) ( SURFACE-AT ?auto_5443 ?auto_5455 ) ( ON ?auto_5443 ?auto_5457 ) ( CLEAR ?auto_5443 ) ( TRUCK-AT ?auto_5448 ?auto_5453 ) ( not ( = ?auto_5442 ?auto_5443 ) ) ( not ( = ?auto_5442 ?auto_5457 ) ) ( not ( = ?auto_5443 ?auto_5457 ) ) ( not ( = ?auto_5450 ?auto_5463 ) ) ( not ( = ?auto_5442 ?auto_5444 ) ) ( not ( = ?auto_5442 ?auto_5462 ) ) ( not ( = ?auto_5444 ?auto_5457 ) ) ( not ( = ?auto_5456 ?auto_5455 ) ) ( not ( = ?auto_5461 ?auto_5463 ) ) ( not ( = ?auto_5462 ?auto_5457 ) ) ( not ( = ?auto_5442 ?auto_5445 ) ) ( not ( = ?auto_5442 ?auto_5458 ) ) ( not ( = ?auto_5443 ?auto_5445 ) ) ( not ( = ?auto_5443 ?auto_5458 ) ) ( not ( = ?auto_5445 ?auto_5462 ) ) ( not ( = ?auto_5445 ?auto_5457 ) ) ( not ( = ?auto_5465 ?auto_5456 ) ) ( not ( = ?auto_5465 ?auto_5455 ) ) ( not ( = ?auto_5464 ?auto_5461 ) ) ( not ( = ?auto_5464 ?auto_5463 ) ) ( not ( = ?auto_5458 ?auto_5462 ) ) ( not ( = ?auto_5458 ?auto_5457 ) ) ( not ( = ?auto_5442 ?auto_5446 ) ) ( not ( = ?auto_5442 ?auto_5460 ) ) ( not ( = ?auto_5443 ?auto_5446 ) ) ( not ( = ?auto_5443 ?auto_5460 ) ) ( not ( = ?auto_5444 ?auto_5446 ) ) ( not ( = ?auto_5444 ?auto_5460 ) ) ( not ( = ?auto_5446 ?auto_5458 ) ) ( not ( = ?auto_5446 ?auto_5462 ) ) ( not ( = ?auto_5446 ?auto_5457 ) ) ( not ( = ?auto_5459 ?auto_5465 ) ) ( not ( = ?auto_5459 ?auto_5456 ) ) ( not ( = ?auto_5459 ?auto_5455 ) ) ( not ( = ?auto_5454 ?auto_5464 ) ) ( not ( = ?auto_5454 ?auto_5461 ) ) ( not ( = ?auto_5454 ?auto_5463 ) ) ( not ( = ?auto_5460 ?auto_5458 ) ) ( not ( = ?auto_5460 ?auto_5462 ) ) ( not ( = ?auto_5460 ?auto_5457 ) ) ( not ( = ?auto_5442 ?auto_5447 ) ) ( not ( = ?auto_5442 ?auto_5449 ) ) ( not ( = ?auto_5443 ?auto_5447 ) ) ( not ( = ?auto_5443 ?auto_5449 ) ) ( not ( = ?auto_5444 ?auto_5447 ) ) ( not ( = ?auto_5444 ?auto_5449 ) ) ( not ( = ?auto_5445 ?auto_5447 ) ) ( not ( = ?auto_5445 ?auto_5449 ) ) ( not ( = ?auto_5447 ?auto_5460 ) ) ( not ( = ?auto_5447 ?auto_5458 ) ) ( not ( = ?auto_5447 ?auto_5462 ) ) ( not ( = ?auto_5447 ?auto_5457 ) ) ( not ( = ?auto_5452 ?auto_5459 ) ) ( not ( = ?auto_5452 ?auto_5465 ) ) ( not ( = ?auto_5452 ?auto_5456 ) ) ( not ( = ?auto_5452 ?auto_5455 ) ) ( not ( = ?auto_5451 ?auto_5454 ) ) ( not ( = ?auto_5451 ?auto_5464 ) ) ( not ( = ?auto_5451 ?auto_5461 ) ) ( not ( = ?auto_5451 ?auto_5463 ) ) ( not ( = ?auto_5449 ?auto_5460 ) ) ( not ( = ?auto_5449 ?auto_5458 ) ) ( not ( = ?auto_5449 ?auto_5462 ) ) ( not ( = ?auto_5449 ?auto_5457 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_5442 ?auto_5443 ?auto_5444 ?auto_5445 ?auto_5446 )
      ( MAKE-1CRATE ?auto_5446 ?auto_5447 )
      ( MAKE-5CRATE-VERIFY ?auto_5442 ?auto_5443 ?auto_5444 ?auto_5445 ?auto_5446 ?auto_5447 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5468 - SURFACE
      ?auto_5469 - SURFACE
    )
    :vars
    (
      ?auto_5470 - HOIST
      ?auto_5471 - PLACE
      ?auto_5473 - PLACE
      ?auto_5474 - HOIST
      ?auto_5475 - SURFACE
      ?auto_5472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5470 ?auto_5471 ) ( SURFACE-AT ?auto_5468 ?auto_5471 ) ( CLEAR ?auto_5468 ) ( IS-CRATE ?auto_5469 ) ( AVAILABLE ?auto_5470 ) ( not ( = ?auto_5473 ?auto_5471 ) ) ( HOIST-AT ?auto_5474 ?auto_5473 ) ( AVAILABLE ?auto_5474 ) ( SURFACE-AT ?auto_5469 ?auto_5473 ) ( ON ?auto_5469 ?auto_5475 ) ( CLEAR ?auto_5469 ) ( TRUCK-AT ?auto_5472 ?auto_5471 ) ( not ( = ?auto_5468 ?auto_5469 ) ) ( not ( = ?auto_5468 ?auto_5475 ) ) ( not ( = ?auto_5469 ?auto_5475 ) ) ( not ( = ?auto_5470 ?auto_5474 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5472 ?auto_5471 ?auto_5473 )
      ( !LIFT ?auto_5474 ?auto_5469 ?auto_5475 ?auto_5473 )
      ( !LOAD ?auto_5474 ?auto_5469 ?auto_5472 ?auto_5473 )
      ( !DRIVE ?auto_5472 ?auto_5473 ?auto_5471 )
      ( !UNLOAD ?auto_5470 ?auto_5469 ?auto_5472 ?auto_5471 )
      ( !DROP ?auto_5470 ?auto_5469 ?auto_5468 ?auto_5471 )
      ( MAKE-1CRATE-VERIFY ?auto_5468 ?auto_5469 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_5483 - SURFACE
      ?auto_5484 - SURFACE
      ?auto_5485 - SURFACE
      ?auto_5486 - SURFACE
      ?auto_5487 - SURFACE
      ?auto_5488 - SURFACE
      ?auto_5489 - SURFACE
    )
    :vars
    (
      ?auto_5494 - HOIST
      ?auto_5495 - PLACE
      ?auto_5493 - PLACE
      ?auto_5492 - HOIST
      ?auto_5490 - SURFACE
      ?auto_5496 - SURFACE
      ?auto_5506 - PLACE
      ?auto_5497 - HOIST
      ?auto_5499 - SURFACE
      ?auto_5502 - PLACE
      ?auto_5498 - HOIST
      ?auto_5507 - SURFACE
      ?auto_5500 - PLACE
      ?auto_5508 - HOIST
      ?auto_5501 - SURFACE
      ?auto_5504 - PLACE
      ?auto_5505 - HOIST
      ?auto_5503 - SURFACE
      ?auto_5491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5494 ?auto_5495 ) ( IS-CRATE ?auto_5489 ) ( not ( = ?auto_5493 ?auto_5495 ) ) ( HOIST-AT ?auto_5492 ?auto_5493 ) ( SURFACE-AT ?auto_5489 ?auto_5493 ) ( ON ?auto_5489 ?auto_5490 ) ( CLEAR ?auto_5489 ) ( not ( = ?auto_5488 ?auto_5489 ) ) ( not ( = ?auto_5488 ?auto_5490 ) ) ( not ( = ?auto_5489 ?auto_5490 ) ) ( not ( = ?auto_5494 ?auto_5492 ) ) ( IS-CRATE ?auto_5488 ) ( AVAILABLE ?auto_5492 ) ( SURFACE-AT ?auto_5488 ?auto_5493 ) ( ON ?auto_5488 ?auto_5496 ) ( CLEAR ?auto_5488 ) ( not ( = ?auto_5487 ?auto_5488 ) ) ( not ( = ?auto_5487 ?auto_5496 ) ) ( not ( = ?auto_5488 ?auto_5496 ) ) ( IS-CRATE ?auto_5487 ) ( not ( = ?auto_5506 ?auto_5495 ) ) ( HOIST-AT ?auto_5497 ?auto_5506 ) ( AVAILABLE ?auto_5497 ) ( SURFACE-AT ?auto_5487 ?auto_5506 ) ( ON ?auto_5487 ?auto_5499 ) ( CLEAR ?auto_5487 ) ( not ( = ?auto_5486 ?auto_5487 ) ) ( not ( = ?auto_5486 ?auto_5499 ) ) ( not ( = ?auto_5487 ?auto_5499 ) ) ( not ( = ?auto_5494 ?auto_5497 ) ) ( IS-CRATE ?auto_5486 ) ( not ( = ?auto_5502 ?auto_5495 ) ) ( HOIST-AT ?auto_5498 ?auto_5502 ) ( AVAILABLE ?auto_5498 ) ( SURFACE-AT ?auto_5486 ?auto_5502 ) ( ON ?auto_5486 ?auto_5507 ) ( CLEAR ?auto_5486 ) ( not ( = ?auto_5485 ?auto_5486 ) ) ( not ( = ?auto_5485 ?auto_5507 ) ) ( not ( = ?auto_5486 ?auto_5507 ) ) ( not ( = ?auto_5494 ?auto_5498 ) ) ( IS-CRATE ?auto_5485 ) ( not ( = ?auto_5500 ?auto_5495 ) ) ( HOIST-AT ?auto_5508 ?auto_5500 ) ( AVAILABLE ?auto_5508 ) ( SURFACE-AT ?auto_5485 ?auto_5500 ) ( ON ?auto_5485 ?auto_5501 ) ( CLEAR ?auto_5485 ) ( not ( = ?auto_5484 ?auto_5485 ) ) ( not ( = ?auto_5484 ?auto_5501 ) ) ( not ( = ?auto_5485 ?auto_5501 ) ) ( not ( = ?auto_5494 ?auto_5508 ) ) ( SURFACE-AT ?auto_5483 ?auto_5495 ) ( CLEAR ?auto_5483 ) ( IS-CRATE ?auto_5484 ) ( AVAILABLE ?auto_5494 ) ( not ( = ?auto_5504 ?auto_5495 ) ) ( HOIST-AT ?auto_5505 ?auto_5504 ) ( AVAILABLE ?auto_5505 ) ( SURFACE-AT ?auto_5484 ?auto_5504 ) ( ON ?auto_5484 ?auto_5503 ) ( CLEAR ?auto_5484 ) ( TRUCK-AT ?auto_5491 ?auto_5495 ) ( not ( = ?auto_5483 ?auto_5484 ) ) ( not ( = ?auto_5483 ?auto_5503 ) ) ( not ( = ?auto_5484 ?auto_5503 ) ) ( not ( = ?auto_5494 ?auto_5505 ) ) ( not ( = ?auto_5483 ?auto_5485 ) ) ( not ( = ?auto_5483 ?auto_5501 ) ) ( not ( = ?auto_5485 ?auto_5503 ) ) ( not ( = ?auto_5500 ?auto_5504 ) ) ( not ( = ?auto_5508 ?auto_5505 ) ) ( not ( = ?auto_5501 ?auto_5503 ) ) ( not ( = ?auto_5483 ?auto_5486 ) ) ( not ( = ?auto_5483 ?auto_5507 ) ) ( not ( = ?auto_5484 ?auto_5486 ) ) ( not ( = ?auto_5484 ?auto_5507 ) ) ( not ( = ?auto_5486 ?auto_5501 ) ) ( not ( = ?auto_5486 ?auto_5503 ) ) ( not ( = ?auto_5502 ?auto_5500 ) ) ( not ( = ?auto_5502 ?auto_5504 ) ) ( not ( = ?auto_5498 ?auto_5508 ) ) ( not ( = ?auto_5498 ?auto_5505 ) ) ( not ( = ?auto_5507 ?auto_5501 ) ) ( not ( = ?auto_5507 ?auto_5503 ) ) ( not ( = ?auto_5483 ?auto_5487 ) ) ( not ( = ?auto_5483 ?auto_5499 ) ) ( not ( = ?auto_5484 ?auto_5487 ) ) ( not ( = ?auto_5484 ?auto_5499 ) ) ( not ( = ?auto_5485 ?auto_5487 ) ) ( not ( = ?auto_5485 ?auto_5499 ) ) ( not ( = ?auto_5487 ?auto_5507 ) ) ( not ( = ?auto_5487 ?auto_5501 ) ) ( not ( = ?auto_5487 ?auto_5503 ) ) ( not ( = ?auto_5506 ?auto_5502 ) ) ( not ( = ?auto_5506 ?auto_5500 ) ) ( not ( = ?auto_5506 ?auto_5504 ) ) ( not ( = ?auto_5497 ?auto_5498 ) ) ( not ( = ?auto_5497 ?auto_5508 ) ) ( not ( = ?auto_5497 ?auto_5505 ) ) ( not ( = ?auto_5499 ?auto_5507 ) ) ( not ( = ?auto_5499 ?auto_5501 ) ) ( not ( = ?auto_5499 ?auto_5503 ) ) ( not ( = ?auto_5483 ?auto_5488 ) ) ( not ( = ?auto_5483 ?auto_5496 ) ) ( not ( = ?auto_5484 ?auto_5488 ) ) ( not ( = ?auto_5484 ?auto_5496 ) ) ( not ( = ?auto_5485 ?auto_5488 ) ) ( not ( = ?auto_5485 ?auto_5496 ) ) ( not ( = ?auto_5486 ?auto_5488 ) ) ( not ( = ?auto_5486 ?auto_5496 ) ) ( not ( = ?auto_5488 ?auto_5499 ) ) ( not ( = ?auto_5488 ?auto_5507 ) ) ( not ( = ?auto_5488 ?auto_5501 ) ) ( not ( = ?auto_5488 ?auto_5503 ) ) ( not ( = ?auto_5493 ?auto_5506 ) ) ( not ( = ?auto_5493 ?auto_5502 ) ) ( not ( = ?auto_5493 ?auto_5500 ) ) ( not ( = ?auto_5493 ?auto_5504 ) ) ( not ( = ?auto_5492 ?auto_5497 ) ) ( not ( = ?auto_5492 ?auto_5498 ) ) ( not ( = ?auto_5492 ?auto_5508 ) ) ( not ( = ?auto_5492 ?auto_5505 ) ) ( not ( = ?auto_5496 ?auto_5499 ) ) ( not ( = ?auto_5496 ?auto_5507 ) ) ( not ( = ?auto_5496 ?auto_5501 ) ) ( not ( = ?auto_5496 ?auto_5503 ) ) ( not ( = ?auto_5483 ?auto_5489 ) ) ( not ( = ?auto_5483 ?auto_5490 ) ) ( not ( = ?auto_5484 ?auto_5489 ) ) ( not ( = ?auto_5484 ?auto_5490 ) ) ( not ( = ?auto_5485 ?auto_5489 ) ) ( not ( = ?auto_5485 ?auto_5490 ) ) ( not ( = ?auto_5486 ?auto_5489 ) ) ( not ( = ?auto_5486 ?auto_5490 ) ) ( not ( = ?auto_5487 ?auto_5489 ) ) ( not ( = ?auto_5487 ?auto_5490 ) ) ( not ( = ?auto_5489 ?auto_5496 ) ) ( not ( = ?auto_5489 ?auto_5499 ) ) ( not ( = ?auto_5489 ?auto_5507 ) ) ( not ( = ?auto_5489 ?auto_5501 ) ) ( not ( = ?auto_5489 ?auto_5503 ) ) ( not ( = ?auto_5490 ?auto_5496 ) ) ( not ( = ?auto_5490 ?auto_5499 ) ) ( not ( = ?auto_5490 ?auto_5507 ) ) ( not ( = ?auto_5490 ?auto_5501 ) ) ( not ( = ?auto_5490 ?auto_5503 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_5483 ?auto_5484 ?auto_5485 ?auto_5486 ?auto_5487 ?auto_5488 )
      ( MAKE-1CRATE ?auto_5488 ?auto_5489 )
      ( MAKE-6CRATE-VERIFY ?auto_5483 ?auto_5484 ?auto_5485 ?auto_5486 ?auto_5487 ?auto_5488 ?auto_5489 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5511 - SURFACE
      ?auto_5512 - SURFACE
    )
    :vars
    (
      ?auto_5513 - HOIST
      ?auto_5514 - PLACE
      ?auto_5516 - PLACE
      ?auto_5517 - HOIST
      ?auto_5518 - SURFACE
      ?auto_5515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5513 ?auto_5514 ) ( SURFACE-AT ?auto_5511 ?auto_5514 ) ( CLEAR ?auto_5511 ) ( IS-CRATE ?auto_5512 ) ( AVAILABLE ?auto_5513 ) ( not ( = ?auto_5516 ?auto_5514 ) ) ( HOIST-AT ?auto_5517 ?auto_5516 ) ( AVAILABLE ?auto_5517 ) ( SURFACE-AT ?auto_5512 ?auto_5516 ) ( ON ?auto_5512 ?auto_5518 ) ( CLEAR ?auto_5512 ) ( TRUCK-AT ?auto_5515 ?auto_5514 ) ( not ( = ?auto_5511 ?auto_5512 ) ) ( not ( = ?auto_5511 ?auto_5518 ) ) ( not ( = ?auto_5512 ?auto_5518 ) ) ( not ( = ?auto_5513 ?auto_5517 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5515 ?auto_5514 ?auto_5516 )
      ( !LIFT ?auto_5517 ?auto_5512 ?auto_5518 ?auto_5516 )
      ( !LOAD ?auto_5517 ?auto_5512 ?auto_5515 ?auto_5516 )
      ( !DRIVE ?auto_5515 ?auto_5516 ?auto_5514 )
      ( !UNLOAD ?auto_5513 ?auto_5512 ?auto_5515 ?auto_5514 )
      ( !DROP ?auto_5513 ?auto_5512 ?auto_5511 ?auto_5514 )
      ( MAKE-1CRATE-VERIFY ?auto_5511 ?auto_5512 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_5527 - SURFACE
      ?auto_5528 - SURFACE
      ?auto_5529 - SURFACE
      ?auto_5530 - SURFACE
      ?auto_5531 - SURFACE
      ?auto_5532 - SURFACE
      ?auto_5534 - SURFACE
      ?auto_5533 - SURFACE
    )
    :vars
    (
      ?auto_5537 - HOIST
      ?auto_5536 - PLACE
      ?auto_5539 - PLACE
      ?auto_5540 - HOIST
      ?auto_5538 - SURFACE
      ?auto_5542 - PLACE
      ?auto_5547 - HOIST
      ?auto_5548 - SURFACE
      ?auto_5545 - SURFACE
      ?auto_5551 - PLACE
      ?auto_5543 - HOIST
      ?auto_5544 - SURFACE
      ?auto_5550 - PLACE
      ?auto_5546 - HOIST
      ?auto_5553 - SURFACE
      ?auto_5555 - PLACE
      ?auto_5556 - HOIST
      ?auto_5554 - SURFACE
      ?auto_5552 - PLACE
      ?auto_5549 - HOIST
      ?auto_5541 - SURFACE
      ?auto_5535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5537 ?auto_5536 ) ( IS-CRATE ?auto_5533 ) ( not ( = ?auto_5539 ?auto_5536 ) ) ( HOIST-AT ?auto_5540 ?auto_5539 ) ( AVAILABLE ?auto_5540 ) ( SURFACE-AT ?auto_5533 ?auto_5539 ) ( ON ?auto_5533 ?auto_5538 ) ( CLEAR ?auto_5533 ) ( not ( = ?auto_5534 ?auto_5533 ) ) ( not ( = ?auto_5534 ?auto_5538 ) ) ( not ( = ?auto_5533 ?auto_5538 ) ) ( not ( = ?auto_5537 ?auto_5540 ) ) ( IS-CRATE ?auto_5534 ) ( not ( = ?auto_5542 ?auto_5536 ) ) ( HOIST-AT ?auto_5547 ?auto_5542 ) ( SURFACE-AT ?auto_5534 ?auto_5542 ) ( ON ?auto_5534 ?auto_5548 ) ( CLEAR ?auto_5534 ) ( not ( = ?auto_5532 ?auto_5534 ) ) ( not ( = ?auto_5532 ?auto_5548 ) ) ( not ( = ?auto_5534 ?auto_5548 ) ) ( not ( = ?auto_5537 ?auto_5547 ) ) ( IS-CRATE ?auto_5532 ) ( AVAILABLE ?auto_5547 ) ( SURFACE-AT ?auto_5532 ?auto_5542 ) ( ON ?auto_5532 ?auto_5545 ) ( CLEAR ?auto_5532 ) ( not ( = ?auto_5531 ?auto_5532 ) ) ( not ( = ?auto_5531 ?auto_5545 ) ) ( not ( = ?auto_5532 ?auto_5545 ) ) ( IS-CRATE ?auto_5531 ) ( not ( = ?auto_5551 ?auto_5536 ) ) ( HOIST-AT ?auto_5543 ?auto_5551 ) ( AVAILABLE ?auto_5543 ) ( SURFACE-AT ?auto_5531 ?auto_5551 ) ( ON ?auto_5531 ?auto_5544 ) ( CLEAR ?auto_5531 ) ( not ( = ?auto_5530 ?auto_5531 ) ) ( not ( = ?auto_5530 ?auto_5544 ) ) ( not ( = ?auto_5531 ?auto_5544 ) ) ( not ( = ?auto_5537 ?auto_5543 ) ) ( IS-CRATE ?auto_5530 ) ( not ( = ?auto_5550 ?auto_5536 ) ) ( HOIST-AT ?auto_5546 ?auto_5550 ) ( AVAILABLE ?auto_5546 ) ( SURFACE-AT ?auto_5530 ?auto_5550 ) ( ON ?auto_5530 ?auto_5553 ) ( CLEAR ?auto_5530 ) ( not ( = ?auto_5529 ?auto_5530 ) ) ( not ( = ?auto_5529 ?auto_5553 ) ) ( not ( = ?auto_5530 ?auto_5553 ) ) ( not ( = ?auto_5537 ?auto_5546 ) ) ( IS-CRATE ?auto_5529 ) ( not ( = ?auto_5555 ?auto_5536 ) ) ( HOIST-AT ?auto_5556 ?auto_5555 ) ( AVAILABLE ?auto_5556 ) ( SURFACE-AT ?auto_5529 ?auto_5555 ) ( ON ?auto_5529 ?auto_5554 ) ( CLEAR ?auto_5529 ) ( not ( = ?auto_5528 ?auto_5529 ) ) ( not ( = ?auto_5528 ?auto_5554 ) ) ( not ( = ?auto_5529 ?auto_5554 ) ) ( not ( = ?auto_5537 ?auto_5556 ) ) ( SURFACE-AT ?auto_5527 ?auto_5536 ) ( CLEAR ?auto_5527 ) ( IS-CRATE ?auto_5528 ) ( AVAILABLE ?auto_5537 ) ( not ( = ?auto_5552 ?auto_5536 ) ) ( HOIST-AT ?auto_5549 ?auto_5552 ) ( AVAILABLE ?auto_5549 ) ( SURFACE-AT ?auto_5528 ?auto_5552 ) ( ON ?auto_5528 ?auto_5541 ) ( CLEAR ?auto_5528 ) ( TRUCK-AT ?auto_5535 ?auto_5536 ) ( not ( = ?auto_5527 ?auto_5528 ) ) ( not ( = ?auto_5527 ?auto_5541 ) ) ( not ( = ?auto_5528 ?auto_5541 ) ) ( not ( = ?auto_5537 ?auto_5549 ) ) ( not ( = ?auto_5527 ?auto_5529 ) ) ( not ( = ?auto_5527 ?auto_5554 ) ) ( not ( = ?auto_5529 ?auto_5541 ) ) ( not ( = ?auto_5555 ?auto_5552 ) ) ( not ( = ?auto_5556 ?auto_5549 ) ) ( not ( = ?auto_5554 ?auto_5541 ) ) ( not ( = ?auto_5527 ?auto_5530 ) ) ( not ( = ?auto_5527 ?auto_5553 ) ) ( not ( = ?auto_5528 ?auto_5530 ) ) ( not ( = ?auto_5528 ?auto_5553 ) ) ( not ( = ?auto_5530 ?auto_5554 ) ) ( not ( = ?auto_5530 ?auto_5541 ) ) ( not ( = ?auto_5550 ?auto_5555 ) ) ( not ( = ?auto_5550 ?auto_5552 ) ) ( not ( = ?auto_5546 ?auto_5556 ) ) ( not ( = ?auto_5546 ?auto_5549 ) ) ( not ( = ?auto_5553 ?auto_5554 ) ) ( not ( = ?auto_5553 ?auto_5541 ) ) ( not ( = ?auto_5527 ?auto_5531 ) ) ( not ( = ?auto_5527 ?auto_5544 ) ) ( not ( = ?auto_5528 ?auto_5531 ) ) ( not ( = ?auto_5528 ?auto_5544 ) ) ( not ( = ?auto_5529 ?auto_5531 ) ) ( not ( = ?auto_5529 ?auto_5544 ) ) ( not ( = ?auto_5531 ?auto_5553 ) ) ( not ( = ?auto_5531 ?auto_5554 ) ) ( not ( = ?auto_5531 ?auto_5541 ) ) ( not ( = ?auto_5551 ?auto_5550 ) ) ( not ( = ?auto_5551 ?auto_5555 ) ) ( not ( = ?auto_5551 ?auto_5552 ) ) ( not ( = ?auto_5543 ?auto_5546 ) ) ( not ( = ?auto_5543 ?auto_5556 ) ) ( not ( = ?auto_5543 ?auto_5549 ) ) ( not ( = ?auto_5544 ?auto_5553 ) ) ( not ( = ?auto_5544 ?auto_5554 ) ) ( not ( = ?auto_5544 ?auto_5541 ) ) ( not ( = ?auto_5527 ?auto_5532 ) ) ( not ( = ?auto_5527 ?auto_5545 ) ) ( not ( = ?auto_5528 ?auto_5532 ) ) ( not ( = ?auto_5528 ?auto_5545 ) ) ( not ( = ?auto_5529 ?auto_5532 ) ) ( not ( = ?auto_5529 ?auto_5545 ) ) ( not ( = ?auto_5530 ?auto_5532 ) ) ( not ( = ?auto_5530 ?auto_5545 ) ) ( not ( = ?auto_5532 ?auto_5544 ) ) ( not ( = ?auto_5532 ?auto_5553 ) ) ( not ( = ?auto_5532 ?auto_5554 ) ) ( not ( = ?auto_5532 ?auto_5541 ) ) ( not ( = ?auto_5542 ?auto_5551 ) ) ( not ( = ?auto_5542 ?auto_5550 ) ) ( not ( = ?auto_5542 ?auto_5555 ) ) ( not ( = ?auto_5542 ?auto_5552 ) ) ( not ( = ?auto_5547 ?auto_5543 ) ) ( not ( = ?auto_5547 ?auto_5546 ) ) ( not ( = ?auto_5547 ?auto_5556 ) ) ( not ( = ?auto_5547 ?auto_5549 ) ) ( not ( = ?auto_5545 ?auto_5544 ) ) ( not ( = ?auto_5545 ?auto_5553 ) ) ( not ( = ?auto_5545 ?auto_5554 ) ) ( not ( = ?auto_5545 ?auto_5541 ) ) ( not ( = ?auto_5527 ?auto_5534 ) ) ( not ( = ?auto_5527 ?auto_5548 ) ) ( not ( = ?auto_5528 ?auto_5534 ) ) ( not ( = ?auto_5528 ?auto_5548 ) ) ( not ( = ?auto_5529 ?auto_5534 ) ) ( not ( = ?auto_5529 ?auto_5548 ) ) ( not ( = ?auto_5530 ?auto_5534 ) ) ( not ( = ?auto_5530 ?auto_5548 ) ) ( not ( = ?auto_5531 ?auto_5534 ) ) ( not ( = ?auto_5531 ?auto_5548 ) ) ( not ( = ?auto_5534 ?auto_5545 ) ) ( not ( = ?auto_5534 ?auto_5544 ) ) ( not ( = ?auto_5534 ?auto_5553 ) ) ( not ( = ?auto_5534 ?auto_5554 ) ) ( not ( = ?auto_5534 ?auto_5541 ) ) ( not ( = ?auto_5548 ?auto_5545 ) ) ( not ( = ?auto_5548 ?auto_5544 ) ) ( not ( = ?auto_5548 ?auto_5553 ) ) ( not ( = ?auto_5548 ?auto_5554 ) ) ( not ( = ?auto_5548 ?auto_5541 ) ) ( not ( = ?auto_5527 ?auto_5533 ) ) ( not ( = ?auto_5527 ?auto_5538 ) ) ( not ( = ?auto_5528 ?auto_5533 ) ) ( not ( = ?auto_5528 ?auto_5538 ) ) ( not ( = ?auto_5529 ?auto_5533 ) ) ( not ( = ?auto_5529 ?auto_5538 ) ) ( not ( = ?auto_5530 ?auto_5533 ) ) ( not ( = ?auto_5530 ?auto_5538 ) ) ( not ( = ?auto_5531 ?auto_5533 ) ) ( not ( = ?auto_5531 ?auto_5538 ) ) ( not ( = ?auto_5532 ?auto_5533 ) ) ( not ( = ?auto_5532 ?auto_5538 ) ) ( not ( = ?auto_5533 ?auto_5548 ) ) ( not ( = ?auto_5533 ?auto_5545 ) ) ( not ( = ?auto_5533 ?auto_5544 ) ) ( not ( = ?auto_5533 ?auto_5553 ) ) ( not ( = ?auto_5533 ?auto_5554 ) ) ( not ( = ?auto_5533 ?auto_5541 ) ) ( not ( = ?auto_5539 ?auto_5542 ) ) ( not ( = ?auto_5539 ?auto_5551 ) ) ( not ( = ?auto_5539 ?auto_5550 ) ) ( not ( = ?auto_5539 ?auto_5555 ) ) ( not ( = ?auto_5539 ?auto_5552 ) ) ( not ( = ?auto_5540 ?auto_5547 ) ) ( not ( = ?auto_5540 ?auto_5543 ) ) ( not ( = ?auto_5540 ?auto_5546 ) ) ( not ( = ?auto_5540 ?auto_5556 ) ) ( not ( = ?auto_5540 ?auto_5549 ) ) ( not ( = ?auto_5538 ?auto_5548 ) ) ( not ( = ?auto_5538 ?auto_5545 ) ) ( not ( = ?auto_5538 ?auto_5544 ) ) ( not ( = ?auto_5538 ?auto_5553 ) ) ( not ( = ?auto_5538 ?auto_5554 ) ) ( not ( = ?auto_5538 ?auto_5541 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_5527 ?auto_5528 ?auto_5529 ?auto_5530 ?auto_5531 ?auto_5532 ?auto_5534 )
      ( MAKE-1CRATE ?auto_5534 ?auto_5533 )
      ( MAKE-7CRATE-VERIFY ?auto_5527 ?auto_5528 ?auto_5529 ?auto_5530 ?auto_5531 ?auto_5532 ?auto_5534 ?auto_5533 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5559 - SURFACE
      ?auto_5560 - SURFACE
    )
    :vars
    (
      ?auto_5561 - HOIST
      ?auto_5562 - PLACE
      ?auto_5564 - PLACE
      ?auto_5565 - HOIST
      ?auto_5566 - SURFACE
      ?auto_5563 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5561 ?auto_5562 ) ( SURFACE-AT ?auto_5559 ?auto_5562 ) ( CLEAR ?auto_5559 ) ( IS-CRATE ?auto_5560 ) ( AVAILABLE ?auto_5561 ) ( not ( = ?auto_5564 ?auto_5562 ) ) ( HOIST-AT ?auto_5565 ?auto_5564 ) ( AVAILABLE ?auto_5565 ) ( SURFACE-AT ?auto_5560 ?auto_5564 ) ( ON ?auto_5560 ?auto_5566 ) ( CLEAR ?auto_5560 ) ( TRUCK-AT ?auto_5563 ?auto_5562 ) ( not ( = ?auto_5559 ?auto_5560 ) ) ( not ( = ?auto_5559 ?auto_5566 ) ) ( not ( = ?auto_5560 ?auto_5566 ) ) ( not ( = ?auto_5561 ?auto_5565 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5563 ?auto_5562 ?auto_5564 )
      ( !LIFT ?auto_5565 ?auto_5560 ?auto_5566 ?auto_5564 )
      ( !LOAD ?auto_5565 ?auto_5560 ?auto_5563 ?auto_5564 )
      ( !DRIVE ?auto_5563 ?auto_5564 ?auto_5562 )
      ( !UNLOAD ?auto_5561 ?auto_5560 ?auto_5563 ?auto_5562 )
      ( !DROP ?auto_5561 ?auto_5560 ?auto_5559 ?auto_5562 )
      ( MAKE-1CRATE-VERIFY ?auto_5559 ?auto_5560 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_5576 - SURFACE
      ?auto_5577 - SURFACE
      ?auto_5578 - SURFACE
      ?auto_5579 - SURFACE
      ?auto_5580 - SURFACE
      ?auto_5581 - SURFACE
      ?auto_5584 - SURFACE
      ?auto_5583 - SURFACE
      ?auto_5582 - SURFACE
    )
    :vars
    (
      ?auto_5586 - HOIST
      ?auto_5589 - PLACE
      ?auto_5585 - PLACE
      ?auto_5588 - HOIST
      ?auto_5587 - SURFACE
      ?auto_5592 - PLACE
      ?auto_5600 - HOIST
      ?auto_5591 - SURFACE
      ?auto_5605 - SURFACE
      ?auto_5607 - SURFACE
      ?auto_5598 - PLACE
      ?auto_5593 - HOIST
      ?auto_5601 - SURFACE
      ?auto_5599 - PLACE
      ?auto_5606 - HOIST
      ?auto_5603 - SURFACE
      ?auto_5594 - PLACE
      ?auto_5596 - HOIST
      ?auto_5604 - SURFACE
      ?auto_5602 - PLACE
      ?auto_5597 - HOIST
      ?auto_5595 - SURFACE
      ?auto_5590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5586 ?auto_5589 ) ( IS-CRATE ?auto_5582 ) ( not ( = ?auto_5585 ?auto_5589 ) ) ( HOIST-AT ?auto_5588 ?auto_5585 ) ( SURFACE-AT ?auto_5582 ?auto_5585 ) ( ON ?auto_5582 ?auto_5587 ) ( CLEAR ?auto_5582 ) ( not ( = ?auto_5583 ?auto_5582 ) ) ( not ( = ?auto_5583 ?auto_5587 ) ) ( not ( = ?auto_5582 ?auto_5587 ) ) ( not ( = ?auto_5586 ?auto_5588 ) ) ( IS-CRATE ?auto_5583 ) ( not ( = ?auto_5592 ?auto_5589 ) ) ( HOIST-AT ?auto_5600 ?auto_5592 ) ( AVAILABLE ?auto_5600 ) ( SURFACE-AT ?auto_5583 ?auto_5592 ) ( ON ?auto_5583 ?auto_5591 ) ( CLEAR ?auto_5583 ) ( not ( = ?auto_5584 ?auto_5583 ) ) ( not ( = ?auto_5584 ?auto_5591 ) ) ( not ( = ?auto_5583 ?auto_5591 ) ) ( not ( = ?auto_5586 ?auto_5600 ) ) ( IS-CRATE ?auto_5584 ) ( SURFACE-AT ?auto_5584 ?auto_5585 ) ( ON ?auto_5584 ?auto_5605 ) ( CLEAR ?auto_5584 ) ( not ( = ?auto_5581 ?auto_5584 ) ) ( not ( = ?auto_5581 ?auto_5605 ) ) ( not ( = ?auto_5584 ?auto_5605 ) ) ( IS-CRATE ?auto_5581 ) ( AVAILABLE ?auto_5588 ) ( SURFACE-AT ?auto_5581 ?auto_5585 ) ( ON ?auto_5581 ?auto_5607 ) ( CLEAR ?auto_5581 ) ( not ( = ?auto_5580 ?auto_5581 ) ) ( not ( = ?auto_5580 ?auto_5607 ) ) ( not ( = ?auto_5581 ?auto_5607 ) ) ( IS-CRATE ?auto_5580 ) ( not ( = ?auto_5598 ?auto_5589 ) ) ( HOIST-AT ?auto_5593 ?auto_5598 ) ( AVAILABLE ?auto_5593 ) ( SURFACE-AT ?auto_5580 ?auto_5598 ) ( ON ?auto_5580 ?auto_5601 ) ( CLEAR ?auto_5580 ) ( not ( = ?auto_5579 ?auto_5580 ) ) ( not ( = ?auto_5579 ?auto_5601 ) ) ( not ( = ?auto_5580 ?auto_5601 ) ) ( not ( = ?auto_5586 ?auto_5593 ) ) ( IS-CRATE ?auto_5579 ) ( not ( = ?auto_5599 ?auto_5589 ) ) ( HOIST-AT ?auto_5606 ?auto_5599 ) ( AVAILABLE ?auto_5606 ) ( SURFACE-AT ?auto_5579 ?auto_5599 ) ( ON ?auto_5579 ?auto_5603 ) ( CLEAR ?auto_5579 ) ( not ( = ?auto_5578 ?auto_5579 ) ) ( not ( = ?auto_5578 ?auto_5603 ) ) ( not ( = ?auto_5579 ?auto_5603 ) ) ( not ( = ?auto_5586 ?auto_5606 ) ) ( IS-CRATE ?auto_5578 ) ( not ( = ?auto_5594 ?auto_5589 ) ) ( HOIST-AT ?auto_5596 ?auto_5594 ) ( AVAILABLE ?auto_5596 ) ( SURFACE-AT ?auto_5578 ?auto_5594 ) ( ON ?auto_5578 ?auto_5604 ) ( CLEAR ?auto_5578 ) ( not ( = ?auto_5577 ?auto_5578 ) ) ( not ( = ?auto_5577 ?auto_5604 ) ) ( not ( = ?auto_5578 ?auto_5604 ) ) ( not ( = ?auto_5586 ?auto_5596 ) ) ( SURFACE-AT ?auto_5576 ?auto_5589 ) ( CLEAR ?auto_5576 ) ( IS-CRATE ?auto_5577 ) ( AVAILABLE ?auto_5586 ) ( not ( = ?auto_5602 ?auto_5589 ) ) ( HOIST-AT ?auto_5597 ?auto_5602 ) ( AVAILABLE ?auto_5597 ) ( SURFACE-AT ?auto_5577 ?auto_5602 ) ( ON ?auto_5577 ?auto_5595 ) ( CLEAR ?auto_5577 ) ( TRUCK-AT ?auto_5590 ?auto_5589 ) ( not ( = ?auto_5576 ?auto_5577 ) ) ( not ( = ?auto_5576 ?auto_5595 ) ) ( not ( = ?auto_5577 ?auto_5595 ) ) ( not ( = ?auto_5586 ?auto_5597 ) ) ( not ( = ?auto_5576 ?auto_5578 ) ) ( not ( = ?auto_5576 ?auto_5604 ) ) ( not ( = ?auto_5578 ?auto_5595 ) ) ( not ( = ?auto_5594 ?auto_5602 ) ) ( not ( = ?auto_5596 ?auto_5597 ) ) ( not ( = ?auto_5604 ?auto_5595 ) ) ( not ( = ?auto_5576 ?auto_5579 ) ) ( not ( = ?auto_5576 ?auto_5603 ) ) ( not ( = ?auto_5577 ?auto_5579 ) ) ( not ( = ?auto_5577 ?auto_5603 ) ) ( not ( = ?auto_5579 ?auto_5604 ) ) ( not ( = ?auto_5579 ?auto_5595 ) ) ( not ( = ?auto_5599 ?auto_5594 ) ) ( not ( = ?auto_5599 ?auto_5602 ) ) ( not ( = ?auto_5606 ?auto_5596 ) ) ( not ( = ?auto_5606 ?auto_5597 ) ) ( not ( = ?auto_5603 ?auto_5604 ) ) ( not ( = ?auto_5603 ?auto_5595 ) ) ( not ( = ?auto_5576 ?auto_5580 ) ) ( not ( = ?auto_5576 ?auto_5601 ) ) ( not ( = ?auto_5577 ?auto_5580 ) ) ( not ( = ?auto_5577 ?auto_5601 ) ) ( not ( = ?auto_5578 ?auto_5580 ) ) ( not ( = ?auto_5578 ?auto_5601 ) ) ( not ( = ?auto_5580 ?auto_5603 ) ) ( not ( = ?auto_5580 ?auto_5604 ) ) ( not ( = ?auto_5580 ?auto_5595 ) ) ( not ( = ?auto_5598 ?auto_5599 ) ) ( not ( = ?auto_5598 ?auto_5594 ) ) ( not ( = ?auto_5598 ?auto_5602 ) ) ( not ( = ?auto_5593 ?auto_5606 ) ) ( not ( = ?auto_5593 ?auto_5596 ) ) ( not ( = ?auto_5593 ?auto_5597 ) ) ( not ( = ?auto_5601 ?auto_5603 ) ) ( not ( = ?auto_5601 ?auto_5604 ) ) ( not ( = ?auto_5601 ?auto_5595 ) ) ( not ( = ?auto_5576 ?auto_5581 ) ) ( not ( = ?auto_5576 ?auto_5607 ) ) ( not ( = ?auto_5577 ?auto_5581 ) ) ( not ( = ?auto_5577 ?auto_5607 ) ) ( not ( = ?auto_5578 ?auto_5581 ) ) ( not ( = ?auto_5578 ?auto_5607 ) ) ( not ( = ?auto_5579 ?auto_5581 ) ) ( not ( = ?auto_5579 ?auto_5607 ) ) ( not ( = ?auto_5581 ?auto_5601 ) ) ( not ( = ?auto_5581 ?auto_5603 ) ) ( not ( = ?auto_5581 ?auto_5604 ) ) ( not ( = ?auto_5581 ?auto_5595 ) ) ( not ( = ?auto_5585 ?auto_5598 ) ) ( not ( = ?auto_5585 ?auto_5599 ) ) ( not ( = ?auto_5585 ?auto_5594 ) ) ( not ( = ?auto_5585 ?auto_5602 ) ) ( not ( = ?auto_5588 ?auto_5593 ) ) ( not ( = ?auto_5588 ?auto_5606 ) ) ( not ( = ?auto_5588 ?auto_5596 ) ) ( not ( = ?auto_5588 ?auto_5597 ) ) ( not ( = ?auto_5607 ?auto_5601 ) ) ( not ( = ?auto_5607 ?auto_5603 ) ) ( not ( = ?auto_5607 ?auto_5604 ) ) ( not ( = ?auto_5607 ?auto_5595 ) ) ( not ( = ?auto_5576 ?auto_5584 ) ) ( not ( = ?auto_5576 ?auto_5605 ) ) ( not ( = ?auto_5577 ?auto_5584 ) ) ( not ( = ?auto_5577 ?auto_5605 ) ) ( not ( = ?auto_5578 ?auto_5584 ) ) ( not ( = ?auto_5578 ?auto_5605 ) ) ( not ( = ?auto_5579 ?auto_5584 ) ) ( not ( = ?auto_5579 ?auto_5605 ) ) ( not ( = ?auto_5580 ?auto_5584 ) ) ( not ( = ?auto_5580 ?auto_5605 ) ) ( not ( = ?auto_5584 ?auto_5607 ) ) ( not ( = ?auto_5584 ?auto_5601 ) ) ( not ( = ?auto_5584 ?auto_5603 ) ) ( not ( = ?auto_5584 ?auto_5604 ) ) ( not ( = ?auto_5584 ?auto_5595 ) ) ( not ( = ?auto_5605 ?auto_5607 ) ) ( not ( = ?auto_5605 ?auto_5601 ) ) ( not ( = ?auto_5605 ?auto_5603 ) ) ( not ( = ?auto_5605 ?auto_5604 ) ) ( not ( = ?auto_5605 ?auto_5595 ) ) ( not ( = ?auto_5576 ?auto_5583 ) ) ( not ( = ?auto_5576 ?auto_5591 ) ) ( not ( = ?auto_5577 ?auto_5583 ) ) ( not ( = ?auto_5577 ?auto_5591 ) ) ( not ( = ?auto_5578 ?auto_5583 ) ) ( not ( = ?auto_5578 ?auto_5591 ) ) ( not ( = ?auto_5579 ?auto_5583 ) ) ( not ( = ?auto_5579 ?auto_5591 ) ) ( not ( = ?auto_5580 ?auto_5583 ) ) ( not ( = ?auto_5580 ?auto_5591 ) ) ( not ( = ?auto_5581 ?auto_5583 ) ) ( not ( = ?auto_5581 ?auto_5591 ) ) ( not ( = ?auto_5583 ?auto_5605 ) ) ( not ( = ?auto_5583 ?auto_5607 ) ) ( not ( = ?auto_5583 ?auto_5601 ) ) ( not ( = ?auto_5583 ?auto_5603 ) ) ( not ( = ?auto_5583 ?auto_5604 ) ) ( not ( = ?auto_5583 ?auto_5595 ) ) ( not ( = ?auto_5592 ?auto_5585 ) ) ( not ( = ?auto_5592 ?auto_5598 ) ) ( not ( = ?auto_5592 ?auto_5599 ) ) ( not ( = ?auto_5592 ?auto_5594 ) ) ( not ( = ?auto_5592 ?auto_5602 ) ) ( not ( = ?auto_5600 ?auto_5588 ) ) ( not ( = ?auto_5600 ?auto_5593 ) ) ( not ( = ?auto_5600 ?auto_5606 ) ) ( not ( = ?auto_5600 ?auto_5596 ) ) ( not ( = ?auto_5600 ?auto_5597 ) ) ( not ( = ?auto_5591 ?auto_5605 ) ) ( not ( = ?auto_5591 ?auto_5607 ) ) ( not ( = ?auto_5591 ?auto_5601 ) ) ( not ( = ?auto_5591 ?auto_5603 ) ) ( not ( = ?auto_5591 ?auto_5604 ) ) ( not ( = ?auto_5591 ?auto_5595 ) ) ( not ( = ?auto_5576 ?auto_5582 ) ) ( not ( = ?auto_5576 ?auto_5587 ) ) ( not ( = ?auto_5577 ?auto_5582 ) ) ( not ( = ?auto_5577 ?auto_5587 ) ) ( not ( = ?auto_5578 ?auto_5582 ) ) ( not ( = ?auto_5578 ?auto_5587 ) ) ( not ( = ?auto_5579 ?auto_5582 ) ) ( not ( = ?auto_5579 ?auto_5587 ) ) ( not ( = ?auto_5580 ?auto_5582 ) ) ( not ( = ?auto_5580 ?auto_5587 ) ) ( not ( = ?auto_5581 ?auto_5582 ) ) ( not ( = ?auto_5581 ?auto_5587 ) ) ( not ( = ?auto_5584 ?auto_5582 ) ) ( not ( = ?auto_5584 ?auto_5587 ) ) ( not ( = ?auto_5582 ?auto_5591 ) ) ( not ( = ?auto_5582 ?auto_5605 ) ) ( not ( = ?auto_5582 ?auto_5607 ) ) ( not ( = ?auto_5582 ?auto_5601 ) ) ( not ( = ?auto_5582 ?auto_5603 ) ) ( not ( = ?auto_5582 ?auto_5604 ) ) ( not ( = ?auto_5582 ?auto_5595 ) ) ( not ( = ?auto_5587 ?auto_5591 ) ) ( not ( = ?auto_5587 ?auto_5605 ) ) ( not ( = ?auto_5587 ?auto_5607 ) ) ( not ( = ?auto_5587 ?auto_5601 ) ) ( not ( = ?auto_5587 ?auto_5603 ) ) ( not ( = ?auto_5587 ?auto_5604 ) ) ( not ( = ?auto_5587 ?auto_5595 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_5576 ?auto_5577 ?auto_5578 ?auto_5579 ?auto_5580 ?auto_5581 ?auto_5584 ?auto_5583 )
      ( MAKE-1CRATE ?auto_5583 ?auto_5582 )
      ( MAKE-8CRATE-VERIFY ?auto_5576 ?auto_5577 ?auto_5578 ?auto_5579 ?auto_5580 ?auto_5581 ?auto_5584 ?auto_5583 ?auto_5582 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5610 - SURFACE
      ?auto_5611 - SURFACE
    )
    :vars
    (
      ?auto_5612 - HOIST
      ?auto_5613 - PLACE
      ?auto_5615 - PLACE
      ?auto_5616 - HOIST
      ?auto_5617 - SURFACE
      ?auto_5614 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5612 ?auto_5613 ) ( SURFACE-AT ?auto_5610 ?auto_5613 ) ( CLEAR ?auto_5610 ) ( IS-CRATE ?auto_5611 ) ( AVAILABLE ?auto_5612 ) ( not ( = ?auto_5615 ?auto_5613 ) ) ( HOIST-AT ?auto_5616 ?auto_5615 ) ( AVAILABLE ?auto_5616 ) ( SURFACE-AT ?auto_5611 ?auto_5615 ) ( ON ?auto_5611 ?auto_5617 ) ( CLEAR ?auto_5611 ) ( TRUCK-AT ?auto_5614 ?auto_5613 ) ( not ( = ?auto_5610 ?auto_5611 ) ) ( not ( = ?auto_5610 ?auto_5617 ) ) ( not ( = ?auto_5611 ?auto_5617 ) ) ( not ( = ?auto_5612 ?auto_5616 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5614 ?auto_5613 ?auto_5615 )
      ( !LIFT ?auto_5616 ?auto_5611 ?auto_5617 ?auto_5615 )
      ( !LOAD ?auto_5616 ?auto_5611 ?auto_5614 ?auto_5615 )
      ( !DRIVE ?auto_5614 ?auto_5615 ?auto_5613 )
      ( !UNLOAD ?auto_5612 ?auto_5611 ?auto_5614 ?auto_5613 )
      ( !DROP ?auto_5612 ?auto_5611 ?auto_5610 ?auto_5613 )
      ( MAKE-1CRATE-VERIFY ?auto_5610 ?auto_5611 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_5628 - SURFACE
      ?auto_5629 - SURFACE
      ?auto_5630 - SURFACE
      ?auto_5631 - SURFACE
      ?auto_5632 - SURFACE
      ?auto_5633 - SURFACE
      ?auto_5636 - SURFACE
      ?auto_5635 - SURFACE
      ?auto_5634 - SURFACE
      ?auto_5637 - SURFACE
    )
    :vars
    (
      ?auto_5643 - HOIST
      ?auto_5638 - PLACE
      ?auto_5639 - PLACE
      ?auto_5640 - HOIST
      ?auto_5641 - SURFACE
      ?auto_5645 - SURFACE
      ?auto_5660 - PLACE
      ?auto_5651 - HOIST
      ?auto_5646 - SURFACE
      ?auto_5659 - SURFACE
      ?auto_5647 - SURFACE
      ?auto_5655 - PLACE
      ?auto_5661 - HOIST
      ?auto_5650 - SURFACE
      ?auto_5649 - PLACE
      ?auto_5648 - HOIST
      ?auto_5653 - SURFACE
      ?auto_5644 - PLACE
      ?auto_5657 - HOIST
      ?auto_5654 - SURFACE
      ?auto_5652 - PLACE
      ?auto_5656 - HOIST
      ?auto_5658 - SURFACE
      ?auto_5642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5643 ?auto_5638 ) ( IS-CRATE ?auto_5637 ) ( not ( = ?auto_5639 ?auto_5638 ) ) ( HOIST-AT ?auto_5640 ?auto_5639 ) ( SURFACE-AT ?auto_5637 ?auto_5639 ) ( ON ?auto_5637 ?auto_5641 ) ( CLEAR ?auto_5637 ) ( not ( = ?auto_5634 ?auto_5637 ) ) ( not ( = ?auto_5634 ?auto_5641 ) ) ( not ( = ?auto_5637 ?auto_5641 ) ) ( not ( = ?auto_5643 ?auto_5640 ) ) ( IS-CRATE ?auto_5634 ) ( SURFACE-AT ?auto_5634 ?auto_5639 ) ( ON ?auto_5634 ?auto_5645 ) ( CLEAR ?auto_5634 ) ( not ( = ?auto_5635 ?auto_5634 ) ) ( not ( = ?auto_5635 ?auto_5645 ) ) ( not ( = ?auto_5634 ?auto_5645 ) ) ( IS-CRATE ?auto_5635 ) ( not ( = ?auto_5660 ?auto_5638 ) ) ( HOIST-AT ?auto_5651 ?auto_5660 ) ( AVAILABLE ?auto_5651 ) ( SURFACE-AT ?auto_5635 ?auto_5660 ) ( ON ?auto_5635 ?auto_5646 ) ( CLEAR ?auto_5635 ) ( not ( = ?auto_5636 ?auto_5635 ) ) ( not ( = ?auto_5636 ?auto_5646 ) ) ( not ( = ?auto_5635 ?auto_5646 ) ) ( not ( = ?auto_5643 ?auto_5651 ) ) ( IS-CRATE ?auto_5636 ) ( SURFACE-AT ?auto_5636 ?auto_5639 ) ( ON ?auto_5636 ?auto_5659 ) ( CLEAR ?auto_5636 ) ( not ( = ?auto_5633 ?auto_5636 ) ) ( not ( = ?auto_5633 ?auto_5659 ) ) ( not ( = ?auto_5636 ?auto_5659 ) ) ( IS-CRATE ?auto_5633 ) ( AVAILABLE ?auto_5640 ) ( SURFACE-AT ?auto_5633 ?auto_5639 ) ( ON ?auto_5633 ?auto_5647 ) ( CLEAR ?auto_5633 ) ( not ( = ?auto_5632 ?auto_5633 ) ) ( not ( = ?auto_5632 ?auto_5647 ) ) ( not ( = ?auto_5633 ?auto_5647 ) ) ( IS-CRATE ?auto_5632 ) ( not ( = ?auto_5655 ?auto_5638 ) ) ( HOIST-AT ?auto_5661 ?auto_5655 ) ( AVAILABLE ?auto_5661 ) ( SURFACE-AT ?auto_5632 ?auto_5655 ) ( ON ?auto_5632 ?auto_5650 ) ( CLEAR ?auto_5632 ) ( not ( = ?auto_5631 ?auto_5632 ) ) ( not ( = ?auto_5631 ?auto_5650 ) ) ( not ( = ?auto_5632 ?auto_5650 ) ) ( not ( = ?auto_5643 ?auto_5661 ) ) ( IS-CRATE ?auto_5631 ) ( not ( = ?auto_5649 ?auto_5638 ) ) ( HOIST-AT ?auto_5648 ?auto_5649 ) ( AVAILABLE ?auto_5648 ) ( SURFACE-AT ?auto_5631 ?auto_5649 ) ( ON ?auto_5631 ?auto_5653 ) ( CLEAR ?auto_5631 ) ( not ( = ?auto_5630 ?auto_5631 ) ) ( not ( = ?auto_5630 ?auto_5653 ) ) ( not ( = ?auto_5631 ?auto_5653 ) ) ( not ( = ?auto_5643 ?auto_5648 ) ) ( IS-CRATE ?auto_5630 ) ( not ( = ?auto_5644 ?auto_5638 ) ) ( HOIST-AT ?auto_5657 ?auto_5644 ) ( AVAILABLE ?auto_5657 ) ( SURFACE-AT ?auto_5630 ?auto_5644 ) ( ON ?auto_5630 ?auto_5654 ) ( CLEAR ?auto_5630 ) ( not ( = ?auto_5629 ?auto_5630 ) ) ( not ( = ?auto_5629 ?auto_5654 ) ) ( not ( = ?auto_5630 ?auto_5654 ) ) ( not ( = ?auto_5643 ?auto_5657 ) ) ( SURFACE-AT ?auto_5628 ?auto_5638 ) ( CLEAR ?auto_5628 ) ( IS-CRATE ?auto_5629 ) ( AVAILABLE ?auto_5643 ) ( not ( = ?auto_5652 ?auto_5638 ) ) ( HOIST-AT ?auto_5656 ?auto_5652 ) ( AVAILABLE ?auto_5656 ) ( SURFACE-AT ?auto_5629 ?auto_5652 ) ( ON ?auto_5629 ?auto_5658 ) ( CLEAR ?auto_5629 ) ( TRUCK-AT ?auto_5642 ?auto_5638 ) ( not ( = ?auto_5628 ?auto_5629 ) ) ( not ( = ?auto_5628 ?auto_5658 ) ) ( not ( = ?auto_5629 ?auto_5658 ) ) ( not ( = ?auto_5643 ?auto_5656 ) ) ( not ( = ?auto_5628 ?auto_5630 ) ) ( not ( = ?auto_5628 ?auto_5654 ) ) ( not ( = ?auto_5630 ?auto_5658 ) ) ( not ( = ?auto_5644 ?auto_5652 ) ) ( not ( = ?auto_5657 ?auto_5656 ) ) ( not ( = ?auto_5654 ?auto_5658 ) ) ( not ( = ?auto_5628 ?auto_5631 ) ) ( not ( = ?auto_5628 ?auto_5653 ) ) ( not ( = ?auto_5629 ?auto_5631 ) ) ( not ( = ?auto_5629 ?auto_5653 ) ) ( not ( = ?auto_5631 ?auto_5654 ) ) ( not ( = ?auto_5631 ?auto_5658 ) ) ( not ( = ?auto_5649 ?auto_5644 ) ) ( not ( = ?auto_5649 ?auto_5652 ) ) ( not ( = ?auto_5648 ?auto_5657 ) ) ( not ( = ?auto_5648 ?auto_5656 ) ) ( not ( = ?auto_5653 ?auto_5654 ) ) ( not ( = ?auto_5653 ?auto_5658 ) ) ( not ( = ?auto_5628 ?auto_5632 ) ) ( not ( = ?auto_5628 ?auto_5650 ) ) ( not ( = ?auto_5629 ?auto_5632 ) ) ( not ( = ?auto_5629 ?auto_5650 ) ) ( not ( = ?auto_5630 ?auto_5632 ) ) ( not ( = ?auto_5630 ?auto_5650 ) ) ( not ( = ?auto_5632 ?auto_5653 ) ) ( not ( = ?auto_5632 ?auto_5654 ) ) ( not ( = ?auto_5632 ?auto_5658 ) ) ( not ( = ?auto_5655 ?auto_5649 ) ) ( not ( = ?auto_5655 ?auto_5644 ) ) ( not ( = ?auto_5655 ?auto_5652 ) ) ( not ( = ?auto_5661 ?auto_5648 ) ) ( not ( = ?auto_5661 ?auto_5657 ) ) ( not ( = ?auto_5661 ?auto_5656 ) ) ( not ( = ?auto_5650 ?auto_5653 ) ) ( not ( = ?auto_5650 ?auto_5654 ) ) ( not ( = ?auto_5650 ?auto_5658 ) ) ( not ( = ?auto_5628 ?auto_5633 ) ) ( not ( = ?auto_5628 ?auto_5647 ) ) ( not ( = ?auto_5629 ?auto_5633 ) ) ( not ( = ?auto_5629 ?auto_5647 ) ) ( not ( = ?auto_5630 ?auto_5633 ) ) ( not ( = ?auto_5630 ?auto_5647 ) ) ( not ( = ?auto_5631 ?auto_5633 ) ) ( not ( = ?auto_5631 ?auto_5647 ) ) ( not ( = ?auto_5633 ?auto_5650 ) ) ( not ( = ?auto_5633 ?auto_5653 ) ) ( not ( = ?auto_5633 ?auto_5654 ) ) ( not ( = ?auto_5633 ?auto_5658 ) ) ( not ( = ?auto_5639 ?auto_5655 ) ) ( not ( = ?auto_5639 ?auto_5649 ) ) ( not ( = ?auto_5639 ?auto_5644 ) ) ( not ( = ?auto_5639 ?auto_5652 ) ) ( not ( = ?auto_5640 ?auto_5661 ) ) ( not ( = ?auto_5640 ?auto_5648 ) ) ( not ( = ?auto_5640 ?auto_5657 ) ) ( not ( = ?auto_5640 ?auto_5656 ) ) ( not ( = ?auto_5647 ?auto_5650 ) ) ( not ( = ?auto_5647 ?auto_5653 ) ) ( not ( = ?auto_5647 ?auto_5654 ) ) ( not ( = ?auto_5647 ?auto_5658 ) ) ( not ( = ?auto_5628 ?auto_5636 ) ) ( not ( = ?auto_5628 ?auto_5659 ) ) ( not ( = ?auto_5629 ?auto_5636 ) ) ( not ( = ?auto_5629 ?auto_5659 ) ) ( not ( = ?auto_5630 ?auto_5636 ) ) ( not ( = ?auto_5630 ?auto_5659 ) ) ( not ( = ?auto_5631 ?auto_5636 ) ) ( not ( = ?auto_5631 ?auto_5659 ) ) ( not ( = ?auto_5632 ?auto_5636 ) ) ( not ( = ?auto_5632 ?auto_5659 ) ) ( not ( = ?auto_5636 ?auto_5647 ) ) ( not ( = ?auto_5636 ?auto_5650 ) ) ( not ( = ?auto_5636 ?auto_5653 ) ) ( not ( = ?auto_5636 ?auto_5654 ) ) ( not ( = ?auto_5636 ?auto_5658 ) ) ( not ( = ?auto_5659 ?auto_5647 ) ) ( not ( = ?auto_5659 ?auto_5650 ) ) ( not ( = ?auto_5659 ?auto_5653 ) ) ( not ( = ?auto_5659 ?auto_5654 ) ) ( not ( = ?auto_5659 ?auto_5658 ) ) ( not ( = ?auto_5628 ?auto_5635 ) ) ( not ( = ?auto_5628 ?auto_5646 ) ) ( not ( = ?auto_5629 ?auto_5635 ) ) ( not ( = ?auto_5629 ?auto_5646 ) ) ( not ( = ?auto_5630 ?auto_5635 ) ) ( not ( = ?auto_5630 ?auto_5646 ) ) ( not ( = ?auto_5631 ?auto_5635 ) ) ( not ( = ?auto_5631 ?auto_5646 ) ) ( not ( = ?auto_5632 ?auto_5635 ) ) ( not ( = ?auto_5632 ?auto_5646 ) ) ( not ( = ?auto_5633 ?auto_5635 ) ) ( not ( = ?auto_5633 ?auto_5646 ) ) ( not ( = ?auto_5635 ?auto_5659 ) ) ( not ( = ?auto_5635 ?auto_5647 ) ) ( not ( = ?auto_5635 ?auto_5650 ) ) ( not ( = ?auto_5635 ?auto_5653 ) ) ( not ( = ?auto_5635 ?auto_5654 ) ) ( not ( = ?auto_5635 ?auto_5658 ) ) ( not ( = ?auto_5660 ?auto_5639 ) ) ( not ( = ?auto_5660 ?auto_5655 ) ) ( not ( = ?auto_5660 ?auto_5649 ) ) ( not ( = ?auto_5660 ?auto_5644 ) ) ( not ( = ?auto_5660 ?auto_5652 ) ) ( not ( = ?auto_5651 ?auto_5640 ) ) ( not ( = ?auto_5651 ?auto_5661 ) ) ( not ( = ?auto_5651 ?auto_5648 ) ) ( not ( = ?auto_5651 ?auto_5657 ) ) ( not ( = ?auto_5651 ?auto_5656 ) ) ( not ( = ?auto_5646 ?auto_5659 ) ) ( not ( = ?auto_5646 ?auto_5647 ) ) ( not ( = ?auto_5646 ?auto_5650 ) ) ( not ( = ?auto_5646 ?auto_5653 ) ) ( not ( = ?auto_5646 ?auto_5654 ) ) ( not ( = ?auto_5646 ?auto_5658 ) ) ( not ( = ?auto_5628 ?auto_5634 ) ) ( not ( = ?auto_5628 ?auto_5645 ) ) ( not ( = ?auto_5629 ?auto_5634 ) ) ( not ( = ?auto_5629 ?auto_5645 ) ) ( not ( = ?auto_5630 ?auto_5634 ) ) ( not ( = ?auto_5630 ?auto_5645 ) ) ( not ( = ?auto_5631 ?auto_5634 ) ) ( not ( = ?auto_5631 ?auto_5645 ) ) ( not ( = ?auto_5632 ?auto_5634 ) ) ( not ( = ?auto_5632 ?auto_5645 ) ) ( not ( = ?auto_5633 ?auto_5634 ) ) ( not ( = ?auto_5633 ?auto_5645 ) ) ( not ( = ?auto_5636 ?auto_5634 ) ) ( not ( = ?auto_5636 ?auto_5645 ) ) ( not ( = ?auto_5634 ?auto_5646 ) ) ( not ( = ?auto_5634 ?auto_5659 ) ) ( not ( = ?auto_5634 ?auto_5647 ) ) ( not ( = ?auto_5634 ?auto_5650 ) ) ( not ( = ?auto_5634 ?auto_5653 ) ) ( not ( = ?auto_5634 ?auto_5654 ) ) ( not ( = ?auto_5634 ?auto_5658 ) ) ( not ( = ?auto_5645 ?auto_5646 ) ) ( not ( = ?auto_5645 ?auto_5659 ) ) ( not ( = ?auto_5645 ?auto_5647 ) ) ( not ( = ?auto_5645 ?auto_5650 ) ) ( not ( = ?auto_5645 ?auto_5653 ) ) ( not ( = ?auto_5645 ?auto_5654 ) ) ( not ( = ?auto_5645 ?auto_5658 ) ) ( not ( = ?auto_5628 ?auto_5637 ) ) ( not ( = ?auto_5628 ?auto_5641 ) ) ( not ( = ?auto_5629 ?auto_5637 ) ) ( not ( = ?auto_5629 ?auto_5641 ) ) ( not ( = ?auto_5630 ?auto_5637 ) ) ( not ( = ?auto_5630 ?auto_5641 ) ) ( not ( = ?auto_5631 ?auto_5637 ) ) ( not ( = ?auto_5631 ?auto_5641 ) ) ( not ( = ?auto_5632 ?auto_5637 ) ) ( not ( = ?auto_5632 ?auto_5641 ) ) ( not ( = ?auto_5633 ?auto_5637 ) ) ( not ( = ?auto_5633 ?auto_5641 ) ) ( not ( = ?auto_5636 ?auto_5637 ) ) ( not ( = ?auto_5636 ?auto_5641 ) ) ( not ( = ?auto_5635 ?auto_5637 ) ) ( not ( = ?auto_5635 ?auto_5641 ) ) ( not ( = ?auto_5637 ?auto_5645 ) ) ( not ( = ?auto_5637 ?auto_5646 ) ) ( not ( = ?auto_5637 ?auto_5659 ) ) ( not ( = ?auto_5637 ?auto_5647 ) ) ( not ( = ?auto_5637 ?auto_5650 ) ) ( not ( = ?auto_5637 ?auto_5653 ) ) ( not ( = ?auto_5637 ?auto_5654 ) ) ( not ( = ?auto_5637 ?auto_5658 ) ) ( not ( = ?auto_5641 ?auto_5645 ) ) ( not ( = ?auto_5641 ?auto_5646 ) ) ( not ( = ?auto_5641 ?auto_5659 ) ) ( not ( = ?auto_5641 ?auto_5647 ) ) ( not ( = ?auto_5641 ?auto_5650 ) ) ( not ( = ?auto_5641 ?auto_5653 ) ) ( not ( = ?auto_5641 ?auto_5654 ) ) ( not ( = ?auto_5641 ?auto_5658 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_5628 ?auto_5629 ?auto_5630 ?auto_5631 ?auto_5632 ?auto_5633 ?auto_5636 ?auto_5635 ?auto_5634 )
      ( MAKE-1CRATE ?auto_5634 ?auto_5637 )
      ( MAKE-9CRATE-VERIFY ?auto_5628 ?auto_5629 ?auto_5630 ?auto_5631 ?auto_5632 ?auto_5633 ?auto_5636 ?auto_5635 ?auto_5634 ?auto_5637 ) )
  )

)

