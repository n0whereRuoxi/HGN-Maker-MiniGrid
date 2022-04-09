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
      ?auto_5348 - SURFACE
      ?auto_5349 - SURFACE
    )
    :vars
    (
      ?auto_5350 - HOIST
      ?auto_5351 - PLACE
      ?auto_5353 - PLACE
      ?auto_5354 - HOIST
      ?auto_5355 - SURFACE
      ?auto_5352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5350 ?auto_5351 ) ( SURFACE-AT ?auto_5348 ?auto_5351 ) ( CLEAR ?auto_5348 ) ( IS-CRATE ?auto_5349 ) ( AVAILABLE ?auto_5350 ) ( not ( = ?auto_5353 ?auto_5351 ) ) ( HOIST-AT ?auto_5354 ?auto_5353 ) ( AVAILABLE ?auto_5354 ) ( SURFACE-AT ?auto_5349 ?auto_5353 ) ( ON ?auto_5349 ?auto_5355 ) ( CLEAR ?auto_5349 ) ( TRUCK-AT ?auto_5352 ?auto_5351 ) ( not ( = ?auto_5348 ?auto_5349 ) ) ( not ( = ?auto_5348 ?auto_5355 ) ) ( not ( = ?auto_5349 ?auto_5355 ) ) ( not ( = ?auto_5350 ?auto_5354 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5352 ?auto_5351 ?auto_5353 )
      ( !LIFT ?auto_5354 ?auto_5349 ?auto_5355 ?auto_5353 )
      ( !LOAD ?auto_5354 ?auto_5349 ?auto_5352 ?auto_5353 )
      ( !DRIVE ?auto_5352 ?auto_5353 ?auto_5351 )
      ( !UNLOAD ?auto_5350 ?auto_5349 ?auto_5352 ?auto_5351 )
      ( !DROP ?auto_5350 ?auto_5349 ?auto_5348 ?auto_5351 )
      ( MAKE-1CRATE-VERIFY ?auto_5348 ?auto_5349 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5358 - SURFACE
      ?auto_5359 - SURFACE
    )
    :vars
    (
      ?auto_5360 - HOIST
      ?auto_5361 - PLACE
      ?auto_5363 - PLACE
      ?auto_5364 - HOIST
      ?auto_5365 - SURFACE
      ?auto_5362 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5360 ?auto_5361 ) ( SURFACE-AT ?auto_5358 ?auto_5361 ) ( CLEAR ?auto_5358 ) ( IS-CRATE ?auto_5359 ) ( AVAILABLE ?auto_5360 ) ( not ( = ?auto_5363 ?auto_5361 ) ) ( HOIST-AT ?auto_5364 ?auto_5363 ) ( AVAILABLE ?auto_5364 ) ( SURFACE-AT ?auto_5359 ?auto_5363 ) ( ON ?auto_5359 ?auto_5365 ) ( CLEAR ?auto_5359 ) ( TRUCK-AT ?auto_5362 ?auto_5361 ) ( not ( = ?auto_5358 ?auto_5359 ) ) ( not ( = ?auto_5358 ?auto_5365 ) ) ( not ( = ?auto_5359 ?auto_5365 ) ) ( not ( = ?auto_5360 ?auto_5364 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5362 ?auto_5361 ?auto_5363 )
      ( !LIFT ?auto_5364 ?auto_5359 ?auto_5365 ?auto_5363 )
      ( !LOAD ?auto_5364 ?auto_5359 ?auto_5362 ?auto_5363 )
      ( !DRIVE ?auto_5362 ?auto_5363 ?auto_5361 )
      ( !UNLOAD ?auto_5360 ?auto_5359 ?auto_5362 ?auto_5361 )
      ( !DROP ?auto_5360 ?auto_5359 ?auto_5358 ?auto_5361 )
      ( MAKE-1CRATE-VERIFY ?auto_5358 ?auto_5359 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5369 - SURFACE
      ?auto_5370 - SURFACE
      ?auto_5371 - SURFACE
    )
    :vars
    (
      ?auto_5376 - HOIST
      ?auto_5377 - PLACE
      ?auto_5373 - PLACE
      ?auto_5372 - HOIST
      ?auto_5375 - SURFACE
      ?auto_5378 - SURFACE
      ?auto_5374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5376 ?auto_5377 ) ( IS-CRATE ?auto_5371 ) ( not ( = ?auto_5373 ?auto_5377 ) ) ( HOIST-AT ?auto_5372 ?auto_5373 ) ( SURFACE-AT ?auto_5371 ?auto_5373 ) ( ON ?auto_5371 ?auto_5375 ) ( CLEAR ?auto_5371 ) ( not ( = ?auto_5370 ?auto_5371 ) ) ( not ( = ?auto_5370 ?auto_5375 ) ) ( not ( = ?auto_5371 ?auto_5375 ) ) ( not ( = ?auto_5376 ?auto_5372 ) ) ( SURFACE-AT ?auto_5369 ?auto_5377 ) ( CLEAR ?auto_5369 ) ( IS-CRATE ?auto_5370 ) ( AVAILABLE ?auto_5376 ) ( AVAILABLE ?auto_5372 ) ( SURFACE-AT ?auto_5370 ?auto_5373 ) ( ON ?auto_5370 ?auto_5378 ) ( CLEAR ?auto_5370 ) ( TRUCK-AT ?auto_5374 ?auto_5377 ) ( not ( = ?auto_5369 ?auto_5370 ) ) ( not ( = ?auto_5369 ?auto_5378 ) ) ( not ( = ?auto_5370 ?auto_5378 ) ) ( not ( = ?auto_5369 ?auto_5371 ) ) ( not ( = ?auto_5369 ?auto_5375 ) ) ( not ( = ?auto_5371 ?auto_5378 ) ) ( not ( = ?auto_5375 ?auto_5378 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5369 ?auto_5370 )
      ( MAKE-1CRATE ?auto_5370 ?auto_5371 )
      ( MAKE-2CRATE-VERIFY ?auto_5369 ?auto_5370 ?auto_5371 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5381 - SURFACE
      ?auto_5382 - SURFACE
    )
    :vars
    (
      ?auto_5383 - HOIST
      ?auto_5384 - PLACE
      ?auto_5386 - PLACE
      ?auto_5387 - HOIST
      ?auto_5388 - SURFACE
      ?auto_5385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5383 ?auto_5384 ) ( SURFACE-AT ?auto_5381 ?auto_5384 ) ( CLEAR ?auto_5381 ) ( IS-CRATE ?auto_5382 ) ( AVAILABLE ?auto_5383 ) ( not ( = ?auto_5386 ?auto_5384 ) ) ( HOIST-AT ?auto_5387 ?auto_5386 ) ( AVAILABLE ?auto_5387 ) ( SURFACE-AT ?auto_5382 ?auto_5386 ) ( ON ?auto_5382 ?auto_5388 ) ( CLEAR ?auto_5382 ) ( TRUCK-AT ?auto_5385 ?auto_5384 ) ( not ( = ?auto_5381 ?auto_5382 ) ) ( not ( = ?auto_5381 ?auto_5388 ) ) ( not ( = ?auto_5382 ?auto_5388 ) ) ( not ( = ?auto_5383 ?auto_5387 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5385 ?auto_5384 ?auto_5386 )
      ( !LIFT ?auto_5387 ?auto_5382 ?auto_5388 ?auto_5386 )
      ( !LOAD ?auto_5387 ?auto_5382 ?auto_5385 ?auto_5386 )
      ( !DRIVE ?auto_5385 ?auto_5386 ?auto_5384 )
      ( !UNLOAD ?auto_5383 ?auto_5382 ?auto_5385 ?auto_5384 )
      ( !DROP ?auto_5383 ?auto_5382 ?auto_5381 ?auto_5384 )
      ( MAKE-1CRATE-VERIFY ?auto_5381 ?auto_5382 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5393 - SURFACE
      ?auto_5394 - SURFACE
      ?auto_5395 - SURFACE
      ?auto_5396 - SURFACE
    )
    :vars
    (
      ?auto_5399 - HOIST
      ?auto_5402 - PLACE
      ?auto_5398 - PLACE
      ?auto_5401 - HOIST
      ?auto_5397 - SURFACE
      ?auto_5403 - PLACE
      ?auto_5404 - HOIST
      ?auto_5405 - SURFACE
      ?auto_5406 - SURFACE
      ?auto_5400 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5399 ?auto_5402 ) ( IS-CRATE ?auto_5396 ) ( not ( = ?auto_5398 ?auto_5402 ) ) ( HOIST-AT ?auto_5401 ?auto_5398 ) ( AVAILABLE ?auto_5401 ) ( SURFACE-AT ?auto_5396 ?auto_5398 ) ( ON ?auto_5396 ?auto_5397 ) ( CLEAR ?auto_5396 ) ( not ( = ?auto_5395 ?auto_5396 ) ) ( not ( = ?auto_5395 ?auto_5397 ) ) ( not ( = ?auto_5396 ?auto_5397 ) ) ( not ( = ?auto_5399 ?auto_5401 ) ) ( IS-CRATE ?auto_5395 ) ( not ( = ?auto_5403 ?auto_5402 ) ) ( HOIST-AT ?auto_5404 ?auto_5403 ) ( SURFACE-AT ?auto_5395 ?auto_5403 ) ( ON ?auto_5395 ?auto_5405 ) ( CLEAR ?auto_5395 ) ( not ( = ?auto_5394 ?auto_5395 ) ) ( not ( = ?auto_5394 ?auto_5405 ) ) ( not ( = ?auto_5395 ?auto_5405 ) ) ( not ( = ?auto_5399 ?auto_5404 ) ) ( SURFACE-AT ?auto_5393 ?auto_5402 ) ( CLEAR ?auto_5393 ) ( IS-CRATE ?auto_5394 ) ( AVAILABLE ?auto_5399 ) ( AVAILABLE ?auto_5404 ) ( SURFACE-AT ?auto_5394 ?auto_5403 ) ( ON ?auto_5394 ?auto_5406 ) ( CLEAR ?auto_5394 ) ( TRUCK-AT ?auto_5400 ?auto_5402 ) ( not ( = ?auto_5393 ?auto_5394 ) ) ( not ( = ?auto_5393 ?auto_5406 ) ) ( not ( = ?auto_5394 ?auto_5406 ) ) ( not ( = ?auto_5393 ?auto_5395 ) ) ( not ( = ?auto_5393 ?auto_5405 ) ) ( not ( = ?auto_5395 ?auto_5406 ) ) ( not ( = ?auto_5405 ?auto_5406 ) ) ( not ( = ?auto_5393 ?auto_5396 ) ) ( not ( = ?auto_5393 ?auto_5397 ) ) ( not ( = ?auto_5394 ?auto_5396 ) ) ( not ( = ?auto_5394 ?auto_5397 ) ) ( not ( = ?auto_5396 ?auto_5405 ) ) ( not ( = ?auto_5396 ?auto_5406 ) ) ( not ( = ?auto_5398 ?auto_5403 ) ) ( not ( = ?auto_5401 ?auto_5404 ) ) ( not ( = ?auto_5397 ?auto_5405 ) ) ( not ( = ?auto_5397 ?auto_5406 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5393 ?auto_5394 ?auto_5395 )
      ( MAKE-1CRATE ?auto_5395 ?auto_5396 )
      ( MAKE-3CRATE-VERIFY ?auto_5393 ?auto_5394 ?auto_5395 ?auto_5396 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5409 - SURFACE
      ?auto_5410 - SURFACE
    )
    :vars
    (
      ?auto_5411 - HOIST
      ?auto_5412 - PLACE
      ?auto_5414 - PLACE
      ?auto_5415 - HOIST
      ?auto_5416 - SURFACE
      ?auto_5413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5411 ?auto_5412 ) ( SURFACE-AT ?auto_5409 ?auto_5412 ) ( CLEAR ?auto_5409 ) ( IS-CRATE ?auto_5410 ) ( AVAILABLE ?auto_5411 ) ( not ( = ?auto_5414 ?auto_5412 ) ) ( HOIST-AT ?auto_5415 ?auto_5414 ) ( AVAILABLE ?auto_5415 ) ( SURFACE-AT ?auto_5410 ?auto_5414 ) ( ON ?auto_5410 ?auto_5416 ) ( CLEAR ?auto_5410 ) ( TRUCK-AT ?auto_5413 ?auto_5412 ) ( not ( = ?auto_5409 ?auto_5410 ) ) ( not ( = ?auto_5409 ?auto_5416 ) ) ( not ( = ?auto_5410 ?auto_5416 ) ) ( not ( = ?auto_5411 ?auto_5415 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5413 ?auto_5412 ?auto_5414 )
      ( !LIFT ?auto_5415 ?auto_5410 ?auto_5416 ?auto_5414 )
      ( !LOAD ?auto_5415 ?auto_5410 ?auto_5413 ?auto_5414 )
      ( !DRIVE ?auto_5413 ?auto_5414 ?auto_5412 )
      ( !UNLOAD ?auto_5411 ?auto_5410 ?auto_5413 ?auto_5412 )
      ( !DROP ?auto_5411 ?auto_5410 ?auto_5409 ?auto_5412 )
      ( MAKE-1CRATE-VERIFY ?auto_5409 ?auto_5410 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5422 - SURFACE
      ?auto_5423 - SURFACE
      ?auto_5424 - SURFACE
      ?auto_5425 - SURFACE
      ?auto_5426 - SURFACE
    )
    :vars
    (
      ?auto_5428 - HOIST
      ?auto_5431 - PLACE
      ?auto_5432 - PLACE
      ?auto_5430 - HOIST
      ?auto_5429 - SURFACE
      ?auto_5435 - PLACE
      ?auto_5436 - HOIST
      ?auto_5433 - SURFACE
      ?auto_5437 - SURFACE
      ?auto_5434 - SURFACE
      ?auto_5427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5428 ?auto_5431 ) ( IS-CRATE ?auto_5426 ) ( not ( = ?auto_5432 ?auto_5431 ) ) ( HOIST-AT ?auto_5430 ?auto_5432 ) ( SURFACE-AT ?auto_5426 ?auto_5432 ) ( ON ?auto_5426 ?auto_5429 ) ( CLEAR ?auto_5426 ) ( not ( = ?auto_5425 ?auto_5426 ) ) ( not ( = ?auto_5425 ?auto_5429 ) ) ( not ( = ?auto_5426 ?auto_5429 ) ) ( not ( = ?auto_5428 ?auto_5430 ) ) ( IS-CRATE ?auto_5425 ) ( not ( = ?auto_5435 ?auto_5431 ) ) ( HOIST-AT ?auto_5436 ?auto_5435 ) ( AVAILABLE ?auto_5436 ) ( SURFACE-AT ?auto_5425 ?auto_5435 ) ( ON ?auto_5425 ?auto_5433 ) ( CLEAR ?auto_5425 ) ( not ( = ?auto_5424 ?auto_5425 ) ) ( not ( = ?auto_5424 ?auto_5433 ) ) ( not ( = ?auto_5425 ?auto_5433 ) ) ( not ( = ?auto_5428 ?auto_5436 ) ) ( IS-CRATE ?auto_5424 ) ( SURFACE-AT ?auto_5424 ?auto_5432 ) ( ON ?auto_5424 ?auto_5437 ) ( CLEAR ?auto_5424 ) ( not ( = ?auto_5423 ?auto_5424 ) ) ( not ( = ?auto_5423 ?auto_5437 ) ) ( not ( = ?auto_5424 ?auto_5437 ) ) ( SURFACE-AT ?auto_5422 ?auto_5431 ) ( CLEAR ?auto_5422 ) ( IS-CRATE ?auto_5423 ) ( AVAILABLE ?auto_5428 ) ( AVAILABLE ?auto_5430 ) ( SURFACE-AT ?auto_5423 ?auto_5432 ) ( ON ?auto_5423 ?auto_5434 ) ( CLEAR ?auto_5423 ) ( TRUCK-AT ?auto_5427 ?auto_5431 ) ( not ( = ?auto_5422 ?auto_5423 ) ) ( not ( = ?auto_5422 ?auto_5434 ) ) ( not ( = ?auto_5423 ?auto_5434 ) ) ( not ( = ?auto_5422 ?auto_5424 ) ) ( not ( = ?auto_5422 ?auto_5437 ) ) ( not ( = ?auto_5424 ?auto_5434 ) ) ( not ( = ?auto_5437 ?auto_5434 ) ) ( not ( = ?auto_5422 ?auto_5425 ) ) ( not ( = ?auto_5422 ?auto_5433 ) ) ( not ( = ?auto_5423 ?auto_5425 ) ) ( not ( = ?auto_5423 ?auto_5433 ) ) ( not ( = ?auto_5425 ?auto_5437 ) ) ( not ( = ?auto_5425 ?auto_5434 ) ) ( not ( = ?auto_5435 ?auto_5432 ) ) ( not ( = ?auto_5436 ?auto_5430 ) ) ( not ( = ?auto_5433 ?auto_5437 ) ) ( not ( = ?auto_5433 ?auto_5434 ) ) ( not ( = ?auto_5422 ?auto_5426 ) ) ( not ( = ?auto_5422 ?auto_5429 ) ) ( not ( = ?auto_5423 ?auto_5426 ) ) ( not ( = ?auto_5423 ?auto_5429 ) ) ( not ( = ?auto_5424 ?auto_5426 ) ) ( not ( = ?auto_5424 ?auto_5429 ) ) ( not ( = ?auto_5426 ?auto_5433 ) ) ( not ( = ?auto_5426 ?auto_5437 ) ) ( not ( = ?auto_5426 ?auto_5434 ) ) ( not ( = ?auto_5429 ?auto_5433 ) ) ( not ( = ?auto_5429 ?auto_5437 ) ) ( not ( = ?auto_5429 ?auto_5434 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_5422 ?auto_5423 ?auto_5424 ?auto_5425 )
      ( MAKE-1CRATE ?auto_5425 ?auto_5426 )
      ( MAKE-4CRATE-VERIFY ?auto_5422 ?auto_5423 ?auto_5424 ?auto_5425 ?auto_5426 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5440 - SURFACE
      ?auto_5441 - SURFACE
    )
    :vars
    (
      ?auto_5442 - HOIST
      ?auto_5443 - PLACE
      ?auto_5445 - PLACE
      ?auto_5446 - HOIST
      ?auto_5447 - SURFACE
      ?auto_5444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5442 ?auto_5443 ) ( SURFACE-AT ?auto_5440 ?auto_5443 ) ( CLEAR ?auto_5440 ) ( IS-CRATE ?auto_5441 ) ( AVAILABLE ?auto_5442 ) ( not ( = ?auto_5445 ?auto_5443 ) ) ( HOIST-AT ?auto_5446 ?auto_5445 ) ( AVAILABLE ?auto_5446 ) ( SURFACE-AT ?auto_5441 ?auto_5445 ) ( ON ?auto_5441 ?auto_5447 ) ( CLEAR ?auto_5441 ) ( TRUCK-AT ?auto_5444 ?auto_5443 ) ( not ( = ?auto_5440 ?auto_5441 ) ) ( not ( = ?auto_5440 ?auto_5447 ) ) ( not ( = ?auto_5441 ?auto_5447 ) ) ( not ( = ?auto_5442 ?auto_5446 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5444 ?auto_5443 ?auto_5445 )
      ( !LIFT ?auto_5446 ?auto_5441 ?auto_5447 ?auto_5445 )
      ( !LOAD ?auto_5446 ?auto_5441 ?auto_5444 ?auto_5445 )
      ( !DRIVE ?auto_5444 ?auto_5445 ?auto_5443 )
      ( !UNLOAD ?auto_5442 ?auto_5441 ?auto_5444 ?auto_5443 )
      ( !DROP ?auto_5442 ?auto_5441 ?auto_5440 ?auto_5443 )
      ( MAKE-1CRATE-VERIFY ?auto_5440 ?auto_5441 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_5454 - SURFACE
      ?auto_5455 - SURFACE
      ?auto_5456 - SURFACE
      ?auto_5457 - SURFACE
      ?auto_5458 - SURFACE
      ?auto_5459 - SURFACE
    )
    :vars
    (
      ?auto_5460 - HOIST
      ?auto_5463 - PLACE
      ?auto_5464 - PLACE
      ?auto_5462 - HOIST
      ?auto_5461 - SURFACE
      ?auto_5468 - PLACE
      ?auto_5469 - HOIST
      ?auto_5473 - SURFACE
      ?auto_5470 - PLACE
      ?auto_5467 - HOIST
      ?auto_5471 - SURFACE
      ?auto_5472 - SURFACE
      ?auto_5466 - SURFACE
      ?auto_5465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5460 ?auto_5463 ) ( IS-CRATE ?auto_5459 ) ( not ( = ?auto_5464 ?auto_5463 ) ) ( HOIST-AT ?auto_5462 ?auto_5464 ) ( AVAILABLE ?auto_5462 ) ( SURFACE-AT ?auto_5459 ?auto_5464 ) ( ON ?auto_5459 ?auto_5461 ) ( CLEAR ?auto_5459 ) ( not ( = ?auto_5458 ?auto_5459 ) ) ( not ( = ?auto_5458 ?auto_5461 ) ) ( not ( = ?auto_5459 ?auto_5461 ) ) ( not ( = ?auto_5460 ?auto_5462 ) ) ( IS-CRATE ?auto_5458 ) ( not ( = ?auto_5468 ?auto_5463 ) ) ( HOIST-AT ?auto_5469 ?auto_5468 ) ( SURFACE-AT ?auto_5458 ?auto_5468 ) ( ON ?auto_5458 ?auto_5473 ) ( CLEAR ?auto_5458 ) ( not ( = ?auto_5457 ?auto_5458 ) ) ( not ( = ?auto_5457 ?auto_5473 ) ) ( not ( = ?auto_5458 ?auto_5473 ) ) ( not ( = ?auto_5460 ?auto_5469 ) ) ( IS-CRATE ?auto_5457 ) ( not ( = ?auto_5470 ?auto_5463 ) ) ( HOIST-AT ?auto_5467 ?auto_5470 ) ( AVAILABLE ?auto_5467 ) ( SURFACE-AT ?auto_5457 ?auto_5470 ) ( ON ?auto_5457 ?auto_5471 ) ( CLEAR ?auto_5457 ) ( not ( = ?auto_5456 ?auto_5457 ) ) ( not ( = ?auto_5456 ?auto_5471 ) ) ( not ( = ?auto_5457 ?auto_5471 ) ) ( not ( = ?auto_5460 ?auto_5467 ) ) ( IS-CRATE ?auto_5456 ) ( SURFACE-AT ?auto_5456 ?auto_5468 ) ( ON ?auto_5456 ?auto_5472 ) ( CLEAR ?auto_5456 ) ( not ( = ?auto_5455 ?auto_5456 ) ) ( not ( = ?auto_5455 ?auto_5472 ) ) ( not ( = ?auto_5456 ?auto_5472 ) ) ( SURFACE-AT ?auto_5454 ?auto_5463 ) ( CLEAR ?auto_5454 ) ( IS-CRATE ?auto_5455 ) ( AVAILABLE ?auto_5460 ) ( AVAILABLE ?auto_5469 ) ( SURFACE-AT ?auto_5455 ?auto_5468 ) ( ON ?auto_5455 ?auto_5466 ) ( CLEAR ?auto_5455 ) ( TRUCK-AT ?auto_5465 ?auto_5463 ) ( not ( = ?auto_5454 ?auto_5455 ) ) ( not ( = ?auto_5454 ?auto_5466 ) ) ( not ( = ?auto_5455 ?auto_5466 ) ) ( not ( = ?auto_5454 ?auto_5456 ) ) ( not ( = ?auto_5454 ?auto_5472 ) ) ( not ( = ?auto_5456 ?auto_5466 ) ) ( not ( = ?auto_5472 ?auto_5466 ) ) ( not ( = ?auto_5454 ?auto_5457 ) ) ( not ( = ?auto_5454 ?auto_5471 ) ) ( not ( = ?auto_5455 ?auto_5457 ) ) ( not ( = ?auto_5455 ?auto_5471 ) ) ( not ( = ?auto_5457 ?auto_5472 ) ) ( not ( = ?auto_5457 ?auto_5466 ) ) ( not ( = ?auto_5470 ?auto_5468 ) ) ( not ( = ?auto_5467 ?auto_5469 ) ) ( not ( = ?auto_5471 ?auto_5472 ) ) ( not ( = ?auto_5471 ?auto_5466 ) ) ( not ( = ?auto_5454 ?auto_5458 ) ) ( not ( = ?auto_5454 ?auto_5473 ) ) ( not ( = ?auto_5455 ?auto_5458 ) ) ( not ( = ?auto_5455 ?auto_5473 ) ) ( not ( = ?auto_5456 ?auto_5458 ) ) ( not ( = ?auto_5456 ?auto_5473 ) ) ( not ( = ?auto_5458 ?auto_5471 ) ) ( not ( = ?auto_5458 ?auto_5472 ) ) ( not ( = ?auto_5458 ?auto_5466 ) ) ( not ( = ?auto_5473 ?auto_5471 ) ) ( not ( = ?auto_5473 ?auto_5472 ) ) ( not ( = ?auto_5473 ?auto_5466 ) ) ( not ( = ?auto_5454 ?auto_5459 ) ) ( not ( = ?auto_5454 ?auto_5461 ) ) ( not ( = ?auto_5455 ?auto_5459 ) ) ( not ( = ?auto_5455 ?auto_5461 ) ) ( not ( = ?auto_5456 ?auto_5459 ) ) ( not ( = ?auto_5456 ?auto_5461 ) ) ( not ( = ?auto_5457 ?auto_5459 ) ) ( not ( = ?auto_5457 ?auto_5461 ) ) ( not ( = ?auto_5459 ?auto_5473 ) ) ( not ( = ?auto_5459 ?auto_5471 ) ) ( not ( = ?auto_5459 ?auto_5472 ) ) ( not ( = ?auto_5459 ?auto_5466 ) ) ( not ( = ?auto_5464 ?auto_5468 ) ) ( not ( = ?auto_5464 ?auto_5470 ) ) ( not ( = ?auto_5462 ?auto_5469 ) ) ( not ( = ?auto_5462 ?auto_5467 ) ) ( not ( = ?auto_5461 ?auto_5473 ) ) ( not ( = ?auto_5461 ?auto_5471 ) ) ( not ( = ?auto_5461 ?auto_5472 ) ) ( not ( = ?auto_5461 ?auto_5466 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_5454 ?auto_5455 ?auto_5456 ?auto_5457 ?auto_5458 )
      ( MAKE-1CRATE ?auto_5458 ?auto_5459 )
      ( MAKE-5CRATE-VERIFY ?auto_5454 ?auto_5455 ?auto_5456 ?auto_5457 ?auto_5458 ?auto_5459 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5476 - SURFACE
      ?auto_5477 - SURFACE
    )
    :vars
    (
      ?auto_5478 - HOIST
      ?auto_5479 - PLACE
      ?auto_5481 - PLACE
      ?auto_5482 - HOIST
      ?auto_5483 - SURFACE
      ?auto_5480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5478 ?auto_5479 ) ( SURFACE-AT ?auto_5476 ?auto_5479 ) ( CLEAR ?auto_5476 ) ( IS-CRATE ?auto_5477 ) ( AVAILABLE ?auto_5478 ) ( not ( = ?auto_5481 ?auto_5479 ) ) ( HOIST-AT ?auto_5482 ?auto_5481 ) ( AVAILABLE ?auto_5482 ) ( SURFACE-AT ?auto_5477 ?auto_5481 ) ( ON ?auto_5477 ?auto_5483 ) ( CLEAR ?auto_5477 ) ( TRUCK-AT ?auto_5480 ?auto_5479 ) ( not ( = ?auto_5476 ?auto_5477 ) ) ( not ( = ?auto_5476 ?auto_5483 ) ) ( not ( = ?auto_5477 ?auto_5483 ) ) ( not ( = ?auto_5478 ?auto_5482 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5480 ?auto_5479 ?auto_5481 )
      ( !LIFT ?auto_5482 ?auto_5477 ?auto_5483 ?auto_5481 )
      ( !LOAD ?auto_5482 ?auto_5477 ?auto_5480 ?auto_5481 )
      ( !DRIVE ?auto_5480 ?auto_5481 ?auto_5479 )
      ( !UNLOAD ?auto_5478 ?auto_5477 ?auto_5480 ?auto_5479 )
      ( !DROP ?auto_5478 ?auto_5477 ?auto_5476 ?auto_5479 )
      ( MAKE-1CRATE-VERIFY ?auto_5476 ?auto_5477 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_5491 - SURFACE
      ?auto_5492 - SURFACE
      ?auto_5493 - SURFACE
      ?auto_5494 - SURFACE
      ?auto_5495 - SURFACE
      ?auto_5496 - SURFACE
      ?auto_5497 - SURFACE
    )
    :vars
    (
      ?auto_5502 - HOIST
      ?auto_5501 - PLACE
      ?auto_5499 - PLACE
      ?auto_5500 - HOIST
      ?auto_5498 - SURFACE
      ?auto_5505 - PLACE
      ?auto_5506 - HOIST
      ?auto_5508 - SURFACE
      ?auto_5509 - SURFACE
      ?auto_5512 - PLACE
      ?auto_5504 - HOIST
      ?auto_5511 - SURFACE
      ?auto_5510 - SURFACE
      ?auto_5507 - SURFACE
      ?auto_5503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5502 ?auto_5501 ) ( IS-CRATE ?auto_5497 ) ( not ( = ?auto_5499 ?auto_5501 ) ) ( HOIST-AT ?auto_5500 ?auto_5499 ) ( SURFACE-AT ?auto_5497 ?auto_5499 ) ( ON ?auto_5497 ?auto_5498 ) ( CLEAR ?auto_5497 ) ( not ( = ?auto_5496 ?auto_5497 ) ) ( not ( = ?auto_5496 ?auto_5498 ) ) ( not ( = ?auto_5497 ?auto_5498 ) ) ( not ( = ?auto_5502 ?auto_5500 ) ) ( IS-CRATE ?auto_5496 ) ( not ( = ?auto_5505 ?auto_5501 ) ) ( HOIST-AT ?auto_5506 ?auto_5505 ) ( AVAILABLE ?auto_5506 ) ( SURFACE-AT ?auto_5496 ?auto_5505 ) ( ON ?auto_5496 ?auto_5508 ) ( CLEAR ?auto_5496 ) ( not ( = ?auto_5495 ?auto_5496 ) ) ( not ( = ?auto_5495 ?auto_5508 ) ) ( not ( = ?auto_5496 ?auto_5508 ) ) ( not ( = ?auto_5502 ?auto_5506 ) ) ( IS-CRATE ?auto_5495 ) ( SURFACE-AT ?auto_5495 ?auto_5499 ) ( ON ?auto_5495 ?auto_5509 ) ( CLEAR ?auto_5495 ) ( not ( = ?auto_5494 ?auto_5495 ) ) ( not ( = ?auto_5494 ?auto_5509 ) ) ( not ( = ?auto_5495 ?auto_5509 ) ) ( IS-CRATE ?auto_5494 ) ( not ( = ?auto_5512 ?auto_5501 ) ) ( HOIST-AT ?auto_5504 ?auto_5512 ) ( AVAILABLE ?auto_5504 ) ( SURFACE-AT ?auto_5494 ?auto_5512 ) ( ON ?auto_5494 ?auto_5511 ) ( CLEAR ?auto_5494 ) ( not ( = ?auto_5493 ?auto_5494 ) ) ( not ( = ?auto_5493 ?auto_5511 ) ) ( not ( = ?auto_5494 ?auto_5511 ) ) ( not ( = ?auto_5502 ?auto_5504 ) ) ( IS-CRATE ?auto_5493 ) ( SURFACE-AT ?auto_5493 ?auto_5499 ) ( ON ?auto_5493 ?auto_5510 ) ( CLEAR ?auto_5493 ) ( not ( = ?auto_5492 ?auto_5493 ) ) ( not ( = ?auto_5492 ?auto_5510 ) ) ( not ( = ?auto_5493 ?auto_5510 ) ) ( SURFACE-AT ?auto_5491 ?auto_5501 ) ( CLEAR ?auto_5491 ) ( IS-CRATE ?auto_5492 ) ( AVAILABLE ?auto_5502 ) ( AVAILABLE ?auto_5500 ) ( SURFACE-AT ?auto_5492 ?auto_5499 ) ( ON ?auto_5492 ?auto_5507 ) ( CLEAR ?auto_5492 ) ( TRUCK-AT ?auto_5503 ?auto_5501 ) ( not ( = ?auto_5491 ?auto_5492 ) ) ( not ( = ?auto_5491 ?auto_5507 ) ) ( not ( = ?auto_5492 ?auto_5507 ) ) ( not ( = ?auto_5491 ?auto_5493 ) ) ( not ( = ?auto_5491 ?auto_5510 ) ) ( not ( = ?auto_5493 ?auto_5507 ) ) ( not ( = ?auto_5510 ?auto_5507 ) ) ( not ( = ?auto_5491 ?auto_5494 ) ) ( not ( = ?auto_5491 ?auto_5511 ) ) ( not ( = ?auto_5492 ?auto_5494 ) ) ( not ( = ?auto_5492 ?auto_5511 ) ) ( not ( = ?auto_5494 ?auto_5510 ) ) ( not ( = ?auto_5494 ?auto_5507 ) ) ( not ( = ?auto_5512 ?auto_5499 ) ) ( not ( = ?auto_5504 ?auto_5500 ) ) ( not ( = ?auto_5511 ?auto_5510 ) ) ( not ( = ?auto_5511 ?auto_5507 ) ) ( not ( = ?auto_5491 ?auto_5495 ) ) ( not ( = ?auto_5491 ?auto_5509 ) ) ( not ( = ?auto_5492 ?auto_5495 ) ) ( not ( = ?auto_5492 ?auto_5509 ) ) ( not ( = ?auto_5493 ?auto_5495 ) ) ( not ( = ?auto_5493 ?auto_5509 ) ) ( not ( = ?auto_5495 ?auto_5511 ) ) ( not ( = ?auto_5495 ?auto_5510 ) ) ( not ( = ?auto_5495 ?auto_5507 ) ) ( not ( = ?auto_5509 ?auto_5511 ) ) ( not ( = ?auto_5509 ?auto_5510 ) ) ( not ( = ?auto_5509 ?auto_5507 ) ) ( not ( = ?auto_5491 ?auto_5496 ) ) ( not ( = ?auto_5491 ?auto_5508 ) ) ( not ( = ?auto_5492 ?auto_5496 ) ) ( not ( = ?auto_5492 ?auto_5508 ) ) ( not ( = ?auto_5493 ?auto_5496 ) ) ( not ( = ?auto_5493 ?auto_5508 ) ) ( not ( = ?auto_5494 ?auto_5496 ) ) ( not ( = ?auto_5494 ?auto_5508 ) ) ( not ( = ?auto_5496 ?auto_5509 ) ) ( not ( = ?auto_5496 ?auto_5511 ) ) ( not ( = ?auto_5496 ?auto_5510 ) ) ( not ( = ?auto_5496 ?auto_5507 ) ) ( not ( = ?auto_5505 ?auto_5499 ) ) ( not ( = ?auto_5505 ?auto_5512 ) ) ( not ( = ?auto_5506 ?auto_5500 ) ) ( not ( = ?auto_5506 ?auto_5504 ) ) ( not ( = ?auto_5508 ?auto_5509 ) ) ( not ( = ?auto_5508 ?auto_5511 ) ) ( not ( = ?auto_5508 ?auto_5510 ) ) ( not ( = ?auto_5508 ?auto_5507 ) ) ( not ( = ?auto_5491 ?auto_5497 ) ) ( not ( = ?auto_5491 ?auto_5498 ) ) ( not ( = ?auto_5492 ?auto_5497 ) ) ( not ( = ?auto_5492 ?auto_5498 ) ) ( not ( = ?auto_5493 ?auto_5497 ) ) ( not ( = ?auto_5493 ?auto_5498 ) ) ( not ( = ?auto_5494 ?auto_5497 ) ) ( not ( = ?auto_5494 ?auto_5498 ) ) ( not ( = ?auto_5495 ?auto_5497 ) ) ( not ( = ?auto_5495 ?auto_5498 ) ) ( not ( = ?auto_5497 ?auto_5508 ) ) ( not ( = ?auto_5497 ?auto_5509 ) ) ( not ( = ?auto_5497 ?auto_5511 ) ) ( not ( = ?auto_5497 ?auto_5510 ) ) ( not ( = ?auto_5497 ?auto_5507 ) ) ( not ( = ?auto_5498 ?auto_5508 ) ) ( not ( = ?auto_5498 ?auto_5509 ) ) ( not ( = ?auto_5498 ?auto_5511 ) ) ( not ( = ?auto_5498 ?auto_5510 ) ) ( not ( = ?auto_5498 ?auto_5507 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_5491 ?auto_5492 ?auto_5493 ?auto_5494 ?auto_5495 ?auto_5496 )
      ( MAKE-1CRATE ?auto_5496 ?auto_5497 )
      ( MAKE-6CRATE-VERIFY ?auto_5491 ?auto_5492 ?auto_5493 ?auto_5494 ?auto_5495 ?auto_5496 ?auto_5497 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5515 - SURFACE
      ?auto_5516 - SURFACE
    )
    :vars
    (
      ?auto_5517 - HOIST
      ?auto_5518 - PLACE
      ?auto_5520 - PLACE
      ?auto_5521 - HOIST
      ?auto_5522 - SURFACE
      ?auto_5519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5517 ?auto_5518 ) ( SURFACE-AT ?auto_5515 ?auto_5518 ) ( CLEAR ?auto_5515 ) ( IS-CRATE ?auto_5516 ) ( AVAILABLE ?auto_5517 ) ( not ( = ?auto_5520 ?auto_5518 ) ) ( HOIST-AT ?auto_5521 ?auto_5520 ) ( AVAILABLE ?auto_5521 ) ( SURFACE-AT ?auto_5516 ?auto_5520 ) ( ON ?auto_5516 ?auto_5522 ) ( CLEAR ?auto_5516 ) ( TRUCK-AT ?auto_5519 ?auto_5518 ) ( not ( = ?auto_5515 ?auto_5516 ) ) ( not ( = ?auto_5515 ?auto_5522 ) ) ( not ( = ?auto_5516 ?auto_5522 ) ) ( not ( = ?auto_5517 ?auto_5521 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5519 ?auto_5518 ?auto_5520 )
      ( !LIFT ?auto_5521 ?auto_5516 ?auto_5522 ?auto_5520 )
      ( !LOAD ?auto_5521 ?auto_5516 ?auto_5519 ?auto_5520 )
      ( !DRIVE ?auto_5519 ?auto_5520 ?auto_5518 )
      ( !UNLOAD ?auto_5517 ?auto_5516 ?auto_5519 ?auto_5518 )
      ( !DROP ?auto_5517 ?auto_5516 ?auto_5515 ?auto_5518 )
      ( MAKE-1CRATE-VERIFY ?auto_5515 ?auto_5516 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_5531 - SURFACE
      ?auto_5532 - SURFACE
      ?auto_5533 - SURFACE
      ?auto_5534 - SURFACE
      ?auto_5535 - SURFACE
      ?auto_5536 - SURFACE
      ?auto_5537 - SURFACE
      ?auto_5538 - SURFACE
    )
    :vars
    (
      ?auto_5540 - HOIST
      ?auto_5539 - PLACE
      ?auto_5543 - PLACE
      ?auto_5544 - HOIST
      ?auto_5542 - SURFACE
      ?auto_5554 - PLACE
      ?auto_5550 - HOIST
      ?auto_5552 - SURFACE
      ?auto_5548 - SURFACE
      ?auto_5547 - SURFACE
      ?auto_5553 - PLACE
      ?auto_5549 - HOIST
      ?auto_5551 - SURFACE
      ?auto_5545 - SURFACE
      ?auto_5546 - SURFACE
      ?auto_5541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5540 ?auto_5539 ) ( IS-CRATE ?auto_5538 ) ( not ( = ?auto_5543 ?auto_5539 ) ) ( HOIST-AT ?auto_5544 ?auto_5543 ) ( SURFACE-AT ?auto_5538 ?auto_5543 ) ( ON ?auto_5538 ?auto_5542 ) ( CLEAR ?auto_5538 ) ( not ( = ?auto_5537 ?auto_5538 ) ) ( not ( = ?auto_5537 ?auto_5542 ) ) ( not ( = ?auto_5538 ?auto_5542 ) ) ( not ( = ?auto_5540 ?auto_5544 ) ) ( IS-CRATE ?auto_5537 ) ( not ( = ?auto_5554 ?auto_5539 ) ) ( HOIST-AT ?auto_5550 ?auto_5554 ) ( SURFACE-AT ?auto_5537 ?auto_5554 ) ( ON ?auto_5537 ?auto_5552 ) ( CLEAR ?auto_5537 ) ( not ( = ?auto_5536 ?auto_5537 ) ) ( not ( = ?auto_5536 ?auto_5552 ) ) ( not ( = ?auto_5537 ?auto_5552 ) ) ( not ( = ?auto_5540 ?auto_5550 ) ) ( IS-CRATE ?auto_5536 ) ( AVAILABLE ?auto_5544 ) ( SURFACE-AT ?auto_5536 ?auto_5543 ) ( ON ?auto_5536 ?auto_5548 ) ( CLEAR ?auto_5536 ) ( not ( = ?auto_5535 ?auto_5536 ) ) ( not ( = ?auto_5535 ?auto_5548 ) ) ( not ( = ?auto_5536 ?auto_5548 ) ) ( IS-CRATE ?auto_5535 ) ( SURFACE-AT ?auto_5535 ?auto_5554 ) ( ON ?auto_5535 ?auto_5547 ) ( CLEAR ?auto_5535 ) ( not ( = ?auto_5534 ?auto_5535 ) ) ( not ( = ?auto_5534 ?auto_5547 ) ) ( not ( = ?auto_5535 ?auto_5547 ) ) ( IS-CRATE ?auto_5534 ) ( not ( = ?auto_5553 ?auto_5539 ) ) ( HOIST-AT ?auto_5549 ?auto_5553 ) ( AVAILABLE ?auto_5549 ) ( SURFACE-AT ?auto_5534 ?auto_5553 ) ( ON ?auto_5534 ?auto_5551 ) ( CLEAR ?auto_5534 ) ( not ( = ?auto_5533 ?auto_5534 ) ) ( not ( = ?auto_5533 ?auto_5551 ) ) ( not ( = ?auto_5534 ?auto_5551 ) ) ( not ( = ?auto_5540 ?auto_5549 ) ) ( IS-CRATE ?auto_5533 ) ( SURFACE-AT ?auto_5533 ?auto_5554 ) ( ON ?auto_5533 ?auto_5545 ) ( CLEAR ?auto_5533 ) ( not ( = ?auto_5532 ?auto_5533 ) ) ( not ( = ?auto_5532 ?auto_5545 ) ) ( not ( = ?auto_5533 ?auto_5545 ) ) ( SURFACE-AT ?auto_5531 ?auto_5539 ) ( CLEAR ?auto_5531 ) ( IS-CRATE ?auto_5532 ) ( AVAILABLE ?auto_5540 ) ( AVAILABLE ?auto_5550 ) ( SURFACE-AT ?auto_5532 ?auto_5554 ) ( ON ?auto_5532 ?auto_5546 ) ( CLEAR ?auto_5532 ) ( TRUCK-AT ?auto_5541 ?auto_5539 ) ( not ( = ?auto_5531 ?auto_5532 ) ) ( not ( = ?auto_5531 ?auto_5546 ) ) ( not ( = ?auto_5532 ?auto_5546 ) ) ( not ( = ?auto_5531 ?auto_5533 ) ) ( not ( = ?auto_5531 ?auto_5545 ) ) ( not ( = ?auto_5533 ?auto_5546 ) ) ( not ( = ?auto_5545 ?auto_5546 ) ) ( not ( = ?auto_5531 ?auto_5534 ) ) ( not ( = ?auto_5531 ?auto_5551 ) ) ( not ( = ?auto_5532 ?auto_5534 ) ) ( not ( = ?auto_5532 ?auto_5551 ) ) ( not ( = ?auto_5534 ?auto_5545 ) ) ( not ( = ?auto_5534 ?auto_5546 ) ) ( not ( = ?auto_5553 ?auto_5554 ) ) ( not ( = ?auto_5549 ?auto_5550 ) ) ( not ( = ?auto_5551 ?auto_5545 ) ) ( not ( = ?auto_5551 ?auto_5546 ) ) ( not ( = ?auto_5531 ?auto_5535 ) ) ( not ( = ?auto_5531 ?auto_5547 ) ) ( not ( = ?auto_5532 ?auto_5535 ) ) ( not ( = ?auto_5532 ?auto_5547 ) ) ( not ( = ?auto_5533 ?auto_5535 ) ) ( not ( = ?auto_5533 ?auto_5547 ) ) ( not ( = ?auto_5535 ?auto_5551 ) ) ( not ( = ?auto_5535 ?auto_5545 ) ) ( not ( = ?auto_5535 ?auto_5546 ) ) ( not ( = ?auto_5547 ?auto_5551 ) ) ( not ( = ?auto_5547 ?auto_5545 ) ) ( not ( = ?auto_5547 ?auto_5546 ) ) ( not ( = ?auto_5531 ?auto_5536 ) ) ( not ( = ?auto_5531 ?auto_5548 ) ) ( not ( = ?auto_5532 ?auto_5536 ) ) ( not ( = ?auto_5532 ?auto_5548 ) ) ( not ( = ?auto_5533 ?auto_5536 ) ) ( not ( = ?auto_5533 ?auto_5548 ) ) ( not ( = ?auto_5534 ?auto_5536 ) ) ( not ( = ?auto_5534 ?auto_5548 ) ) ( not ( = ?auto_5536 ?auto_5547 ) ) ( not ( = ?auto_5536 ?auto_5551 ) ) ( not ( = ?auto_5536 ?auto_5545 ) ) ( not ( = ?auto_5536 ?auto_5546 ) ) ( not ( = ?auto_5543 ?auto_5554 ) ) ( not ( = ?auto_5543 ?auto_5553 ) ) ( not ( = ?auto_5544 ?auto_5550 ) ) ( not ( = ?auto_5544 ?auto_5549 ) ) ( not ( = ?auto_5548 ?auto_5547 ) ) ( not ( = ?auto_5548 ?auto_5551 ) ) ( not ( = ?auto_5548 ?auto_5545 ) ) ( not ( = ?auto_5548 ?auto_5546 ) ) ( not ( = ?auto_5531 ?auto_5537 ) ) ( not ( = ?auto_5531 ?auto_5552 ) ) ( not ( = ?auto_5532 ?auto_5537 ) ) ( not ( = ?auto_5532 ?auto_5552 ) ) ( not ( = ?auto_5533 ?auto_5537 ) ) ( not ( = ?auto_5533 ?auto_5552 ) ) ( not ( = ?auto_5534 ?auto_5537 ) ) ( not ( = ?auto_5534 ?auto_5552 ) ) ( not ( = ?auto_5535 ?auto_5537 ) ) ( not ( = ?auto_5535 ?auto_5552 ) ) ( not ( = ?auto_5537 ?auto_5548 ) ) ( not ( = ?auto_5537 ?auto_5547 ) ) ( not ( = ?auto_5537 ?auto_5551 ) ) ( not ( = ?auto_5537 ?auto_5545 ) ) ( not ( = ?auto_5537 ?auto_5546 ) ) ( not ( = ?auto_5552 ?auto_5548 ) ) ( not ( = ?auto_5552 ?auto_5547 ) ) ( not ( = ?auto_5552 ?auto_5551 ) ) ( not ( = ?auto_5552 ?auto_5545 ) ) ( not ( = ?auto_5552 ?auto_5546 ) ) ( not ( = ?auto_5531 ?auto_5538 ) ) ( not ( = ?auto_5531 ?auto_5542 ) ) ( not ( = ?auto_5532 ?auto_5538 ) ) ( not ( = ?auto_5532 ?auto_5542 ) ) ( not ( = ?auto_5533 ?auto_5538 ) ) ( not ( = ?auto_5533 ?auto_5542 ) ) ( not ( = ?auto_5534 ?auto_5538 ) ) ( not ( = ?auto_5534 ?auto_5542 ) ) ( not ( = ?auto_5535 ?auto_5538 ) ) ( not ( = ?auto_5535 ?auto_5542 ) ) ( not ( = ?auto_5536 ?auto_5538 ) ) ( not ( = ?auto_5536 ?auto_5542 ) ) ( not ( = ?auto_5538 ?auto_5552 ) ) ( not ( = ?auto_5538 ?auto_5548 ) ) ( not ( = ?auto_5538 ?auto_5547 ) ) ( not ( = ?auto_5538 ?auto_5551 ) ) ( not ( = ?auto_5538 ?auto_5545 ) ) ( not ( = ?auto_5538 ?auto_5546 ) ) ( not ( = ?auto_5542 ?auto_5552 ) ) ( not ( = ?auto_5542 ?auto_5548 ) ) ( not ( = ?auto_5542 ?auto_5547 ) ) ( not ( = ?auto_5542 ?auto_5551 ) ) ( not ( = ?auto_5542 ?auto_5545 ) ) ( not ( = ?auto_5542 ?auto_5546 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_5531 ?auto_5532 ?auto_5533 ?auto_5534 ?auto_5535 ?auto_5536 ?auto_5537 )
      ( MAKE-1CRATE ?auto_5537 ?auto_5538 )
      ( MAKE-7CRATE-VERIFY ?auto_5531 ?auto_5532 ?auto_5533 ?auto_5534 ?auto_5535 ?auto_5536 ?auto_5537 ?auto_5538 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5557 - SURFACE
      ?auto_5558 - SURFACE
    )
    :vars
    (
      ?auto_5559 - HOIST
      ?auto_5560 - PLACE
      ?auto_5562 - PLACE
      ?auto_5563 - HOIST
      ?auto_5564 - SURFACE
      ?auto_5561 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5559 ?auto_5560 ) ( SURFACE-AT ?auto_5557 ?auto_5560 ) ( CLEAR ?auto_5557 ) ( IS-CRATE ?auto_5558 ) ( AVAILABLE ?auto_5559 ) ( not ( = ?auto_5562 ?auto_5560 ) ) ( HOIST-AT ?auto_5563 ?auto_5562 ) ( AVAILABLE ?auto_5563 ) ( SURFACE-AT ?auto_5558 ?auto_5562 ) ( ON ?auto_5558 ?auto_5564 ) ( CLEAR ?auto_5558 ) ( TRUCK-AT ?auto_5561 ?auto_5560 ) ( not ( = ?auto_5557 ?auto_5558 ) ) ( not ( = ?auto_5557 ?auto_5564 ) ) ( not ( = ?auto_5558 ?auto_5564 ) ) ( not ( = ?auto_5559 ?auto_5563 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5561 ?auto_5560 ?auto_5562 )
      ( !LIFT ?auto_5563 ?auto_5558 ?auto_5564 ?auto_5562 )
      ( !LOAD ?auto_5563 ?auto_5558 ?auto_5561 ?auto_5562 )
      ( !DRIVE ?auto_5561 ?auto_5562 ?auto_5560 )
      ( !UNLOAD ?auto_5559 ?auto_5558 ?auto_5561 ?auto_5560 )
      ( !DROP ?auto_5559 ?auto_5558 ?auto_5557 ?auto_5560 )
      ( MAKE-1CRATE-VERIFY ?auto_5557 ?auto_5558 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_5574 - SURFACE
      ?auto_5575 - SURFACE
      ?auto_5576 - SURFACE
      ?auto_5577 - SURFACE
      ?auto_5578 - SURFACE
      ?auto_5579 - SURFACE
      ?auto_5580 - SURFACE
      ?auto_5582 - SURFACE
      ?auto_5581 - SURFACE
    )
    :vars
    (
      ?auto_5587 - HOIST
      ?auto_5588 - PLACE
      ?auto_5586 - PLACE
      ?auto_5583 - HOIST
      ?auto_5585 - SURFACE
      ?auto_5596 - PLACE
      ?auto_5595 - HOIST
      ?auto_5597 - SURFACE
      ?auto_5590 - SURFACE
      ?auto_5598 - SURFACE
      ?auto_5594 - SURFACE
      ?auto_5592 - PLACE
      ?auto_5591 - HOIST
      ?auto_5589 - SURFACE
      ?auto_5593 - SURFACE
      ?auto_5599 - SURFACE
      ?auto_5584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5587 ?auto_5588 ) ( IS-CRATE ?auto_5581 ) ( not ( = ?auto_5586 ?auto_5588 ) ) ( HOIST-AT ?auto_5583 ?auto_5586 ) ( SURFACE-AT ?auto_5581 ?auto_5586 ) ( ON ?auto_5581 ?auto_5585 ) ( CLEAR ?auto_5581 ) ( not ( = ?auto_5582 ?auto_5581 ) ) ( not ( = ?auto_5582 ?auto_5585 ) ) ( not ( = ?auto_5581 ?auto_5585 ) ) ( not ( = ?auto_5587 ?auto_5583 ) ) ( IS-CRATE ?auto_5582 ) ( not ( = ?auto_5596 ?auto_5588 ) ) ( HOIST-AT ?auto_5595 ?auto_5596 ) ( SURFACE-AT ?auto_5582 ?auto_5596 ) ( ON ?auto_5582 ?auto_5597 ) ( CLEAR ?auto_5582 ) ( not ( = ?auto_5580 ?auto_5582 ) ) ( not ( = ?auto_5580 ?auto_5597 ) ) ( not ( = ?auto_5582 ?auto_5597 ) ) ( not ( = ?auto_5587 ?auto_5595 ) ) ( IS-CRATE ?auto_5580 ) ( SURFACE-AT ?auto_5580 ?auto_5586 ) ( ON ?auto_5580 ?auto_5590 ) ( CLEAR ?auto_5580 ) ( not ( = ?auto_5579 ?auto_5580 ) ) ( not ( = ?auto_5579 ?auto_5590 ) ) ( not ( = ?auto_5580 ?auto_5590 ) ) ( IS-CRATE ?auto_5579 ) ( AVAILABLE ?auto_5595 ) ( SURFACE-AT ?auto_5579 ?auto_5596 ) ( ON ?auto_5579 ?auto_5598 ) ( CLEAR ?auto_5579 ) ( not ( = ?auto_5578 ?auto_5579 ) ) ( not ( = ?auto_5578 ?auto_5598 ) ) ( not ( = ?auto_5579 ?auto_5598 ) ) ( IS-CRATE ?auto_5578 ) ( SURFACE-AT ?auto_5578 ?auto_5586 ) ( ON ?auto_5578 ?auto_5594 ) ( CLEAR ?auto_5578 ) ( not ( = ?auto_5577 ?auto_5578 ) ) ( not ( = ?auto_5577 ?auto_5594 ) ) ( not ( = ?auto_5578 ?auto_5594 ) ) ( IS-CRATE ?auto_5577 ) ( not ( = ?auto_5592 ?auto_5588 ) ) ( HOIST-AT ?auto_5591 ?auto_5592 ) ( AVAILABLE ?auto_5591 ) ( SURFACE-AT ?auto_5577 ?auto_5592 ) ( ON ?auto_5577 ?auto_5589 ) ( CLEAR ?auto_5577 ) ( not ( = ?auto_5576 ?auto_5577 ) ) ( not ( = ?auto_5576 ?auto_5589 ) ) ( not ( = ?auto_5577 ?auto_5589 ) ) ( not ( = ?auto_5587 ?auto_5591 ) ) ( IS-CRATE ?auto_5576 ) ( SURFACE-AT ?auto_5576 ?auto_5586 ) ( ON ?auto_5576 ?auto_5593 ) ( CLEAR ?auto_5576 ) ( not ( = ?auto_5575 ?auto_5576 ) ) ( not ( = ?auto_5575 ?auto_5593 ) ) ( not ( = ?auto_5576 ?auto_5593 ) ) ( SURFACE-AT ?auto_5574 ?auto_5588 ) ( CLEAR ?auto_5574 ) ( IS-CRATE ?auto_5575 ) ( AVAILABLE ?auto_5587 ) ( AVAILABLE ?auto_5583 ) ( SURFACE-AT ?auto_5575 ?auto_5586 ) ( ON ?auto_5575 ?auto_5599 ) ( CLEAR ?auto_5575 ) ( TRUCK-AT ?auto_5584 ?auto_5588 ) ( not ( = ?auto_5574 ?auto_5575 ) ) ( not ( = ?auto_5574 ?auto_5599 ) ) ( not ( = ?auto_5575 ?auto_5599 ) ) ( not ( = ?auto_5574 ?auto_5576 ) ) ( not ( = ?auto_5574 ?auto_5593 ) ) ( not ( = ?auto_5576 ?auto_5599 ) ) ( not ( = ?auto_5593 ?auto_5599 ) ) ( not ( = ?auto_5574 ?auto_5577 ) ) ( not ( = ?auto_5574 ?auto_5589 ) ) ( not ( = ?auto_5575 ?auto_5577 ) ) ( not ( = ?auto_5575 ?auto_5589 ) ) ( not ( = ?auto_5577 ?auto_5593 ) ) ( not ( = ?auto_5577 ?auto_5599 ) ) ( not ( = ?auto_5592 ?auto_5586 ) ) ( not ( = ?auto_5591 ?auto_5583 ) ) ( not ( = ?auto_5589 ?auto_5593 ) ) ( not ( = ?auto_5589 ?auto_5599 ) ) ( not ( = ?auto_5574 ?auto_5578 ) ) ( not ( = ?auto_5574 ?auto_5594 ) ) ( not ( = ?auto_5575 ?auto_5578 ) ) ( not ( = ?auto_5575 ?auto_5594 ) ) ( not ( = ?auto_5576 ?auto_5578 ) ) ( not ( = ?auto_5576 ?auto_5594 ) ) ( not ( = ?auto_5578 ?auto_5589 ) ) ( not ( = ?auto_5578 ?auto_5593 ) ) ( not ( = ?auto_5578 ?auto_5599 ) ) ( not ( = ?auto_5594 ?auto_5589 ) ) ( not ( = ?auto_5594 ?auto_5593 ) ) ( not ( = ?auto_5594 ?auto_5599 ) ) ( not ( = ?auto_5574 ?auto_5579 ) ) ( not ( = ?auto_5574 ?auto_5598 ) ) ( not ( = ?auto_5575 ?auto_5579 ) ) ( not ( = ?auto_5575 ?auto_5598 ) ) ( not ( = ?auto_5576 ?auto_5579 ) ) ( not ( = ?auto_5576 ?auto_5598 ) ) ( not ( = ?auto_5577 ?auto_5579 ) ) ( not ( = ?auto_5577 ?auto_5598 ) ) ( not ( = ?auto_5579 ?auto_5594 ) ) ( not ( = ?auto_5579 ?auto_5589 ) ) ( not ( = ?auto_5579 ?auto_5593 ) ) ( not ( = ?auto_5579 ?auto_5599 ) ) ( not ( = ?auto_5596 ?auto_5586 ) ) ( not ( = ?auto_5596 ?auto_5592 ) ) ( not ( = ?auto_5595 ?auto_5583 ) ) ( not ( = ?auto_5595 ?auto_5591 ) ) ( not ( = ?auto_5598 ?auto_5594 ) ) ( not ( = ?auto_5598 ?auto_5589 ) ) ( not ( = ?auto_5598 ?auto_5593 ) ) ( not ( = ?auto_5598 ?auto_5599 ) ) ( not ( = ?auto_5574 ?auto_5580 ) ) ( not ( = ?auto_5574 ?auto_5590 ) ) ( not ( = ?auto_5575 ?auto_5580 ) ) ( not ( = ?auto_5575 ?auto_5590 ) ) ( not ( = ?auto_5576 ?auto_5580 ) ) ( not ( = ?auto_5576 ?auto_5590 ) ) ( not ( = ?auto_5577 ?auto_5580 ) ) ( not ( = ?auto_5577 ?auto_5590 ) ) ( not ( = ?auto_5578 ?auto_5580 ) ) ( not ( = ?auto_5578 ?auto_5590 ) ) ( not ( = ?auto_5580 ?auto_5598 ) ) ( not ( = ?auto_5580 ?auto_5594 ) ) ( not ( = ?auto_5580 ?auto_5589 ) ) ( not ( = ?auto_5580 ?auto_5593 ) ) ( not ( = ?auto_5580 ?auto_5599 ) ) ( not ( = ?auto_5590 ?auto_5598 ) ) ( not ( = ?auto_5590 ?auto_5594 ) ) ( not ( = ?auto_5590 ?auto_5589 ) ) ( not ( = ?auto_5590 ?auto_5593 ) ) ( not ( = ?auto_5590 ?auto_5599 ) ) ( not ( = ?auto_5574 ?auto_5582 ) ) ( not ( = ?auto_5574 ?auto_5597 ) ) ( not ( = ?auto_5575 ?auto_5582 ) ) ( not ( = ?auto_5575 ?auto_5597 ) ) ( not ( = ?auto_5576 ?auto_5582 ) ) ( not ( = ?auto_5576 ?auto_5597 ) ) ( not ( = ?auto_5577 ?auto_5582 ) ) ( not ( = ?auto_5577 ?auto_5597 ) ) ( not ( = ?auto_5578 ?auto_5582 ) ) ( not ( = ?auto_5578 ?auto_5597 ) ) ( not ( = ?auto_5579 ?auto_5582 ) ) ( not ( = ?auto_5579 ?auto_5597 ) ) ( not ( = ?auto_5582 ?auto_5590 ) ) ( not ( = ?auto_5582 ?auto_5598 ) ) ( not ( = ?auto_5582 ?auto_5594 ) ) ( not ( = ?auto_5582 ?auto_5589 ) ) ( not ( = ?auto_5582 ?auto_5593 ) ) ( not ( = ?auto_5582 ?auto_5599 ) ) ( not ( = ?auto_5597 ?auto_5590 ) ) ( not ( = ?auto_5597 ?auto_5598 ) ) ( not ( = ?auto_5597 ?auto_5594 ) ) ( not ( = ?auto_5597 ?auto_5589 ) ) ( not ( = ?auto_5597 ?auto_5593 ) ) ( not ( = ?auto_5597 ?auto_5599 ) ) ( not ( = ?auto_5574 ?auto_5581 ) ) ( not ( = ?auto_5574 ?auto_5585 ) ) ( not ( = ?auto_5575 ?auto_5581 ) ) ( not ( = ?auto_5575 ?auto_5585 ) ) ( not ( = ?auto_5576 ?auto_5581 ) ) ( not ( = ?auto_5576 ?auto_5585 ) ) ( not ( = ?auto_5577 ?auto_5581 ) ) ( not ( = ?auto_5577 ?auto_5585 ) ) ( not ( = ?auto_5578 ?auto_5581 ) ) ( not ( = ?auto_5578 ?auto_5585 ) ) ( not ( = ?auto_5579 ?auto_5581 ) ) ( not ( = ?auto_5579 ?auto_5585 ) ) ( not ( = ?auto_5580 ?auto_5581 ) ) ( not ( = ?auto_5580 ?auto_5585 ) ) ( not ( = ?auto_5581 ?auto_5597 ) ) ( not ( = ?auto_5581 ?auto_5590 ) ) ( not ( = ?auto_5581 ?auto_5598 ) ) ( not ( = ?auto_5581 ?auto_5594 ) ) ( not ( = ?auto_5581 ?auto_5589 ) ) ( not ( = ?auto_5581 ?auto_5593 ) ) ( not ( = ?auto_5581 ?auto_5599 ) ) ( not ( = ?auto_5585 ?auto_5597 ) ) ( not ( = ?auto_5585 ?auto_5590 ) ) ( not ( = ?auto_5585 ?auto_5598 ) ) ( not ( = ?auto_5585 ?auto_5594 ) ) ( not ( = ?auto_5585 ?auto_5589 ) ) ( not ( = ?auto_5585 ?auto_5593 ) ) ( not ( = ?auto_5585 ?auto_5599 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_5574 ?auto_5575 ?auto_5576 ?auto_5577 ?auto_5578 ?auto_5579 ?auto_5580 ?auto_5582 )
      ( MAKE-1CRATE ?auto_5582 ?auto_5581 )
      ( MAKE-8CRATE-VERIFY ?auto_5574 ?auto_5575 ?auto_5576 ?auto_5577 ?auto_5578 ?auto_5579 ?auto_5580 ?auto_5582 ?auto_5581 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5602 - SURFACE
      ?auto_5603 - SURFACE
    )
    :vars
    (
      ?auto_5604 - HOIST
      ?auto_5605 - PLACE
      ?auto_5607 - PLACE
      ?auto_5608 - HOIST
      ?auto_5609 - SURFACE
      ?auto_5606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5604 ?auto_5605 ) ( SURFACE-AT ?auto_5602 ?auto_5605 ) ( CLEAR ?auto_5602 ) ( IS-CRATE ?auto_5603 ) ( AVAILABLE ?auto_5604 ) ( not ( = ?auto_5607 ?auto_5605 ) ) ( HOIST-AT ?auto_5608 ?auto_5607 ) ( AVAILABLE ?auto_5608 ) ( SURFACE-AT ?auto_5603 ?auto_5607 ) ( ON ?auto_5603 ?auto_5609 ) ( CLEAR ?auto_5603 ) ( TRUCK-AT ?auto_5606 ?auto_5605 ) ( not ( = ?auto_5602 ?auto_5603 ) ) ( not ( = ?auto_5602 ?auto_5609 ) ) ( not ( = ?auto_5603 ?auto_5609 ) ) ( not ( = ?auto_5604 ?auto_5608 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5606 ?auto_5605 ?auto_5607 )
      ( !LIFT ?auto_5608 ?auto_5603 ?auto_5609 ?auto_5607 )
      ( !LOAD ?auto_5608 ?auto_5603 ?auto_5606 ?auto_5607 )
      ( !DRIVE ?auto_5606 ?auto_5607 ?auto_5605 )
      ( !UNLOAD ?auto_5604 ?auto_5603 ?auto_5606 ?auto_5605 )
      ( !DROP ?auto_5604 ?auto_5603 ?auto_5602 ?auto_5605 )
      ( MAKE-1CRATE-VERIFY ?auto_5602 ?auto_5603 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_5620 - SURFACE
      ?auto_5621 - SURFACE
      ?auto_5622 - SURFACE
      ?auto_5623 - SURFACE
      ?auto_5624 - SURFACE
      ?auto_5625 - SURFACE
      ?auto_5626 - SURFACE
      ?auto_5629 - SURFACE
      ?auto_5628 - SURFACE
      ?auto_5627 - SURFACE
    )
    :vars
    (
      ?auto_5635 - HOIST
      ?auto_5634 - PLACE
      ?auto_5633 - PLACE
      ?auto_5630 - HOIST
      ?auto_5632 - SURFACE
      ?auto_5642 - PLACE
      ?auto_5643 - HOIST
      ?auto_5639 - SURFACE
      ?auto_5646 - SURFACE
      ?auto_5641 - SURFACE
      ?auto_5645 - SURFACE
      ?auto_5637 - SURFACE
      ?auto_5644 - PLACE
      ?auto_5640 - HOIST
      ?auto_5647 - SURFACE
      ?auto_5638 - SURFACE
      ?auto_5636 - SURFACE
      ?auto_5631 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5635 ?auto_5634 ) ( IS-CRATE ?auto_5627 ) ( not ( = ?auto_5633 ?auto_5634 ) ) ( HOIST-AT ?auto_5630 ?auto_5633 ) ( SURFACE-AT ?auto_5627 ?auto_5633 ) ( ON ?auto_5627 ?auto_5632 ) ( CLEAR ?auto_5627 ) ( not ( = ?auto_5628 ?auto_5627 ) ) ( not ( = ?auto_5628 ?auto_5632 ) ) ( not ( = ?auto_5627 ?auto_5632 ) ) ( not ( = ?auto_5635 ?auto_5630 ) ) ( IS-CRATE ?auto_5628 ) ( not ( = ?auto_5642 ?auto_5634 ) ) ( HOIST-AT ?auto_5643 ?auto_5642 ) ( SURFACE-AT ?auto_5628 ?auto_5642 ) ( ON ?auto_5628 ?auto_5639 ) ( CLEAR ?auto_5628 ) ( not ( = ?auto_5629 ?auto_5628 ) ) ( not ( = ?auto_5629 ?auto_5639 ) ) ( not ( = ?auto_5628 ?auto_5639 ) ) ( not ( = ?auto_5635 ?auto_5643 ) ) ( IS-CRATE ?auto_5629 ) ( SURFACE-AT ?auto_5629 ?auto_5633 ) ( ON ?auto_5629 ?auto_5646 ) ( CLEAR ?auto_5629 ) ( not ( = ?auto_5626 ?auto_5629 ) ) ( not ( = ?auto_5626 ?auto_5646 ) ) ( not ( = ?auto_5629 ?auto_5646 ) ) ( IS-CRATE ?auto_5626 ) ( SURFACE-AT ?auto_5626 ?auto_5642 ) ( ON ?auto_5626 ?auto_5641 ) ( CLEAR ?auto_5626 ) ( not ( = ?auto_5625 ?auto_5626 ) ) ( not ( = ?auto_5625 ?auto_5641 ) ) ( not ( = ?auto_5626 ?auto_5641 ) ) ( IS-CRATE ?auto_5625 ) ( AVAILABLE ?auto_5630 ) ( SURFACE-AT ?auto_5625 ?auto_5633 ) ( ON ?auto_5625 ?auto_5645 ) ( CLEAR ?auto_5625 ) ( not ( = ?auto_5624 ?auto_5625 ) ) ( not ( = ?auto_5624 ?auto_5645 ) ) ( not ( = ?auto_5625 ?auto_5645 ) ) ( IS-CRATE ?auto_5624 ) ( SURFACE-AT ?auto_5624 ?auto_5642 ) ( ON ?auto_5624 ?auto_5637 ) ( CLEAR ?auto_5624 ) ( not ( = ?auto_5623 ?auto_5624 ) ) ( not ( = ?auto_5623 ?auto_5637 ) ) ( not ( = ?auto_5624 ?auto_5637 ) ) ( IS-CRATE ?auto_5623 ) ( not ( = ?auto_5644 ?auto_5634 ) ) ( HOIST-AT ?auto_5640 ?auto_5644 ) ( AVAILABLE ?auto_5640 ) ( SURFACE-AT ?auto_5623 ?auto_5644 ) ( ON ?auto_5623 ?auto_5647 ) ( CLEAR ?auto_5623 ) ( not ( = ?auto_5622 ?auto_5623 ) ) ( not ( = ?auto_5622 ?auto_5647 ) ) ( not ( = ?auto_5623 ?auto_5647 ) ) ( not ( = ?auto_5635 ?auto_5640 ) ) ( IS-CRATE ?auto_5622 ) ( SURFACE-AT ?auto_5622 ?auto_5642 ) ( ON ?auto_5622 ?auto_5638 ) ( CLEAR ?auto_5622 ) ( not ( = ?auto_5621 ?auto_5622 ) ) ( not ( = ?auto_5621 ?auto_5638 ) ) ( not ( = ?auto_5622 ?auto_5638 ) ) ( SURFACE-AT ?auto_5620 ?auto_5634 ) ( CLEAR ?auto_5620 ) ( IS-CRATE ?auto_5621 ) ( AVAILABLE ?auto_5635 ) ( AVAILABLE ?auto_5643 ) ( SURFACE-AT ?auto_5621 ?auto_5642 ) ( ON ?auto_5621 ?auto_5636 ) ( CLEAR ?auto_5621 ) ( TRUCK-AT ?auto_5631 ?auto_5634 ) ( not ( = ?auto_5620 ?auto_5621 ) ) ( not ( = ?auto_5620 ?auto_5636 ) ) ( not ( = ?auto_5621 ?auto_5636 ) ) ( not ( = ?auto_5620 ?auto_5622 ) ) ( not ( = ?auto_5620 ?auto_5638 ) ) ( not ( = ?auto_5622 ?auto_5636 ) ) ( not ( = ?auto_5638 ?auto_5636 ) ) ( not ( = ?auto_5620 ?auto_5623 ) ) ( not ( = ?auto_5620 ?auto_5647 ) ) ( not ( = ?auto_5621 ?auto_5623 ) ) ( not ( = ?auto_5621 ?auto_5647 ) ) ( not ( = ?auto_5623 ?auto_5638 ) ) ( not ( = ?auto_5623 ?auto_5636 ) ) ( not ( = ?auto_5644 ?auto_5642 ) ) ( not ( = ?auto_5640 ?auto_5643 ) ) ( not ( = ?auto_5647 ?auto_5638 ) ) ( not ( = ?auto_5647 ?auto_5636 ) ) ( not ( = ?auto_5620 ?auto_5624 ) ) ( not ( = ?auto_5620 ?auto_5637 ) ) ( not ( = ?auto_5621 ?auto_5624 ) ) ( not ( = ?auto_5621 ?auto_5637 ) ) ( not ( = ?auto_5622 ?auto_5624 ) ) ( not ( = ?auto_5622 ?auto_5637 ) ) ( not ( = ?auto_5624 ?auto_5647 ) ) ( not ( = ?auto_5624 ?auto_5638 ) ) ( not ( = ?auto_5624 ?auto_5636 ) ) ( not ( = ?auto_5637 ?auto_5647 ) ) ( not ( = ?auto_5637 ?auto_5638 ) ) ( not ( = ?auto_5637 ?auto_5636 ) ) ( not ( = ?auto_5620 ?auto_5625 ) ) ( not ( = ?auto_5620 ?auto_5645 ) ) ( not ( = ?auto_5621 ?auto_5625 ) ) ( not ( = ?auto_5621 ?auto_5645 ) ) ( not ( = ?auto_5622 ?auto_5625 ) ) ( not ( = ?auto_5622 ?auto_5645 ) ) ( not ( = ?auto_5623 ?auto_5625 ) ) ( not ( = ?auto_5623 ?auto_5645 ) ) ( not ( = ?auto_5625 ?auto_5637 ) ) ( not ( = ?auto_5625 ?auto_5647 ) ) ( not ( = ?auto_5625 ?auto_5638 ) ) ( not ( = ?auto_5625 ?auto_5636 ) ) ( not ( = ?auto_5633 ?auto_5642 ) ) ( not ( = ?auto_5633 ?auto_5644 ) ) ( not ( = ?auto_5630 ?auto_5643 ) ) ( not ( = ?auto_5630 ?auto_5640 ) ) ( not ( = ?auto_5645 ?auto_5637 ) ) ( not ( = ?auto_5645 ?auto_5647 ) ) ( not ( = ?auto_5645 ?auto_5638 ) ) ( not ( = ?auto_5645 ?auto_5636 ) ) ( not ( = ?auto_5620 ?auto_5626 ) ) ( not ( = ?auto_5620 ?auto_5641 ) ) ( not ( = ?auto_5621 ?auto_5626 ) ) ( not ( = ?auto_5621 ?auto_5641 ) ) ( not ( = ?auto_5622 ?auto_5626 ) ) ( not ( = ?auto_5622 ?auto_5641 ) ) ( not ( = ?auto_5623 ?auto_5626 ) ) ( not ( = ?auto_5623 ?auto_5641 ) ) ( not ( = ?auto_5624 ?auto_5626 ) ) ( not ( = ?auto_5624 ?auto_5641 ) ) ( not ( = ?auto_5626 ?auto_5645 ) ) ( not ( = ?auto_5626 ?auto_5637 ) ) ( not ( = ?auto_5626 ?auto_5647 ) ) ( not ( = ?auto_5626 ?auto_5638 ) ) ( not ( = ?auto_5626 ?auto_5636 ) ) ( not ( = ?auto_5641 ?auto_5645 ) ) ( not ( = ?auto_5641 ?auto_5637 ) ) ( not ( = ?auto_5641 ?auto_5647 ) ) ( not ( = ?auto_5641 ?auto_5638 ) ) ( not ( = ?auto_5641 ?auto_5636 ) ) ( not ( = ?auto_5620 ?auto_5629 ) ) ( not ( = ?auto_5620 ?auto_5646 ) ) ( not ( = ?auto_5621 ?auto_5629 ) ) ( not ( = ?auto_5621 ?auto_5646 ) ) ( not ( = ?auto_5622 ?auto_5629 ) ) ( not ( = ?auto_5622 ?auto_5646 ) ) ( not ( = ?auto_5623 ?auto_5629 ) ) ( not ( = ?auto_5623 ?auto_5646 ) ) ( not ( = ?auto_5624 ?auto_5629 ) ) ( not ( = ?auto_5624 ?auto_5646 ) ) ( not ( = ?auto_5625 ?auto_5629 ) ) ( not ( = ?auto_5625 ?auto_5646 ) ) ( not ( = ?auto_5629 ?auto_5641 ) ) ( not ( = ?auto_5629 ?auto_5645 ) ) ( not ( = ?auto_5629 ?auto_5637 ) ) ( not ( = ?auto_5629 ?auto_5647 ) ) ( not ( = ?auto_5629 ?auto_5638 ) ) ( not ( = ?auto_5629 ?auto_5636 ) ) ( not ( = ?auto_5646 ?auto_5641 ) ) ( not ( = ?auto_5646 ?auto_5645 ) ) ( not ( = ?auto_5646 ?auto_5637 ) ) ( not ( = ?auto_5646 ?auto_5647 ) ) ( not ( = ?auto_5646 ?auto_5638 ) ) ( not ( = ?auto_5646 ?auto_5636 ) ) ( not ( = ?auto_5620 ?auto_5628 ) ) ( not ( = ?auto_5620 ?auto_5639 ) ) ( not ( = ?auto_5621 ?auto_5628 ) ) ( not ( = ?auto_5621 ?auto_5639 ) ) ( not ( = ?auto_5622 ?auto_5628 ) ) ( not ( = ?auto_5622 ?auto_5639 ) ) ( not ( = ?auto_5623 ?auto_5628 ) ) ( not ( = ?auto_5623 ?auto_5639 ) ) ( not ( = ?auto_5624 ?auto_5628 ) ) ( not ( = ?auto_5624 ?auto_5639 ) ) ( not ( = ?auto_5625 ?auto_5628 ) ) ( not ( = ?auto_5625 ?auto_5639 ) ) ( not ( = ?auto_5626 ?auto_5628 ) ) ( not ( = ?auto_5626 ?auto_5639 ) ) ( not ( = ?auto_5628 ?auto_5646 ) ) ( not ( = ?auto_5628 ?auto_5641 ) ) ( not ( = ?auto_5628 ?auto_5645 ) ) ( not ( = ?auto_5628 ?auto_5637 ) ) ( not ( = ?auto_5628 ?auto_5647 ) ) ( not ( = ?auto_5628 ?auto_5638 ) ) ( not ( = ?auto_5628 ?auto_5636 ) ) ( not ( = ?auto_5639 ?auto_5646 ) ) ( not ( = ?auto_5639 ?auto_5641 ) ) ( not ( = ?auto_5639 ?auto_5645 ) ) ( not ( = ?auto_5639 ?auto_5637 ) ) ( not ( = ?auto_5639 ?auto_5647 ) ) ( not ( = ?auto_5639 ?auto_5638 ) ) ( not ( = ?auto_5639 ?auto_5636 ) ) ( not ( = ?auto_5620 ?auto_5627 ) ) ( not ( = ?auto_5620 ?auto_5632 ) ) ( not ( = ?auto_5621 ?auto_5627 ) ) ( not ( = ?auto_5621 ?auto_5632 ) ) ( not ( = ?auto_5622 ?auto_5627 ) ) ( not ( = ?auto_5622 ?auto_5632 ) ) ( not ( = ?auto_5623 ?auto_5627 ) ) ( not ( = ?auto_5623 ?auto_5632 ) ) ( not ( = ?auto_5624 ?auto_5627 ) ) ( not ( = ?auto_5624 ?auto_5632 ) ) ( not ( = ?auto_5625 ?auto_5627 ) ) ( not ( = ?auto_5625 ?auto_5632 ) ) ( not ( = ?auto_5626 ?auto_5627 ) ) ( not ( = ?auto_5626 ?auto_5632 ) ) ( not ( = ?auto_5629 ?auto_5627 ) ) ( not ( = ?auto_5629 ?auto_5632 ) ) ( not ( = ?auto_5627 ?auto_5639 ) ) ( not ( = ?auto_5627 ?auto_5646 ) ) ( not ( = ?auto_5627 ?auto_5641 ) ) ( not ( = ?auto_5627 ?auto_5645 ) ) ( not ( = ?auto_5627 ?auto_5637 ) ) ( not ( = ?auto_5627 ?auto_5647 ) ) ( not ( = ?auto_5627 ?auto_5638 ) ) ( not ( = ?auto_5627 ?auto_5636 ) ) ( not ( = ?auto_5632 ?auto_5639 ) ) ( not ( = ?auto_5632 ?auto_5646 ) ) ( not ( = ?auto_5632 ?auto_5641 ) ) ( not ( = ?auto_5632 ?auto_5645 ) ) ( not ( = ?auto_5632 ?auto_5637 ) ) ( not ( = ?auto_5632 ?auto_5647 ) ) ( not ( = ?auto_5632 ?auto_5638 ) ) ( not ( = ?auto_5632 ?auto_5636 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_5620 ?auto_5621 ?auto_5622 ?auto_5623 ?auto_5624 ?auto_5625 ?auto_5626 ?auto_5629 ?auto_5628 )
      ( MAKE-1CRATE ?auto_5628 ?auto_5627 )
      ( MAKE-9CRATE-VERIFY ?auto_5620 ?auto_5621 ?auto_5622 ?auto_5623 ?auto_5624 ?auto_5625 ?auto_5626 ?auto_5629 ?auto_5628 ?auto_5627 ) )
  )

)

