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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5369 - SURFACE
      ?auto_5370 - SURFACE
      ?auto_5371 - SURFACE
    )
    :vars
    (
      ?auto_5375 - HOIST
      ?auto_5373 - PLACE
      ?auto_5376 - PLACE
      ?auto_5377 - HOIST
      ?auto_5372 - SURFACE
      ?auto_5378 - SURFACE
      ?auto_5374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5375 ?auto_5373 ) ( IS-CRATE ?auto_5371 ) ( not ( = ?auto_5376 ?auto_5373 ) ) ( HOIST-AT ?auto_5377 ?auto_5376 ) ( SURFACE-AT ?auto_5371 ?auto_5376 ) ( ON ?auto_5371 ?auto_5372 ) ( CLEAR ?auto_5371 ) ( not ( = ?auto_5370 ?auto_5371 ) ) ( not ( = ?auto_5370 ?auto_5372 ) ) ( not ( = ?auto_5371 ?auto_5372 ) ) ( not ( = ?auto_5375 ?auto_5377 ) ) ( SURFACE-AT ?auto_5369 ?auto_5373 ) ( CLEAR ?auto_5369 ) ( IS-CRATE ?auto_5370 ) ( AVAILABLE ?auto_5375 ) ( AVAILABLE ?auto_5377 ) ( SURFACE-AT ?auto_5370 ?auto_5376 ) ( ON ?auto_5370 ?auto_5378 ) ( CLEAR ?auto_5370 ) ( TRUCK-AT ?auto_5374 ?auto_5373 ) ( not ( = ?auto_5369 ?auto_5370 ) ) ( not ( = ?auto_5369 ?auto_5378 ) ) ( not ( = ?auto_5370 ?auto_5378 ) ) ( not ( = ?auto_5369 ?auto_5371 ) ) ( not ( = ?auto_5369 ?auto_5372 ) ) ( not ( = ?auto_5371 ?auto_5378 ) ) ( not ( = ?auto_5372 ?auto_5378 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5369 ?auto_5370 )
      ( MAKE-1CRATE ?auto_5370 ?auto_5371 )
      ( MAKE-2CRATE-VERIFY ?auto_5369 ?auto_5370 ?auto_5371 ) )
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
      ?auto_5400 - HOIST
      ?auto_5402 - PLACE
      ?auto_5401 - PLACE
      ?auto_5397 - HOIST
      ?auto_5399 - SURFACE
      ?auto_5403 - PLACE
      ?auto_5406 - HOIST
      ?auto_5405 - SURFACE
      ?auto_5404 - SURFACE
      ?auto_5398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5400 ?auto_5402 ) ( IS-CRATE ?auto_5396 ) ( not ( = ?auto_5401 ?auto_5402 ) ) ( HOIST-AT ?auto_5397 ?auto_5401 ) ( AVAILABLE ?auto_5397 ) ( SURFACE-AT ?auto_5396 ?auto_5401 ) ( ON ?auto_5396 ?auto_5399 ) ( CLEAR ?auto_5396 ) ( not ( = ?auto_5395 ?auto_5396 ) ) ( not ( = ?auto_5395 ?auto_5399 ) ) ( not ( = ?auto_5396 ?auto_5399 ) ) ( not ( = ?auto_5400 ?auto_5397 ) ) ( IS-CRATE ?auto_5395 ) ( not ( = ?auto_5403 ?auto_5402 ) ) ( HOIST-AT ?auto_5406 ?auto_5403 ) ( SURFACE-AT ?auto_5395 ?auto_5403 ) ( ON ?auto_5395 ?auto_5405 ) ( CLEAR ?auto_5395 ) ( not ( = ?auto_5394 ?auto_5395 ) ) ( not ( = ?auto_5394 ?auto_5405 ) ) ( not ( = ?auto_5395 ?auto_5405 ) ) ( not ( = ?auto_5400 ?auto_5406 ) ) ( SURFACE-AT ?auto_5393 ?auto_5402 ) ( CLEAR ?auto_5393 ) ( IS-CRATE ?auto_5394 ) ( AVAILABLE ?auto_5400 ) ( AVAILABLE ?auto_5406 ) ( SURFACE-AT ?auto_5394 ?auto_5403 ) ( ON ?auto_5394 ?auto_5404 ) ( CLEAR ?auto_5394 ) ( TRUCK-AT ?auto_5398 ?auto_5402 ) ( not ( = ?auto_5393 ?auto_5394 ) ) ( not ( = ?auto_5393 ?auto_5404 ) ) ( not ( = ?auto_5394 ?auto_5404 ) ) ( not ( = ?auto_5393 ?auto_5395 ) ) ( not ( = ?auto_5393 ?auto_5405 ) ) ( not ( = ?auto_5395 ?auto_5404 ) ) ( not ( = ?auto_5405 ?auto_5404 ) ) ( not ( = ?auto_5393 ?auto_5396 ) ) ( not ( = ?auto_5393 ?auto_5399 ) ) ( not ( = ?auto_5394 ?auto_5396 ) ) ( not ( = ?auto_5394 ?auto_5399 ) ) ( not ( = ?auto_5396 ?auto_5405 ) ) ( not ( = ?auto_5396 ?auto_5404 ) ) ( not ( = ?auto_5401 ?auto_5403 ) ) ( not ( = ?auto_5397 ?auto_5406 ) ) ( not ( = ?auto_5399 ?auto_5405 ) ) ( not ( = ?auto_5399 ?auto_5404 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5393 ?auto_5394 ?auto_5395 )
      ( MAKE-1CRATE ?auto_5395 ?auto_5396 )
      ( MAKE-3CRATE-VERIFY ?auto_5393 ?auto_5394 ?auto_5395 ?auto_5396 ) )
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
      ?auto_5431 - HOIST
      ?auto_5432 - PLACE
      ?auto_5429 - PLACE
      ?auto_5427 - HOIST
      ?auto_5430 - SURFACE
      ?auto_5437 - PLACE
      ?auto_5433 - HOIST
      ?auto_5435 - SURFACE
      ?auto_5436 - SURFACE
      ?auto_5434 - SURFACE
      ?auto_5428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5431 ?auto_5432 ) ( IS-CRATE ?auto_5426 ) ( not ( = ?auto_5429 ?auto_5432 ) ) ( HOIST-AT ?auto_5427 ?auto_5429 ) ( SURFACE-AT ?auto_5426 ?auto_5429 ) ( ON ?auto_5426 ?auto_5430 ) ( CLEAR ?auto_5426 ) ( not ( = ?auto_5425 ?auto_5426 ) ) ( not ( = ?auto_5425 ?auto_5430 ) ) ( not ( = ?auto_5426 ?auto_5430 ) ) ( not ( = ?auto_5431 ?auto_5427 ) ) ( IS-CRATE ?auto_5425 ) ( not ( = ?auto_5437 ?auto_5432 ) ) ( HOIST-AT ?auto_5433 ?auto_5437 ) ( AVAILABLE ?auto_5433 ) ( SURFACE-AT ?auto_5425 ?auto_5437 ) ( ON ?auto_5425 ?auto_5435 ) ( CLEAR ?auto_5425 ) ( not ( = ?auto_5424 ?auto_5425 ) ) ( not ( = ?auto_5424 ?auto_5435 ) ) ( not ( = ?auto_5425 ?auto_5435 ) ) ( not ( = ?auto_5431 ?auto_5433 ) ) ( IS-CRATE ?auto_5424 ) ( SURFACE-AT ?auto_5424 ?auto_5429 ) ( ON ?auto_5424 ?auto_5436 ) ( CLEAR ?auto_5424 ) ( not ( = ?auto_5423 ?auto_5424 ) ) ( not ( = ?auto_5423 ?auto_5436 ) ) ( not ( = ?auto_5424 ?auto_5436 ) ) ( SURFACE-AT ?auto_5422 ?auto_5432 ) ( CLEAR ?auto_5422 ) ( IS-CRATE ?auto_5423 ) ( AVAILABLE ?auto_5431 ) ( AVAILABLE ?auto_5427 ) ( SURFACE-AT ?auto_5423 ?auto_5429 ) ( ON ?auto_5423 ?auto_5434 ) ( CLEAR ?auto_5423 ) ( TRUCK-AT ?auto_5428 ?auto_5432 ) ( not ( = ?auto_5422 ?auto_5423 ) ) ( not ( = ?auto_5422 ?auto_5434 ) ) ( not ( = ?auto_5423 ?auto_5434 ) ) ( not ( = ?auto_5422 ?auto_5424 ) ) ( not ( = ?auto_5422 ?auto_5436 ) ) ( not ( = ?auto_5424 ?auto_5434 ) ) ( not ( = ?auto_5436 ?auto_5434 ) ) ( not ( = ?auto_5422 ?auto_5425 ) ) ( not ( = ?auto_5422 ?auto_5435 ) ) ( not ( = ?auto_5423 ?auto_5425 ) ) ( not ( = ?auto_5423 ?auto_5435 ) ) ( not ( = ?auto_5425 ?auto_5436 ) ) ( not ( = ?auto_5425 ?auto_5434 ) ) ( not ( = ?auto_5437 ?auto_5429 ) ) ( not ( = ?auto_5433 ?auto_5427 ) ) ( not ( = ?auto_5435 ?auto_5436 ) ) ( not ( = ?auto_5435 ?auto_5434 ) ) ( not ( = ?auto_5422 ?auto_5426 ) ) ( not ( = ?auto_5422 ?auto_5430 ) ) ( not ( = ?auto_5423 ?auto_5426 ) ) ( not ( = ?auto_5423 ?auto_5430 ) ) ( not ( = ?auto_5424 ?auto_5426 ) ) ( not ( = ?auto_5424 ?auto_5430 ) ) ( not ( = ?auto_5426 ?auto_5435 ) ) ( not ( = ?auto_5426 ?auto_5436 ) ) ( not ( = ?auto_5426 ?auto_5434 ) ) ( not ( = ?auto_5430 ?auto_5435 ) ) ( not ( = ?auto_5430 ?auto_5436 ) ) ( not ( = ?auto_5430 ?auto_5434 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_5422 ?auto_5423 ?auto_5424 ?auto_5425 )
      ( MAKE-1CRATE ?auto_5425 ?auto_5426 )
      ( MAKE-4CRATE-VERIFY ?auto_5422 ?auto_5423 ?auto_5424 ?auto_5425 ?auto_5426 ) )
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
      ?auto_5461 - HOIST
      ?auto_5460 - PLACE
      ?auto_5464 - PLACE
      ?auto_5462 - HOIST
      ?auto_5465 - SURFACE
      ?auto_5473 - PLACE
      ?auto_5472 - HOIST
      ?auto_5467 - SURFACE
      ?auto_5471 - PLACE
      ?auto_5468 - HOIST
      ?auto_5466 - SURFACE
      ?auto_5470 - SURFACE
      ?auto_5469 - SURFACE
      ?auto_5463 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5461 ?auto_5460 ) ( IS-CRATE ?auto_5459 ) ( not ( = ?auto_5464 ?auto_5460 ) ) ( HOIST-AT ?auto_5462 ?auto_5464 ) ( AVAILABLE ?auto_5462 ) ( SURFACE-AT ?auto_5459 ?auto_5464 ) ( ON ?auto_5459 ?auto_5465 ) ( CLEAR ?auto_5459 ) ( not ( = ?auto_5458 ?auto_5459 ) ) ( not ( = ?auto_5458 ?auto_5465 ) ) ( not ( = ?auto_5459 ?auto_5465 ) ) ( not ( = ?auto_5461 ?auto_5462 ) ) ( IS-CRATE ?auto_5458 ) ( not ( = ?auto_5473 ?auto_5460 ) ) ( HOIST-AT ?auto_5472 ?auto_5473 ) ( SURFACE-AT ?auto_5458 ?auto_5473 ) ( ON ?auto_5458 ?auto_5467 ) ( CLEAR ?auto_5458 ) ( not ( = ?auto_5457 ?auto_5458 ) ) ( not ( = ?auto_5457 ?auto_5467 ) ) ( not ( = ?auto_5458 ?auto_5467 ) ) ( not ( = ?auto_5461 ?auto_5472 ) ) ( IS-CRATE ?auto_5457 ) ( not ( = ?auto_5471 ?auto_5460 ) ) ( HOIST-AT ?auto_5468 ?auto_5471 ) ( AVAILABLE ?auto_5468 ) ( SURFACE-AT ?auto_5457 ?auto_5471 ) ( ON ?auto_5457 ?auto_5466 ) ( CLEAR ?auto_5457 ) ( not ( = ?auto_5456 ?auto_5457 ) ) ( not ( = ?auto_5456 ?auto_5466 ) ) ( not ( = ?auto_5457 ?auto_5466 ) ) ( not ( = ?auto_5461 ?auto_5468 ) ) ( IS-CRATE ?auto_5456 ) ( SURFACE-AT ?auto_5456 ?auto_5473 ) ( ON ?auto_5456 ?auto_5470 ) ( CLEAR ?auto_5456 ) ( not ( = ?auto_5455 ?auto_5456 ) ) ( not ( = ?auto_5455 ?auto_5470 ) ) ( not ( = ?auto_5456 ?auto_5470 ) ) ( SURFACE-AT ?auto_5454 ?auto_5460 ) ( CLEAR ?auto_5454 ) ( IS-CRATE ?auto_5455 ) ( AVAILABLE ?auto_5461 ) ( AVAILABLE ?auto_5472 ) ( SURFACE-AT ?auto_5455 ?auto_5473 ) ( ON ?auto_5455 ?auto_5469 ) ( CLEAR ?auto_5455 ) ( TRUCK-AT ?auto_5463 ?auto_5460 ) ( not ( = ?auto_5454 ?auto_5455 ) ) ( not ( = ?auto_5454 ?auto_5469 ) ) ( not ( = ?auto_5455 ?auto_5469 ) ) ( not ( = ?auto_5454 ?auto_5456 ) ) ( not ( = ?auto_5454 ?auto_5470 ) ) ( not ( = ?auto_5456 ?auto_5469 ) ) ( not ( = ?auto_5470 ?auto_5469 ) ) ( not ( = ?auto_5454 ?auto_5457 ) ) ( not ( = ?auto_5454 ?auto_5466 ) ) ( not ( = ?auto_5455 ?auto_5457 ) ) ( not ( = ?auto_5455 ?auto_5466 ) ) ( not ( = ?auto_5457 ?auto_5470 ) ) ( not ( = ?auto_5457 ?auto_5469 ) ) ( not ( = ?auto_5471 ?auto_5473 ) ) ( not ( = ?auto_5468 ?auto_5472 ) ) ( not ( = ?auto_5466 ?auto_5470 ) ) ( not ( = ?auto_5466 ?auto_5469 ) ) ( not ( = ?auto_5454 ?auto_5458 ) ) ( not ( = ?auto_5454 ?auto_5467 ) ) ( not ( = ?auto_5455 ?auto_5458 ) ) ( not ( = ?auto_5455 ?auto_5467 ) ) ( not ( = ?auto_5456 ?auto_5458 ) ) ( not ( = ?auto_5456 ?auto_5467 ) ) ( not ( = ?auto_5458 ?auto_5466 ) ) ( not ( = ?auto_5458 ?auto_5470 ) ) ( not ( = ?auto_5458 ?auto_5469 ) ) ( not ( = ?auto_5467 ?auto_5466 ) ) ( not ( = ?auto_5467 ?auto_5470 ) ) ( not ( = ?auto_5467 ?auto_5469 ) ) ( not ( = ?auto_5454 ?auto_5459 ) ) ( not ( = ?auto_5454 ?auto_5465 ) ) ( not ( = ?auto_5455 ?auto_5459 ) ) ( not ( = ?auto_5455 ?auto_5465 ) ) ( not ( = ?auto_5456 ?auto_5459 ) ) ( not ( = ?auto_5456 ?auto_5465 ) ) ( not ( = ?auto_5457 ?auto_5459 ) ) ( not ( = ?auto_5457 ?auto_5465 ) ) ( not ( = ?auto_5459 ?auto_5467 ) ) ( not ( = ?auto_5459 ?auto_5466 ) ) ( not ( = ?auto_5459 ?auto_5470 ) ) ( not ( = ?auto_5459 ?auto_5469 ) ) ( not ( = ?auto_5464 ?auto_5473 ) ) ( not ( = ?auto_5464 ?auto_5471 ) ) ( not ( = ?auto_5462 ?auto_5472 ) ) ( not ( = ?auto_5462 ?auto_5468 ) ) ( not ( = ?auto_5465 ?auto_5467 ) ) ( not ( = ?auto_5465 ?auto_5466 ) ) ( not ( = ?auto_5465 ?auto_5470 ) ) ( not ( = ?auto_5465 ?auto_5469 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_5454 ?auto_5455 ?auto_5456 ?auto_5457 ?auto_5458 )
      ( MAKE-1CRATE ?auto_5458 ?auto_5459 )
      ( MAKE-5CRATE-VERIFY ?auto_5454 ?auto_5455 ?auto_5456 ?auto_5457 ?auto_5458 ?auto_5459 ) )
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
      ?auto_5499 - HOIST
      ?auto_5503 - PLACE
      ?auto_5498 - PLACE
      ?auto_5501 - HOIST
      ?auto_5502 - SURFACE
      ?auto_5505 - PLACE
      ?auto_5507 - HOIST
      ?auto_5506 - SURFACE
      ?auto_5504 - SURFACE
      ?auto_5512 - PLACE
      ?auto_5509 - HOIST
      ?auto_5508 - SURFACE
      ?auto_5511 - SURFACE
      ?auto_5510 - SURFACE
      ?auto_5500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5499 ?auto_5503 ) ( IS-CRATE ?auto_5497 ) ( not ( = ?auto_5498 ?auto_5503 ) ) ( HOIST-AT ?auto_5501 ?auto_5498 ) ( SURFACE-AT ?auto_5497 ?auto_5498 ) ( ON ?auto_5497 ?auto_5502 ) ( CLEAR ?auto_5497 ) ( not ( = ?auto_5496 ?auto_5497 ) ) ( not ( = ?auto_5496 ?auto_5502 ) ) ( not ( = ?auto_5497 ?auto_5502 ) ) ( not ( = ?auto_5499 ?auto_5501 ) ) ( IS-CRATE ?auto_5496 ) ( not ( = ?auto_5505 ?auto_5503 ) ) ( HOIST-AT ?auto_5507 ?auto_5505 ) ( AVAILABLE ?auto_5507 ) ( SURFACE-AT ?auto_5496 ?auto_5505 ) ( ON ?auto_5496 ?auto_5506 ) ( CLEAR ?auto_5496 ) ( not ( = ?auto_5495 ?auto_5496 ) ) ( not ( = ?auto_5495 ?auto_5506 ) ) ( not ( = ?auto_5496 ?auto_5506 ) ) ( not ( = ?auto_5499 ?auto_5507 ) ) ( IS-CRATE ?auto_5495 ) ( SURFACE-AT ?auto_5495 ?auto_5498 ) ( ON ?auto_5495 ?auto_5504 ) ( CLEAR ?auto_5495 ) ( not ( = ?auto_5494 ?auto_5495 ) ) ( not ( = ?auto_5494 ?auto_5504 ) ) ( not ( = ?auto_5495 ?auto_5504 ) ) ( IS-CRATE ?auto_5494 ) ( not ( = ?auto_5512 ?auto_5503 ) ) ( HOIST-AT ?auto_5509 ?auto_5512 ) ( AVAILABLE ?auto_5509 ) ( SURFACE-AT ?auto_5494 ?auto_5512 ) ( ON ?auto_5494 ?auto_5508 ) ( CLEAR ?auto_5494 ) ( not ( = ?auto_5493 ?auto_5494 ) ) ( not ( = ?auto_5493 ?auto_5508 ) ) ( not ( = ?auto_5494 ?auto_5508 ) ) ( not ( = ?auto_5499 ?auto_5509 ) ) ( IS-CRATE ?auto_5493 ) ( SURFACE-AT ?auto_5493 ?auto_5498 ) ( ON ?auto_5493 ?auto_5511 ) ( CLEAR ?auto_5493 ) ( not ( = ?auto_5492 ?auto_5493 ) ) ( not ( = ?auto_5492 ?auto_5511 ) ) ( not ( = ?auto_5493 ?auto_5511 ) ) ( SURFACE-AT ?auto_5491 ?auto_5503 ) ( CLEAR ?auto_5491 ) ( IS-CRATE ?auto_5492 ) ( AVAILABLE ?auto_5499 ) ( AVAILABLE ?auto_5501 ) ( SURFACE-AT ?auto_5492 ?auto_5498 ) ( ON ?auto_5492 ?auto_5510 ) ( CLEAR ?auto_5492 ) ( TRUCK-AT ?auto_5500 ?auto_5503 ) ( not ( = ?auto_5491 ?auto_5492 ) ) ( not ( = ?auto_5491 ?auto_5510 ) ) ( not ( = ?auto_5492 ?auto_5510 ) ) ( not ( = ?auto_5491 ?auto_5493 ) ) ( not ( = ?auto_5491 ?auto_5511 ) ) ( not ( = ?auto_5493 ?auto_5510 ) ) ( not ( = ?auto_5511 ?auto_5510 ) ) ( not ( = ?auto_5491 ?auto_5494 ) ) ( not ( = ?auto_5491 ?auto_5508 ) ) ( not ( = ?auto_5492 ?auto_5494 ) ) ( not ( = ?auto_5492 ?auto_5508 ) ) ( not ( = ?auto_5494 ?auto_5511 ) ) ( not ( = ?auto_5494 ?auto_5510 ) ) ( not ( = ?auto_5512 ?auto_5498 ) ) ( not ( = ?auto_5509 ?auto_5501 ) ) ( not ( = ?auto_5508 ?auto_5511 ) ) ( not ( = ?auto_5508 ?auto_5510 ) ) ( not ( = ?auto_5491 ?auto_5495 ) ) ( not ( = ?auto_5491 ?auto_5504 ) ) ( not ( = ?auto_5492 ?auto_5495 ) ) ( not ( = ?auto_5492 ?auto_5504 ) ) ( not ( = ?auto_5493 ?auto_5495 ) ) ( not ( = ?auto_5493 ?auto_5504 ) ) ( not ( = ?auto_5495 ?auto_5508 ) ) ( not ( = ?auto_5495 ?auto_5511 ) ) ( not ( = ?auto_5495 ?auto_5510 ) ) ( not ( = ?auto_5504 ?auto_5508 ) ) ( not ( = ?auto_5504 ?auto_5511 ) ) ( not ( = ?auto_5504 ?auto_5510 ) ) ( not ( = ?auto_5491 ?auto_5496 ) ) ( not ( = ?auto_5491 ?auto_5506 ) ) ( not ( = ?auto_5492 ?auto_5496 ) ) ( not ( = ?auto_5492 ?auto_5506 ) ) ( not ( = ?auto_5493 ?auto_5496 ) ) ( not ( = ?auto_5493 ?auto_5506 ) ) ( not ( = ?auto_5494 ?auto_5496 ) ) ( not ( = ?auto_5494 ?auto_5506 ) ) ( not ( = ?auto_5496 ?auto_5504 ) ) ( not ( = ?auto_5496 ?auto_5508 ) ) ( not ( = ?auto_5496 ?auto_5511 ) ) ( not ( = ?auto_5496 ?auto_5510 ) ) ( not ( = ?auto_5505 ?auto_5498 ) ) ( not ( = ?auto_5505 ?auto_5512 ) ) ( not ( = ?auto_5507 ?auto_5501 ) ) ( not ( = ?auto_5507 ?auto_5509 ) ) ( not ( = ?auto_5506 ?auto_5504 ) ) ( not ( = ?auto_5506 ?auto_5508 ) ) ( not ( = ?auto_5506 ?auto_5511 ) ) ( not ( = ?auto_5506 ?auto_5510 ) ) ( not ( = ?auto_5491 ?auto_5497 ) ) ( not ( = ?auto_5491 ?auto_5502 ) ) ( not ( = ?auto_5492 ?auto_5497 ) ) ( not ( = ?auto_5492 ?auto_5502 ) ) ( not ( = ?auto_5493 ?auto_5497 ) ) ( not ( = ?auto_5493 ?auto_5502 ) ) ( not ( = ?auto_5494 ?auto_5497 ) ) ( not ( = ?auto_5494 ?auto_5502 ) ) ( not ( = ?auto_5495 ?auto_5497 ) ) ( not ( = ?auto_5495 ?auto_5502 ) ) ( not ( = ?auto_5497 ?auto_5506 ) ) ( not ( = ?auto_5497 ?auto_5504 ) ) ( not ( = ?auto_5497 ?auto_5508 ) ) ( not ( = ?auto_5497 ?auto_5511 ) ) ( not ( = ?auto_5497 ?auto_5510 ) ) ( not ( = ?auto_5502 ?auto_5506 ) ) ( not ( = ?auto_5502 ?auto_5504 ) ) ( not ( = ?auto_5502 ?auto_5508 ) ) ( not ( = ?auto_5502 ?auto_5511 ) ) ( not ( = ?auto_5502 ?auto_5510 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_5491 ?auto_5492 ?auto_5493 ?auto_5494 ?auto_5495 ?auto_5496 )
      ( MAKE-1CRATE ?auto_5496 ?auto_5497 )
      ( MAKE-6CRATE-VERIFY ?auto_5491 ?auto_5492 ?auto_5493 ?auto_5494 ?auto_5495 ?auto_5496 ?auto_5497 ) )
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
      ?auto_5541 - HOIST
      ?auto_5540 - PLACE
      ?auto_5543 - PLACE
      ?auto_5542 - HOIST
      ?auto_5544 - SURFACE
      ?auto_5546 - PLACE
      ?auto_5553 - HOIST
      ?auto_5552 - SURFACE
      ?auto_5554 - SURFACE
      ?auto_5549 - SURFACE
      ?auto_5548 - PLACE
      ?auto_5547 - HOIST
      ?auto_5550 - SURFACE
      ?auto_5551 - SURFACE
      ?auto_5545 - SURFACE
      ?auto_5539 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5541 ?auto_5540 ) ( IS-CRATE ?auto_5538 ) ( not ( = ?auto_5543 ?auto_5540 ) ) ( HOIST-AT ?auto_5542 ?auto_5543 ) ( SURFACE-AT ?auto_5538 ?auto_5543 ) ( ON ?auto_5538 ?auto_5544 ) ( CLEAR ?auto_5538 ) ( not ( = ?auto_5537 ?auto_5538 ) ) ( not ( = ?auto_5537 ?auto_5544 ) ) ( not ( = ?auto_5538 ?auto_5544 ) ) ( not ( = ?auto_5541 ?auto_5542 ) ) ( IS-CRATE ?auto_5537 ) ( not ( = ?auto_5546 ?auto_5540 ) ) ( HOIST-AT ?auto_5553 ?auto_5546 ) ( SURFACE-AT ?auto_5537 ?auto_5546 ) ( ON ?auto_5537 ?auto_5552 ) ( CLEAR ?auto_5537 ) ( not ( = ?auto_5536 ?auto_5537 ) ) ( not ( = ?auto_5536 ?auto_5552 ) ) ( not ( = ?auto_5537 ?auto_5552 ) ) ( not ( = ?auto_5541 ?auto_5553 ) ) ( IS-CRATE ?auto_5536 ) ( AVAILABLE ?auto_5542 ) ( SURFACE-AT ?auto_5536 ?auto_5543 ) ( ON ?auto_5536 ?auto_5554 ) ( CLEAR ?auto_5536 ) ( not ( = ?auto_5535 ?auto_5536 ) ) ( not ( = ?auto_5535 ?auto_5554 ) ) ( not ( = ?auto_5536 ?auto_5554 ) ) ( IS-CRATE ?auto_5535 ) ( SURFACE-AT ?auto_5535 ?auto_5546 ) ( ON ?auto_5535 ?auto_5549 ) ( CLEAR ?auto_5535 ) ( not ( = ?auto_5534 ?auto_5535 ) ) ( not ( = ?auto_5534 ?auto_5549 ) ) ( not ( = ?auto_5535 ?auto_5549 ) ) ( IS-CRATE ?auto_5534 ) ( not ( = ?auto_5548 ?auto_5540 ) ) ( HOIST-AT ?auto_5547 ?auto_5548 ) ( AVAILABLE ?auto_5547 ) ( SURFACE-AT ?auto_5534 ?auto_5548 ) ( ON ?auto_5534 ?auto_5550 ) ( CLEAR ?auto_5534 ) ( not ( = ?auto_5533 ?auto_5534 ) ) ( not ( = ?auto_5533 ?auto_5550 ) ) ( not ( = ?auto_5534 ?auto_5550 ) ) ( not ( = ?auto_5541 ?auto_5547 ) ) ( IS-CRATE ?auto_5533 ) ( SURFACE-AT ?auto_5533 ?auto_5546 ) ( ON ?auto_5533 ?auto_5551 ) ( CLEAR ?auto_5533 ) ( not ( = ?auto_5532 ?auto_5533 ) ) ( not ( = ?auto_5532 ?auto_5551 ) ) ( not ( = ?auto_5533 ?auto_5551 ) ) ( SURFACE-AT ?auto_5531 ?auto_5540 ) ( CLEAR ?auto_5531 ) ( IS-CRATE ?auto_5532 ) ( AVAILABLE ?auto_5541 ) ( AVAILABLE ?auto_5553 ) ( SURFACE-AT ?auto_5532 ?auto_5546 ) ( ON ?auto_5532 ?auto_5545 ) ( CLEAR ?auto_5532 ) ( TRUCK-AT ?auto_5539 ?auto_5540 ) ( not ( = ?auto_5531 ?auto_5532 ) ) ( not ( = ?auto_5531 ?auto_5545 ) ) ( not ( = ?auto_5532 ?auto_5545 ) ) ( not ( = ?auto_5531 ?auto_5533 ) ) ( not ( = ?auto_5531 ?auto_5551 ) ) ( not ( = ?auto_5533 ?auto_5545 ) ) ( not ( = ?auto_5551 ?auto_5545 ) ) ( not ( = ?auto_5531 ?auto_5534 ) ) ( not ( = ?auto_5531 ?auto_5550 ) ) ( not ( = ?auto_5532 ?auto_5534 ) ) ( not ( = ?auto_5532 ?auto_5550 ) ) ( not ( = ?auto_5534 ?auto_5551 ) ) ( not ( = ?auto_5534 ?auto_5545 ) ) ( not ( = ?auto_5548 ?auto_5546 ) ) ( not ( = ?auto_5547 ?auto_5553 ) ) ( not ( = ?auto_5550 ?auto_5551 ) ) ( not ( = ?auto_5550 ?auto_5545 ) ) ( not ( = ?auto_5531 ?auto_5535 ) ) ( not ( = ?auto_5531 ?auto_5549 ) ) ( not ( = ?auto_5532 ?auto_5535 ) ) ( not ( = ?auto_5532 ?auto_5549 ) ) ( not ( = ?auto_5533 ?auto_5535 ) ) ( not ( = ?auto_5533 ?auto_5549 ) ) ( not ( = ?auto_5535 ?auto_5550 ) ) ( not ( = ?auto_5535 ?auto_5551 ) ) ( not ( = ?auto_5535 ?auto_5545 ) ) ( not ( = ?auto_5549 ?auto_5550 ) ) ( not ( = ?auto_5549 ?auto_5551 ) ) ( not ( = ?auto_5549 ?auto_5545 ) ) ( not ( = ?auto_5531 ?auto_5536 ) ) ( not ( = ?auto_5531 ?auto_5554 ) ) ( not ( = ?auto_5532 ?auto_5536 ) ) ( not ( = ?auto_5532 ?auto_5554 ) ) ( not ( = ?auto_5533 ?auto_5536 ) ) ( not ( = ?auto_5533 ?auto_5554 ) ) ( not ( = ?auto_5534 ?auto_5536 ) ) ( not ( = ?auto_5534 ?auto_5554 ) ) ( not ( = ?auto_5536 ?auto_5549 ) ) ( not ( = ?auto_5536 ?auto_5550 ) ) ( not ( = ?auto_5536 ?auto_5551 ) ) ( not ( = ?auto_5536 ?auto_5545 ) ) ( not ( = ?auto_5543 ?auto_5546 ) ) ( not ( = ?auto_5543 ?auto_5548 ) ) ( not ( = ?auto_5542 ?auto_5553 ) ) ( not ( = ?auto_5542 ?auto_5547 ) ) ( not ( = ?auto_5554 ?auto_5549 ) ) ( not ( = ?auto_5554 ?auto_5550 ) ) ( not ( = ?auto_5554 ?auto_5551 ) ) ( not ( = ?auto_5554 ?auto_5545 ) ) ( not ( = ?auto_5531 ?auto_5537 ) ) ( not ( = ?auto_5531 ?auto_5552 ) ) ( not ( = ?auto_5532 ?auto_5537 ) ) ( not ( = ?auto_5532 ?auto_5552 ) ) ( not ( = ?auto_5533 ?auto_5537 ) ) ( not ( = ?auto_5533 ?auto_5552 ) ) ( not ( = ?auto_5534 ?auto_5537 ) ) ( not ( = ?auto_5534 ?auto_5552 ) ) ( not ( = ?auto_5535 ?auto_5537 ) ) ( not ( = ?auto_5535 ?auto_5552 ) ) ( not ( = ?auto_5537 ?auto_5554 ) ) ( not ( = ?auto_5537 ?auto_5549 ) ) ( not ( = ?auto_5537 ?auto_5550 ) ) ( not ( = ?auto_5537 ?auto_5551 ) ) ( not ( = ?auto_5537 ?auto_5545 ) ) ( not ( = ?auto_5552 ?auto_5554 ) ) ( not ( = ?auto_5552 ?auto_5549 ) ) ( not ( = ?auto_5552 ?auto_5550 ) ) ( not ( = ?auto_5552 ?auto_5551 ) ) ( not ( = ?auto_5552 ?auto_5545 ) ) ( not ( = ?auto_5531 ?auto_5538 ) ) ( not ( = ?auto_5531 ?auto_5544 ) ) ( not ( = ?auto_5532 ?auto_5538 ) ) ( not ( = ?auto_5532 ?auto_5544 ) ) ( not ( = ?auto_5533 ?auto_5538 ) ) ( not ( = ?auto_5533 ?auto_5544 ) ) ( not ( = ?auto_5534 ?auto_5538 ) ) ( not ( = ?auto_5534 ?auto_5544 ) ) ( not ( = ?auto_5535 ?auto_5538 ) ) ( not ( = ?auto_5535 ?auto_5544 ) ) ( not ( = ?auto_5536 ?auto_5538 ) ) ( not ( = ?auto_5536 ?auto_5544 ) ) ( not ( = ?auto_5538 ?auto_5552 ) ) ( not ( = ?auto_5538 ?auto_5554 ) ) ( not ( = ?auto_5538 ?auto_5549 ) ) ( not ( = ?auto_5538 ?auto_5550 ) ) ( not ( = ?auto_5538 ?auto_5551 ) ) ( not ( = ?auto_5538 ?auto_5545 ) ) ( not ( = ?auto_5544 ?auto_5552 ) ) ( not ( = ?auto_5544 ?auto_5554 ) ) ( not ( = ?auto_5544 ?auto_5549 ) ) ( not ( = ?auto_5544 ?auto_5550 ) ) ( not ( = ?auto_5544 ?auto_5551 ) ) ( not ( = ?auto_5544 ?auto_5545 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_5531 ?auto_5532 ?auto_5533 ?auto_5534 ?auto_5535 ?auto_5536 ?auto_5537 )
      ( MAKE-1CRATE ?auto_5537 ?auto_5538 )
      ( MAKE-7CRATE-VERIFY ?auto_5531 ?auto_5532 ?auto_5533 ?auto_5534 ?auto_5535 ?auto_5536 ?auto_5537 ?auto_5538 ) )
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
      ?auto_5581 - SURFACE
      ?auto_5582 - SURFACE
    )
    :vars
    (
      ?auto_5583 - HOIST
      ?auto_5588 - PLACE
      ?auto_5585 - PLACE
      ?auto_5586 - HOIST
      ?auto_5587 - SURFACE
      ?auto_5591 - PLACE
      ?auto_5589 - HOIST
      ?auto_5597 - SURFACE
      ?auto_5594 - SURFACE
      ?auto_5599 - SURFACE
      ?auto_5595 - SURFACE
      ?auto_5598 - PLACE
      ?auto_5596 - HOIST
      ?auto_5592 - SURFACE
      ?auto_5593 - SURFACE
      ?auto_5590 - SURFACE
      ?auto_5584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5583 ?auto_5588 ) ( IS-CRATE ?auto_5582 ) ( not ( = ?auto_5585 ?auto_5588 ) ) ( HOIST-AT ?auto_5586 ?auto_5585 ) ( SURFACE-AT ?auto_5582 ?auto_5585 ) ( ON ?auto_5582 ?auto_5587 ) ( CLEAR ?auto_5582 ) ( not ( = ?auto_5581 ?auto_5582 ) ) ( not ( = ?auto_5581 ?auto_5587 ) ) ( not ( = ?auto_5582 ?auto_5587 ) ) ( not ( = ?auto_5583 ?auto_5586 ) ) ( IS-CRATE ?auto_5581 ) ( not ( = ?auto_5591 ?auto_5588 ) ) ( HOIST-AT ?auto_5589 ?auto_5591 ) ( SURFACE-AT ?auto_5581 ?auto_5591 ) ( ON ?auto_5581 ?auto_5597 ) ( CLEAR ?auto_5581 ) ( not ( = ?auto_5580 ?auto_5581 ) ) ( not ( = ?auto_5580 ?auto_5597 ) ) ( not ( = ?auto_5581 ?auto_5597 ) ) ( not ( = ?auto_5583 ?auto_5589 ) ) ( IS-CRATE ?auto_5580 ) ( SURFACE-AT ?auto_5580 ?auto_5585 ) ( ON ?auto_5580 ?auto_5594 ) ( CLEAR ?auto_5580 ) ( not ( = ?auto_5579 ?auto_5580 ) ) ( not ( = ?auto_5579 ?auto_5594 ) ) ( not ( = ?auto_5580 ?auto_5594 ) ) ( IS-CRATE ?auto_5579 ) ( AVAILABLE ?auto_5589 ) ( SURFACE-AT ?auto_5579 ?auto_5591 ) ( ON ?auto_5579 ?auto_5599 ) ( CLEAR ?auto_5579 ) ( not ( = ?auto_5578 ?auto_5579 ) ) ( not ( = ?auto_5578 ?auto_5599 ) ) ( not ( = ?auto_5579 ?auto_5599 ) ) ( IS-CRATE ?auto_5578 ) ( SURFACE-AT ?auto_5578 ?auto_5585 ) ( ON ?auto_5578 ?auto_5595 ) ( CLEAR ?auto_5578 ) ( not ( = ?auto_5577 ?auto_5578 ) ) ( not ( = ?auto_5577 ?auto_5595 ) ) ( not ( = ?auto_5578 ?auto_5595 ) ) ( IS-CRATE ?auto_5577 ) ( not ( = ?auto_5598 ?auto_5588 ) ) ( HOIST-AT ?auto_5596 ?auto_5598 ) ( AVAILABLE ?auto_5596 ) ( SURFACE-AT ?auto_5577 ?auto_5598 ) ( ON ?auto_5577 ?auto_5592 ) ( CLEAR ?auto_5577 ) ( not ( = ?auto_5576 ?auto_5577 ) ) ( not ( = ?auto_5576 ?auto_5592 ) ) ( not ( = ?auto_5577 ?auto_5592 ) ) ( not ( = ?auto_5583 ?auto_5596 ) ) ( IS-CRATE ?auto_5576 ) ( SURFACE-AT ?auto_5576 ?auto_5585 ) ( ON ?auto_5576 ?auto_5593 ) ( CLEAR ?auto_5576 ) ( not ( = ?auto_5575 ?auto_5576 ) ) ( not ( = ?auto_5575 ?auto_5593 ) ) ( not ( = ?auto_5576 ?auto_5593 ) ) ( SURFACE-AT ?auto_5574 ?auto_5588 ) ( CLEAR ?auto_5574 ) ( IS-CRATE ?auto_5575 ) ( AVAILABLE ?auto_5583 ) ( AVAILABLE ?auto_5586 ) ( SURFACE-AT ?auto_5575 ?auto_5585 ) ( ON ?auto_5575 ?auto_5590 ) ( CLEAR ?auto_5575 ) ( TRUCK-AT ?auto_5584 ?auto_5588 ) ( not ( = ?auto_5574 ?auto_5575 ) ) ( not ( = ?auto_5574 ?auto_5590 ) ) ( not ( = ?auto_5575 ?auto_5590 ) ) ( not ( = ?auto_5574 ?auto_5576 ) ) ( not ( = ?auto_5574 ?auto_5593 ) ) ( not ( = ?auto_5576 ?auto_5590 ) ) ( not ( = ?auto_5593 ?auto_5590 ) ) ( not ( = ?auto_5574 ?auto_5577 ) ) ( not ( = ?auto_5574 ?auto_5592 ) ) ( not ( = ?auto_5575 ?auto_5577 ) ) ( not ( = ?auto_5575 ?auto_5592 ) ) ( not ( = ?auto_5577 ?auto_5593 ) ) ( not ( = ?auto_5577 ?auto_5590 ) ) ( not ( = ?auto_5598 ?auto_5585 ) ) ( not ( = ?auto_5596 ?auto_5586 ) ) ( not ( = ?auto_5592 ?auto_5593 ) ) ( not ( = ?auto_5592 ?auto_5590 ) ) ( not ( = ?auto_5574 ?auto_5578 ) ) ( not ( = ?auto_5574 ?auto_5595 ) ) ( not ( = ?auto_5575 ?auto_5578 ) ) ( not ( = ?auto_5575 ?auto_5595 ) ) ( not ( = ?auto_5576 ?auto_5578 ) ) ( not ( = ?auto_5576 ?auto_5595 ) ) ( not ( = ?auto_5578 ?auto_5592 ) ) ( not ( = ?auto_5578 ?auto_5593 ) ) ( not ( = ?auto_5578 ?auto_5590 ) ) ( not ( = ?auto_5595 ?auto_5592 ) ) ( not ( = ?auto_5595 ?auto_5593 ) ) ( not ( = ?auto_5595 ?auto_5590 ) ) ( not ( = ?auto_5574 ?auto_5579 ) ) ( not ( = ?auto_5574 ?auto_5599 ) ) ( not ( = ?auto_5575 ?auto_5579 ) ) ( not ( = ?auto_5575 ?auto_5599 ) ) ( not ( = ?auto_5576 ?auto_5579 ) ) ( not ( = ?auto_5576 ?auto_5599 ) ) ( not ( = ?auto_5577 ?auto_5579 ) ) ( not ( = ?auto_5577 ?auto_5599 ) ) ( not ( = ?auto_5579 ?auto_5595 ) ) ( not ( = ?auto_5579 ?auto_5592 ) ) ( not ( = ?auto_5579 ?auto_5593 ) ) ( not ( = ?auto_5579 ?auto_5590 ) ) ( not ( = ?auto_5591 ?auto_5585 ) ) ( not ( = ?auto_5591 ?auto_5598 ) ) ( not ( = ?auto_5589 ?auto_5586 ) ) ( not ( = ?auto_5589 ?auto_5596 ) ) ( not ( = ?auto_5599 ?auto_5595 ) ) ( not ( = ?auto_5599 ?auto_5592 ) ) ( not ( = ?auto_5599 ?auto_5593 ) ) ( not ( = ?auto_5599 ?auto_5590 ) ) ( not ( = ?auto_5574 ?auto_5580 ) ) ( not ( = ?auto_5574 ?auto_5594 ) ) ( not ( = ?auto_5575 ?auto_5580 ) ) ( not ( = ?auto_5575 ?auto_5594 ) ) ( not ( = ?auto_5576 ?auto_5580 ) ) ( not ( = ?auto_5576 ?auto_5594 ) ) ( not ( = ?auto_5577 ?auto_5580 ) ) ( not ( = ?auto_5577 ?auto_5594 ) ) ( not ( = ?auto_5578 ?auto_5580 ) ) ( not ( = ?auto_5578 ?auto_5594 ) ) ( not ( = ?auto_5580 ?auto_5599 ) ) ( not ( = ?auto_5580 ?auto_5595 ) ) ( not ( = ?auto_5580 ?auto_5592 ) ) ( not ( = ?auto_5580 ?auto_5593 ) ) ( not ( = ?auto_5580 ?auto_5590 ) ) ( not ( = ?auto_5594 ?auto_5599 ) ) ( not ( = ?auto_5594 ?auto_5595 ) ) ( not ( = ?auto_5594 ?auto_5592 ) ) ( not ( = ?auto_5594 ?auto_5593 ) ) ( not ( = ?auto_5594 ?auto_5590 ) ) ( not ( = ?auto_5574 ?auto_5581 ) ) ( not ( = ?auto_5574 ?auto_5597 ) ) ( not ( = ?auto_5575 ?auto_5581 ) ) ( not ( = ?auto_5575 ?auto_5597 ) ) ( not ( = ?auto_5576 ?auto_5581 ) ) ( not ( = ?auto_5576 ?auto_5597 ) ) ( not ( = ?auto_5577 ?auto_5581 ) ) ( not ( = ?auto_5577 ?auto_5597 ) ) ( not ( = ?auto_5578 ?auto_5581 ) ) ( not ( = ?auto_5578 ?auto_5597 ) ) ( not ( = ?auto_5579 ?auto_5581 ) ) ( not ( = ?auto_5579 ?auto_5597 ) ) ( not ( = ?auto_5581 ?auto_5594 ) ) ( not ( = ?auto_5581 ?auto_5599 ) ) ( not ( = ?auto_5581 ?auto_5595 ) ) ( not ( = ?auto_5581 ?auto_5592 ) ) ( not ( = ?auto_5581 ?auto_5593 ) ) ( not ( = ?auto_5581 ?auto_5590 ) ) ( not ( = ?auto_5597 ?auto_5594 ) ) ( not ( = ?auto_5597 ?auto_5599 ) ) ( not ( = ?auto_5597 ?auto_5595 ) ) ( not ( = ?auto_5597 ?auto_5592 ) ) ( not ( = ?auto_5597 ?auto_5593 ) ) ( not ( = ?auto_5597 ?auto_5590 ) ) ( not ( = ?auto_5574 ?auto_5582 ) ) ( not ( = ?auto_5574 ?auto_5587 ) ) ( not ( = ?auto_5575 ?auto_5582 ) ) ( not ( = ?auto_5575 ?auto_5587 ) ) ( not ( = ?auto_5576 ?auto_5582 ) ) ( not ( = ?auto_5576 ?auto_5587 ) ) ( not ( = ?auto_5577 ?auto_5582 ) ) ( not ( = ?auto_5577 ?auto_5587 ) ) ( not ( = ?auto_5578 ?auto_5582 ) ) ( not ( = ?auto_5578 ?auto_5587 ) ) ( not ( = ?auto_5579 ?auto_5582 ) ) ( not ( = ?auto_5579 ?auto_5587 ) ) ( not ( = ?auto_5580 ?auto_5582 ) ) ( not ( = ?auto_5580 ?auto_5587 ) ) ( not ( = ?auto_5582 ?auto_5597 ) ) ( not ( = ?auto_5582 ?auto_5594 ) ) ( not ( = ?auto_5582 ?auto_5599 ) ) ( not ( = ?auto_5582 ?auto_5595 ) ) ( not ( = ?auto_5582 ?auto_5592 ) ) ( not ( = ?auto_5582 ?auto_5593 ) ) ( not ( = ?auto_5582 ?auto_5590 ) ) ( not ( = ?auto_5587 ?auto_5597 ) ) ( not ( = ?auto_5587 ?auto_5594 ) ) ( not ( = ?auto_5587 ?auto_5599 ) ) ( not ( = ?auto_5587 ?auto_5595 ) ) ( not ( = ?auto_5587 ?auto_5592 ) ) ( not ( = ?auto_5587 ?auto_5593 ) ) ( not ( = ?auto_5587 ?auto_5590 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_5574 ?auto_5575 ?auto_5576 ?auto_5577 ?auto_5578 ?auto_5579 ?auto_5580 ?auto_5581 )
      ( MAKE-1CRATE ?auto_5581 ?auto_5582 )
      ( MAKE-8CRATE-VERIFY ?auto_5574 ?auto_5575 ?auto_5576 ?auto_5577 ?auto_5578 ?auto_5579 ?auto_5580 ?auto_5581 ?auto_5582 ) )
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
      ?auto_5627 - SURFACE
      ?auto_5628 - SURFACE
      ?auto_5629 - SURFACE
    )
    :vars
    (
      ?auto_5632 - HOIST
      ?auto_5630 - PLACE
      ?auto_5635 - PLACE
      ?auto_5634 - HOIST
      ?auto_5633 - SURFACE
      ?auto_5644 - PLACE
      ?auto_5647 - HOIST
      ?auto_5639 - SURFACE
      ?auto_5636 - SURFACE
      ?auto_5646 - SURFACE
      ?auto_5638 - SURFACE
      ?auto_5640 - SURFACE
      ?auto_5645 - PLACE
      ?auto_5642 - HOIST
      ?auto_5643 - SURFACE
      ?auto_5637 - SURFACE
      ?auto_5641 - SURFACE
      ?auto_5631 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5632 ?auto_5630 ) ( IS-CRATE ?auto_5629 ) ( not ( = ?auto_5635 ?auto_5630 ) ) ( HOIST-AT ?auto_5634 ?auto_5635 ) ( SURFACE-AT ?auto_5629 ?auto_5635 ) ( ON ?auto_5629 ?auto_5633 ) ( CLEAR ?auto_5629 ) ( not ( = ?auto_5628 ?auto_5629 ) ) ( not ( = ?auto_5628 ?auto_5633 ) ) ( not ( = ?auto_5629 ?auto_5633 ) ) ( not ( = ?auto_5632 ?auto_5634 ) ) ( IS-CRATE ?auto_5628 ) ( not ( = ?auto_5644 ?auto_5630 ) ) ( HOIST-AT ?auto_5647 ?auto_5644 ) ( SURFACE-AT ?auto_5628 ?auto_5644 ) ( ON ?auto_5628 ?auto_5639 ) ( CLEAR ?auto_5628 ) ( not ( = ?auto_5627 ?auto_5628 ) ) ( not ( = ?auto_5627 ?auto_5639 ) ) ( not ( = ?auto_5628 ?auto_5639 ) ) ( not ( = ?auto_5632 ?auto_5647 ) ) ( IS-CRATE ?auto_5627 ) ( SURFACE-AT ?auto_5627 ?auto_5635 ) ( ON ?auto_5627 ?auto_5636 ) ( CLEAR ?auto_5627 ) ( not ( = ?auto_5626 ?auto_5627 ) ) ( not ( = ?auto_5626 ?auto_5636 ) ) ( not ( = ?auto_5627 ?auto_5636 ) ) ( IS-CRATE ?auto_5626 ) ( SURFACE-AT ?auto_5626 ?auto_5644 ) ( ON ?auto_5626 ?auto_5646 ) ( CLEAR ?auto_5626 ) ( not ( = ?auto_5625 ?auto_5626 ) ) ( not ( = ?auto_5625 ?auto_5646 ) ) ( not ( = ?auto_5626 ?auto_5646 ) ) ( IS-CRATE ?auto_5625 ) ( AVAILABLE ?auto_5634 ) ( SURFACE-AT ?auto_5625 ?auto_5635 ) ( ON ?auto_5625 ?auto_5638 ) ( CLEAR ?auto_5625 ) ( not ( = ?auto_5624 ?auto_5625 ) ) ( not ( = ?auto_5624 ?auto_5638 ) ) ( not ( = ?auto_5625 ?auto_5638 ) ) ( IS-CRATE ?auto_5624 ) ( SURFACE-AT ?auto_5624 ?auto_5644 ) ( ON ?auto_5624 ?auto_5640 ) ( CLEAR ?auto_5624 ) ( not ( = ?auto_5623 ?auto_5624 ) ) ( not ( = ?auto_5623 ?auto_5640 ) ) ( not ( = ?auto_5624 ?auto_5640 ) ) ( IS-CRATE ?auto_5623 ) ( not ( = ?auto_5645 ?auto_5630 ) ) ( HOIST-AT ?auto_5642 ?auto_5645 ) ( AVAILABLE ?auto_5642 ) ( SURFACE-AT ?auto_5623 ?auto_5645 ) ( ON ?auto_5623 ?auto_5643 ) ( CLEAR ?auto_5623 ) ( not ( = ?auto_5622 ?auto_5623 ) ) ( not ( = ?auto_5622 ?auto_5643 ) ) ( not ( = ?auto_5623 ?auto_5643 ) ) ( not ( = ?auto_5632 ?auto_5642 ) ) ( IS-CRATE ?auto_5622 ) ( SURFACE-AT ?auto_5622 ?auto_5644 ) ( ON ?auto_5622 ?auto_5637 ) ( CLEAR ?auto_5622 ) ( not ( = ?auto_5621 ?auto_5622 ) ) ( not ( = ?auto_5621 ?auto_5637 ) ) ( not ( = ?auto_5622 ?auto_5637 ) ) ( SURFACE-AT ?auto_5620 ?auto_5630 ) ( CLEAR ?auto_5620 ) ( IS-CRATE ?auto_5621 ) ( AVAILABLE ?auto_5632 ) ( AVAILABLE ?auto_5647 ) ( SURFACE-AT ?auto_5621 ?auto_5644 ) ( ON ?auto_5621 ?auto_5641 ) ( CLEAR ?auto_5621 ) ( TRUCK-AT ?auto_5631 ?auto_5630 ) ( not ( = ?auto_5620 ?auto_5621 ) ) ( not ( = ?auto_5620 ?auto_5641 ) ) ( not ( = ?auto_5621 ?auto_5641 ) ) ( not ( = ?auto_5620 ?auto_5622 ) ) ( not ( = ?auto_5620 ?auto_5637 ) ) ( not ( = ?auto_5622 ?auto_5641 ) ) ( not ( = ?auto_5637 ?auto_5641 ) ) ( not ( = ?auto_5620 ?auto_5623 ) ) ( not ( = ?auto_5620 ?auto_5643 ) ) ( not ( = ?auto_5621 ?auto_5623 ) ) ( not ( = ?auto_5621 ?auto_5643 ) ) ( not ( = ?auto_5623 ?auto_5637 ) ) ( not ( = ?auto_5623 ?auto_5641 ) ) ( not ( = ?auto_5645 ?auto_5644 ) ) ( not ( = ?auto_5642 ?auto_5647 ) ) ( not ( = ?auto_5643 ?auto_5637 ) ) ( not ( = ?auto_5643 ?auto_5641 ) ) ( not ( = ?auto_5620 ?auto_5624 ) ) ( not ( = ?auto_5620 ?auto_5640 ) ) ( not ( = ?auto_5621 ?auto_5624 ) ) ( not ( = ?auto_5621 ?auto_5640 ) ) ( not ( = ?auto_5622 ?auto_5624 ) ) ( not ( = ?auto_5622 ?auto_5640 ) ) ( not ( = ?auto_5624 ?auto_5643 ) ) ( not ( = ?auto_5624 ?auto_5637 ) ) ( not ( = ?auto_5624 ?auto_5641 ) ) ( not ( = ?auto_5640 ?auto_5643 ) ) ( not ( = ?auto_5640 ?auto_5637 ) ) ( not ( = ?auto_5640 ?auto_5641 ) ) ( not ( = ?auto_5620 ?auto_5625 ) ) ( not ( = ?auto_5620 ?auto_5638 ) ) ( not ( = ?auto_5621 ?auto_5625 ) ) ( not ( = ?auto_5621 ?auto_5638 ) ) ( not ( = ?auto_5622 ?auto_5625 ) ) ( not ( = ?auto_5622 ?auto_5638 ) ) ( not ( = ?auto_5623 ?auto_5625 ) ) ( not ( = ?auto_5623 ?auto_5638 ) ) ( not ( = ?auto_5625 ?auto_5640 ) ) ( not ( = ?auto_5625 ?auto_5643 ) ) ( not ( = ?auto_5625 ?auto_5637 ) ) ( not ( = ?auto_5625 ?auto_5641 ) ) ( not ( = ?auto_5635 ?auto_5644 ) ) ( not ( = ?auto_5635 ?auto_5645 ) ) ( not ( = ?auto_5634 ?auto_5647 ) ) ( not ( = ?auto_5634 ?auto_5642 ) ) ( not ( = ?auto_5638 ?auto_5640 ) ) ( not ( = ?auto_5638 ?auto_5643 ) ) ( not ( = ?auto_5638 ?auto_5637 ) ) ( not ( = ?auto_5638 ?auto_5641 ) ) ( not ( = ?auto_5620 ?auto_5626 ) ) ( not ( = ?auto_5620 ?auto_5646 ) ) ( not ( = ?auto_5621 ?auto_5626 ) ) ( not ( = ?auto_5621 ?auto_5646 ) ) ( not ( = ?auto_5622 ?auto_5626 ) ) ( not ( = ?auto_5622 ?auto_5646 ) ) ( not ( = ?auto_5623 ?auto_5626 ) ) ( not ( = ?auto_5623 ?auto_5646 ) ) ( not ( = ?auto_5624 ?auto_5626 ) ) ( not ( = ?auto_5624 ?auto_5646 ) ) ( not ( = ?auto_5626 ?auto_5638 ) ) ( not ( = ?auto_5626 ?auto_5640 ) ) ( not ( = ?auto_5626 ?auto_5643 ) ) ( not ( = ?auto_5626 ?auto_5637 ) ) ( not ( = ?auto_5626 ?auto_5641 ) ) ( not ( = ?auto_5646 ?auto_5638 ) ) ( not ( = ?auto_5646 ?auto_5640 ) ) ( not ( = ?auto_5646 ?auto_5643 ) ) ( not ( = ?auto_5646 ?auto_5637 ) ) ( not ( = ?auto_5646 ?auto_5641 ) ) ( not ( = ?auto_5620 ?auto_5627 ) ) ( not ( = ?auto_5620 ?auto_5636 ) ) ( not ( = ?auto_5621 ?auto_5627 ) ) ( not ( = ?auto_5621 ?auto_5636 ) ) ( not ( = ?auto_5622 ?auto_5627 ) ) ( not ( = ?auto_5622 ?auto_5636 ) ) ( not ( = ?auto_5623 ?auto_5627 ) ) ( not ( = ?auto_5623 ?auto_5636 ) ) ( not ( = ?auto_5624 ?auto_5627 ) ) ( not ( = ?auto_5624 ?auto_5636 ) ) ( not ( = ?auto_5625 ?auto_5627 ) ) ( not ( = ?auto_5625 ?auto_5636 ) ) ( not ( = ?auto_5627 ?auto_5646 ) ) ( not ( = ?auto_5627 ?auto_5638 ) ) ( not ( = ?auto_5627 ?auto_5640 ) ) ( not ( = ?auto_5627 ?auto_5643 ) ) ( not ( = ?auto_5627 ?auto_5637 ) ) ( not ( = ?auto_5627 ?auto_5641 ) ) ( not ( = ?auto_5636 ?auto_5646 ) ) ( not ( = ?auto_5636 ?auto_5638 ) ) ( not ( = ?auto_5636 ?auto_5640 ) ) ( not ( = ?auto_5636 ?auto_5643 ) ) ( not ( = ?auto_5636 ?auto_5637 ) ) ( not ( = ?auto_5636 ?auto_5641 ) ) ( not ( = ?auto_5620 ?auto_5628 ) ) ( not ( = ?auto_5620 ?auto_5639 ) ) ( not ( = ?auto_5621 ?auto_5628 ) ) ( not ( = ?auto_5621 ?auto_5639 ) ) ( not ( = ?auto_5622 ?auto_5628 ) ) ( not ( = ?auto_5622 ?auto_5639 ) ) ( not ( = ?auto_5623 ?auto_5628 ) ) ( not ( = ?auto_5623 ?auto_5639 ) ) ( not ( = ?auto_5624 ?auto_5628 ) ) ( not ( = ?auto_5624 ?auto_5639 ) ) ( not ( = ?auto_5625 ?auto_5628 ) ) ( not ( = ?auto_5625 ?auto_5639 ) ) ( not ( = ?auto_5626 ?auto_5628 ) ) ( not ( = ?auto_5626 ?auto_5639 ) ) ( not ( = ?auto_5628 ?auto_5636 ) ) ( not ( = ?auto_5628 ?auto_5646 ) ) ( not ( = ?auto_5628 ?auto_5638 ) ) ( not ( = ?auto_5628 ?auto_5640 ) ) ( not ( = ?auto_5628 ?auto_5643 ) ) ( not ( = ?auto_5628 ?auto_5637 ) ) ( not ( = ?auto_5628 ?auto_5641 ) ) ( not ( = ?auto_5639 ?auto_5636 ) ) ( not ( = ?auto_5639 ?auto_5646 ) ) ( not ( = ?auto_5639 ?auto_5638 ) ) ( not ( = ?auto_5639 ?auto_5640 ) ) ( not ( = ?auto_5639 ?auto_5643 ) ) ( not ( = ?auto_5639 ?auto_5637 ) ) ( not ( = ?auto_5639 ?auto_5641 ) ) ( not ( = ?auto_5620 ?auto_5629 ) ) ( not ( = ?auto_5620 ?auto_5633 ) ) ( not ( = ?auto_5621 ?auto_5629 ) ) ( not ( = ?auto_5621 ?auto_5633 ) ) ( not ( = ?auto_5622 ?auto_5629 ) ) ( not ( = ?auto_5622 ?auto_5633 ) ) ( not ( = ?auto_5623 ?auto_5629 ) ) ( not ( = ?auto_5623 ?auto_5633 ) ) ( not ( = ?auto_5624 ?auto_5629 ) ) ( not ( = ?auto_5624 ?auto_5633 ) ) ( not ( = ?auto_5625 ?auto_5629 ) ) ( not ( = ?auto_5625 ?auto_5633 ) ) ( not ( = ?auto_5626 ?auto_5629 ) ) ( not ( = ?auto_5626 ?auto_5633 ) ) ( not ( = ?auto_5627 ?auto_5629 ) ) ( not ( = ?auto_5627 ?auto_5633 ) ) ( not ( = ?auto_5629 ?auto_5639 ) ) ( not ( = ?auto_5629 ?auto_5636 ) ) ( not ( = ?auto_5629 ?auto_5646 ) ) ( not ( = ?auto_5629 ?auto_5638 ) ) ( not ( = ?auto_5629 ?auto_5640 ) ) ( not ( = ?auto_5629 ?auto_5643 ) ) ( not ( = ?auto_5629 ?auto_5637 ) ) ( not ( = ?auto_5629 ?auto_5641 ) ) ( not ( = ?auto_5633 ?auto_5639 ) ) ( not ( = ?auto_5633 ?auto_5636 ) ) ( not ( = ?auto_5633 ?auto_5646 ) ) ( not ( = ?auto_5633 ?auto_5638 ) ) ( not ( = ?auto_5633 ?auto_5640 ) ) ( not ( = ?auto_5633 ?auto_5643 ) ) ( not ( = ?auto_5633 ?auto_5637 ) ) ( not ( = ?auto_5633 ?auto_5641 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_5620 ?auto_5621 ?auto_5622 ?auto_5623 ?auto_5624 ?auto_5625 ?auto_5626 ?auto_5627 ?auto_5628 )
      ( MAKE-1CRATE ?auto_5628 ?auto_5629 )
      ( MAKE-9CRATE-VERIFY ?auto_5620 ?auto_5621 ?auto_5622 ?auto_5623 ?auto_5624 ?auto_5625 ?auto_5626 ?auto_5627 ?auto_5628 ?auto_5629 ) )
  )

)

