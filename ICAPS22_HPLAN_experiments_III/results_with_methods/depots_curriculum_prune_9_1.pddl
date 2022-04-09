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
      ?auto_5354 - HOIST
      ?auto_5355 - PLACE
      ?auto_5356 - PLACE
      ?auto_5352 - HOIST
      ?auto_5353 - SURFACE
      ?auto_5360 - PLACE
      ?auto_5358 - HOIST
      ?auto_5359 - SURFACE
      ?auto_5357 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5354 ?auto_5355 ) ( IS-CRATE ?auto_5351 ) ( not ( = ?auto_5356 ?auto_5355 ) ) ( HOIST-AT ?auto_5352 ?auto_5356 ) ( AVAILABLE ?auto_5352 ) ( SURFACE-AT ?auto_5351 ?auto_5356 ) ( ON ?auto_5351 ?auto_5353 ) ( CLEAR ?auto_5351 ) ( not ( = ?auto_5350 ?auto_5351 ) ) ( not ( = ?auto_5350 ?auto_5353 ) ) ( not ( = ?auto_5351 ?auto_5353 ) ) ( not ( = ?auto_5354 ?auto_5352 ) ) ( SURFACE-AT ?auto_5349 ?auto_5355 ) ( CLEAR ?auto_5349 ) ( IS-CRATE ?auto_5350 ) ( AVAILABLE ?auto_5354 ) ( not ( = ?auto_5360 ?auto_5355 ) ) ( HOIST-AT ?auto_5358 ?auto_5360 ) ( AVAILABLE ?auto_5358 ) ( SURFACE-AT ?auto_5350 ?auto_5360 ) ( ON ?auto_5350 ?auto_5359 ) ( CLEAR ?auto_5350 ) ( TRUCK-AT ?auto_5357 ?auto_5355 ) ( not ( = ?auto_5349 ?auto_5350 ) ) ( not ( = ?auto_5349 ?auto_5359 ) ) ( not ( = ?auto_5350 ?auto_5359 ) ) ( not ( = ?auto_5354 ?auto_5358 ) ) ( not ( = ?auto_5349 ?auto_5351 ) ) ( not ( = ?auto_5349 ?auto_5353 ) ) ( not ( = ?auto_5351 ?auto_5359 ) ) ( not ( = ?auto_5356 ?auto_5360 ) ) ( not ( = ?auto_5352 ?auto_5358 ) ) ( not ( = ?auto_5353 ?auto_5359 ) ) )
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
      ?auto_5379 - HOIST
      ?auto_5382 - PLACE
      ?auto_5383 - PLACE
      ?auto_5381 - HOIST
      ?auto_5380 - SURFACE
      ?auto_5388 - PLACE
      ?auto_5385 - HOIST
      ?auto_5386 - SURFACE
      ?auto_5387 - PLACE
      ?auto_5389 - HOIST
      ?auto_5390 - SURFACE
      ?auto_5384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5379 ?auto_5382 ) ( IS-CRATE ?auto_5378 ) ( not ( = ?auto_5383 ?auto_5382 ) ) ( HOIST-AT ?auto_5381 ?auto_5383 ) ( AVAILABLE ?auto_5381 ) ( SURFACE-AT ?auto_5378 ?auto_5383 ) ( ON ?auto_5378 ?auto_5380 ) ( CLEAR ?auto_5378 ) ( not ( = ?auto_5377 ?auto_5378 ) ) ( not ( = ?auto_5377 ?auto_5380 ) ) ( not ( = ?auto_5378 ?auto_5380 ) ) ( not ( = ?auto_5379 ?auto_5381 ) ) ( IS-CRATE ?auto_5377 ) ( not ( = ?auto_5388 ?auto_5382 ) ) ( HOIST-AT ?auto_5385 ?auto_5388 ) ( AVAILABLE ?auto_5385 ) ( SURFACE-AT ?auto_5377 ?auto_5388 ) ( ON ?auto_5377 ?auto_5386 ) ( CLEAR ?auto_5377 ) ( not ( = ?auto_5376 ?auto_5377 ) ) ( not ( = ?auto_5376 ?auto_5386 ) ) ( not ( = ?auto_5377 ?auto_5386 ) ) ( not ( = ?auto_5379 ?auto_5385 ) ) ( SURFACE-AT ?auto_5375 ?auto_5382 ) ( CLEAR ?auto_5375 ) ( IS-CRATE ?auto_5376 ) ( AVAILABLE ?auto_5379 ) ( not ( = ?auto_5387 ?auto_5382 ) ) ( HOIST-AT ?auto_5389 ?auto_5387 ) ( AVAILABLE ?auto_5389 ) ( SURFACE-AT ?auto_5376 ?auto_5387 ) ( ON ?auto_5376 ?auto_5390 ) ( CLEAR ?auto_5376 ) ( TRUCK-AT ?auto_5384 ?auto_5382 ) ( not ( = ?auto_5375 ?auto_5376 ) ) ( not ( = ?auto_5375 ?auto_5390 ) ) ( not ( = ?auto_5376 ?auto_5390 ) ) ( not ( = ?auto_5379 ?auto_5389 ) ) ( not ( = ?auto_5375 ?auto_5377 ) ) ( not ( = ?auto_5375 ?auto_5386 ) ) ( not ( = ?auto_5377 ?auto_5390 ) ) ( not ( = ?auto_5388 ?auto_5387 ) ) ( not ( = ?auto_5385 ?auto_5389 ) ) ( not ( = ?auto_5386 ?auto_5390 ) ) ( not ( = ?auto_5375 ?auto_5378 ) ) ( not ( = ?auto_5375 ?auto_5380 ) ) ( not ( = ?auto_5376 ?auto_5378 ) ) ( not ( = ?auto_5376 ?auto_5380 ) ) ( not ( = ?auto_5378 ?auto_5386 ) ) ( not ( = ?auto_5378 ?auto_5390 ) ) ( not ( = ?auto_5383 ?auto_5388 ) ) ( not ( = ?auto_5383 ?auto_5387 ) ) ( not ( = ?auto_5381 ?auto_5385 ) ) ( not ( = ?auto_5381 ?auto_5389 ) ) ( not ( = ?auto_5380 ?auto_5386 ) ) ( not ( = ?auto_5380 ?auto_5390 ) ) )
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
      ?auto_5415 - HOIST
      ?auto_5411 - PLACE
      ?auto_5412 - PLACE
      ?auto_5413 - HOIST
      ?auto_5416 - SURFACE
      ?auto_5422 - PLACE
      ?auto_5424 - HOIST
      ?auto_5420 - SURFACE
      ?auto_5421 - PLACE
      ?auto_5418 - HOIST
      ?auto_5419 - SURFACE
      ?auto_5417 - PLACE
      ?auto_5423 - HOIST
      ?auto_5425 - SURFACE
      ?auto_5414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5415 ?auto_5411 ) ( IS-CRATE ?auto_5410 ) ( not ( = ?auto_5412 ?auto_5411 ) ) ( HOIST-AT ?auto_5413 ?auto_5412 ) ( AVAILABLE ?auto_5413 ) ( SURFACE-AT ?auto_5410 ?auto_5412 ) ( ON ?auto_5410 ?auto_5416 ) ( CLEAR ?auto_5410 ) ( not ( = ?auto_5409 ?auto_5410 ) ) ( not ( = ?auto_5409 ?auto_5416 ) ) ( not ( = ?auto_5410 ?auto_5416 ) ) ( not ( = ?auto_5415 ?auto_5413 ) ) ( IS-CRATE ?auto_5409 ) ( not ( = ?auto_5422 ?auto_5411 ) ) ( HOIST-AT ?auto_5424 ?auto_5422 ) ( AVAILABLE ?auto_5424 ) ( SURFACE-AT ?auto_5409 ?auto_5422 ) ( ON ?auto_5409 ?auto_5420 ) ( CLEAR ?auto_5409 ) ( not ( = ?auto_5408 ?auto_5409 ) ) ( not ( = ?auto_5408 ?auto_5420 ) ) ( not ( = ?auto_5409 ?auto_5420 ) ) ( not ( = ?auto_5415 ?auto_5424 ) ) ( IS-CRATE ?auto_5408 ) ( not ( = ?auto_5421 ?auto_5411 ) ) ( HOIST-AT ?auto_5418 ?auto_5421 ) ( AVAILABLE ?auto_5418 ) ( SURFACE-AT ?auto_5408 ?auto_5421 ) ( ON ?auto_5408 ?auto_5419 ) ( CLEAR ?auto_5408 ) ( not ( = ?auto_5407 ?auto_5408 ) ) ( not ( = ?auto_5407 ?auto_5419 ) ) ( not ( = ?auto_5408 ?auto_5419 ) ) ( not ( = ?auto_5415 ?auto_5418 ) ) ( SURFACE-AT ?auto_5406 ?auto_5411 ) ( CLEAR ?auto_5406 ) ( IS-CRATE ?auto_5407 ) ( AVAILABLE ?auto_5415 ) ( not ( = ?auto_5417 ?auto_5411 ) ) ( HOIST-AT ?auto_5423 ?auto_5417 ) ( AVAILABLE ?auto_5423 ) ( SURFACE-AT ?auto_5407 ?auto_5417 ) ( ON ?auto_5407 ?auto_5425 ) ( CLEAR ?auto_5407 ) ( TRUCK-AT ?auto_5414 ?auto_5411 ) ( not ( = ?auto_5406 ?auto_5407 ) ) ( not ( = ?auto_5406 ?auto_5425 ) ) ( not ( = ?auto_5407 ?auto_5425 ) ) ( not ( = ?auto_5415 ?auto_5423 ) ) ( not ( = ?auto_5406 ?auto_5408 ) ) ( not ( = ?auto_5406 ?auto_5419 ) ) ( not ( = ?auto_5408 ?auto_5425 ) ) ( not ( = ?auto_5421 ?auto_5417 ) ) ( not ( = ?auto_5418 ?auto_5423 ) ) ( not ( = ?auto_5419 ?auto_5425 ) ) ( not ( = ?auto_5406 ?auto_5409 ) ) ( not ( = ?auto_5406 ?auto_5420 ) ) ( not ( = ?auto_5407 ?auto_5409 ) ) ( not ( = ?auto_5407 ?auto_5420 ) ) ( not ( = ?auto_5409 ?auto_5419 ) ) ( not ( = ?auto_5409 ?auto_5425 ) ) ( not ( = ?auto_5422 ?auto_5421 ) ) ( not ( = ?auto_5422 ?auto_5417 ) ) ( not ( = ?auto_5424 ?auto_5418 ) ) ( not ( = ?auto_5424 ?auto_5423 ) ) ( not ( = ?auto_5420 ?auto_5419 ) ) ( not ( = ?auto_5420 ?auto_5425 ) ) ( not ( = ?auto_5406 ?auto_5410 ) ) ( not ( = ?auto_5406 ?auto_5416 ) ) ( not ( = ?auto_5407 ?auto_5410 ) ) ( not ( = ?auto_5407 ?auto_5416 ) ) ( not ( = ?auto_5408 ?auto_5410 ) ) ( not ( = ?auto_5408 ?auto_5416 ) ) ( not ( = ?auto_5410 ?auto_5420 ) ) ( not ( = ?auto_5410 ?auto_5419 ) ) ( not ( = ?auto_5410 ?auto_5425 ) ) ( not ( = ?auto_5412 ?auto_5422 ) ) ( not ( = ?auto_5412 ?auto_5421 ) ) ( not ( = ?auto_5412 ?auto_5417 ) ) ( not ( = ?auto_5413 ?auto_5424 ) ) ( not ( = ?auto_5413 ?auto_5418 ) ) ( not ( = ?auto_5413 ?auto_5423 ) ) ( not ( = ?auto_5416 ?auto_5420 ) ) ( not ( = ?auto_5416 ?auto_5419 ) ) ( not ( = ?auto_5416 ?auto_5425 ) ) )
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
      ?auto_5453 - HOIST
      ?auto_5450 - PLACE
      ?auto_5449 - PLACE
      ?auto_5451 - HOIST
      ?auto_5452 - SURFACE
      ?auto_5456 - PLACE
      ?auto_5461 - HOIST
      ?auto_5462 - SURFACE
      ?auto_5463 - PLACE
      ?auto_5465 - HOIST
      ?auto_5458 - SURFACE
      ?auto_5459 - PLACE
      ?auto_5457 - HOIST
      ?auto_5455 - SURFACE
      ?auto_5460 - PLACE
      ?auto_5464 - HOIST
      ?auto_5454 - SURFACE
      ?auto_5448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5453 ?auto_5450 ) ( IS-CRATE ?auto_5447 ) ( not ( = ?auto_5449 ?auto_5450 ) ) ( HOIST-AT ?auto_5451 ?auto_5449 ) ( AVAILABLE ?auto_5451 ) ( SURFACE-AT ?auto_5447 ?auto_5449 ) ( ON ?auto_5447 ?auto_5452 ) ( CLEAR ?auto_5447 ) ( not ( = ?auto_5446 ?auto_5447 ) ) ( not ( = ?auto_5446 ?auto_5452 ) ) ( not ( = ?auto_5447 ?auto_5452 ) ) ( not ( = ?auto_5453 ?auto_5451 ) ) ( IS-CRATE ?auto_5446 ) ( not ( = ?auto_5456 ?auto_5450 ) ) ( HOIST-AT ?auto_5461 ?auto_5456 ) ( AVAILABLE ?auto_5461 ) ( SURFACE-AT ?auto_5446 ?auto_5456 ) ( ON ?auto_5446 ?auto_5462 ) ( CLEAR ?auto_5446 ) ( not ( = ?auto_5445 ?auto_5446 ) ) ( not ( = ?auto_5445 ?auto_5462 ) ) ( not ( = ?auto_5446 ?auto_5462 ) ) ( not ( = ?auto_5453 ?auto_5461 ) ) ( IS-CRATE ?auto_5445 ) ( not ( = ?auto_5463 ?auto_5450 ) ) ( HOIST-AT ?auto_5465 ?auto_5463 ) ( AVAILABLE ?auto_5465 ) ( SURFACE-AT ?auto_5445 ?auto_5463 ) ( ON ?auto_5445 ?auto_5458 ) ( CLEAR ?auto_5445 ) ( not ( = ?auto_5444 ?auto_5445 ) ) ( not ( = ?auto_5444 ?auto_5458 ) ) ( not ( = ?auto_5445 ?auto_5458 ) ) ( not ( = ?auto_5453 ?auto_5465 ) ) ( IS-CRATE ?auto_5444 ) ( not ( = ?auto_5459 ?auto_5450 ) ) ( HOIST-AT ?auto_5457 ?auto_5459 ) ( AVAILABLE ?auto_5457 ) ( SURFACE-AT ?auto_5444 ?auto_5459 ) ( ON ?auto_5444 ?auto_5455 ) ( CLEAR ?auto_5444 ) ( not ( = ?auto_5443 ?auto_5444 ) ) ( not ( = ?auto_5443 ?auto_5455 ) ) ( not ( = ?auto_5444 ?auto_5455 ) ) ( not ( = ?auto_5453 ?auto_5457 ) ) ( SURFACE-AT ?auto_5442 ?auto_5450 ) ( CLEAR ?auto_5442 ) ( IS-CRATE ?auto_5443 ) ( AVAILABLE ?auto_5453 ) ( not ( = ?auto_5460 ?auto_5450 ) ) ( HOIST-AT ?auto_5464 ?auto_5460 ) ( AVAILABLE ?auto_5464 ) ( SURFACE-AT ?auto_5443 ?auto_5460 ) ( ON ?auto_5443 ?auto_5454 ) ( CLEAR ?auto_5443 ) ( TRUCK-AT ?auto_5448 ?auto_5450 ) ( not ( = ?auto_5442 ?auto_5443 ) ) ( not ( = ?auto_5442 ?auto_5454 ) ) ( not ( = ?auto_5443 ?auto_5454 ) ) ( not ( = ?auto_5453 ?auto_5464 ) ) ( not ( = ?auto_5442 ?auto_5444 ) ) ( not ( = ?auto_5442 ?auto_5455 ) ) ( not ( = ?auto_5444 ?auto_5454 ) ) ( not ( = ?auto_5459 ?auto_5460 ) ) ( not ( = ?auto_5457 ?auto_5464 ) ) ( not ( = ?auto_5455 ?auto_5454 ) ) ( not ( = ?auto_5442 ?auto_5445 ) ) ( not ( = ?auto_5442 ?auto_5458 ) ) ( not ( = ?auto_5443 ?auto_5445 ) ) ( not ( = ?auto_5443 ?auto_5458 ) ) ( not ( = ?auto_5445 ?auto_5455 ) ) ( not ( = ?auto_5445 ?auto_5454 ) ) ( not ( = ?auto_5463 ?auto_5459 ) ) ( not ( = ?auto_5463 ?auto_5460 ) ) ( not ( = ?auto_5465 ?auto_5457 ) ) ( not ( = ?auto_5465 ?auto_5464 ) ) ( not ( = ?auto_5458 ?auto_5455 ) ) ( not ( = ?auto_5458 ?auto_5454 ) ) ( not ( = ?auto_5442 ?auto_5446 ) ) ( not ( = ?auto_5442 ?auto_5462 ) ) ( not ( = ?auto_5443 ?auto_5446 ) ) ( not ( = ?auto_5443 ?auto_5462 ) ) ( not ( = ?auto_5444 ?auto_5446 ) ) ( not ( = ?auto_5444 ?auto_5462 ) ) ( not ( = ?auto_5446 ?auto_5458 ) ) ( not ( = ?auto_5446 ?auto_5455 ) ) ( not ( = ?auto_5446 ?auto_5454 ) ) ( not ( = ?auto_5456 ?auto_5463 ) ) ( not ( = ?auto_5456 ?auto_5459 ) ) ( not ( = ?auto_5456 ?auto_5460 ) ) ( not ( = ?auto_5461 ?auto_5465 ) ) ( not ( = ?auto_5461 ?auto_5457 ) ) ( not ( = ?auto_5461 ?auto_5464 ) ) ( not ( = ?auto_5462 ?auto_5458 ) ) ( not ( = ?auto_5462 ?auto_5455 ) ) ( not ( = ?auto_5462 ?auto_5454 ) ) ( not ( = ?auto_5442 ?auto_5447 ) ) ( not ( = ?auto_5442 ?auto_5452 ) ) ( not ( = ?auto_5443 ?auto_5447 ) ) ( not ( = ?auto_5443 ?auto_5452 ) ) ( not ( = ?auto_5444 ?auto_5447 ) ) ( not ( = ?auto_5444 ?auto_5452 ) ) ( not ( = ?auto_5445 ?auto_5447 ) ) ( not ( = ?auto_5445 ?auto_5452 ) ) ( not ( = ?auto_5447 ?auto_5462 ) ) ( not ( = ?auto_5447 ?auto_5458 ) ) ( not ( = ?auto_5447 ?auto_5455 ) ) ( not ( = ?auto_5447 ?auto_5454 ) ) ( not ( = ?auto_5449 ?auto_5456 ) ) ( not ( = ?auto_5449 ?auto_5463 ) ) ( not ( = ?auto_5449 ?auto_5459 ) ) ( not ( = ?auto_5449 ?auto_5460 ) ) ( not ( = ?auto_5451 ?auto_5461 ) ) ( not ( = ?auto_5451 ?auto_5465 ) ) ( not ( = ?auto_5451 ?auto_5457 ) ) ( not ( = ?auto_5451 ?auto_5464 ) ) ( not ( = ?auto_5452 ?auto_5462 ) ) ( not ( = ?auto_5452 ?auto_5458 ) ) ( not ( = ?auto_5452 ?auto_5455 ) ) ( not ( = ?auto_5452 ?auto_5454 ) ) )
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
      ?auto_5494 - HOIST
      ?auto_5490 - PLACE
      ?auto_5492 - PLACE
      ?auto_5493 - HOIST
      ?auto_5491 - SURFACE
      ?auto_5506 - SURFACE
      ?auto_5507 - PLACE
      ?auto_5505 - HOIST
      ?auto_5497 - SURFACE
      ?auto_5499 - PLACE
      ?auto_5496 - HOIST
      ?auto_5508 - SURFACE
      ?auto_5503 - PLACE
      ?auto_5502 - HOIST
      ?auto_5500 - SURFACE
      ?auto_5504 - PLACE
      ?auto_5498 - HOIST
      ?auto_5501 - SURFACE
      ?auto_5495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5494 ?auto_5490 ) ( IS-CRATE ?auto_5489 ) ( not ( = ?auto_5492 ?auto_5490 ) ) ( HOIST-AT ?auto_5493 ?auto_5492 ) ( SURFACE-AT ?auto_5489 ?auto_5492 ) ( ON ?auto_5489 ?auto_5491 ) ( CLEAR ?auto_5489 ) ( not ( = ?auto_5488 ?auto_5489 ) ) ( not ( = ?auto_5488 ?auto_5491 ) ) ( not ( = ?auto_5489 ?auto_5491 ) ) ( not ( = ?auto_5494 ?auto_5493 ) ) ( IS-CRATE ?auto_5488 ) ( AVAILABLE ?auto_5493 ) ( SURFACE-AT ?auto_5488 ?auto_5492 ) ( ON ?auto_5488 ?auto_5506 ) ( CLEAR ?auto_5488 ) ( not ( = ?auto_5487 ?auto_5488 ) ) ( not ( = ?auto_5487 ?auto_5506 ) ) ( not ( = ?auto_5488 ?auto_5506 ) ) ( IS-CRATE ?auto_5487 ) ( not ( = ?auto_5507 ?auto_5490 ) ) ( HOIST-AT ?auto_5505 ?auto_5507 ) ( AVAILABLE ?auto_5505 ) ( SURFACE-AT ?auto_5487 ?auto_5507 ) ( ON ?auto_5487 ?auto_5497 ) ( CLEAR ?auto_5487 ) ( not ( = ?auto_5486 ?auto_5487 ) ) ( not ( = ?auto_5486 ?auto_5497 ) ) ( not ( = ?auto_5487 ?auto_5497 ) ) ( not ( = ?auto_5494 ?auto_5505 ) ) ( IS-CRATE ?auto_5486 ) ( not ( = ?auto_5499 ?auto_5490 ) ) ( HOIST-AT ?auto_5496 ?auto_5499 ) ( AVAILABLE ?auto_5496 ) ( SURFACE-AT ?auto_5486 ?auto_5499 ) ( ON ?auto_5486 ?auto_5508 ) ( CLEAR ?auto_5486 ) ( not ( = ?auto_5485 ?auto_5486 ) ) ( not ( = ?auto_5485 ?auto_5508 ) ) ( not ( = ?auto_5486 ?auto_5508 ) ) ( not ( = ?auto_5494 ?auto_5496 ) ) ( IS-CRATE ?auto_5485 ) ( not ( = ?auto_5503 ?auto_5490 ) ) ( HOIST-AT ?auto_5502 ?auto_5503 ) ( AVAILABLE ?auto_5502 ) ( SURFACE-AT ?auto_5485 ?auto_5503 ) ( ON ?auto_5485 ?auto_5500 ) ( CLEAR ?auto_5485 ) ( not ( = ?auto_5484 ?auto_5485 ) ) ( not ( = ?auto_5484 ?auto_5500 ) ) ( not ( = ?auto_5485 ?auto_5500 ) ) ( not ( = ?auto_5494 ?auto_5502 ) ) ( SURFACE-AT ?auto_5483 ?auto_5490 ) ( CLEAR ?auto_5483 ) ( IS-CRATE ?auto_5484 ) ( AVAILABLE ?auto_5494 ) ( not ( = ?auto_5504 ?auto_5490 ) ) ( HOIST-AT ?auto_5498 ?auto_5504 ) ( AVAILABLE ?auto_5498 ) ( SURFACE-AT ?auto_5484 ?auto_5504 ) ( ON ?auto_5484 ?auto_5501 ) ( CLEAR ?auto_5484 ) ( TRUCK-AT ?auto_5495 ?auto_5490 ) ( not ( = ?auto_5483 ?auto_5484 ) ) ( not ( = ?auto_5483 ?auto_5501 ) ) ( not ( = ?auto_5484 ?auto_5501 ) ) ( not ( = ?auto_5494 ?auto_5498 ) ) ( not ( = ?auto_5483 ?auto_5485 ) ) ( not ( = ?auto_5483 ?auto_5500 ) ) ( not ( = ?auto_5485 ?auto_5501 ) ) ( not ( = ?auto_5503 ?auto_5504 ) ) ( not ( = ?auto_5502 ?auto_5498 ) ) ( not ( = ?auto_5500 ?auto_5501 ) ) ( not ( = ?auto_5483 ?auto_5486 ) ) ( not ( = ?auto_5483 ?auto_5508 ) ) ( not ( = ?auto_5484 ?auto_5486 ) ) ( not ( = ?auto_5484 ?auto_5508 ) ) ( not ( = ?auto_5486 ?auto_5500 ) ) ( not ( = ?auto_5486 ?auto_5501 ) ) ( not ( = ?auto_5499 ?auto_5503 ) ) ( not ( = ?auto_5499 ?auto_5504 ) ) ( not ( = ?auto_5496 ?auto_5502 ) ) ( not ( = ?auto_5496 ?auto_5498 ) ) ( not ( = ?auto_5508 ?auto_5500 ) ) ( not ( = ?auto_5508 ?auto_5501 ) ) ( not ( = ?auto_5483 ?auto_5487 ) ) ( not ( = ?auto_5483 ?auto_5497 ) ) ( not ( = ?auto_5484 ?auto_5487 ) ) ( not ( = ?auto_5484 ?auto_5497 ) ) ( not ( = ?auto_5485 ?auto_5487 ) ) ( not ( = ?auto_5485 ?auto_5497 ) ) ( not ( = ?auto_5487 ?auto_5508 ) ) ( not ( = ?auto_5487 ?auto_5500 ) ) ( not ( = ?auto_5487 ?auto_5501 ) ) ( not ( = ?auto_5507 ?auto_5499 ) ) ( not ( = ?auto_5507 ?auto_5503 ) ) ( not ( = ?auto_5507 ?auto_5504 ) ) ( not ( = ?auto_5505 ?auto_5496 ) ) ( not ( = ?auto_5505 ?auto_5502 ) ) ( not ( = ?auto_5505 ?auto_5498 ) ) ( not ( = ?auto_5497 ?auto_5508 ) ) ( not ( = ?auto_5497 ?auto_5500 ) ) ( not ( = ?auto_5497 ?auto_5501 ) ) ( not ( = ?auto_5483 ?auto_5488 ) ) ( not ( = ?auto_5483 ?auto_5506 ) ) ( not ( = ?auto_5484 ?auto_5488 ) ) ( not ( = ?auto_5484 ?auto_5506 ) ) ( not ( = ?auto_5485 ?auto_5488 ) ) ( not ( = ?auto_5485 ?auto_5506 ) ) ( not ( = ?auto_5486 ?auto_5488 ) ) ( not ( = ?auto_5486 ?auto_5506 ) ) ( not ( = ?auto_5488 ?auto_5497 ) ) ( not ( = ?auto_5488 ?auto_5508 ) ) ( not ( = ?auto_5488 ?auto_5500 ) ) ( not ( = ?auto_5488 ?auto_5501 ) ) ( not ( = ?auto_5492 ?auto_5507 ) ) ( not ( = ?auto_5492 ?auto_5499 ) ) ( not ( = ?auto_5492 ?auto_5503 ) ) ( not ( = ?auto_5492 ?auto_5504 ) ) ( not ( = ?auto_5493 ?auto_5505 ) ) ( not ( = ?auto_5493 ?auto_5496 ) ) ( not ( = ?auto_5493 ?auto_5502 ) ) ( not ( = ?auto_5493 ?auto_5498 ) ) ( not ( = ?auto_5506 ?auto_5497 ) ) ( not ( = ?auto_5506 ?auto_5508 ) ) ( not ( = ?auto_5506 ?auto_5500 ) ) ( not ( = ?auto_5506 ?auto_5501 ) ) ( not ( = ?auto_5483 ?auto_5489 ) ) ( not ( = ?auto_5483 ?auto_5491 ) ) ( not ( = ?auto_5484 ?auto_5489 ) ) ( not ( = ?auto_5484 ?auto_5491 ) ) ( not ( = ?auto_5485 ?auto_5489 ) ) ( not ( = ?auto_5485 ?auto_5491 ) ) ( not ( = ?auto_5486 ?auto_5489 ) ) ( not ( = ?auto_5486 ?auto_5491 ) ) ( not ( = ?auto_5487 ?auto_5489 ) ) ( not ( = ?auto_5487 ?auto_5491 ) ) ( not ( = ?auto_5489 ?auto_5506 ) ) ( not ( = ?auto_5489 ?auto_5497 ) ) ( not ( = ?auto_5489 ?auto_5508 ) ) ( not ( = ?auto_5489 ?auto_5500 ) ) ( not ( = ?auto_5489 ?auto_5501 ) ) ( not ( = ?auto_5491 ?auto_5506 ) ) ( not ( = ?auto_5491 ?auto_5497 ) ) ( not ( = ?auto_5491 ?auto_5508 ) ) ( not ( = ?auto_5491 ?auto_5500 ) ) ( not ( = ?auto_5491 ?auto_5501 ) ) )
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
      ?auto_5536 - HOIST
      ?auto_5538 - PLACE
      ?auto_5539 - PLACE
      ?auto_5537 - HOIST
      ?auto_5535 - SURFACE
      ?auto_5542 - PLACE
      ?auto_5541 - HOIST
      ?auto_5545 - SURFACE
      ?auto_5544 - SURFACE
      ?auto_5552 - PLACE
      ?auto_5549 - HOIST
      ?auto_5548 - SURFACE
      ?auto_5554 - PLACE
      ?auto_5551 - HOIST
      ?auto_5543 - SURFACE
      ?auto_5546 - PLACE
      ?auto_5553 - HOIST
      ?auto_5555 - SURFACE
      ?auto_5556 - PLACE
      ?auto_5550 - HOIST
      ?auto_5547 - SURFACE
      ?auto_5540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5536 ?auto_5538 ) ( IS-CRATE ?auto_5534 ) ( not ( = ?auto_5539 ?auto_5538 ) ) ( HOIST-AT ?auto_5537 ?auto_5539 ) ( AVAILABLE ?auto_5537 ) ( SURFACE-AT ?auto_5534 ?auto_5539 ) ( ON ?auto_5534 ?auto_5535 ) ( CLEAR ?auto_5534 ) ( not ( = ?auto_5533 ?auto_5534 ) ) ( not ( = ?auto_5533 ?auto_5535 ) ) ( not ( = ?auto_5534 ?auto_5535 ) ) ( not ( = ?auto_5536 ?auto_5537 ) ) ( IS-CRATE ?auto_5533 ) ( not ( = ?auto_5542 ?auto_5538 ) ) ( HOIST-AT ?auto_5541 ?auto_5542 ) ( SURFACE-AT ?auto_5533 ?auto_5542 ) ( ON ?auto_5533 ?auto_5545 ) ( CLEAR ?auto_5533 ) ( not ( = ?auto_5532 ?auto_5533 ) ) ( not ( = ?auto_5532 ?auto_5545 ) ) ( not ( = ?auto_5533 ?auto_5545 ) ) ( not ( = ?auto_5536 ?auto_5541 ) ) ( IS-CRATE ?auto_5532 ) ( AVAILABLE ?auto_5541 ) ( SURFACE-AT ?auto_5532 ?auto_5542 ) ( ON ?auto_5532 ?auto_5544 ) ( CLEAR ?auto_5532 ) ( not ( = ?auto_5531 ?auto_5532 ) ) ( not ( = ?auto_5531 ?auto_5544 ) ) ( not ( = ?auto_5532 ?auto_5544 ) ) ( IS-CRATE ?auto_5531 ) ( not ( = ?auto_5552 ?auto_5538 ) ) ( HOIST-AT ?auto_5549 ?auto_5552 ) ( AVAILABLE ?auto_5549 ) ( SURFACE-AT ?auto_5531 ?auto_5552 ) ( ON ?auto_5531 ?auto_5548 ) ( CLEAR ?auto_5531 ) ( not ( = ?auto_5530 ?auto_5531 ) ) ( not ( = ?auto_5530 ?auto_5548 ) ) ( not ( = ?auto_5531 ?auto_5548 ) ) ( not ( = ?auto_5536 ?auto_5549 ) ) ( IS-CRATE ?auto_5530 ) ( not ( = ?auto_5554 ?auto_5538 ) ) ( HOIST-AT ?auto_5551 ?auto_5554 ) ( AVAILABLE ?auto_5551 ) ( SURFACE-AT ?auto_5530 ?auto_5554 ) ( ON ?auto_5530 ?auto_5543 ) ( CLEAR ?auto_5530 ) ( not ( = ?auto_5529 ?auto_5530 ) ) ( not ( = ?auto_5529 ?auto_5543 ) ) ( not ( = ?auto_5530 ?auto_5543 ) ) ( not ( = ?auto_5536 ?auto_5551 ) ) ( IS-CRATE ?auto_5529 ) ( not ( = ?auto_5546 ?auto_5538 ) ) ( HOIST-AT ?auto_5553 ?auto_5546 ) ( AVAILABLE ?auto_5553 ) ( SURFACE-AT ?auto_5529 ?auto_5546 ) ( ON ?auto_5529 ?auto_5555 ) ( CLEAR ?auto_5529 ) ( not ( = ?auto_5528 ?auto_5529 ) ) ( not ( = ?auto_5528 ?auto_5555 ) ) ( not ( = ?auto_5529 ?auto_5555 ) ) ( not ( = ?auto_5536 ?auto_5553 ) ) ( SURFACE-AT ?auto_5527 ?auto_5538 ) ( CLEAR ?auto_5527 ) ( IS-CRATE ?auto_5528 ) ( AVAILABLE ?auto_5536 ) ( not ( = ?auto_5556 ?auto_5538 ) ) ( HOIST-AT ?auto_5550 ?auto_5556 ) ( AVAILABLE ?auto_5550 ) ( SURFACE-AT ?auto_5528 ?auto_5556 ) ( ON ?auto_5528 ?auto_5547 ) ( CLEAR ?auto_5528 ) ( TRUCK-AT ?auto_5540 ?auto_5538 ) ( not ( = ?auto_5527 ?auto_5528 ) ) ( not ( = ?auto_5527 ?auto_5547 ) ) ( not ( = ?auto_5528 ?auto_5547 ) ) ( not ( = ?auto_5536 ?auto_5550 ) ) ( not ( = ?auto_5527 ?auto_5529 ) ) ( not ( = ?auto_5527 ?auto_5555 ) ) ( not ( = ?auto_5529 ?auto_5547 ) ) ( not ( = ?auto_5546 ?auto_5556 ) ) ( not ( = ?auto_5553 ?auto_5550 ) ) ( not ( = ?auto_5555 ?auto_5547 ) ) ( not ( = ?auto_5527 ?auto_5530 ) ) ( not ( = ?auto_5527 ?auto_5543 ) ) ( not ( = ?auto_5528 ?auto_5530 ) ) ( not ( = ?auto_5528 ?auto_5543 ) ) ( not ( = ?auto_5530 ?auto_5555 ) ) ( not ( = ?auto_5530 ?auto_5547 ) ) ( not ( = ?auto_5554 ?auto_5546 ) ) ( not ( = ?auto_5554 ?auto_5556 ) ) ( not ( = ?auto_5551 ?auto_5553 ) ) ( not ( = ?auto_5551 ?auto_5550 ) ) ( not ( = ?auto_5543 ?auto_5555 ) ) ( not ( = ?auto_5543 ?auto_5547 ) ) ( not ( = ?auto_5527 ?auto_5531 ) ) ( not ( = ?auto_5527 ?auto_5548 ) ) ( not ( = ?auto_5528 ?auto_5531 ) ) ( not ( = ?auto_5528 ?auto_5548 ) ) ( not ( = ?auto_5529 ?auto_5531 ) ) ( not ( = ?auto_5529 ?auto_5548 ) ) ( not ( = ?auto_5531 ?auto_5543 ) ) ( not ( = ?auto_5531 ?auto_5555 ) ) ( not ( = ?auto_5531 ?auto_5547 ) ) ( not ( = ?auto_5552 ?auto_5554 ) ) ( not ( = ?auto_5552 ?auto_5546 ) ) ( not ( = ?auto_5552 ?auto_5556 ) ) ( not ( = ?auto_5549 ?auto_5551 ) ) ( not ( = ?auto_5549 ?auto_5553 ) ) ( not ( = ?auto_5549 ?auto_5550 ) ) ( not ( = ?auto_5548 ?auto_5543 ) ) ( not ( = ?auto_5548 ?auto_5555 ) ) ( not ( = ?auto_5548 ?auto_5547 ) ) ( not ( = ?auto_5527 ?auto_5532 ) ) ( not ( = ?auto_5527 ?auto_5544 ) ) ( not ( = ?auto_5528 ?auto_5532 ) ) ( not ( = ?auto_5528 ?auto_5544 ) ) ( not ( = ?auto_5529 ?auto_5532 ) ) ( not ( = ?auto_5529 ?auto_5544 ) ) ( not ( = ?auto_5530 ?auto_5532 ) ) ( not ( = ?auto_5530 ?auto_5544 ) ) ( not ( = ?auto_5532 ?auto_5548 ) ) ( not ( = ?auto_5532 ?auto_5543 ) ) ( not ( = ?auto_5532 ?auto_5555 ) ) ( not ( = ?auto_5532 ?auto_5547 ) ) ( not ( = ?auto_5542 ?auto_5552 ) ) ( not ( = ?auto_5542 ?auto_5554 ) ) ( not ( = ?auto_5542 ?auto_5546 ) ) ( not ( = ?auto_5542 ?auto_5556 ) ) ( not ( = ?auto_5541 ?auto_5549 ) ) ( not ( = ?auto_5541 ?auto_5551 ) ) ( not ( = ?auto_5541 ?auto_5553 ) ) ( not ( = ?auto_5541 ?auto_5550 ) ) ( not ( = ?auto_5544 ?auto_5548 ) ) ( not ( = ?auto_5544 ?auto_5543 ) ) ( not ( = ?auto_5544 ?auto_5555 ) ) ( not ( = ?auto_5544 ?auto_5547 ) ) ( not ( = ?auto_5527 ?auto_5533 ) ) ( not ( = ?auto_5527 ?auto_5545 ) ) ( not ( = ?auto_5528 ?auto_5533 ) ) ( not ( = ?auto_5528 ?auto_5545 ) ) ( not ( = ?auto_5529 ?auto_5533 ) ) ( not ( = ?auto_5529 ?auto_5545 ) ) ( not ( = ?auto_5530 ?auto_5533 ) ) ( not ( = ?auto_5530 ?auto_5545 ) ) ( not ( = ?auto_5531 ?auto_5533 ) ) ( not ( = ?auto_5531 ?auto_5545 ) ) ( not ( = ?auto_5533 ?auto_5544 ) ) ( not ( = ?auto_5533 ?auto_5548 ) ) ( not ( = ?auto_5533 ?auto_5543 ) ) ( not ( = ?auto_5533 ?auto_5555 ) ) ( not ( = ?auto_5533 ?auto_5547 ) ) ( not ( = ?auto_5545 ?auto_5544 ) ) ( not ( = ?auto_5545 ?auto_5548 ) ) ( not ( = ?auto_5545 ?auto_5543 ) ) ( not ( = ?auto_5545 ?auto_5555 ) ) ( not ( = ?auto_5545 ?auto_5547 ) ) ( not ( = ?auto_5527 ?auto_5534 ) ) ( not ( = ?auto_5527 ?auto_5535 ) ) ( not ( = ?auto_5528 ?auto_5534 ) ) ( not ( = ?auto_5528 ?auto_5535 ) ) ( not ( = ?auto_5529 ?auto_5534 ) ) ( not ( = ?auto_5529 ?auto_5535 ) ) ( not ( = ?auto_5530 ?auto_5534 ) ) ( not ( = ?auto_5530 ?auto_5535 ) ) ( not ( = ?auto_5531 ?auto_5534 ) ) ( not ( = ?auto_5531 ?auto_5535 ) ) ( not ( = ?auto_5532 ?auto_5534 ) ) ( not ( = ?auto_5532 ?auto_5535 ) ) ( not ( = ?auto_5534 ?auto_5545 ) ) ( not ( = ?auto_5534 ?auto_5544 ) ) ( not ( = ?auto_5534 ?auto_5548 ) ) ( not ( = ?auto_5534 ?auto_5543 ) ) ( not ( = ?auto_5534 ?auto_5555 ) ) ( not ( = ?auto_5534 ?auto_5547 ) ) ( not ( = ?auto_5539 ?auto_5542 ) ) ( not ( = ?auto_5539 ?auto_5552 ) ) ( not ( = ?auto_5539 ?auto_5554 ) ) ( not ( = ?auto_5539 ?auto_5546 ) ) ( not ( = ?auto_5539 ?auto_5556 ) ) ( not ( = ?auto_5537 ?auto_5541 ) ) ( not ( = ?auto_5537 ?auto_5549 ) ) ( not ( = ?auto_5537 ?auto_5551 ) ) ( not ( = ?auto_5537 ?auto_5553 ) ) ( not ( = ?auto_5537 ?auto_5550 ) ) ( not ( = ?auto_5535 ?auto_5545 ) ) ( not ( = ?auto_5535 ?auto_5544 ) ) ( not ( = ?auto_5535 ?auto_5548 ) ) ( not ( = ?auto_5535 ?auto_5543 ) ) ( not ( = ?auto_5535 ?auto_5555 ) ) ( not ( = ?auto_5535 ?auto_5547 ) ) )
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
      ?auto_5606 - HOIST
      ?auto_5593 - SURFACE
      ?auto_5603 - SURFACE
      ?auto_5595 - SURFACE
      ?auto_5600 - PLACE
      ?auto_5597 - HOIST
      ?auto_5594 - SURFACE
      ?auto_5596 - PLACE
      ?auto_5604 - HOIST
      ?auto_5601 - SURFACE
      ?auto_5599 - PLACE
      ?auto_5591 - HOIST
      ?auto_5602 - SURFACE
      ?auto_5598 - PLACE
      ?auto_5605 - HOIST
      ?auto_5592 - SURFACE
      ?auto_5588 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5590 ?auto_5589 ) ( IS-CRATE ?auto_5584 ) ( not ( = ?auto_5585 ?auto_5589 ) ) ( HOIST-AT ?auto_5586 ?auto_5585 ) ( SURFACE-AT ?auto_5584 ?auto_5585 ) ( ON ?auto_5584 ?auto_5587 ) ( CLEAR ?auto_5584 ) ( not ( = ?auto_5583 ?auto_5584 ) ) ( not ( = ?auto_5583 ?auto_5587 ) ) ( not ( = ?auto_5584 ?auto_5587 ) ) ( not ( = ?auto_5590 ?auto_5586 ) ) ( IS-CRATE ?auto_5583 ) ( not ( = ?auto_5607 ?auto_5589 ) ) ( HOIST-AT ?auto_5606 ?auto_5607 ) ( AVAILABLE ?auto_5606 ) ( SURFACE-AT ?auto_5583 ?auto_5607 ) ( ON ?auto_5583 ?auto_5593 ) ( CLEAR ?auto_5583 ) ( not ( = ?auto_5582 ?auto_5583 ) ) ( not ( = ?auto_5582 ?auto_5593 ) ) ( not ( = ?auto_5583 ?auto_5593 ) ) ( not ( = ?auto_5590 ?auto_5606 ) ) ( IS-CRATE ?auto_5582 ) ( SURFACE-AT ?auto_5582 ?auto_5585 ) ( ON ?auto_5582 ?auto_5603 ) ( CLEAR ?auto_5582 ) ( not ( = ?auto_5581 ?auto_5582 ) ) ( not ( = ?auto_5581 ?auto_5603 ) ) ( not ( = ?auto_5582 ?auto_5603 ) ) ( IS-CRATE ?auto_5581 ) ( AVAILABLE ?auto_5586 ) ( SURFACE-AT ?auto_5581 ?auto_5585 ) ( ON ?auto_5581 ?auto_5595 ) ( CLEAR ?auto_5581 ) ( not ( = ?auto_5580 ?auto_5581 ) ) ( not ( = ?auto_5580 ?auto_5595 ) ) ( not ( = ?auto_5581 ?auto_5595 ) ) ( IS-CRATE ?auto_5580 ) ( not ( = ?auto_5600 ?auto_5589 ) ) ( HOIST-AT ?auto_5597 ?auto_5600 ) ( AVAILABLE ?auto_5597 ) ( SURFACE-AT ?auto_5580 ?auto_5600 ) ( ON ?auto_5580 ?auto_5594 ) ( CLEAR ?auto_5580 ) ( not ( = ?auto_5579 ?auto_5580 ) ) ( not ( = ?auto_5579 ?auto_5594 ) ) ( not ( = ?auto_5580 ?auto_5594 ) ) ( not ( = ?auto_5590 ?auto_5597 ) ) ( IS-CRATE ?auto_5579 ) ( not ( = ?auto_5596 ?auto_5589 ) ) ( HOIST-AT ?auto_5604 ?auto_5596 ) ( AVAILABLE ?auto_5604 ) ( SURFACE-AT ?auto_5579 ?auto_5596 ) ( ON ?auto_5579 ?auto_5601 ) ( CLEAR ?auto_5579 ) ( not ( = ?auto_5578 ?auto_5579 ) ) ( not ( = ?auto_5578 ?auto_5601 ) ) ( not ( = ?auto_5579 ?auto_5601 ) ) ( not ( = ?auto_5590 ?auto_5604 ) ) ( IS-CRATE ?auto_5578 ) ( not ( = ?auto_5599 ?auto_5589 ) ) ( HOIST-AT ?auto_5591 ?auto_5599 ) ( AVAILABLE ?auto_5591 ) ( SURFACE-AT ?auto_5578 ?auto_5599 ) ( ON ?auto_5578 ?auto_5602 ) ( CLEAR ?auto_5578 ) ( not ( = ?auto_5577 ?auto_5578 ) ) ( not ( = ?auto_5577 ?auto_5602 ) ) ( not ( = ?auto_5578 ?auto_5602 ) ) ( not ( = ?auto_5590 ?auto_5591 ) ) ( SURFACE-AT ?auto_5576 ?auto_5589 ) ( CLEAR ?auto_5576 ) ( IS-CRATE ?auto_5577 ) ( AVAILABLE ?auto_5590 ) ( not ( = ?auto_5598 ?auto_5589 ) ) ( HOIST-AT ?auto_5605 ?auto_5598 ) ( AVAILABLE ?auto_5605 ) ( SURFACE-AT ?auto_5577 ?auto_5598 ) ( ON ?auto_5577 ?auto_5592 ) ( CLEAR ?auto_5577 ) ( TRUCK-AT ?auto_5588 ?auto_5589 ) ( not ( = ?auto_5576 ?auto_5577 ) ) ( not ( = ?auto_5576 ?auto_5592 ) ) ( not ( = ?auto_5577 ?auto_5592 ) ) ( not ( = ?auto_5590 ?auto_5605 ) ) ( not ( = ?auto_5576 ?auto_5578 ) ) ( not ( = ?auto_5576 ?auto_5602 ) ) ( not ( = ?auto_5578 ?auto_5592 ) ) ( not ( = ?auto_5599 ?auto_5598 ) ) ( not ( = ?auto_5591 ?auto_5605 ) ) ( not ( = ?auto_5602 ?auto_5592 ) ) ( not ( = ?auto_5576 ?auto_5579 ) ) ( not ( = ?auto_5576 ?auto_5601 ) ) ( not ( = ?auto_5577 ?auto_5579 ) ) ( not ( = ?auto_5577 ?auto_5601 ) ) ( not ( = ?auto_5579 ?auto_5602 ) ) ( not ( = ?auto_5579 ?auto_5592 ) ) ( not ( = ?auto_5596 ?auto_5599 ) ) ( not ( = ?auto_5596 ?auto_5598 ) ) ( not ( = ?auto_5604 ?auto_5591 ) ) ( not ( = ?auto_5604 ?auto_5605 ) ) ( not ( = ?auto_5601 ?auto_5602 ) ) ( not ( = ?auto_5601 ?auto_5592 ) ) ( not ( = ?auto_5576 ?auto_5580 ) ) ( not ( = ?auto_5576 ?auto_5594 ) ) ( not ( = ?auto_5577 ?auto_5580 ) ) ( not ( = ?auto_5577 ?auto_5594 ) ) ( not ( = ?auto_5578 ?auto_5580 ) ) ( not ( = ?auto_5578 ?auto_5594 ) ) ( not ( = ?auto_5580 ?auto_5601 ) ) ( not ( = ?auto_5580 ?auto_5602 ) ) ( not ( = ?auto_5580 ?auto_5592 ) ) ( not ( = ?auto_5600 ?auto_5596 ) ) ( not ( = ?auto_5600 ?auto_5599 ) ) ( not ( = ?auto_5600 ?auto_5598 ) ) ( not ( = ?auto_5597 ?auto_5604 ) ) ( not ( = ?auto_5597 ?auto_5591 ) ) ( not ( = ?auto_5597 ?auto_5605 ) ) ( not ( = ?auto_5594 ?auto_5601 ) ) ( not ( = ?auto_5594 ?auto_5602 ) ) ( not ( = ?auto_5594 ?auto_5592 ) ) ( not ( = ?auto_5576 ?auto_5581 ) ) ( not ( = ?auto_5576 ?auto_5595 ) ) ( not ( = ?auto_5577 ?auto_5581 ) ) ( not ( = ?auto_5577 ?auto_5595 ) ) ( not ( = ?auto_5578 ?auto_5581 ) ) ( not ( = ?auto_5578 ?auto_5595 ) ) ( not ( = ?auto_5579 ?auto_5581 ) ) ( not ( = ?auto_5579 ?auto_5595 ) ) ( not ( = ?auto_5581 ?auto_5594 ) ) ( not ( = ?auto_5581 ?auto_5601 ) ) ( not ( = ?auto_5581 ?auto_5602 ) ) ( not ( = ?auto_5581 ?auto_5592 ) ) ( not ( = ?auto_5585 ?auto_5600 ) ) ( not ( = ?auto_5585 ?auto_5596 ) ) ( not ( = ?auto_5585 ?auto_5599 ) ) ( not ( = ?auto_5585 ?auto_5598 ) ) ( not ( = ?auto_5586 ?auto_5597 ) ) ( not ( = ?auto_5586 ?auto_5604 ) ) ( not ( = ?auto_5586 ?auto_5591 ) ) ( not ( = ?auto_5586 ?auto_5605 ) ) ( not ( = ?auto_5595 ?auto_5594 ) ) ( not ( = ?auto_5595 ?auto_5601 ) ) ( not ( = ?auto_5595 ?auto_5602 ) ) ( not ( = ?auto_5595 ?auto_5592 ) ) ( not ( = ?auto_5576 ?auto_5582 ) ) ( not ( = ?auto_5576 ?auto_5603 ) ) ( not ( = ?auto_5577 ?auto_5582 ) ) ( not ( = ?auto_5577 ?auto_5603 ) ) ( not ( = ?auto_5578 ?auto_5582 ) ) ( not ( = ?auto_5578 ?auto_5603 ) ) ( not ( = ?auto_5579 ?auto_5582 ) ) ( not ( = ?auto_5579 ?auto_5603 ) ) ( not ( = ?auto_5580 ?auto_5582 ) ) ( not ( = ?auto_5580 ?auto_5603 ) ) ( not ( = ?auto_5582 ?auto_5595 ) ) ( not ( = ?auto_5582 ?auto_5594 ) ) ( not ( = ?auto_5582 ?auto_5601 ) ) ( not ( = ?auto_5582 ?auto_5602 ) ) ( not ( = ?auto_5582 ?auto_5592 ) ) ( not ( = ?auto_5603 ?auto_5595 ) ) ( not ( = ?auto_5603 ?auto_5594 ) ) ( not ( = ?auto_5603 ?auto_5601 ) ) ( not ( = ?auto_5603 ?auto_5602 ) ) ( not ( = ?auto_5603 ?auto_5592 ) ) ( not ( = ?auto_5576 ?auto_5583 ) ) ( not ( = ?auto_5576 ?auto_5593 ) ) ( not ( = ?auto_5577 ?auto_5583 ) ) ( not ( = ?auto_5577 ?auto_5593 ) ) ( not ( = ?auto_5578 ?auto_5583 ) ) ( not ( = ?auto_5578 ?auto_5593 ) ) ( not ( = ?auto_5579 ?auto_5583 ) ) ( not ( = ?auto_5579 ?auto_5593 ) ) ( not ( = ?auto_5580 ?auto_5583 ) ) ( not ( = ?auto_5580 ?auto_5593 ) ) ( not ( = ?auto_5581 ?auto_5583 ) ) ( not ( = ?auto_5581 ?auto_5593 ) ) ( not ( = ?auto_5583 ?auto_5603 ) ) ( not ( = ?auto_5583 ?auto_5595 ) ) ( not ( = ?auto_5583 ?auto_5594 ) ) ( not ( = ?auto_5583 ?auto_5601 ) ) ( not ( = ?auto_5583 ?auto_5602 ) ) ( not ( = ?auto_5583 ?auto_5592 ) ) ( not ( = ?auto_5607 ?auto_5585 ) ) ( not ( = ?auto_5607 ?auto_5600 ) ) ( not ( = ?auto_5607 ?auto_5596 ) ) ( not ( = ?auto_5607 ?auto_5599 ) ) ( not ( = ?auto_5607 ?auto_5598 ) ) ( not ( = ?auto_5606 ?auto_5586 ) ) ( not ( = ?auto_5606 ?auto_5597 ) ) ( not ( = ?auto_5606 ?auto_5604 ) ) ( not ( = ?auto_5606 ?auto_5591 ) ) ( not ( = ?auto_5606 ?auto_5605 ) ) ( not ( = ?auto_5593 ?auto_5603 ) ) ( not ( = ?auto_5593 ?auto_5595 ) ) ( not ( = ?auto_5593 ?auto_5594 ) ) ( not ( = ?auto_5593 ?auto_5601 ) ) ( not ( = ?auto_5593 ?auto_5602 ) ) ( not ( = ?auto_5593 ?auto_5592 ) ) ( not ( = ?auto_5576 ?auto_5584 ) ) ( not ( = ?auto_5576 ?auto_5587 ) ) ( not ( = ?auto_5577 ?auto_5584 ) ) ( not ( = ?auto_5577 ?auto_5587 ) ) ( not ( = ?auto_5578 ?auto_5584 ) ) ( not ( = ?auto_5578 ?auto_5587 ) ) ( not ( = ?auto_5579 ?auto_5584 ) ) ( not ( = ?auto_5579 ?auto_5587 ) ) ( not ( = ?auto_5580 ?auto_5584 ) ) ( not ( = ?auto_5580 ?auto_5587 ) ) ( not ( = ?auto_5581 ?auto_5584 ) ) ( not ( = ?auto_5581 ?auto_5587 ) ) ( not ( = ?auto_5582 ?auto_5584 ) ) ( not ( = ?auto_5582 ?auto_5587 ) ) ( not ( = ?auto_5584 ?auto_5593 ) ) ( not ( = ?auto_5584 ?auto_5603 ) ) ( not ( = ?auto_5584 ?auto_5595 ) ) ( not ( = ?auto_5584 ?auto_5594 ) ) ( not ( = ?auto_5584 ?auto_5601 ) ) ( not ( = ?auto_5584 ?auto_5602 ) ) ( not ( = ?auto_5584 ?auto_5592 ) ) ( not ( = ?auto_5587 ?auto_5593 ) ) ( not ( = ?auto_5587 ?auto_5603 ) ) ( not ( = ?auto_5587 ?auto_5595 ) ) ( not ( = ?auto_5587 ?auto_5594 ) ) ( not ( = ?auto_5587 ?auto_5601 ) ) ( not ( = ?auto_5587 ?auto_5602 ) ) ( not ( = ?auto_5587 ?auto_5592 ) ) )
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
      ?auto_5639 - SURFACE
      ?auto_5653 - SURFACE
      ?auto_5649 - PLACE
      ?auto_5654 - HOIST
      ?auto_5656 - SURFACE
      ?auto_5659 - SURFACE
      ?auto_5644 - SURFACE
      ?auto_5658 - PLACE
      ?auto_5648 - HOIST
      ?auto_5657 - SURFACE
      ?auto_5650 - PLACE
      ?auto_5647 - HOIST
      ?auto_5645 - SURFACE
      ?auto_5660 - PLACE
      ?auto_5652 - HOIST
      ?auto_5651 - SURFACE
      ?auto_5655 - PLACE
      ?auto_5661 - HOIST
      ?auto_5646 - SURFACE
      ?auto_5640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5641 ?auto_5643 ) ( IS-CRATE ?auto_5637 ) ( not ( = ?auto_5642 ?auto_5643 ) ) ( HOIST-AT ?auto_5638 ?auto_5642 ) ( SURFACE-AT ?auto_5637 ?auto_5642 ) ( ON ?auto_5637 ?auto_5639 ) ( CLEAR ?auto_5637 ) ( not ( = ?auto_5636 ?auto_5637 ) ) ( not ( = ?auto_5636 ?auto_5639 ) ) ( not ( = ?auto_5637 ?auto_5639 ) ) ( not ( = ?auto_5641 ?auto_5638 ) ) ( IS-CRATE ?auto_5636 ) ( SURFACE-AT ?auto_5636 ?auto_5642 ) ( ON ?auto_5636 ?auto_5653 ) ( CLEAR ?auto_5636 ) ( not ( = ?auto_5635 ?auto_5636 ) ) ( not ( = ?auto_5635 ?auto_5653 ) ) ( not ( = ?auto_5636 ?auto_5653 ) ) ( IS-CRATE ?auto_5635 ) ( not ( = ?auto_5649 ?auto_5643 ) ) ( HOIST-AT ?auto_5654 ?auto_5649 ) ( AVAILABLE ?auto_5654 ) ( SURFACE-AT ?auto_5635 ?auto_5649 ) ( ON ?auto_5635 ?auto_5656 ) ( CLEAR ?auto_5635 ) ( not ( = ?auto_5634 ?auto_5635 ) ) ( not ( = ?auto_5634 ?auto_5656 ) ) ( not ( = ?auto_5635 ?auto_5656 ) ) ( not ( = ?auto_5641 ?auto_5654 ) ) ( IS-CRATE ?auto_5634 ) ( SURFACE-AT ?auto_5634 ?auto_5642 ) ( ON ?auto_5634 ?auto_5659 ) ( CLEAR ?auto_5634 ) ( not ( = ?auto_5633 ?auto_5634 ) ) ( not ( = ?auto_5633 ?auto_5659 ) ) ( not ( = ?auto_5634 ?auto_5659 ) ) ( IS-CRATE ?auto_5633 ) ( AVAILABLE ?auto_5638 ) ( SURFACE-AT ?auto_5633 ?auto_5642 ) ( ON ?auto_5633 ?auto_5644 ) ( CLEAR ?auto_5633 ) ( not ( = ?auto_5632 ?auto_5633 ) ) ( not ( = ?auto_5632 ?auto_5644 ) ) ( not ( = ?auto_5633 ?auto_5644 ) ) ( IS-CRATE ?auto_5632 ) ( not ( = ?auto_5658 ?auto_5643 ) ) ( HOIST-AT ?auto_5648 ?auto_5658 ) ( AVAILABLE ?auto_5648 ) ( SURFACE-AT ?auto_5632 ?auto_5658 ) ( ON ?auto_5632 ?auto_5657 ) ( CLEAR ?auto_5632 ) ( not ( = ?auto_5631 ?auto_5632 ) ) ( not ( = ?auto_5631 ?auto_5657 ) ) ( not ( = ?auto_5632 ?auto_5657 ) ) ( not ( = ?auto_5641 ?auto_5648 ) ) ( IS-CRATE ?auto_5631 ) ( not ( = ?auto_5650 ?auto_5643 ) ) ( HOIST-AT ?auto_5647 ?auto_5650 ) ( AVAILABLE ?auto_5647 ) ( SURFACE-AT ?auto_5631 ?auto_5650 ) ( ON ?auto_5631 ?auto_5645 ) ( CLEAR ?auto_5631 ) ( not ( = ?auto_5630 ?auto_5631 ) ) ( not ( = ?auto_5630 ?auto_5645 ) ) ( not ( = ?auto_5631 ?auto_5645 ) ) ( not ( = ?auto_5641 ?auto_5647 ) ) ( IS-CRATE ?auto_5630 ) ( not ( = ?auto_5660 ?auto_5643 ) ) ( HOIST-AT ?auto_5652 ?auto_5660 ) ( AVAILABLE ?auto_5652 ) ( SURFACE-AT ?auto_5630 ?auto_5660 ) ( ON ?auto_5630 ?auto_5651 ) ( CLEAR ?auto_5630 ) ( not ( = ?auto_5629 ?auto_5630 ) ) ( not ( = ?auto_5629 ?auto_5651 ) ) ( not ( = ?auto_5630 ?auto_5651 ) ) ( not ( = ?auto_5641 ?auto_5652 ) ) ( SURFACE-AT ?auto_5628 ?auto_5643 ) ( CLEAR ?auto_5628 ) ( IS-CRATE ?auto_5629 ) ( AVAILABLE ?auto_5641 ) ( not ( = ?auto_5655 ?auto_5643 ) ) ( HOIST-AT ?auto_5661 ?auto_5655 ) ( AVAILABLE ?auto_5661 ) ( SURFACE-AT ?auto_5629 ?auto_5655 ) ( ON ?auto_5629 ?auto_5646 ) ( CLEAR ?auto_5629 ) ( TRUCK-AT ?auto_5640 ?auto_5643 ) ( not ( = ?auto_5628 ?auto_5629 ) ) ( not ( = ?auto_5628 ?auto_5646 ) ) ( not ( = ?auto_5629 ?auto_5646 ) ) ( not ( = ?auto_5641 ?auto_5661 ) ) ( not ( = ?auto_5628 ?auto_5630 ) ) ( not ( = ?auto_5628 ?auto_5651 ) ) ( not ( = ?auto_5630 ?auto_5646 ) ) ( not ( = ?auto_5660 ?auto_5655 ) ) ( not ( = ?auto_5652 ?auto_5661 ) ) ( not ( = ?auto_5651 ?auto_5646 ) ) ( not ( = ?auto_5628 ?auto_5631 ) ) ( not ( = ?auto_5628 ?auto_5645 ) ) ( not ( = ?auto_5629 ?auto_5631 ) ) ( not ( = ?auto_5629 ?auto_5645 ) ) ( not ( = ?auto_5631 ?auto_5651 ) ) ( not ( = ?auto_5631 ?auto_5646 ) ) ( not ( = ?auto_5650 ?auto_5660 ) ) ( not ( = ?auto_5650 ?auto_5655 ) ) ( not ( = ?auto_5647 ?auto_5652 ) ) ( not ( = ?auto_5647 ?auto_5661 ) ) ( not ( = ?auto_5645 ?auto_5651 ) ) ( not ( = ?auto_5645 ?auto_5646 ) ) ( not ( = ?auto_5628 ?auto_5632 ) ) ( not ( = ?auto_5628 ?auto_5657 ) ) ( not ( = ?auto_5629 ?auto_5632 ) ) ( not ( = ?auto_5629 ?auto_5657 ) ) ( not ( = ?auto_5630 ?auto_5632 ) ) ( not ( = ?auto_5630 ?auto_5657 ) ) ( not ( = ?auto_5632 ?auto_5645 ) ) ( not ( = ?auto_5632 ?auto_5651 ) ) ( not ( = ?auto_5632 ?auto_5646 ) ) ( not ( = ?auto_5658 ?auto_5650 ) ) ( not ( = ?auto_5658 ?auto_5660 ) ) ( not ( = ?auto_5658 ?auto_5655 ) ) ( not ( = ?auto_5648 ?auto_5647 ) ) ( not ( = ?auto_5648 ?auto_5652 ) ) ( not ( = ?auto_5648 ?auto_5661 ) ) ( not ( = ?auto_5657 ?auto_5645 ) ) ( not ( = ?auto_5657 ?auto_5651 ) ) ( not ( = ?auto_5657 ?auto_5646 ) ) ( not ( = ?auto_5628 ?auto_5633 ) ) ( not ( = ?auto_5628 ?auto_5644 ) ) ( not ( = ?auto_5629 ?auto_5633 ) ) ( not ( = ?auto_5629 ?auto_5644 ) ) ( not ( = ?auto_5630 ?auto_5633 ) ) ( not ( = ?auto_5630 ?auto_5644 ) ) ( not ( = ?auto_5631 ?auto_5633 ) ) ( not ( = ?auto_5631 ?auto_5644 ) ) ( not ( = ?auto_5633 ?auto_5657 ) ) ( not ( = ?auto_5633 ?auto_5645 ) ) ( not ( = ?auto_5633 ?auto_5651 ) ) ( not ( = ?auto_5633 ?auto_5646 ) ) ( not ( = ?auto_5642 ?auto_5658 ) ) ( not ( = ?auto_5642 ?auto_5650 ) ) ( not ( = ?auto_5642 ?auto_5660 ) ) ( not ( = ?auto_5642 ?auto_5655 ) ) ( not ( = ?auto_5638 ?auto_5648 ) ) ( not ( = ?auto_5638 ?auto_5647 ) ) ( not ( = ?auto_5638 ?auto_5652 ) ) ( not ( = ?auto_5638 ?auto_5661 ) ) ( not ( = ?auto_5644 ?auto_5657 ) ) ( not ( = ?auto_5644 ?auto_5645 ) ) ( not ( = ?auto_5644 ?auto_5651 ) ) ( not ( = ?auto_5644 ?auto_5646 ) ) ( not ( = ?auto_5628 ?auto_5634 ) ) ( not ( = ?auto_5628 ?auto_5659 ) ) ( not ( = ?auto_5629 ?auto_5634 ) ) ( not ( = ?auto_5629 ?auto_5659 ) ) ( not ( = ?auto_5630 ?auto_5634 ) ) ( not ( = ?auto_5630 ?auto_5659 ) ) ( not ( = ?auto_5631 ?auto_5634 ) ) ( not ( = ?auto_5631 ?auto_5659 ) ) ( not ( = ?auto_5632 ?auto_5634 ) ) ( not ( = ?auto_5632 ?auto_5659 ) ) ( not ( = ?auto_5634 ?auto_5644 ) ) ( not ( = ?auto_5634 ?auto_5657 ) ) ( not ( = ?auto_5634 ?auto_5645 ) ) ( not ( = ?auto_5634 ?auto_5651 ) ) ( not ( = ?auto_5634 ?auto_5646 ) ) ( not ( = ?auto_5659 ?auto_5644 ) ) ( not ( = ?auto_5659 ?auto_5657 ) ) ( not ( = ?auto_5659 ?auto_5645 ) ) ( not ( = ?auto_5659 ?auto_5651 ) ) ( not ( = ?auto_5659 ?auto_5646 ) ) ( not ( = ?auto_5628 ?auto_5635 ) ) ( not ( = ?auto_5628 ?auto_5656 ) ) ( not ( = ?auto_5629 ?auto_5635 ) ) ( not ( = ?auto_5629 ?auto_5656 ) ) ( not ( = ?auto_5630 ?auto_5635 ) ) ( not ( = ?auto_5630 ?auto_5656 ) ) ( not ( = ?auto_5631 ?auto_5635 ) ) ( not ( = ?auto_5631 ?auto_5656 ) ) ( not ( = ?auto_5632 ?auto_5635 ) ) ( not ( = ?auto_5632 ?auto_5656 ) ) ( not ( = ?auto_5633 ?auto_5635 ) ) ( not ( = ?auto_5633 ?auto_5656 ) ) ( not ( = ?auto_5635 ?auto_5659 ) ) ( not ( = ?auto_5635 ?auto_5644 ) ) ( not ( = ?auto_5635 ?auto_5657 ) ) ( not ( = ?auto_5635 ?auto_5645 ) ) ( not ( = ?auto_5635 ?auto_5651 ) ) ( not ( = ?auto_5635 ?auto_5646 ) ) ( not ( = ?auto_5649 ?auto_5642 ) ) ( not ( = ?auto_5649 ?auto_5658 ) ) ( not ( = ?auto_5649 ?auto_5650 ) ) ( not ( = ?auto_5649 ?auto_5660 ) ) ( not ( = ?auto_5649 ?auto_5655 ) ) ( not ( = ?auto_5654 ?auto_5638 ) ) ( not ( = ?auto_5654 ?auto_5648 ) ) ( not ( = ?auto_5654 ?auto_5647 ) ) ( not ( = ?auto_5654 ?auto_5652 ) ) ( not ( = ?auto_5654 ?auto_5661 ) ) ( not ( = ?auto_5656 ?auto_5659 ) ) ( not ( = ?auto_5656 ?auto_5644 ) ) ( not ( = ?auto_5656 ?auto_5657 ) ) ( not ( = ?auto_5656 ?auto_5645 ) ) ( not ( = ?auto_5656 ?auto_5651 ) ) ( not ( = ?auto_5656 ?auto_5646 ) ) ( not ( = ?auto_5628 ?auto_5636 ) ) ( not ( = ?auto_5628 ?auto_5653 ) ) ( not ( = ?auto_5629 ?auto_5636 ) ) ( not ( = ?auto_5629 ?auto_5653 ) ) ( not ( = ?auto_5630 ?auto_5636 ) ) ( not ( = ?auto_5630 ?auto_5653 ) ) ( not ( = ?auto_5631 ?auto_5636 ) ) ( not ( = ?auto_5631 ?auto_5653 ) ) ( not ( = ?auto_5632 ?auto_5636 ) ) ( not ( = ?auto_5632 ?auto_5653 ) ) ( not ( = ?auto_5633 ?auto_5636 ) ) ( not ( = ?auto_5633 ?auto_5653 ) ) ( not ( = ?auto_5634 ?auto_5636 ) ) ( not ( = ?auto_5634 ?auto_5653 ) ) ( not ( = ?auto_5636 ?auto_5656 ) ) ( not ( = ?auto_5636 ?auto_5659 ) ) ( not ( = ?auto_5636 ?auto_5644 ) ) ( not ( = ?auto_5636 ?auto_5657 ) ) ( not ( = ?auto_5636 ?auto_5645 ) ) ( not ( = ?auto_5636 ?auto_5651 ) ) ( not ( = ?auto_5636 ?auto_5646 ) ) ( not ( = ?auto_5653 ?auto_5656 ) ) ( not ( = ?auto_5653 ?auto_5659 ) ) ( not ( = ?auto_5653 ?auto_5644 ) ) ( not ( = ?auto_5653 ?auto_5657 ) ) ( not ( = ?auto_5653 ?auto_5645 ) ) ( not ( = ?auto_5653 ?auto_5651 ) ) ( not ( = ?auto_5653 ?auto_5646 ) ) ( not ( = ?auto_5628 ?auto_5637 ) ) ( not ( = ?auto_5628 ?auto_5639 ) ) ( not ( = ?auto_5629 ?auto_5637 ) ) ( not ( = ?auto_5629 ?auto_5639 ) ) ( not ( = ?auto_5630 ?auto_5637 ) ) ( not ( = ?auto_5630 ?auto_5639 ) ) ( not ( = ?auto_5631 ?auto_5637 ) ) ( not ( = ?auto_5631 ?auto_5639 ) ) ( not ( = ?auto_5632 ?auto_5637 ) ) ( not ( = ?auto_5632 ?auto_5639 ) ) ( not ( = ?auto_5633 ?auto_5637 ) ) ( not ( = ?auto_5633 ?auto_5639 ) ) ( not ( = ?auto_5634 ?auto_5637 ) ) ( not ( = ?auto_5634 ?auto_5639 ) ) ( not ( = ?auto_5635 ?auto_5637 ) ) ( not ( = ?auto_5635 ?auto_5639 ) ) ( not ( = ?auto_5637 ?auto_5653 ) ) ( not ( = ?auto_5637 ?auto_5656 ) ) ( not ( = ?auto_5637 ?auto_5659 ) ) ( not ( = ?auto_5637 ?auto_5644 ) ) ( not ( = ?auto_5637 ?auto_5657 ) ) ( not ( = ?auto_5637 ?auto_5645 ) ) ( not ( = ?auto_5637 ?auto_5651 ) ) ( not ( = ?auto_5637 ?auto_5646 ) ) ( not ( = ?auto_5639 ?auto_5653 ) ) ( not ( = ?auto_5639 ?auto_5656 ) ) ( not ( = ?auto_5639 ?auto_5659 ) ) ( not ( = ?auto_5639 ?auto_5644 ) ) ( not ( = ?auto_5639 ?auto_5657 ) ) ( not ( = ?auto_5639 ?auto_5645 ) ) ( not ( = ?auto_5639 ?auto_5651 ) ) ( not ( = ?auto_5639 ?auto_5646 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_5628 ?auto_5629 ?auto_5630 ?auto_5631 ?auto_5632 ?auto_5633 ?auto_5634 ?auto_5635 ?auto_5636 )
      ( MAKE-1CRATE ?auto_5636 ?auto_5637 )
      ( MAKE-9CRATE-VERIFY ?auto_5628 ?auto_5629 ?auto_5630 ?auto_5631 ?auto_5632 ?auto_5633 ?auto_5634 ?auto_5635 ?auto_5636 ?auto_5637 ) )
  )

)

