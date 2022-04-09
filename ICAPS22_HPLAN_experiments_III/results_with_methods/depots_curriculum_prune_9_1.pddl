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
      ?auto_5357 - PLACE
      ?auto_5355 - PLACE
      ?auto_5354 - HOIST
      ?auto_5352 - SURFACE
      ?auto_5359 - PLACE
      ?auto_5358 - HOIST
      ?auto_5360 - SURFACE
      ?auto_5356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5353 ?auto_5357 ) ( IS-CRATE ?auto_5351 ) ( not ( = ?auto_5355 ?auto_5357 ) ) ( HOIST-AT ?auto_5354 ?auto_5355 ) ( AVAILABLE ?auto_5354 ) ( SURFACE-AT ?auto_5351 ?auto_5355 ) ( ON ?auto_5351 ?auto_5352 ) ( CLEAR ?auto_5351 ) ( not ( = ?auto_5350 ?auto_5351 ) ) ( not ( = ?auto_5350 ?auto_5352 ) ) ( not ( = ?auto_5351 ?auto_5352 ) ) ( not ( = ?auto_5353 ?auto_5354 ) ) ( SURFACE-AT ?auto_5349 ?auto_5357 ) ( CLEAR ?auto_5349 ) ( IS-CRATE ?auto_5350 ) ( AVAILABLE ?auto_5353 ) ( not ( = ?auto_5359 ?auto_5357 ) ) ( HOIST-AT ?auto_5358 ?auto_5359 ) ( AVAILABLE ?auto_5358 ) ( SURFACE-AT ?auto_5350 ?auto_5359 ) ( ON ?auto_5350 ?auto_5360 ) ( CLEAR ?auto_5350 ) ( TRUCK-AT ?auto_5356 ?auto_5357 ) ( not ( = ?auto_5349 ?auto_5350 ) ) ( not ( = ?auto_5349 ?auto_5360 ) ) ( not ( = ?auto_5350 ?auto_5360 ) ) ( not ( = ?auto_5353 ?auto_5358 ) ) ( not ( = ?auto_5349 ?auto_5351 ) ) ( not ( = ?auto_5349 ?auto_5352 ) ) ( not ( = ?auto_5351 ?auto_5360 ) ) ( not ( = ?auto_5355 ?auto_5359 ) ) ( not ( = ?auto_5354 ?auto_5358 ) ) ( not ( = ?auto_5352 ?auto_5360 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5349 ?auto_5350 )
      ( MAKE-1CRATE ?auto_5350 ?auto_5351 )
      ( MAKE-2CRATE-VERIFY ?auto_5349 ?auto_5350 ?auto_5351 ) )
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
      ?auto_5383 - HOIST
      ?auto_5379 - PLACE
      ?auto_5384 - PLACE
      ?auto_5381 - HOIST
      ?auto_5382 - SURFACE
      ?auto_5388 - PLACE
      ?auto_5387 - HOIST
      ?auto_5390 - SURFACE
      ?auto_5389 - PLACE
      ?auto_5385 - HOIST
      ?auto_5386 - SURFACE
      ?auto_5380 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5383 ?auto_5379 ) ( IS-CRATE ?auto_5378 ) ( not ( = ?auto_5384 ?auto_5379 ) ) ( HOIST-AT ?auto_5381 ?auto_5384 ) ( AVAILABLE ?auto_5381 ) ( SURFACE-AT ?auto_5378 ?auto_5384 ) ( ON ?auto_5378 ?auto_5382 ) ( CLEAR ?auto_5378 ) ( not ( = ?auto_5377 ?auto_5378 ) ) ( not ( = ?auto_5377 ?auto_5382 ) ) ( not ( = ?auto_5378 ?auto_5382 ) ) ( not ( = ?auto_5383 ?auto_5381 ) ) ( IS-CRATE ?auto_5377 ) ( not ( = ?auto_5388 ?auto_5379 ) ) ( HOIST-AT ?auto_5387 ?auto_5388 ) ( AVAILABLE ?auto_5387 ) ( SURFACE-AT ?auto_5377 ?auto_5388 ) ( ON ?auto_5377 ?auto_5390 ) ( CLEAR ?auto_5377 ) ( not ( = ?auto_5376 ?auto_5377 ) ) ( not ( = ?auto_5376 ?auto_5390 ) ) ( not ( = ?auto_5377 ?auto_5390 ) ) ( not ( = ?auto_5383 ?auto_5387 ) ) ( SURFACE-AT ?auto_5375 ?auto_5379 ) ( CLEAR ?auto_5375 ) ( IS-CRATE ?auto_5376 ) ( AVAILABLE ?auto_5383 ) ( not ( = ?auto_5389 ?auto_5379 ) ) ( HOIST-AT ?auto_5385 ?auto_5389 ) ( AVAILABLE ?auto_5385 ) ( SURFACE-AT ?auto_5376 ?auto_5389 ) ( ON ?auto_5376 ?auto_5386 ) ( CLEAR ?auto_5376 ) ( TRUCK-AT ?auto_5380 ?auto_5379 ) ( not ( = ?auto_5375 ?auto_5376 ) ) ( not ( = ?auto_5375 ?auto_5386 ) ) ( not ( = ?auto_5376 ?auto_5386 ) ) ( not ( = ?auto_5383 ?auto_5385 ) ) ( not ( = ?auto_5375 ?auto_5377 ) ) ( not ( = ?auto_5375 ?auto_5390 ) ) ( not ( = ?auto_5377 ?auto_5386 ) ) ( not ( = ?auto_5388 ?auto_5389 ) ) ( not ( = ?auto_5387 ?auto_5385 ) ) ( not ( = ?auto_5390 ?auto_5386 ) ) ( not ( = ?auto_5375 ?auto_5378 ) ) ( not ( = ?auto_5375 ?auto_5382 ) ) ( not ( = ?auto_5376 ?auto_5378 ) ) ( not ( = ?auto_5376 ?auto_5382 ) ) ( not ( = ?auto_5378 ?auto_5390 ) ) ( not ( = ?auto_5378 ?auto_5386 ) ) ( not ( = ?auto_5384 ?auto_5388 ) ) ( not ( = ?auto_5384 ?auto_5389 ) ) ( not ( = ?auto_5381 ?auto_5387 ) ) ( not ( = ?auto_5381 ?auto_5385 ) ) ( not ( = ?auto_5382 ?auto_5390 ) ) ( not ( = ?auto_5382 ?auto_5386 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5375 ?auto_5376 ?auto_5377 )
      ( MAKE-1CRATE ?auto_5377 ?auto_5378 )
      ( MAKE-3CRATE-VERIFY ?auto_5375 ?auto_5376 ?auto_5377 ?auto_5378 ) )
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
      ?auto_5415 - PLACE
      ?auto_5414 - PLACE
      ?auto_5411 - HOIST
      ?auto_5413 - SURFACE
      ?auto_5423 - PLACE
      ?auto_5421 - HOIST
      ?auto_5422 - SURFACE
      ?auto_5420 - PLACE
      ?auto_5418 - HOIST
      ?auto_5417 - SURFACE
      ?auto_5419 - PLACE
      ?auto_5424 - HOIST
      ?auto_5425 - SURFACE
      ?auto_5412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5416 ?auto_5415 ) ( IS-CRATE ?auto_5410 ) ( not ( = ?auto_5414 ?auto_5415 ) ) ( HOIST-AT ?auto_5411 ?auto_5414 ) ( AVAILABLE ?auto_5411 ) ( SURFACE-AT ?auto_5410 ?auto_5414 ) ( ON ?auto_5410 ?auto_5413 ) ( CLEAR ?auto_5410 ) ( not ( = ?auto_5409 ?auto_5410 ) ) ( not ( = ?auto_5409 ?auto_5413 ) ) ( not ( = ?auto_5410 ?auto_5413 ) ) ( not ( = ?auto_5416 ?auto_5411 ) ) ( IS-CRATE ?auto_5409 ) ( not ( = ?auto_5423 ?auto_5415 ) ) ( HOIST-AT ?auto_5421 ?auto_5423 ) ( AVAILABLE ?auto_5421 ) ( SURFACE-AT ?auto_5409 ?auto_5423 ) ( ON ?auto_5409 ?auto_5422 ) ( CLEAR ?auto_5409 ) ( not ( = ?auto_5408 ?auto_5409 ) ) ( not ( = ?auto_5408 ?auto_5422 ) ) ( not ( = ?auto_5409 ?auto_5422 ) ) ( not ( = ?auto_5416 ?auto_5421 ) ) ( IS-CRATE ?auto_5408 ) ( not ( = ?auto_5420 ?auto_5415 ) ) ( HOIST-AT ?auto_5418 ?auto_5420 ) ( AVAILABLE ?auto_5418 ) ( SURFACE-AT ?auto_5408 ?auto_5420 ) ( ON ?auto_5408 ?auto_5417 ) ( CLEAR ?auto_5408 ) ( not ( = ?auto_5407 ?auto_5408 ) ) ( not ( = ?auto_5407 ?auto_5417 ) ) ( not ( = ?auto_5408 ?auto_5417 ) ) ( not ( = ?auto_5416 ?auto_5418 ) ) ( SURFACE-AT ?auto_5406 ?auto_5415 ) ( CLEAR ?auto_5406 ) ( IS-CRATE ?auto_5407 ) ( AVAILABLE ?auto_5416 ) ( not ( = ?auto_5419 ?auto_5415 ) ) ( HOIST-AT ?auto_5424 ?auto_5419 ) ( AVAILABLE ?auto_5424 ) ( SURFACE-AT ?auto_5407 ?auto_5419 ) ( ON ?auto_5407 ?auto_5425 ) ( CLEAR ?auto_5407 ) ( TRUCK-AT ?auto_5412 ?auto_5415 ) ( not ( = ?auto_5406 ?auto_5407 ) ) ( not ( = ?auto_5406 ?auto_5425 ) ) ( not ( = ?auto_5407 ?auto_5425 ) ) ( not ( = ?auto_5416 ?auto_5424 ) ) ( not ( = ?auto_5406 ?auto_5408 ) ) ( not ( = ?auto_5406 ?auto_5417 ) ) ( not ( = ?auto_5408 ?auto_5425 ) ) ( not ( = ?auto_5420 ?auto_5419 ) ) ( not ( = ?auto_5418 ?auto_5424 ) ) ( not ( = ?auto_5417 ?auto_5425 ) ) ( not ( = ?auto_5406 ?auto_5409 ) ) ( not ( = ?auto_5406 ?auto_5422 ) ) ( not ( = ?auto_5407 ?auto_5409 ) ) ( not ( = ?auto_5407 ?auto_5422 ) ) ( not ( = ?auto_5409 ?auto_5417 ) ) ( not ( = ?auto_5409 ?auto_5425 ) ) ( not ( = ?auto_5423 ?auto_5420 ) ) ( not ( = ?auto_5423 ?auto_5419 ) ) ( not ( = ?auto_5421 ?auto_5418 ) ) ( not ( = ?auto_5421 ?auto_5424 ) ) ( not ( = ?auto_5422 ?auto_5417 ) ) ( not ( = ?auto_5422 ?auto_5425 ) ) ( not ( = ?auto_5406 ?auto_5410 ) ) ( not ( = ?auto_5406 ?auto_5413 ) ) ( not ( = ?auto_5407 ?auto_5410 ) ) ( not ( = ?auto_5407 ?auto_5413 ) ) ( not ( = ?auto_5408 ?auto_5410 ) ) ( not ( = ?auto_5408 ?auto_5413 ) ) ( not ( = ?auto_5410 ?auto_5422 ) ) ( not ( = ?auto_5410 ?auto_5417 ) ) ( not ( = ?auto_5410 ?auto_5425 ) ) ( not ( = ?auto_5414 ?auto_5423 ) ) ( not ( = ?auto_5414 ?auto_5420 ) ) ( not ( = ?auto_5414 ?auto_5419 ) ) ( not ( = ?auto_5411 ?auto_5421 ) ) ( not ( = ?auto_5411 ?auto_5418 ) ) ( not ( = ?auto_5411 ?auto_5424 ) ) ( not ( = ?auto_5413 ?auto_5422 ) ) ( not ( = ?auto_5413 ?auto_5417 ) ) ( not ( = ?auto_5413 ?auto_5425 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_5406 ?auto_5407 ?auto_5408 ?auto_5409 )
      ( MAKE-1CRATE ?auto_5409 ?auto_5410 )
      ( MAKE-4CRATE-VERIFY ?auto_5406 ?auto_5407 ?auto_5408 ?auto_5409 ?auto_5410 ) )
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
      ?auto_5449 - HOIST
      ?auto_5453 - PLACE
      ?auto_5450 - PLACE
      ?auto_5448 - HOIST
      ?auto_5451 - SURFACE
      ?auto_5464 - PLACE
      ?auto_5460 - HOIST
      ?auto_5465 - SURFACE
      ?auto_5455 - PLACE
      ?auto_5459 - HOIST
      ?auto_5463 - SURFACE
      ?auto_5458 - PLACE
      ?auto_5462 - HOIST
      ?auto_5461 - SURFACE
      ?auto_5454 - PLACE
      ?auto_5457 - HOIST
      ?auto_5456 - SURFACE
      ?auto_5452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5449 ?auto_5453 ) ( IS-CRATE ?auto_5447 ) ( not ( = ?auto_5450 ?auto_5453 ) ) ( HOIST-AT ?auto_5448 ?auto_5450 ) ( AVAILABLE ?auto_5448 ) ( SURFACE-AT ?auto_5447 ?auto_5450 ) ( ON ?auto_5447 ?auto_5451 ) ( CLEAR ?auto_5447 ) ( not ( = ?auto_5446 ?auto_5447 ) ) ( not ( = ?auto_5446 ?auto_5451 ) ) ( not ( = ?auto_5447 ?auto_5451 ) ) ( not ( = ?auto_5449 ?auto_5448 ) ) ( IS-CRATE ?auto_5446 ) ( not ( = ?auto_5464 ?auto_5453 ) ) ( HOIST-AT ?auto_5460 ?auto_5464 ) ( AVAILABLE ?auto_5460 ) ( SURFACE-AT ?auto_5446 ?auto_5464 ) ( ON ?auto_5446 ?auto_5465 ) ( CLEAR ?auto_5446 ) ( not ( = ?auto_5445 ?auto_5446 ) ) ( not ( = ?auto_5445 ?auto_5465 ) ) ( not ( = ?auto_5446 ?auto_5465 ) ) ( not ( = ?auto_5449 ?auto_5460 ) ) ( IS-CRATE ?auto_5445 ) ( not ( = ?auto_5455 ?auto_5453 ) ) ( HOIST-AT ?auto_5459 ?auto_5455 ) ( AVAILABLE ?auto_5459 ) ( SURFACE-AT ?auto_5445 ?auto_5455 ) ( ON ?auto_5445 ?auto_5463 ) ( CLEAR ?auto_5445 ) ( not ( = ?auto_5444 ?auto_5445 ) ) ( not ( = ?auto_5444 ?auto_5463 ) ) ( not ( = ?auto_5445 ?auto_5463 ) ) ( not ( = ?auto_5449 ?auto_5459 ) ) ( IS-CRATE ?auto_5444 ) ( not ( = ?auto_5458 ?auto_5453 ) ) ( HOIST-AT ?auto_5462 ?auto_5458 ) ( AVAILABLE ?auto_5462 ) ( SURFACE-AT ?auto_5444 ?auto_5458 ) ( ON ?auto_5444 ?auto_5461 ) ( CLEAR ?auto_5444 ) ( not ( = ?auto_5443 ?auto_5444 ) ) ( not ( = ?auto_5443 ?auto_5461 ) ) ( not ( = ?auto_5444 ?auto_5461 ) ) ( not ( = ?auto_5449 ?auto_5462 ) ) ( SURFACE-AT ?auto_5442 ?auto_5453 ) ( CLEAR ?auto_5442 ) ( IS-CRATE ?auto_5443 ) ( AVAILABLE ?auto_5449 ) ( not ( = ?auto_5454 ?auto_5453 ) ) ( HOIST-AT ?auto_5457 ?auto_5454 ) ( AVAILABLE ?auto_5457 ) ( SURFACE-AT ?auto_5443 ?auto_5454 ) ( ON ?auto_5443 ?auto_5456 ) ( CLEAR ?auto_5443 ) ( TRUCK-AT ?auto_5452 ?auto_5453 ) ( not ( = ?auto_5442 ?auto_5443 ) ) ( not ( = ?auto_5442 ?auto_5456 ) ) ( not ( = ?auto_5443 ?auto_5456 ) ) ( not ( = ?auto_5449 ?auto_5457 ) ) ( not ( = ?auto_5442 ?auto_5444 ) ) ( not ( = ?auto_5442 ?auto_5461 ) ) ( not ( = ?auto_5444 ?auto_5456 ) ) ( not ( = ?auto_5458 ?auto_5454 ) ) ( not ( = ?auto_5462 ?auto_5457 ) ) ( not ( = ?auto_5461 ?auto_5456 ) ) ( not ( = ?auto_5442 ?auto_5445 ) ) ( not ( = ?auto_5442 ?auto_5463 ) ) ( not ( = ?auto_5443 ?auto_5445 ) ) ( not ( = ?auto_5443 ?auto_5463 ) ) ( not ( = ?auto_5445 ?auto_5461 ) ) ( not ( = ?auto_5445 ?auto_5456 ) ) ( not ( = ?auto_5455 ?auto_5458 ) ) ( not ( = ?auto_5455 ?auto_5454 ) ) ( not ( = ?auto_5459 ?auto_5462 ) ) ( not ( = ?auto_5459 ?auto_5457 ) ) ( not ( = ?auto_5463 ?auto_5461 ) ) ( not ( = ?auto_5463 ?auto_5456 ) ) ( not ( = ?auto_5442 ?auto_5446 ) ) ( not ( = ?auto_5442 ?auto_5465 ) ) ( not ( = ?auto_5443 ?auto_5446 ) ) ( not ( = ?auto_5443 ?auto_5465 ) ) ( not ( = ?auto_5444 ?auto_5446 ) ) ( not ( = ?auto_5444 ?auto_5465 ) ) ( not ( = ?auto_5446 ?auto_5463 ) ) ( not ( = ?auto_5446 ?auto_5461 ) ) ( not ( = ?auto_5446 ?auto_5456 ) ) ( not ( = ?auto_5464 ?auto_5455 ) ) ( not ( = ?auto_5464 ?auto_5458 ) ) ( not ( = ?auto_5464 ?auto_5454 ) ) ( not ( = ?auto_5460 ?auto_5459 ) ) ( not ( = ?auto_5460 ?auto_5462 ) ) ( not ( = ?auto_5460 ?auto_5457 ) ) ( not ( = ?auto_5465 ?auto_5463 ) ) ( not ( = ?auto_5465 ?auto_5461 ) ) ( not ( = ?auto_5465 ?auto_5456 ) ) ( not ( = ?auto_5442 ?auto_5447 ) ) ( not ( = ?auto_5442 ?auto_5451 ) ) ( not ( = ?auto_5443 ?auto_5447 ) ) ( not ( = ?auto_5443 ?auto_5451 ) ) ( not ( = ?auto_5444 ?auto_5447 ) ) ( not ( = ?auto_5444 ?auto_5451 ) ) ( not ( = ?auto_5445 ?auto_5447 ) ) ( not ( = ?auto_5445 ?auto_5451 ) ) ( not ( = ?auto_5447 ?auto_5465 ) ) ( not ( = ?auto_5447 ?auto_5463 ) ) ( not ( = ?auto_5447 ?auto_5461 ) ) ( not ( = ?auto_5447 ?auto_5456 ) ) ( not ( = ?auto_5450 ?auto_5464 ) ) ( not ( = ?auto_5450 ?auto_5455 ) ) ( not ( = ?auto_5450 ?auto_5458 ) ) ( not ( = ?auto_5450 ?auto_5454 ) ) ( not ( = ?auto_5448 ?auto_5460 ) ) ( not ( = ?auto_5448 ?auto_5459 ) ) ( not ( = ?auto_5448 ?auto_5462 ) ) ( not ( = ?auto_5448 ?auto_5457 ) ) ( not ( = ?auto_5451 ?auto_5465 ) ) ( not ( = ?auto_5451 ?auto_5463 ) ) ( not ( = ?auto_5451 ?auto_5461 ) ) ( not ( = ?auto_5451 ?auto_5456 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_5442 ?auto_5443 ?auto_5444 ?auto_5445 ?auto_5446 )
      ( MAKE-1CRATE ?auto_5446 ?auto_5447 )
      ( MAKE-5CRATE-VERIFY ?auto_5442 ?auto_5443 ?auto_5444 ?auto_5445 ?auto_5446 ?auto_5447 ) )
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
      ?auto_5490 - HOIST
      ?auto_5494 - PLACE
      ?auto_5495 - PLACE
      ?auto_5493 - HOIST
      ?auto_5491 - SURFACE
      ?auto_5497 - SURFACE
      ?auto_5508 - PLACE
      ?auto_5506 - HOIST
      ?auto_5500 - SURFACE
      ?auto_5502 - PLACE
      ?auto_5504 - HOIST
      ?auto_5501 - SURFACE
      ?auto_5505 - PLACE
      ?auto_5499 - HOIST
      ?auto_5507 - SURFACE
      ?auto_5498 - PLACE
      ?auto_5503 - HOIST
      ?auto_5496 - SURFACE
      ?auto_5492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5490 ?auto_5494 ) ( IS-CRATE ?auto_5489 ) ( not ( = ?auto_5495 ?auto_5494 ) ) ( HOIST-AT ?auto_5493 ?auto_5495 ) ( SURFACE-AT ?auto_5489 ?auto_5495 ) ( ON ?auto_5489 ?auto_5491 ) ( CLEAR ?auto_5489 ) ( not ( = ?auto_5488 ?auto_5489 ) ) ( not ( = ?auto_5488 ?auto_5491 ) ) ( not ( = ?auto_5489 ?auto_5491 ) ) ( not ( = ?auto_5490 ?auto_5493 ) ) ( IS-CRATE ?auto_5488 ) ( AVAILABLE ?auto_5493 ) ( SURFACE-AT ?auto_5488 ?auto_5495 ) ( ON ?auto_5488 ?auto_5497 ) ( CLEAR ?auto_5488 ) ( not ( = ?auto_5487 ?auto_5488 ) ) ( not ( = ?auto_5487 ?auto_5497 ) ) ( not ( = ?auto_5488 ?auto_5497 ) ) ( IS-CRATE ?auto_5487 ) ( not ( = ?auto_5508 ?auto_5494 ) ) ( HOIST-AT ?auto_5506 ?auto_5508 ) ( AVAILABLE ?auto_5506 ) ( SURFACE-AT ?auto_5487 ?auto_5508 ) ( ON ?auto_5487 ?auto_5500 ) ( CLEAR ?auto_5487 ) ( not ( = ?auto_5486 ?auto_5487 ) ) ( not ( = ?auto_5486 ?auto_5500 ) ) ( not ( = ?auto_5487 ?auto_5500 ) ) ( not ( = ?auto_5490 ?auto_5506 ) ) ( IS-CRATE ?auto_5486 ) ( not ( = ?auto_5502 ?auto_5494 ) ) ( HOIST-AT ?auto_5504 ?auto_5502 ) ( AVAILABLE ?auto_5504 ) ( SURFACE-AT ?auto_5486 ?auto_5502 ) ( ON ?auto_5486 ?auto_5501 ) ( CLEAR ?auto_5486 ) ( not ( = ?auto_5485 ?auto_5486 ) ) ( not ( = ?auto_5485 ?auto_5501 ) ) ( not ( = ?auto_5486 ?auto_5501 ) ) ( not ( = ?auto_5490 ?auto_5504 ) ) ( IS-CRATE ?auto_5485 ) ( not ( = ?auto_5505 ?auto_5494 ) ) ( HOIST-AT ?auto_5499 ?auto_5505 ) ( AVAILABLE ?auto_5499 ) ( SURFACE-AT ?auto_5485 ?auto_5505 ) ( ON ?auto_5485 ?auto_5507 ) ( CLEAR ?auto_5485 ) ( not ( = ?auto_5484 ?auto_5485 ) ) ( not ( = ?auto_5484 ?auto_5507 ) ) ( not ( = ?auto_5485 ?auto_5507 ) ) ( not ( = ?auto_5490 ?auto_5499 ) ) ( SURFACE-AT ?auto_5483 ?auto_5494 ) ( CLEAR ?auto_5483 ) ( IS-CRATE ?auto_5484 ) ( AVAILABLE ?auto_5490 ) ( not ( = ?auto_5498 ?auto_5494 ) ) ( HOIST-AT ?auto_5503 ?auto_5498 ) ( AVAILABLE ?auto_5503 ) ( SURFACE-AT ?auto_5484 ?auto_5498 ) ( ON ?auto_5484 ?auto_5496 ) ( CLEAR ?auto_5484 ) ( TRUCK-AT ?auto_5492 ?auto_5494 ) ( not ( = ?auto_5483 ?auto_5484 ) ) ( not ( = ?auto_5483 ?auto_5496 ) ) ( not ( = ?auto_5484 ?auto_5496 ) ) ( not ( = ?auto_5490 ?auto_5503 ) ) ( not ( = ?auto_5483 ?auto_5485 ) ) ( not ( = ?auto_5483 ?auto_5507 ) ) ( not ( = ?auto_5485 ?auto_5496 ) ) ( not ( = ?auto_5505 ?auto_5498 ) ) ( not ( = ?auto_5499 ?auto_5503 ) ) ( not ( = ?auto_5507 ?auto_5496 ) ) ( not ( = ?auto_5483 ?auto_5486 ) ) ( not ( = ?auto_5483 ?auto_5501 ) ) ( not ( = ?auto_5484 ?auto_5486 ) ) ( not ( = ?auto_5484 ?auto_5501 ) ) ( not ( = ?auto_5486 ?auto_5507 ) ) ( not ( = ?auto_5486 ?auto_5496 ) ) ( not ( = ?auto_5502 ?auto_5505 ) ) ( not ( = ?auto_5502 ?auto_5498 ) ) ( not ( = ?auto_5504 ?auto_5499 ) ) ( not ( = ?auto_5504 ?auto_5503 ) ) ( not ( = ?auto_5501 ?auto_5507 ) ) ( not ( = ?auto_5501 ?auto_5496 ) ) ( not ( = ?auto_5483 ?auto_5487 ) ) ( not ( = ?auto_5483 ?auto_5500 ) ) ( not ( = ?auto_5484 ?auto_5487 ) ) ( not ( = ?auto_5484 ?auto_5500 ) ) ( not ( = ?auto_5485 ?auto_5487 ) ) ( not ( = ?auto_5485 ?auto_5500 ) ) ( not ( = ?auto_5487 ?auto_5501 ) ) ( not ( = ?auto_5487 ?auto_5507 ) ) ( not ( = ?auto_5487 ?auto_5496 ) ) ( not ( = ?auto_5508 ?auto_5502 ) ) ( not ( = ?auto_5508 ?auto_5505 ) ) ( not ( = ?auto_5508 ?auto_5498 ) ) ( not ( = ?auto_5506 ?auto_5504 ) ) ( not ( = ?auto_5506 ?auto_5499 ) ) ( not ( = ?auto_5506 ?auto_5503 ) ) ( not ( = ?auto_5500 ?auto_5501 ) ) ( not ( = ?auto_5500 ?auto_5507 ) ) ( not ( = ?auto_5500 ?auto_5496 ) ) ( not ( = ?auto_5483 ?auto_5488 ) ) ( not ( = ?auto_5483 ?auto_5497 ) ) ( not ( = ?auto_5484 ?auto_5488 ) ) ( not ( = ?auto_5484 ?auto_5497 ) ) ( not ( = ?auto_5485 ?auto_5488 ) ) ( not ( = ?auto_5485 ?auto_5497 ) ) ( not ( = ?auto_5486 ?auto_5488 ) ) ( not ( = ?auto_5486 ?auto_5497 ) ) ( not ( = ?auto_5488 ?auto_5500 ) ) ( not ( = ?auto_5488 ?auto_5501 ) ) ( not ( = ?auto_5488 ?auto_5507 ) ) ( not ( = ?auto_5488 ?auto_5496 ) ) ( not ( = ?auto_5495 ?auto_5508 ) ) ( not ( = ?auto_5495 ?auto_5502 ) ) ( not ( = ?auto_5495 ?auto_5505 ) ) ( not ( = ?auto_5495 ?auto_5498 ) ) ( not ( = ?auto_5493 ?auto_5506 ) ) ( not ( = ?auto_5493 ?auto_5504 ) ) ( not ( = ?auto_5493 ?auto_5499 ) ) ( not ( = ?auto_5493 ?auto_5503 ) ) ( not ( = ?auto_5497 ?auto_5500 ) ) ( not ( = ?auto_5497 ?auto_5501 ) ) ( not ( = ?auto_5497 ?auto_5507 ) ) ( not ( = ?auto_5497 ?auto_5496 ) ) ( not ( = ?auto_5483 ?auto_5489 ) ) ( not ( = ?auto_5483 ?auto_5491 ) ) ( not ( = ?auto_5484 ?auto_5489 ) ) ( not ( = ?auto_5484 ?auto_5491 ) ) ( not ( = ?auto_5485 ?auto_5489 ) ) ( not ( = ?auto_5485 ?auto_5491 ) ) ( not ( = ?auto_5486 ?auto_5489 ) ) ( not ( = ?auto_5486 ?auto_5491 ) ) ( not ( = ?auto_5487 ?auto_5489 ) ) ( not ( = ?auto_5487 ?auto_5491 ) ) ( not ( = ?auto_5489 ?auto_5497 ) ) ( not ( = ?auto_5489 ?auto_5500 ) ) ( not ( = ?auto_5489 ?auto_5501 ) ) ( not ( = ?auto_5489 ?auto_5507 ) ) ( not ( = ?auto_5489 ?auto_5496 ) ) ( not ( = ?auto_5491 ?auto_5497 ) ) ( not ( = ?auto_5491 ?auto_5500 ) ) ( not ( = ?auto_5491 ?auto_5501 ) ) ( not ( = ?auto_5491 ?auto_5507 ) ) ( not ( = ?auto_5491 ?auto_5496 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_5483 ?auto_5484 ?auto_5485 ?auto_5486 ?auto_5487 ?auto_5488 )
      ( MAKE-1CRATE ?auto_5488 ?auto_5489 )
      ( MAKE-6CRATE-VERIFY ?auto_5483 ?auto_5484 ?auto_5485 ?auto_5486 ?auto_5487 ?auto_5488 ?auto_5489 ) )
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
      ?auto_5533 - SURFACE
      ?auto_5534 - SURFACE
    )
    :vars
    (
      ?auto_5539 - HOIST
      ?auto_5538 - PLACE
      ?auto_5540 - PLACE
      ?auto_5535 - HOIST
      ?auto_5536 - SURFACE
      ?auto_5547 - PLACE
      ?auto_5542 - HOIST
      ?auto_5546 - SURFACE
      ?auto_5548 - SURFACE
      ?auto_5541 - PLACE
      ?auto_5556 - HOIST
      ?auto_5555 - SURFACE
      ?auto_5552 - PLACE
      ?auto_5554 - HOIST
      ?auto_5543 - SURFACE
      ?auto_5549 - PLACE
      ?auto_5551 - HOIST
      ?auto_5553 - SURFACE
      ?auto_5550 - PLACE
      ?auto_5544 - HOIST
      ?auto_5545 - SURFACE
      ?auto_5537 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5539 ?auto_5538 ) ( IS-CRATE ?auto_5534 ) ( not ( = ?auto_5540 ?auto_5538 ) ) ( HOIST-AT ?auto_5535 ?auto_5540 ) ( AVAILABLE ?auto_5535 ) ( SURFACE-AT ?auto_5534 ?auto_5540 ) ( ON ?auto_5534 ?auto_5536 ) ( CLEAR ?auto_5534 ) ( not ( = ?auto_5533 ?auto_5534 ) ) ( not ( = ?auto_5533 ?auto_5536 ) ) ( not ( = ?auto_5534 ?auto_5536 ) ) ( not ( = ?auto_5539 ?auto_5535 ) ) ( IS-CRATE ?auto_5533 ) ( not ( = ?auto_5547 ?auto_5538 ) ) ( HOIST-AT ?auto_5542 ?auto_5547 ) ( SURFACE-AT ?auto_5533 ?auto_5547 ) ( ON ?auto_5533 ?auto_5546 ) ( CLEAR ?auto_5533 ) ( not ( = ?auto_5532 ?auto_5533 ) ) ( not ( = ?auto_5532 ?auto_5546 ) ) ( not ( = ?auto_5533 ?auto_5546 ) ) ( not ( = ?auto_5539 ?auto_5542 ) ) ( IS-CRATE ?auto_5532 ) ( AVAILABLE ?auto_5542 ) ( SURFACE-AT ?auto_5532 ?auto_5547 ) ( ON ?auto_5532 ?auto_5548 ) ( CLEAR ?auto_5532 ) ( not ( = ?auto_5531 ?auto_5532 ) ) ( not ( = ?auto_5531 ?auto_5548 ) ) ( not ( = ?auto_5532 ?auto_5548 ) ) ( IS-CRATE ?auto_5531 ) ( not ( = ?auto_5541 ?auto_5538 ) ) ( HOIST-AT ?auto_5556 ?auto_5541 ) ( AVAILABLE ?auto_5556 ) ( SURFACE-AT ?auto_5531 ?auto_5541 ) ( ON ?auto_5531 ?auto_5555 ) ( CLEAR ?auto_5531 ) ( not ( = ?auto_5530 ?auto_5531 ) ) ( not ( = ?auto_5530 ?auto_5555 ) ) ( not ( = ?auto_5531 ?auto_5555 ) ) ( not ( = ?auto_5539 ?auto_5556 ) ) ( IS-CRATE ?auto_5530 ) ( not ( = ?auto_5552 ?auto_5538 ) ) ( HOIST-AT ?auto_5554 ?auto_5552 ) ( AVAILABLE ?auto_5554 ) ( SURFACE-AT ?auto_5530 ?auto_5552 ) ( ON ?auto_5530 ?auto_5543 ) ( CLEAR ?auto_5530 ) ( not ( = ?auto_5529 ?auto_5530 ) ) ( not ( = ?auto_5529 ?auto_5543 ) ) ( not ( = ?auto_5530 ?auto_5543 ) ) ( not ( = ?auto_5539 ?auto_5554 ) ) ( IS-CRATE ?auto_5529 ) ( not ( = ?auto_5549 ?auto_5538 ) ) ( HOIST-AT ?auto_5551 ?auto_5549 ) ( AVAILABLE ?auto_5551 ) ( SURFACE-AT ?auto_5529 ?auto_5549 ) ( ON ?auto_5529 ?auto_5553 ) ( CLEAR ?auto_5529 ) ( not ( = ?auto_5528 ?auto_5529 ) ) ( not ( = ?auto_5528 ?auto_5553 ) ) ( not ( = ?auto_5529 ?auto_5553 ) ) ( not ( = ?auto_5539 ?auto_5551 ) ) ( SURFACE-AT ?auto_5527 ?auto_5538 ) ( CLEAR ?auto_5527 ) ( IS-CRATE ?auto_5528 ) ( AVAILABLE ?auto_5539 ) ( not ( = ?auto_5550 ?auto_5538 ) ) ( HOIST-AT ?auto_5544 ?auto_5550 ) ( AVAILABLE ?auto_5544 ) ( SURFACE-AT ?auto_5528 ?auto_5550 ) ( ON ?auto_5528 ?auto_5545 ) ( CLEAR ?auto_5528 ) ( TRUCK-AT ?auto_5537 ?auto_5538 ) ( not ( = ?auto_5527 ?auto_5528 ) ) ( not ( = ?auto_5527 ?auto_5545 ) ) ( not ( = ?auto_5528 ?auto_5545 ) ) ( not ( = ?auto_5539 ?auto_5544 ) ) ( not ( = ?auto_5527 ?auto_5529 ) ) ( not ( = ?auto_5527 ?auto_5553 ) ) ( not ( = ?auto_5529 ?auto_5545 ) ) ( not ( = ?auto_5549 ?auto_5550 ) ) ( not ( = ?auto_5551 ?auto_5544 ) ) ( not ( = ?auto_5553 ?auto_5545 ) ) ( not ( = ?auto_5527 ?auto_5530 ) ) ( not ( = ?auto_5527 ?auto_5543 ) ) ( not ( = ?auto_5528 ?auto_5530 ) ) ( not ( = ?auto_5528 ?auto_5543 ) ) ( not ( = ?auto_5530 ?auto_5553 ) ) ( not ( = ?auto_5530 ?auto_5545 ) ) ( not ( = ?auto_5552 ?auto_5549 ) ) ( not ( = ?auto_5552 ?auto_5550 ) ) ( not ( = ?auto_5554 ?auto_5551 ) ) ( not ( = ?auto_5554 ?auto_5544 ) ) ( not ( = ?auto_5543 ?auto_5553 ) ) ( not ( = ?auto_5543 ?auto_5545 ) ) ( not ( = ?auto_5527 ?auto_5531 ) ) ( not ( = ?auto_5527 ?auto_5555 ) ) ( not ( = ?auto_5528 ?auto_5531 ) ) ( not ( = ?auto_5528 ?auto_5555 ) ) ( not ( = ?auto_5529 ?auto_5531 ) ) ( not ( = ?auto_5529 ?auto_5555 ) ) ( not ( = ?auto_5531 ?auto_5543 ) ) ( not ( = ?auto_5531 ?auto_5553 ) ) ( not ( = ?auto_5531 ?auto_5545 ) ) ( not ( = ?auto_5541 ?auto_5552 ) ) ( not ( = ?auto_5541 ?auto_5549 ) ) ( not ( = ?auto_5541 ?auto_5550 ) ) ( not ( = ?auto_5556 ?auto_5554 ) ) ( not ( = ?auto_5556 ?auto_5551 ) ) ( not ( = ?auto_5556 ?auto_5544 ) ) ( not ( = ?auto_5555 ?auto_5543 ) ) ( not ( = ?auto_5555 ?auto_5553 ) ) ( not ( = ?auto_5555 ?auto_5545 ) ) ( not ( = ?auto_5527 ?auto_5532 ) ) ( not ( = ?auto_5527 ?auto_5548 ) ) ( not ( = ?auto_5528 ?auto_5532 ) ) ( not ( = ?auto_5528 ?auto_5548 ) ) ( not ( = ?auto_5529 ?auto_5532 ) ) ( not ( = ?auto_5529 ?auto_5548 ) ) ( not ( = ?auto_5530 ?auto_5532 ) ) ( not ( = ?auto_5530 ?auto_5548 ) ) ( not ( = ?auto_5532 ?auto_5555 ) ) ( not ( = ?auto_5532 ?auto_5543 ) ) ( not ( = ?auto_5532 ?auto_5553 ) ) ( not ( = ?auto_5532 ?auto_5545 ) ) ( not ( = ?auto_5547 ?auto_5541 ) ) ( not ( = ?auto_5547 ?auto_5552 ) ) ( not ( = ?auto_5547 ?auto_5549 ) ) ( not ( = ?auto_5547 ?auto_5550 ) ) ( not ( = ?auto_5542 ?auto_5556 ) ) ( not ( = ?auto_5542 ?auto_5554 ) ) ( not ( = ?auto_5542 ?auto_5551 ) ) ( not ( = ?auto_5542 ?auto_5544 ) ) ( not ( = ?auto_5548 ?auto_5555 ) ) ( not ( = ?auto_5548 ?auto_5543 ) ) ( not ( = ?auto_5548 ?auto_5553 ) ) ( not ( = ?auto_5548 ?auto_5545 ) ) ( not ( = ?auto_5527 ?auto_5533 ) ) ( not ( = ?auto_5527 ?auto_5546 ) ) ( not ( = ?auto_5528 ?auto_5533 ) ) ( not ( = ?auto_5528 ?auto_5546 ) ) ( not ( = ?auto_5529 ?auto_5533 ) ) ( not ( = ?auto_5529 ?auto_5546 ) ) ( not ( = ?auto_5530 ?auto_5533 ) ) ( not ( = ?auto_5530 ?auto_5546 ) ) ( not ( = ?auto_5531 ?auto_5533 ) ) ( not ( = ?auto_5531 ?auto_5546 ) ) ( not ( = ?auto_5533 ?auto_5548 ) ) ( not ( = ?auto_5533 ?auto_5555 ) ) ( not ( = ?auto_5533 ?auto_5543 ) ) ( not ( = ?auto_5533 ?auto_5553 ) ) ( not ( = ?auto_5533 ?auto_5545 ) ) ( not ( = ?auto_5546 ?auto_5548 ) ) ( not ( = ?auto_5546 ?auto_5555 ) ) ( not ( = ?auto_5546 ?auto_5543 ) ) ( not ( = ?auto_5546 ?auto_5553 ) ) ( not ( = ?auto_5546 ?auto_5545 ) ) ( not ( = ?auto_5527 ?auto_5534 ) ) ( not ( = ?auto_5527 ?auto_5536 ) ) ( not ( = ?auto_5528 ?auto_5534 ) ) ( not ( = ?auto_5528 ?auto_5536 ) ) ( not ( = ?auto_5529 ?auto_5534 ) ) ( not ( = ?auto_5529 ?auto_5536 ) ) ( not ( = ?auto_5530 ?auto_5534 ) ) ( not ( = ?auto_5530 ?auto_5536 ) ) ( not ( = ?auto_5531 ?auto_5534 ) ) ( not ( = ?auto_5531 ?auto_5536 ) ) ( not ( = ?auto_5532 ?auto_5534 ) ) ( not ( = ?auto_5532 ?auto_5536 ) ) ( not ( = ?auto_5534 ?auto_5546 ) ) ( not ( = ?auto_5534 ?auto_5548 ) ) ( not ( = ?auto_5534 ?auto_5555 ) ) ( not ( = ?auto_5534 ?auto_5543 ) ) ( not ( = ?auto_5534 ?auto_5553 ) ) ( not ( = ?auto_5534 ?auto_5545 ) ) ( not ( = ?auto_5540 ?auto_5547 ) ) ( not ( = ?auto_5540 ?auto_5541 ) ) ( not ( = ?auto_5540 ?auto_5552 ) ) ( not ( = ?auto_5540 ?auto_5549 ) ) ( not ( = ?auto_5540 ?auto_5550 ) ) ( not ( = ?auto_5535 ?auto_5542 ) ) ( not ( = ?auto_5535 ?auto_5556 ) ) ( not ( = ?auto_5535 ?auto_5554 ) ) ( not ( = ?auto_5535 ?auto_5551 ) ) ( not ( = ?auto_5535 ?auto_5544 ) ) ( not ( = ?auto_5536 ?auto_5546 ) ) ( not ( = ?auto_5536 ?auto_5548 ) ) ( not ( = ?auto_5536 ?auto_5555 ) ) ( not ( = ?auto_5536 ?auto_5543 ) ) ( not ( = ?auto_5536 ?auto_5553 ) ) ( not ( = ?auto_5536 ?auto_5545 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_5527 ?auto_5528 ?auto_5529 ?auto_5530 ?auto_5531 ?auto_5532 ?auto_5533 )
      ( MAKE-1CRATE ?auto_5533 ?auto_5534 )
      ( MAKE-7CRATE-VERIFY ?auto_5527 ?auto_5528 ?auto_5529 ?auto_5530 ?auto_5531 ?auto_5532 ?auto_5533 ?auto_5534 ) )
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
      ?auto_5582 - SURFACE
      ?auto_5583 - SURFACE
      ?auto_5584 - SURFACE
    )
    :vars
    (
      ?auto_5590 - HOIST
      ?auto_5589 - PLACE
      ?auto_5585 - PLACE
      ?auto_5586 - HOIST
      ?auto_5587 - SURFACE
      ?auto_5607 - PLACE
      ?auto_5602 - HOIST
      ?auto_5591 - SURFACE
      ?auto_5593 - SURFACE
      ?auto_5597 - SURFACE
      ?auto_5606 - PLACE
      ?auto_5596 - HOIST
      ?auto_5592 - SURFACE
      ?auto_5601 - PLACE
      ?auto_5605 - HOIST
      ?auto_5600 - SURFACE
      ?auto_5603 - PLACE
      ?auto_5594 - HOIST
      ?auto_5595 - SURFACE
      ?auto_5604 - PLACE
      ?auto_5599 - HOIST
      ?auto_5598 - SURFACE
      ?auto_5588 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5590 ?auto_5589 ) ( IS-CRATE ?auto_5584 ) ( not ( = ?auto_5585 ?auto_5589 ) ) ( HOIST-AT ?auto_5586 ?auto_5585 ) ( SURFACE-AT ?auto_5584 ?auto_5585 ) ( ON ?auto_5584 ?auto_5587 ) ( CLEAR ?auto_5584 ) ( not ( = ?auto_5583 ?auto_5584 ) ) ( not ( = ?auto_5583 ?auto_5587 ) ) ( not ( = ?auto_5584 ?auto_5587 ) ) ( not ( = ?auto_5590 ?auto_5586 ) ) ( IS-CRATE ?auto_5583 ) ( not ( = ?auto_5607 ?auto_5589 ) ) ( HOIST-AT ?auto_5602 ?auto_5607 ) ( AVAILABLE ?auto_5602 ) ( SURFACE-AT ?auto_5583 ?auto_5607 ) ( ON ?auto_5583 ?auto_5591 ) ( CLEAR ?auto_5583 ) ( not ( = ?auto_5582 ?auto_5583 ) ) ( not ( = ?auto_5582 ?auto_5591 ) ) ( not ( = ?auto_5583 ?auto_5591 ) ) ( not ( = ?auto_5590 ?auto_5602 ) ) ( IS-CRATE ?auto_5582 ) ( SURFACE-AT ?auto_5582 ?auto_5585 ) ( ON ?auto_5582 ?auto_5593 ) ( CLEAR ?auto_5582 ) ( not ( = ?auto_5581 ?auto_5582 ) ) ( not ( = ?auto_5581 ?auto_5593 ) ) ( not ( = ?auto_5582 ?auto_5593 ) ) ( IS-CRATE ?auto_5581 ) ( AVAILABLE ?auto_5586 ) ( SURFACE-AT ?auto_5581 ?auto_5585 ) ( ON ?auto_5581 ?auto_5597 ) ( CLEAR ?auto_5581 ) ( not ( = ?auto_5580 ?auto_5581 ) ) ( not ( = ?auto_5580 ?auto_5597 ) ) ( not ( = ?auto_5581 ?auto_5597 ) ) ( IS-CRATE ?auto_5580 ) ( not ( = ?auto_5606 ?auto_5589 ) ) ( HOIST-AT ?auto_5596 ?auto_5606 ) ( AVAILABLE ?auto_5596 ) ( SURFACE-AT ?auto_5580 ?auto_5606 ) ( ON ?auto_5580 ?auto_5592 ) ( CLEAR ?auto_5580 ) ( not ( = ?auto_5579 ?auto_5580 ) ) ( not ( = ?auto_5579 ?auto_5592 ) ) ( not ( = ?auto_5580 ?auto_5592 ) ) ( not ( = ?auto_5590 ?auto_5596 ) ) ( IS-CRATE ?auto_5579 ) ( not ( = ?auto_5601 ?auto_5589 ) ) ( HOIST-AT ?auto_5605 ?auto_5601 ) ( AVAILABLE ?auto_5605 ) ( SURFACE-AT ?auto_5579 ?auto_5601 ) ( ON ?auto_5579 ?auto_5600 ) ( CLEAR ?auto_5579 ) ( not ( = ?auto_5578 ?auto_5579 ) ) ( not ( = ?auto_5578 ?auto_5600 ) ) ( not ( = ?auto_5579 ?auto_5600 ) ) ( not ( = ?auto_5590 ?auto_5605 ) ) ( IS-CRATE ?auto_5578 ) ( not ( = ?auto_5603 ?auto_5589 ) ) ( HOIST-AT ?auto_5594 ?auto_5603 ) ( AVAILABLE ?auto_5594 ) ( SURFACE-AT ?auto_5578 ?auto_5603 ) ( ON ?auto_5578 ?auto_5595 ) ( CLEAR ?auto_5578 ) ( not ( = ?auto_5577 ?auto_5578 ) ) ( not ( = ?auto_5577 ?auto_5595 ) ) ( not ( = ?auto_5578 ?auto_5595 ) ) ( not ( = ?auto_5590 ?auto_5594 ) ) ( SURFACE-AT ?auto_5576 ?auto_5589 ) ( CLEAR ?auto_5576 ) ( IS-CRATE ?auto_5577 ) ( AVAILABLE ?auto_5590 ) ( not ( = ?auto_5604 ?auto_5589 ) ) ( HOIST-AT ?auto_5599 ?auto_5604 ) ( AVAILABLE ?auto_5599 ) ( SURFACE-AT ?auto_5577 ?auto_5604 ) ( ON ?auto_5577 ?auto_5598 ) ( CLEAR ?auto_5577 ) ( TRUCK-AT ?auto_5588 ?auto_5589 ) ( not ( = ?auto_5576 ?auto_5577 ) ) ( not ( = ?auto_5576 ?auto_5598 ) ) ( not ( = ?auto_5577 ?auto_5598 ) ) ( not ( = ?auto_5590 ?auto_5599 ) ) ( not ( = ?auto_5576 ?auto_5578 ) ) ( not ( = ?auto_5576 ?auto_5595 ) ) ( not ( = ?auto_5578 ?auto_5598 ) ) ( not ( = ?auto_5603 ?auto_5604 ) ) ( not ( = ?auto_5594 ?auto_5599 ) ) ( not ( = ?auto_5595 ?auto_5598 ) ) ( not ( = ?auto_5576 ?auto_5579 ) ) ( not ( = ?auto_5576 ?auto_5600 ) ) ( not ( = ?auto_5577 ?auto_5579 ) ) ( not ( = ?auto_5577 ?auto_5600 ) ) ( not ( = ?auto_5579 ?auto_5595 ) ) ( not ( = ?auto_5579 ?auto_5598 ) ) ( not ( = ?auto_5601 ?auto_5603 ) ) ( not ( = ?auto_5601 ?auto_5604 ) ) ( not ( = ?auto_5605 ?auto_5594 ) ) ( not ( = ?auto_5605 ?auto_5599 ) ) ( not ( = ?auto_5600 ?auto_5595 ) ) ( not ( = ?auto_5600 ?auto_5598 ) ) ( not ( = ?auto_5576 ?auto_5580 ) ) ( not ( = ?auto_5576 ?auto_5592 ) ) ( not ( = ?auto_5577 ?auto_5580 ) ) ( not ( = ?auto_5577 ?auto_5592 ) ) ( not ( = ?auto_5578 ?auto_5580 ) ) ( not ( = ?auto_5578 ?auto_5592 ) ) ( not ( = ?auto_5580 ?auto_5600 ) ) ( not ( = ?auto_5580 ?auto_5595 ) ) ( not ( = ?auto_5580 ?auto_5598 ) ) ( not ( = ?auto_5606 ?auto_5601 ) ) ( not ( = ?auto_5606 ?auto_5603 ) ) ( not ( = ?auto_5606 ?auto_5604 ) ) ( not ( = ?auto_5596 ?auto_5605 ) ) ( not ( = ?auto_5596 ?auto_5594 ) ) ( not ( = ?auto_5596 ?auto_5599 ) ) ( not ( = ?auto_5592 ?auto_5600 ) ) ( not ( = ?auto_5592 ?auto_5595 ) ) ( not ( = ?auto_5592 ?auto_5598 ) ) ( not ( = ?auto_5576 ?auto_5581 ) ) ( not ( = ?auto_5576 ?auto_5597 ) ) ( not ( = ?auto_5577 ?auto_5581 ) ) ( not ( = ?auto_5577 ?auto_5597 ) ) ( not ( = ?auto_5578 ?auto_5581 ) ) ( not ( = ?auto_5578 ?auto_5597 ) ) ( not ( = ?auto_5579 ?auto_5581 ) ) ( not ( = ?auto_5579 ?auto_5597 ) ) ( not ( = ?auto_5581 ?auto_5592 ) ) ( not ( = ?auto_5581 ?auto_5600 ) ) ( not ( = ?auto_5581 ?auto_5595 ) ) ( not ( = ?auto_5581 ?auto_5598 ) ) ( not ( = ?auto_5585 ?auto_5606 ) ) ( not ( = ?auto_5585 ?auto_5601 ) ) ( not ( = ?auto_5585 ?auto_5603 ) ) ( not ( = ?auto_5585 ?auto_5604 ) ) ( not ( = ?auto_5586 ?auto_5596 ) ) ( not ( = ?auto_5586 ?auto_5605 ) ) ( not ( = ?auto_5586 ?auto_5594 ) ) ( not ( = ?auto_5586 ?auto_5599 ) ) ( not ( = ?auto_5597 ?auto_5592 ) ) ( not ( = ?auto_5597 ?auto_5600 ) ) ( not ( = ?auto_5597 ?auto_5595 ) ) ( not ( = ?auto_5597 ?auto_5598 ) ) ( not ( = ?auto_5576 ?auto_5582 ) ) ( not ( = ?auto_5576 ?auto_5593 ) ) ( not ( = ?auto_5577 ?auto_5582 ) ) ( not ( = ?auto_5577 ?auto_5593 ) ) ( not ( = ?auto_5578 ?auto_5582 ) ) ( not ( = ?auto_5578 ?auto_5593 ) ) ( not ( = ?auto_5579 ?auto_5582 ) ) ( not ( = ?auto_5579 ?auto_5593 ) ) ( not ( = ?auto_5580 ?auto_5582 ) ) ( not ( = ?auto_5580 ?auto_5593 ) ) ( not ( = ?auto_5582 ?auto_5597 ) ) ( not ( = ?auto_5582 ?auto_5592 ) ) ( not ( = ?auto_5582 ?auto_5600 ) ) ( not ( = ?auto_5582 ?auto_5595 ) ) ( not ( = ?auto_5582 ?auto_5598 ) ) ( not ( = ?auto_5593 ?auto_5597 ) ) ( not ( = ?auto_5593 ?auto_5592 ) ) ( not ( = ?auto_5593 ?auto_5600 ) ) ( not ( = ?auto_5593 ?auto_5595 ) ) ( not ( = ?auto_5593 ?auto_5598 ) ) ( not ( = ?auto_5576 ?auto_5583 ) ) ( not ( = ?auto_5576 ?auto_5591 ) ) ( not ( = ?auto_5577 ?auto_5583 ) ) ( not ( = ?auto_5577 ?auto_5591 ) ) ( not ( = ?auto_5578 ?auto_5583 ) ) ( not ( = ?auto_5578 ?auto_5591 ) ) ( not ( = ?auto_5579 ?auto_5583 ) ) ( not ( = ?auto_5579 ?auto_5591 ) ) ( not ( = ?auto_5580 ?auto_5583 ) ) ( not ( = ?auto_5580 ?auto_5591 ) ) ( not ( = ?auto_5581 ?auto_5583 ) ) ( not ( = ?auto_5581 ?auto_5591 ) ) ( not ( = ?auto_5583 ?auto_5593 ) ) ( not ( = ?auto_5583 ?auto_5597 ) ) ( not ( = ?auto_5583 ?auto_5592 ) ) ( not ( = ?auto_5583 ?auto_5600 ) ) ( not ( = ?auto_5583 ?auto_5595 ) ) ( not ( = ?auto_5583 ?auto_5598 ) ) ( not ( = ?auto_5607 ?auto_5585 ) ) ( not ( = ?auto_5607 ?auto_5606 ) ) ( not ( = ?auto_5607 ?auto_5601 ) ) ( not ( = ?auto_5607 ?auto_5603 ) ) ( not ( = ?auto_5607 ?auto_5604 ) ) ( not ( = ?auto_5602 ?auto_5586 ) ) ( not ( = ?auto_5602 ?auto_5596 ) ) ( not ( = ?auto_5602 ?auto_5605 ) ) ( not ( = ?auto_5602 ?auto_5594 ) ) ( not ( = ?auto_5602 ?auto_5599 ) ) ( not ( = ?auto_5591 ?auto_5593 ) ) ( not ( = ?auto_5591 ?auto_5597 ) ) ( not ( = ?auto_5591 ?auto_5592 ) ) ( not ( = ?auto_5591 ?auto_5600 ) ) ( not ( = ?auto_5591 ?auto_5595 ) ) ( not ( = ?auto_5591 ?auto_5598 ) ) ( not ( = ?auto_5576 ?auto_5584 ) ) ( not ( = ?auto_5576 ?auto_5587 ) ) ( not ( = ?auto_5577 ?auto_5584 ) ) ( not ( = ?auto_5577 ?auto_5587 ) ) ( not ( = ?auto_5578 ?auto_5584 ) ) ( not ( = ?auto_5578 ?auto_5587 ) ) ( not ( = ?auto_5579 ?auto_5584 ) ) ( not ( = ?auto_5579 ?auto_5587 ) ) ( not ( = ?auto_5580 ?auto_5584 ) ) ( not ( = ?auto_5580 ?auto_5587 ) ) ( not ( = ?auto_5581 ?auto_5584 ) ) ( not ( = ?auto_5581 ?auto_5587 ) ) ( not ( = ?auto_5582 ?auto_5584 ) ) ( not ( = ?auto_5582 ?auto_5587 ) ) ( not ( = ?auto_5584 ?auto_5591 ) ) ( not ( = ?auto_5584 ?auto_5593 ) ) ( not ( = ?auto_5584 ?auto_5597 ) ) ( not ( = ?auto_5584 ?auto_5592 ) ) ( not ( = ?auto_5584 ?auto_5600 ) ) ( not ( = ?auto_5584 ?auto_5595 ) ) ( not ( = ?auto_5584 ?auto_5598 ) ) ( not ( = ?auto_5587 ?auto_5591 ) ) ( not ( = ?auto_5587 ?auto_5593 ) ) ( not ( = ?auto_5587 ?auto_5597 ) ) ( not ( = ?auto_5587 ?auto_5592 ) ) ( not ( = ?auto_5587 ?auto_5600 ) ) ( not ( = ?auto_5587 ?auto_5595 ) ) ( not ( = ?auto_5587 ?auto_5598 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_5576 ?auto_5577 ?auto_5578 ?auto_5579 ?auto_5580 ?auto_5581 ?auto_5582 ?auto_5583 )
      ( MAKE-1CRATE ?auto_5583 ?auto_5584 )
      ( MAKE-8CRATE-VERIFY ?auto_5576 ?auto_5577 ?auto_5578 ?auto_5579 ?auto_5580 ?auto_5581 ?auto_5582 ?auto_5583 ?auto_5584 ) )
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
      ?auto_5634 - SURFACE
      ?auto_5635 - SURFACE
      ?auto_5636 - SURFACE
      ?auto_5637 - SURFACE
    )
    :vars
    (
      ?auto_5641 - HOIST
      ?auto_5643 - PLACE
      ?auto_5642 - PLACE
      ?auto_5638 - HOIST
      ?auto_5640 - SURFACE
      ?auto_5650 - SURFACE
      ?auto_5653 - PLACE
      ?auto_5649 - HOIST
      ?auto_5654 - SURFACE
      ?auto_5660 - SURFACE
      ?auto_5646 - SURFACE
      ?auto_5652 - PLACE
      ?auto_5647 - HOIST
      ?auto_5656 - SURFACE
      ?auto_5644 - PLACE
      ?auto_5659 - HOIST
      ?auto_5645 - SURFACE
      ?auto_5648 - PLACE
      ?auto_5661 - HOIST
      ?auto_5658 - SURFACE
      ?auto_5651 - PLACE
      ?auto_5655 - HOIST
      ?auto_5657 - SURFACE
      ?auto_5639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5641 ?auto_5643 ) ( IS-CRATE ?auto_5637 ) ( not ( = ?auto_5642 ?auto_5643 ) ) ( HOIST-AT ?auto_5638 ?auto_5642 ) ( SURFACE-AT ?auto_5637 ?auto_5642 ) ( ON ?auto_5637 ?auto_5640 ) ( CLEAR ?auto_5637 ) ( not ( = ?auto_5636 ?auto_5637 ) ) ( not ( = ?auto_5636 ?auto_5640 ) ) ( not ( = ?auto_5637 ?auto_5640 ) ) ( not ( = ?auto_5641 ?auto_5638 ) ) ( IS-CRATE ?auto_5636 ) ( SURFACE-AT ?auto_5636 ?auto_5642 ) ( ON ?auto_5636 ?auto_5650 ) ( CLEAR ?auto_5636 ) ( not ( = ?auto_5635 ?auto_5636 ) ) ( not ( = ?auto_5635 ?auto_5650 ) ) ( not ( = ?auto_5636 ?auto_5650 ) ) ( IS-CRATE ?auto_5635 ) ( not ( = ?auto_5653 ?auto_5643 ) ) ( HOIST-AT ?auto_5649 ?auto_5653 ) ( AVAILABLE ?auto_5649 ) ( SURFACE-AT ?auto_5635 ?auto_5653 ) ( ON ?auto_5635 ?auto_5654 ) ( CLEAR ?auto_5635 ) ( not ( = ?auto_5634 ?auto_5635 ) ) ( not ( = ?auto_5634 ?auto_5654 ) ) ( not ( = ?auto_5635 ?auto_5654 ) ) ( not ( = ?auto_5641 ?auto_5649 ) ) ( IS-CRATE ?auto_5634 ) ( SURFACE-AT ?auto_5634 ?auto_5642 ) ( ON ?auto_5634 ?auto_5660 ) ( CLEAR ?auto_5634 ) ( not ( = ?auto_5633 ?auto_5634 ) ) ( not ( = ?auto_5633 ?auto_5660 ) ) ( not ( = ?auto_5634 ?auto_5660 ) ) ( IS-CRATE ?auto_5633 ) ( AVAILABLE ?auto_5638 ) ( SURFACE-AT ?auto_5633 ?auto_5642 ) ( ON ?auto_5633 ?auto_5646 ) ( CLEAR ?auto_5633 ) ( not ( = ?auto_5632 ?auto_5633 ) ) ( not ( = ?auto_5632 ?auto_5646 ) ) ( not ( = ?auto_5633 ?auto_5646 ) ) ( IS-CRATE ?auto_5632 ) ( not ( = ?auto_5652 ?auto_5643 ) ) ( HOIST-AT ?auto_5647 ?auto_5652 ) ( AVAILABLE ?auto_5647 ) ( SURFACE-AT ?auto_5632 ?auto_5652 ) ( ON ?auto_5632 ?auto_5656 ) ( CLEAR ?auto_5632 ) ( not ( = ?auto_5631 ?auto_5632 ) ) ( not ( = ?auto_5631 ?auto_5656 ) ) ( not ( = ?auto_5632 ?auto_5656 ) ) ( not ( = ?auto_5641 ?auto_5647 ) ) ( IS-CRATE ?auto_5631 ) ( not ( = ?auto_5644 ?auto_5643 ) ) ( HOIST-AT ?auto_5659 ?auto_5644 ) ( AVAILABLE ?auto_5659 ) ( SURFACE-AT ?auto_5631 ?auto_5644 ) ( ON ?auto_5631 ?auto_5645 ) ( CLEAR ?auto_5631 ) ( not ( = ?auto_5630 ?auto_5631 ) ) ( not ( = ?auto_5630 ?auto_5645 ) ) ( not ( = ?auto_5631 ?auto_5645 ) ) ( not ( = ?auto_5641 ?auto_5659 ) ) ( IS-CRATE ?auto_5630 ) ( not ( = ?auto_5648 ?auto_5643 ) ) ( HOIST-AT ?auto_5661 ?auto_5648 ) ( AVAILABLE ?auto_5661 ) ( SURFACE-AT ?auto_5630 ?auto_5648 ) ( ON ?auto_5630 ?auto_5658 ) ( CLEAR ?auto_5630 ) ( not ( = ?auto_5629 ?auto_5630 ) ) ( not ( = ?auto_5629 ?auto_5658 ) ) ( not ( = ?auto_5630 ?auto_5658 ) ) ( not ( = ?auto_5641 ?auto_5661 ) ) ( SURFACE-AT ?auto_5628 ?auto_5643 ) ( CLEAR ?auto_5628 ) ( IS-CRATE ?auto_5629 ) ( AVAILABLE ?auto_5641 ) ( not ( = ?auto_5651 ?auto_5643 ) ) ( HOIST-AT ?auto_5655 ?auto_5651 ) ( AVAILABLE ?auto_5655 ) ( SURFACE-AT ?auto_5629 ?auto_5651 ) ( ON ?auto_5629 ?auto_5657 ) ( CLEAR ?auto_5629 ) ( TRUCK-AT ?auto_5639 ?auto_5643 ) ( not ( = ?auto_5628 ?auto_5629 ) ) ( not ( = ?auto_5628 ?auto_5657 ) ) ( not ( = ?auto_5629 ?auto_5657 ) ) ( not ( = ?auto_5641 ?auto_5655 ) ) ( not ( = ?auto_5628 ?auto_5630 ) ) ( not ( = ?auto_5628 ?auto_5658 ) ) ( not ( = ?auto_5630 ?auto_5657 ) ) ( not ( = ?auto_5648 ?auto_5651 ) ) ( not ( = ?auto_5661 ?auto_5655 ) ) ( not ( = ?auto_5658 ?auto_5657 ) ) ( not ( = ?auto_5628 ?auto_5631 ) ) ( not ( = ?auto_5628 ?auto_5645 ) ) ( not ( = ?auto_5629 ?auto_5631 ) ) ( not ( = ?auto_5629 ?auto_5645 ) ) ( not ( = ?auto_5631 ?auto_5658 ) ) ( not ( = ?auto_5631 ?auto_5657 ) ) ( not ( = ?auto_5644 ?auto_5648 ) ) ( not ( = ?auto_5644 ?auto_5651 ) ) ( not ( = ?auto_5659 ?auto_5661 ) ) ( not ( = ?auto_5659 ?auto_5655 ) ) ( not ( = ?auto_5645 ?auto_5658 ) ) ( not ( = ?auto_5645 ?auto_5657 ) ) ( not ( = ?auto_5628 ?auto_5632 ) ) ( not ( = ?auto_5628 ?auto_5656 ) ) ( not ( = ?auto_5629 ?auto_5632 ) ) ( not ( = ?auto_5629 ?auto_5656 ) ) ( not ( = ?auto_5630 ?auto_5632 ) ) ( not ( = ?auto_5630 ?auto_5656 ) ) ( not ( = ?auto_5632 ?auto_5645 ) ) ( not ( = ?auto_5632 ?auto_5658 ) ) ( not ( = ?auto_5632 ?auto_5657 ) ) ( not ( = ?auto_5652 ?auto_5644 ) ) ( not ( = ?auto_5652 ?auto_5648 ) ) ( not ( = ?auto_5652 ?auto_5651 ) ) ( not ( = ?auto_5647 ?auto_5659 ) ) ( not ( = ?auto_5647 ?auto_5661 ) ) ( not ( = ?auto_5647 ?auto_5655 ) ) ( not ( = ?auto_5656 ?auto_5645 ) ) ( not ( = ?auto_5656 ?auto_5658 ) ) ( not ( = ?auto_5656 ?auto_5657 ) ) ( not ( = ?auto_5628 ?auto_5633 ) ) ( not ( = ?auto_5628 ?auto_5646 ) ) ( not ( = ?auto_5629 ?auto_5633 ) ) ( not ( = ?auto_5629 ?auto_5646 ) ) ( not ( = ?auto_5630 ?auto_5633 ) ) ( not ( = ?auto_5630 ?auto_5646 ) ) ( not ( = ?auto_5631 ?auto_5633 ) ) ( not ( = ?auto_5631 ?auto_5646 ) ) ( not ( = ?auto_5633 ?auto_5656 ) ) ( not ( = ?auto_5633 ?auto_5645 ) ) ( not ( = ?auto_5633 ?auto_5658 ) ) ( not ( = ?auto_5633 ?auto_5657 ) ) ( not ( = ?auto_5642 ?auto_5652 ) ) ( not ( = ?auto_5642 ?auto_5644 ) ) ( not ( = ?auto_5642 ?auto_5648 ) ) ( not ( = ?auto_5642 ?auto_5651 ) ) ( not ( = ?auto_5638 ?auto_5647 ) ) ( not ( = ?auto_5638 ?auto_5659 ) ) ( not ( = ?auto_5638 ?auto_5661 ) ) ( not ( = ?auto_5638 ?auto_5655 ) ) ( not ( = ?auto_5646 ?auto_5656 ) ) ( not ( = ?auto_5646 ?auto_5645 ) ) ( not ( = ?auto_5646 ?auto_5658 ) ) ( not ( = ?auto_5646 ?auto_5657 ) ) ( not ( = ?auto_5628 ?auto_5634 ) ) ( not ( = ?auto_5628 ?auto_5660 ) ) ( not ( = ?auto_5629 ?auto_5634 ) ) ( not ( = ?auto_5629 ?auto_5660 ) ) ( not ( = ?auto_5630 ?auto_5634 ) ) ( not ( = ?auto_5630 ?auto_5660 ) ) ( not ( = ?auto_5631 ?auto_5634 ) ) ( not ( = ?auto_5631 ?auto_5660 ) ) ( not ( = ?auto_5632 ?auto_5634 ) ) ( not ( = ?auto_5632 ?auto_5660 ) ) ( not ( = ?auto_5634 ?auto_5646 ) ) ( not ( = ?auto_5634 ?auto_5656 ) ) ( not ( = ?auto_5634 ?auto_5645 ) ) ( not ( = ?auto_5634 ?auto_5658 ) ) ( not ( = ?auto_5634 ?auto_5657 ) ) ( not ( = ?auto_5660 ?auto_5646 ) ) ( not ( = ?auto_5660 ?auto_5656 ) ) ( not ( = ?auto_5660 ?auto_5645 ) ) ( not ( = ?auto_5660 ?auto_5658 ) ) ( not ( = ?auto_5660 ?auto_5657 ) ) ( not ( = ?auto_5628 ?auto_5635 ) ) ( not ( = ?auto_5628 ?auto_5654 ) ) ( not ( = ?auto_5629 ?auto_5635 ) ) ( not ( = ?auto_5629 ?auto_5654 ) ) ( not ( = ?auto_5630 ?auto_5635 ) ) ( not ( = ?auto_5630 ?auto_5654 ) ) ( not ( = ?auto_5631 ?auto_5635 ) ) ( not ( = ?auto_5631 ?auto_5654 ) ) ( not ( = ?auto_5632 ?auto_5635 ) ) ( not ( = ?auto_5632 ?auto_5654 ) ) ( not ( = ?auto_5633 ?auto_5635 ) ) ( not ( = ?auto_5633 ?auto_5654 ) ) ( not ( = ?auto_5635 ?auto_5660 ) ) ( not ( = ?auto_5635 ?auto_5646 ) ) ( not ( = ?auto_5635 ?auto_5656 ) ) ( not ( = ?auto_5635 ?auto_5645 ) ) ( not ( = ?auto_5635 ?auto_5658 ) ) ( not ( = ?auto_5635 ?auto_5657 ) ) ( not ( = ?auto_5653 ?auto_5642 ) ) ( not ( = ?auto_5653 ?auto_5652 ) ) ( not ( = ?auto_5653 ?auto_5644 ) ) ( not ( = ?auto_5653 ?auto_5648 ) ) ( not ( = ?auto_5653 ?auto_5651 ) ) ( not ( = ?auto_5649 ?auto_5638 ) ) ( not ( = ?auto_5649 ?auto_5647 ) ) ( not ( = ?auto_5649 ?auto_5659 ) ) ( not ( = ?auto_5649 ?auto_5661 ) ) ( not ( = ?auto_5649 ?auto_5655 ) ) ( not ( = ?auto_5654 ?auto_5660 ) ) ( not ( = ?auto_5654 ?auto_5646 ) ) ( not ( = ?auto_5654 ?auto_5656 ) ) ( not ( = ?auto_5654 ?auto_5645 ) ) ( not ( = ?auto_5654 ?auto_5658 ) ) ( not ( = ?auto_5654 ?auto_5657 ) ) ( not ( = ?auto_5628 ?auto_5636 ) ) ( not ( = ?auto_5628 ?auto_5650 ) ) ( not ( = ?auto_5629 ?auto_5636 ) ) ( not ( = ?auto_5629 ?auto_5650 ) ) ( not ( = ?auto_5630 ?auto_5636 ) ) ( not ( = ?auto_5630 ?auto_5650 ) ) ( not ( = ?auto_5631 ?auto_5636 ) ) ( not ( = ?auto_5631 ?auto_5650 ) ) ( not ( = ?auto_5632 ?auto_5636 ) ) ( not ( = ?auto_5632 ?auto_5650 ) ) ( not ( = ?auto_5633 ?auto_5636 ) ) ( not ( = ?auto_5633 ?auto_5650 ) ) ( not ( = ?auto_5634 ?auto_5636 ) ) ( not ( = ?auto_5634 ?auto_5650 ) ) ( not ( = ?auto_5636 ?auto_5654 ) ) ( not ( = ?auto_5636 ?auto_5660 ) ) ( not ( = ?auto_5636 ?auto_5646 ) ) ( not ( = ?auto_5636 ?auto_5656 ) ) ( not ( = ?auto_5636 ?auto_5645 ) ) ( not ( = ?auto_5636 ?auto_5658 ) ) ( not ( = ?auto_5636 ?auto_5657 ) ) ( not ( = ?auto_5650 ?auto_5654 ) ) ( not ( = ?auto_5650 ?auto_5660 ) ) ( not ( = ?auto_5650 ?auto_5646 ) ) ( not ( = ?auto_5650 ?auto_5656 ) ) ( not ( = ?auto_5650 ?auto_5645 ) ) ( not ( = ?auto_5650 ?auto_5658 ) ) ( not ( = ?auto_5650 ?auto_5657 ) ) ( not ( = ?auto_5628 ?auto_5637 ) ) ( not ( = ?auto_5628 ?auto_5640 ) ) ( not ( = ?auto_5629 ?auto_5637 ) ) ( not ( = ?auto_5629 ?auto_5640 ) ) ( not ( = ?auto_5630 ?auto_5637 ) ) ( not ( = ?auto_5630 ?auto_5640 ) ) ( not ( = ?auto_5631 ?auto_5637 ) ) ( not ( = ?auto_5631 ?auto_5640 ) ) ( not ( = ?auto_5632 ?auto_5637 ) ) ( not ( = ?auto_5632 ?auto_5640 ) ) ( not ( = ?auto_5633 ?auto_5637 ) ) ( not ( = ?auto_5633 ?auto_5640 ) ) ( not ( = ?auto_5634 ?auto_5637 ) ) ( not ( = ?auto_5634 ?auto_5640 ) ) ( not ( = ?auto_5635 ?auto_5637 ) ) ( not ( = ?auto_5635 ?auto_5640 ) ) ( not ( = ?auto_5637 ?auto_5650 ) ) ( not ( = ?auto_5637 ?auto_5654 ) ) ( not ( = ?auto_5637 ?auto_5660 ) ) ( not ( = ?auto_5637 ?auto_5646 ) ) ( not ( = ?auto_5637 ?auto_5656 ) ) ( not ( = ?auto_5637 ?auto_5645 ) ) ( not ( = ?auto_5637 ?auto_5658 ) ) ( not ( = ?auto_5637 ?auto_5657 ) ) ( not ( = ?auto_5640 ?auto_5650 ) ) ( not ( = ?auto_5640 ?auto_5654 ) ) ( not ( = ?auto_5640 ?auto_5660 ) ) ( not ( = ?auto_5640 ?auto_5646 ) ) ( not ( = ?auto_5640 ?auto_5656 ) ) ( not ( = ?auto_5640 ?auto_5645 ) ) ( not ( = ?auto_5640 ?auto_5658 ) ) ( not ( = ?auto_5640 ?auto_5657 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_5628 ?auto_5629 ?auto_5630 ?auto_5631 ?auto_5632 ?auto_5633 ?auto_5634 ?auto_5635 ?auto_5636 )
      ( MAKE-1CRATE ?auto_5636 ?auto_5637 )
      ( MAKE-9CRATE-VERIFY ?auto_5628 ?auto_5629 ?auto_5630 ?auto_5631 ?auto_5632 ?auto_5633 ?auto_5634 ?auto_5635 ?auto_5636 ?auto_5637 ) )
  )

)

