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
      ?auto_5330 - SURFACE
      ?auto_5331 - SURFACE
    )
    :vars
    (
      ?auto_5332 - HOIST
      ?auto_5333 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5332 ?auto_5333 ) ( SURFACE-AT ?auto_5330 ?auto_5333 ) ( CLEAR ?auto_5330 ) ( LIFTING ?auto_5332 ?auto_5331 ) ( IS-CRATE ?auto_5331 ) ( not ( = ?auto_5330 ?auto_5331 ) ) )
    :subtasks
    ( ( !DROP ?auto_5332 ?auto_5331 ?auto_5330 ?auto_5333 )
      ( MAKE-1CRATE-VERIFY ?auto_5330 ?auto_5331 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5334 - SURFACE
      ?auto_5335 - SURFACE
    )
    :vars
    (
      ?auto_5337 - HOIST
      ?auto_5336 - PLACE
      ?auto_5338 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5337 ?auto_5336 ) ( SURFACE-AT ?auto_5334 ?auto_5336 ) ( CLEAR ?auto_5334 ) ( IS-CRATE ?auto_5335 ) ( not ( = ?auto_5334 ?auto_5335 ) ) ( TRUCK-AT ?auto_5338 ?auto_5336 ) ( AVAILABLE ?auto_5337 ) ( IN ?auto_5335 ?auto_5338 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5337 ?auto_5335 ?auto_5338 ?auto_5336 )
      ( MAKE-1CRATE ?auto_5334 ?auto_5335 )
      ( MAKE-1CRATE-VERIFY ?auto_5334 ?auto_5335 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5339 - SURFACE
      ?auto_5340 - SURFACE
    )
    :vars
    (
      ?auto_5343 - HOIST
      ?auto_5341 - PLACE
      ?auto_5342 - TRUCK
      ?auto_5344 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5343 ?auto_5341 ) ( SURFACE-AT ?auto_5339 ?auto_5341 ) ( CLEAR ?auto_5339 ) ( IS-CRATE ?auto_5340 ) ( not ( = ?auto_5339 ?auto_5340 ) ) ( AVAILABLE ?auto_5343 ) ( IN ?auto_5340 ?auto_5342 ) ( TRUCK-AT ?auto_5342 ?auto_5344 ) ( not ( = ?auto_5344 ?auto_5341 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5342 ?auto_5344 ?auto_5341 )
      ( MAKE-1CRATE ?auto_5339 ?auto_5340 )
      ( MAKE-1CRATE-VERIFY ?auto_5339 ?auto_5340 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5345 - SURFACE
      ?auto_5346 - SURFACE
    )
    :vars
    (
      ?auto_5350 - HOIST
      ?auto_5347 - PLACE
      ?auto_5348 - TRUCK
      ?auto_5349 - PLACE
      ?auto_5351 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5350 ?auto_5347 ) ( SURFACE-AT ?auto_5345 ?auto_5347 ) ( CLEAR ?auto_5345 ) ( IS-CRATE ?auto_5346 ) ( not ( = ?auto_5345 ?auto_5346 ) ) ( AVAILABLE ?auto_5350 ) ( TRUCK-AT ?auto_5348 ?auto_5349 ) ( not ( = ?auto_5349 ?auto_5347 ) ) ( HOIST-AT ?auto_5351 ?auto_5349 ) ( LIFTING ?auto_5351 ?auto_5346 ) ( not ( = ?auto_5350 ?auto_5351 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5351 ?auto_5346 ?auto_5348 ?auto_5349 )
      ( MAKE-1CRATE ?auto_5345 ?auto_5346 )
      ( MAKE-1CRATE-VERIFY ?auto_5345 ?auto_5346 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5352 - SURFACE
      ?auto_5353 - SURFACE
    )
    :vars
    (
      ?auto_5358 - HOIST
      ?auto_5357 - PLACE
      ?auto_5356 - TRUCK
      ?auto_5355 - PLACE
      ?auto_5354 - HOIST
      ?auto_5359 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5358 ?auto_5357 ) ( SURFACE-AT ?auto_5352 ?auto_5357 ) ( CLEAR ?auto_5352 ) ( IS-CRATE ?auto_5353 ) ( not ( = ?auto_5352 ?auto_5353 ) ) ( AVAILABLE ?auto_5358 ) ( TRUCK-AT ?auto_5356 ?auto_5355 ) ( not ( = ?auto_5355 ?auto_5357 ) ) ( HOIST-AT ?auto_5354 ?auto_5355 ) ( not ( = ?auto_5358 ?auto_5354 ) ) ( AVAILABLE ?auto_5354 ) ( SURFACE-AT ?auto_5353 ?auto_5355 ) ( ON ?auto_5353 ?auto_5359 ) ( CLEAR ?auto_5353 ) ( not ( = ?auto_5352 ?auto_5359 ) ) ( not ( = ?auto_5353 ?auto_5359 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5354 ?auto_5353 ?auto_5359 ?auto_5355 )
      ( MAKE-1CRATE ?auto_5352 ?auto_5353 )
      ( MAKE-1CRATE-VERIFY ?auto_5352 ?auto_5353 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5360 - SURFACE
      ?auto_5361 - SURFACE
    )
    :vars
    (
      ?auto_5362 - HOIST
      ?auto_5364 - PLACE
      ?auto_5367 - PLACE
      ?auto_5366 - HOIST
      ?auto_5363 - SURFACE
      ?auto_5365 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5362 ?auto_5364 ) ( SURFACE-AT ?auto_5360 ?auto_5364 ) ( CLEAR ?auto_5360 ) ( IS-CRATE ?auto_5361 ) ( not ( = ?auto_5360 ?auto_5361 ) ) ( AVAILABLE ?auto_5362 ) ( not ( = ?auto_5367 ?auto_5364 ) ) ( HOIST-AT ?auto_5366 ?auto_5367 ) ( not ( = ?auto_5362 ?auto_5366 ) ) ( AVAILABLE ?auto_5366 ) ( SURFACE-AT ?auto_5361 ?auto_5367 ) ( ON ?auto_5361 ?auto_5363 ) ( CLEAR ?auto_5361 ) ( not ( = ?auto_5360 ?auto_5363 ) ) ( not ( = ?auto_5361 ?auto_5363 ) ) ( TRUCK-AT ?auto_5365 ?auto_5364 ) )
    :subtasks
    ( ( !DRIVE ?auto_5365 ?auto_5364 ?auto_5367 )
      ( MAKE-1CRATE ?auto_5360 ?auto_5361 )
      ( MAKE-1CRATE-VERIFY ?auto_5360 ?auto_5361 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5373 - SURFACE
      ?auto_5374 - SURFACE
    )
    :vars
    (
      ?auto_5375 - HOIST
      ?auto_5376 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5375 ?auto_5376 ) ( SURFACE-AT ?auto_5373 ?auto_5376 ) ( CLEAR ?auto_5373 ) ( LIFTING ?auto_5375 ?auto_5374 ) ( IS-CRATE ?auto_5374 ) ( not ( = ?auto_5373 ?auto_5374 ) ) )
    :subtasks
    ( ( !DROP ?auto_5375 ?auto_5374 ?auto_5373 ?auto_5376 )
      ( MAKE-1CRATE-VERIFY ?auto_5373 ?auto_5374 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5377 - SURFACE
      ?auto_5378 - SURFACE
      ?auto_5379 - SURFACE
    )
    :vars
    (
      ?auto_5380 - HOIST
      ?auto_5381 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5380 ?auto_5381 ) ( SURFACE-AT ?auto_5378 ?auto_5381 ) ( CLEAR ?auto_5378 ) ( LIFTING ?auto_5380 ?auto_5379 ) ( IS-CRATE ?auto_5379 ) ( not ( = ?auto_5378 ?auto_5379 ) ) ( ON ?auto_5378 ?auto_5377 ) ( not ( = ?auto_5377 ?auto_5378 ) ) ( not ( = ?auto_5377 ?auto_5379 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5378 ?auto_5379 )
      ( MAKE-2CRATE-VERIFY ?auto_5377 ?auto_5378 ?auto_5379 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5382 - SURFACE
      ?auto_5383 - SURFACE
    )
    :vars
    (
      ?auto_5384 - HOIST
      ?auto_5385 - PLACE
      ?auto_5386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5384 ?auto_5385 ) ( SURFACE-AT ?auto_5382 ?auto_5385 ) ( CLEAR ?auto_5382 ) ( IS-CRATE ?auto_5383 ) ( not ( = ?auto_5382 ?auto_5383 ) ) ( TRUCK-AT ?auto_5386 ?auto_5385 ) ( AVAILABLE ?auto_5384 ) ( IN ?auto_5383 ?auto_5386 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5384 ?auto_5383 ?auto_5386 ?auto_5385 )
      ( MAKE-1CRATE ?auto_5382 ?auto_5383 )
      ( MAKE-1CRATE-VERIFY ?auto_5382 ?auto_5383 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5387 - SURFACE
      ?auto_5388 - SURFACE
      ?auto_5389 - SURFACE
    )
    :vars
    (
      ?auto_5390 - HOIST
      ?auto_5391 - PLACE
      ?auto_5392 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5390 ?auto_5391 ) ( SURFACE-AT ?auto_5388 ?auto_5391 ) ( CLEAR ?auto_5388 ) ( IS-CRATE ?auto_5389 ) ( not ( = ?auto_5388 ?auto_5389 ) ) ( TRUCK-AT ?auto_5392 ?auto_5391 ) ( AVAILABLE ?auto_5390 ) ( IN ?auto_5389 ?auto_5392 ) ( ON ?auto_5388 ?auto_5387 ) ( not ( = ?auto_5387 ?auto_5388 ) ) ( not ( = ?auto_5387 ?auto_5389 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5388 ?auto_5389 )
      ( MAKE-2CRATE-VERIFY ?auto_5387 ?auto_5388 ?auto_5389 ) )
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
      ?auto_5398 - PLACE
      ?auto_5396 - TRUCK
      ?auto_5397 - SURFACE
      ?auto_5399 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5395 ?auto_5398 ) ( SURFACE-AT ?auto_5393 ?auto_5398 ) ( CLEAR ?auto_5393 ) ( IS-CRATE ?auto_5394 ) ( not ( = ?auto_5393 ?auto_5394 ) ) ( AVAILABLE ?auto_5395 ) ( IN ?auto_5394 ?auto_5396 ) ( ON ?auto_5393 ?auto_5397 ) ( not ( = ?auto_5397 ?auto_5393 ) ) ( not ( = ?auto_5397 ?auto_5394 ) ) ( TRUCK-AT ?auto_5396 ?auto_5399 ) ( not ( = ?auto_5399 ?auto_5398 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5396 ?auto_5399 ?auto_5398 )
      ( MAKE-2CRATE ?auto_5397 ?auto_5393 ?auto_5394 )
      ( MAKE-1CRATE-VERIFY ?auto_5393 ?auto_5394 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5400 - SURFACE
      ?auto_5401 - SURFACE
      ?auto_5402 - SURFACE
    )
    :vars
    (
      ?auto_5405 - HOIST
      ?auto_5403 - PLACE
      ?auto_5404 - TRUCK
      ?auto_5406 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5405 ?auto_5403 ) ( SURFACE-AT ?auto_5401 ?auto_5403 ) ( CLEAR ?auto_5401 ) ( IS-CRATE ?auto_5402 ) ( not ( = ?auto_5401 ?auto_5402 ) ) ( AVAILABLE ?auto_5405 ) ( IN ?auto_5402 ?auto_5404 ) ( ON ?auto_5401 ?auto_5400 ) ( not ( = ?auto_5400 ?auto_5401 ) ) ( not ( = ?auto_5400 ?auto_5402 ) ) ( TRUCK-AT ?auto_5404 ?auto_5406 ) ( not ( = ?auto_5406 ?auto_5403 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5401 ?auto_5402 )
      ( MAKE-2CRATE-VERIFY ?auto_5400 ?auto_5401 ?auto_5402 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5407 - SURFACE
      ?auto_5408 - SURFACE
    )
    :vars
    (
      ?auto_5413 - HOIST
      ?auto_5409 - PLACE
      ?auto_5412 - SURFACE
      ?auto_5410 - TRUCK
      ?auto_5411 - PLACE
      ?auto_5414 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5413 ?auto_5409 ) ( SURFACE-AT ?auto_5407 ?auto_5409 ) ( CLEAR ?auto_5407 ) ( IS-CRATE ?auto_5408 ) ( not ( = ?auto_5407 ?auto_5408 ) ) ( AVAILABLE ?auto_5413 ) ( ON ?auto_5407 ?auto_5412 ) ( not ( = ?auto_5412 ?auto_5407 ) ) ( not ( = ?auto_5412 ?auto_5408 ) ) ( TRUCK-AT ?auto_5410 ?auto_5411 ) ( not ( = ?auto_5411 ?auto_5409 ) ) ( HOIST-AT ?auto_5414 ?auto_5411 ) ( LIFTING ?auto_5414 ?auto_5408 ) ( not ( = ?auto_5413 ?auto_5414 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5414 ?auto_5408 ?auto_5410 ?auto_5411 )
      ( MAKE-2CRATE ?auto_5412 ?auto_5407 ?auto_5408 )
      ( MAKE-1CRATE-VERIFY ?auto_5407 ?auto_5408 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5415 - SURFACE
      ?auto_5416 - SURFACE
      ?auto_5417 - SURFACE
    )
    :vars
    (
      ?auto_5418 - HOIST
      ?auto_5419 - PLACE
      ?auto_5422 - TRUCK
      ?auto_5420 - PLACE
      ?auto_5421 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5418 ?auto_5419 ) ( SURFACE-AT ?auto_5416 ?auto_5419 ) ( CLEAR ?auto_5416 ) ( IS-CRATE ?auto_5417 ) ( not ( = ?auto_5416 ?auto_5417 ) ) ( AVAILABLE ?auto_5418 ) ( ON ?auto_5416 ?auto_5415 ) ( not ( = ?auto_5415 ?auto_5416 ) ) ( not ( = ?auto_5415 ?auto_5417 ) ) ( TRUCK-AT ?auto_5422 ?auto_5420 ) ( not ( = ?auto_5420 ?auto_5419 ) ) ( HOIST-AT ?auto_5421 ?auto_5420 ) ( LIFTING ?auto_5421 ?auto_5417 ) ( not ( = ?auto_5418 ?auto_5421 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5416 ?auto_5417 )
      ( MAKE-2CRATE-VERIFY ?auto_5415 ?auto_5416 ?auto_5417 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5423 - SURFACE
      ?auto_5424 - SURFACE
    )
    :vars
    (
      ?auto_5426 - HOIST
      ?auto_5425 - PLACE
      ?auto_5427 - SURFACE
      ?auto_5429 - TRUCK
      ?auto_5430 - PLACE
      ?auto_5428 - HOIST
      ?auto_5431 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5426 ?auto_5425 ) ( SURFACE-AT ?auto_5423 ?auto_5425 ) ( CLEAR ?auto_5423 ) ( IS-CRATE ?auto_5424 ) ( not ( = ?auto_5423 ?auto_5424 ) ) ( AVAILABLE ?auto_5426 ) ( ON ?auto_5423 ?auto_5427 ) ( not ( = ?auto_5427 ?auto_5423 ) ) ( not ( = ?auto_5427 ?auto_5424 ) ) ( TRUCK-AT ?auto_5429 ?auto_5430 ) ( not ( = ?auto_5430 ?auto_5425 ) ) ( HOIST-AT ?auto_5428 ?auto_5430 ) ( not ( = ?auto_5426 ?auto_5428 ) ) ( AVAILABLE ?auto_5428 ) ( SURFACE-AT ?auto_5424 ?auto_5430 ) ( ON ?auto_5424 ?auto_5431 ) ( CLEAR ?auto_5424 ) ( not ( = ?auto_5423 ?auto_5431 ) ) ( not ( = ?auto_5424 ?auto_5431 ) ) ( not ( = ?auto_5427 ?auto_5431 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5428 ?auto_5424 ?auto_5431 ?auto_5430 )
      ( MAKE-2CRATE ?auto_5427 ?auto_5423 ?auto_5424 )
      ( MAKE-1CRATE-VERIFY ?auto_5423 ?auto_5424 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5432 - SURFACE
      ?auto_5433 - SURFACE
      ?auto_5434 - SURFACE
    )
    :vars
    (
      ?auto_5435 - HOIST
      ?auto_5436 - PLACE
      ?auto_5438 - TRUCK
      ?auto_5437 - PLACE
      ?auto_5440 - HOIST
      ?auto_5439 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5435 ?auto_5436 ) ( SURFACE-AT ?auto_5433 ?auto_5436 ) ( CLEAR ?auto_5433 ) ( IS-CRATE ?auto_5434 ) ( not ( = ?auto_5433 ?auto_5434 ) ) ( AVAILABLE ?auto_5435 ) ( ON ?auto_5433 ?auto_5432 ) ( not ( = ?auto_5432 ?auto_5433 ) ) ( not ( = ?auto_5432 ?auto_5434 ) ) ( TRUCK-AT ?auto_5438 ?auto_5437 ) ( not ( = ?auto_5437 ?auto_5436 ) ) ( HOIST-AT ?auto_5440 ?auto_5437 ) ( not ( = ?auto_5435 ?auto_5440 ) ) ( AVAILABLE ?auto_5440 ) ( SURFACE-AT ?auto_5434 ?auto_5437 ) ( ON ?auto_5434 ?auto_5439 ) ( CLEAR ?auto_5434 ) ( not ( = ?auto_5433 ?auto_5439 ) ) ( not ( = ?auto_5434 ?auto_5439 ) ) ( not ( = ?auto_5432 ?auto_5439 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5433 ?auto_5434 )
      ( MAKE-2CRATE-VERIFY ?auto_5432 ?auto_5433 ?auto_5434 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5441 - SURFACE
      ?auto_5442 - SURFACE
    )
    :vars
    (
      ?auto_5448 - HOIST
      ?auto_5449 - PLACE
      ?auto_5445 - SURFACE
      ?auto_5443 - PLACE
      ?auto_5446 - HOIST
      ?auto_5447 - SURFACE
      ?auto_5444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5448 ?auto_5449 ) ( SURFACE-AT ?auto_5441 ?auto_5449 ) ( CLEAR ?auto_5441 ) ( IS-CRATE ?auto_5442 ) ( not ( = ?auto_5441 ?auto_5442 ) ) ( AVAILABLE ?auto_5448 ) ( ON ?auto_5441 ?auto_5445 ) ( not ( = ?auto_5445 ?auto_5441 ) ) ( not ( = ?auto_5445 ?auto_5442 ) ) ( not ( = ?auto_5443 ?auto_5449 ) ) ( HOIST-AT ?auto_5446 ?auto_5443 ) ( not ( = ?auto_5448 ?auto_5446 ) ) ( AVAILABLE ?auto_5446 ) ( SURFACE-AT ?auto_5442 ?auto_5443 ) ( ON ?auto_5442 ?auto_5447 ) ( CLEAR ?auto_5442 ) ( not ( = ?auto_5441 ?auto_5447 ) ) ( not ( = ?auto_5442 ?auto_5447 ) ) ( not ( = ?auto_5445 ?auto_5447 ) ) ( TRUCK-AT ?auto_5444 ?auto_5449 ) )
    :subtasks
    ( ( !DRIVE ?auto_5444 ?auto_5449 ?auto_5443 )
      ( MAKE-2CRATE ?auto_5445 ?auto_5441 ?auto_5442 )
      ( MAKE-1CRATE-VERIFY ?auto_5441 ?auto_5442 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5450 - SURFACE
      ?auto_5451 - SURFACE
      ?auto_5452 - SURFACE
    )
    :vars
    (
      ?auto_5458 - HOIST
      ?auto_5454 - PLACE
      ?auto_5456 - PLACE
      ?auto_5455 - HOIST
      ?auto_5453 - SURFACE
      ?auto_5457 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5458 ?auto_5454 ) ( SURFACE-AT ?auto_5451 ?auto_5454 ) ( CLEAR ?auto_5451 ) ( IS-CRATE ?auto_5452 ) ( not ( = ?auto_5451 ?auto_5452 ) ) ( AVAILABLE ?auto_5458 ) ( ON ?auto_5451 ?auto_5450 ) ( not ( = ?auto_5450 ?auto_5451 ) ) ( not ( = ?auto_5450 ?auto_5452 ) ) ( not ( = ?auto_5456 ?auto_5454 ) ) ( HOIST-AT ?auto_5455 ?auto_5456 ) ( not ( = ?auto_5458 ?auto_5455 ) ) ( AVAILABLE ?auto_5455 ) ( SURFACE-AT ?auto_5452 ?auto_5456 ) ( ON ?auto_5452 ?auto_5453 ) ( CLEAR ?auto_5452 ) ( not ( = ?auto_5451 ?auto_5453 ) ) ( not ( = ?auto_5452 ?auto_5453 ) ) ( not ( = ?auto_5450 ?auto_5453 ) ) ( TRUCK-AT ?auto_5457 ?auto_5454 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5451 ?auto_5452 )
      ( MAKE-2CRATE-VERIFY ?auto_5450 ?auto_5451 ?auto_5452 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5459 - SURFACE
      ?auto_5460 - SURFACE
    )
    :vars
    (
      ?auto_5464 - HOIST
      ?auto_5462 - PLACE
      ?auto_5461 - SURFACE
      ?auto_5463 - PLACE
      ?auto_5465 - HOIST
      ?auto_5467 - SURFACE
      ?auto_5466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5464 ?auto_5462 ) ( IS-CRATE ?auto_5460 ) ( not ( = ?auto_5459 ?auto_5460 ) ) ( not ( = ?auto_5461 ?auto_5459 ) ) ( not ( = ?auto_5461 ?auto_5460 ) ) ( not ( = ?auto_5463 ?auto_5462 ) ) ( HOIST-AT ?auto_5465 ?auto_5463 ) ( not ( = ?auto_5464 ?auto_5465 ) ) ( AVAILABLE ?auto_5465 ) ( SURFACE-AT ?auto_5460 ?auto_5463 ) ( ON ?auto_5460 ?auto_5467 ) ( CLEAR ?auto_5460 ) ( not ( = ?auto_5459 ?auto_5467 ) ) ( not ( = ?auto_5460 ?auto_5467 ) ) ( not ( = ?auto_5461 ?auto_5467 ) ) ( TRUCK-AT ?auto_5466 ?auto_5462 ) ( SURFACE-AT ?auto_5461 ?auto_5462 ) ( CLEAR ?auto_5461 ) ( LIFTING ?auto_5464 ?auto_5459 ) ( IS-CRATE ?auto_5459 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5461 ?auto_5459 )
      ( MAKE-2CRATE ?auto_5461 ?auto_5459 ?auto_5460 )
      ( MAKE-1CRATE-VERIFY ?auto_5459 ?auto_5460 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5468 - SURFACE
      ?auto_5469 - SURFACE
      ?auto_5470 - SURFACE
    )
    :vars
    (
      ?auto_5475 - HOIST
      ?auto_5472 - PLACE
      ?auto_5476 - PLACE
      ?auto_5474 - HOIST
      ?auto_5471 - SURFACE
      ?auto_5473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5475 ?auto_5472 ) ( IS-CRATE ?auto_5470 ) ( not ( = ?auto_5469 ?auto_5470 ) ) ( not ( = ?auto_5468 ?auto_5469 ) ) ( not ( = ?auto_5468 ?auto_5470 ) ) ( not ( = ?auto_5476 ?auto_5472 ) ) ( HOIST-AT ?auto_5474 ?auto_5476 ) ( not ( = ?auto_5475 ?auto_5474 ) ) ( AVAILABLE ?auto_5474 ) ( SURFACE-AT ?auto_5470 ?auto_5476 ) ( ON ?auto_5470 ?auto_5471 ) ( CLEAR ?auto_5470 ) ( not ( = ?auto_5469 ?auto_5471 ) ) ( not ( = ?auto_5470 ?auto_5471 ) ) ( not ( = ?auto_5468 ?auto_5471 ) ) ( TRUCK-AT ?auto_5473 ?auto_5472 ) ( SURFACE-AT ?auto_5468 ?auto_5472 ) ( CLEAR ?auto_5468 ) ( LIFTING ?auto_5475 ?auto_5469 ) ( IS-CRATE ?auto_5469 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5469 ?auto_5470 )
      ( MAKE-2CRATE-VERIFY ?auto_5468 ?auto_5469 ?auto_5470 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5477 - SURFACE
      ?auto_5478 - SURFACE
    )
    :vars
    (
      ?auto_5480 - HOIST
      ?auto_5479 - PLACE
      ?auto_5485 - SURFACE
      ?auto_5481 - PLACE
      ?auto_5482 - HOIST
      ?auto_5483 - SURFACE
      ?auto_5484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5480 ?auto_5479 ) ( IS-CRATE ?auto_5478 ) ( not ( = ?auto_5477 ?auto_5478 ) ) ( not ( = ?auto_5485 ?auto_5477 ) ) ( not ( = ?auto_5485 ?auto_5478 ) ) ( not ( = ?auto_5481 ?auto_5479 ) ) ( HOIST-AT ?auto_5482 ?auto_5481 ) ( not ( = ?auto_5480 ?auto_5482 ) ) ( AVAILABLE ?auto_5482 ) ( SURFACE-AT ?auto_5478 ?auto_5481 ) ( ON ?auto_5478 ?auto_5483 ) ( CLEAR ?auto_5478 ) ( not ( = ?auto_5477 ?auto_5483 ) ) ( not ( = ?auto_5478 ?auto_5483 ) ) ( not ( = ?auto_5485 ?auto_5483 ) ) ( TRUCK-AT ?auto_5484 ?auto_5479 ) ( SURFACE-AT ?auto_5485 ?auto_5479 ) ( CLEAR ?auto_5485 ) ( IS-CRATE ?auto_5477 ) ( AVAILABLE ?auto_5480 ) ( IN ?auto_5477 ?auto_5484 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5480 ?auto_5477 ?auto_5484 ?auto_5479 )
      ( MAKE-2CRATE ?auto_5485 ?auto_5477 ?auto_5478 )
      ( MAKE-1CRATE-VERIFY ?auto_5477 ?auto_5478 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5486 - SURFACE
      ?auto_5487 - SURFACE
      ?auto_5488 - SURFACE
    )
    :vars
    (
      ?auto_5492 - HOIST
      ?auto_5489 - PLACE
      ?auto_5490 - PLACE
      ?auto_5494 - HOIST
      ?auto_5491 - SURFACE
      ?auto_5493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5492 ?auto_5489 ) ( IS-CRATE ?auto_5488 ) ( not ( = ?auto_5487 ?auto_5488 ) ) ( not ( = ?auto_5486 ?auto_5487 ) ) ( not ( = ?auto_5486 ?auto_5488 ) ) ( not ( = ?auto_5490 ?auto_5489 ) ) ( HOIST-AT ?auto_5494 ?auto_5490 ) ( not ( = ?auto_5492 ?auto_5494 ) ) ( AVAILABLE ?auto_5494 ) ( SURFACE-AT ?auto_5488 ?auto_5490 ) ( ON ?auto_5488 ?auto_5491 ) ( CLEAR ?auto_5488 ) ( not ( = ?auto_5487 ?auto_5491 ) ) ( not ( = ?auto_5488 ?auto_5491 ) ) ( not ( = ?auto_5486 ?auto_5491 ) ) ( TRUCK-AT ?auto_5493 ?auto_5489 ) ( SURFACE-AT ?auto_5486 ?auto_5489 ) ( CLEAR ?auto_5486 ) ( IS-CRATE ?auto_5487 ) ( AVAILABLE ?auto_5492 ) ( IN ?auto_5487 ?auto_5493 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5487 ?auto_5488 )
      ( MAKE-2CRATE-VERIFY ?auto_5486 ?auto_5487 ?auto_5488 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5495 - SURFACE
      ?auto_5496 - SURFACE
    )
    :vars
    (
      ?auto_5499 - HOIST
      ?auto_5502 - PLACE
      ?auto_5500 - SURFACE
      ?auto_5501 - PLACE
      ?auto_5498 - HOIST
      ?auto_5497 - SURFACE
      ?auto_5503 - TRUCK
      ?auto_5504 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5499 ?auto_5502 ) ( IS-CRATE ?auto_5496 ) ( not ( = ?auto_5495 ?auto_5496 ) ) ( not ( = ?auto_5500 ?auto_5495 ) ) ( not ( = ?auto_5500 ?auto_5496 ) ) ( not ( = ?auto_5501 ?auto_5502 ) ) ( HOIST-AT ?auto_5498 ?auto_5501 ) ( not ( = ?auto_5499 ?auto_5498 ) ) ( AVAILABLE ?auto_5498 ) ( SURFACE-AT ?auto_5496 ?auto_5501 ) ( ON ?auto_5496 ?auto_5497 ) ( CLEAR ?auto_5496 ) ( not ( = ?auto_5495 ?auto_5497 ) ) ( not ( = ?auto_5496 ?auto_5497 ) ) ( not ( = ?auto_5500 ?auto_5497 ) ) ( SURFACE-AT ?auto_5500 ?auto_5502 ) ( CLEAR ?auto_5500 ) ( IS-CRATE ?auto_5495 ) ( AVAILABLE ?auto_5499 ) ( IN ?auto_5495 ?auto_5503 ) ( TRUCK-AT ?auto_5503 ?auto_5504 ) ( not ( = ?auto_5504 ?auto_5502 ) ) ( not ( = ?auto_5501 ?auto_5504 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5503 ?auto_5504 ?auto_5502 )
      ( MAKE-2CRATE ?auto_5500 ?auto_5495 ?auto_5496 )
      ( MAKE-1CRATE-VERIFY ?auto_5495 ?auto_5496 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5505 - SURFACE
      ?auto_5506 - SURFACE
      ?auto_5507 - SURFACE
    )
    :vars
    (
      ?auto_5509 - HOIST
      ?auto_5513 - PLACE
      ?auto_5510 - PLACE
      ?auto_5512 - HOIST
      ?auto_5514 - SURFACE
      ?auto_5508 - TRUCK
      ?auto_5511 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5509 ?auto_5513 ) ( IS-CRATE ?auto_5507 ) ( not ( = ?auto_5506 ?auto_5507 ) ) ( not ( = ?auto_5505 ?auto_5506 ) ) ( not ( = ?auto_5505 ?auto_5507 ) ) ( not ( = ?auto_5510 ?auto_5513 ) ) ( HOIST-AT ?auto_5512 ?auto_5510 ) ( not ( = ?auto_5509 ?auto_5512 ) ) ( AVAILABLE ?auto_5512 ) ( SURFACE-AT ?auto_5507 ?auto_5510 ) ( ON ?auto_5507 ?auto_5514 ) ( CLEAR ?auto_5507 ) ( not ( = ?auto_5506 ?auto_5514 ) ) ( not ( = ?auto_5507 ?auto_5514 ) ) ( not ( = ?auto_5505 ?auto_5514 ) ) ( SURFACE-AT ?auto_5505 ?auto_5513 ) ( CLEAR ?auto_5505 ) ( IS-CRATE ?auto_5506 ) ( AVAILABLE ?auto_5509 ) ( IN ?auto_5506 ?auto_5508 ) ( TRUCK-AT ?auto_5508 ?auto_5511 ) ( not ( = ?auto_5511 ?auto_5513 ) ) ( not ( = ?auto_5510 ?auto_5511 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5506 ?auto_5507 )
      ( MAKE-2CRATE-VERIFY ?auto_5505 ?auto_5506 ?auto_5507 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5515 - SURFACE
      ?auto_5516 - SURFACE
    )
    :vars
    (
      ?auto_5522 - HOIST
      ?auto_5521 - PLACE
      ?auto_5524 - SURFACE
      ?auto_5519 - PLACE
      ?auto_5517 - HOIST
      ?auto_5523 - SURFACE
      ?auto_5518 - TRUCK
      ?auto_5520 - PLACE
      ?auto_5525 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5522 ?auto_5521 ) ( IS-CRATE ?auto_5516 ) ( not ( = ?auto_5515 ?auto_5516 ) ) ( not ( = ?auto_5524 ?auto_5515 ) ) ( not ( = ?auto_5524 ?auto_5516 ) ) ( not ( = ?auto_5519 ?auto_5521 ) ) ( HOIST-AT ?auto_5517 ?auto_5519 ) ( not ( = ?auto_5522 ?auto_5517 ) ) ( AVAILABLE ?auto_5517 ) ( SURFACE-AT ?auto_5516 ?auto_5519 ) ( ON ?auto_5516 ?auto_5523 ) ( CLEAR ?auto_5516 ) ( not ( = ?auto_5515 ?auto_5523 ) ) ( not ( = ?auto_5516 ?auto_5523 ) ) ( not ( = ?auto_5524 ?auto_5523 ) ) ( SURFACE-AT ?auto_5524 ?auto_5521 ) ( CLEAR ?auto_5524 ) ( IS-CRATE ?auto_5515 ) ( AVAILABLE ?auto_5522 ) ( TRUCK-AT ?auto_5518 ?auto_5520 ) ( not ( = ?auto_5520 ?auto_5521 ) ) ( not ( = ?auto_5519 ?auto_5520 ) ) ( HOIST-AT ?auto_5525 ?auto_5520 ) ( LIFTING ?auto_5525 ?auto_5515 ) ( not ( = ?auto_5522 ?auto_5525 ) ) ( not ( = ?auto_5517 ?auto_5525 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5525 ?auto_5515 ?auto_5518 ?auto_5520 )
      ( MAKE-2CRATE ?auto_5524 ?auto_5515 ?auto_5516 )
      ( MAKE-1CRATE-VERIFY ?auto_5515 ?auto_5516 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5526 - SURFACE
      ?auto_5527 - SURFACE
      ?auto_5528 - SURFACE
    )
    :vars
    (
      ?auto_5533 - HOIST
      ?auto_5531 - PLACE
      ?auto_5534 - PLACE
      ?auto_5532 - HOIST
      ?auto_5530 - SURFACE
      ?auto_5535 - TRUCK
      ?auto_5529 - PLACE
      ?auto_5536 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5533 ?auto_5531 ) ( IS-CRATE ?auto_5528 ) ( not ( = ?auto_5527 ?auto_5528 ) ) ( not ( = ?auto_5526 ?auto_5527 ) ) ( not ( = ?auto_5526 ?auto_5528 ) ) ( not ( = ?auto_5534 ?auto_5531 ) ) ( HOIST-AT ?auto_5532 ?auto_5534 ) ( not ( = ?auto_5533 ?auto_5532 ) ) ( AVAILABLE ?auto_5532 ) ( SURFACE-AT ?auto_5528 ?auto_5534 ) ( ON ?auto_5528 ?auto_5530 ) ( CLEAR ?auto_5528 ) ( not ( = ?auto_5527 ?auto_5530 ) ) ( not ( = ?auto_5528 ?auto_5530 ) ) ( not ( = ?auto_5526 ?auto_5530 ) ) ( SURFACE-AT ?auto_5526 ?auto_5531 ) ( CLEAR ?auto_5526 ) ( IS-CRATE ?auto_5527 ) ( AVAILABLE ?auto_5533 ) ( TRUCK-AT ?auto_5535 ?auto_5529 ) ( not ( = ?auto_5529 ?auto_5531 ) ) ( not ( = ?auto_5534 ?auto_5529 ) ) ( HOIST-AT ?auto_5536 ?auto_5529 ) ( LIFTING ?auto_5536 ?auto_5527 ) ( not ( = ?auto_5533 ?auto_5536 ) ) ( not ( = ?auto_5532 ?auto_5536 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5527 ?auto_5528 )
      ( MAKE-2CRATE-VERIFY ?auto_5526 ?auto_5527 ?auto_5528 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5537 - SURFACE
      ?auto_5538 - SURFACE
    )
    :vars
    (
      ?auto_5541 - HOIST
      ?auto_5544 - PLACE
      ?auto_5546 - SURFACE
      ?auto_5539 - PLACE
      ?auto_5540 - HOIST
      ?auto_5545 - SURFACE
      ?auto_5542 - TRUCK
      ?auto_5547 - PLACE
      ?auto_5543 - HOIST
      ?auto_5548 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5541 ?auto_5544 ) ( IS-CRATE ?auto_5538 ) ( not ( = ?auto_5537 ?auto_5538 ) ) ( not ( = ?auto_5546 ?auto_5537 ) ) ( not ( = ?auto_5546 ?auto_5538 ) ) ( not ( = ?auto_5539 ?auto_5544 ) ) ( HOIST-AT ?auto_5540 ?auto_5539 ) ( not ( = ?auto_5541 ?auto_5540 ) ) ( AVAILABLE ?auto_5540 ) ( SURFACE-AT ?auto_5538 ?auto_5539 ) ( ON ?auto_5538 ?auto_5545 ) ( CLEAR ?auto_5538 ) ( not ( = ?auto_5537 ?auto_5545 ) ) ( not ( = ?auto_5538 ?auto_5545 ) ) ( not ( = ?auto_5546 ?auto_5545 ) ) ( SURFACE-AT ?auto_5546 ?auto_5544 ) ( CLEAR ?auto_5546 ) ( IS-CRATE ?auto_5537 ) ( AVAILABLE ?auto_5541 ) ( TRUCK-AT ?auto_5542 ?auto_5547 ) ( not ( = ?auto_5547 ?auto_5544 ) ) ( not ( = ?auto_5539 ?auto_5547 ) ) ( HOIST-AT ?auto_5543 ?auto_5547 ) ( not ( = ?auto_5541 ?auto_5543 ) ) ( not ( = ?auto_5540 ?auto_5543 ) ) ( AVAILABLE ?auto_5543 ) ( SURFACE-AT ?auto_5537 ?auto_5547 ) ( ON ?auto_5537 ?auto_5548 ) ( CLEAR ?auto_5537 ) ( not ( = ?auto_5537 ?auto_5548 ) ) ( not ( = ?auto_5538 ?auto_5548 ) ) ( not ( = ?auto_5546 ?auto_5548 ) ) ( not ( = ?auto_5545 ?auto_5548 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5543 ?auto_5537 ?auto_5548 ?auto_5547 )
      ( MAKE-2CRATE ?auto_5546 ?auto_5537 ?auto_5538 )
      ( MAKE-1CRATE-VERIFY ?auto_5537 ?auto_5538 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5549 - SURFACE
      ?auto_5550 - SURFACE
      ?auto_5551 - SURFACE
    )
    :vars
    (
      ?auto_5558 - HOIST
      ?auto_5556 - PLACE
      ?auto_5560 - PLACE
      ?auto_5554 - HOIST
      ?auto_5557 - SURFACE
      ?auto_5559 - TRUCK
      ?auto_5552 - PLACE
      ?auto_5553 - HOIST
      ?auto_5555 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5558 ?auto_5556 ) ( IS-CRATE ?auto_5551 ) ( not ( = ?auto_5550 ?auto_5551 ) ) ( not ( = ?auto_5549 ?auto_5550 ) ) ( not ( = ?auto_5549 ?auto_5551 ) ) ( not ( = ?auto_5560 ?auto_5556 ) ) ( HOIST-AT ?auto_5554 ?auto_5560 ) ( not ( = ?auto_5558 ?auto_5554 ) ) ( AVAILABLE ?auto_5554 ) ( SURFACE-AT ?auto_5551 ?auto_5560 ) ( ON ?auto_5551 ?auto_5557 ) ( CLEAR ?auto_5551 ) ( not ( = ?auto_5550 ?auto_5557 ) ) ( not ( = ?auto_5551 ?auto_5557 ) ) ( not ( = ?auto_5549 ?auto_5557 ) ) ( SURFACE-AT ?auto_5549 ?auto_5556 ) ( CLEAR ?auto_5549 ) ( IS-CRATE ?auto_5550 ) ( AVAILABLE ?auto_5558 ) ( TRUCK-AT ?auto_5559 ?auto_5552 ) ( not ( = ?auto_5552 ?auto_5556 ) ) ( not ( = ?auto_5560 ?auto_5552 ) ) ( HOIST-AT ?auto_5553 ?auto_5552 ) ( not ( = ?auto_5558 ?auto_5553 ) ) ( not ( = ?auto_5554 ?auto_5553 ) ) ( AVAILABLE ?auto_5553 ) ( SURFACE-AT ?auto_5550 ?auto_5552 ) ( ON ?auto_5550 ?auto_5555 ) ( CLEAR ?auto_5550 ) ( not ( = ?auto_5550 ?auto_5555 ) ) ( not ( = ?auto_5551 ?auto_5555 ) ) ( not ( = ?auto_5549 ?auto_5555 ) ) ( not ( = ?auto_5557 ?auto_5555 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5550 ?auto_5551 )
      ( MAKE-2CRATE-VERIFY ?auto_5549 ?auto_5550 ?auto_5551 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5561 - SURFACE
      ?auto_5562 - SURFACE
    )
    :vars
    (
      ?auto_5563 - HOIST
      ?auto_5567 - PLACE
      ?auto_5569 - SURFACE
      ?auto_5566 - PLACE
      ?auto_5571 - HOIST
      ?auto_5565 - SURFACE
      ?auto_5568 - PLACE
      ?auto_5572 - HOIST
      ?auto_5564 - SURFACE
      ?auto_5570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5563 ?auto_5567 ) ( IS-CRATE ?auto_5562 ) ( not ( = ?auto_5561 ?auto_5562 ) ) ( not ( = ?auto_5569 ?auto_5561 ) ) ( not ( = ?auto_5569 ?auto_5562 ) ) ( not ( = ?auto_5566 ?auto_5567 ) ) ( HOIST-AT ?auto_5571 ?auto_5566 ) ( not ( = ?auto_5563 ?auto_5571 ) ) ( AVAILABLE ?auto_5571 ) ( SURFACE-AT ?auto_5562 ?auto_5566 ) ( ON ?auto_5562 ?auto_5565 ) ( CLEAR ?auto_5562 ) ( not ( = ?auto_5561 ?auto_5565 ) ) ( not ( = ?auto_5562 ?auto_5565 ) ) ( not ( = ?auto_5569 ?auto_5565 ) ) ( SURFACE-AT ?auto_5569 ?auto_5567 ) ( CLEAR ?auto_5569 ) ( IS-CRATE ?auto_5561 ) ( AVAILABLE ?auto_5563 ) ( not ( = ?auto_5568 ?auto_5567 ) ) ( not ( = ?auto_5566 ?auto_5568 ) ) ( HOIST-AT ?auto_5572 ?auto_5568 ) ( not ( = ?auto_5563 ?auto_5572 ) ) ( not ( = ?auto_5571 ?auto_5572 ) ) ( AVAILABLE ?auto_5572 ) ( SURFACE-AT ?auto_5561 ?auto_5568 ) ( ON ?auto_5561 ?auto_5564 ) ( CLEAR ?auto_5561 ) ( not ( = ?auto_5561 ?auto_5564 ) ) ( not ( = ?auto_5562 ?auto_5564 ) ) ( not ( = ?auto_5569 ?auto_5564 ) ) ( not ( = ?auto_5565 ?auto_5564 ) ) ( TRUCK-AT ?auto_5570 ?auto_5567 ) )
    :subtasks
    ( ( !DRIVE ?auto_5570 ?auto_5567 ?auto_5568 )
      ( MAKE-2CRATE ?auto_5569 ?auto_5561 ?auto_5562 )
      ( MAKE-1CRATE-VERIFY ?auto_5561 ?auto_5562 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5573 - SURFACE
      ?auto_5574 - SURFACE
      ?auto_5575 - SURFACE
    )
    :vars
    (
      ?auto_5581 - HOIST
      ?auto_5584 - PLACE
      ?auto_5578 - PLACE
      ?auto_5582 - HOIST
      ?auto_5577 - SURFACE
      ?auto_5576 - PLACE
      ?auto_5579 - HOIST
      ?auto_5583 - SURFACE
      ?auto_5580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5581 ?auto_5584 ) ( IS-CRATE ?auto_5575 ) ( not ( = ?auto_5574 ?auto_5575 ) ) ( not ( = ?auto_5573 ?auto_5574 ) ) ( not ( = ?auto_5573 ?auto_5575 ) ) ( not ( = ?auto_5578 ?auto_5584 ) ) ( HOIST-AT ?auto_5582 ?auto_5578 ) ( not ( = ?auto_5581 ?auto_5582 ) ) ( AVAILABLE ?auto_5582 ) ( SURFACE-AT ?auto_5575 ?auto_5578 ) ( ON ?auto_5575 ?auto_5577 ) ( CLEAR ?auto_5575 ) ( not ( = ?auto_5574 ?auto_5577 ) ) ( not ( = ?auto_5575 ?auto_5577 ) ) ( not ( = ?auto_5573 ?auto_5577 ) ) ( SURFACE-AT ?auto_5573 ?auto_5584 ) ( CLEAR ?auto_5573 ) ( IS-CRATE ?auto_5574 ) ( AVAILABLE ?auto_5581 ) ( not ( = ?auto_5576 ?auto_5584 ) ) ( not ( = ?auto_5578 ?auto_5576 ) ) ( HOIST-AT ?auto_5579 ?auto_5576 ) ( not ( = ?auto_5581 ?auto_5579 ) ) ( not ( = ?auto_5582 ?auto_5579 ) ) ( AVAILABLE ?auto_5579 ) ( SURFACE-AT ?auto_5574 ?auto_5576 ) ( ON ?auto_5574 ?auto_5583 ) ( CLEAR ?auto_5574 ) ( not ( = ?auto_5574 ?auto_5583 ) ) ( not ( = ?auto_5575 ?auto_5583 ) ) ( not ( = ?auto_5573 ?auto_5583 ) ) ( not ( = ?auto_5577 ?auto_5583 ) ) ( TRUCK-AT ?auto_5580 ?auto_5584 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5574 ?auto_5575 )
      ( MAKE-2CRATE-VERIFY ?auto_5573 ?auto_5574 ?auto_5575 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5594 - SURFACE
      ?auto_5595 - SURFACE
    )
    :vars
    (
      ?auto_5596 - HOIST
      ?auto_5597 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5596 ?auto_5597 ) ( SURFACE-AT ?auto_5594 ?auto_5597 ) ( CLEAR ?auto_5594 ) ( LIFTING ?auto_5596 ?auto_5595 ) ( IS-CRATE ?auto_5595 ) ( not ( = ?auto_5594 ?auto_5595 ) ) )
    :subtasks
    ( ( !DROP ?auto_5596 ?auto_5595 ?auto_5594 ?auto_5597 )
      ( MAKE-1CRATE-VERIFY ?auto_5594 ?auto_5595 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5598 - SURFACE
      ?auto_5599 - SURFACE
      ?auto_5600 - SURFACE
    )
    :vars
    (
      ?auto_5602 - HOIST
      ?auto_5601 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5602 ?auto_5601 ) ( SURFACE-AT ?auto_5599 ?auto_5601 ) ( CLEAR ?auto_5599 ) ( LIFTING ?auto_5602 ?auto_5600 ) ( IS-CRATE ?auto_5600 ) ( not ( = ?auto_5599 ?auto_5600 ) ) ( ON ?auto_5599 ?auto_5598 ) ( not ( = ?auto_5598 ?auto_5599 ) ) ( not ( = ?auto_5598 ?auto_5600 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5599 ?auto_5600 )
      ( MAKE-2CRATE-VERIFY ?auto_5598 ?auto_5599 ?auto_5600 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5603 - SURFACE
      ?auto_5604 - SURFACE
      ?auto_5605 - SURFACE
      ?auto_5606 - SURFACE
    )
    :vars
    (
      ?auto_5608 - HOIST
      ?auto_5607 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5608 ?auto_5607 ) ( SURFACE-AT ?auto_5605 ?auto_5607 ) ( CLEAR ?auto_5605 ) ( LIFTING ?auto_5608 ?auto_5606 ) ( IS-CRATE ?auto_5606 ) ( not ( = ?auto_5605 ?auto_5606 ) ) ( ON ?auto_5604 ?auto_5603 ) ( ON ?auto_5605 ?auto_5604 ) ( not ( = ?auto_5603 ?auto_5604 ) ) ( not ( = ?auto_5603 ?auto_5605 ) ) ( not ( = ?auto_5603 ?auto_5606 ) ) ( not ( = ?auto_5604 ?auto_5605 ) ) ( not ( = ?auto_5604 ?auto_5606 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5605 ?auto_5606 )
      ( MAKE-3CRATE-VERIFY ?auto_5603 ?auto_5604 ?auto_5605 ?auto_5606 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5609 - SURFACE
      ?auto_5610 - SURFACE
    )
    :vars
    (
      ?auto_5612 - HOIST
      ?auto_5611 - PLACE
      ?auto_5613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5612 ?auto_5611 ) ( SURFACE-AT ?auto_5609 ?auto_5611 ) ( CLEAR ?auto_5609 ) ( IS-CRATE ?auto_5610 ) ( not ( = ?auto_5609 ?auto_5610 ) ) ( TRUCK-AT ?auto_5613 ?auto_5611 ) ( AVAILABLE ?auto_5612 ) ( IN ?auto_5610 ?auto_5613 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5612 ?auto_5610 ?auto_5613 ?auto_5611 )
      ( MAKE-1CRATE ?auto_5609 ?auto_5610 )
      ( MAKE-1CRATE-VERIFY ?auto_5609 ?auto_5610 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5614 - SURFACE
      ?auto_5615 - SURFACE
      ?auto_5616 - SURFACE
    )
    :vars
    (
      ?auto_5619 - HOIST
      ?auto_5618 - PLACE
      ?auto_5617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5619 ?auto_5618 ) ( SURFACE-AT ?auto_5615 ?auto_5618 ) ( CLEAR ?auto_5615 ) ( IS-CRATE ?auto_5616 ) ( not ( = ?auto_5615 ?auto_5616 ) ) ( TRUCK-AT ?auto_5617 ?auto_5618 ) ( AVAILABLE ?auto_5619 ) ( IN ?auto_5616 ?auto_5617 ) ( ON ?auto_5615 ?auto_5614 ) ( not ( = ?auto_5614 ?auto_5615 ) ) ( not ( = ?auto_5614 ?auto_5616 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5615 ?auto_5616 )
      ( MAKE-2CRATE-VERIFY ?auto_5614 ?auto_5615 ?auto_5616 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5620 - SURFACE
      ?auto_5621 - SURFACE
      ?auto_5622 - SURFACE
      ?auto_5623 - SURFACE
    )
    :vars
    (
      ?auto_5624 - HOIST
      ?auto_5626 - PLACE
      ?auto_5625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5624 ?auto_5626 ) ( SURFACE-AT ?auto_5622 ?auto_5626 ) ( CLEAR ?auto_5622 ) ( IS-CRATE ?auto_5623 ) ( not ( = ?auto_5622 ?auto_5623 ) ) ( TRUCK-AT ?auto_5625 ?auto_5626 ) ( AVAILABLE ?auto_5624 ) ( IN ?auto_5623 ?auto_5625 ) ( ON ?auto_5622 ?auto_5621 ) ( not ( = ?auto_5621 ?auto_5622 ) ) ( not ( = ?auto_5621 ?auto_5623 ) ) ( ON ?auto_5621 ?auto_5620 ) ( not ( = ?auto_5620 ?auto_5621 ) ) ( not ( = ?auto_5620 ?auto_5622 ) ) ( not ( = ?auto_5620 ?auto_5623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5621 ?auto_5622 ?auto_5623 )
      ( MAKE-3CRATE-VERIFY ?auto_5620 ?auto_5621 ?auto_5622 ?auto_5623 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5627 - SURFACE
      ?auto_5628 - SURFACE
    )
    :vars
    (
      ?auto_5630 - HOIST
      ?auto_5632 - PLACE
      ?auto_5631 - TRUCK
      ?auto_5629 - SURFACE
      ?auto_5633 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5630 ?auto_5632 ) ( SURFACE-AT ?auto_5627 ?auto_5632 ) ( CLEAR ?auto_5627 ) ( IS-CRATE ?auto_5628 ) ( not ( = ?auto_5627 ?auto_5628 ) ) ( AVAILABLE ?auto_5630 ) ( IN ?auto_5628 ?auto_5631 ) ( ON ?auto_5627 ?auto_5629 ) ( not ( = ?auto_5629 ?auto_5627 ) ) ( not ( = ?auto_5629 ?auto_5628 ) ) ( TRUCK-AT ?auto_5631 ?auto_5633 ) ( not ( = ?auto_5633 ?auto_5632 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5631 ?auto_5633 ?auto_5632 )
      ( MAKE-2CRATE ?auto_5629 ?auto_5627 ?auto_5628 )
      ( MAKE-1CRATE-VERIFY ?auto_5627 ?auto_5628 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5634 - SURFACE
      ?auto_5635 - SURFACE
      ?auto_5636 - SURFACE
    )
    :vars
    (
      ?auto_5640 - HOIST
      ?auto_5638 - PLACE
      ?auto_5637 - TRUCK
      ?auto_5639 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5640 ?auto_5638 ) ( SURFACE-AT ?auto_5635 ?auto_5638 ) ( CLEAR ?auto_5635 ) ( IS-CRATE ?auto_5636 ) ( not ( = ?auto_5635 ?auto_5636 ) ) ( AVAILABLE ?auto_5640 ) ( IN ?auto_5636 ?auto_5637 ) ( ON ?auto_5635 ?auto_5634 ) ( not ( = ?auto_5634 ?auto_5635 ) ) ( not ( = ?auto_5634 ?auto_5636 ) ) ( TRUCK-AT ?auto_5637 ?auto_5639 ) ( not ( = ?auto_5639 ?auto_5638 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5635 ?auto_5636 )
      ( MAKE-2CRATE-VERIFY ?auto_5634 ?auto_5635 ?auto_5636 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5641 - SURFACE
      ?auto_5642 - SURFACE
      ?auto_5643 - SURFACE
      ?auto_5644 - SURFACE
    )
    :vars
    (
      ?auto_5645 - HOIST
      ?auto_5647 - PLACE
      ?auto_5648 - TRUCK
      ?auto_5646 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5645 ?auto_5647 ) ( SURFACE-AT ?auto_5643 ?auto_5647 ) ( CLEAR ?auto_5643 ) ( IS-CRATE ?auto_5644 ) ( not ( = ?auto_5643 ?auto_5644 ) ) ( AVAILABLE ?auto_5645 ) ( IN ?auto_5644 ?auto_5648 ) ( ON ?auto_5643 ?auto_5642 ) ( not ( = ?auto_5642 ?auto_5643 ) ) ( not ( = ?auto_5642 ?auto_5644 ) ) ( TRUCK-AT ?auto_5648 ?auto_5646 ) ( not ( = ?auto_5646 ?auto_5647 ) ) ( ON ?auto_5642 ?auto_5641 ) ( not ( = ?auto_5641 ?auto_5642 ) ) ( not ( = ?auto_5641 ?auto_5643 ) ) ( not ( = ?auto_5641 ?auto_5644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5642 ?auto_5643 ?auto_5644 )
      ( MAKE-3CRATE-VERIFY ?auto_5641 ?auto_5642 ?auto_5643 ?auto_5644 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5649 - SURFACE
      ?auto_5650 - SURFACE
    )
    :vars
    (
      ?auto_5651 - HOIST
      ?auto_5653 - PLACE
      ?auto_5654 - SURFACE
      ?auto_5655 - TRUCK
      ?auto_5652 - PLACE
      ?auto_5656 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5651 ?auto_5653 ) ( SURFACE-AT ?auto_5649 ?auto_5653 ) ( CLEAR ?auto_5649 ) ( IS-CRATE ?auto_5650 ) ( not ( = ?auto_5649 ?auto_5650 ) ) ( AVAILABLE ?auto_5651 ) ( ON ?auto_5649 ?auto_5654 ) ( not ( = ?auto_5654 ?auto_5649 ) ) ( not ( = ?auto_5654 ?auto_5650 ) ) ( TRUCK-AT ?auto_5655 ?auto_5652 ) ( not ( = ?auto_5652 ?auto_5653 ) ) ( HOIST-AT ?auto_5656 ?auto_5652 ) ( LIFTING ?auto_5656 ?auto_5650 ) ( not ( = ?auto_5651 ?auto_5656 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5656 ?auto_5650 ?auto_5655 ?auto_5652 )
      ( MAKE-2CRATE ?auto_5654 ?auto_5649 ?auto_5650 )
      ( MAKE-1CRATE-VERIFY ?auto_5649 ?auto_5650 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5657 - SURFACE
      ?auto_5658 - SURFACE
      ?auto_5659 - SURFACE
    )
    :vars
    (
      ?auto_5664 - HOIST
      ?auto_5662 - PLACE
      ?auto_5663 - TRUCK
      ?auto_5661 - PLACE
      ?auto_5660 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5664 ?auto_5662 ) ( SURFACE-AT ?auto_5658 ?auto_5662 ) ( CLEAR ?auto_5658 ) ( IS-CRATE ?auto_5659 ) ( not ( = ?auto_5658 ?auto_5659 ) ) ( AVAILABLE ?auto_5664 ) ( ON ?auto_5658 ?auto_5657 ) ( not ( = ?auto_5657 ?auto_5658 ) ) ( not ( = ?auto_5657 ?auto_5659 ) ) ( TRUCK-AT ?auto_5663 ?auto_5661 ) ( not ( = ?auto_5661 ?auto_5662 ) ) ( HOIST-AT ?auto_5660 ?auto_5661 ) ( LIFTING ?auto_5660 ?auto_5659 ) ( not ( = ?auto_5664 ?auto_5660 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5658 ?auto_5659 )
      ( MAKE-2CRATE-VERIFY ?auto_5657 ?auto_5658 ?auto_5659 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5665 - SURFACE
      ?auto_5666 - SURFACE
      ?auto_5667 - SURFACE
      ?auto_5668 - SURFACE
    )
    :vars
    (
      ?auto_5669 - HOIST
      ?auto_5672 - PLACE
      ?auto_5671 - TRUCK
      ?auto_5673 - PLACE
      ?auto_5670 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5669 ?auto_5672 ) ( SURFACE-AT ?auto_5667 ?auto_5672 ) ( CLEAR ?auto_5667 ) ( IS-CRATE ?auto_5668 ) ( not ( = ?auto_5667 ?auto_5668 ) ) ( AVAILABLE ?auto_5669 ) ( ON ?auto_5667 ?auto_5666 ) ( not ( = ?auto_5666 ?auto_5667 ) ) ( not ( = ?auto_5666 ?auto_5668 ) ) ( TRUCK-AT ?auto_5671 ?auto_5673 ) ( not ( = ?auto_5673 ?auto_5672 ) ) ( HOIST-AT ?auto_5670 ?auto_5673 ) ( LIFTING ?auto_5670 ?auto_5668 ) ( not ( = ?auto_5669 ?auto_5670 ) ) ( ON ?auto_5666 ?auto_5665 ) ( not ( = ?auto_5665 ?auto_5666 ) ) ( not ( = ?auto_5665 ?auto_5667 ) ) ( not ( = ?auto_5665 ?auto_5668 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5666 ?auto_5667 ?auto_5668 )
      ( MAKE-3CRATE-VERIFY ?auto_5665 ?auto_5666 ?auto_5667 ?auto_5668 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5674 - SURFACE
      ?auto_5675 - SURFACE
    )
    :vars
    (
      ?auto_5676 - HOIST
      ?auto_5679 - PLACE
      ?auto_5680 - SURFACE
      ?auto_5678 - TRUCK
      ?auto_5681 - PLACE
      ?auto_5677 - HOIST
      ?auto_5682 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5676 ?auto_5679 ) ( SURFACE-AT ?auto_5674 ?auto_5679 ) ( CLEAR ?auto_5674 ) ( IS-CRATE ?auto_5675 ) ( not ( = ?auto_5674 ?auto_5675 ) ) ( AVAILABLE ?auto_5676 ) ( ON ?auto_5674 ?auto_5680 ) ( not ( = ?auto_5680 ?auto_5674 ) ) ( not ( = ?auto_5680 ?auto_5675 ) ) ( TRUCK-AT ?auto_5678 ?auto_5681 ) ( not ( = ?auto_5681 ?auto_5679 ) ) ( HOIST-AT ?auto_5677 ?auto_5681 ) ( not ( = ?auto_5676 ?auto_5677 ) ) ( AVAILABLE ?auto_5677 ) ( SURFACE-AT ?auto_5675 ?auto_5681 ) ( ON ?auto_5675 ?auto_5682 ) ( CLEAR ?auto_5675 ) ( not ( = ?auto_5674 ?auto_5682 ) ) ( not ( = ?auto_5675 ?auto_5682 ) ) ( not ( = ?auto_5680 ?auto_5682 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5677 ?auto_5675 ?auto_5682 ?auto_5681 )
      ( MAKE-2CRATE ?auto_5680 ?auto_5674 ?auto_5675 )
      ( MAKE-1CRATE-VERIFY ?auto_5674 ?auto_5675 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5683 - SURFACE
      ?auto_5684 - SURFACE
      ?auto_5685 - SURFACE
    )
    :vars
    (
      ?auto_5691 - HOIST
      ?auto_5687 - PLACE
      ?auto_5688 - TRUCK
      ?auto_5686 - PLACE
      ?auto_5689 - HOIST
      ?auto_5690 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5691 ?auto_5687 ) ( SURFACE-AT ?auto_5684 ?auto_5687 ) ( CLEAR ?auto_5684 ) ( IS-CRATE ?auto_5685 ) ( not ( = ?auto_5684 ?auto_5685 ) ) ( AVAILABLE ?auto_5691 ) ( ON ?auto_5684 ?auto_5683 ) ( not ( = ?auto_5683 ?auto_5684 ) ) ( not ( = ?auto_5683 ?auto_5685 ) ) ( TRUCK-AT ?auto_5688 ?auto_5686 ) ( not ( = ?auto_5686 ?auto_5687 ) ) ( HOIST-AT ?auto_5689 ?auto_5686 ) ( not ( = ?auto_5691 ?auto_5689 ) ) ( AVAILABLE ?auto_5689 ) ( SURFACE-AT ?auto_5685 ?auto_5686 ) ( ON ?auto_5685 ?auto_5690 ) ( CLEAR ?auto_5685 ) ( not ( = ?auto_5684 ?auto_5690 ) ) ( not ( = ?auto_5685 ?auto_5690 ) ) ( not ( = ?auto_5683 ?auto_5690 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5684 ?auto_5685 )
      ( MAKE-2CRATE-VERIFY ?auto_5683 ?auto_5684 ?auto_5685 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5692 - SURFACE
      ?auto_5693 - SURFACE
      ?auto_5694 - SURFACE
      ?auto_5695 - SURFACE
    )
    :vars
    (
      ?auto_5701 - HOIST
      ?auto_5697 - PLACE
      ?auto_5699 - TRUCK
      ?auto_5700 - PLACE
      ?auto_5696 - HOIST
      ?auto_5698 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5701 ?auto_5697 ) ( SURFACE-AT ?auto_5694 ?auto_5697 ) ( CLEAR ?auto_5694 ) ( IS-CRATE ?auto_5695 ) ( not ( = ?auto_5694 ?auto_5695 ) ) ( AVAILABLE ?auto_5701 ) ( ON ?auto_5694 ?auto_5693 ) ( not ( = ?auto_5693 ?auto_5694 ) ) ( not ( = ?auto_5693 ?auto_5695 ) ) ( TRUCK-AT ?auto_5699 ?auto_5700 ) ( not ( = ?auto_5700 ?auto_5697 ) ) ( HOIST-AT ?auto_5696 ?auto_5700 ) ( not ( = ?auto_5701 ?auto_5696 ) ) ( AVAILABLE ?auto_5696 ) ( SURFACE-AT ?auto_5695 ?auto_5700 ) ( ON ?auto_5695 ?auto_5698 ) ( CLEAR ?auto_5695 ) ( not ( = ?auto_5694 ?auto_5698 ) ) ( not ( = ?auto_5695 ?auto_5698 ) ) ( not ( = ?auto_5693 ?auto_5698 ) ) ( ON ?auto_5693 ?auto_5692 ) ( not ( = ?auto_5692 ?auto_5693 ) ) ( not ( = ?auto_5692 ?auto_5694 ) ) ( not ( = ?auto_5692 ?auto_5695 ) ) ( not ( = ?auto_5692 ?auto_5698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5693 ?auto_5694 ?auto_5695 )
      ( MAKE-3CRATE-VERIFY ?auto_5692 ?auto_5693 ?auto_5694 ?auto_5695 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5702 - SURFACE
      ?auto_5703 - SURFACE
    )
    :vars
    (
      ?auto_5710 - HOIST
      ?auto_5705 - PLACE
      ?auto_5709 - SURFACE
      ?auto_5708 - PLACE
      ?auto_5704 - HOIST
      ?auto_5706 - SURFACE
      ?auto_5707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5710 ?auto_5705 ) ( SURFACE-AT ?auto_5702 ?auto_5705 ) ( CLEAR ?auto_5702 ) ( IS-CRATE ?auto_5703 ) ( not ( = ?auto_5702 ?auto_5703 ) ) ( AVAILABLE ?auto_5710 ) ( ON ?auto_5702 ?auto_5709 ) ( not ( = ?auto_5709 ?auto_5702 ) ) ( not ( = ?auto_5709 ?auto_5703 ) ) ( not ( = ?auto_5708 ?auto_5705 ) ) ( HOIST-AT ?auto_5704 ?auto_5708 ) ( not ( = ?auto_5710 ?auto_5704 ) ) ( AVAILABLE ?auto_5704 ) ( SURFACE-AT ?auto_5703 ?auto_5708 ) ( ON ?auto_5703 ?auto_5706 ) ( CLEAR ?auto_5703 ) ( not ( = ?auto_5702 ?auto_5706 ) ) ( not ( = ?auto_5703 ?auto_5706 ) ) ( not ( = ?auto_5709 ?auto_5706 ) ) ( TRUCK-AT ?auto_5707 ?auto_5705 ) )
    :subtasks
    ( ( !DRIVE ?auto_5707 ?auto_5705 ?auto_5708 )
      ( MAKE-2CRATE ?auto_5709 ?auto_5702 ?auto_5703 )
      ( MAKE-1CRATE-VERIFY ?auto_5702 ?auto_5703 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5711 - SURFACE
      ?auto_5712 - SURFACE
      ?auto_5713 - SURFACE
    )
    :vars
    (
      ?auto_5714 - HOIST
      ?auto_5717 - PLACE
      ?auto_5718 - PLACE
      ?auto_5716 - HOIST
      ?auto_5719 - SURFACE
      ?auto_5715 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5714 ?auto_5717 ) ( SURFACE-AT ?auto_5712 ?auto_5717 ) ( CLEAR ?auto_5712 ) ( IS-CRATE ?auto_5713 ) ( not ( = ?auto_5712 ?auto_5713 ) ) ( AVAILABLE ?auto_5714 ) ( ON ?auto_5712 ?auto_5711 ) ( not ( = ?auto_5711 ?auto_5712 ) ) ( not ( = ?auto_5711 ?auto_5713 ) ) ( not ( = ?auto_5718 ?auto_5717 ) ) ( HOIST-AT ?auto_5716 ?auto_5718 ) ( not ( = ?auto_5714 ?auto_5716 ) ) ( AVAILABLE ?auto_5716 ) ( SURFACE-AT ?auto_5713 ?auto_5718 ) ( ON ?auto_5713 ?auto_5719 ) ( CLEAR ?auto_5713 ) ( not ( = ?auto_5712 ?auto_5719 ) ) ( not ( = ?auto_5713 ?auto_5719 ) ) ( not ( = ?auto_5711 ?auto_5719 ) ) ( TRUCK-AT ?auto_5715 ?auto_5717 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5712 ?auto_5713 )
      ( MAKE-2CRATE-VERIFY ?auto_5711 ?auto_5712 ?auto_5713 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5720 - SURFACE
      ?auto_5721 - SURFACE
      ?auto_5722 - SURFACE
      ?auto_5723 - SURFACE
    )
    :vars
    (
      ?auto_5727 - HOIST
      ?auto_5729 - PLACE
      ?auto_5725 - PLACE
      ?auto_5728 - HOIST
      ?auto_5724 - SURFACE
      ?auto_5726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5727 ?auto_5729 ) ( SURFACE-AT ?auto_5722 ?auto_5729 ) ( CLEAR ?auto_5722 ) ( IS-CRATE ?auto_5723 ) ( not ( = ?auto_5722 ?auto_5723 ) ) ( AVAILABLE ?auto_5727 ) ( ON ?auto_5722 ?auto_5721 ) ( not ( = ?auto_5721 ?auto_5722 ) ) ( not ( = ?auto_5721 ?auto_5723 ) ) ( not ( = ?auto_5725 ?auto_5729 ) ) ( HOIST-AT ?auto_5728 ?auto_5725 ) ( not ( = ?auto_5727 ?auto_5728 ) ) ( AVAILABLE ?auto_5728 ) ( SURFACE-AT ?auto_5723 ?auto_5725 ) ( ON ?auto_5723 ?auto_5724 ) ( CLEAR ?auto_5723 ) ( not ( = ?auto_5722 ?auto_5724 ) ) ( not ( = ?auto_5723 ?auto_5724 ) ) ( not ( = ?auto_5721 ?auto_5724 ) ) ( TRUCK-AT ?auto_5726 ?auto_5729 ) ( ON ?auto_5721 ?auto_5720 ) ( not ( = ?auto_5720 ?auto_5721 ) ) ( not ( = ?auto_5720 ?auto_5722 ) ) ( not ( = ?auto_5720 ?auto_5723 ) ) ( not ( = ?auto_5720 ?auto_5724 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5721 ?auto_5722 ?auto_5723 )
      ( MAKE-3CRATE-VERIFY ?auto_5720 ?auto_5721 ?auto_5722 ?auto_5723 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5730 - SURFACE
      ?auto_5731 - SURFACE
    )
    :vars
    (
      ?auto_5736 - HOIST
      ?auto_5738 - PLACE
      ?auto_5735 - SURFACE
      ?auto_5733 - PLACE
      ?auto_5737 - HOIST
      ?auto_5732 - SURFACE
      ?auto_5734 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5736 ?auto_5738 ) ( IS-CRATE ?auto_5731 ) ( not ( = ?auto_5730 ?auto_5731 ) ) ( not ( = ?auto_5735 ?auto_5730 ) ) ( not ( = ?auto_5735 ?auto_5731 ) ) ( not ( = ?auto_5733 ?auto_5738 ) ) ( HOIST-AT ?auto_5737 ?auto_5733 ) ( not ( = ?auto_5736 ?auto_5737 ) ) ( AVAILABLE ?auto_5737 ) ( SURFACE-AT ?auto_5731 ?auto_5733 ) ( ON ?auto_5731 ?auto_5732 ) ( CLEAR ?auto_5731 ) ( not ( = ?auto_5730 ?auto_5732 ) ) ( not ( = ?auto_5731 ?auto_5732 ) ) ( not ( = ?auto_5735 ?auto_5732 ) ) ( TRUCK-AT ?auto_5734 ?auto_5738 ) ( SURFACE-AT ?auto_5735 ?auto_5738 ) ( CLEAR ?auto_5735 ) ( LIFTING ?auto_5736 ?auto_5730 ) ( IS-CRATE ?auto_5730 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5735 ?auto_5730 )
      ( MAKE-2CRATE ?auto_5735 ?auto_5730 ?auto_5731 )
      ( MAKE-1CRATE-VERIFY ?auto_5730 ?auto_5731 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5739 - SURFACE
      ?auto_5740 - SURFACE
      ?auto_5741 - SURFACE
    )
    :vars
    (
      ?auto_5743 - HOIST
      ?auto_5744 - PLACE
      ?auto_5742 - PLACE
      ?auto_5747 - HOIST
      ?auto_5745 - SURFACE
      ?auto_5746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5743 ?auto_5744 ) ( IS-CRATE ?auto_5741 ) ( not ( = ?auto_5740 ?auto_5741 ) ) ( not ( = ?auto_5739 ?auto_5740 ) ) ( not ( = ?auto_5739 ?auto_5741 ) ) ( not ( = ?auto_5742 ?auto_5744 ) ) ( HOIST-AT ?auto_5747 ?auto_5742 ) ( not ( = ?auto_5743 ?auto_5747 ) ) ( AVAILABLE ?auto_5747 ) ( SURFACE-AT ?auto_5741 ?auto_5742 ) ( ON ?auto_5741 ?auto_5745 ) ( CLEAR ?auto_5741 ) ( not ( = ?auto_5740 ?auto_5745 ) ) ( not ( = ?auto_5741 ?auto_5745 ) ) ( not ( = ?auto_5739 ?auto_5745 ) ) ( TRUCK-AT ?auto_5746 ?auto_5744 ) ( SURFACE-AT ?auto_5739 ?auto_5744 ) ( CLEAR ?auto_5739 ) ( LIFTING ?auto_5743 ?auto_5740 ) ( IS-CRATE ?auto_5740 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5740 ?auto_5741 )
      ( MAKE-2CRATE-VERIFY ?auto_5739 ?auto_5740 ?auto_5741 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5748 - SURFACE
      ?auto_5749 - SURFACE
      ?auto_5750 - SURFACE
      ?auto_5751 - SURFACE
    )
    :vars
    (
      ?auto_5752 - HOIST
      ?auto_5755 - PLACE
      ?auto_5756 - PLACE
      ?auto_5757 - HOIST
      ?auto_5753 - SURFACE
      ?auto_5754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5752 ?auto_5755 ) ( IS-CRATE ?auto_5751 ) ( not ( = ?auto_5750 ?auto_5751 ) ) ( not ( = ?auto_5749 ?auto_5750 ) ) ( not ( = ?auto_5749 ?auto_5751 ) ) ( not ( = ?auto_5756 ?auto_5755 ) ) ( HOIST-AT ?auto_5757 ?auto_5756 ) ( not ( = ?auto_5752 ?auto_5757 ) ) ( AVAILABLE ?auto_5757 ) ( SURFACE-AT ?auto_5751 ?auto_5756 ) ( ON ?auto_5751 ?auto_5753 ) ( CLEAR ?auto_5751 ) ( not ( = ?auto_5750 ?auto_5753 ) ) ( not ( = ?auto_5751 ?auto_5753 ) ) ( not ( = ?auto_5749 ?auto_5753 ) ) ( TRUCK-AT ?auto_5754 ?auto_5755 ) ( SURFACE-AT ?auto_5749 ?auto_5755 ) ( CLEAR ?auto_5749 ) ( LIFTING ?auto_5752 ?auto_5750 ) ( IS-CRATE ?auto_5750 ) ( ON ?auto_5749 ?auto_5748 ) ( not ( = ?auto_5748 ?auto_5749 ) ) ( not ( = ?auto_5748 ?auto_5750 ) ) ( not ( = ?auto_5748 ?auto_5751 ) ) ( not ( = ?auto_5748 ?auto_5753 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5749 ?auto_5750 ?auto_5751 )
      ( MAKE-3CRATE-VERIFY ?auto_5748 ?auto_5749 ?auto_5750 ?auto_5751 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5758 - SURFACE
      ?auto_5759 - SURFACE
    )
    :vars
    (
      ?auto_5761 - HOIST
      ?auto_5764 - PLACE
      ?auto_5760 - SURFACE
      ?auto_5765 - PLACE
      ?auto_5766 - HOIST
      ?auto_5762 - SURFACE
      ?auto_5763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5761 ?auto_5764 ) ( IS-CRATE ?auto_5759 ) ( not ( = ?auto_5758 ?auto_5759 ) ) ( not ( = ?auto_5760 ?auto_5758 ) ) ( not ( = ?auto_5760 ?auto_5759 ) ) ( not ( = ?auto_5765 ?auto_5764 ) ) ( HOIST-AT ?auto_5766 ?auto_5765 ) ( not ( = ?auto_5761 ?auto_5766 ) ) ( AVAILABLE ?auto_5766 ) ( SURFACE-AT ?auto_5759 ?auto_5765 ) ( ON ?auto_5759 ?auto_5762 ) ( CLEAR ?auto_5759 ) ( not ( = ?auto_5758 ?auto_5762 ) ) ( not ( = ?auto_5759 ?auto_5762 ) ) ( not ( = ?auto_5760 ?auto_5762 ) ) ( TRUCK-AT ?auto_5763 ?auto_5764 ) ( SURFACE-AT ?auto_5760 ?auto_5764 ) ( CLEAR ?auto_5760 ) ( IS-CRATE ?auto_5758 ) ( AVAILABLE ?auto_5761 ) ( IN ?auto_5758 ?auto_5763 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5761 ?auto_5758 ?auto_5763 ?auto_5764 )
      ( MAKE-2CRATE ?auto_5760 ?auto_5758 ?auto_5759 )
      ( MAKE-1CRATE-VERIFY ?auto_5758 ?auto_5759 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5767 - SURFACE
      ?auto_5768 - SURFACE
      ?auto_5769 - SURFACE
    )
    :vars
    (
      ?auto_5773 - HOIST
      ?auto_5771 - PLACE
      ?auto_5775 - PLACE
      ?auto_5772 - HOIST
      ?auto_5770 - SURFACE
      ?auto_5774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5773 ?auto_5771 ) ( IS-CRATE ?auto_5769 ) ( not ( = ?auto_5768 ?auto_5769 ) ) ( not ( = ?auto_5767 ?auto_5768 ) ) ( not ( = ?auto_5767 ?auto_5769 ) ) ( not ( = ?auto_5775 ?auto_5771 ) ) ( HOIST-AT ?auto_5772 ?auto_5775 ) ( not ( = ?auto_5773 ?auto_5772 ) ) ( AVAILABLE ?auto_5772 ) ( SURFACE-AT ?auto_5769 ?auto_5775 ) ( ON ?auto_5769 ?auto_5770 ) ( CLEAR ?auto_5769 ) ( not ( = ?auto_5768 ?auto_5770 ) ) ( not ( = ?auto_5769 ?auto_5770 ) ) ( not ( = ?auto_5767 ?auto_5770 ) ) ( TRUCK-AT ?auto_5774 ?auto_5771 ) ( SURFACE-AT ?auto_5767 ?auto_5771 ) ( CLEAR ?auto_5767 ) ( IS-CRATE ?auto_5768 ) ( AVAILABLE ?auto_5773 ) ( IN ?auto_5768 ?auto_5774 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5768 ?auto_5769 )
      ( MAKE-2CRATE-VERIFY ?auto_5767 ?auto_5768 ?auto_5769 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5776 - SURFACE
      ?auto_5777 - SURFACE
      ?auto_5778 - SURFACE
      ?auto_5779 - SURFACE
    )
    :vars
    (
      ?auto_5785 - HOIST
      ?auto_5782 - PLACE
      ?auto_5784 - PLACE
      ?auto_5780 - HOIST
      ?auto_5781 - SURFACE
      ?auto_5783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5785 ?auto_5782 ) ( IS-CRATE ?auto_5779 ) ( not ( = ?auto_5778 ?auto_5779 ) ) ( not ( = ?auto_5777 ?auto_5778 ) ) ( not ( = ?auto_5777 ?auto_5779 ) ) ( not ( = ?auto_5784 ?auto_5782 ) ) ( HOIST-AT ?auto_5780 ?auto_5784 ) ( not ( = ?auto_5785 ?auto_5780 ) ) ( AVAILABLE ?auto_5780 ) ( SURFACE-AT ?auto_5779 ?auto_5784 ) ( ON ?auto_5779 ?auto_5781 ) ( CLEAR ?auto_5779 ) ( not ( = ?auto_5778 ?auto_5781 ) ) ( not ( = ?auto_5779 ?auto_5781 ) ) ( not ( = ?auto_5777 ?auto_5781 ) ) ( TRUCK-AT ?auto_5783 ?auto_5782 ) ( SURFACE-AT ?auto_5777 ?auto_5782 ) ( CLEAR ?auto_5777 ) ( IS-CRATE ?auto_5778 ) ( AVAILABLE ?auto_5785 ) ( IN ?auto_5778 ?auto_5783 ) ( ON ?auto_5777 ?auto_5776 ) ( not ( = ?auto_5776 ?auto_5777 ) ) ( not ( = ?auto_5776 ?auto_5778 ) ) ( not ( = ?auto_5776 ?auto_5779 ) ) ( not ( = ?auto_5776 ?auto_5781 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5777 ?auto_5778 ?auto_5779 )
      ( MAKE-3CRATE-VERIFY ?auto_5776 ?auto_5777 ?auto_5778 ?auto_5779 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5786 - SURFACE
      ?auto_5787 - SURFACE
    )
    :vars
    (
      ?auto_5793 - HOIST
      ?auto_5790 - PLACE
      ?auto_5794 - SURFACE
      ?auto_5792 - PLACE
      ?auto_5788 - HOIST
      ?auto_5789 - SURFACE
      ?auto_5791 - TRUCK
      ?auto_5795 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5793 ?auto_5790 ) ( IS-CRATE ?auto_5787 ) ( not ( = ?auto_5786 ?auto_5787 ) ) ( not ( = ?auto_5794 ?auto_5786 ) ) ( not ( = ?auto_5794 ?auto_5787 ) ) ( not ( = ?auto_5792 ?auto_5790 ) ) ( HOIST-AT ?auto_5788 ?auto_5792 ) ( not ( = ?auto_5793 ?auto_5788 ) ) ( AVAILABLE ?auto_5788 ) ( SURFACE-AT ?auto_5787 ?auto_5792 ) ( ON ?auto_5787 ?auto_5789 ) ( CLEAR ?auto_5787 ) ( not ( = ?auto_5786 ?auto_5789 ) ) ( not ( = ?auto_5787 ?auto_5789 ) ) ( not ( = ?auto_5794 ?auto_5789 ) ) ( SURFACE-AT ?auto_5794 ?auto_5790 ) ( CLEAR ?auto_5794 ) ( IS-CRATE ?auto_5786 ) ( AVAILABLE ?auto_5793 ) ( IN ?auto_5786 ?auto_5791 ) ( TRUCK-AT ?auto_5791 ?auto_5795 ) ( not ( = ?auto_5795 ?auto_5790 ) ) ( not ( = ?auto_5792 ?auto_5795 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5791 ?auto_5795 ?auto_5790 )
      ( MAKE-2CRATE ?auto_5794 ?auto_5786 ?auto_5787 )
      ( MAKE-1CRATE-VERIFY ?auto_5786 ?auto_5787 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5796 - SURFACE
      ?auto_5797 - SURFACE
      ?auto_5798 - SURFACE
    )
    :vars
    (
      ?auto_5799 - HOIST
      ?auto_5803 - PLACE
      ?auto_5800 - PLACE
      ?auto_5805 - HOIST
      ?auto_5801 - SURFACE
      ?auto_5804 - TRUCK
      ?auto_5802 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5799 ?auto_5803 ) ( IS-CRATE ?auto_5798 ) ( not ( = ?auto_5797 ?auto_5798 ) ) ( not ( = ?auto_5796 ?auto_5797 ) ) ( not ( = ?auto_5796 ?auto_5798 ) ) ( not ( = ?auto_5800 ?auto_5803 ) ) ( HOIST-AT ?auto_5805 ?auto_5800 ) ( not ( = ?auto_5799 ?auto_5805 ) ) ( AVAILABLE ?auto_5805 ) ( SURFACE-AT ?auto_5798 ?auto_5800 ) ( ON ?auto_5798 ?auto_5801 ) ( CLEAR ?auto_5798 ) ( not ( = ?auto_5797 ?auto_5801 ) ) ( not ( = ?auto_5798 ?auto_5801 ) ) ( not ( = ?auto_5796 ?auto_5801 ) ) ( SURFACE-AT ?auto_5796 ?auto_5803 ) ( CLEAR ?auto_5796 ) ( IS-CRATE ?auto_5797 ) ( AVAILABLE ?auto_5799 ) ( IN ?auto_5797 ?auto_5804 ) ( TRUCK-AT ?auto_5804 ?auto_5802 ) ( not ( = ?auto_5802 ?auto_5803 ) ) ( not ( = ?auto_5800 ?auto_5802 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5797 ?auto_5798 )
      ( MAKE-2CRATE-VERIFY ?auto_5796 ?auto_5797 ?auto_5798 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5806 - SURFACE
      ?auto_5807 - SURFACE
      ?auto_5808 - SURFACE
      ?auto_5809 - SURFACE
    )
    :vars
    (
      ?auto_5814 - HOIST
      ?auto_5810 - PLACE
      ?auto_5812 - PLACE
      ?auto_5815 - HOIST
      ?auto_5813 - SURFACE
      ?auto_5816 - TRUCK
      ?auto_5811 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5814 ?auto_5810 ) ( IS-CRATE ?auto_5809 ) ( not ( = ?auto_5808 ?auto_5809 ) ) ( not ( = ?auto_5807 ?auto_5808 ) ) ( not ( = ?auto_5807 ?auto_5809 ) ) ( not ( = ?auto_5812 ?auto_5810 ) ) ( HOIST-AT ?auto_5815 ?auto_5812 ) ( not ( = ?auto_5814 ?auto_5815 ) ) ( AVAILABLE ?auto_5815 ) ( SURFACE-AT ?auto_5809 ?auto_5812 ) ( ON ?auto_5809 ?auto_5813 ) ( CLEAR ?auto_5809 ) ( not ( = ?auto_5808 ?auto_5813 ) ) ( not ( = ?auto_5809 ?auto_5813 ) ) ( not ( = ?auto_5807 ?auto_5813 ) ) ( SURFACE-AT ?auto_5807 ?auto_5810 ) ( CLEAR ?auto_5807 ) ( IS-CRATE ?auto_5808 ) ( AVAILABLE ?auto_5814 ) ( IN ?auto_5808 ?auto_5816 ) ( TRUCK-AT ?auto_5816 ?auto_5811 ) ( not ( = ?auto_5811 ?auto_5810 ) ) ( not ( = ?auto_5812 ?auto_5811 ) ) ( ON ?auto_5807 ?auto_5806 ) ( not ( = ?auto_5806 ?auto_5807 ) ) ( not ( = ?auto_5806 ?auto_5808 ) ) ( not ( = ?auto_5806 ?auto_5809 ) ) ( not ( = ?auto_5806 ?auto_5813 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5807 ?auto_5808 ?auto_5809 )
      ( MAKE-3CRATE-VERIFY ?auto_5806 ?auto_5807 ?auto_5808 ?auto_5809 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5817 - SURFACE
      ?auto_5818 - SURFACE
    )
    :vars
    (
      ?auto_5824 - HOIST
      ?auto_5820 - PLACE
      ?auto_5819 - SURFACE
      ?auto_5822 - PLACE
      ?auto_5825 - HOIST
      ?auto_5823 - SURFACE
      ?auto_5826 - TRUCK
      ?auto_5821 - PLACE
      ?auto_5827 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5824 ?auto_5820 ) ( IS-CRATE ?auto_5818 ) ( not ( = ?auto_5817 ?auto_5818 ) ) ( not ( = ?auto_5819 ?auto_5817 ) ) ( not ( = ?auto_5819 ?auto_5818 ) ) ( not ( = ?auto_5822 ?auto_5820 ) ) ( HOIST-AT ?auto_5825 ?auto_5822 ) ( not ( = ?auto_5824 ?auto_5825 ) ) ( AVAILABLE ?auto_5825 ) ( SURFACE-AT ?auto_5818 ?auto_5822 ) ( ON ?auto_5818 ?auto_5823 ) ( CLEAR ?auto_5818 ) ( not ( = ?auto_5817 ?auto_5823 ) ) ( not ( = ?auto_5818 ?auto_5823 ) ) ( not ( = ?auto_5819 ?auto_5823 ) ) ( SURFACE-AT ?auto_5819 ?auto_5820 ) ( CLEAR ?auto_5819 ) ( IS-CRATE ?auto_5817 ) ( AVAILABLE ?auto_5824 ) ( TRUCK-AT ?auto_5826 ?auto_5821 ) ( not ( = ?auto_5821 ?auto_5820 ) ) ( not ( = ?auto_5822 ?auto_5821 ) ) ( HOIST-AT ?auto_5827 ?auto_5821 ) ( LIFTING ?auto_5827 ?auto_5817 ) ( not ( = ?auto_5824 ?auto_5827 ) ) ( not ( = ?auto_5825 ?auto_5827 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5827 ?auto_5817 ?auto_5826 ?auto_5821 )
      ( MAKE-2CRATE ?auto_5819 ?auto_5817 ?auto_5818 )
      ( MAKE-1CRATE-VERIFY ?auto_5817 ?auto_5818 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5828 - SURFACE
      ?auto_5829 - SURFACE
      ?auto_5830 - SURFACE
    )
    :vars
    (
      ?auto_5836 - HOIST
      ?auto_5835 - PLACE
      ?auto_5831 - PLACE
      ?auto_5832 - HOIST
      ?auto_5833 - SURFACE
      ?auto_5834 - TRUCK
      ?auto_5838 - PLACE
      ?auto_5837 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5836 ?auto_5835 ) ( IS-CRATE ?auto_5830 ) ( not ( = ?auto_5829 ?auto_5830 ) ) ( not ( = ?auto_5828 ?auto_5829 ) ) ( not ( = ?auto_5828 ?auto_5830 ) ) ( not ( = ?auto_5831 ?auto_5835 ) ) ( HOIST-AT ?auto_5832 ?auto_5831 ) ( not ( = ?auto_5836 ?auto_5832 ) ) ( AVAILABLE ?auto_5832 ) ( SURFACE-AT ?auto_5830 ?auto_5831 ) ( ON ?auto_5830 ?auto_5833 ) ( CLEAR ?auto_5830 ) ( not ( = ?auto_5829 ?auto_5833 ) ) ( not ( = ?auto_5830 ?auto_5833 ) ) ( not ( = ?auto_5828 ?auto_5833 ) ) ( SURFACE-AT ?auto_5828 ?auto_5835 ) ( CLEAR ?auto_5828 ) ( IS-CRATE ?auto_5829 ) ( AVAILABLE ?auto_5836 ) ( TRUCK-AT ?auto_5834 ?auto_5838 ) ( not ( = ?auto_5838 ?auto_5835 ) ) ( not ( = ?auto_5831 ?auto_5838 ) ) ( HOIST-AT ?auto_5837 ?auto_5838 ) ( LIFTING ?auto_5837 ?auto_5829 ) ( not ( = ?auto_5836 ?auto_5837 ) ) ( not ( = ?auto_5832 ?auto_5837 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5829 ?auto_5830 )
      ( MAKE-2CRATE-VERIFY ?auto_5828 ?auto_5829 ?auto_5830 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5839 - SURFACE
      ?auto_5840 - SURFACE
      ?auto_5841 - SURFACE
      ?auto_5842 - SURFACE
    )
    :vars
    (
      ?auto_5846 - HOIST
      ?auto_5849 - PLACE
      ?auto_5843 - PLACE
      ?auto_5844 - HOIST
      ?auto_5845 - SURFACE
      ?auto_5850 - TRUCK
      ?auto_5847 - PLACE
      ?auto_5848 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5846 ?auto_5849 ) ( IS-CRATE ?auto_5842 ) ( not ( = ?auto_5841 ?auto_5842 ) ) ( not ( = ?auto_5840 ?auto_5841 ) ) ( not ( = ?auto_5840 ?auto_5842 ) ) ( not ( = ?auto_5843 ?auto_5849 ) ) ( HOIST-AT ?auto_5844 ?auto_5843 ) ( not ( = ?auto_5846 ?auto_5844 ) ) ( AVAILABLE ?auto_5844 ) ( SURFACE-AT ?auto_5842 ?auto_5843 ) ( ON ?auto_5842 ?auto_5845 ) ( CLEAR ?auto_5842 ) ( not ( = ?auto_5841 ?auto_5845 ) ) ( not ( = ?auto_5842 ?auto_5845 ) ) ( not ( = ?auto_5840 ?auto_5845 ) ) ( SURFACE-AT ?auto_5840 ?auto_5849 ) ( CLEAR ?auto_5840 ) ( IS-CRATE ?auto_5841 ) ( AVAILABLE ?auto_5846 ) ( TRUCK-AT ?auto_5850 ?auto_5847 ) ( not ( = ?auto_5847 ?auto_5849 ) ) ( not ( = ?auto_5843 ?auto_5847 ) ) ( HOIST-AT ?auto_5848 ?auto_5847 ) ( LIFTING ?auto_5848 ?auto_5841 ) ( not ( = ?auto_5846 ?auto_5848 ) ) ( not ( = ?auto_5844 ?auto_5848 ) ) ( ON ?auto_5840 ?auto_5839 ) ( not ( = ?auto_5839 ?auto_5840 ) ) ( not ( = ?auto_5839 ?auto_5841 ) ) ( not ( = ?auto_5839 ?auto_5842 ) ) ( not ( = ?auto_5839 ?auto_5845 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5840 ?auto_5841 ?auto_5842 )
      ( MAKE-3CRATE-VERIFY ?auto_5839 ?auto_5840 ?auto_5841 ?auto_5842 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5851 - SURFACE
      ?auto_5852 - SURFACE
    )
    :vars
    (
      ?auto_5856 - HOIST
      ?auto_5859 - PLACE
      ?auto_5861 - SURFACE
      ?auto_5853 - PLACE
      ?auto_5854 - HOIST
      ?auto_5855 - SURFACE
      ?auto_5860 - TRUCK
      ?auto_5857 - PLACE
      ?auto_5858 - HOIST
      ?auto_5862 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5856 ?auto_5859 ) ( IS-CRATE ?auto_5852 ) ( not ( = ?auto_5851 ?auto_5852 ) ) ( not ( = ?auto_5861 ?auto_5851 ) ) ( not ( = ?auto_5861 ?auto_5852 ) ) ( not ( = ?auto_5853 ?auto_5859 ) ) ( HOIST-AT ?auto_5854 ?auto_5853 ) ( not ( = ?auto_5856 ?auto_5854 ) ) ( AVAILABLE ?auto_5854 ) ( SURFACE-AT ?auto_5852 ?auto_5853 ) ( ON ?auto_5852 ?auto_5855 ) ( CLEAR ?auto_5852 ) ( not ( = ?auto_5851 ?auto_5855 ) ) ( not ( = ?auto_5852 ?auto_5855 ) ) ( not ( = ?auto_5861 ?auto_5855 ) ) ( SURFACE-AT ?auto_5861 ?auto_5859 ) ( CLEAR ?auto_5861 ) ( IS-CRATE ?auto_5851 ) ( AVAILABLE ?auto_5856 ) ( TRUCK-AT ?auto_5860 ?auto_5857 ) ( not ( = ?auto_5857 ?auto_5859 ) ) ( not ( = ?auto_5853 ?auto_5857 ) ) ( HOIST-AT ?auto_5858 ?auto_5857 ) ( not ( = ?auto_5856 ?auto_5858 ) ) ( not ( = ?auto_5854 ?auto_5858 ) ) ( AVAILABLE ?auto_5858 ) ( SURFACE-AT ?auto_5851 ?auto_5857 ) ( ON ?auto_5851 ?auto_5862 ) ( CLEAR ?auto_5851 ) ( not ( = ?auto_5851 ?auto_5862 ) ) ( not ( = ?auto_5852 ?auto_5862 ) ) ( not ( = ?auto_5861 ?auto_5862 ) ) ( not ( = ?auto_5855 ?auto_5862 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5858 ?auto_5851 ?auto_5862 ?auto_5857 )
      ( MAKE-2CRATE ?auto_5861 ?auto_5851 ?auto_5852 )
      ( MAKE-1CRATE-VERIFY ?auto_5851 ?auto_5852 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5863 - SURFACE
      ?auto_5864 - SURFACE
      ?auto_5865 - SURFACE
    )
    :vars
    (
      ?auto_5871 - HOIST
      ?auto_5866 - PLACE
      ?auto_5874 - PLACE
      ?auto_5868 - HOIST
      ?auto_5872 - SURFACE
      ?auto_5867 - TRUCK
      ?auto_5870 - PLACE
      ?auto_5873 - HOIST
      ?auto_5869 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5871 ?auto_5866 ) ( IS-CRATE ?auto_5865 ) ( not ( = ?auto_5864 ?auto_5865 ) ) ( not ( = ?auto_5863 ?auto_5864 ) ) ( not ( = ?auto_5863 ?auto_5865 ) ) ( not ( = ?auto_5874 ?auto_5866 ) ) ( HOIST-AT ?auto_5868 ?auto_5874 ) ( not ( = ?auto_5871 ?auto_5868 ) ) ( AVAILABLE ?auto_5868 ) ( SURFACE-AT ?auto_5865 ?auto_5874 ) ( ON ?auto_5865 ?auto_5872 ) ( CLEAR ?auto_5865 ) ( not ( = ?auto_5864 ?auto_5872 ) ) ( not ( = ?auto_5865 ?auto_5872 ) ) ( not ( = ?auto_5863 ?auto_5872 ) ) ( SURFACE-AT ?auto_5863 ?auto_5866 ) ( CLEAR ?auto_5863 ) ( IS-CRATE ?auto_5864 ) ( AVAILABLE ?auto_5871 ) ( TRUCK-AT ?auto_5867 ?auto_5870 ) ( not ( = ?auto_5870 ?auto_5866 ) ) ( not ( = ?auto_5874 ?auto_5870 ) ) ( HOIST-AT ?auto_5873 ?auto_5870 ) ( not ( = ?auto_5871 ?auto_5873 ) ) ( not ( = ?auto_5868 ?auto_5873 ) ) ( AVAILABLE ?auto_5873 ) ( SURFACE-AT ?auto_5864 ?auto_5870 ) ( ON ?auto_5864 ?auto_5869 ) ( CLEAR ?auto_5864 ) ( not ( = ?auto_5864 ?auto_5869 ) ) ( not ( = ?auto_5865 ?auto_5869 ) ) ( not ( = ?auto_5863 ?auto_5869 ) ) ( not ( = ?auto_5872 ?auto_5869 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5864 ?auto_5865 )
      ( MAKE-2CRATE-VERIFY ?auto_5863 ?auto_5864 ?auto_5865 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5875 - SURFACE
      ?auto_5876 - SURFACE
      ?auto_5877 - SURFACE
      ?auto_5878 - SURFACE
    )
    :vars
    (
      ?auto_5884 - HOIST
      ?auto_5881 - PLACE
      ?auto_5879 - PLACE
      ?auto_5882 - HOIST
      ?auto_5886 - SURFACE
      ?auto_5880 - TRUCK
      ?auto_5887 - PLACE
      ?auto_5885 - HOIST
      ?auto_5883 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5884 ?auto_5881 ) ( IS-CRATE ?auto_5878 ) ( not ( = ?auto_5877 ?auto_5878 ) ) ( not ( = ?auto_5876 ?auto_5877 ) ) ( not ( = ?auto_5876 ?auto_5878 ) ) ( not ( = ?auto_5879 ?auto_5881 ) ) ( HOIST-AT ?auto_5882 ?auto_5879 ) ( not ( = ?auto_5884 ?auto_5882 ) ) ( AVAILABLE ?auto_5882 ) ( SURFACE-AT ?auto_5878 ?auto_5879 ) ( ON ?auto_5878 ?auto_5886 ) ( CLEAR ?auto_5878 ) ( not ( = ?auto_5877 ?auto_5886 ) ) ( not ( = ?auto_5878 ?auto_5886 ) ) ( not ( = ?auto_5876 ?auto_5886 ) ) ( SURFACE-AT ?auto_5876 ?auto_5881 ) ( CLEAR ?auto_5876 ) ( IS-CRATE ?auto_5877 ) ( AVAILABLE ?auto_5884 ) ( TRUCK-AT ?auto_5880 ?auto_5887 ) ( not ( = ?auto_5887 ?auto_5881 ) ) ( not ( = ?auto_5879 ?auto_5887 ) ) ( HOIST-AT ?auto_5885 ?auto_5887 ) ( not ( = ?auto_5884 ?auto_5885 ) ) ( not ( = ?auto_5882 ?auto_5885 ) ) ( AVAILABLE ?auto_5885 ) ( SURFACE-AT ?auto_5877 ?auto_5887 ) ( ON ?auto_5877 ?auto_5883 ) ( CLEAR ?auto_5877 ) ( not ( = ?auto_5877 ?auto_5883 ) ) ( not ( = ?auto_5878 ?auto_5883 ) ) ( not ( = ?auto_5876 ?auto_5883 ) ) ( not ( = ?auto_5886 ?auto_5883 ) ) ( ON ?auto_5876 ?auto_5875 ) ( not ( = ?auto_5875 ?auto_5876 ) ) ( not ( = ?auto_5875 ?auto_5877 ) ) ( not ( = ?auto_5875 ?auto_5878 ) ) ( not ( = ?auto_5875 ?auto_5886 ) ) ( not ( = ?auto_5875 ?auto_5883 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5876 ?auto_5877 ?auto_5878 )
      ( MAKE-3CRATE-VERIFY ?auto_5875 ?auto_5876 ?auto_5877 ?auto_5878 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5888 - SURFACE
      ?auto_5889 - SURFACE
    )
    :vars
    (
      ?auto_5895 - HOIST
      ?auto_5892 - PLACE
      ?auto_5896 - SURFACE
      ?auto_5890 - PLACE
      ?auto_5893 - HOIST
      ?auto_5898 - SURFACE
      ?auto_5899 - PLACE
      ?auto_5897 - HOIST
      ?auto_5894 - SURFACE
      ?auto_5891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5895 ?auto_5892 ) ( IS-CRATE ?auto_5889 ) ( not ( = ?auto_5888 ?auto_5889 ) ) ( not ( = ?auto_5896 ?auto_5888 ) ) ( not ( = ?auto_5896 ?auto_5889 ) ) ( not ( = ?auto_5890 ?auto_5892 ) ) ( HOIST-AT ?auto_5893 ?auto_5890 ) ( not ( = ?auto_5895 ?auto_5893 ) ) ( AVAILABLE ?auto_5893 ) ( SURFACE-AT ?auto_5889 ?auto_5890 ) ( ON ?auto_5889 ?auto_5898 ) ( CLEAR ?auto_5889 ) ( not ( = ?auto_5888 ?auto_5898 ) ) ( not ( = ?auto_5889 ?auto_5898 ) ) ( not ( = ?auto_5896 ?auto_5898 ) ) ( SURFACE-AT ?auto_5896 ?auto_5892 ) ( CLEAR ?auto_5896 ) ( IS-CRATE ?auto_5888 ) ( AVAILABLE ?auto_5895 ) ( not ( = ?auto_5899 ?auto_5892 ) ) ( not ( = ?auto_5890 ?auto_5899 ) ) ( HOIST-AT ?auto_5897 ?auto_5899 ) ( not ( = ?auto_5895 ?auto_5897 ) ) ( not ( = ?auto_5893 ?auto_5897 ) ) ( AVAILABLE ?auto_5897 ) ( SURFACE-AT ?auto_5888 ?auto_5899 ) ( ON ?auto_5888 ?auto_5894 ) ( CLEAR ?auto_5888 ) ( not ( = ?auto_5888 ?auto_5894 ) ) ( not ( = ?auto_5889 ?auto_5894 ) ) ( not ( = ?auto_5896 ?auto_5894 ) ) ( not ( = ?auto_5898 ?auto_5894 ) ) ( TRUCK-AT ?auto_5891 ?auto_5892 ) )
    :subtasks
    ( ( !DRIVE ?auto_5891 ?auto_5892 ?auto_5899 )
      ( MAKE-2CRATE ?auto_5896 ?auto_5888 ?auto_5889 )
      ( MAKE-1CRATE-VERIFY ?auto_5888 ?auto_5889 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5900 - SURFACE
      ?auto_5901 - SURFACE
      ?auto_5902 - SURFACE
    )
    :vars
    (
      ?auto_5908 - HOIST
      ?auto_5906 - PLACE
      ?auto_5911 - PLACE
      ?auto_5905 - HOIST
      ?auto_5904 - SURFACE
      ?auto_5910 - PLACE
      ?auto_5909 - HOIST
      ?auto_5907 - SURFACE
      ?auto_5903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5908 ?auto_5906 ) ( IS-CRATE ?auto_5902 ) ( not ( = ?auto_5901 ?auto_5902 ) ) ( not ( = ?auto_5900 ?auto_5901 ) ) ( not ( = ?auto_5900 ?auto_5902 ) ) ( not ( = ?auto_5911 ?auto_5906 ) ) ( HOIST-AT ?auto_5905 ?auto_5911 ) ( not ( = ?auto_5908 ?auto_5905 ) ) ( AVAILABLE ?auto_5905 ) ( SURFACE-AT ?auto_5902 ?auto_5911 ) ( ON ?auto_5902 ?auto_5904 ) ( CLEAR ?auto_5902 ) ( not ( = ?auto_5901 ?auto_5904 ) ) ( not ( = ?auto_5902 ?auto_5904 ) ) ( not ( = ?auto_5900 ?auto_5904 ) ) ( SURFACE-AT ?auto_5900 ?auto_5906 ) ( CLEAR ?auto_5900 ) ( IS-CRATE ?auto_5901 ) ( AVAILABLE ?auto_5908 ) ( not ( = ?auto_5910 ?auto_5906 ) ) ( not ( = ?auto_5911 ?auto_5910 ) ) ( HOIST-AT ?auto_5909 ?auto_5910 ) ( not ( = ?auto_5908 ?auto_5909 ) ) ( not ( = ?auto_5905 ?auto_5909 ) ) ( AVAILABLE ?auto_5909 ) ( SURFACE-AT ?auto_5901 ?auto_5910 ) ( ON ?auto_5901 ?auto_5907 ) ( CLEAR ?auto_5901 ) ( not ( = ?auto_5901 ?auto_5907 ) ) ( not ( = ?auto_5902 ?auto_5907 ) ) ( not ( = ?auto_5900 ?auto_5907 ) ) ( not ( = ?auto_5904 ?auto_5907 ) ) ( TRUCK-AT ?auto_5903 ?auto_5906 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5901 ?auto_5902 )
      ( MAKE-2CRATE-VERIFY ?auto_5900 ?auto_5901 ?auto_5902 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5912 - SURFACE
      ?auto_5913 - SURFACE
      ?auto_5914 - SURFACE
      ?auto_5915 - SURFACE
    )
    :vars
    (
      ?auto_5923 - HOIST
      ?auto_5916 - PLACE
      ?auto_5920 - PLACE
      ?auto_5922 - HOIST
      ?auto_5919 - SURFACE
      ?auto_5917 - PLACE
      ?auto_5921 - HOIST
      ?auto_5918 - SURFACE
      ?auto_5924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5923 ?auto_5916 ) ( IS-CRATE ?auto_5915 ) ( not ( = ?auto_5914 ?auto_5915 ) ) ( not ( = ?auto_5913 ?auto_5914 ) ) ( not ( = ?auto_5913 ?auto_5915 ) ) ( not ( = ?auto_5920 ?auto_5916 ) ) ( HOIST-AT ?auto_5922 ?auto_5920 ) ( not ( = ?auto_5923 ?auto_5922 ) ) ( AVAILABLE ?auto_5922 ) ( SURFACE-AT ?auto_5915 ?auto_5920 ) ( ON ?auto_5915 ?auto_5919 ) ( CLEAR ?auto_5915 ) ( not ( = ?auto_5914 ?auto_5919 ) ) ( not ( = ?auto_5915 ?auto_5919 ) ) ( not ( = ?auto_5913 ?auto_5919 ) ) ( SURFACE-AT ?auto_5913 ?auto_5916 ) ( CLEAR ?auto_5913 ) ( IS-CRATE ?auto_5914 ) ( AVAILABLE ?auto_5923 ) ( not ( = ?auto_5917 ?auto_5916 ) ) ( not ( = ?auto_5920 ?auto_5917 ) ) ( HOIST-AT ?auto_5921 ?auto_5917 ) ( not ( = ?auto_5923 ?auto_5921 ) ) ( not ( = ?auto_5922 ?auto_5921 ) ) ( AVAILABLE ?auto_5921 ) ( SURFACE-AT ?auto_5914 ?auto_5917 ) ( ON ?auto_5914 ?auto_5918 ) ( CLEAR ?auto_5914 ) ( not ( = ?auto_5914 ?auto_5918 ) ) ( not ( = ?auto_5915 ?auto_5918 ) ) ( not ( = ?auto_5913 ?auto_5918 ) ) ( not ( = ?auto_5919 ?auto_5918 ) ) ( TRUCK-AT ?auto_5924 ?auto_5916 ) ( ON ?auto_5913 ?auto_5912 ) ( not ( = ?auto_5912 ?auto_5913 ) ) ( not ( = ?auto_5912 ?auto_5914 ) ) ( not ( = ?auto_5912 ?auto_5915 ) ) ( not ( = ?auto_5912 ?auto_5919 ) ) ( not ( = ?auto_5912 ?auto_5918 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5913 ?auto_5914 ?auto_5915 )
      ( MAKE-3CRATE-VERIFY ?auto_5912 ?auto_5913 ?auto_5914 ?auto_5915 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5925 - SURFACE
      ?auto_5926 - SURFACE
    )
    :vars
    (
      ?auto_5935 - HOIST
      ?auto_5927 - PLACE
      ?auto_5928 - SURFACE
      ?auto_5932 - PLACE
      ?auto_5934 - HOIST
      ?auto_5931 - SURFACE
      ?auto_5929 - PLACE
      ?auto_5933 - HOIST
      ?auto_5930 - SURFACE
      ?auto_5936 - TRUCK
      ?auto_5937 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5935 ?auto_5927 ) ( IS-CRATE ?auto_5926 ) ( not ( = ?auto_5925 ?auto_5926 ) ) ( not ( = ?auto_5928 ?auto_5925 ) ) ( not ( = ?auto_5928 ?auto_5926 ) ) ( not ( = ?auto_5932 ?auto_5927 ) ) ( HOIST-AT ?auto_5934 ?auto_5932 ) ( not ( = ?auto_5935 ?auto_5934 ) ) ( AVAILABLE ?auto_5934 ) ( SURFACE-AT ?auto_5926 ?auto_5932 ) ( ON ?auto_5926 ?auto_5931 ) ( CLEAR ?auto_5926 ) ( not ( = ?auto_5925 ?auto_5931 ) ) ( not ( = ?auto_5926 ?auto_5931 ) ) ( not ( = ?auto_5928 ?auto_5931 ) ) ( IS-CRATE ?auto_5925 ) ( not ( = ?auto_5929 ?auto_5927 ) ) ( not ( = ?auto_5932 ?auto_5929 ) ) ( HOIST-AT ?auto_5933 ?auto_5929 ) ( not ( = ?auto_5935 ?auto_5933 ) ) ( not ( = ?auto_5934 ?auto_5933 ) ) ( AVAILABLE ?auto_5933 ) ( SURFACE-AT ?auto_5925 ?auto_5929 ) ( ON ?auto_5925 ?auto_5930 ) ( CLEAR ?auto_5925 ) ( not ( = ?auto_5925 ?auto_5930 ) ) ( not ( = ?auto_5926 ?auto_5930 ) ) ( not ( = ?auto_5928 ?auto_5930 ) ) ( not ( = ?auto_5931 ?auto_5930 ) ) ( TRUCK-AT ?auto_5936 ?auto_5927 ) ( SURFACE-AT ?auto_5937 ?auto_5927 ) ( CLEAR ?auto_5937 ) ( LIFTING ?auto_5935 ?auto_5928 ) ( IS-CRATE ?auto_5928 ) ( not ( = ?auto_5937 ?auto_5928 ) ) ( not ( = ?auto_5925 ?auto_5937 ) ) ( not ( = ?auto_5926 ?auto_5937 ) ) ( not ( = ?auto_5931 ?auto_5937 ) ) ( not ( = ?auto_5930 ?auto_5937 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5937 ?auto_5928 )
      ( MAKE-2CRATE ?auto_5928 ?auto_5925 ?auto_5926 )
      ( MAKE-1CRATE-VERIFY ?auto_5925 ?auto_5926 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5938 - SURFACE
      ?auto_5939 - SURFACE
      ?auto_5940 - SURFACE
    )
    :vars
    (
      ?auto_5949 - HOIST
      ?auto_5947 - PLACE
      ?auto_5945 - PLACE
      ?auto_5942 - HOIST
      ?auto_5950 - SURFACE
      ?auto_5941 - PLACE
      ?auto_5946 - HOIST
      ?auto_5944 - SURFACE
      ?auto_5948 - TRUCK
      ?auto_5943 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5949 ?auto_5947 ) ( IS-CRATE ?auto_5940 ) ( not ( = ?auto_5939 ?auto_5940 ) ) ( not ( = ?auto_5938 ?auto_5939 ) ) ( not ( = ?auto_5938 ?auto_5940 ) ) ( not ( = ?auto_5945 ?auto_5947 ) ) ( HOIST-AT ?auto_5942 ?auto_5945 ) ( not ( = ?auto_5949 ?auto_5942 ) ) ( AVAILABLE ?auto_5942 ) ( SURFACE-AT ?auto_5940 ?auto_5945 ) ( ON ?auto_5940 ?auto_5950 ) ( CLEAR ?auto_5940 ) ( not ( = ?auto_5939 ?auto_5950 ) ) ( not ( = ?auto_5940 ?auto_5950 ) ) ( not ( = ?auto_5938 ?auto_5950 ) ) ( IS-CRATE ?auto_5939 ) ( not ( = ?auto_5941 ?auto_5947 ) ) ( not ( = ?auto_5945 ?auto_5941 ) ) ( HOIST-AT ?auto_5946 ?auto_5941 ) ( not ( = ?auto_5949 ?auto_5946 ) ) ( not ( = ?auto_5942 ?auto_5946 ) ) ( AVAILABLE ?auto_5946 ) ( SURFACE-AT ?auto_5939 ?auto_5941 ) ( ON ?auto_5939 ?auto_5944 ) ( CLEAR ?auto_5939 ) ( not ( = ?auto_5939 ?auto_5944 ) ) ( not ( = ?auto_5940 ?auto_5944 ) ) ( not ( = ?auto_5938 ?auto_5944 ) ) ( not ( = ?auto_5950 ?auto_5944 ) ) ( TRUCK-AT ?auto_5948 ?auto_5947 ) ( SURFACE-AT ?auto_5943 ?auto_5947 ) ( CLEAR ?auto_5943 ) ( LIFTING ?auto_5949 ?auto_5938 ) ( IS-CRATE ?auto_5938 ) ( not ( = ?auto_5943 ?auto_5938 ) ) ( not ( = ?auto_5939 ?auto_5943 ) ) ( not ( = ?auto_5940 ?auto_5943 ) ) ( not ( = ?auto_5950 ?auto_5943 ) ) ( not ( = ?auto_5944 ?auto_5943 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5939 ?auto_5940 )
      ( MAKE-2CRATE-VERIFY ?auto_5938 ?auto_5939 ?auto_5940 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5951 - SURFACE
      ?auto_5952 - SURFACE
      ?auto_5953 - SURFACE
      ?auto_5954 - SURFACE
    )
    :vars
    (
      ?auto_5956 - HOIST
      ?auto_5957 - PLACE
      ?auto_5962 - PLACE
      ?auto_5963 - HOIST
      ?auto_5958 - SURFACE
      ?auto_5955 - PLACE
      ?auto_5961 - HOIST
      ?auto_5959 - SURFACE
      ?auto_5960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5956 ?auto_5957 ) ( IS-CRATE ?auto_5954 ) ( not ( = ?auto_5953 ?auto_5954 ) ) ( not ( = ?auto_5952 ?auto_5953 ) ) ( not ( = ?auto_5952 ?auto_5954 ) ) ( not ( = ?auto_5962 ?auto_5957 ) ) ( HOIST-AT ?auto_5963 ?auto_5962 ) ( not ( = ?auto_5956 ?auto_5963 ) ) ( AVAILABLE ?auto_5963 ) ( SURFACE-AT ?auto_5954 ?auto_5962 ) ( ON ?auto_5954 ?auto_5958 ) ( CLEAR ?auto_5954 ) ( not ( = ?auto_5953 ?auto_5958 ) ) ( not ( = ?auto_5954 ?auto_5958 ) ) ( not ( = ?auto_5952 ?auto_5958 ) ) ( IS-CRATE ?auto_5953 ) ( not ( = ?auto_5955 ?auto_5957 ) ) ( not ( = ?auto_5962 ?auto_5955 ) ) ( HOIST-AT ?auto_5961 ?auto_5955 ) ( not ( = ?auto_5956 ?auto_5961 ) ) ( not ( = ?auto_5963 ?auto_5961 ) ) ( AVAILABLE ?auto_5961 ) ( SURFACE-AT ?auto_5953 ?auto_5955 ) ( ON ?auto_5953 ?auto_5959 ) ( CLEAR ?auto_5953 ) ( not ( = ?auto_5953 ?auto_5959 ) ) ( not ( = ?auto_5954 ?auto_5959 ) ) ( not ( = ?auto_5952 ?auto_5959 ) ) ( not ( = ?auto_5958 ?auto_5959 ) ) ( TRUCK-AT ?auto_5960 ?auto_5957 ) ( SURFACE-AT ?auto_5951 ?auto_5957 ) ( CLEAR ?auto_5951 ) ( LIFTING ?auto_5956 ?auto_5952 ) ( IS-CRATE ?auto_5952 ) ( not ( = ?auto_5951 ?auto_5952 ) ) ( not ( = ?auto_5953 ?auto_5951 ) ) ( not ( = ?auto_5954 ?auto_5951 ) ) ( not ( = ?auto_5958 ?auto_5951 ) ) ( not ( = ?auto_5959 ?auto_5951 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5952 ?auto_5953 ?auto_5954 )
      ( MAKE-3CRATE-VERIFY ?auto_5951 ?auto_5952 ?auto_5953 ?auto_5954 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5964 - SURFACE
      ?auto_5965 - SURFACE
    )
    :vars
    (
      ?auto_5967 - HOIST
      ?auto_5969 - PLACE
      ?auto_5976 - SURFACE
      ?auto_5974 - PLACE
      ?auto_5975 - HOIST
      ?auto_5970 - SURFACE
      ?auto_5966 - PLACE
      ?auto_5973 - HOIST
      ?auto_5971 - SURFACE
      ?auto_5972 - TRUCK
      ?auto_5968 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5967 ?auto_5969 ) ( IS-CRATE ?auto_5965 ) ( not ( = ?auto_5964 ?auto_5965 ) ) ( not ( = ?auto_5976 ?auto_5964 ) ) ( not ( = ?auto_5976 ?auto_5965 ) ) ( not ( = ?auto_5974 ?auto_5969 ) ) ( HOIST-AT ?auto_5975 ?auto_5974 ) ( not ( = ?auto_5967 ?auto_5975 ) ) ( AVAILABLE ?auto_5975 ) ( SURFACE-AT ?auto_5965 ?auto_5974 ) ( ON ?auto_5965 ?auto_5970 ) ( CLEAR ?auto_5965 ) ( not ( = ?auto_5964 ?auto_5970 ) ) ( not ( = ?auto_5965 ?auto_5970 ) ) ( not ( = ?auto_5976 ?auto_5970 ) ) ( IS-CRATE ?auto_5964 ) ( not ( = ?auto_5966 ?auto_5969 ) ) ( not ( = ?auto_5974 ?auto_5966 ) ) ( HOIST-AT ?auto_5973 ?auto_5966 ) ( not ( = ?auto_5967 ?auto_5973 ) ) ( not ( = ?auto_5975 ?auto_5973 ) ) ( AVAILABLE ?auto_5973 ) ( SURFACE-AT ?auto_5964 ?auto_5966 ) ( ON ?auto_5964 ?auto_5971 ) ( CLEAR ?auto_5964 ) ( not ( = ?auto_5964 ?auto_5971 ) ) ( not ( = ?auto_5965 ?auto_5971 ) ) ( not ( = ?auto_5976 ?auto_5971 ) ) ( not ( = ?auto_5970 ?auto_5971 ) ) ( TRUCK-AT ?auto_5972 ?auto_5969 ) ( SURFACE-AT ?auto_5968 ?auto_5969 ) ( CLEAR ?auto_5968 ) ( IS-CRATE ?auto_5976 ) ( not ( = ?auto_5968 ?auto_5976 ) ) ( not ( = ?auto_5964 ?auto_5968 ) ) ( not ( = ?auto_5965 ?auto_5968 ) ) ( not ( = ?auto_5970 ?auto_5968 ) ) ( not ( = ?auto_5971 ?auto_5968 ) ) ( AVAILABLE ?auto_5967 ) ( IN ?auto_5976 ?auto_5972 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5967 ?auto_5976 ?auto_5972 ?auto_5969 )
      ( MAKE-2CRATE ?auto_5976 ?auto_5964 ?auto_5965 )
      ( MAKE-1CRATE-VERIFY ?auto_5964 ?auto_5965 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5977 - SURFACE
      ?auto_5978 - SURFACE
      ?auto_5979 - SURFACE
    )
    :vars
    (
      ?auto_5986 - HOIST
      ?auto_5984 - PLACE
      ?auto_5988 - PLACE
      ?auto_5987 - HOIST
      ?auto_5981 - SURFACE
      ?auto_5985 - PLACE
      ?auto_5980 - HOIST
      ?auto_5982 - SURFACE
      ?auto_5983 - TRUCK
      ?auto_5989 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5986 ?auto_5984 ) ( IS-CRATE ?auto_5979 ) ( not ( = ?auto_5978 ?auto_5979 ) ) ( not ( = ?auto_5977 ?auto_5978 ) ) ( not ( = ?auto_5977 ?auto_5979 ) ) ( not ( = ?auto_5988 ?auto_5984 ) ) ( HOIST-AT ?auto_5987 ?auto_5988 ) ( not ( = ?auto_5986 ?auto_5987 ) ) ( AVAILABLE ?auto_5987 ) ( SURFACE-AT ?auto_5979 ?auto_5988 ) ( ON ?auto_5979 ?auto_5981 ) ( CLEAR ?auto_5979 ) ( not ( = ?auto_5978 ?auto_5981 ) ) ( not ( = ?auto_5979 ?auto_5981 ) ) ( not ( = ?auto_5977 ?auto_5981 ) ) ( IS-CRATE ?auto_5978 ) ( not ( = ?auto_5985 ?auto_5984 ) ) ( not ( = ?auto_5988 ?auto_5985 ) ) ( HOIST-AT ?auto_5980 ?auto_5985 ) ( not ( = ?auto_5986 ?auto_5980 ) ) ( not ( = ?auto_5987 ?auto_5980 ) ) ( AVAILABLE ?auto_5980 ) ( SURFACE-AT ?auto_5978 ?auto_5985 ) ( ON ?auto_5978 ?auto_5982 ) ( CLEAR ?auto_5978 ) ( not ( = ?auto_5978 ?auto_5982 ) ) ( not ( = ?auto_5979 ?auto_5982 ) ) ( not ( = ?auto_5977 ?auto_5982 ) ) ( not ( = ?auto_5981 ?auto_5982 ) ) ( TRUCK-AT ?auto_5983 ?auto_5984 ) ( SURFACE-AT ?auto_5989 ?auto_5984 ) ( CLEAR ?auto_5989 ) ( IS-CRATE ?auto_5977 ) ( not ( = ?auto_5989 ?auto_5977 ) ) ( not ( = ?auto_5978 ?auto_5989 ) ) ( not ( = ?auto_5979 ?auto_5989 ) ) ( not ( = ?auto_5981 ?auto_5989 ) ) ( not ( = ?auto_5982 ?auto_5989 ) ) ( AVAILABLE ?auto_5986 ) ( IN ?auto_5977 ?auto_5983 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5978 ?auto_5979 )
      ( MAKE-2CRATE-VERIFY ?auto_5977 ?auto_5978 ?auto_5979 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5990 - SURFACE
      ?auto_5991 - SURFACE
      ?auto_5992 - SURFACE
      ?auto_5993 - SURFACE
    )
    :vars
    (
      ?auto_6002 - HOIST
      ?auto_6000 - PLACE
      ?auto_5997 - PLACE
      ?auto_5999 - HOIST
      ?auto_5995 - SURFACE
      ?auto_5994 - PLACE
      ?auto_6001 - HOIST
      ?auto_5996 - SURFACE
      ?auto_5998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6002 ?auto_6000 ) ( IS-CRATE ?auto_5993 ) ( not ( = ?auto_5992 ?auto_5993 ) ) ( not ( = ?auto_5991 ?auto_5992 ) ) ( not ( = ?auto_5991 ?auto_5993 ) ) ( not ( = ?auto_5997 ?auto_6000 ) ) ( HOIST-AT ?auto_5999 ?auto_5997 ) ( not ( = ?auto_6002 ?auto_5999 ) ) ( AVAILABLE ?auto_5999 ) ( SURFACE-AT ?auto_5993 ?auto_5997 ) ( ON ?auto_5993 ?auto_5995 ) ( CLEAR ?auto_5993 ) ( not ( = ?auto_5992 ?auto_5995 ) ) ( not ( = ?auto_5993 ?auto_5995 ) ) ( not ( = ?auto_5991 ?auto_5995 ) ) ( IS-CRATE ?auto_5992 ) ( not ( = ?auto_5994 ?auto_6000 ) ) ( not ( = ?auto_5997 ?auto_5994 ) ) ( HOIST-AT ?auto_6001 ?auto_5994 ) ( not ( = ?auto_6002 ?auto_6001 ) ) ( not ( = ?auto_5999 ?auto_6001 ) ) ( AVAILABLE ?auto_6001 ) ( SURFACE-AT ?auto_5992 ?auto_5994 ) ( ON ?auto_5992 ?auto_5996 ) ( CLEAR ?auto_5992 ) ( not ( = ?auto_5992 ?auto_5996 ) ) ( not ( = ?auto_5993 ?auto_5996 ) ) ( not ( = ?auto_5991 ?auto_5996 ) ) ( not ( = ?auto_5995 ?auto_5996 ) ) ( TRUCK-AT ?auto_5998 ?auto_6000 ) ( SURFACE-AT ?auto_5990 ?auto_6000 ) ( CLEAR ?auto_5990 ) ( IS-CRATE ?auto_5991 ) ( not ( = ?auto_5990 ?auto_5991 ) ) ( not ( = ?auto_5992 ?auto_5990 ) ) ( not ( = ?auto_5993 ?auto_5990 ) ) ( not ( = ?auto_5995 ?auto_5990 ) ) ( not ( = ?auto_5996 ?auto_5990 ) ) ( AVAILABLE ?auto_6002 ) ( IN ?auto_5991 ?auto_5998 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5991 ?auto_5992 ?auto_5993 )
      ( MAKE-3CRATE-VERIFY ?auto_5990 ?auto_5991 ?auto_5992 ?auto_5993 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6003 - SURFACE
      ?auto_6004 - SURFACE
    )
    :vars
    (
      ?auto_6015 - HOIST
      ?auto_6013 - PLACE
      ?auto_6010 - SURFACE
      ?auto_6008 - PLACE
      ?auto_6011 - HOIST
      ?auto_6006 - SURFACE
      ?auto_6005 - PLACE
      ?auto_6014 - HOIST
      ?auto_6007 - SURFACE
      ?auto_6012 - SURFACE
      ?auto_6009 - TRUCK
      ?auto_6016 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6015 ?auto_6013 ) ( IS-CRATE ?auto_6004 ) ( not ( = ?auto_6003 ?auto_6004 ) ) ( not ( = ?auto_6010 ?auto_6003 ) ) ( not ( = ?auto_6010 ?auto_6004 ) ) ( not ( = ?auto_6008 ?auto_6013 ) ) ( HOIST-AT ?auto_6011 ?auto_6008 ) ( not ( = ?auto_6015 ?auto_6011 ) ) ( AVAILABLE ?auto_6011 ) ( SURFACE-AT ?auto_6004 ?auto_6008 ) ( ON ?auto_6004 ?auto_6006 ) ( CLEAR ?auto_6004 ) ( not ( = ?auto_6003 ?auto_6006 ) ) ( not ( = ?auto_6004 ?auto_6006 ) ) ( not ( = ?auto_6010 ?auto_6006 ) ) ( IS-CRATE ?auto_6003 ) ( not ( = ?auto_6005 ?auto_6013 ) ) ( not ( = ?auto_6008 ?auto_6005 ) ) ( HOIST-AT ?auto_6014 ?auto_6005 ) ( not ( = ?auto_6015 ?auto_6014 ) ) ( not ( = ?auto_6011 ?auto_6014 ) ) ( AVAILABLE ?auto_6014 ) ( SURFACE-AT ?auto_6003 ?auto_6005 ) ( ON ?auto_6003 ?auto_6007 ) ( CLEAR ?auto_6003 ) ( not ( = ?auto_6003 ?auto_6007 ) ) ( not ( = ?auto_6004 ?auto_6007 ) ) ( not ( = ?auto_6010 ?auto_6007 ) ) ( not ( = ?auto_6006 ?auto_6007 ) ) ( SURFACE-AT ?auto_6012 ?auto_6013 ) ( CLEAR ?auto_6012 ) ( IS-CRATE ?auto_6010 ) ( not ( = ?auto_6012 ?auto_6010 ) ) ( not ( = ?auto_6003 ?auto_6012 ) ) ( not ( = ?auto_6004 ?auto_6012 ) ) ( not ( = ?auto_6006 ?auto_6012 ) ) ( not ( = ?auto_6007 ?auto_6012 ) ) ( AVAILABLE ?auto_6015 ) ( IN ?auto_6010 ?auto_6009 ) ( TRUCK-AT ?auto_6009 ?auto_6016 ) ( not ( = ?auto_6016 ?auto_6013 ) ) ( not ( = ?auto_6008 ?auto_6016 ) ) ( not ( = ?auto_6005 ?auto_6016 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6009 ?auto_6016 ?auto_6013 )
      ( MAKE-2CRATE ?auto_6010 ?auto_6003 ?auto_6004 )
      ( MAKE-1CRATE-VERIFY ?auto_6003 ?auto_6004 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6017 - SURFACE
      ?auto_6018 - SURFACE
      ?auto_6019 - SURFACE
    )
    :vars
    (
      ?auto_6021 - HOIST
      ?auto_6022 - PLACE
      ?auto_6024 - PLACE
      ?auto_6023 - HOIST
      ?auto_6030 - SURFACE
      ?auto_6025 - PLACE
      ?auto_6020 - HOIST
      ?auto_6027 - SURFACE
      ?auto_6028 - SURFACE
      ?auto_6026 - TRUCK
      ?auto_6029 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6021 ?auto_6022 ) ( IS-CRATE ?auto_6019 ) ( not ( = ?auto_6018 ?auto_6019 ) ) ( not ( = ?auto_6017 ?auto_6018 ) ) ( not ( = ?auto_6017 ?auto_6019 ) ) ( not ( = ?auto_6024 ?auto_6022 ) ) ( HOIST-AT ?auto_6023 ?auto_6024 ) ( not ( = ?auto_6021 ?auto_6023 ) ) ( AVAILABLE ?auto_6023 ) ( SURFACE-AT ?auto_6019 ?auto_6024 ) ( ON ?auto_6019 ?auto_6030 ) ( CLEAR ?auto_6019 ) ( not ( = ?auto_6018 ?auto_6030 ) ) ( not ( = ?auto_6019 ?auto_6030 ) ) ( not ( = ?auto_6017 ?auto_6030 ) ) ( IS-CRATE ?auto_6018 ) ( not ( = ?auto_6025 ?auto_6022 ) ) ( not ( = ?auto_6024 ?auto_6025 ) ) ( HOIST-AT ?auto_6020 ?auto_6025 ) ( not ( = ?auto_6021 ?auto_6020 ) ) ( not ( = ?auto_6023 ?auto_6020 ) ) ( AVAILABLE ?auto_6020 ) ( SURFACE-AT ?auto_6018 ?auto_6025 ) ( ON ?auto_6018 ?auto_6027 ) ( CLEAR ?auto_6018 ) ( not ( = ?auto_6018 ?auto_6027 ) ) ( not ( = ?auto_6019 ?auto_6027 ) ) ( not ( = ?auto_6017 ?auto_6027 ) ) ( not ( = ?auto_6030 ?auto_6027 ) ) ( SURFACE-AT ?auto_6028 ?auto_6022 ) ( CLEAR ?auto_6028 ) ( IS-CRATE ?auto_6017 ) ( not ( = ?auto_6028 ?auto_6017 ) ) ( not ( = ?auto_6018 ?auto_6028 ) ) ( not ( = ?auto_6019 ?auto_6028 ) ) ( not ( = ?auto_6030 ?auto_6028 ) ) ( not ( = ?auto_6027 ?auto_6028 ) ) ( AVAILABLE ?auto_6021 ) ( IN ?auto_6017 ?auto_6026 ) ( TRUCK-AT ?auto_6026 ?auto_6029 ) ( not ( = ?auto_6029 ?auto_6022 ) ) ( not ( = ?auto_6024 ?auto_6029 ) ) ( not ( = ?auto_6025 ?auto_6029 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6018 ?auto_6019 )
      ( MAKE-2CRATE-VERIFY ?auto_6017 ?auto_6018 ?auto_6019 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6031 - SURFACE
      ?auto_6032 - SURFACE
      ?auto_6033 - SURFACE
      ?auto_6034 - SURFACE
    )
    :vars
    (
      ?auto_6042 - HOIST
      ?auto_6035 - PLACE
      ?auto_6036 - PLACE
      ?auto_6041 - HOIST
      ?auto_6038 - SURFACE
      ?auto_6040 - PLACE
      ?auto_6039 - HOIST
      ?auto_6044 - SURFACE
      ?auto_6043 - TRUCK
      ?auto_6037 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6042 ?auto_6035 ) ( IS-CRATE ?auto_6034 ) ( not ( = ?auto_6033 ?auto_6034 ) ) ( not ( = ?auto_6032 ?auto_6033 ) ) ( not ( = ?auto_6032 ?auto_6034 ) ) ( not ( = ?auto_6036 ?auto_6035 ) ) ( HOIST-AT ?auto_6041 ?auto_6036 ) ( not ( = ?auto_6042 ?auto_6041 ) ) ( AVAILABLE ?auto_6041 ) ( SURFACE-AT ?auto_6034 ?auto_6036 ) ( ON ?auto_6034 ?auto_6038 ) ( CLEAR ?auto_6034 ) ( not ( = ?auto_6033 ?auto_6038 ) ) ( not ( = ?auto_6034 ?auto_6038 ) ) ( not ( = ?auto_6032 ?auto_6038 ) ) ( IS-CRATE ?auto_6033 ) ( not ( = ?auto_6040 ?auto_6035 ) ) ( not ( = ?auto_6036 ?auto_6040 ) ) ( HOIST-AT ?auto_6039 ?auto_6040 ) ( not ( = ?auto_6042 ?auto_6039 ) ) ( not ( = ?auto_6041 ?auto_6039 ) ) ( AVAILABLE ?auto_6039 ) ( SURFACE-AT ?auto_6033 ?auto_6040 ) ( ON ?auto_6033 ?auto_6044 ) ( CLEAR ?auto_6033 ) ( not ( = ?auto_6033 ?auto_6044 ) ) ( not ( = ?auto_6034 ?auto_6044 ) ) ( not ( = ?auto_6032 ?auto_6044 ) ) ( not ( = ?auto_6038 ?auto_6044 ) ) ( SURFACE-AT ?auto_6031 ?auto_6035 ) ( CLEAR ?auto_6031 ) ( IS-CRATE ?auto_6032 ) ( not ( = ?auto_6031 ?auto_6032 ) ) ( not ( = ?auto_6033 ?auto_6031 ) ) ( not ( = ?auto_6034 ?auto_6031 ) ) ( not ( = ?auto_6038 ?auto_6031 ) ) ( not ( = ?auto_6044 ?auto_6031 ) ) ( AVAILABLE ?auto_6042 ) ( IN ?auto_6032 ?auto_6043 ) ( TRUCK-AT ?auto_6043 ?auto_6037 ) ( not ( = ?auto_6037 ?auto_6035 ) ) ( not ( = ?auto_6036 ?auto_6037 ) ) ( not ( = ?auto_6040 ?auto_6037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6032 ?auto_6033 ?auto_6034 )
      ( MAKE-3CRATE-VERIFY ?auto_6031 ?auto_6032 ?auto_6033 ?auto_6034 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6045 - SURFACE
      ?auto_6046 - SURFACE
    )
    :vars
    (
      ?auto_6054 - HOIST
      ?auto_6047 - PLACE
      ?auto_6055 - SURFACE
      ?auto_6048 - PLACE
      ?auto_6053 - HOIST
      ?auto_6050 - SURFACE
      ?auto_6052 - PLACE
      ?auto_6051 - HOIST
      ?auto_6058 - SURFACE
      ?auto_6056 - SURFACE
      ?auto_6057 - TRUCK
      ?auto_6049 - PLACE
      ?auto_6059 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6054 ?auto_6047 ) ( IS-CRATE ?auto_6046 ) ( not ( = ?auto_6045 ?auto_6046 ) ) ( not ( = ?auto_6055 ?auto_6045 ) ) ( not ( = ?auto_6055 ?auto_6046 ) ) ( not ( = ?auto_6048 ?auto_6047 ) ) ( HOIST-AT ?auto_6053 ?auto_6048 ) ( not ( = ?auto_6054 ?auto_6053 ) ) ( AVAILABLE ?auto_6053 ) ( SURFACE-AT ?auto_6046 ?auto_6048 ) ( ON ?auto_6046 ?auto_6050 ) ( CLEAR ?auto_6046 ) ( not ( = ?auto_6045 ?auto_6050 ) ) ( not ( = ?auto_6046 ?auto_6050 ) ) ( not ( = ?auto_6055 ?auto_6050 ) ) ( IS-CRATE ?auto_6045 ) ( not ( = ?auto_6052 ?auto_6047 ) ) ( not ( = ?auto_6048 ?auto_6052 ) ) ( HOIST-AT ?auto_6051 ?auto_6052 ) ( not ( = ?auto_6054 ?auto_6051 ) ) ( not ( = ?auto_6053 ?auto_6051 ) ) ( AVAILABLE ?auto_6051 ) ( SURFACE-AT ?auto_6045 ?auto_6052 ) ( ON ?auto_6045 ?auto_6058 ) ( CLEAR ?auto_6045 ) ( not ( = ?auto_6045 ?auto_6058 ) ) ( not ( = ?auto_6046 ?auto_6058 ) ) ( not ( = ?auto_6055 ?auto_6058 ) ) ( not ( = ?auto_6050 ?auto_6058 ) ) ( SURFACE-AT ?auto_6056 ?auto_6047 ) ( CLEAR ?auto_6056 ) ( IS-CRATE ?auto_6055 ) ( not ( = ?auto_6056 ?auto_6055 ) ) ( not ( = ?auto_6045 ?auto_6056 ) ) ( not ( = ?auto_6046 ?auto_6056 ) ) ( not ( = ?auto_6050 ?auto_6056 ) ) ( not ( = ?auto_6058 ?auto_6056 ) ) ( AVAILABLE ?auto_6054 ) ( TRUCK-AT ?auto_6057 ?auto_6049 ) ( not ( = ?auto_6049 ?auto_6047 ) ) ( not ( = ?auto_6048 ?auto_6049 ) ) ( not ( = ?auto_6052 ?auto_6049 ) ) ( HOIST-AT ?auto_6059 ?auto_6049 ) ( LIFTING ?auto_6059 ?auto_6055 ) ( not ( = ?auto_6054 ?auto_6059 ) ) ( not ( = ?auto_6053 ?auto_6059 ) ) ( not ( = ?auto_6051 ?auto_6059 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6059 ?auto_6055 ?auto_6057 ?auto_6049 )
      ( MAKE-2CRATE ?auto_6055 ?auto_6045 ?auto_6046 )
      ( MAKE-1CRATE-VERIFY ?auto_6045 ?auto_6046 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6060 - SURFACE
      ?auto_6061 - SURFACE
      ?auto_6062 - SURFACE
    )
    :vars
    (
      ?auto_6070 - HOIST
      ?auto_6074 - PLACE
      ?auto_6064 - PLACE
      ?auto_6063 - HOIST
      ?auto_6066 - SURFACE
      ?auto_6069 - PLACE
      ?auto_6068 - HOIST
      ?auto_6065 - SURFACE
      ?auto_6071 - SURFACE
      ?auto_6072 - TRUCK
      ?auto_6067 - PLACE
      ?auto_6073 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6070 ?auto_6074 ) ( IS-CRATE ?auto_6062 ) ( not ( = ?auto_6061 ?auto_6062 ) ) ( not ( = ?auto_6060 ?auto_6061 ) ) ( not ( = ?auto_6060 ?auto_6062 ) ) ( not ( = ?auto_6064 ?auto_6074 ) ) ( HOIST-AT ?auto_6063 ?auto_6064 ) ( not ( = ?auto_6070 ?auto_6063 ) ) ( AVAILABLE ?auto_6063 ) ( SURFACE-AT ?auto_6062 ?auto_6064 ) ( ON ?auto_6062 ?auto_6066 ) ( CLEAR ?auto_6062 ) ( not ( = ?auto_6061 ?auto_6066 ) ) ( not ( = ?auto_6062 ?auto_6066 ) ) ( not ( = ?auto_6060 ?auto_6066 ) ) ( IS-CRATE ?auto_6061 ) ( not ( = ?auto_6069 ?auto_6074 ) ) ( not ( = ?auto_6064 ?auto_6069 ) ) ( HOIST-AT ?auto_6068 ?auto_6069 ) ( not ( = ?auto_6070 ?auto_6068 ) ) ( not ( = ?auto_6063 ?auto_6068 ) ) ( AVAILABLE ?auto_6068 ) ( SURFACE-AT ?auto_6061 ?auto_6069 ) ( ON ?auto_6061 ?auto_6065 ) ( CLEAR ?auto_6061 ) ( not ( = ?auto_6061 ?auto_6065 ) ) ( not ( = ?auto_6062 ?auto_6065 ) ) ( not ( = ?auto_6060 ?auto_6065 ) ) ( not ( = ?auto_6066 ?auto_6065 ) ) ( SURFACE-AT ?auto_6071 ?auto_6074 ) ( CLEAR ?auto_6071 ) ( IS-CRATE ?auto_6060 ) ( not ( = ?auto_6071 ?auto_6060 ) ) ( not ( = ?auto_6061 ?auto_6071 ) ) ( not ( = ?auto_6062 ?auto_6071 ) ) ( not ( = ?auto_6066 ?auto_6071 ) ) ( not ( = ?auto_6065 ?auto_6071 ) ) ( AVAILABLE ?auto_6070 ) ( TRUCK-AT ?auto_6072 ?auto_6067 ) ( not ( = ?auto_6067 ?auto_6074 ) ) ( not ( = ?auto_6064 ?auto_6067 ) ) ( not ( = ?auto_6069 ?auto_6067 ) ) ( HOIST-AT ?auto_6073 ?auto_6067 ) ( LIFTING ?auto_6073 ?auto_6060 ) ( not ( = ?auto_6070 ?auto_6073 ) ) ( not ( = ?auto_6063 ?auto_6073 ) ) ( not ( = ?auto_6068 ?auto_6073 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6061 ?auto_6062 )
      ( MAKE-2CRATE-VERIFY ?auto_6060 ?auto_6061 ?auto_6062 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6075 - SURFACE
      ?auto_6076 - SURFACE
      ?auto_6077 - SURFACE
      ?auto_6078 - SURFACE
    )
    :vars
    (
      ?auto_6085 - HOIST
      ?auto_6080 - PLACE
      ?auto_6088 - PLACE
      ?auto_6087 - HOIST
      ?auto_6086 - SURFACE
      ?auto_6083 - PLACE
      ?auto_6079 - HOIST
      ?auto_6089 - SURFACE
      ?auto_6082 - TRUCK
      ?auto_6081 - PLACE
      ?auto_6084 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6085 ?auto_6080 ) ( IS-CRATE ?auto_6078 ) ( not ( = ?auto_6077 ?auto_6078 ) ) ( not ( = ?auto_6076 ?auto_6077 ) ) ( not ( = ?auto_6076 ?auto_6078 ) ) ( not ( = ?auto_6088 ?auto_6080 ) ) ( HOIST-AT ?auto_6087 ?auto_6088 ) ( not ( = ?auto_6085 ?auto_6087 ) ) ( AVAILABLE ?auto_6087 ) ( SURFACE-AT ?auto_6078 ?auto_6088 ) ( ON ?auto_6078 ?auto_6086 ) ( CLEAR ?auto_6078 ) ( not ( = ?auto_6077 ?auto_6086 ) ) ( not ( = ?auto_6078 ?auto_6086 ) ) ( not ( = ?auto_6076 ?auto_6086 ) ) ( IS-CRATE ?auto_6077 ) ( not ( = ?auto_6083 ?auto_6080 ) ) ( not ( = ?auto_6088 ?auto_6083 ) ) ( HOIST-AT ?auto_6079 ?auto_6083 ) ( not ( = ?auto_6085 ?auto_6079 ) ) ( not ( = ?auto_6087 ?auto_6079 ) ) ( AVAILABLE ?auto_6079 ) ( SURFACE-AT ?auto_6077 ?auto_6083 ) ( ON ?auto_6077 ?auto_6089 ) ( CLEAR ?auto_6077 ) ( not ( = ?auto_6077 ?auto_6089 ) ) ( not ( = ?auto_6078 ?auto_6089 ) ) ( not ( = ?auto_6076 ?auto_6089 ) ) ( not ( = ?auto_6086 ?auto_6089 ) ) ( SURFACE-AT ?auto_6075 ?auto_6080 ) ( CLEAR ?auto_6075 ) ( IS-CRATE ?auto_6076 ) ( not ( = ?auto_6075 ?auto_6076 ) ) ( not ( = ?auto_6077 ?auto_6075 ) ) ( not ( = ?auto_6078 ?auto_6075 ) ) ( not ( = ?auto_6086 ?auto_6075 ) ) ( not ( = ?auto_6089 ?auto_6075 ) ) ( AVAILABLE ?auto_6085 ) ( TRUCK-AT ?auto_6082 ?auto_6081 ) ( not ( = ?auto_6081 ?auto_6080 ) ) ( not ( = ?auto_6088 ?auto_6081 ) ) ( not ( = ?auto_6083 ?auto_6081 ) ) ( HOIST-AT ?auto_6084 ?auto_6081 ) ( LIFTING ?auto_6084 ?auto_6076 ) ( not ( = ?auto_6085 ?auto_6084 ) ) ( not ( = ?auto_6087 ?auto_6084 ) ) ( not ( = ?auto_6079 ?auto_6084 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6076 ?auto_6077 ?auto_6078 )
      ( MAKE-3CRATE-VERIFY ?auto_6075 ?auto_6076 ?auto_6077 ?auto_6078 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6090 - SURFACE
      ?auto_6091 - SURFACE
    )
    :vars
    (
      ?auto_6099 - HOIST
      ?auto_6093 - PLACE
      ?auto_6104 - SURFACE
      ?auto_6102 - PLACE
      ?auto_6101 - HOIST
      ?auto_6100 - SURFACE
      ?auto_6096 - PLACE
      ?auto_6092 - HOIST
      ?auto_6103 - SURFACE
      ?auto_6097 - SURFACE
      ?auto_6095 - TRUCK
      ?auto_6094 - PLACE
      ?auto_6098 - HOIST
      ?auto_6105 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6099 ?auto_6093 ) ( IS-CRATE ?auto_6091 ) ( not ( = ?auto_6090 ?auto_6091 ) ) ( not ( = ?auto_6104 ?auto_6090 ) ) ( not ( = ?auto_6104 ?auto_6091 ) ) ( not ( = ?auto_6102 ?auto_6093 ) ) ( HOIST-AT ?auto_6101 ?auto_6102 ) ( not ( = ?auto_6099 ?auto_6101 ) ) ( AVAILABLE ?auto_6101 ) ( SURFACE-AT ?auto_6091 ?auto_6102 ) ( ON ?auto_6091 ?auto_6100 ) ( CLEAR ?auto_6091 ) ( not ( = ?auto_6090 ?auto_6100 ) ) ( not ( = ?auto_6091 ?auto_6100 ) ) ( not ( = ?auto_6104 ?auto_6100 ) ) ( IS-CRATE ?auto_6090 ) ( not ( = ?auto_6096 ?auto_6093 ) ) ( not ( = ?auto_6102 ?auto_6096 ) ) ( HOIST-AT ?auto_6092 ?auto_6096 ) ( not ( = ?auto_6099 ?auto_6092 ) ) ( not ( = ?auto_6101 ?auto_6092 ) ) ( AVAILABLE ?auto_6092 ) ( SURFACE-AT ?auto_6090 ?auto_6096 ) ( ON ?auto_6090 ?auto_6103 ) ( CLEAR ?auto_6090 ) ( not ( = ?auto_6090 ?auto_6103 ) ) ( not ( = ?auto_6091 ?auto_6103 ) ) ( not ( = ?auto_6104 ?auto_6103 ) ) ( not ( = ?auto_6100 ?auto_6103 ) ) ( SURFACE-AT ?auto_6097 ?auto_6093 ) ( CLEAR ?auto_6097 ) ( IS-CRATE ?auto_6104 ) ( not ( = ?auto_6097 ?auto_6104 ) ) ( not ( = ?auto_6090 ?auto_6097 ) ) ( not ( = ?auto_6091 ?auto_6097 ) ) ( not ( = ?auto_6100 ?auto_6097 ) ) ( not ( = ?auto_6103 ?auto_6097 ) ) ( AVAILABLE ?auto_6099 ) ( TRUCK-AT ?auto_6095 ?auto_6094 ) ( not ( = ?auto_6094 ?auto_6093 ) ) ( not ( = ?auto_6102 ?auto_6094 ) ) ( not ( = ?auto_6096 ?auto_6094 ) ) ( HOIST-AT ?auto_6098 ?auto_6094 ) ( not ( = ?auto_6099 ?auto_6098 ) ) ( not ( = ?auto_6101 ?auto_6098 ) ) ( not ( = ?auto_6092 ?auto_6098 ) ) ( AVAILABLE ?auto_6098 ) ( SURFACE-AT ?auto_6104 ?auto_6094 ) ( ON ?auto_6104 ?auto_6105 ) ( CLEAR ?auto_6104 ) ( not ( = ?auto_6090 ?auto_6105 ) ) ( not ( = ?auto_6091 ?auto_6105 ) ) ( not ( = ?auto_6104 ?auto_6105 ) ) ( not ( = ?auto_6100 ?auto_6105 ) ) ( not ( = ?auto_6103 ?auto_6105 ) ) ( not ( = ?auto_6097 ?auto_6105 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6098 ?auto_6104 ?auto_6105 ?auto_6094 )
      ( MAKE-2CRATE ?auto_6104 ?auto_6090 ?auto_6091 )
      ( MAKE-1CRATE-VERIFY ?auto_6090 ?auto_6091 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6106 - SURFACE
      ?auto_6107 - SURFACE
      ?auto_6108 - SURFACE
    )
    :vars
    (
      ?auto_6115 - HOIST
      ?auto_6120 - PLACE
      ?auto_6111 - PLACE
      ?auto_6118 - HOIST
      ?auto_6121 - SURFACE
      ?auto_6113 - PLACE
      ?auto_6114 - HOIST
      ?auto_6110 - SURFACE
      ?auto_6109 - SURFACE
      ?auto_6116 - TRUCK
      ?auto_6112 - PLACE
      ?auto_6117 - HOIST
      ?auto_6119 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6115 ?auto_6120 ) ( IS-CRATE ?auto_6108 ) ( not ( = ?auto_6107 ?auto_6108 ) ) ( not ( = ?auto_6106 ?auto_6107 ) ) ( not ( = ?auto_6106 ?auto_6108 ) ) ( not ( = ?auto_6111 ?auto_6120 ) ) ( HOIST-AT ?auto_6118 ?auto_6111 ) ( not ( = ?auto_6115 ?auto_6118 ) ) ( AVAILABLE ?auto_6118 ) ( SURFACE-AT ?auto_6108 ?auto_6111 ) ( ON ?auto_6108 ?auto_6121 ) ( CLEAR ?auto_6108 ) ( not ( = ?auto_6107 ?auto_6121 ) ) ( not ( = ?auto_6108 ?auto_6121 ) ) ( not ( = ?auto_6106 ?auto_6121 ) ) ( IS-CRATE ?auto_6107 ) ( not ( = ?auto_6113 ?auto_6120 ) ) ( not ( = ?auto_6111 ?auto_6113 ) ) ( HOIST-AT ?auto_6114 ?auto_6113 ) ( not ( = ?auto_6115 ?auto_6114 ) ) ( not ( = ?auto_6118 ?auto_6114 ) ) ( AVAILABLE ?auto_6114 ) ( SURFACE-AT ?auto_6107 ?auto_6113 ) ( ON ?auto_6107 ?auto_6110 ) ( CLEAR ?auto_6107 ) ( not ( = ?auto_6107 ?auto_6110 ) ) ( not ( = ?auto_6108 ?auto_6110 ) ) ( not ( = ?auto_6106 ?auto_6110 ) ) ( not ( = ?auto_6121 ?auto_6110 ) ) ( SURFACE-AT ?auto_6109 ?auto_6120 ) ( CLEAR ?auto_6109 ) ( IS-CRATE ?auto_6106 ) ( not ( = ?auto_6109 ?auto_6106 ) ) ( not ( = ?auto_6107 ?auto_6109 ) ) ( not ( = ?auto_6108 ?auto_6109 ) ) ( not ( = ?auto_6121 ?auto_6109 ) ) ( not ( = ?auto_6110 ?auto_6109 ) ) ( AVAILABLE ?auto_6115 ) ( TRUCK-AT ?auto_6116 ?auto_6112 ) ( not ( = ?auto_6112 ?auto_6120 ) ) ( not ( = ?auto_6111 ?auto_6112 ) ) ( not ( = ?auto_6113 ?auto_6112 ) ) ( HOIST-AT ?auto_6117 ?auto_6112 ) ( not ( = ?auto_6115 ?auto_6117 ) ) ( not ( = ?auto_6118 ?auto_6117 ) ) ( not ( = ?auto_6114 ?auto_6117 ) ) ( AVAILABLE ?auto_6117 ) ( SURFACE-AT ?auto_6106 ?auto_6112 ) ( ON ?auto_6106 ?auto_6119 ) ( CLEAR ?auto_6106 ) ( not ( = ?auto_6107 ?auto_6119 ) ) ( not ( = ?auto_6108 ?auto_6119 ) ) ( not ( = ?auto_6106 ?auto_6119 ) ) ( not ( = ?auto_6121 ?auto_6119 ) ) ( not ( = ?auto_6110 ?auto_6119 ) ) ( not ( = ?auto_6109 ?auto_6119 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6107 ?auto_6108 )
      ( MAKE-2CRATE-VERIFY ?auto_6106 ?auto_6107 ?auto_6108 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6122 - SURFACE
      ?auto_6123 - SURFACE
      ?auto_6124 - SURFACE
      ?auto_6125 - SURFACE
    )
    :vars
    (
      ?auto_6137 - HOIST
      ?auto_6127 - PLACE
      ?auto_6128 - PLACE
      ?auto_6132 - HOIST
      ?auto_6129 - SURFACE
      ?auto_6133 - PLACE
      ?auto_6136 - HOIST
      ?auto_6134 - SURFACE
      ?auto_6130 - TRUCK
      ?auto_6135 - PLACE
      ?auto_6126 - HOIST
      ?auto_6131 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6137 ?auto_6127 ) ( IS-CRATE ?auto_6125 ) ( not ( = ?auto_6124 ?auto_6125 ) ) ( not ( = ?auto_6123 ?auto_6124 ) ) ( not ( = ?auto_6123 ?auto_6125 ) ) ( not ( = ?auto_6128 ?auto_6127 ) ) ( HOIST-AT ?auto_6132 ?auto_6128 ) ( not ( = ?auto_6137 ?auto_6132 ) ) ( AVAILABLE ?auto_6132 ) ( SURFACE-AT ?auto_6125 ?auto_6128 ) ( ON ?auto_6125 ?auto_6129 ) ( CLEAR ?auto_6125 ) ( not ( = ?auto_6124 ?auto_6129 ) ) ( not ( = ?auto_6125 ?auto_6129 ) ) ( not ( = ?auto_6123 ?auto_6129 ) ) ( IS-CRATE ?auto_6124 ) ( not ( = ?auto_6133 ?auto_6127 ) ) ( not ( = ?auto_6128 ?auto_6133 ) ) ( HOIST-AT ?auto_6136 ?auto_6133 ) ( not ( = ?auto_6137 ?auto_6136 ) ) ( not ( = ?auto_6132 ?auto_6136 ) ) ( AVAILABLE ?auto_6136 ) ( SURFACE-AT ?auto_6124 ?auto_6133 ) ( ON ?auto_6124 ?auto_6134 ) ( CLEAR ?auto_6124 ) ( not ( = ?auto_6124 ?auto_6134 ) ) ( not ( = ?auto_6125 ?auto_6134 ) ) ( not ( = ?auto_6123 ?auto_6134 ) ) ( not ( = ?auto_6129 ?auto_6134 ) ) ( SURFACE-AT ?auto_6122 ?auto_6127 ) ( CLEAR ?auto_6122 ) ( IS-CRATE ?auto_6123 ) ( not ( = ?auto_6122 ?auto_6123 ) ) ( not ( = ?auto_6124 ?auto_6122 ) ) ( not ( = ?auto_6125 ?auto_6122 ) ) ( not ( = ?auto_6129 ?auto_6122 ) ) ( not ( = ?auto_6134 ?auto_6122 ) ) ( AVAILABLE ?auto_6137 ) ( TRUCK-AT ?auto_6130 ?auto_6135 ) ( not ( = ?auto_6135 ?auto_6127 ) ) ( not ( = ?auto_6128 ?auto_6135 ) ) ( not ( = ?auto_6133 ?auto_6135 ) ) ( HOIST-AT ?auto_6126 ?auto_6135 ) ( not ( = ?auto_6137 ?auto_6126 ) ) ( not ( = ?auto_6132 ?auto_6126 ) ) ( not ( = ?auto_6136 ?auto_6126 ) ) ( AVAILABLE ?auto_6126 ) ( SURFACE-AT ?auto_6123 ?auto_6135 ) ( ON ?auto_6123 ?auto_6131 ) ( CLEAR ?auto_6123 ) ( not ( = ?auto_6124 ?auto_6131 ) ) ( not ( = ?auto_6125 ?auto_6131 ) ) ( not ( = ?auto_6123 ?auto_6131 ) ) ( not ( = ?auto_6129 ?auto_6131 ) ) ( not ( = ?auto_6134 ?auto_6131 ) ) ( not ( = ?auto_6122 ?auto_6131 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6123 ?auto_6124 ?auto_6125 )
      ( MAKE-3CRATE-VERIFY ?auto_6122 ?auto_6123 ?auto_6124 ?auto_6125 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6138 - SURFACE
      ?auto_6139 - SURFACE
    )
    :vars
    (
      ?auto_6152 - HOIST
      ?auto_6141 - PLACE
      ?auto_6153 - SURFACE
      ?auto_6142 - PLACE
      ?auto_6146 - HOIST
      ?auto_6143 - SURFACE
      ?auto_6147 - PLACE
      ?auto_6151 - HOIST
      ?auto_6148 - SURFACE
      ?auto_6149 - SURFACE
      ?auto_6150 - PLACE
      ?auto_6140 - HOIST
      ?auto_6145 - SURFACE
      ?auto_6144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6152 ?auto_6141 ) ( IS-CRATE ?auto_6139 ) ( not ( = ?auto_6138 ?auto_6139 ) ) ( not ( = ?auto_6153 ?auto_6138 ) ) ( not ( = ?auto_6153 ?auto_6139 ) ) ( not ( = ?auto_6142 ?auto_6141 ) ) ( HOIST-AT ?auto_6146 ?auto_6142 ) ( not ( = ?auto_6152 ?auto_6146 ) ) ( AVAILABLE ?auto_6146 ) ( SURFACE-AT ?auto_6139 ?auto_6142 ) ( ON ?auto_6139 ?auto_6143 ) ( CLEAR ?auto_6139 ) ( not ( = ?auto_6138 ?auto_6143 ) ) ( not ( = ?auto_6139 ?auto_6143 ) ) ( not ( = ?auto_6153 ?auto_6143 ) ) ( IS-CRATE ?auto_6138 ) ( not ( = ?auto_6147 ?auto_6141 ) ) ( not ( = ?auto_6142 ?auto_6147 ) ) ( HOIST-AT ?auto_6151 ?auto_6147 ) ( not ( = ?auto_6152 ?auto_6151 ) ) ( not ( = ?auto_6146 ?auto_6151 ) ) ( AVAILABLE ?auto_6151 ) ( SURFACE-AT ?auto_6138 ?auto_6147 ) ( ON ?auto_6138 ?auto_6148 ) ( CLEAR ?auto_6138 ) ( not ( = ?auto_6138 ?auto_6148 ) ) ( not ( = ?auto_6139 ?auto_6148 ) ) ( not ( = ?auto_6153 ?auto_6148 ) ) ( not ( = ?auto_6143 ?auto_6148 ) ) ( SURFACE-AT ?auto_6149 ?auto_6141 ) ( CLEAR ?auto_6149 ) ( IS-CRATE ?auto_6153 ) ( not ( = ?auto_6149 ?auto_6153 ) ) ( not ( = ?auto_6138 ?auto_6149 ) ) ( not ( = ?auto_6139 ?auto_6149 ) ) ( not ( = ?auto_6143 ?auto_6149 ) ) ( not ( = ?auto_6148 ?auto_6149 ) ) ( AVAILABLE ?auto_6152 ) ( not ( = ?auto_6150 ?auto_6141 ) ) ( not ( = ?auto_6142 ?auto_6150 ) ) ( not ( = ?auto_6147 ?auto_6150 ) ) ( HOIST-AT ?auto_6140 ?auto_6150 ) ( not ( = ?auto_6152 ?auto_6140 ) ) ( not ( = ?auto_6146 ?auto_6140 ) ) ( not ( = ?auto_6151 ?auto_6140 ) ) ( AVAILABLE ?auto_6140 ) ( SURFACE-AT ?auto_6153 ?auto_6150 ) ( ON ?auto_6153 ?auto_6145 ) ( CLEAR ?auto_6153 ) ( not ( = ?auto_6138 ?auto_6145 ) ) ( not ( = ?auto_6139 ?auto_6145 ) ) ( not ( = ?auto_6153 ?auto_6145 ) ) ( not ( = ?auto_6143 ?auto_6145 ) ) ( not ( = ?auto_6148 ?auto_6145 ) ) ( not ( = ?auto_6149 ?auto_6145 ) ) ( TRUCK-AT ?auto_6144 ?auto_6141 ) )
    :subtasks
    ( ( !DRIVE ?auto_6144 ?auto_6141 ?auto_6150 )
      ( MAKE-2CRATE ?auto_6153 ?auto_6138 ?auto_6139 )
      ( MAKE-1CRATE-VERIFY ?auto_6138 ?auto_6139 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6154 - SURFACE
      ?auto_6155 - SURFACE
      ?auto_6156 - SURFACE
    )
    :vars
    (
      ?auto_6169 - HOIST
      ?auto_6163 - PLACE
      ?auto_6161 - PLACE
      ?auto_6157 - HOIST
      ?auto_6159 - SURFACE
      ?auto_6160 - PLACE
      ?auto_6167 - HOIST
      ?auto_6162 - SURFACE
      ?auto_6168 - SURFACE
      ?auto_6166 - PLACE
      ?auto_6165 - HOIST
      ?auto_6164 - SURFACE
      ?auto_6158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6169 ?auto_6163 ) ( IS-CRATE ?auto_6156 ) ( not ( = ?auto_6155 ?auto_6156 ) ) ( not ( = ?auto_6154 ?auto_6155 ) ) ( not ( = ?auto_6154 ?auto_6156 ) ) ( not ( = ?auto_6161 ?auto_6163 ) ) ( HOIST-AT ?auto_6157 ?auto_6161 ) ( not ( = ?auto_6169 ?auto_6157 ) ) ( AVAILABLE ?auto_6157 ) ( SURFACE-AT ?auto_6156 ?auto_6161 ) ( ON ?auto_6156 ?auto_6159 ) ( CLEAR ?auto_6156 ) ( not ( = ?auto_6155 ?auto_6159 ) ) ( not ( = ?auto_6156 ?auto_6159 ) ) ( not ( = ?auto_6154 ?auto_6159 ) ) ( IS-CRATE ?auto_6155 ) ( not ( = ?auto_6160 ?auto_6163 ) ) ( not ( = ?auto_6161 ?auto_6160 ) ) ( HOIST-AT ?auto_6167 ?auto_6160 ) ( not ( = ?auto_6169 ?auto_6167 ) ) ( not ( = ?auto_6157 ?auto_6167 ) ) ( AVAILABLE ?auto_6167 ) ( SURFACE-AT ?auto_6155 ?auto_6160 ) ( ON ?auto_6155 ?auto_6162 ) ( CLEAR ?auto_6155 ) ( not ( = ?auto_6155 ?auto_6162 ) ) ( not ( = ?auto_6156 ?auto_6162 ) ) ( not ( = ?auto_6154 ?auto_6162 ) ) ( not ( = ?auto_6159 ?auto_6162 ) ) ( SURFACE-AT ?auto_6168 ?auto_6163 ) ( CLEAR ?auto_6168 ) ( IS-CRATE ?auto_6154 ) ( not ( = ?auto_6168 ?auto_6154 ) ) ( not ( = ?auto_6155 ?auto_6168 ) ) ( not ( = ?auto_6156 ?auto_6168 ) ) ( not ( = ?auto_6159 ?auto_6168 ) ) ( not ( = ?auto_6162 ?auto_6168 ) ) ( AVAILABLE ?auto_6169 ) ( not ( = ?auto_6166 ?auto_6163 ) ) ( not ( = ?auto_6161 ?auto_6166 ) ) ( not ( = ?auto_6160 ?auto_6166 ) ) ( HOIST-AT ?auto_6165 ?auto_6166 ) ( not ( = ?auto_6169 ?auto_6165 ) ) ( not ( = ?auto_6157 ?auto_6165 ) ) ( not ( = ?auto_6167 ?auto_6165 ) ) ( AVAILABLE ?auto_6165 ) ( SURFACE-AT ?auto_6154 ?auto_6166 ) ( ON ?auto_6154 ?auto_6164 ) ( CLEAR ?auto_6154 ) ( not ( = ?auto_6155 ?auto_6164 ) ) ( not ( = ?auto_6156 ?auto_6164 ) ) ( not ( = ?auto_6154 ?auto_6164 ) ) ( not ( = ?auto_6159 ?auto_6164 ) ) ( not ( = ?auto_6162 ?auto_6164 ) ) ( not ( = ?auto_6168 ?auto_6164 ) ) ( TRUCK-AT ?auto_6158 ?auto_6163 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6155 ?auto_6156 )
      ( MAKE-2CRATE-VERIFY ?auto_6154 ?auto_6155 ?auto_6156 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6170 - SURFACE
      ?auto_6171 - SURFACE
      ?auto_6172 - SURFACE
      ?auto_6173 - SURFACE
    )
    :vars
    (
      ?auto_6176 - HOIST
      ?auto_6182 - PLACE
      ?auto_6185 - PLACE
      ?auto_6181 - HOIST
      ?auto_6177 - SURFACE
      ?auto_6180 - PLACE
      ?auto_6179 - HOIST
      ?auto_6174 - SURFACE
      ?auto_6175 - PLACE
      ?auto_6178 - HOIST
      ?auto_6184 - SURFACE
      ?auto_6183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6176 ?auto_6182 ) ( IS-CRATE ?auto_6173 ) ( not ( = ?auto_6172 ?auto_6173 ) ) ( not ( = ?auto_6171 ?auto_6172 ) ) ( not ( = ?auto_6171 ?auto_6173 ) ) ( not ( = ?auto_6185 ?auto_6182 ) ) ( HOIST-AT ?auto_6181 ?auto_6185 ) ( not ( = ?auto_6176 ?auto_6181 ) ) ( AVAILABLE ?auto_6181 ) ( SURFACE-AT ?auto_6173 ?auto_6185 ) ( ON ?auto_6173 ?auto_6177 ) ( CLEAR ?auto_6173 ) ( not ( = ?auto_6172 ?auto_6177 ) ) ( not ( = ?auto_6173 ?auto_6177 ) ) ( not ( = ?auto_6171 ?auto_6177 ) ) ( IS-CRATE ?auto_6172 ) ( not ( = ?auto_6180 ?auto_6182 ) ) ( not ( = ?auto_6185 ?auto_6180 ) ) ( HOIST-AT ?auto_6179 ?auto_6180 ) ( not ( = ?auto_6176 ?auto_6179 ) ) ( not ( = ?auto_6181 ?auto_6179 ) ) ( AVAILABLE ?auto_6179 ) ( SURFACE-AT ?auto_6172 ?auto_6180 ) ( ON ?auto_6172 ?auto_6174 ) ( CLEAR ?auto_6172 ) ( not ( = ?auto_6172 ?auto_6174 ) ) ( not ( = ?auto_6173 ?auto_6174 ) ) ( not ( = ?auto_6171 ?auto_6174 ) ) ( not ( = ?auto_6177 ?auto_6174 ) ) ( SURFACE-AT ?auto_6170 ?auto_6182 ) ( CLEAR ?auto_6170 ) ( IS-CRATE ?auto_6171 ) ( not ( = ?auto_6170 ?auto_6171 ) ) ( not ( = ?auto_6172 ?auto_6170 ) ) ( not ( = ?auto_6173 ?auto_6170 ) ) ( not ( = ?auto_6177 ?auto_6170 ) ) ( not ( = ?auto_6174 ?auto_6170 ) ) ( AVAILABLE ?auto_6176 ) ( not ( = ?auto_6175 ?auto_6182 ) ) ( not ( = ?auto_6185 ?auto_6175 ) ) ( not ( = ?auto_6180 ?auto_6175 ) ) ( HOIST-AT ?auto_6178 ?auto_6175 ) ( not ( = ?auto_6176 ?auto_6178 ) ) ( not ( = ?auto_6181 ?auto_6178 ) ) ( not ( = ?auto_6179 ?auto_6178 ) ) ( AVAILABLE ?auto_6178 ) ( SURFACE-AT ?auto_6171 ?auto_6175 ) ( ON ?auto_6171 ?auto_6184 ) ( CLEAR ?auto_6171 ) ( not ( = ?auto_6172 ?auto_6184 ) ) ( not ( = ?auto_6173 ?auto_6184 ) ) ( not ( = ?auto_6171 ?auto_6184 ) ) ( not ( = ?auto_6177 ?auto_6184 ) ) ( not ( = ?auto_6174 ?auto_6184 ) ) ( not ( = ?auto_6170 ?auto_6184 ) ) ( TRUCK-AT ?auto_6183 ?auto_6182 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6171 ?auto_6172 ?auto_6173 )
      ( MAKE-3CRATE-VERIFY ?auto_6170 ?auto_6171 ?auto_6172 ?auto_6173 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6200 - SURFACE
      ?auto_6201 - SURFACE
    )
    :vars
    (
      ?auto_6202 - HOIST
      ?auto_6203 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6202 ?auto_6203 ) ( SURFACE-AT ?auto_6200 ?auto_6203 ) ( CLEAR ?auto_6200 ) ( LIFTING ?auto_6202 ?auto_6201 ) ( IS-CRATE ?auto_6201 ) ( not ( = ?auto_6200 ?auto_6201 ) ) )
    :subtasks
    ( ( !DROP ?auto_6202 ?auto_6201 ?auto_6200 ?auto_6203 )
      ( MAKE-1CRATE-VERIFY ?auto_6200 ?auto_6201 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6204 - SURFACE
      ?auto_6205 - SURFACE
      ?auto_6206 - SURFACE
    )
    :vars
    (
      ?auto_6208 - HOIST
      ?auto_6207 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6208 ?auto_6207 ) ( SURFACE-AT ?auto_6205 ?auto_6207 ) ( CLEAR ?auto_6205 ) ( LIFTING ?auto_6208 ?auto_6206 ) ( IS-CRATE ?auto_6206 ) ( not ( = ?auto_6205 ?auto_6206 ) ) ( ON ?auto_6205 ?auto_6204 ) ( not ( = ?auto_6204 ?auto_6205 ) ) ( not ( = ?auto_6204 ?auto_6206 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6205 ?auto_6206 )
      ( MAKE-2CRATE-VERIFY ?auto_6204 ?auto_6205 ?auto_6206 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6209 - SURFACE
      ?auto_6210 - SURFACE
      ?auto_6211 - SURFACE
      ?auto_6212 - SURFACE
    )
    :vars
    (
      ?auto_6214 - HOIST
      ?auto_6213 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6214 ?auto_6213 ) ( SURFACE-AT ?auto_6211 ?auto_6213 ) ( CLEAR ?auto_6211 ) ( LIFTING ?auto_6214 ?auto_6212 ) ( IS-CRATE ?auto_6212 ) ( not ( = ?auto_6211 ?auto_6212 ) ) ( ON ?auto_6210 ?auto_6209 ) ( ON ?auto_6211 ?auto_6210 ) ( not ( = ?auto_6209 ?auto_6210 ) ) ( not ( = ?auto_6209 ?auto_6211 ) ) ( not ( = ?auto_6209 ?auto_6212 ) ) ( not ( = ?auto_6210 ?auto_6211 ) ) ( not ( = ?auto_6210 ?auto_6212 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6211 ?auto_6212 )
      ( MAKE-3CRATE-VERIFY ?auto_6209 ?auto_6210 ?auto_6211 ?auto_6212 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6215 - SURFACE
      ?auto_6216 - SURFACE
      ?auto_6217 - SURFACE
      ?auto_6218 - SURFACE
      ?auto_6219 - SURFACE
    )
    :vars
    (
      ?auto_6221 - HOIST
      ?auto_6220 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6221 ?auto_6220 ) ( SURFACE-AT ?auto_6218 ?auto_6220 ) ( CLEAR ?auto_6218 ) ( LIFTING ?auto_6221 ?auto_6219 ) ( IS-CRATE ?auto_6219 ) ( not ( = ?auto_6218 ?auto_6219 ) ) ( ON ?auto_6216 ?auto_6215 ) ( ON ?auto_6217 ?auto_6216 ) ( ON ?auto_6218 ?auto_6217 ) ( not ( = ?auto_6215 ?auto_6216 ) ) ( not ( = ?auto_6215 ?auto_6217 ) ) ( not ( = ?auto_6215 ?auto_6218 ) ) ( not ( = ?auto_6215 ?auto_6219 ) ) ( not ( = ?auto_6216 ?auto_6217 ) ) ( not ( = ?auto_6216 ?auto_6218 ) ) ( not ( = ?auto_6216 ?auto_6219 ) ) ( not ( = ?auto_6217 ?auto_6218 ) ) ( not ( = ?auto_6217 ?auto_6219 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6218 ?auto_6219 )
      ( MAKE-4CRATE-VERIFY ?auto_6215 ?auto_6216 ?auto_6217 ?auto_6218 ?auto_6219 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6222 - SURFACE
      ?auto_6223 - SURFACE
    )
    :vars
    (
      ?auto_6225 - HOIST
      ?auto_6224 - PLACE
      ?auto_6226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6225 ?auto_6224 ) ( SURFACE-AT ?auto_6222 ?auto_6224 ) ( CLEAR ?auto_6222 ) ( IS-CRATE ?auto_6223 ) ( not ( = ?auto_6222 ?auto_6223 ) ) ( TRUCK-AT ?auto_6226 ?auto_6224 ) ( AVAILABLE ?auto_6225 ) ( IN ?auto_6223 ?auto_6226 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6225 ?auto_6223 ?auto_6226 ?auto_6224 )
      ( MAKE-1CRATE ?auto_6222 ?auto_6223 )
      ( MAKE-1CRATE-VERIFY ?auto_6222 ?auto_6223 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6227 - SURFACE
      ?auto_6228 - SURFACE
      ?auto_6229 - SURFACE
    )
    :vars
    (
      ?auto_6231 - HOIST
      ?auto_6232 - PLACE
      ?auto_6230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6231 ?auto_6232 ) ( SURFACE-AT ?auto_6228 ?auto_6232 ) ( CLEAR ?auto_6228 ) ( IS-CRATE ?auto_6229 ) ( not ( = ?auto_6228 ?auto_6229 ) ) ( TRUCK-AT ?auto_6230 ?auto_6232 ) ( AVAILABLE ?auto_6231 ) ( IN ?auto_6229 ?auto_6230 ) ( ON ?auto_6228 ?auto_6227 ) ( not ( = ?auto_6227 ?auto_6228 ) ) ( not ( = ?auto_6227 ?auto_6229 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6228 ?auto_6229 )
      ( MAKE-2CRATE-VERIFY ?auto_6227 ?auto_6228 ?auto_6229 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6233 - SURFACE
      ?auto_6234 - SURFACE
      ?auto_6235 - SURFACE
      ?auto_6236 - SURFACE
    )
    :vars
    (
      ?auto_6239 - HOIST
      ?auto_6237 - PLACE
      ?auto_6238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6239 ?auto_6237 ) ( SURFACE-AT ?auto_6235 ?auto_6237 ) ( CLEAR ?auto_6235 ) ( IS-CRATE ?auto_6236 ) ( not ( = ?auto_6235 ?auto_6236 ) ) ( TRUCK-AT ?auto_6238 ?auto_6237 ) ( AVAILABLE ?auto_6239 ) ( IN ?auto_6236 ?auto_6238 ) ( ON ?auto_6235 ?auto_6234 ) ( not ( = ?auto_6234 ?auto_6235 ) ) ( not ( = ?auto_6234 ?auto_6236 ) ) ( ON ?auto_6234 ?auto_6233 ) ( not ( = ?auto_6233 ?auto_6234 ) ) ( not ( = ?auto_6233 ?auto_6235 ) ) ( not ( = ?auto_6233 ?auto_6236 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6234 ?auto_6235 ?auto_6236 )
      ( MAKE-3CRATE-VERIFY ?auto_6233 ?auto_6234 ?auto_6235 ?auto_6236 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6240 - SURFACE
      ?auto_6241 - SURFACE
      ?auto_6242 - SURFACE
      ?auto_6243 - SURFACE
      ?auto_6244 - SURFACE
    )
    :vars
    (
      ?auto_6247 - HOIST
      ?auto_6245 - PLACE
      ?auto_6246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6247 ?auto_6245 ) ( SURFACE-AT ?auto_6243 ?auto_6245 ) ( CLEAR ?auto_6243 ) ( IS-CRATE ?auto_6244 ) ( not ( = ?auto_6243 ?auto_6244 ) ) ( TRUCK-AT ?auto_6246 ?auto_6245 ) ( AVAILABLE ?auto_6247 ) ( IN ?auto_6244 ?auto_6246 ) ( ON ?auto_6243 ?auto_6242 ) ( not ( = ?auto_6242 ?auto_6243 ) ) ( not ( = ?auto_6242 ?auto_6244 ) ) ( ON ?auto_6241 ?auto_6240 ) ( ON ?auto_6242 ?auto_6241 ) ( not ( = ?auto_6240 ?auto_6241 ) ) ( not ( = ?auto_6240 ?auto_6242 ) ) ( not ( = ?auto_6240 ?auto_6243 ) ) ( not ( = ?auto_6240 ?auto_6244 ) ) ( not ( = ?auto_6241 ?auto_6242 ) ) ( not ( = ?auto_6241 ?auto_6243 ) ) ( not ( = ?auto_6241 ?auto_6244 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6242 ?auto_6243 ?auto_6244 )
      ( MAKE-4CRATE-VERIFY ?auto_6240 ?auto_6241 ?auto_6242 ?auto_6243 ?auto_6244 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6248 - SURFACE
      ?auto_6249 - SURFACE
    )
    :vars
    (
      ?auto_6252 - HOIST
      ?auto_6250 - PLACE
      ?auto_6251 - TRUCK
      ?auto_6253 - SURFACE
      ?auto_6254 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6252 ?auto_6250 ) ( SURFACE-AT ?auto_6248 ?auto_6250 ) ( CLEAR ?auto_6248 ) ( IS-CRATE ?auto_6249 ) ( not ( = ?auto_6248 ?auto_6249 ) ) ( AVAILABLE ?auto_6252 ) ( IN ?auto_6249 ?auto_6251 ) ( ON ?auto_6248 ?auto_6253 ) ( not ( = ?auto_6253 ?auto_6248 ) ) ( not ( = ?auto_6253 ?auto_6249 ) ) ( TRUCK-AT ?auto_6251 ?auto_6254 ) ( not ( = ?auto_6254 ?auto_6250 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6251 ?auto_6254 ?auto_6250 )
      ( MAKE-2CRATE ?auto_6253 ?auto_6248 ?auto_6249 )
      ( MAKE-1CRATE-VERIFY ?auto_6248 ?auto_6249 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6255 - SURFACE
      ?auto_6256 - SURFACE
      ?auto_6257 - SURFACE
    )
    :vars
    (
      ?auto_6259 - HOIST
      ?auto_6261 - PLACE
      ?auto_6258 - TRUCK
      ?auto_6260 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6259 ?auto_6261 ) ( SURFACE-AT ?auto_6256 ?auto_6261 ) ( CLEAR ?auto_6256 ) ( IS-CRATE ?auto_6257 ) ( not ( = ?auto_6256 ?auto_6257 ) ) ( AVAILABLE ?auto_6259 ) ( IN ?auto_6257 ?auto_6258 ) ( ON ?auto_6256 ?auto_6255 ) ( not ( = ?auto_6255 ?auto_6256 ) ) ( not ( = ?auto_6255 ?auto_6257 ) ) ( TRUCK-AT ?auto_6258 ?auto_6260 ) ( not ( = ?auto_6260 ?auto_6261 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6256 ?auto_6257 )
      ( MAKE-2CRATE-VERIFY ?auto_6255 ?auto_6256 ?auto_6257 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6262 - SURFACE
      ?auto_6263 - SURFACE
      ?auto_6264 - SURFACE
      ?auto_6265 - SURFACE
    )
    :vars
    (
      ?auto_6267 - HOIST
      ?auto_6266 - PLACE
      ?auto_6269 - TRUCK
      ?auto_6268 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6267 ?auto_6266 ) ( SURFACE-AT ?auto_6264 ?auto_6266 ) ( CLEAR ?auto_6264 ) ( IS-CRATE ?auto_6265 ) ( not ( = ?auto_6264 ?auto_6265 ) ) ( AVAILABLE ?auto_6267 ) ( IN ?auto_6265 ?auto_6269 ) ( ON ?auto_6264 ?auto_6263 ) ( not ( = ?auto_6263 ?auto_6264 ) ) ( not ( = ?auto_6263 ?auto_6265 ) ) ( TRUCK-AT ?auto_6269 ?auto_6268 ) ( not ( = ?auto_6268 ?auto_6266 ) ) ( ON ?auto_6263 ?auto_6262 ) ( not ( = ?auto_6262 ?auto_6263 ) ) ( not ( = ?auto_6262 ?auto_6264 ) ) ( not ( = ?auto_6262 ?auto_6265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6263 ?auto_6264 ?auto_6265 )
      ( MAKE-3CRATE-VERIFY ?auto_6262 ?auto_6263 ?auto_6264 ?auto_6265 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6270 - SURFACE
      ?auto_6271 - SURFACE
      ?auto_6272 - SURFACE
      ?auto_6273 - SURFACE
      ?auto_6274 - SURFACE
    )
    :vars
    (
      ?auto_6276 - HOIST
      ?auto_6275 - PLACE
      ?auto_6278 - TRUCK
      ?auto_6277 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6276 ?auto_6275 ) ( SURFACE-AT ?auto_6273 ?auto_6275 ) ( CLEAR ?auto_6273 ) ( IS-CRATE ?auto_6274 ) ( not ( = ?auto_6273 ?auto_6274 ) ) ( AVAILABLE ?auto_6276 ) ( IN ?auto_6274 ?auto_6278 ) ( ON ?auto_6273 ?auto_6272 ) ( not ( = ?auto_6272 ?auto_6273 ) ) ( not ( = ?auto_6272 ?auto_6274 ) ) ( TRUCK-AT ?auto_6278 ?auto_6277 ) ( not ( = ?auto_6277 ?auto_6275 ) ) ( ON ?auto_6271 ?auto_6270 ) ( ON ?auto_6272 ?auto_6271 ) ( not ( = ?auto_6270 ?auto_6271 ) ) ( not ( = ?auto_6270 ?auto_6272 ) ) ( not ( = ?auto_6270 ?auto_6273 ) ) ( not ( = ?auto_6270 ?auto_6274 ) ) ( not ( = ?auto_6271 ?auto_6272 ) ) ( not ( = ?auto_6271 ?auto_6273 ) ) ( not ( = ?auto_6271 ?auto_6274 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6272 ?auto_6273 ?auto_6274 )
      ( MAKE-4CRATE-VERIFY ?auto_6270 ?auto_6271 ?auto_6272 ?auto_6273 ?auto_6274 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6279 - SURFACE
      ?auto_6280 - SURFACE
    )
    :vars
    (
      ?auto_6282 - HOIST
      ?auto_6281 - PLACE
      ?auto_6285 - SURFACE
      ?auto_6284 - TRUCK
      ?auto_6283 - PLACE
      ?auto_6286 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6282 ?auto_6281 ) ( SURFACE-AT ?auto_6279 ?auto_6281 ) ( CLEAR ?auto_6279 ) ( IS-CRATE ?auto_6280 ) ( not ( = ?auto_6279 ?auto_6280 ) ) ( AVAILABLE ?auto_6282 ) ( ON ?auto_6279 ?auto_6285 ) ( not ( = ?auto_6285 ?auto_6279 ) ) ( not ( = ?auto_6285 ?auto_6280 ) ) ( TRUCK-AT ?auto_6284 ?auto_6283 ) ( not ( = ?auto_6283 ?auto_6281 ) ) ( HOIST-AT ?auto_6286 ?auto_6283 ) ( LIFTING ?auto_6286 ?auto_6280 ) ( not ( = ?auto_6282 ?auto_6286 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6286 ?auto_6280 ?auto_6284 ?auto_6283 )
      ( MAKE-2CRATE ?auto_6285 ?auto_6279 ?auto_6280 )
      ( MAKE-1CRATE-VERIFY ?auto_6279 ?auto_6280 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6287 - SURFACE
      ?auto_6288 - SURFACE
      ?auto_6289 - SURFACE
    )
    :vars
    (
      ?auto_6294 - HOIST
      ?auto_6290 - PLACE
      ?auto_6291 - TRUCK
      ?auto_6292 - PLACE
      ?auto_6293 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6294 ?auto_6290 ) ( SURFACE-AT ?auto_6288 ?auto_6290 ) ( CLEAR ?auto_6288 ) ( IS-CRATE ?auto_6289 ) ( not ( = ?auto_6288 ?auto_6289 ) ) ( AVAILABLE ?auto_6294 ) ( ON ?auto_6288 ?auto_6287 ) ( not ( = ?auto_6287 ?auto_6288 ) ) ( not ( = ?auto_6287 ?auto_6289 ) ) ( TRUCK-AT ?auto_6291 ?auto_6292 ) ( not ( = ?auto_6292 ?auto_6290 ) ) ( HOIST-AT ?auto_6293 ?auto_6292 ) ( LIFTING ?auto_6293 ?auto_6289 ) ( not ( = ?auto_6294 ?auto_6293 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6288 ?auto_6289 )
      ( MAKE-2CRATE-VERIFY ?auto_6287 ?auto_6288 ?auto_6289 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6295 - SURFACE
      ?auto_6296 - SURFACE
      ?auto_6297 - SURFACE
      ?auto_6298 - SURFACE
    )
    :vars
    (
      ?auto_6300 - HOIST
      ?auto_6299 - PLACE
      ?auto_6303 - TRUCK
      ?auto_6301 - PLACE
      ?auto_6302 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6300 ?auto_6299 ) ( SURFACE-AT ?auto_6297 ?auto_6299 ) ( CLEAR ?auto_6297 ) ( IS-CRATE ?auto_6298 ) ( not ( = ?auto_6297 ?auto_6298 ) ) ( AVAILABLE ?auto_6300 ) ( ON ?auto_6297 ?auto_6296 ) ( not ( = ?auto_6296 ?auto_6297 ) ) ( not ( = ?auto_6296 ?auto_6298 ) ) ( TRUCK-AT ?auto_6303 ?auto_6301 ) ( not ( = ?auto_6301 ?auto_6299 ) ) ( HOIST-AT ?auto_6302 ?auto_6301 ) ( LIFTING ?auto_6302 ?auto_6298 ) ( not ( = ?auto_6300 ?auto_6302 ) ) ( ON ?auto_6296 ?auto_6295 ) ( not ( = ?auto_6295 ?auto_6296 ) ) ( not ( = ?auto_6295 ?auto_6297 ) ) ( not ( = ?auto_6295 ?auto_6298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6296 ?auto_6297 ?auto_6298 )
      ( MAKE-3CRATE-VERIFY ?auto_6295 ?auto_6296 ?auto_6297 ?auto_6298 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6304 - SURFACE
      ?auto_6305 - SURFACE
      ?auto_6306 - SURFACE
      ?auto_6307 - SURFACE
      ?auto_6308 - SURFACE
    )
    :vars
    (
      ?auto_6310 - HOIST
      ?auto_6309 - PLACE
      ?auto_6313 - TRUCK
      ?auto_6311 - PLACE
      ?auto_6312 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6310 ?auto_6309 ) ( SURFACE-AT ?auto_6307 ?auto_6309 ) ( CLEAR ?auto_6307 ) ( IS-CRATE ?auto_6308 ) ( not ( = ?auto_6307 ?auto_6308 ) ) ( AVAILABLE ?auto_6310 ) ( ON ?auto_6307 ?auto_6306 ) ( not ( = ?auto_6306 ?auto_6307 ) ) ( not ( = ?auto_6306 ?auto_6308 ) ) ( TRUCK-AT ?auto_6313 ?auto_6311 ) ( not ( = ?auto_6311 ?auto_6309 ) ) ( HOIST-AT ?auto_6312 ?auto_6311 ) ( LIFTING ?auto_6312 ?auto_6308 ) ( not ( = ?auto_6310 ?auto_6312 ) ) ( ON ?auto_6305 ?auto_6304 ) ( ON ?auto_6306 ?auto_6305 ) ( not ( = ?auto_6304 ?auto_6305 ) ) ( not ( = ?auto_6304 ?auto_6306 ) ) ( not ( = ?auto_6304 ?auto_6307 ) ) ( not ( = ?auto_6304 ?auto_6308 ) ) ( not ( = ?auto_6305 ?auto_6306 ) ) ( not ( = ?auto_6305 ?auto_6307 ) ) ( not ( = ?auto_6305 ?auto_6308 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6306 ?auto_6307 ?auto_6308 )
      ( MAKE-4CRATE-VERIFY ?auto_6304 ?auto_6305 ?auto_6306 ?auto_6307 ?auto_6308 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6314 - SURFACE
      ?auto_6315 - SURFACE
    )
    :vars
    (
      ?auto_6317 - HOIST
      ?auto_6316 - PLACE
      ?auto_6321 - SURFACE
      ?auto_6320 - TRUCK
      ?auto_6318 - PLACE
      ?auto_6319 - HOIST
      ?auto_6322 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6317 ?auto_6316 ) ( SURFACE-AT ?auto_6314 ?auto_6316 ) ( CLEAR ?auto_6314 ) ( IS-CRATE ?auto_6315 ) ( not ( = ?auto_6314 ?auto_6315 ) ) ( AVAILABLE ?auto_6317 ) ( ON ?auto_6314 ?auto_6321 ) ( not ( = ?auto_6321 ?auto_6314 ) ) ( not ( = ?auto_6321 ?auto_6315 ) ) ( TRUCK-AT ?auto_6320 ?auto_6318 ) ( not ( = ?auto_6318 ?auto_6316 ) ) ( HOIST-AT ?auto_6319 ?auto_6318 ) ( not ( = ?auto_6317 ?auto_6319 ) ) ( AVAILABLE ?auto_6319 ) ( SURFACE-AT ?auto_6315 ?auto_6318 ) ( ON ?auto_6315 ?auto_6322 ) ( CLEAR ?auto_6315 ) ( not ( = ?auto_6314 ?auto_6322 ) ) ( not ( = ?auto_6315 ?auto_6322 ) ) ( not ( = ?auto_6321 ?auto_6322 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6319 ?auto_6315 ?auto_6322 ?auto_6318 )
      ( MAKE-2CRATE ?auto_6321 ?auto_6314 ?auto_6315 )
      ( MAKE-1CRATE-VERIFY ?auto_6314 ?auto_6315 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6323 - SURFACE
      ?auto_6324 - SURFACE
      ?auto_6325 - SURFACE
    )
    :vars
    (
      ?auto_6328 - HOIST
      ?auto_6326 - PLACE
      ?auto_6330 - TRUCK
      ?auto_6331 - PLACE
      ?auto_6329 - HOIST
      ?auto_6327 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6328 ?auto_6326 ) ( SURFACE-AT ?auto_6324 ?auto_6326 ) ( CLEAR ?auto_6324 ) ( IS-CRATE ?auto_6325 ) ( not ( = ?auto_6324 ?auto_6325 ) ) ( AVAILABLE ?auto_6328 ) ( ON ?auto_6324 ?auto_6323 ) ( not ( = ?auto_6323 ?auto_6324 ) ) ( not ( = ?auto_6323 ?auto_6325 ) ) ( TRUCK-AT ?auto_6330 ?auto_6331 ) ( not ( = ?auto_6331 ?auto_6326 ) ) ( HOIST-AT ?auto_6329 ?auto_6331 ) ( not ( = ?auto_6328 ?auto_6329 ) ) ( AVAILABLE ?auto_6329 ) ( SURFACE-AT ?auto_6325 ?auto_6331 ) ( ON ?auto_6325 ?auto_6327 ) ( CLEAR ?auto_6325 ) ( not ( = ?auto_6324 ?auto_6327 ) ) ( not ( = ?auto_6325 ?auto_6327 ) ) ( not ( = ?auto_6323 ?auto_6327 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6324 ?auto_6325 )
      ( MAKE-2CRATE-VERIFY ?auto_6323 ?auto_6324 ?auto_6325 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6332 - SURFACE
      ?auto_6333 - SURFACE
      ?auto_6334 - SURFACE
      ?auto_6335 - SURFACE
    )
    :vars
    (
      ?auto_6340 - HOIST
      ?auto_6339 - PLACE
      ?auto_6337 - TRUCK
      ?auto_6341 - PLACE
      ?auto_6338 - HOIST
      ?auto_6336 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6340 ?auto_6339 ) ( SURFACE-AT ?auto_6334 ?auto_6339 ) ( CLEAR ?auto_6334 ) ( IS-CRATE ?auto_6335 ) ( not ( = ?auto_6334 ?auto_6335 ) ) ( AVAILABLE ?auto_6340 ) ( ON ?auto_6334 ?auto_6333 ) ( not ( = ?auto_6333 ?auto_6334 ) ) ( not ( = ?auto_6333 ?auto_6335 ) ) ( TRUCK-AT ?auto_6337 ?auto_6341 ) ( not ( = ?auto_6341 ?auto_6339 ) ) ( HOIST-AT ?auto_6338 ?auto_6341 ) ( not ( = ?auto_6340 ?auto_6338 ) ) ( AVAILABLE ?auto_6338 ) ( SURFACE-AT ?auto_6335 ?auto_6341 ) ( ON ?auto_6335 ?auto_6336 ) ( CLEAR ?auto_6335 ) ( not ( = ?auto_6334 ?auto_6336 ) ) ( not ( = ?auto_6335 ?auto_6336 ) ) ( not ( = ?auto_6333 ?auto_6336 ) ) ( ON ?auto_6333 ?auto_6332 ) ( not ( = ?auto_6332 ?auto_6333 ) ) ( not ( = ?auto_6332 ?auto_6334 ) ) ( not ( = ?auto_6332 ?auto_6335 ) ) ( not ( = ?auto_6332 ?auto_6336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6333 ?auto_6334 ?auto_6335 )
      ( MAKE-3CRATE-VERIFY ?auto_6332 ?auto_6333 ?auto_6334 ?auto_6335 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6342 - SURFACE
      ?auto_6343 - SURFACE
      ?auto_6344 - SURFACE
      ?auto_6345 - SURFACE
      ?auto_6346 - SURFACE
    )
    :vars
    (
      ?auto_6351 - HOIST
      ?auto_6350 - PLACE
      ?auto_6348 - TRUCK
      ?auto_6352 - PLACE
      ?auto_6349 - HOIST
      ?auto_6347 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6351 ?auto_6350 ) ( SURFACE-AT ?auto_6345 ?auto_6350 ) ( CLEAR ?auto_6345 ) ( IS-CRATE ?auto_6346 ) ( not ( = ?auto_6345 ?auto_6346 ) ) ( AVAILABLE ?auto_6351 ) ( ON ?auto_6345 ?auto_6344 ) ( not ( = ?auto_6344 ?auto_6345 ) ) ( not ( = ?auto_6344 ?auto_6346 ) ) ( TRUCK-AT ?auto_6348 ?auto_6352 ) ( not ( = ?auto_6352 ?auto_6350 ) ) ( HOIST-AT ?auto_6349 ?auto_6352 ) ( not ( = ?auto_6351 ?auto_6349 ) ) ( AVAILABLE ?auto_6349 ) ( SURFACE-AT ?auto_6346 ?auto_6352 ) ( ON ?auto_6346 ?auto_6347 ) ( CLEAR ?auto_6346 ) ( not ( = ?auto_6345 ?auto_6347 ) ) ( not ( = ?auto_6346 ?auto_6347 ) ) ( not ( = ?auto_6344 ?auto_6347 ) ) ( ON ?auto_6343 ?auto_6342 ) ( ON ?auto_6344 ?auto_6343 ) ( not ( = ?auto_6342 ?auto_6343 ) ) ( not ( = ?auto_6342 ?auto_6344 ) ) ( not ( = ?auto_6342 ?auto_6345 ) ) ( not ( = ?auto_6342 ?auto_6346 ) ) ( not ( = ?auto_6342 ?auto_6347 ) ) ( not ( = ?auto_6343 ?auto_6344 ) ) ( not ( = ?auto_6343 ?auto_6345 ) ) ( not ( = ?auto_6343 ?auto_6346 ) ) ( not ( = ?auto_6343 ?auto_6347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6344 ?auto_6345 ?auto_6346 )
      ( MAKE-4CRATE-VERIFY ?auto_6342 ?auto_6343 ?auto_6344 ?auto_6345 ?auto_6346 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6353 - SURFACE
      ?auto_6354 - SURFACE
    )
    :vars
    (
      ?auto_6359 - HOIST
      ?auto_6358 - PLACE
      ?auto_6361 - SURFACE
      ?auto_6360 - PLACE
      ?auto_6357 - HOIST
      ?auto_6355 - SURFACE
      ?auto_6356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6359 ?auto_6358 ) ( SURFACE-AT ?auto_6353 ?auto_6358 ) ( CLEAR ?auto_6353 ) ( IS-CRATE ?auto_6354 ) ( not ( = ?auto_6353 ?auto_6354 ) ) ( AVAILABLE ?auto_6359 ) ( ON ?auto_6353 ?auto_6361 ) ( not ( = ?auto_6361 ?auto_6353 ) ) ( not ( = ?auto_6361 ?auto_6354 ) ) ( not ( = ?auto_6360 ?auto_6358 ) ) ( HOIST-AT ?auto_6357 ?auto_6360 ) ( not ( = ?auto_6359 ?auto_6357 ) ) ( AVAILABLE ?auto_6357 ) ( SURFACE-AT ?auto_6354 ?auto_6360 ) ( ON ?auto_6354 ?auto_6355 ) ( CLEAR ?auto_6354 ) ( not ( = ?auto_6353 ?auto_6355 ) ) ( not ( = ?auto_6354 ?auto_6355 ) ) ( not ( = ?auto_6361 ?auto_6355 ) ) ( TRUCK-AT ?auto_6356 ?auto_6358 ) )
    :subtasks
    ( ( !DRIVE ?auto_6356 ?auto_6358 ?auto_6360 )
      ( MAKE-2CRATE ?auto_6361 ?auto_6353 ?auto_6354 )
      ( MAKE-1CRATE-VERIFY ?auto_6353 ?auto_6354 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6362 - SURFACE
      ?auto_6363 - SURFACE
      ?auto_6364 - SURFACE
    )
    :vars
    (
      ?auto_6365 - HOIST
      ?auto_6370 - PLACE
      ?auto_6367 - PLACE
      ?auto_6366 - HOIST
      ?auto_6368 - SURFACE
      ?auto_6369 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6365 ?auto_6370 ) ( SURFACE-AT ?auto_6363 ?auto_6370 ) ( CLEAR ?auto_6363 ) ( IS-CRATE ?auto_6364 ) ( not ( = ?auto_6363 ?auto_6364 ) ) ( AVAILABLE ?auto_6365 ) ( ON ?auto_6363 ?auto_6362 ) ( not ( = ?auto_6362 ?auto_6363 ) ) ( not ( = ?auto_6362 ?auto_6364 ) ) ( not ( = ?auto_6367 ?auto_6370 ) ) ( HOIST-AT ?auto_6366 ?auto_6367 ) ( not ( = ?auto_6365 ?auto_6366 ) ) ( AVAILABLE ?auto_6366 ) ( SURFACE-AT ?auto_6364 ?auto_6367 ) ( ON ?auto_6364 ?auto_6368 ) ( CLEAR ?auto_6364 ) ( not ( = ?auto_6363 ?auto_6368 ) ) ( not ( = ?auto_6364 ?auto_6368 ) ) ( not ( = ?auto_6362 ?auto_6368 ) ) ( TRUCK-AT ?auto_6369 ?auto_6370 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6363 ?auto_6364 )
      ( MAKE-2CRATE-VERIFY ?auto_6362 ?auto_6363 ?auto_6364 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6371 - SURFACE
      ?auto_6372 - SURFACE
      ?auto_6373 - SURFACE
      ?auto_6374 - SURFACE
    )
    :vars
    (
      ?auto_6377 - HOIST
      ?auto_6379 - PLACE
      ?auto_6380 - PLACE
      ?auto_6378 - HOIST
      ?auto_6376 - SURFACE
      ?auto_6375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6377 ?auto_6379 ) ( SURFACE-AT ?auto_6373 ?auto_6379 ) ( CLEAR ?auto_6373 ) ( IS-CRATE ?auto_6374 ) ( not ( = ?auto_6373 ?auto_6374 ) ) ( AVAILABLE ?auto_6377 ) ( ON ?auto_6373 ?auto_6372 ) ( not ( = ?auto_6372 ?auto_6373 ) ) ( not ( = ?auto_6372 ?auto_6374 ) ) ( not ( = ?auto_6380 ?auto_6379 ) ) ( HOIST-AT ?auto_6378 ?auto_6380 ) ( not ( = ?auto_6377 ?auto_6378 ) ) ( AVAILABLE ?auto_6378 ) ( SURFACE-AT ?auto_6374 ?auto_6380 ) ( ON ?auto_6374 ?auto_6376 ) ( CLEAR ?auto_6374 ) ( not ( = ?auto_6373 ?auto_6376 ) ) ( not ( = ?auto_6374 ?auto_6376 ) ) ( not ( = ?auto_6372 ?auto_6376 ) ) ( TRUCK-AT ?auto_6375 ?auto_6379 ) ( ON ?auto_6372 ?auto_6371 ) ( not ( = ?auto_6371 ?auto_6372 ) ) ( not ( = ?auto_6371 ?auto_6373 ) ) ( not ( = ?auto_6371 ?auto_6374 ) ) ( not ( = ?auto_6371 ?auto_6376 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6372 ?auto_6373 ?auto_6374 )
      ( MAKE-3CRATE-VERIFY ?auto_6371 ?auto_6372 ?auto_6373 ?auto_6374 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6381 - SURFACE
      ?auto_6382 - SURFACE
      ?auto_6383 - SURFACE
      ?auto_6384 - SURFACE
      ?auto_6385 - SURFACE
    )
    :vars
    (
      ?auto_6388 - HOIST
      ?auto_6390 - PLACE
      ?auto_6391 - PLACE
      ?auto_6389 - HOIST
      ?auto_6387 - SURFACE
      ?auto_6386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6388 ?auto_6390 ) ( SURFACE-AT ?auto_6384 ?auto_6390 ) ( CLEAR ?auto_6384 ) ( IS-CRATE ?auto_6385 ) ( not ( = ?auto_6384 ?auto_6385 ) ) ( AVAILABLE ?auto_6388 ) ( ON ?auto_6384 ?auto_6383 ) ( not ( = ?auto_6383 ?auto_6384 ) ) ( not ( = ?auto_6383 ?auto_6385 ) ) ( not ( = ?auto_6391 ?auto_6390 ) ) ( HOIST-AT ?auto_6389 ?auto_6391 ) ( not ( = ?auto_6388 ?auto_6389 ) ) ( AVAILABLE ?auto_6389 ) ( SURFACE-AT ?auto_6385 ?auto_6391 ) ( ON ?auto_6385 ?auto_6387 ) ( CLEAR ?auto_6385 ) ( not ( = ?auto_6384 ?auto_6387 ) ) ( not ( = ?auto_6385 ?auto_6387 ) ) ( not ( = ?auto_6383 ?auto_6387 ) ) ( TRUCK-AT ?auto_6386 ?auto_6390 ) ( ON ?auto_6382 ?auto_6381 ) ( ON ?auto_6383 ?auto_6382 ) ( not ( = ?auto_6381 ?auto_6382 ) ) ( not ( = ?auto_6381 ?auto_6383 ) ) ( not ( = ?auto_6381 ?auto_6384 ) ) ( not ( = ?auto_6381 ?auto_6385 ) ) ( not ( = ?auto_6381 ?auto_6387 ) ) ( not ( = ?auto_6382 ?auto_6383 ) ) ( not ( = ?auto_6382 ?auto_6384 ) ) ( not ( = ?auto_6382 ?auto_6385 ) ) ( not ( = ?auto_6382 ?auto_6387 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6383 ?auto_6384 ?auto_6385 )
      ( MAKE-4CRATE-VERIFY ?auto_6381 ?auto_6382 ?auto_6383 ?auto_6384 ?auto_6385 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6392 - SURFACE
      ?auto_6393 - SURFACE
    )
    :vars
    (
      ?auto_6396 - HOIST
      ?auto_6398 - PLACE
      ?auto_6400 - SURFACE
      ?auto_6399 - PLACE
      ?auto_6397 - HOIST
      ?auto_6395 - SURFACE
      ?auto_6394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6396 ?auto_6398 ) ( IS-CRATE ?auto_6393 ) ( not ( = ?auto_6392 ?auto_6393 ) ) ( not ( = ?auto_6400 ?auto_6392 ) ) ( not ( = ?auto_6400 ?auto_6393 ) ) ( not ( = ?auto_6399 ?auto_6398 ) ) ( HOIST-AT ?auto_6397 ?auto_6399 ) ( not ( = ?auto_6396 ?auto_6397 ) ) ( AVAILABLE ?auto_6397 ) ( SURFACE-AT ?auto_6393 ?auto_6399 ) ( ON ?auto_6393 ?auto_6395 ) ( CLEAR ?auto_6393 ) ( not ( = ?auto_6392 ?auto_6395 ) ) ( not ( = ?auto_6393 ?auto_6395 ) ) ( not ( = ?auto_6400 ?auto_6395 ) ) ( TRUCK-AT ?auto_6394 ?auto_6398 ) ( SURFACE-AT ?auto_6400 ?auto_6398 ) ( CLEAR ?auto_6400 ) ( LIFTING ?auto_6396 ?auto_6392 ) ( IS-CRATE ?auto_6392 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6400 ?auto_6392 )
      ( MAKE-2CRATE ?auto_6400 ?auto_6392 ?auto_6393 )
      ( MAKE-1CRATE-VERIFY ?auto_6392 ?auto_6393 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6401 - SURFACE
      ?auto_6402 - SURFACE
      ?auto_6403 - SURFACE
    )
    :vars
    (
      ?auto_6407 - HOIST
      ?auto_6406 - PLACE
      ?auto_6404 - PLACE
      ?auto_6405 - HOIST
      ?auto_6408 - SURFACE
      ?auto_6409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6407 ?auto_6406 ) ( IS-CRATE ?auto_6403 ) ( not ( = ?auto_6402 ?auto_6403 ) ) ( not ( = ?auto_6401 ?auto_6402 ) ) ( not ( = ?auto_6401 ?auto_6403 ) ) ( not ( = ?auto_6404 ?auto_6406 ) ) ( HOIST-AT ?auto_6405 ?auto_6404 ) ( not ( = ?auto_6407 ?auto_6405 ) ) ( AVAILABLE ?auto_6405 ) ( SURFACE-AT ?auto_6403 ?auto_6404 ) ( ON ?auto_6403 ?auto_6408 ) ( CLEAR ?auto_6403 ) ( not ( = ?auto_6402 ?auto_6408 ) ) ( not ( = ?auto_6403 ?auto_6408 ) ) ( not ( = ?auto_6401 ?auto_6408 ) ) ( TRUCK-AT ?auto_6409 ?auto_6406 ) ( SURFACE-AT ?auto_6401 ?auto_6406 ) ( CLEAR ?auto_6401 ) ( LIFTING ?auto_6407 ?auto_6402 ) ( IS-CRATE ?auto_6402 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6402 ?auto_6403 )
      ( MAKE-2CRATE-VERIFY ?auto_6401 ?auto_6402 ?auto_6403 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6410 - SURFACE
      ?auto_6411 - SURFACE
      ?auto_6412 - SURFACE
      ?auto_6413 - SURFACE
    )
    :vars
    (
      ?auto_6419 - HOIST
      ?auto_6417 - PLACE
      ?auto_6414 - PLACE
      ?auto_6416 - HOIST
      ?auto_6418 - SURFACE
      ?auto_6415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6419 ?auto_6417 ) ( IS-CRATE ?auto_6413 ) ( not ( = ?auto_6412 ?auto_6413 ) ) ( not ( = ?auto_6411 ?auto_6412 ) ) ( not ( = ?auto_6411 ?auto_6413 ) ) ( not ( = ?auto_6414 ?auto_6417 ) ) ( HOIST-AT ?auto_6416 ?auto_6414 ) ( not ( = ?auto_6419 ?auto_6416 ) ) ( AVAILABLE ?auto_6416 ) ( SURFACE-AT ?auto_6413 ?auto_6414 ) ( ON ?auto_6413 ?auto_6418 ) ( CLEAR ?auto_6413 ) ( not ( = ?auto_6412 ?auto_6418 ) ) ( not ( = ?auto_6413 ?auto_6418 ) ) ( not ( = ?auto_6411 ?auto_6418 ) ) ( TRUCK-AT ?auto_6415 ?auto_6417 ) ( SURFACE-AT ?auto_6411 ?auto_6417 ) ( CLEAR ?auto_6411 ) ( LIFTING ?auto_6419 ?auto_6412 ) ( IS-CRATE ?auto_6412 ) ( ON ?auto_6411 ?auto_6410 ) ( not ( = ?auto_6410 ?auto_6411 ) ) ( not ( = ?auto_6410 ?auto_6412 ) ) ( not ( = ?auto_6410 ?auto_6413 ) ) ( not ( = ?auto_6410 ?auto_6418 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6411 ?auto_6412 ?auto_6413 )
      ( MAKE-3CRATE-VERIFY ?auto_6410 ?auto_6411 ?auto_6412 ?auto_6413 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6420 - SURFACE
      ?auto_6421 - SURFACE
      ?auto_6422 - SURFACE
      ?auto_6423 - SURFACE
      ?auto_6424 - SURFACE
    )
    :vars
    (
      ?auto_6430 - HOIST
      ?auto_6428 - PLACE
      ?auto_6425 - PLACE
      ?auto_6427 - HOIST
      ?auto_6429 - SURFACE
      ?auto_6426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6430 ?auto_6428 ) ( IS-CRATE ?auto_6424 ) ( not ( = ?auto_6423 ?auto_6424 ) ) ( not ( = ?auto_6422 ?auto_6423 ) ) ( not ( = ?auto_6422 ?auto_6424 ) ) ( not ( = ?auto_6425 ?auto_6428 ) ) ( HOIST-AT ?auto_6427 ?auto_6425 ) ( not ( = ?auto_6430 ?auto_6427 ) ) ( AVAILABLE ?auto_6427 ) ( SURFACE-AT ?auto_6424 ?auto_6425 ) ( ON ?auto_6424 ?auto_6429 ) ( CLEAR ?auto_6424 ) ( not ( = ?auto_6423 ?auto_6429 ) ) ( not ( = ?auto_6424 ?auto_6429 ) ) ( not ( = ?auto_6422 ?auto_6429 ) ) ( TRUCK-AT ?auto_6426 ?auto_6428 ) ( SURFACE-AT ?auto_6422 ?auto_6428 ) ( CLEAR ?auto_6422 ) ( LIFTING ?auto_6430 ?auto_6423 ) ( IS-CRATE ?auto_6423 ) ( ON ?auto_6421 ?auto_6420 ) ( ON ?auto_6422 ?auto_6421 ) ( not ( = ?auto_6420 ?auto_6421 ) ) ( not ( = ?auto_6420 ?auto_6422 ) ) ( not ( = ?auto_6420 ?auto_6423 ) ) ( not ( = ?auto_6420 ?auto_6424 ) ) ( not ( = ?auto_6420 ?auto_6429 ) ) ( not ( = ?auto_6421 ?auto_6422 ) ) ( not ( = ?auto_6421 ?auto_6423 ) ) ( not ( = ?auto_6421 ?auto_6424 ) ) ( not ( = ?auto_6421 ?auto_6429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6422 ?auto_6423 ?auto_6424 )
      ( MAKE-4CRATE-VERIFY ?auto_6420 ?auto_6421 ?auto_6422 ?auto_6423 ?auto_6424 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6431 - SURFACE
      ?auto_6432 - SURFACE
    )
    :vars
    (
      ?auto_6438 - HOIST
      ?auto_6436 - PLACE
      ?auto_6439 - SURFACE
      ?auto_6433 - PLACE
      ?auto_6435 - HOIST
      ?auto_6437 - SURFACE
      ?auto_6434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6438 ?auto_6436 ) ( IS-CRATE ?auto_6432 ) ( not ( = ?auto_6431 ?auto_6432 ) ) ( not ( = ?auto_6439 ?auto_6431 ) ) ( not ( = ?auto_6439 ?auto_6432 ) ) ( not ( = ?auto_6433 ?auto_6436 ) ) ( HOIST-AT ?auto_6435 ?auto_6433 ) ( not ( = ?auto_6438 ?auto_6435 ) ) ( AVAILABLE ?auto_6435 ) ( SURFACE-AT ?auto_6432 ?auto_6433 ) ( ON ?auto_6432 ?auto_6437 ) ( CLEAR ?auto_6432 ) ( not ( = ?auto_6431 ?auto_6437 ) ) ( not ( = ?auto_6432 ?auto_6437 ) ) ( not ( = ?auto_6439 ?auto_6437 ) ) ( TRUCK-AT ?auto_6434 ?auto_6436 ) ( SURFACE-AT ?auto_6439 ?auto_6436 ) ( CLEAR ?auto_6439 ) ( IS-CRATE ?auto_6431 ) ( AVAILABLE ?auto_6438 ) ( IN ?auto_6431 ?auto_6434 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6438 ?auto_6431 ?auto_6434 ?auto_6436 )
      ( MAKE-2CRATE ?auto_6439 ?auto_6431 ?auto_6432 )
      ( MAKE-1CRATE-VERIFY ?auto_6431 ?auto_6432 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6440 - SURFACE
      ?auto_6441 - SURFACE
      ?auto_6442 - SURFACE
    )
    :vars
    (
      ?auto_6445 - HOIST
      ?auto_6443 - PLACE
      ?auto_6446 - PLACE
      ?auto_6448 - HOIST
      ?auto_6444 - SURFACE
      ?auto_6447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6445 ?auto_6443 ) ( IS-CRATE ?auto_6442 ) ( not ( = ?auto_6441 ?auto_6442 ) ) ( not ( = ?auto_6440 ?auto_6441 ) ) ( not ( = ?auto_6440 ?auto_6442 ) ) ( not ( = ?auto_6446 ?auto_6443 ) ) ( HOIST-AT ?auto_6448 ?auto_6446 ) ( not ( = ?auto_6445 ?auto_6448 ) ) ( AVAILABLE ?auto_6448 ) ( SURFACE-AT ?auto_6442 ?auto_6446 ) ( ON ?auto_6442 ?auto_6444 ) ( CLEAR ?auto_6442 ) ( not ( = ?auto_6441 ?auto_6444 ) ) ( not ( = ?auto_6442 ?auto_6444 ) ) ( not ( = ?auto_6440 ?auto_6444 ) ) ( TRUCK-AT ?auto_6447 ?auto_6443 ) ( SURFACE-AT ?auto_6440 ?auto_6443 ) ( CLEAR ?auto_6440 ) ( IS-CRATE ?auto_6441 ) ( AVAILABLE ?auto_6445 ) ( IN ?auto_6441 ?auto_6447 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6441 ?auto_6442 )
      ( MAKE-2CRATE-VERIFY ?auto_6440 ?auto_6441 ?auto_6442 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6449 - SURFACE
      ?auto_6450 - SURFACE
      ?auto_6451 - SURFACE
      ?auto_6452 - SURFACE
    )
    :vars
    (
      ?auto_6453 - HOIST
      ?auto_6454 - PLACE
      ?auto_6458 - PLACE
      ?auto_6455 - HOIST
      ?auto_6457 - SURFACE
      ?auto_6456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6453 ?auto_6454 ) ( IS-CRATE ?auto_6452 ) ( not ( = ?auto_6451 ?auto_6452 ) ) ( not ( = ?auto_6450 ?auto_6451 ) ) ( not ( = ?auto_6450 ?auto_6452 ) ) ( not ( = ?auto_6458 ?auto_6454 ) ) ( HOIST-AT ?auto_6455 ?auto_6458 ) ( not ( = ?auto_6453 ?auto_6455 ) ) ( AVAILABLE ?auto_6455 ) ( SURFACE-AT ?auto_6452 ?auto_6458 ) ( ON ?auto_6452 ?auto_6457 ) ( CLEAR ?auto_6452 ) ( not ( = ?auto_6451 ?auto_6457 ) ) ( not ( = ?auto_6452 ?auto_6457 ) ) ( not ( = ?auto_6450 ?auto_6457 ) ) ( TRUCK-AT ?auto_6456 ?auto_6454 ) ( SURFACE-AT ?auto_6450 ?auto_6454 ) ( CLEAR ?auto_6450 ) ( IS-CRATE ?auto_6451 ) ( AVAILABLE ?auto_6453 ) ( IN ?auto_6451 ?auto_6456 ) ( ON ?auto_6450 ?auto_6449 ) ( not ( = ?auto_6449 ?auto_6450 ) ) ( not ( = ?auto_6449 ?auto_6451 ) ) ( not ( = ?auto_6449 ?auto_6452 ) ) ( not ( = ?auto_6449 ?auto_6457 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6450 ?auto_6451 ?auto_6452 )
      ( MAKE-3CRATE-VERIFY ?auto_6449 ?auto_6450 ?auto_6451 ?auto_6452 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6459 - SURFACE
      ?auto_6460 - SURFACE
      ?auto_6461 - SURFACE
      ?auto_6462 - SURFACE
      ?auto_6463 - SURFACE
    )
    :vars
    (
      ?auto_6464 - HOIST
      ?auto_6465 - PLACE
      ?auto_6469 - PLACE
      ?auto_6466 - HOIST
      ?auto_6468 - SURFACE
      ?auto_6467 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6464 ?auto_6465 ) ( IS-CRATE ?auto_6463 ) ( not ( = ?auto_6462 ?auto_6463 ) ) ( not ( = ?auto_6461 ?auto_6462 ) ) ( not ( = ?auto_6461 ?auto_6463 ) ) ( not ( = ?auto_6469 ?auto_6465 ) ) ( HOIST-AT ?auto_6466 ?auto_6469 ) ( not ( = ?auto_6464 ?auto_6466 ) ) ( AVAILABLE ?auto_6466 ) ( SURFACE-AT ?auto_6463 ?auto_6469 ) ( ON ?auto_6463 ?auto_6468 ) ( CLEAR ?auto_6463 ) ( not ( = ?auto_6462 ?auto_6468 ) ) ( not ( = ?auto_6463 ?auto_6468 ) ) ( not ( = ?auto_6461 ?auto_6468 ) ) ( TRUCK-AT ?auto_6467 ?auto_6465 ) ( SURFACE-AT ?auto_6461 ?auto_6465 ) ( CLEAR ?auto_6461 ) ( IS-CRATE ?auto_6462 ) ( AVAILABLE ?auto_6464 ) ( IN ?auto_6462 ?auto_6467 ) ( ON ?auto_6460 ?auto_6459 ) ( ON ?auto_6461 ?auto_6460 ) ( not ( = ?auto_6459 ?auto_6460 ) ) ( not ( = ?auto_6459 ?auto_6461 ) ) ( not ( = ?auto_6459 ?auto_6462 ) ) ( not ( = ?auto_6459 ?auto_6463 ) ) ( not ( = ?auto_6459 ?auto_6468 ) ) ( not ( = ?auto_6460 ?auto_6461 ) ) ( not ( = ?auto_6460 ?auto_6462 ) ) ( not ( = ?auto_6460 ?auto_6463 ) ) ( not ( = ?auto_6460 ?auto_6468 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6461 ?auto_6462 ?auto_6463 )
      ( MAKE-4CRATE-VERIFY ?auto_6459 ?auto_6460 ?auto_6461 ?auto_6462 ?auto_6463 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6470 - SURFACE
      ?auto_6471 - SURFACE
    )
    :vars
    (
      ?auto_6472 - HOIST
      ?auto_6473 - PLACE
      ?auto_6478 - SURFACE
      ?auto_6477 - PLACE
      ?auto_6474 - HOIST
      ?auto_6476 - SURFACE
      ?auto_6475 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6472 ?auto_6473 ) ( IS-CRATE ?auto_6471 ) ( not ( = ?auto_6470 ?auto_6471 ) ) ( not ( = ?auto_6478 ?auto_6470 ) ) ( not ( = ?auto_6478 ?auto_6471 ) ) ( not ( = ?auto_6477 ?auto_6473 ) ) ( HOIST-AT ?auto_6474 ?auto_6477 ) ( not ( = ?auto_6472 ?auto_6474 ) ) ( AVAILABLE ?auto_6474 ) ( SURFACE-AT ?auto_6471 ?auto_6477 ) ( ON ?auto_6471 ?auto_6476 ) ( CLEAR ?auto_6471 ) ( not ( = ?auto_6470 ?auto_6476 ) ) ( not ( = ?auto_6471 ?auto_6476 ) ) ( not ( = ?auto_6478 ?auto_6476 ) ) ( SURFACE-AT ?auto_6478 ?auto_6473 ) ( CLEAR ?auto_6478 ) ( IS-CRATE ?auto_6470 ) ( AVAILABLE ?auto_6472 ) ( IN ?auto_6470 ?auto_6475 ) ( TRUCK-AT ?auto_6475 ?auto_6477 ) )
    :subtasks
    ( ( !DRIVE ?auto_6475 ?auto_6477 ?auto_6473 )
      ( MAKE-2CRATE ?auto_6478 ?auto_6470 ?auto_6471 )
      ( MAKE-1CRATE-VERIFY ?auto_6470 ?auto_6471 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6479 - SURFACE
      ?auto_6480 - SURFACE
      ?auto_6481 - SURFACE
    )
    :vars
    (
      ?auto_6487 - HOIST
      ?auto_6483 - PLACE
      ?auto_6484 - PLACE
      ?auto_6482 - HOIST
      ?auto_6485 - SURFACE
      ?auto_6486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6487 ?auto_6483 ) ( IS-CRATE ?auto_6481 ) ( not ( = ?auto_6480 ?auto_6481 ) ) ( not ( = ?auto_6479 ?auto_6480 ) ) ( not ( = ?auto_6479 ?auto_6481 ) ) ( not ( = ?auto_6484 ?auto_6483 ) ) ( HOIST-AT ?auto_6482 ?auto_6484 ) ( not ( = ?auto_6487 ?auto_6482 ) ) ( AVAILABLE ?auto_6482 ) ( SURFACE-AT ?auto_6481 ?auto_6484 ) ( ON ?auto_6481 ?auto_6485 ) ( CLEAR ?auto_6481 ) ( not ( = ?auto_6480 ?auto_6485 ) ) ( not ( = ?auto_6481 ?auto_6485 ) ) ( not ( = ?auto_6479 ?auto_6485 ) ) ( SURFACE-AT ?auto_6479 ?auto_6483 ) ( CLEAR ?auto_6479 ) ( IS-CRATE ?auto_6480 ) ( AVAILABLE ?auto_6487 ) ( IN ?auto_6480 ?auto_6486 ) ( TRUCK-AT ?auto_6486 ?auto_6484 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6480 ?auto_6481 )
      ( MAKE-2CRATE-VERIFY ?auto_6479 ?auto_6480 ?auto_6481 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6488 - SURFACE
      ?auto_6489 - SURFACE
      ?auto_6490 - SURFACE
      ?auto_6491 - SURFACE
    )
    :vars
    (
      ?auto_6495 - HOIST
      ?auto_6494 - PLACE
      ?auto_6496 - PLACE
      ?auto_6493 - HOIST
      ?auto_6492 - SURFACE
      ?auto_6497 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6495 ?auto_6494 ) ( IS-CRATE ?auto_6491 ) ( not ( = ?auto_6490 ?auto_6491 ) ) ( not ( = ?auto_6489 ?auto_6490 ) ) ( not ( = ?auto_6489 ?auto_6491 ) ) ( not ( = ?auto_6496 ?auto_6494 ) ) ( HOIST-AT ?auto_6493 ?auto_6496 ) ( not ( = ?auto_6495 ?auto_6493 ) ) ( AVAILABLE ?auto_6493 ) ( SURFACE-AT ?auto_6491 ?auto_6496 ) ( ON ?auto_6491 ?auto_6492 ) ( CLEAR ?auto_6491 ) ( not ( = ?auto_6490 ?auto_6492 ) ) ( not ( = ?auto_6491 ?auto_6492 ) ) ( not ( = ?auto_6489 ?auto_6492 ) ) ( SURFACE-AT ?auto_6489 ?auto_6494 ) ( CLEAR ?auto_6489 ) ( IS-CRATE ?auto_6490 ) ( AVAILABLE ?auto_6495 ) ( IN ?auto_6490 ?auto_6497 ) ( TRUCK-AT ?auto_6497 ?auto_6496 ) ( ON ?auto_6489 ?auto_6488 ) ( not ( = ?auto_6488 ?auto_6489 ) ) ( not ( = ?auto_6488 ?auto_6490 ) ) ( not ( = ?auto_6488 ?auto_6491 ) ) ( not ( = ?auto_6488 ?auto_6492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6489 ?auto_6490 ?auto_6491 )
      ( MAKE-3CRATE-VERIFY ?auto_6488 ?auto_6489 ?auto_6490 ?auto_6491 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6498 - SURFACE
      ?auto_6499 - SURFACE
      ?auto_6500 - SURFACE
      ?auto_6501 - SURFACE
      ?auto_6502 - SURFACE
    )
    :vars
    (
      ?auto_6506 - HOIST
      ?auto_6505 - PLACE
      ?auto_6507 - PLACE
      ?auto_6504 - HOIST
      ?auto_6503 - SURFACE
      ?auto_6508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6506 ?auto_6505 ) ( IS-CRATE ?auto_6502 ) ( not ( = ?auto_6501 ?auto_6502 ) ) ( not ( = ?auto_6500 ?auto_6501 ) ) ( not ( = ?auto_6500 ?auto_6502 ) ) ( not ( = ?auto_6507 ?auto_6505 ) ) ( HOIST-AT ?auto_6504 ?auto_6507 ) ( not ( = ?auto_6506 ?auto_6504 ) ) ( AVAILABLE ?auto_6504 ) ( SURFACE-AT ?auto_6502 ?auto_6507 ) ( ON ?auto_6502 ?auto_6503 ) ( CLEAR ?auto_6502 ) ( not ( = ?auto_6501 ?auto_6503 ) ) ( not ( = ?auto_6502 ?auto_6503 ) ) ( not ( = ?auto_6500 ?auto_6503 ) ) ( SURFACE-AT ?auto_6500 ?auto_6505 ) ( CLEAR ?auto_6500 ) ( IS-CRATE ?auto_6501 ) ( AVAILABLE ?auto_6506 ) ( IN ?auto_6501 ?auto_6508 ) ( TRUCK-AT ?auto_6508 ?auto_6507 ) ( ON ?auto_6499 ?auto_6498 ) ( ON ?auto_6500 ?auto_6499 ) ( not ( = ?auto_6498 ?auto_6499 ) ) ( not ( = ?auto_6498 ?auto_6500 ) ) ( not ( = ?auto_6498 ?auto_6501 ) ) ( not ( = ?auto_6498 ?auto_6502 ) ) ( not ( = ?auto_6498 ?auto_6503 ) ) ( not ( = ?auto_6499 ?auto_6500 ) ) ( not ( = ?auto_6499 ?auto_6501 ) ) ( not ( = ?auto_6499 ?auto_6502 ) ) ( not ( = ?auto_6499 ?auto_6503 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6500 ?auto_6501 ?auto_6502 )
      ( MAKE-4CRATE-VERIFY ?auto_6498 ?auto_6499 ?auto_6500 ?auto_6501 ?auto_6502 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6509 - SURFACE
      ?auto_6510 - SURFACE
    )
    :vars
    (
      ?auto_6514 - HOIST
      ?auto_6513 - PLACE
      ?auto_6517 - SURFACE
      ?auto_6515 - PLACE
      ?auto_6512 - HOIST
      ?auto_6511 - SURFACE
      ?auto_6516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6514 ?auto_6513 ) ( IS-CRATE ?auto_6510 ) ( not ( = ?auto_6509 ?auto_6510 ) ) ( not ( = ?auto_6517 ?auto_6509 ) ) ( not ( = ?auto_6517 ?auto_6510 ) ) ( not ( = ?auto_6515 ?auto_6513 ) ) ( HOIST-AT ?auto_6512 ?auto_6515 ) ( not ( = ?auto_6514 ?auto_6512 ) ) ( SURFACE-AT ?auto_6510 ?auto_6515 ) ( ON ?auto_6510 ?auto_6511 ) ( CLEAR ?auto_6510 ) ( not ( = ?auto_6509 ?auto_6511 ) ) ( not ( = ?auto_6510 ?auto_6511 ) ) ( not ( = ?auto_6517 ?auto_6511 ) ) ( SURFACE-AT ?auto_6517 ?auto_6513 ) ( CLEAR ?auto_6517 ) ( IS-CRATE ?auto_6509 ) ( AVAILABLE ?auto_6514 ) ( TRUCK-AT ?auto_6516 ?auto_6515 ) ( LIFTING ?auto_6512 ?auto_6509 ) )
    :subtasks
    ( ( !LOAD ?auto_6512 ?auto_6509 ?auto_6516 ?auto_6515 )
      ( MAKE-2CRATE ?auto_6517 ?auto_6509 ?auto_6510 )
      ( MAKE-1CRATE-VERIFY ?auto_6509 ?auto_6510 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6518 - SURFACE
      ?auto_6519 - SURFACE
      ?auto_6520 - SURFACE
    )
    :vars
    (
      ?auto_6523 - HOIST
      ?auto_6522 - PLACE
      ?auto_6521 - PLACE
      ?auto_6526 - HOIST
      ?auto_6524 - SURFACE
      ?auto_6525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6523 ?auto_6522 ) ( IS-CRATE ?auto_6520 ) ( not ( = ?auto_6519 ?auto_6520 ) ) ( not ( = ?auto_6518 ?auto_6519 ) ) ( not ( = ?auto_6518 ?auto_6520 ) ) ( not ( = ?auto_6521 ?auto_6522 ) ) ( HOIST-AT ?auto_6526 ?auto_6521 ) ( not ( = ?auto_6523 ?auto_6526 ) ) ( SURFACE-AT ?auto_6520 ?auto_6521 ) ( ON ?auto_6520 ?auto_6524 ) ( CLEAR ?auto_6520 ) ( not ( = ?auto_6519 ?auto_6524 ) ) ( not ( = ?auto_6520 ?auto_6524 ) ) ( not ( = ?auto_6518 ?auto_6524 ) ) ( SURFACE-AT ?auto_6518 ?auto_6522 ) ( CLEAR ?auto_6518 ) ( IS-CRATE ?auto_6519 ) ( AVAILABLE ?auto_6523 ) ( TRUCK-AT ?auto_6525 ?auto_6521 ) ( LIFTING ?auto_6526 ?auto_6519 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6519 ?auto_6520 )
      ( MAKE-2CRATE-VERIFY ?auto_6518 ?auto_6519 ?auto_6520 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6527 - SURFACE
      ?auto_6528 - SURFACE
      ?auto_6529 - SURFACE
      ?auto_6530 - SURFACE
    )
    :vars
    (
      ?auto_6531 - HOIST
      ?auto_6534 - PLACE
      ?auto_6533 - PLACE
      ?auto_6536 - HOIST
      ?auto_6535 - SURFACE
      ?auto_6532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6531 ?auto_6534 ) ( IS-CRATE ?auto_6530 ) ( not ( = ?auto_6529 ?auto_6530 ) ) ( not ( = ?auto_6528 ?auto_6529 ) ) ( not ( = ?auto_6528 ?auto_6530 ) ) ( not ( = ?auto_6533 ?auto_6534 ) ) ( HOIST-AT ?auto_6536 ?auto_6533 ) ( not ( = ?auto_6531 ?auto_6536 ) ) ( SURFACE-AT ?auto_6530 ?auto_6533 ) ( ON ?auto_6530 ?auto_6535 ) ( CLEAR ?auto_6530 ) ( not ( = ?auto_6529 ?auto_6535 ) ) ( not ( = ?auto_6530 ?auto_6535 ) ) ( not ( = ?auto_6528 ?auto_6535 ) ) ( SURFACE-AT ?auto_6528 ?auto_6534 ) ( CLEAR ?auto_6528 ) ( IS-CRATE ?auto_6529 ) ( AVAILABLE ?auto_6531 ) ( TRUCK-AT ?auto_6532 ?auto_6533 ) ( LIFTING ?auto_6536 ?auto_6529 ) ( ON ?auto_6528 ?auto_6527 ) ( not ( = ?auto_6527 ?auto_6528 ) ) ( not ( = ?auto_6527 ?auto_6529 ) ) ( not ( = ?auto_6527 ?auto_6530 ) ) ( not ( = ?auto_6527 ?auto_6535 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6528 ?auto_6529 ?auto_6530 )
      ( MAKE-3CRATE-VERIFY ?auto_6527 ?auto_6528 ?auto_6529 ?auto_6530 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6537 - SURFACE
      ?auto_6538 - SURFACE
      ?auto_6539 - SURFACE
      ?auto_6540 - SURFACE
      ?auto_6541 - SURFACE
    )
    :vars
    (
      ?auto_6542 - HOIST
      ?auto_6545 - PLACE
      ?auto_6544 - PLACE
      ?auto_6547 - HOIST
      ?auto_6546 - SURFACE
      ?auto_6543 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6542 ?auto_6545 ) ( IS-CRATE ?auto_6541 ) ( not ( = ?auto_6540 ?auto_6541 ) ) ( not ( = ?auto_6539 ?auto_6540 ) ) ( not ( = ?auto_6539 ?auto_6541 ) ) ( not ( = ?auto_6544 ?auto_6545 ) ) ( HOIST-AT ?auto_6547 ?auto_6544 ) ( not ( = ?auto_6542 ?auto_6547 ) ) ( SURFACE-AT ?auto_6541 ?auto_6544 ) ( ON ?auto_6541 ?auto_6546 ) ( CLEAR ?auto_6541 ) ( not ( = ?auto_6540 ?auto_6546 ) ) ( not ( = ?auto_6541 ?auto_6546 ) ) ( not ( = ?auto_6539 ?auto_6546 ) ) ( SURFACE-AT ?auto_6539 ?auto_6545 ) ( CLEAR ?auto_6539 ) ( IS-CRATE ?auto_6540 ) ( AVAILABLE ?auto_6542 ) ( TRUCK-AT ?auto_6543 ?auto_6544 ) ( LIFTING ?auto_6547 ?auto_6540 ) ( ON ?auto_6538 ?auto_6537 ) ( ON ?auto_6539 ?auto_6538 ) ( not ( = ?auto_6537 ?auto_6538 ) ) ( not ( = ?auto_6537 ?auto_6539 ) ) ( not ( = ?auto_6537 ?auto_6540 ) ) ( not ( = ?auto_6537 ?auto_6541 ) ) ( not ( = ?auto_6537 ?auto_6546 ) ) ( not ( = ?auto_6538 ?auto_6539 ) ) ( not ( = ?auto_6538 ?auto_6540 ) ) ( not ( = ?auto_6538 ?auto_6541 ) ) ( not ( = ?auto_6538 ?auto_6546 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6539 ?auto_6540 ?auto_6541 )
      ( MAKE-4CRATE-VERIFY ?auto_6537 ?auto_6538 ?auto_6539 ?auto_6540 ?auto_6541 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6548 - SURFACE
      ?auto_6549 - SURFACE
    )
    :vars
    (
      ?auto_6550 - HOIST
      ?auto_6553 - PLACE
      ?auto_6556 - SURFACE
      ?auto_6552 - PLACE
      ?auto_6555 - HOIST
      ?auto_6554 - SURFACE
      ?auto_6551 - TRUCK
      ?auto_6557 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6550 ?auto_6553 ) ( IS-CRATE ?auto_6549 ) ( not ( = ?auto_6548 ?auto_6549 ) ) ( not ( = ?auto_6556 ?auto_6548 ) ) ( not ( = ?auto_6556 ?auto_6549 ) ) ( not ( = ?auto_6552 ?auto_6553 ) ) ( HOIST-AT ?auto_6555 ?auto_6552 ) ( not ( = ?auto_6550 ?auto_6555 ) ) ( SURFACE-AT ?auto_6549 ?auto_6552 ) ( ON ?auto_6549 ?auto_6554 ) ( CLEAR ?auto_6549 ) ( not ( = ?auto_6548 ?auto_6554 ) ) ( not ( = ?auto_6549 ?auto_6554 ) ) ( not ( = ?auto_6556 ?auto_6554 ) ) ( SURFACE-AT ?auto_6556 ?auto_6553 ) ( CLEAR ?auto_6556 ) ( IS-CRATE ?auto_6548 ) ( AVAILABLE ?auto_6550 ) ( TRUCK-AT ?auto_6551 ?auto_6552 ) ( AVAILABLE ?auto_6555 ) ( SURFACE-AT ?auto_6548 ?auto_6552 ) ( ON ?auto_6548 ?auto_6557 ) ( CLEAR ?auto_6548 ) ( not ( = ?auto_6548 ?auto_6557 ) ) ( not ( = ?auto_6549 ?auto_6557 ) ) ( not ( = ?auto_6556 ?auto_6557 ) ) ( not ( = ?auto_6554 ?auto_6557 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6555 ?auto_6548 ?auto_6557 ?auto_6552 )
      ( MAKE-2CRATE ?auto_6556 ?auto_6548 ?auto_6549 )
      ( MAKE-1CRATE-VERIFY ?auto_6548 ?auto_6549 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6558 - SURFACE
      ?auto_6559 - SURFACE
      ?auto_6560 - SURFACE
    )
    :vars
    (
      ?auto_6567 - HOIST
      ?auto_6561 - PLACE
      ?auto_6565 - PLACE
      ?auto_6562 - HOIST
      ?auto_6563 - SURFACE
      ?auto_6564 - TRUCK
      ?auto_6566 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6567 ?auto_6561 ) ( IS-CRATE ?auto_6560 ) ( not ( = ?auto_6559 ?auto_6560 ) ) ( not ( = ?auto_6558 ?auto_6559 ) ) ( not ( = ?auto_6558 ?auto_6560 ) ) ( not ( = ?auto_6565 ?auto_6561 ) ) ( HOIST-AT ?auto_6562 ?auto_6565 ) ( not ( = ?auto_6567 ?auto_6562 ) ) ( SURFACE-AT ?auto_6560 ?auto_6565 ) ( ON ?auto_6560 ?auto_6563 ) ( CLEAR ?auto_6560 ) ( not ( = ?auto_6559 ?auto_6563 ) ) ( not ( = ?auto_6560 ?auto_6563 ) ) ( not ( = ?auto_6558 ?auto_6563 ) ) ( SURFACE-AT ?auto_6558 ?auto_6561 ) ( CLEAR ?auto_6558 ) ( IS-CRATE ?auto_6559 ) ( AVAILABLE ?auto_6567 ) ( TRUCK-AT ?auto_6564 ?auto_6565 ) ( AVAILABLE ?auto_6562 ) ( SURFACE-AT ?auto_6559 ?auto_6565 ) ( ON ?auto_6559 ?auto_6566 ) ( CLEAR ?auto_6559 ) ( not ( = ?auto_6559 ?auto_6566 ) ) ( not ( = ?auto_6560 ?auto_6566 ) ) ( not ( = ?auto_6558 ?auto_6566 ) ) ( not ( = ?auto_6563 ?auto_6566 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6559 ?auto_6560 )
      ( MAKE-2CRATE-VERIFY ?auto_6558 ?auto_6559 ?auto_6560 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6568 - SURFACE
      ?auto_6569 - SURFACE
      ?auto_6570 - SURFACE
      ?auto_6571 - SURFACE
    )
    :vars
    (
      ?auto_6578 - HOIST
      ?auto_6573 - PLACE
      ?auto_6572 - PLACE
      ?auto_6577 - HOIST
      ?auto_6576 - SURFACE
      ?auto_6575 - TRUCK
      ?auto_6574 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6578 ?auto_6573 ) ( IS-CRATE ?auto_6571 ) ( not ( = ?auto_6570 ?auto_6571 ) ) ( not ( = ?auto_6569 ?auto_6570 ) ) ( not ( = ?auto_6569 ?auto_6571 ) ) ( not ( = ?auto_6572 ?auto_6573 ) ) ( HOIST-AT ?auto_6577 ?auto_6572 ) ( not ( = ?auto_6578 ?auto_6577 ) ) ( SURFACE-AT ?auto_6571 ?auto_6572 ) ( ON ?auto_6571 ?auto_6576 ) ( CLEAR ?auto_6571 ) ( not ( = ?auto_6570 ?auto_6576 ) ) ( not ( = ?auto_6571 ?auto_6576 ) ) ( not ( = ?auto_6569 ?auto_6576 ) ) ( SURFACE-AT ?auto_6569 ?auto_6573 ) ( CLEAR ?auto_6569 ) ( IS-CRATE ?auto_6570 ) ( AVAILABLE ?auto_6578 ) ( TRUCK-AT ?auto_6575 ?auto_6572 ) ( AVAILABLE ?auto_6577 ) ( SURFACE-AT ?auto_6570 ?auto_6572 ) ( ON ?auto_6570 ?auto_6574 ) ( CLEAR ?auto_6570 ) ( not ( = ?auto_6570 ?auto_6574 ) ) ( not ( = ?auto_6571 ?auto_6574 ) ) ( not ( = ?auto_6569 ?auto_6574 ) ) ( not ( = ?auto_6576 ?auto_6574 ) ) ( ON ?auto_6569 ?auto_6568 ) ( not ( = ?auto_6568 ?auto_6569 ) ) ( not ( = ?auto_6568 ?auto_6570 ) ) ( not ( = ?auto_6568 ?auto_6571 ) ) ( not ( = ?auto_6568 ?auto_6576 ) ) ( not ( = ?auto_6568 ?auto_6574 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6569 ?auto_6570 ?auto_6571 )
      ( MAKE-3CRATE-VERIFY ?auto_6568 ?auto_6569 ?auto_6570 ?auto_6571 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6579 - SURFACE
      ?auto_6580 - SURFACE
      ?auto_6581 - SURFACE
      ?auto_6582 - SURFACE
      ?auto_6583 - SURFACE
    )
    :vars
    (
      ?auto_6590 - HOIST
      ?auto_6585 - PLACE
      ?auto_6584 - PLACE
      ?auto_6589 - HOIST
      ?auto_6588 - SURFACE
      ?auto_6587 - TRUCK
      ?auto_6586 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6590 ?auto_6585 ) ( IS-CRATE ?auto_6583 ) ( not ( = ?auto_6582 ?auto_6583 ) ) ( not ( = ?auto_6581 ?auto_6582 ) ) ( not ( = ?auto_6581 ?auto_6583 ) ) ( not ( = ?auto_6584 ?auto_6585 ) ) ( HOIST-AT ?auto_6589 ?auto_6584 ) ( not ( = ?auto_6590 ?auto_6589 ) ) ( SURFACE-AT ?auto_6583 ?auto_6584 ) ( ON ?auto_6583 ?auto_6588 ) ( CLEAR ?auto_6583 ) ( not ( = ?auto_6582 ?auto_6588 ) ) ( not ( = ?auto_6583 ?auto_6588 ) ) ( not ( = ?auto_6581 ?auto_6588 ) ) ( SURFACE-AT ?auto_6581 ?auto_6585 ) ( CLEAR ?auto_6581 ) ( IS-CRATE ?auto_6582 ) ( AVAILABLE ?auto_6590 ) ( TRUCK-AT ?auto_6587 ?auto_6584 ) ( AVAILABLE ?auto_6589 ) ( SURFACE-AT ?auto_6582 ?auto_6584 ) ( ON ?auto_6582 ?auto_6586 ) ( CLEAR ?auto_6582 ) ( not ( = ?auto_6582 ?auto_6586 ) ) ( not ( = ?auto_6583 ?auto_6586 ) ) ( not ( = ?auto_6581 ?auto_6586 ) ) ( not ( = ?auto_6588 ?auto_6586 ) ) ( ON ?auto_6580 ?auto_6579 ) ( ON ?auto_6581 ?auto_6580 ) ( not ( = ?auto_6579 ?auto_6580 ) ) ( not ( = ?auto_6579 ?auto_6581 ) ) ( not ( = ?auto_6579 ?auto_6582 ) ) ( not ( = ?auto_6579 ?auto_6583 ) ) ( not ( = ?auto_6579 ?auto_6588 ) ) ( not ( = ?auto_6579 ?auto_6586 ) ) ( not ( = ?auto_6580 ?auto_6581 ) ) ( not ( = ?auto_6580 ?auto_6582 ) ) ( not ( = ?auto_6580 ?auto_6583 ) ) ( not ( = ?auto_6580 ?auto_6588 ) ) ( not ( = ?auto_6580 ?auto_6586 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6581 ?auto_6582 ?auto_6583 )
      ( MAKE-4CRATE-VERIFY ?auto_6579 ?auto_6580 ?auto_6581 ?auto_6582 ?auto_6583 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6591 - SURFACE
      ?auto_6592 - SURFACE
    )
    :vars
    (
      ?auto_6599 - HOIST
      ?auto_6594 - PLACE
      ?auto_6600 - SURFACE
      ?auto_6593 - PLACE
      ?auto_6598 - HOIST
      ?auto_6597 - SURFACE
      ?auto_6595 - SURFACE
      ?auto_6596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6599 ?auto_6594 ) ( IS-CRATE ?auto_6592 ) ( not ( = ?auto_6591 ?auto_6592 ) ) ( not ( = ?auto_6600 ?auto_6591 ) ) ( not ( = ?auto_6600 ?auto_6592 ) ) ( not ( = ?auto_6593 ?auto_6594 ) ) ( HOIST-AT ?auto_6598 ?auto_6593 ) ( not ( = ?auto_6599 ?auto_6598 ) ) ( SURFACE-AT ?auto_6592 ?auto_6593 ) ( ON ?auto_6592 ?auto_6597 ) ( CLEAR ?auto_6592 ) ( not ( = ?auto_6591 ?auto_6597 ) ) ( not ( = ?auto_6592 ?auto_6597 ) ) ( not ( = ?auto_6600 ?auto_6597 ) ) ( SURFACE-AT ?auto_6600 ?auto_6594 ) ( CLEAR ?auto_6600 ) ( IS-CRATE ?auto_6591 ) ( AVAILABLE ?auto_6599 ) ( AVAILABLE ?auto_6598 ) ( SURFACE-AT ?auto_6591 ?auto_6593 ) ( ON ?auto_6591 ?auto_6595 ) ( CLEAR ?auto_6591 ) ( not ( = ?auto_6591 ?auto_6595 ) ) ( not ( = ?auto_6592 ?auto_6595 ) ) ( not ( = ?auto_6600 ?auto_6595 ) ) ( not ( = ?auto_6597 ?auto_6595 ) ) ( TRUCK-AT ?auto_6596 ?auto_6594 ) )
    :subtasks
    ( ( !DRIVE ?auto_6596 ?auto_6594 ?auto_6593 )
      ( MAKE-2CRATE ?auto_6600 ?auto_6591 ?auto_6592 )
      ( MAKE-1CRATE-VERIFY ?auto_6591 ?auto_6592 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6601 - SURFACE
      ?auto_6602 - SURFACE
      ?auto_6603 - SURFACE
    )
    :vars
    (
      ?auto_6609 - HOIST
      ?auto_6610 - PLACE
      ?auto_6607 - PLACE
      ?auto_6605 - HOIST
      ?auto_6604 - SURFACE
      ?auto_6606 - SURFACE
      ?auto_6608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6609 ?auto_6610 ) ( IS-CRATE ?auto_6603 ) ( not ( = ?auto_6602 ?auto_6603 ) ) ( not ( = ?auto_6601 ?auto_6602 ) ) ( not ( = ?auto_6601 ?auto_6603 ) ) ( not ( = ?auto_6607 ?auto_6610 ) ) ( HOIST-AT ?auto_6605 ?auto_6607 ) ( not ( = ?auto_6609 ?auto_6605 ) ) ( SURFACE-AT ?auto_6603 ?auto_6607 ) ( ON ?auto_6603 ?auto_6604 ) ( CLEAR ?auto_6603 ) ( not ( = ?auto_6602 ?auto_6604 ) ) ( not ( = ?auto_6603 ?auto_6604 ) ) ( not ( = ?auto_6601 ?auto_6604 ) ) ( SURFACE-AT ?auto_6601 ?auto_6610 ) ( CLEAR ?auto_6601 ) ( IS-CRATE ?auto_6602 ) ( AVAILABLE ?auto_6609 ) ( AVAILABLE ?auto_6605 ) ( SURFACE-AT ?auto_6602 ?auto_6607 ) ( ON ?auto_6602 ?auto_6606 ) ( CLEAR ?auto_6602 ) ( not ( = ?auto_6602 ?auto_6606 ) ) ( not ( = ?auto_6603 ?auto_6606 ) ) ( not ( = ?auto_6601 ?auto_6606 ) ) ( not ( = ?auto_6604 ?auto_6606 ) ) ( TRUCK-AT ?auto_6608 ?auto_6610 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6602 ?auto_6603 )
      ( MAKE-2CRATE-VERIFY ?auto_6601 ?auto_6602 ?auto_6603 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6611 - SURFACE
      ?auto_6612 - SURFACE
      ?auto_6613 - SURFACE
      ?auto_6614 - SURFACE
    )
    :vars
    (
      ?auto_6621 - HOIST
      ?auto_6617 - PLACE
      ?auto_6620 - PLACE
      ?auto_6618 - HOIST
      ?auto_6615 - SURFACE
      ?auto_6619 - SURFACE
      ?auto_6616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6621 ?auto_6617 ) ( IS-CRATE ?auto_6614 ) ( not ( = ?auto_6613 ?auto_6614 ) ) ( not ( = ?auto_6612 ?auto_6613 ) ) ( not ( = ?auto_6612 ?auto_6614 ) ) ( not ( = ?auto_6620 ?auto_6617 ) ) ( HOIST-AT ?auto_6618 ?auto_6620 ) ( not ( = ?auto_6621 ?auto_6618 ) ) ( SURFACE-AT ?auto_6614 ?auto_6620 ) ( ON ?auto_6614 ?auto_6615 ) ( CLEAR ?auto_6614 ) ( not ( = ?auto_6613 ?auto_6615 ) ) ( not ( = ?auto_6614 ?auto_6615 ) ) ( not ( = ?auto_6612 ?auto_6615 ) ) ( SURFACE-AT ?auto_6612 ?auto_6617 ) ( CLEAR ?auto_6612 ) ( IS-CRATE ?auto_6613 ) ( AVAILABLE ?auto_6621 ) ( AVAILABLE ?auto_6618 ) ( SURFACE-AT ?auto_6613 ?auto_6620 ) ( ON ?auto_6613 ?auto_6619 ) ( CLEAR ?auto_6613 ) ( not ( = ?auto_6613 ?auto_6619 ) ) ( not ( = ?auto_6614 ?auto_6619 ) ) ( not ( = ?auto_6612 ?auto_6619 ) ) ( not ( = ?auto_6615 ?auto_6619 ) ) ( TRUCK-AT ?auto_6616 ?auto_6617 ) ( ON ?auto_6612 ?auto_6611 ) ( not ( = ?auto_6611 ?auto_6612 ) ) ( not ( = ?auto_6611 ?auto_6613 ) ) ( not ( = ?auto_6611 ?auto_6614 ) ) ( not ( = ?auto_6611 ?auto_6615 ) ) ( not ( = ?auto_6611 ?auto_6619 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6612 ?auto_6613 ?auto_6614 )
      ( MAKE-3CRATE-VERIFY ?auto_6611 ?auto_6612 ?auto_6613 ?auto_6614 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6622 - SURFACE
      ?auto_6623 - SURFACE
      ?auto_6624 - SURFACE
      ?auto_6625 - SURFACE
      ?auto_6626 - SURFACE
    )
    :vars
    (
      ?auto_6633 - HOIST
      ?auto_6629 - PLACE
      ?auto_6632 - PLACE
      ?auto_6630 - HOIST
      ?auto_6627 - SURFACE
      ?auto_6631 - SURFACE
      ?auto_6628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6633 ?auto_6629 ) ( IS-CRATE ?auto_6626 ) ( not ( = ?auto_6625 ?auto_6626 ) ) ( not ( = ?auto_6624 ?auto_6625 ) ) ( not ( = ?auto_6624 ?auto_6626 ) ) ( not ( = ?auto_6632 ?auto_6629 ) ) ( HOIST-AT ?auto_6630 ?auto_6632 ) ( not ( = ?auto_6633 ?auto_6630 ) ) ( SURFACE-AT ?auto_6626 ?auto_6632 ) ( ON ?auto_6626 ?auto_6627 ) ( CLEAR ?auto_6626 ) ( not ( = ?auto_6625 ?auto_6627 ) ) ( not ( = ?auto_6626 ?auto_6627 ) ) ( not ( = ?auto_6624 ?auto_6627 ) ) ( SURFACE-AT ?auto_6624 ?auto_6629 ) ( CLEAR ?auto_6624 ) ( IS-CRATE ?auto_6625 ) ( AVAILABLE ?auto_6633 ) ( AVAILABLE ?auto_6630 ) ( SURFACE-AT ?auto_6625 ?auto_6632 ) ( ON ?auto_6625 ?auto_6631 ) ( CLEAR ?auto_6625 ) ( not ( = ?auto_6625 ?auto_6631 ) ) ( not ( = ?auto_6626 ?auto_6631 ) ) ( not ( = ?auto_6624 ?auto_6631 ) ) ( not ( = ?auto_6627 ?auto_6631 ) ) ( TRUCK-AT ?auto_6628 ?auto_6629 ) ( ON ?auto_6623 ?auto_6622 ) ( ON ?auto_6624 ?auto_6623 ) ( not ( = ?auto_6622 ?auto_6623 ) ) ( not ( = ?auto_6622 ?auto_6624 ) ) ( not ( = ?auto_6622 ?auto_6625 ) ) ( not ( = ?auto_6622 ?auto_6626 ) ) ( not ( = ?auto_6622 ?auto_6627 ) ) ( not ( = ?auto_6622 ?auto_6631 ) ) ( not ( = ?auto_6623 ?auto_6624 ) ) ( not ( = ?auto_6623 ?auto_6625 ) ) ( not ( = ?auto_6623 ?auto_6626 ) ) ( not ( = ?auto_6623 ?auto_6627 ) ) ( not ( = ?auto_6623 ?auto_6631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6624 ?auto_6625 ?auto_6626 )
      ( MAKE-4CRATE-VERIFY ?auto_6622 ?auto_6623 ?auto_6624 ?auto_6625 ?auto_6626 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6634 - SURFACE
      ?auto_6635 - SURFACE
    )
    :vars
    (
      ?auto_6642 - HOIST
      ?auto_6638 - PLACE
      ?auto_6643 - SURFACE
      ?auto_6641 - PLACE
      ?auto_6639 - HOIST
      ?auto_6636 - SURFACE
      ?auto_6640 - SURFACE
      ?auto_6637 - TRUCK
      ?auto_6644 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6642 ?auto_6638 ) ( IS-CRATE ?auto_6635 ) ( not ( = ?auto_6634 ?auto_6635 ) ) ( not ( = ?auto_6643 ?auto_6634 ) ) ( not ( = ?auto_6643 ?auto_6635 ) ) ( not ( = ?auto_6641 ?auto_6638 ) ) ( HOIST-AT ?auto_6639 ?auto_6641 ) ( not ( = ?auto_6642 ?auto_6639 ) ) ( SURFACE-AT ?auto_6635 ?auto_6641 ) ( ON ?auto_6635 ?auto_6636 ) ( CLEAR ?auto_6635 ) ( not ( = ?auto_6634 ?auto_6636 ) ) ( not ( = ?auto_6635 ?auto_6636 ) ) ( not ( = ?auto_6643 ?auto_6636 ) ) ( IS-CRATE ?auto_6634 ) ( AVAILABLE ?auto_6639 ) ( SURFACE-AT ?auto_6634 ?auto_6641 ) ( ON ?auto_6634 ?auto_6640 ) ( CLEAR ?auto_6634 ) ( not ( = ?auto_6634 ?auto_6640 ) ) ( not ( = ?auto_6635 ?auto_6640 ) ) ( not ( = ?auto_6643 ?auto_6640 ) ) ( not ( = ?auto_6636 ?auto_6640 ) ) ( TRUCK-AT ?auto_6637 ?auto_6638 ) ( SURFACE-AT ?auto_6644 ?auto_6638 ) ( CLEAR ?auto_6644 ) ( LIFTING ?auto_6642 ?auto_6643 ) ( IS-CRATE ?auto_6643 ) ( not ( = ?auto_6644 ?auto_6643 ) ) ( not ( = ?auto_6634 ?auto_6644 ) ) ( not ( = ?auto_6635 ?auto_6644 ) ) ( not ( = ?auto_6636 ?auto_6644 ) ) ( not ( = ?auto_6640 ?auto_6644 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6644 ?auto_6643 )
      ( MAKE-2CRATE ?auto_6643 ?auto_6634 ?auto_6635 )
      ( MAKE-1CRATE-VERIFY ?auto_6634 ?auto_6635 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6645 - SURFACE
      ?auto_6646 - SURFACE
      ?auto_6647 - SURFACE
    )
    :vars
    (
      ?auto_6650 - HOIST
      ?auto_6652 - PLACE
      ?auto_6649 - PLACE
      ?auto_6653 - HOIST
      ?auto_6655 - SURFACE
      ?auto_6651 - SURFACE
      ?auto_6654 - TRUCK
      ?auto_6648 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6650 ?auto_6652 ) ( IS-CRATE ?auto_6647 ) ( not ( = ?auto_6646 ?auto_6647 ) ) ( not ( = ?auto_6645 ?auto_6646 ) ) ( not ( = ?auto_6645 ?auto_6647 ) ) ( not ( = ?auto_6649 ?auto_6652 ) ) ( HOIST-AT ?auto_6653 ?auto_6649 ) ( not ( = ?auto_6650 ?auto_6653 ) ) ( SURFACE-AT ?auto_6647 ?auto_6649 ) ( ON ?auto_6647 ?auto_6655 ) ( CLEAR ?auto_6647 ) ( not ( = ?auto_6646 ?auto_6655 ) ) ( not ( = ?auto_6647 ?auto_6655 ) ) ( not ( = ?auto_6645 ?auto_6655 ) ) ( IS-CRATE ?auto_6646 ) ( AVAILABLE ?auto_6653 ) ( SURFACE-AT ?auto_6646 ?auto_6649 ) ( ON ?auto_6646 ?auto_6651 ) ( CLEAR ?auto_6646 ) ( not ( = ?auto_6646 ?auto_6651 ) ) ( not ( = ?auto_6647 ?auto_6651 ) ) ( not ( = ?auto_6645 ?auto_6651 ) ) ( not ( = ?auto_6655 ?auto_6651 ) ) ( TRUCK-AT ?auto_6654 ?auto_6652 ) ( SURFACE-AT ?auto_6648 ?auto_6652 ) ( CLEAR ?auto_6648 ) ( LIFTING ?auto_6650 ?auto_6645 ) ( IS-CRATE ?auto_6645 ) ( not ( = ?auto_6648 ?auto_6645 ) ) ( not ( = ?auto_6646 ?auto_6648 ) ) ( not ( = ?auto_6647 ?auto_6648 ) ) ( not ( = ?auto_6655 ?auto_6648 ) ) ( not ( = ?auto_6651 ?auto_6648 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6646 ?auto_6647 )
      ( MAKE-2CRATE-VERIFY ?auto_6645 ?auto_6646 ?auto_6647 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6656 - SURFACE
      ?auto_6657 - SURFACE
      ?auto_6658 - SURFACE
      ?auto_6659 - SURFACE
    )
    :vars
    (
      ?auto_6663 - HOIST
      ?auto_6666 - PLACE
      ?auto_6665 - PLACE
      ?auto_6660 - HOIST
      ?auto_6661 - SURFACE
      ?auto_6662 - SURFACE
      ?auto_6664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6663 ?auto_6666 ) ( IS-CRATE ?auto_6659 ) ( not ( = ?auto_6658 ?auto_6659 ) ) ( not ( = ?auto_6657 ?auto_6658 ) ) ( not ( = ?auto_6657 ?auto_6659 ) ) ( not ( = ?auto_6665 ?auto_6666 ) ) ( HOIST-AT ?auto_6660 ?auto_6665 ) ( not ( = ?auto_6663 ?auto_6660 ) ) ( SURFACE-AT ?auto_6659 ?auto_6665 ) ( ON ?auto_6659 ?auto_6661 ) ( CLEAR ?auto_6659 ) ( not ( = ?auto_6658 ?auto_6661 ) ) ( not ( = ?auto_6659 ?auto_6661 ) ) ( not ( = ?auto_6657 ?auto_6661 ) ) ( IS-CRATE ?auto_6658 ) ( AVAILABLE ?auto_6660 ) ( SURFACE-AT ?auto_6658 ?auto_6665 ) ( ON ?auto_6658 ?auto_6662 ) ( CLEAR ?auto_6658 ) ( not ( = ?auto_6658 ?auto_6662 ) ) ( not ( = ?auto_6659 ?auto_6662 ) ) ( not ( = ?auto_6657 ?auto_6662 ) ) ( not ( = ?auto_6661 ?auto_6662 ) ) ( TRUCK-AT ?auto_6664 ?auto_6666 ) ( SURFACE-AT ?auto_6656 ?auto_6666 ) ( CLEAR ?auto_6656 ) ( LIFTING ?auto_6663 ?auto_6657 ) ( IS-CRATE ?auto_6657 ) ( not ( = ?auto_6656 ?auto_6657 ) ) ( not ( = ?auto_6658 ?auto_6656 ) ) ( not ( = ?auto_6659 ?auto_6656 ) ) ( not ( = ?auto_6661 ?auto_6656 ) ) ( not ( = ?auto_6662 ?auto_6656 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6657 ?auto_6658 ?auto_6659 )
      ( MAKE-3CRATE-VERIFY ?auto_6656 ?auto_6657 ?auto_6658 ?auto_6659 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6667 - SURFACE
      ?auto_6668 - SURFACE
      ?auto_6669 - SURFACE
      ?auto_6670 - SURFACE
      ?auto_6671 - SURFACE
    )
    :vars
    (
      ?auto_6675 - HOIST
      ?auto_6678 - PLACE
      ?auto_6677 - PLACE
      ?auto_6672 - HOIST
      ?auto_6673 - SURFACE
      ?auto_6674 - SURFACE
      ?auto_6676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6675 ?auto_6678 ) ( IS-CRATE ?auto_6671 ) ( not ( = ?auto_6670 ?auto_6671 ) ) ( not ( = ?auto_6669 ?auto_6670 ) ) ( not ( = ?auto_6669 ?auto_6671 ) ) ( not ( = ?auto_6677 ?auto_6678 ) ) ( HOIST-AT ?auto_6672 ?auto_6677 ) ( not ( = ?auto_6675 ?auto_6672 ) ) ( SURFACE-AT ?auto_6671 ?auto_6677 ) ( ON ?auto_6671 ?auto_6673 ) ( CLEAR ?auto_6671 ) ( not ( = ?auto_6670 ?auto_6673 ) ) ( not ( = ?auto_6671 ?auto_6673 ) ) ( not ( = ?auto_6669 ?auto_6673 ) ) ( IS-CRATE ?auto_6670 ) ( AVAILABLE ?auto_6672 ) ( SURFACE-AT ?auto_6670 ?auto_6677 ) ( ON ?auto_6670 ?auto_6674 ) ( CLEAR ?auto_6670 ) ( not ( = ?auto_6670 ?auto_6674 ) ) ( not ( = ?auto_6671 ?auto_6674 ) ) ( not ( = ?auto_6669 ?auto_6674 ) ) ( not ( = ?auto_6673 ?auto_6674 ) ) ( TRUCK-AT ?auto_6676 ?auto_6678 ) ( SURFACE-AT ?auto_6668 ?auto_6678 ) ( CLEAR ?auto_6668 ) ( LIFTING ?auto_6675 ?auto_6669 ) ( IS-CRATE ?auto_6669 ) ( not ( = ?auto_6668 ?auto_6669 ) ) ( not ( = ?auto_6670 ?auto_6668 ) ) ( not ( = ?auto_6671 ?auto_6668 ) ) ( not ( = ?auto_6673 ?auto_6668 ) ) ( not ( = ?auto_6674 ?auto_6668 ) ) ( ON ?auto_6668 ?auto_6667 ) ( not ( = ?auto_6667 ?auto_6668 ) ) ( not ( = ?auto_6667 ?auto_6669 ) ) ( not ( = ?auto_6667 ?auto_6670 ) ) ( not ( = ?auto_6667 ?auto_6671 ) ) ( not ( = ?auto_6667 ?auto_6673 ) ) ( not ( = ?auto_6667 ?auto_6674 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6669 ?auto_6670 ?auto_6671 )
      ( MAKE-4CRATE-VERIFY ?auto_6667 ?auto_6668 ?auto_6669 ?auto_6670 ?auto_6671 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6679 - SURFACE
      ?auto_6680 - SURFACE
    )
    :vars
    (
      ?auto_6685 - HOIST
      ?auto_6688 - PLACE
      ?auto_6689 - SURFACE
      ?auto_6687 - PLACE
      ?auto_6681 - HOIST
      ?auto_6683 - SURFACE
      ?auto_6684 - SURFACE
      ?auto_6686 - TRUCK
      ?auto_6682 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6685 ?auto_6688 ) ( IS-CRATE ?auto_6680 ) ( not ( = ?auto_6679 ?auto_6680 ) ) ( not ( = ?auto_6689 ?auto_6679 ) ) ( not ( = ?auto_6689 ?auto_6680 ) ) ( not ( = ?auto_6687 ?auto_6688 ) ) ( HOIST-AT ?auto_6681 ?auto_6687 ) ( not ( = ?auto_6685 ?auto_6681 ) ) ( SURFACE-AT ?auto_6680 ?auto_6687 ) ( ON ?auto_6680 ?auto_6683 ) ( CLEAR ?auto_6680 ) ( not ( = ?auto_6679 ?auto_6683 ) ) ( not ( = ?auto_6680 ?auto_6683 ) ) ( not ( = ?auto_6689 ?auto_6683 ) ) ( IS-CRATE ?auto_6679 ) ( AVAILABLE ?auto_6681 ) ( SURFACE-AT ?auto_6679 ?auto_6687 ) ( ON ?auto_6679 ?auto_6684 ) ( CLEAR ?auto_6679 ) ( not ( = ?auto_6679 ?auto_6684 ) ) ( not ( = ?auto_6680 ?auto_6684 ) ) ( not ( = ?auto_6689 ?auto_6684 ) ) ( not ( = ?auto_6683 ?auto_6684 ) ) ( TRUCK-AT ?auto_6686 ?auto_6688 ) ( SURFACE-AT ?auto_6682 ?auto_6688 ) ( CLEAR ?auto_6682 ) ( IS-CRATE ?auto_6689 ) ( not ( = ?auto_6682 ?auto_6689 ) ) ( not ( = ?auto_6679 ?auto_6682 ) ) ( not ( = ?auto_6680 ?auto_6682 ) ) ( not ( = ?auto_6683 ?auto_6682 ) ) ( not ( = ?auto_6684 ?auto_6682 ) ) ( AVAILABLE ?auto_6685 ) ( IN ?auto_6689 ?auto_6686 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6685 ?auto_6689 ?auto_6686 ?auto_6688 )
      ( MAKE-2CRATE ?auto_6689 ?auto_6679 ?auto_6680 )
      ( MAKE-1CRATE-VERIFY ?auto_6679 ?auto_6680 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6690 - SURFACE
      ?auto_6691 - SURFACE
      ?auto_6692 - SURFACE
    )
    :vars
    (
      ?auto_6695 - HOIST
      ?auto_6696 - PLACE
      ?auto_6699 - PLACE
      ?auto_6697 - HOIST
      ?auto_6700 - SURFACE
      ?auto_6698 - SURFACE
      ?auto_6693 - TRUCK
      ?auto_6694 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6695 ?auto_6696 ) ( IS-CRATE ?auto_6692 ) ( not ( = ?auto_6691 ?auto_6692 ) ) ( not ( = ?auto_6690 ?auto_6691 ) ) ( not ( = ?auto_6690 ?auto_6692 ) ) ( not ( = ?auto_6699 ?auto_6696 ) ) ( HOIST-AT ?auto_6697 ?auto_6699 ) ( not ( = ?auto_6695 ?auto_6697 ) ) ( SURFACE-AT ?auto_6692 ?auto_6699 ) ( ON ?auto_6692 ?auto_6700 ) ( CLEAR ?auto_6692 ) ( not ( = ?auto_6691 ?auto_6700 ) ) ( not ( = ?auto_6692 ?auto_6700 ) ) ( not ( = ?auto_6690 ?auto_6700 ) ) ( IS-CRATE ?auto_6691 ) ( AVAILABLE ?auto_6697 ) ( SURFACE-AT ?auto_6691 ?auto_6699 ) ( ON ?auto_6691 ?auto_6698 ) ( CLEAR ?auto_6691 ) ( not ( = ?auto_6691 ?auto_6698 ) ) ( not ( = ?auto_6692 ?auto_6698 ) ) ( not ( = ?auto_6690 ?auto_6698 ) ) ( not ( = ?auto_6700 ?auto_6698 ) ) ( TRUCK-AT ?auto_6693 ?auto_6696 ) ( SURFACE-AT ?auto_6694 ?auto_6696 ) ( CLEAR ?auto_6694 ) ( IS-CRATE ?auto_6690 ) ( not ( = ?auto_6694 ?auto_6690 ) ) ( not ( = ?auto_6691 ?auto_6694 ) ) ( not ( = ?auto_6692 ?auto_6694 ) ) ( not ( = ?auto_6700 ?auto_6694 ) ) ( not ( = ?auto_6698 ?auto_6694 ) ) ( AVAILABLE ?auto_6695 ) ( IN ?auto_6690 ?auto_6693 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6691 ?auto_6692 )
      ( MAKE-2CRATE-VERIFY ?auto_6690 ?auto_6691 ?auto_6692 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6701 - SURFACE
      ?auto_6702 - SURFACE
      ?auto_6703 - SURFACE
      ?auto_6704 - SURFACE
    )
    :vars
    (
      ?auto_6706 - HOIST
      ?auto_6707 - PLACE
      ?auto_6705 - PLACE
      ?auto_6710 - HOIST
      ?auto_6711 - SURFACE
      ?auto_6709 - SURFACE
      ?auto_6708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6706 ?auto_6707 ) ( IS-CRATE ?auto_6704 ) ( not ( = ?auto_6703 ?auto_6704 ) ) ( not ( = ?auto_6702 ?auto_6703 ) ) ( not ( = ?auto_6702 ?auto_6704 ) ) ( not ( = ?auto_6705 ?auto_6707 ) ) ( HOIST-AT ?auto_6710 ?auto_6705 ) ( not ( = ?auto_6706 ?auto_6710 ) ) ( SURFACE-AT ?auto_6704 ?auto_6705 ) ( ON ?auto_6704 ?auto_6711 ) ( CLEAR ?auto_6704 ) ( not ( = ?auto_6703 ?auto_6711 ) ) ( not ( = ?auto_6704 ?auto_6711 ) ) ( not ( = ?auto_6702 ?auto_6711 ) ) ( IS-CRATE ?auto_6703 ) ( AVAILABLE ?auto_6710 ) ( SURFACE-AT ?auto_6703 ?auto_6705 ) ( ON ?auto_6703 ?auto_6709 ) ( CLEAR ?auto_6703 ) ( not ( = ?auto_6703 ?auto_6709 ) ) ( not ( = ?auto_6704 ?auto_6709 ) ) ( not ( = ?auto_6702 ?auto_6709 ) ) ( not ( = ?auto_6711 ?auto_6709 ) ) ( TRUCK-AT ?auto_6708 ?auto_6707 ) ( SURFACE-AT ?auto_6701 ?auto_6707 ) ( CLEAR ?auto_6701 ) ( IS-CRATE ?auto_6702 ) ( not ( = ?auto_6701 ?auto_6702 ) ) ( not ( = ?auto_6703 ?auto_6701 ) ) ( not ( = ?auto_6704 ?auto_6701 ) ) ( not ( = ?auto_6711 ?auto_6701 ) ) ( not ( = ?auto_6709 ?auto_6701 ) ) ( AVAILABLE ?auto_6706 ) ( IN ?auto_6702 ?auto_6708 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6702 ?auto_6703 ?auto_6704 )
      ( MAKE-3CRATE-VERIFY ?auto_6701 ?auto_6702 ?auto_6703 ?auto_6704 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6712 - SURFACE
      ?auto_6713 - SURFACE
      ?auto_6714 - SURFACE
      ?auto_6715 - SURFACE
      ?auto_6716 - SURFACE
    )
    :vars
    (
      ?auto_6718 - HOIST
      ?auto_6719 - PLACE
      ?auto_6717 - PLACE
      ?auto_6722 - HOIST
      ?auto_6723 - SURFACE
      ?auto_6721 - SURFACE
      ?auto_6720 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6718 ?auto_6719 ) ( IS-CRATE ?auto_6716 ) ( not ( = ?auto_6715 ?auto_6716 ) ) ( not ( = ?auto_6714 ?auto_6715 ) ) ( not ( = ?auto_6714 ?auto_6716 ) ) ( not ( = ?auto_6717 ?auto_6719 ) ) ( HOIST-AT ?auto_6722 ?auto_6717 ) ( not ( = ?auto_6718 ?auto_6722 ) ) ( SURFACE-AT ?auto_6716 ?auto_6717 ) ( ON ?auto_6716 ?auto_6723 ) ( CLEAR ?auto_6716 ) ( not ( = ?auto_6715 ?auto_6723 ) ) ( not ( = ?auto_6716 ?auto_6723 ) ) ( not ( = ?auto_6714 ?auto_6723 ) ) ( IS-CRATE ?auto_6715 ) ( AVAILABLE ?auto_6722 ) ( SURFACE-AT ?auto_6715 ?auto_6717 ) ( ON ?auto_6715 ?auto_6721 ) ( CLEAR ?auto_6715 ) ( not ( = ?auto_6715 ?auto_6721 ) ) ( not ( = ?auto_6716 ?auto_6721 ) ) ( not ( = ?auto_6714 ?auto_6721 ) ) ( not ( = ?auto_6723 ?auto_6721 ) ) ( TRUCK-AT ?auto_6720 ?auto_6719 ) ( SURFACE-AT ?auto_6713 ?auto_6719 ) ( CLEAR ?auto_6713 ) ( IS-CRATE ?auto_6714 ) ( not ( = ?auto_6713 ?auto_6714 ) ) ( not ( = ?auto_6715 ?auto_6713 ) ) ( not ( = ?auto_6716 ?auto_6713 ) ) ( not ( = ?auto_6723 ?auto_6713 ) ) ( not ( = ?auto_6721 ?auto_6713 ) ) ( AVAILABLE ?auto_6718 ) ( IN ?auto_6714 ?auto_6720 ) ( ON ?auto_6713 ?auto_6712 ) ( not ( = ?auto_6712 ?auto_6713 ) ) ( not ( = ?auto_6712 ?auto_6714 ) ) ( not ( = ?auto_6712 ?auto_6715 ) ) ( not ( = ?auto_6712 ?auto_6716 ) ) ( not ( = ?auto_6712 ?auto_6723 ) ) ( not ( = ?auto_6712 ?auto_6721 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6714 ?auto_6715 ?auto_6716 )
      ( MAKE-4CRATE-VERIFY ?auto_6712 ?auto_6713 ?auto_6714 ?auto_6715 ?auto_6716 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6724 - SURFACE
      ?auto_6725 - SURFACE
    )
    :vars
    (
      ?auto_6727 - HOIST
      ?auto_6728 - PLACE
      ?auto_6734 - SURFACE
      ?auto_6726 - PLACE
      ?auto_6732 - HOIST
      ?auto_6733 - SURFACE
      ?auto_6731 - SURFACE
      ?auto_6729 - SURFACE
      ?auto_6730 - TRUCK
      ?auto_6735 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6727 ?auto_6728 ) ( IS-CRATE ?auto_6725 ) ( not ( = ?auto_6724 ?auto_6725 ) ) ( not ( = ?auto_6734 ?auto_6724 ) ) ( not ( = ?auto_6734 ?auto_6725 ) ) ( not ( = ?auto_6726 ?auto_6728 ) ) ( HOIST-AT ?auto_6732 ?auto_6726 ) ( not ( = ?auto_6727 ?auto_6732 ) ) ( SURFACE-AT ?auto_6725 ?auto_6726 ) ( ON ?auto_6725 ?auto_6733 ) ( CLEAR ?auto_6725 ) ( not ( = ?auto_6724 ?auto_6733 ) ) ( not ( = ?auto_6725 ?auto_6733 ) ) ( not ( = ?auto_6734 ?auto_6733 ) ) ( IS-CRATE ?auto_6724 ) ( AVAILABLE ?auto_6732 ) ( SURFACE-AT ?auto_6724 ?auto_6726 ) ( ON ?auto_6724 ?auto_6731 ) ( CLEAR ?auto_6724 ) ( not ( = ?auto_6724 ?auto_6731 ) ) ( not ( = ?auto_6725 ?auto_6731 ) ) ( not ( = ?auto_6734 ?auto_6731 ) ) ( not ( = ?auto_6733 ?auto_6731 ) ) ( SURFACE-AT ?auto_6729 ?auto_6728 ) ( CLEAR ?auto_6729 ) ( IS-CRATE ?auto_6734 ) ( not ( = ?auto_6729 ?auto_6734 ) ) ( not ( = ?auto_6724 ?auto_6729 ) ) ( not ( = ?auto_6725 ?auto_6729 ) ) ( not ( = ?auto_6733 ?auto_6729 ) ) ( not ( = ?auto_6731 ?auto_6729 ) ) ( AVAILABLE ?auto_6727 ) ( IN ?auto_6734 ?auto_6730 ) ( TRUCK-AT ?auto_6730 ?auto_6735 ) ( not ( = ?auto_6735 ?auto_6728 ) ) ( not ( = ?auto_6726 ?auto_6735 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6730 ?auto_6735 ?auto_6728 )
      ( MAKE-2CRATE ?auto_6734 ?auto_6724 ?auto_6725 )
      ( MAKE-1CRATE-VERIFY ?auto_6724 ?auto_6725 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6736 - SURFACE
      ?auto_6737 - SURFACE
      ?auto_6738 - SURFACE
    )
    :vars
    (
      ?auto_6741 - HOIST
      ?auto_6740 - PLACE
      ?auto_6747 - PLACE
      ?auto_6745 - HOIST
      ?auto_6743 - SURFACE
      ?auto_6744 - SURFACE
      ?auto_6742 - SURFACE
      ?auto_6739 - TRUCK
      ?auto_6746 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6741 ?auto_6740 ) ( IS-CRATE ?auto_6738 ) ( not ( = ?auto_6737 ?auto_6738 ) ) ( not ( = ?auto_6736 ?auto_6737 ) ) ( not ( = ?auto_6736 ?auto_6738 ) ) ( not ( = ?auto_6747 ?auto_6740 ) ) ( HOIST-AT ?auto_6745 ?auto_6747 ) ( not ( = ?auto_6741 ?auto_6745 ) ) ( SURFACE-AT ?auto_6738 ?auto_6747 ) ( ON ?auto_6738 ?auto_6743 ) ( CLEAR ?auto_6738 ) ( not ( = ?auto_6737 ?auto_6743 ) ) ( not ( = ?auto_6738 ?auto_6743 ) ) ( not ( = ?auto_6736 ?auto_6743 ) ) ( IS-CRATE ?auto_6737 ) ( AVAILABLE ?auto_6745 ) ( SURFACE-AT ?auto_6737 ?auto_6747 ) ( ON ?auto_6737 ?auto_6744 ) ( CLEAR ?auto_6737 ) ( not ( = ?auto_6737 ?auto_6744 ) ) ( not ( = ?auto_6738 ?auto_6744 ) ) ( not ( = ?auto_6736 ?auto_6744 ) ) ( not ( = ?auto_6743 ?auto_6744 ) ) ( SURFACE-AT ?auto_6742 ?auto_6740 ) ( CLEAR ?auto_6742 ) ( IS-CRATE ?auto_6736 ) ( not ( = ?auto_6742 ?auto_6736 ) ) ( not ( = ?auto_6737 ?auto_6742 ) ) ( not ( = ?auto_6738 ?auto_6742 ) ) ( not ( = ?auto_6743 ?auto_6742 ) ) ( not ( = ?auto_6744 ?auto_6742 ) ) ( AVAILABLE ?auto_6741 ) ( IN ?auto_6736 ?auto_6739 ) ( TRUCK-AT ?auto_6739 ?auto_6746 ) ( not ( = ?auto_6746 ?auto_6740 ) ) ( not ( = ?auto_6747 ?auto_6746 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6737 ?auto_6738 )
      ( MAKE-2CRATE-VERIFY ?auto_6736 ?auto_6737 ?auto_6738 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6748 - SURFACE
      ?auto_6749 - SURFACE
      ?auto_6750 - SURFACE
      ?auto_6751 - SURFACE
    )
    :vars
    (
      ?auto_6754 - HOIST
      ?auto_6755 - PLACE
      ?auto_6759 - PLACE
      ?auto_6753 - HOIST
      ?auto_6756 - SURFACE
      ?auto_6757 - SURFACE
      ?auto_6758 - TRUCK
      ?auto_6752 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6754 ?auto_6755 ) ( IS-CRATE ?auto_6751 ) ( not ( = ?auto_6750 ?auto_6751 ) ) ( not ( = ?auto_6749 ?auto_6750 ) ) ( not ( = ?auto_6749 ?auto_6751 ) ) ( not ( = ?auto_6759 ?auto_6755 ) ) ( HOIST-AT ?auto_6753 ?auto_6759 ) ( not ( = ?auto_6754 ?auto_6753 ) ) ( SURFACE-AT ?auto_6751 ?auto_6759 ) ( ON ?auto_6751 ?auto_6756 ) ( CLEAR ?auto_6751 ) ( not ( = ?auto_6750 ?auto_6756 ) ) ( not ( = ?auto_6751 ?auto_6756 ) ) ( not ( = ?auto_6749 ?auto_6756 ) ) ( IS-CRATE ?auto_6750 ) ( AVAILABLE ?auto_6753 ) ( SURFACE-AT ?auto_6750 ?auto_6759 ) ( ON ?auto_6750 ?auto_6757 ) ( CLEAR ?auto_6750 ) ( not ( = ?auto_6750 ?auto_6757 ) ) ( not ( = ?auto_6751 ?auto_6757 ) ) ( not ( = ?auto_6749 ?auto_6757 ) ) ( not ( = ?auto_6756 ?auto_6757 ) ) ( SURFACE-AT ?auto_6748 ?auto_6755 ) ( CLEAR ?auto_6748 ) ( IS-CRATE ?auto_6749 ) ( not ( = ?auto_6748 ?auto_6749 ) ) ( not ( = ?auto_6750 ?auto_6748 ) ) ( not ( = ?auto_6751 ?auto_6748 ) ) ( not ( = ?auto_6756 ?auto_6748 ) ) ( not ( = ?auto_6757 ?auto_6748 ) ) ( AVAILABLE ?auto_6754 ) ( IN ?auto_6749 ?auto_6758 ) ( TRUCK-AT ?auto_6758 ?auto_6752 ) ( not ( = ?auto_6752 ?auto_6755 ) ) ( not ( = ?auto_6759 ?auto_6752 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6749 ?auto_6750 ?auto_6751 )
      ( MAKE-3CRATE-VERIFY ?auto_6748 ?auto_6749 ?auto_6750 ?auto_6751 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6760 - SURFACE
      ?auto_6761 - SURFACE
      ?auto_6762 - SURFACE
      ?auto_6763 - SURFACE
      ?auto_6764 - SURFACE
    )
    :vars
    (
      ?auto_6767 - HOIST
      ?auto_6768 - PLACE
      ?auto_6772 - PLACE
      ?auto_6766 - HOIST
      ?auto_6769 - SURFACE
      ?auto_6770 - SURFACE
      ?auto_6771 - TRUCK
      ?auto_6765 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6767 ?auto_6768 ) ( IS-CRATE ?auto_6764 ) ( not ( = ?auto_6763 ?auto_6764 ) ) ( not ( = ?auto_6762 ?auto_6763 ) ) ( not ( = ?auto_6762 ?auto_6764 ) ) ( not ( = ?auto_6772 ?auto_6768 ) ) ( HOIST-AT ?auto_6766 ?auto_6772 ) ( not ( = ?auto_6767 ?auto_6766 ) ) ( SURFACE-AT ?auto_6764 ?auto_6772 ) ( ON ?auto_6764 ?auto_6769 ) ( CLEAR ?auto_6764 ) ( not ( = ?auto_6763 ?auto_6769 ) ) ( not ( = ?auto_6764 ?auto_6769 ) ) ( not ( = ?auto_6762 ?auto_6769 ) ) ( IS-CRATE ?auto_6763 ) ( AVAILABLE ?auto_6766 ) ( SURFACE-AT ?auto_6763 ?auto_6772 ) ( ON ?auto_6763 ?auto_6770 ) ( CLEAR ?auto_6763 ) ( not ( = ?auto_6763 ?auto_6770 ) ) ( not ( = ?auto_6764 ?auto_6770 ) ) ( not ( = ?auto_6762 ?auto_6770 ) ) ( not ( = ?auto_6769 ?auto_6770 ) ) ( SURFACE-AT ?auto_6761 ?auto_6768 ) ( CLEAR ?auto_6761 ) ( IS-CRATE ?auto_6762 ) ( not ( = ?auto_6761 ?auto_6762 ) ) ( not ( = ?auto_6763 ?auto_6761 ) ) ( not ( = ?auto_6764 ?auto_6761 ) ) ( not ( = ?auto_6769 ?auto_6761 ) ) ( not ( = ?auto_6770 ?auto_6761 ) ) ( AVAILABLE ?auto_6767 ) ( IN ?auto_6762 ?auto_6771 ) ( TRUCK-AT ?auto_6771 ?auto_6765 ) ( not ( = ?auto_6765 ?auto_6768 ) ) ( not ( = ?auto_6772 ?auto_6765 ) ) ( ON ?auto_6761 ?auto_6760 ) ( not ( = ?auto_6760 ?auto_6761 ) ) ( not ( = ?auto_6760 ?auto_6762 ) ) ( not ( = ?auto_6760 ?auto_6763 ) ) ( not ( = ?auto_6760 ?auto_6764 ) ) ( not ( = ?auto_6760 ?auto_6769 ) ) ( not ( = ?auto_6760 ?auto_6770 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6762 ?auto_6763 ?auto_6764 )
      ( MAKE-4CRATE-VERIFY ?auto_6760 ?auto_6761 ?auto_6762 ?auto_6763 ?auto_6764 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6773 - SURFACE
      ?auto_6774 - SURFACE
    )
    :vars
    (
      ?auto_6777 - HOIST
      ?auto_6778 - PLACE
      ?auto_6784 - SURFACE
      ?auto_6783 - PLACE
      ?auto_6776 - HOIST
      ?auto_6779 - SURFACE
      ?auto_6780 - SURFACE
      ?auto_6781 - SURFACE
      ?auto_6782 - TRUCK
      ?auto_6775 - PLACE
      ?auto_6785 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6777 ?auto_6778 ) ( IS-CRATE ?auto_6774 ) ( not ( = ?auto_6773 ?auto_6774 ) ) ( not ( = ?auto_6784 ?auto_6773 ) ) ( not ( = ?auto_6784 ?auto_6774 ) ) ( not ( = ?auto_6783 ?auto_6778 ) ) ( HOIST-AT ?auto_6776 ?auto_6783 ) ( not ( = ?auto_6777 ?auto_6776 ) ) ( SURFACE-AT ?auto_6774 ?auto_6783 ) ( ON ?auto_6774 ?auto_6779 ) ( CLEAR ?auto_6774 ) ( not ( = ?auto_6773 ?auto_6779 ) ) ( not ( = ?auto_6774 ?auto_6779 ) ) ( not ( = ?auto_6784 ?auto_6779 ) ) ( IS-CRATE ?auto_6773 ) ( AVAILABLE ?auto_6776 ) ( SURFACE-AT ?auto_6773 ?auto_6783 ) ( ON ?auto_6773 ?auto_6780 ) ( CLEAR ?auto_6773 ) ( not ( = ?auto_6773 ?auto_6780 ) ) ( not ( = ?auto_6774 ?auto_6780 ) ) ( not ( = ?auto_6784 ?auto_6780 ) ) ( not ( = ?auto_6779 ?auto_6780 ) ) ( SURFACE-AT ?auto_6781 ?auto_6778 ) ( CLEAR ?auto_6781 ) ( IS-CRATE ?auto_6784 ) ( not ( = ?auto_6781 ?auto_6784 ) ) ( not ( = ?auto_6773 ?auto_6781 ) ) ( not ( = ?auto_6774 ?auto_6781 ) ) ( not ( = ?auto_6779 ?auto_6781 ) ) ( not ( = ?auto_6780 ?auto_6781 ) ) ( AVAILABLE ?auto_6777 ) ( TRUCK-AT ?auto_6782 ?auto_6775 ) ( not ( = ?auto_6775 ?auto_6778 ) ) ( not ( = ?auto_6783 ?auto_6775 ) ) ( HOIST-AT ?auto_6785 ?auto_6775 ) ( LIFTING ?auto_6785 ?auto_6784 ) ( not ( = ?auto_6777 ?auto_6785 ) ) ( not ( = ?auto_6776 ?auto_6785 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6785 ?auto_6784 ?auto_6782 ?auto_6775 )
      ( MAKE-2CRATE ?auto_6784 ?auto_6773 ?auto_6774 )
      ( MAKE-1CRATE-VERIFY ?auto_6773 ?auto_6774 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6786 - SURFACE
      ?auto_6787 - SURFACE
      ?auto_6788 - SURFACE
    )
    :vars
    (
      ?auto_6793 - HOIST
      ?auto_6795 - PLACE
      ?auto_6791 - PLACE
      ?auto_6798 - HOIST
      ?auto_6792 - SURFACE
      ?auto_6794 - SURFACE
      ?auto_6796 - SURFACE
      ?auto_6789 - TRUCK
      ?auto_6790 - PLACE
      ?auto_6797 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6793 ?auto_6795 ) ( IS-CRATE ?auto_6788 ) ( not ( = ?auto_6787 ?auto_6788 ) ) ( not ( = ?auto_6786 ?auto_6787 ) ) ( not ( = ?auto_6786 ?auto_6788 ) ) ( not ( = ?auto_6791 ?auto_6795 ) ) ( HOIST-AT ?auto_6798 ?auto_6791 ) ( not ( = ?auto_6793 ?auto_6798 ) ) ( SURFACE-AT ?auto_6788 ?auto_6791 ) ( ON ?auto_6788 ?auto_6792 ) ( CLEAR ?auto_6788 ) ( not ( = ?auto_6787 ?auto_6792 ) ) ( not ( = ?auto_6788 ?auto_6792 ) ) ( not ( = ?auto_6786 ?auto_6792 ) ) ( IS-CRATE ?auto_6787 ) ( AVAILABLE ?auto_6798 ) ( SURFACE-AT ?auto_6787 ?auto_6791 ) ( ON ?auto_6787 ?auto_6794 ) ( CLEAR ?auto_6787 ) ( not ( = ?auto_6787 ?auto_6794 ) ) ( not ( = ?auto_6788 ?auto_6794 ) ) ( not ( = ?auto_6786 ?auto_6794 ) ) ( not ( = ?auto_6792 ?auto_6794 ) ) ( SURFACE-AT ?auto_6796 ?auto_6795 ) ( CLEAR ?auto_6796 ) ( IS-CRATE ?auto_6786 ) ( not ( = ?auto_6796 ?auto_6786 ) ) ( not ( = ?auto_6787 ?auto_6796 ) ) ( not ( = ?auto_6788 ?auto_6796 ) ) ( not ( = ?auto_6792 ?auto_6796 ) ) ( not ( = ?auto_6794 ?auto_6796 ) ) ( AVAILABLE ?auto_6793 ) ( TRUCK-AT ?auto_6789 ?auto_6790 ) ( not ( = ?auto_6790 ?auto_6795 ) ) ( not ( = ?auto_6791 ?auto_6790 ) ) ( HOIST-AT ?auto_6797 ?auto_6790 ) ( LIFTING ?auto_6797 ?auto_6786 ) ( not ( = ?auto_6793 ?auto_6797 ) ) ( not ( = ?auto_6798 ?auto_6797 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6787 ?auto_6788 )
      ( MAKE-2CRATE-VERIFY ?auto_6786 ?auto_6787 ?auto_6788 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6799 - SURFACE
      ?auto_6800 - SURFACE
      ?auto_6801 - SURFACE
      ?auto_6802 - SURFACE
    )
    :vars
    (
      ?auto_6807 - HOIST
      ?auto_6805 - PLACE
      ?auto_6811 - PLACE
      ?auto_6808 - HOIST
      ?auto_6809 - SURFACE
      ?auto_6804 - SURFACE
      ?auto_6803 - TRUCK
      ?auto_6806 - PLACE
      ?auto_6810 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6807 ?auto_6805 ) ( IS-CRATE ?auto_6802 ) ( not ( = ?auto_6801 ?auto_6802 ) ) ( not ( = ?auto_6800 ?auto_6801 ) ) ( not ( = ?auto_6800 ?auto_6802 ) ) ( not ( = ?auto_6811 ?auto_6805 ) ) ( HOIST-AT ?auto_6808 ?auto_6811 ) ( not ( = ?auto_6807 ?auto_6808 ) ) ( SURFACE-AT ?auto_6802 ?auto_6811 ) ( ON ?auto_6802 ?auto_6809 ) ( CLEAR ?auto_6802 ) ( not ( = ?auto_6801 ?auto_6809 ) ) ( not ( = ?auto_6802 ?auto_6809 ) ) ( not ( = ?auto_6800 ?auto_6809 ) ) ( IS-CRATE ?auto_6801 ) ( AVAILABLE ?auto_6808 ) ( SURFACE-AT ?auto_6801 ?auto_6811 ) ( ON ?auto_6801 ?auto_6804 ) ( CLEAR ?auto_6801 ) ( not ( = ?auto_6801 ?auto_6804 ) ) ( not ( = ?auto_6802 ?auto_6804 ) ) ( not ( = ?auto_6800 ?auto_6804 ) ) ( not ( = ?auto_6809 ?auto_6804 ) ) ( SURFACE-AT ?auto_6799 ?auto_6805 ) ( CLEAR ?auto_6799 ) ( IS-CRATE ?auto_6800 ) ( not ( = ?auto_6799 ?auto_6800 ) ) ( not ( = ?auto_6801 ?auto_6799 ) ) ( not ( = ?auto_6802 ?auto_6799 ) ) ( not ( = ?auto_6809 ?auto_6799 ) ) ( not ( = ?auto_6804 ?auto_6799 ) ) ( AVAILABLE ?auto_6807 ) ( TRUCK-AT ?auto_6803 ?auto_6806 ) ( not ( = ?auto_6806 ?auto_6805 ) ) ( not ( = ?auto_6811 ?auto_6806 ) ) ( HOIST-AT ?auto_6810 ?auto_6806 ) ( LIFTING ?auto_6810 ?auto_6800 ) ( not ( = ?auto_6807 ?auto_6810 ) ) ( not ( = ?auto_6808 ?auto_6810 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6800 ?auto_6801 ?auto_6802 )
      ( MAKE-3CRATE-VERIFY ?auto_6799 ?auto_6800 ?auto_6801 ?auto_6802 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6812 - SURFACE
      ?auto_6813 - SURFACE
      ?auto_6814 - SURFACE
      ?auto_6815 - SURFACE
      ?auto_6816 - SURFACE
    )
    :vars
    (
      ?auto_6821 - HOIST
      ?auto_6819 - PLACE
      ?auto_6825 - PLACE
      ?auto_6822 - HOIST
      ?auto_6823 - SURFACE
      ?auto_6818 - SURFACE
      ?auto_6817 - TRUCK
      ?auto_6820 - PLACE
      ?auto_6824 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6821 ?auto_6819 ) ( IS-CRATE ?auto_6816 ) ( not ( = ?auto_6815 ?auto_6816 ) ) ( not ( = ?auto_6814 ?auto_6815 ) ) ( not ( = ?auto_6814 ?auto_6816 ) ) ( not ( = ?auto_6825 ?auto_6819 ) ) ( HOIST-AT ?auto_6822 ?auto_6825 ) ( not ( = ?auto_6821 ?auto_6822 ) ) ( SURFACE-AT ?auto_6816 ?auto_6825 ) ( ON ?auto_6816 ?auto_6823 ) ( CLEAR ?auto_6816 ) ( not ( = ?auto_6815 ?auto_6823 ) ) ( not ( = ?auto_6816 ?auto_6823 ) ) ( not ( = ?auto_6814 ?auto_6823 ) ) ( IS-CRATE ?auto_6815 ) ( AVAILABLE ?auto_6822 ) ( SURFACE-AT ?auto_6815 ?auto_6825 ) ( ON ?auto_6815 ?auto_6818 ) ( CLEAR ?auto_6815 ) ( not ( = ?auto_6815 ?auto_6818 ) ) ( not ( = ?auto_6816 ?auto_6818 ) ) ( not ( = ?auto_6814 ?auto_6818 ) ) ( not ( = ?auto_6823 ?auto_6818 ) ) ( SURFACE-AT ?auto_6813 ?auto_6819 ) ( CLEAR ?auto_6813 ) ( IS-CRATE ?auto_6814 ) ( not ( = ?auto_6813 ?auto_6814 ) ) ( not ( = ?auto_6815 ?auto_6813 ) ) ( not ( = ?auto_6816 ?auto_6813 ) ) ( not ( = ?auto_6823 ?auto_6813 ) ) ( not ( = ?auto_6818 ?auto_6813 ) ) ( AVAILABLE ?auto_6821 ) ( TRUCK-AT ?auto_6817 ?auto_6820 ) ( not ( = ?auto_6820 ?auto_6819 ) ) ( not ( = ?auto_6825 ?auto_6820 ) ) ( HOIST-AT ?auto_6824 ?auto_6820 ) ( LIFTING ?auto_6824 ?auto_6814 ) ( not ( = ?auto_6821 ?auto_6824 ) ) ( not ( = ?auto_6822 ?auto_6824 ) ) ( ON ?auto_6813 ?auto_6812 ) ( not ( = ?auto_6812 ?auto_6813 ) ) ( not ( = ?auto_6812 ?auto_6814 ) ) ( not ( = ?auto_6812 ?auto_6815 ) ) ( not ( = ?auto_6812 ?auto_6816 ) ) ( not ( = ?auto_6812 ?auto_6823 ) ) ( not ( = ?auto_6812 ?auto_6818 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6814 ?auto_6815 ?auto_6816 )
      ( MAKE-4CRATE-VERIFY ?auto_6812 ?auto_6813 ?auto_6814 ?auto_6815 ?auto_6816 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6826 - SURFACE
      ?auto_6827 - SURFACE
    )
    :vars
    (
      ?auto_6833 - HOIST
      ?auto_6830 - PLACE
      ?auto_6838 - SURFACE
      ?auto_6837 - PLACE
      ?auto_6834 - HOIST
      ?auto_6835 - SURFACE
      ?auto_6829 - SURFACE
      ?auto_6831 - SURFACE
      ?auto_6828 - TRUCK
      ?auto_6832 - PLACE
      ?auto_6836 - HOIST
      ?auto_6839 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6833 ?auto_6830 ) ( IS-CRATE ?auto_6827 ) ( not ( = ?auto_6826 ?auto_6827 ) ) ( not ( = ?auto_6838 ?auto_6826 ) ) ( not ( = ?auto_6838 ?auto_6827 ) ) ( not ( = ?auto_6837 ?auto_6830 ) ) ( HOIST-AT ?auto_6834 ?auto_6837 ) ( not ( = ?auto_6833 ?auto_6834 ) ) ( SURFACE-AT ?auto_6827 ?auto_6837 ) ( ON ?auto_6827 ?auto_6835 ) ( CLEAR ?auto_6827 ) ( not ( = ?auto_6826 ?auto_6835 ) ) ( not ( = ?auto_6827 ?auto_6835 ) ) ( not ( = ?auto_6838 ?auto_6835 ) ) ( IS-CRATE ?auto_6826 ) ( AVAILABLE ?auto_6834 ) ( SURFACE-AT ?auto_6826 ?auto_6837 ) ( ON ?auto_6826 ?auto_6829 ) ( CLEAR ?auto_6826 ) ( not ( = ?auto_6826 ?auto_6829 ) ) ( not ( = ?auto_6827 ?auto_6829 ) ) ( not ( = ?auto_6838 ?auto_6829 ) ) ( not ( = ?auto_6835 ?auto_6829 ) ) ( SURFACE-AT ?auto_6831 ?auto_6830 ) ( CLEAR ?auto_6831 ) ( IS-CRATE ?auto_6838 ) ( not ( = ?auto_6831 ?auto_6838 ) ) ( not ( = ?auto_6826 ?auto_6831 ) ) ( not ( = ?auto_6827 ?auto_6831 ) ) ( not ( = ?auto_6835 ?auto_6831 ) ) ( not ( = ?auto_6829 ?auto_6831 ) ) ( AVAILABLE ?auto_6833 ) ( TRUCK-AT ?auto_6828 ?auto_6832 ) ( not ( = ?auto_6832 ?auto_6830 ) ) ( not ( = ?auto_6837 ?auto_6832 ) ) ( HOIST-AT ?auto_6836 ?auto_6832 ) ( not ( = ?auto_6833 ?auto_6836 ) ) ( not ( = ?auto_6834 ?auto_6836 ) ) ( AVAILABLE ?auto_6836 ) ( SURFACE-AT ?auto_6838 ?auto_6832 ) ( ON ?auto_6838 ?auto_6839 ) ( CLEAR ?auto_6838 ) ( not ( = ?auto_6826 ?auto_6839 ) ) ( not ( = ?auto_6827 ?auto_6839 ) ) ( not ( = ?auto_6838 ?auto_6839 ) ) ( not ( = ?auto_6835 ?auto_6839 ) ) ( not ( = ?auto_6829 ?auto_6839 ) ) ( not ( = ?auto_6831 ?auto_6839 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6836 ?auto_6838 ?auto_6839 ?auto_6832 )
      ( MAKE-2CRATE ?auto_6838 ?auto_6826 ?auto_6827 )
      ( MAKE-1CRATE-VERIFY ?auto_6826 ?auto_6827 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6840 - SURFACE
      ?auto_6841 - SURFACE
      ?auto_6842 - SURFACE
    )
    :vars
    (
      ?auto_6850 - HOIST
      ?auto_6852 - PLACE
      ?auto_6848 - PLACE
      ?auto_6843 - HOIST
      ?auto_6845 - SURFACE
      ?auto_6847 - SURFACE
      ?auto_6844 - SURFACE
      ?auto_6853 - TRUCK
      ?auto_6846 - PLACE
      ?auto_6849 - HOIST
      ?auto_6851 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6850 ?auto_6852 ) ( IS-CRATE ?auto_6842 ) ( not ( = ?auto_6841 ?auto_6842 ) ) ( not ( = ?auto_6840 ?auto_6841 ) ) ( not ( = ?auto_6840 ?auto_6842 ) ) ( not ( = ?auto_6848 ?auto_6852 ) ) ( HOIST-AT ?auto_6843 ?auto_6848 ) ( not ( = ?auto_6850 ?auto_6843 ) ) ( SURFACE-AT ?auto_6842 ?auto_6848 ) ( ON ?auto_6842 ?auto_6845 ) ( CLEAR ?auto_6842 ) ( not ( = ?auto_6841 ?auto_6845 ) ) ( not ( = ?auto_6842 ?auto_6845 ) ) ( not ( = ?auto_6840 ?auto_6845 ) ) ( IS-CRATE ?auto_6841 ) ( AVAILABLE ?auto_6843 ) ( SURFACE-AT ?auto_6841 ?auto_6848 ) ( ON ?auto_6841 ?auto_6847 ) ( CLEAR ?auto_6841 ) ( not ( = ?auto_6841 ?auto_6847 ) ) ( not ( = ?auto_6842 ?auto_6847 ) ) ( not ( = ?auto_6840 ?auto_6847 ) ) ( not ( = ?auto_6845 ?auto_6847 ) ) ( SURFACE-AT ?auto_6844 ?auto_6852 ) ( CLEAR ?auto_6844 ) ( IS-CRATE ?auto_6840 ) ( not ( = ?auto_6844 ?auto_6840 ) ) ( not ( = ?auto_6841 ?auto_6844 ) ) ( not ( = ?auto_6842 ?auto_6844 ) ) ( not ( = ?auto_6845 ?auto_6844 ) ) ( not ( = ?auto_6847 ?auto_6844 ) ) ( AVAILABLE ?auto_6850 ) ( TRUCK-AT ?auto_6853 ?auto_6846 ) ( not ( = ?auto_6846 ?auto_6852 ) ) ( not ( = ?auto_6848 ?auto_6846 ) ) ( HOIST-AT ?auto_6849 ?auto_6846 ) ( not ( = ?auto_6850 ?auto_6849 ) ) ( not ( = ?auto_6843 ?auto_6849 ) ) ( AVAILABLE ?auto_6849 ) ( SURFACE-AT ?auto_6840 ?auto_6846 ) ( ON ?auto_6840 ?auto_6851 ) ( CLEAR ?auto_6840 ) ( not ( = ?auto_6841 ?auto_6851 ) ) ( not ( = ?auto_6842 ?auto_6851 ) ) ( not ( = ?auto_6840 ?auto_6851 ) ) ( not ( = ?auto_6845 ?auto_6851 ) ) ( not ( = ?auto_6847 ?auto_6851 ) ) ( not ( = ?auto_6844 ?auto_6851 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6841 ?auto_6842 )
      ( MAKE-2CRATE-VERIFY ?auto_6840 ?auto_6841 ?auto_6842 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6854 - SURFACE
      ?auto_6855 - SURFACE
      ?auto_6856 - SURFACE
      ?auto_6857 - SURFACE
    )
    :vars
    (
      ?auto_6864 - HOIST
      ?auto_6860 - PLACE
      ?auto_6866 - PLACE
      ?auto_6862 - HOIST
      ?auto_6867 - SURFACE
      ?auto_6858 - SURFACE
      ?auto_6859 - TRUCK
      ?auto_6863 - PLACE
      ?auto_6861 - HOIST
      ?auto_6865 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6864 ?auto_6860 ) ( IS-CRATE ?auto_6857 ) ( not ( = ?auto_6856 ?auto_6857 ) ) ( not ( = ?auto_6855 ?auto_6856 ) ) ( not ( = ?auto_6855 ?auto_6857 ) ) ( not ( = ?auto_6866 ?auto_6860 ) ) ( HOIST-AT ?auto_6862 ?auto_6866 ) ( not ( = ?auto_6864 ?auto_6862 ) ) ( SURFACE-AT ?auto_6857 ?auto_6866 ) ( ON ?auto_6857 ?auto_6867 ) ( CLEAR ?auto_6857 ) ( not ( = ?auto_6856 ?auto_6867 ) ) ( not ( = ?auto_6857 ?auto_6867 ) ) ( not ( = ?auto_6855 ?auto_6867 ) ) ( IS-CRATE ?auto_6856 ) ( AVAILABLE ?auto_6862 ) ( SURFACE-AT ?auto_6856 ?auto_6866 ) ( ON ?auto_6856 ?auto_6858 ) ( CLEAR ?auto_6856 ) ( not ( = ?auto_6856 ?auto_6858 ) ) ( not ( = ?auto_6857 ?auto_6858 ) ) ( not ( = ?auto_6855 ?auto_6858 ) ) ( not ( = ?auto_6867 ?auto_6858 ) ) ( SURFACE-AT ?auto_6854 ?auto_6860 ) ( CLEAR ?auto_6854 ) ( IS-CRATE ?auto_6855 ) ( not ( = ?auto_6854 ?auto_6855 ) ) ( not ( = ?auto_6856 ?auto_6854 ) ) ( not ( = ?auto_6857 ?auto_6854 ) ) ( not ( = ?auto_6867 ?auto_6854 ) ) ( not ( = ?auto_6858 ?auto_6854 ) ) ( AVAILABLE ?auto_6864 ) ( TRUCK-AT ?auto_6859 ?auto_6863 ) ( not ( = ?auto_6863 ?auto_6860 ) ) ( not ( = ?auto_6866 ?auto_6863 ) ) ( HOIST-AT ?auto_6861 ?auto_6863 ) ( not ( = ?auto_6864 ?auto_6861 ) ) ( not ( = ?auto_6862 ?auto_6861 ) ) ( AVAILABLE ?auto_6861 ) ( SURFACE-AT ?auto_6855 ?auto_6863 ) ( ON ?auto_6855 ?auto_6865 ) ( CLEAR ?auto_6855 ) ( not ( = ?auto_6856 ?auto_6865 ) ) ( not ( = ?auto_6857 ?auto_6865 ) ) ( not ( = ?auto_6855 ?auto_6865 ) ) ( not ( = ?auto_6867 ?auto_6865 ) ) ( not ( = ?auto_6858 ?auto_6865 ) ) ( not ( = ?auto_6854 ?auto_6865 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6855 ?auto_6856 ?auto_6857 )
      ( MAKE-3CRATE-VERIFY ?auto_6854 ?auto_6855 ?auto_6856 ?auto_6857 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6868 - SURFACE
      ?auto_6869 - SURFACE
      ?auto_6870 - SURFACE
      ?auto_6871 - SURFACE
      ?auto_6872 - SURFACE
    )
    :vars
    (
      ?auto_6879 - HOIST
      ?auto_6875 - PLACE
      ?auto_6881 - PLACE
      ?auto_6877 - HOIST
      ?auto_6882 - SURFACE
      ?auto_6873 - SURFACE
      ?auto_6874 - TRUCK
      ?auto_6878 - PLACE
      ?auto_6876 - HOIST
      ?auto_6880 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6879 ?auto_6875 ) ( IS-CRATE ?auto_6872 ) ( not ( = ?auto_6871 ?auto_6872 ) ) ( not ( = ?auto_6870 ?auto_6871 ) ) ( not ( = ?auto_6870 ?auto_6872 ) ) ( not ( = ?auto_6881 ?auto_6875 ) ) ( HOIST-AT ?auto_6877 ?auto_6881 ) ( not ( = ?auto_6879 ?auto_6877 ) ) ( SURFACE-AT ?auto_6872 ?auto_6881 ) ( ON ?auto_6872 ?auto_6882 ) ( CLEAR ?auto_6872 ) ( not ( = ?auto_6871 ?auto_6882 ) ) ( not ( = ?auto_6872 ?auto_6882 ) ) ( not ( = ?auto_6870 ?auto_6882 ) ) ( IS-CRATE ?auto_6871 ) ( AVAILABLE ?auto_6877 ) ( SURFACE-AT ?auto_6871 ?auto_6881 ) ( ON ?auto_6871 ?auto_6873 ) ( CLEAR ?auto_6871 ) ( not ( = ?auto_6871 ?auto_6873 ) ) ( not ( = ?auto_6872 ?auto_6873 ) ) ( not ( = ?auto_6870 ?auto_6873 ) ) ( not ( = ?auto_6882 ?auto_6873 ) ) ( SURFACE-AT ?auto_6869 ?auto_6875 ) ( CLEAR ?auto_6869 ) ( IS-CRATE ?auto_6870 ) ( not ( = ?auto_6869 ?auto_6870 ) ) ( not ( = ?auto_6871 ?auto_6869 ) ) ( not ( = ?auto_6872 ?auto_6869 ) ) ( not ( = ?auto_6882 ?auto_6869 ) ) ( not ( = ?auto_6873 ?auto_6869 ) ) ( AVAILABLE ?auto_6879 ) ( TRUCK-AT ?auto_6874 ?auto_6878 ) ( not ( = ?auto_6878 ?auto_6875 ) ) ( not ( = ?auto_6881 ?auto_6878 ) ) ( HOIST-AT ?auto_6876 ?auto_6878 ) ( not ( = ?auto_6879 ?auto_6876 ) ) ( not ( = ?auto_6877 ?auto_6876 ) ) ( AVAILABLE ?auto_6876 ) ( SURFACE-AT ?auto_6870 ?auto_6878 ) ( ON ?auto_6870 ?auto_6880 ) ( CLEAR ?auto_6870 ) ( not ( = ?auto_6871 ?auto_6880 ) ) ( not ( = ?auto_6872 ?auto_6880 ) ) ( not ( = ?auto_6870 ?auto_6880 ) ) ( not ( = ?auto_6882 ?auto_6880 ) ) ( not ( = ?auto_6873 ?auto_6880 ) ) ( not ( = ?auto_6869 ?auto_6880 ) ) ( ON ?auto_6869 ?auto_6868 ) ( not ( = ?auto_6868 ?auto_6869 ) ) ( not ( = ?auto_6868 ?auto_6870 ) ) ( not ( = ?auto_6868 ?auto_6871 ) ) ( not ( = ?auto_6868 ?auto_6872 ) ) ( not ( = ?auto_6868 ?auto_6882 ) ) ( not ( = ?auto_6868 ?auto_6873 ) ) ( not ( = ?auto_6868 ?auto_6880 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6870 ?auto_6871 ?auto_6872 )
      ( MAKE-4CRATE-VERIFY ?auto_6868 ?auto_6869 ?auto_6870 ?auto_6871 ?auto_6872 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6883 - SURFACE
      ?auto_6884 - SURFACE
    )
    :vars
    (
      ?auto_6891 - HOIST
      ?auto_6887 - PLACE
      ?auto_6896 - SURFACE
      ?auto_6893 - PLACE
      ?auto_6889 - HOIST
      ?auto_6894 - SURFACE
      ?auto_6885 - SURFACE
      ?auto_6895 - SURFACE
      ?auto_6890 - PLACE
      ?auto_6888 - HOIST
      ?auto_6892 - SURFACE
      ?auto_6886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6891 ?auto_6887 ) ( IS-CRATE ?auto_6884 ) ( not ( = ?auto_6883 ?auto_6884 ) ) ( not ( = ?auto_6896 ?auto_6883 ) ) ( not ( = ?auto_6896 ?auto_6884 ) ) ( not ( = ?auto_6893 ?auto_6887 ) ) ( HOIST-AT ?auto_6889 ?auto_6893 ) ( not ( = ?auto_6891 ?auto_6889 ) ) ( SURFACE-AT ?auto_6884 ?auto_6893 ) ( ON ?auto_6884 ?auto_6894 ) ( CLEAR ?auto_6884 ) ( not ( = ?auto_6883 ?auto_6894 ) ) ( not ( = ?auto_6884 ?auto_6894 ) ) ( not ( = ?auto_6896 ?auto_6894 ) ) ( IS-CRATE ?auto_6883 ) ( AVAILABLE ?auto_6889 ) ( SURFACE-AT ?auto_6883 ?auto_6893 ) ( ON ?auto_6883 ?auto_6885 ) ( CLEAR ?auto_6883 ) ( not ( = ?auto_6883 ?auto_6885 ) ) ( not ( = ?auto_6884 ?auto_6885 ) ) ( not ( = ?auto_6896 ?auto_6885 ) ) ( not ( = ?auto_6894 ?auto_6885 ) ) ( SURFACE-AT ?auto_6895 ?auto_6887 ) ( CLEAR ?auto_6895 ) ( IS-CRATE ?auto_6896 ) ( not ( = ?auto_6895 ?auto_6896 ) ) ( not ( = ?auto_6883 ?auto_6895 ) ) ( not ( = ?auto_6884 ?auto_6895 ) ) ( not ( = ?auto_6894 ?auto_6895 ) ) ( not ( = ?auto_6885 ?auto_6895 ) ) ( AVAILABLE ?auto_6891 ) ( not ( = ?auto_6890 ?auto_6887 ) ) ( not ( = ?auto_6893 ?auto_6890 ) ) ( HOIST-AT ?auto_6888 ?auto_6890 ) ( not ( = ?auto_6891 ?auto_6888 ) ) ( not ( = ?auto_6889 ?auto_6888 ) ) ( AVAILABLE ?auto_6888 ) ( SURFACE-AT ?auto_6896 ?auto_6890 ) ( ON ?auto_6896 ?auto_6892 ) ( CLEAR ?auto_6896 ) ( not ( = ?auto_6883 ?auto_6892 ) ) ( not ( = ?auto_6884 ?auto_6892 ) ) ( not ( = ?auto_6896 ?auto_6892 ) ) ( not ( = ?auto_6894 ?auto_6892 ) ) ( not ( = ?auto_6885 ?auto_6892 ) ) ( not ( = ?auto_6895 ?auto_6892 ) ) ( TRUCK-AT ?auto_6886 ?auto_6887 ) )
    :subtasks
    ( ( !DRIVE ?auto_6886 ?auto_6887 ?auto_6890 )
      ( MAKE-2CRATE ?auto_6896 ?auto_6883 ?auto_6884 )
      ( MAKE-1CRATE-VERIFY ?auto_6883 ?auto_6884 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6897 - SURFACE
      ?auto_6898 - SURFACE
      ?auto_6899 - SURFACE
    )
    :vars
    (
      ?auto_6909 - HOIST
      ?auto_6903 - PLACE
      ?auto_6900 - PLACE
      ?auto_6905 - HOIST
      ?auto_6904 - SURFACE
      ?auto_6907 - SURFACE
      ?auto_6910 - SURFACE
      ?auto_6901 - PLACE
      ?auto_6908 - HOIST
      ?auto_6902 - SURFACE
      ?auto_6906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6909 ?auto_6903 ) ( IS-CRATE ?auto_6899 ) ( not ( = ?auto_6898 ?auto_6899 ) ) ( not ( = ?auto_6897 ?auto_6898 ) ) ( not ( = ?auto_6897 ?auto_6899 ) ) ( not ( = ?auto_6900 ?auto_6903 ) ) ( HOIST-AT ?auto_6905 ?auto_6900 ) ( not ( = ?auto_6909 ?auto_6905 ) ) ( SURFACE-AT ?auto_6899 ?auto_6900 ) ( ON ?auto_6899 ?auto_6904 ) ( CLEAR ?auto_6899 ) ( not ( = ?auto_6898 ?auto_6904 ) ) ( not ( = ?auto_6899 ?auto_6904 ) ) ( not ( = ?auto_6897 ?auto_6904 ) ) ( IS-CRATE ?auto_6898 ) ( AVAILABLE ?auto_6905 ) ( SURFACE-AT ?auto_6898 ?auto_6900 ) ( ON ?auto_6898 ?auto_6907 ) ( CLEAR ?auto_6898 ) ( not ( = ?auto_6898 ?auto_6907 ) ) ( not ( = ?auto_6899 ?auto_6907 ) ) ( not ( = ?auto_6897 ?auto_6907 ) ) ( not ( = ?auto_6904 ?auto_6907 ) ) ( SURFACE-AT ?auto_6910 ?auto_6903 ) ( CLEAR ?auto_6910 ) ( IS-CRATE ?auto_6897 ) ( not ( = ?auto_6910 ?auto_6897 ) ) ( not ( = ?auto_6898 ?auto_6910 ) ) ( not ( = ?auto_6899 ?auto_6910 ) ) ( not ( = ?auto_6904 ?auto_6910 ) ) ( not ( = ?auto_6907 ?auto_6910 ) ) ( AVAILABLE ?auto_6909 ) ( not ( = ?auto_6901 ?auto_6903 ) ) ( not ( = ?auto_6900 ?auto_6901 ) ) ( HOIST-AT ?auto_6908 ?auto_6901 ) ( not ( = ?auto_6909 ?auto_6908 ) ) ( not ( = ?auto_6905 ?auto_6908 ) ) ( AVAILABLE ?auto_6908 ) ( SURFACE-AT ?auto_6897 ?auto_6901 ) ( ON ?auto_6897 ?auto_6902 ) ( CLEAR ?auto_6897 ) ( not ( = ?auto_6898 ?auto_6902 ) ) ( not ( = ?auto_6899 ?auto_6902 ) ) ( not ( = ?auto_6897 ?auto_6902 ) ) ( not ( = ?auto_6904 ?auto_6902 ) ) ( not ( = ?auto_6907 ?auto_6902 ) ) ( not ( = ?auto_6910 ?auto_6902 ) ) ( TRUCK-AT ?auto_6906 ?auto_6903 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6898 ?auto_6899 )
      ( MAKE-2CRATE-VERIFY ?auto_6897 ?auto_6898 ?auto_6899 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6911 - SURFACE
      ?auto_6912 - SURFACE
      ?auto_6913 - SURFACE
      ?auto_6914 - SURFACE
    )
    :vars
    (
      ?auto_6922 - HOIST
      ?auto_6921 - PLACE
      ?auto_6917 - PLACE
      ?auto_6919 - HOIST
      ?auto_6920 - SURFACE
      ?auto_6923 - SURFACE
      ?auto_6924 - PLACE
      ?auto_6915 - HOIST
      ?auto_6916 - SURFACE
      ?auto_6918 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6922 ?auto_6921 ) ( IS-CRATE ?auto_6914 ) ( not ( = ?auto_6913 ?auto_6914 ) ) ( not ( = ?auto_6912 ?auto_6913 ) ) ( not ( = ?auto_6912 ?auto_6914 ) ) ( not ( = ?auto_6917 ?auto_6921 ) ) ( HOIST-AT ?auto_6919 ?auto_6917 ) ( not ( = ?auto_6922 ?auto_6919 ) ) ( SURFACE-AT ?auto_6914 ?auto_6917 ) ( ON ?auto_6914 ?auto_6920 ) ( CLEAR ?auto_6914 ) ( not ( = ?auto_6913 ?auto_6920 ) ) ( not ( = ?auto_6914 ?auto_6920 ) ) ( not ( = ?auto_6912 ?auto_6920 ) ) ( IS-CRATE ?auto_6913 ) ( AVAILABLE ?auto_6919 ) ( SURFACE-AT ?auto_6913 ?auto_6917 ) ( ON ?auto_6913 ?auto_6923 ) ( CLEAR ?auto_6913 ) ( not ( = ?auto_6913 ?auto_6923 ) ) ( not ( = ?auto_6914 ?auto_6923 ) ) ( not ( = ?auto_6912 ?auto_6923 ) ) ( not ( = ?auto_6920 ?auto_6923 ) ) ( SURFACE-AT ?auto_6911 ?auto_6921 ) ( CLEAR ?auto_6911 ) ( IS-CRATE ?auto_6912 ) ( not ( = ?auto_6911 ?auto_6912 ) ) ( not ( = ?auto_6913 ?auto_6911 ) ) ( not ( = ?auto_6914 ?auto_6911 ) ) ( not ( = ?auto_6920 ?auto_6911 ) ) ( not ( = ?auto_6923 ?auto_6911 ) ) ( AVAILABLE ?auto_6922 ) ( not ( = ?auto_6924 ?auto_6921 ) ) ( not ( = ?auto_6917 ?auto_6924 ) ) ( HOIST-AT ?auto_6915 ?auto_6924 ) ( not ( = ?auto_6922 ?auto_6915 ) ) ( not ( = ?auto_6919 ?auto_6915 ) ) ( AVAILABLE ?auto_6915 ) ( SURFACE-AT ?auto_6912 ?auto_6924 ) ( ON ?auto_6912 ?auto_6916 ) ( CLEAR ?auto_6912 ) ( not ( = ?auto_6913 ?auto_6916 ) ) ( not ( = ?auto_6914 ?auto_6916 ) ) ( not ( = ?auto_6912 ?auto_6916 ) ) ( not ( = ?auto_6920 ?auto_6916 ) ) ( not ( = ?auto_6923 ?auto_6916 ) ) ( not ( = ?auto_6911 ?auto_6916 ) ) ( TRUCK-AT ?auto_6918 ?auto_6921 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6912 ?auto_6913 ?auto_6914 )
      ( MAKE-3CRATE-VERIFY ?auto_6911 ?auto_6912 ?auto_6913 ?auto_6914 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6925 - SURFACE
      ?auto_6926 - SURFACE
      ?auto_6927 - SURFACE
      ?auto_6928 - SURFACE
      ?auto_6929 - SURFACE
    )
    :vars
    (
      ?auto_6937 - HOIST
      ?auto_6936 - PLACE
      ?auto_6932 - PLACE
      ?auto_6934 - HOIST
      ?auto_6935 - SURFACE
      ?auto_6938 - SURFACE
      ?auto_6939 - PLACE
      ?auto_6930 - HOIST
      ?auto_6931 - SURFACE
      ?auto_6933 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6937 ?auto_6936 ) ( IS-CRATE ?auto_6929 ) ( not ( = ?auto_6928 ?auto_6929 ) ) ( not ( = ?auto_6927 ?auto_6928 ) ) ( not ( = ?auto_6927 ?auto_6929 ) ) ( not ( = ?auto_6932 ?auto_6936 ) ) ( HOIST-AT ?auto_6934 ?auto_6932 ) ( not ( = ?auto_6937 ?auto_6934 ) ) ( SURFACE-AT ?auto_6929 ?auto_6932 ) ( ON ?auto_6929 ?auto_6935 ) ( CLEAR ?auto_6929 ) ( not ( = ?auto_6928 ?auto_6935 ) ) ( not ( = ?auto_6929 ?auto_6935 ) ) ( not ( = ?auto_6927 ?auto_6935 ) ) ( IS-CRATE ?auto_6928 ) ( AVAILABLE ?auto_6934 ) ( SURFACE-AT ?auto_6928 ?auto_6932 ) ( ON ?auto_6928 ?auto_6938 ) ( CLEAR ?auto_6928 ) ( not ( = ?auto_6928 ?auto_6938 ) ) ( not ( = ?auto_6929 ?auto_6938 ) ) ( not ( = ?auto_6927 ?auto_6938 ) ) ( not ( = ?auto_6935 ?auto_6938 ) ) ( SURFACE-AT ?auto_6926 ?auto_6936 ) ( CLEAR ?auto_6926 ) ( IS-CRATE ?auto_6927 ) ( not ( = ?auto_6926 ?auto_6927 ) ) ( not ( = ?auto_6928 ?auto_6926 ) ) ( not ( = ?auto_6929 ?auto_6926 ) ) ( not ( = ?auto_6935 ?auto_6926 ) ) ( not ( = ?auto_6938 ?auto_6926 ) ) ( AVAILABLE ?auto_6937 ) ( not ( = ?auto_6939 ?auto_6936 ) ) ( not ( = ?auto_6932 ?auto_6939 ) ) ( HOIST-AT ?auto_6930 ?auto_6939 ) ( not ( = ?auto_6937 ?auto_6930 ) ) ( not ( = ?auto_6934 ?auto_6930 ) ) ( AVAILABLE ?auto_6930 ) ( SURFACE-AT ?auto_6927 ?auto_6939 ) ( ON ?auto_6927 ?auto_6931 ) ( CLEAR ?auto_6927 ) ( not ( = ?auto_6928 ?auto_6931 ) ) ( not ( = ?auto_6929 ?auto_6931 ) ) ( not ( = ?auto_6927 ?auto_6931 ) ) ( not ( = ?auto_6935 ?auto_6931 ) ) ( not ( = ?auto_6938 ?auto_6931 ) ) ( not ( = ?auto_6926 ?auto_6931 ) ) ( TRUCK-AT ?auto_6933 ?auto_6936 ) ( ON ?auto_6926 ?auto_6925 ) ( not ( = ?auto_6925 ?auto_6926 ) ) ( not ( = ?auto_6925 ?auto_6927 ) ) ( not ( = ?auto_6925 ?auto_6928 ) ) ( not ( = ?auto_6925 ?auto_6929 ) ) ( not ( = ?auto_6925 ?auto_6935 ) ) ( not ( = ?auto_6925 ?auto_6938 ) ) ( not ( = ?auto_6925 ?auto_6931 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6927 ?auto_6928 ?auto_6929 )
      ( MAKE-4CRATE-VERIFY ?auto_6925 ?auto_6926 ?auto_6927 ?auto_6928 ?auto_6929 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6940 - SURFACE
      ?auto_6941 - SURFACE
    )
    :vars
    (
      ?auto_6950 - HOIST
      ?auto_6949 - PLACE
      ?auto_6953 - SURFACE
      ?auto_6944 - PLACE
      ?auto_6947 - HOIST
      ?auto_6948 - SURFACE
      ?auto_6951 - SURFACE
      ?auto_6946 - SURFACE
      ?auto_6952 - PLACE
      ?auto_6942 - HOIST
      ?auto_6943 - SURFACE
      ?auto_6945 - TRUCK
      ?auto_6954 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6950 ?auto_6949 ) ( IS-CRATE ?auto_6941 ) ( not ( = ?auto_6940 ?auto_6941 ) ) ( not ( = ?auto_6953 ?auto_6940 ) ) ( not ( = ?auto_6953 ?auto_6941 ) ) ( not ( = ?auto_6944 ?auto_6949 ) ) ( HOIST-AT ?auto_6947 ?auto_6944 ) ( not ( = ?auto_6950 ?auto_6947 ) ) ( SURFACE-AT ?auto_6941 ?auto_6944 ) ( ON ?auto_6941 ?auto_6948 ) ( CLEAR ?auto_6941 ) ( not ( = ?auto_6940 ?auto_6948 ) ) ( not ( = ?auto_6941 ?auto_6948 ) ) ( not ( = ?auto_6953 ?auto_6948 ) ) ( IS-CRATE ?auto_6940 ) ( AVAILABLE ?auto_6947 ) ( SURFACE-AT ?auto_6940 ?auto_6944 ) ( ON ?auto_6940 ?auto_6951 ) ( CLEAR ?auto_6940 ) ( not ( = ?auto_6940 ?auto_6951 ) ) ( not ( = ?auto_6941 ?auto_6951 ) ) ( not ( = ?auto_6953 ?auto_6951 ) ) ( not ( = ?auto_6948 ?auto_6951 ) ) ( IS-CRATE ?auto_6953 ) ( not ( = ?auto_6946 ?auto_6953 ) ) ( not ( = ?auto_6940 ?auto_6946 ) ) ( not ( = ?auto_6941 ?auto_6946 ) ) ( not ( = ?auto_6948 ?auto_6946 ) ) ( not ( = ?auto_6951 ?auto_6946 ) ) ( not ( = ?auto_6952 ?auto_6949 ) ) ( not ( = ?auto_6944 ?auto_6952 ) ) ( HOIST-AT ?auto_6942 ?auto_6952 ) ( not ( = ?auto_6950 ?auto_6942 ) ) ( not ( = ?auto_6947 ?auto_6942 ) ) ( AVAILABLE ?auto_6942 ) ( SURFACE-AT ?auto_6953 ?auto_6952 ) ( ON ?auto_6953 ?auto_6943 ) ( CLEAR ?auto_6953 ) ( not ( = ?auto_6940 ?auto_6943 ) ) ( not ( = ?auto_6941 ?auto_6943 ) ) ( not ( = ?auto_6953 ?auto_6943 ) ) ( not ( = ?auto_6948 ?auto_6943 ) ) ( not ( = ?auto_6951 ?auto_6943 ) ) ( not ( = ?auto_6946 ?auto_6943 ) ) ( TRUCK-AT ?auto_6945 ?auto_6949 ) ( SURFACE-AT ?auto_6954 ?auto_6949 ) ( CLEAR ?auto_6954 ) ( LIFTING ?auto_6950 ?auto_6946 ) ( IS-CRATE ?auto_6946 ) ( not ( = ?auto_6954 ?auto_6946 ) ) ( not ( = ?auto_6940 ?auto_6954 ) ) ( not ( = ?auto_6941 ?auto_6954 ) ) ( not ( = ?auto_6953 ?auto_6954 ) ) ( not ( = ?auto_6948 ?auto_6954 ) ) ( not ( = ?auto_6951 ?auto_6954 ) ) ( not ( = ?auto_6943 ?auto_6954 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6954 ?auto_6946 )
      ( MAKE-2CRATE ?auto_6953 ?auto_6940 ?auto_6941 )
      ( MAKE-1CRATE-VERIFY ?auto_6940 ?auto_6941 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6955 - SURFACE
      ?auto_6956 - SURFACE
      ?auto_6957 - SURFACE
    )
    :vars
    (
      ?auto_6962 - HOIST
      ?auto_6958 - PLACE
      ?auto_6964 - PLACE
      ?auto_6965 - HOIST
      ?auto_6966 - SURFACE
      ?auto_6960 - SURFACE
      ?auto_6959 - SURFACE
      ?auto_6961 - PLACE
      ?auto_6969 - HOIST
      ?auto_6968 - SURFACE
      ?auto_6963 - TRUCK
      ?auto_6967 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6962 ?auto_6958 ) ( IS-CRATE ?auto_6957 ) ( not ( = ?auto_6956 ?auto_6957 ) ) ( not ( = ?auto_6955 ?auto_6956 ) ) ( not ( = ?auto_6955 ?auto_6957 ) ) ( not ( = ?auto_6964 ?auto_6958 ) ) ( HOIST-AT ?auto_6965 ?auto_6964 ) ( not ( = ?auto_6962 ?auto_6965 ) ) ( SURFACE-AT ?auto_6957 ?auto_6964 ) ( ON ?auto_6957 ?auto_6966 ) ( CLEAR ?auto_6957 ) ( not ( = ?auto_6956 ?auto_6966 ) ) ( not ( = ?auto_6957 ?auto_6966 ) ) ( not ( = ?auto_6955 ?auto_6966 ) ) ( IS-CRATE ?auto_6956 ) ( AVAILABLE ?auto_6965 ) ( SURFACE-AT ?auto_6956 ?auto_6964 ) ( ON ?auto_6956 ?auto_6960 ) ( CLEAR ?auto_6956 ) ( not ( = ?auto_6956 ?auto_6960 ) ) ( not ( = ?auto_6957 ?auto_6960 ) ) ( not ( = ?auto_6955 ?auto_6960 ) ) ( not ( = ?auto_6966 ?auto_6960 ) ) ( IS-CRATE ?auto_6955 ) ( not ( = ?auto_6959 ?auto_6955 ) ) ( not ( = ?auto_6956 ?auto_6959 ) ) ( not ( = ?auto_6957 ?auto_6959 ) ) ( not ( = ?auto_6966 ?auto_6959 ) ) ( not ( = ?auto_6960 ?auto_6959 ) ) ( not ( = ?auto_6961 ?auto_6958 ) ) ( not ( = ?auto_6964 ?auto_6961 ) ) ( HOIST-AT ?auto_6969 ?auto_6961 ) ( not ( = ?auto_6962 ?auto_6969 ) ) ( not ( = ?auto_6965 ?auto_6969 ) ) ( AVAILABLE ?auto_6969 ) ( SURFACE-AT ?auto_6955 ?auto_6961 ) ( ON ?auto_6955 ?auto_6968 ) ( CLEAR ?auto_6955 ) ( not ( = ?auto_6956 ?auto_6968 ) ) ( not ( = ?auto_6957 ?auto_6968 ) ) ( not ( = ?auto_6955 ?auto_6968 ) ) ( not ( = ?auto_6966 ?auto_6968 ) ) ( not ( = ?auto_6960 ?auto_6968 ) ) ( not ( = ?auto_6959 ?auto_6968 ) ) ( TRUCK-AT ?auto_6963 ?auto_6958 ) ( SURFACE-AT ?auto_6967 ?auto_6958 ) ( CLEAR ?auto_6967 ) ( LIFTING ?auto_6962 ?auto_6959 ) ( IS-CRATE ?auto_6959 ) ( not ( = ?auto_6967 ?auto_6959 ) ) ( not ( = ?auto_6956 ?auto_6967 ) ) ( not ( = ?auto_6957 ?auto_6967 ) ) ( not ( = ?auto_6955 ?auto_6967 ) ) ( not ( = ?auto_6966 ?auto_6967 ) ) ( not ( = ?auto_6960 ?auto_6967 ) ) ( not ( = ?auto_6968 ?auto_6967 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6956 ?auto_6957 )
      ( MAKE-2CRATE-VERIFY ?auto_6955 ?auto_6956 ?auto_6957 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6970 - SURFACE
      ?auto_6971 - SURFACE
      ?auto_6972 - SURFACE
      ?auto_6973 - SURFACE
    )
    :vars
    (
      ?auto_6981 - HOIST
      ?auto_6975 - PLACE
      ?auto_6977 - PLACE
      ?auto_6976 - HOIST
      ?auto_6980 - SURFACE
      ?auto_6978 - SURFACE
      ?auto_6984 - PLACE
      ?auto_6974 - HOIST
      ?auto_6982 - SURFACE
      ?auto_6983 - TRUCK
      ?auto_6979 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6981 ?auto_6975 ) ( IS-CRATE ?auto_6973 ) ( not ( = ?auto_6972 ?auto_6973 ) ) ( not ( = ?auto_6971 ?auto_6972 ) ) ( not ( = ?auto_6971 ?auto_6973 ) ) ( not ( = ?auto_6977 ?auto_6975 ) ) ( HOIST-AT ?auto_6976 ?auto_6977 ) ( not ( = ?auto_6981 ?auto_6976 ) ) ( SURFACE-AT ?auto_6973 ?auto_6977 ) ( ON ?auto_6973 ?auto_6980 ) ( CLEAR ?auto_6973 ) ( not ( = ?auto_6972 ?auto_6980 ) ) ( not ( = ?auto_6973 ?auto_6980 ) ) ( not ( = ?auto_6971 ?auto_6980 ) ) ( IS-CRATE ?auto_6972 ) ( AVAILABLE ?auto_6976 ) ( SURFACE-AT ?auto_6972 ?auto_6977 ) ( ON ?auto_6972 ?auto_6978 ) ( CLEAR ?auto_6972 ) ( not ( = ?auto_6972 ?auto_6978 ) ) ( not ( = ?auto_6973 ?auto_6978 ) ) ( not ( = ?auto_6971 ?auto_6978 ) ) ( not ( = ?auto_6980 ?auto_6978 ) ) ( IS-CRATE ?auto_6971 ) ( not ( = ?auto_6970 ?auto_6971 ) ) ( not ( = ?auto_6972 ?auto_6970 ) ) ( not ( = ?auto_6973 ?auto_6970 ) ) ( not ( = ?auto_6980 ?auto_6970 ) ) ( not ( = ?auto_6978 ?auto_6970 ) ) ( not ( = ?auto_6984 ?auto_6975 ) ) ( not ( = ?auto_6977 ?auto_6984 ) ) ( HOIST-AT ?auto_6974 ?auto_6984 ) ( not ( = ?auto_6981 ?auto_6974 ) ) ( not ( = ?auto_6976 ?auto_6974 ) ) ( AVAILABLE ?auto_6974 ) ( SURFACE-AT ?auto_6971 ?auto_6984 ) ( ON ?auto_6971 ?auto_6982 ) ( CLEAR ?auto_6971 ) ( not ( = ?auto_6972 ?auto_6982 ) ) ( not ( = ?auto_6973 ?auto_6982 ) ) ( not ( = ?auto_6971 ?auto_6982 ) ) ( not ( = ?auto_6980 ?auto_6982 ) ) ( not ( = ?auto_6978 ?auto_6982 ) ) ( not ( = ?auto_6970 ?auto_6982 ) ) ( TRUCK-AT ?auto_6983 ?auto_6975 ) ( SURFACE-AT ?auto_6979 ?auto_6975 ) ( CLEAR ?auto_6979 ) ( LIFTING ?auto_6981 ?auto_6970 ) ( IS-CRATE ?auto_6970 ) ( not ( = ?auto_6979 ?auto_6970 ) ) ( not ( = ?auto_6972 ?auto_6979 ) ) ( not ( = ?auto_6973 ?auto_6979 ) ) ( not ( = ?auto_6971 ?auto_6979 ) ) ( not ( = ?auto_6980 ?auto_6979 ) ) ( not ( = ?auto_6978 ?auto_6979 ) ) ( not ( = ?auto_6982 ?auto_6979 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6971 ?auto_6972 ?auto_6973 )
      ( MAKE-3CRATE-VERIFY ?auto_6970 ?auto_6971 ?auto_6972 ?auto_6973 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6985 - SURFACE
      ?auto_6986 - SURFACE
      ?auto_6987 - SURFACE
      ?auto_6988 - SURFACE
      ?auto_6989 - SURFACE
    )
    :vars
    (
      ?auto_6996 - HOIST
      ?auto_6991 - PLACE
      ?auto_6993 - PLACE
      ?auto_6992 - HOIST
      ?auto_6995 - SURFACE
      ?auto_6994 - SURFACE
      ?auto_6999 - PLACE
      ?auto_6990 - HOIST
      ?auto_6997 - SURFACE
      ?auto_6998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6996 ?auto_6991 ) ( IS-CRATE ?auto_6989 ) ( not ( = ?auto_6988 ?auto_6989 ) ) ( not ( = ?auto_6987 ?auto_6988 ) ) ( not ( = ?auto_6987 ?auto_6989 ) ) ( not ( = ?auto_6993 ?auto_6991 ) ) ( HOIST-AT ?auto_6992 ?auto_6993 ) ( not ( = ?auto_6996 ?auto_6992 ) ) ( SURFACE-AT ?auto_6989 ?auto_6993 ) ( ON ?auto_6989 ?auto_6995 ) ( CLEAR ?auto_6989 ) ( not ( = ?auto_6988 ?auto_6995 ) ) ( not ( = ?auto_6989 ?auto_6995 ) ) ( not ( = ?auto_6987 ?auto_6995 ) ) ( IS-CRATE ?auto_6988 ) ( AVAILABLE ?auto_6992 ) ( SURFACE-AT ?auto_6988 ?auto_6993 ) ( ON ?auto_6988 ?auto_6994 ) ( CLEAR ?auto_6988 ) ( not ( = ?auto_6988 ?auto_6994 ) ) ( not ( = ?auto_6989 ?auto_6994 ) ) ( not ( = ?auto_6987 ?auto_6994 ) ) ( not ( = ?auto_6995 ?auto_6994 ) ) ( IS-CRATE ?auto_6987 ) ( not ( = ?auto_6986 ?auto_6987 ) ) ( not ( = ?auto_6988 ?auto_6986 ) ) ( not ( = ?auto_6989 ?auto_6986 ) ) ( not ( = ?auto_6995 ?auto_6986 ) ) ( not ( = ?auto_6994 ?auto_6986 ) ) ( not ( = ?auto_6999 ?auto_6991 ) ) ( not ( = ?auto_6993 ?auto_6999 ) ) ( HOIST-AT ?auto_6990 ?auto_6999 ) ( not ( = ?auto_6996 ?auto_6990 ) ) ( not ( = ?auto_6992 ?auto_6990 ) ) ( AVAILABLE ?auto_6990 ) ( SURFACE-AT ?auto_6987 ?auto_6999 ) ( ON ?auto_6987 ?auto_6997 ) ( CLEAR ?auto_6987 ) ( not ( = ?auto_6988 ?auto_6997 ) ) ( not ( = ?auto_6989 ?auto_6997 ) ) ( not ( = ?auto_6987 ?auto_6997 ) ) ( not ( = ?auto_6995 ?auto_6997 ) ) ( not ( = ?auto_6994 ?auto_6997 ) ) ( not ( = ?auto_6986 ?auto_6997 ) ) ( TRUCK-AT ?auto_6998 ?auto_6991 ) ( SURFACE-AT ?auto_6985 ?auto_6991 ) ( CLEAR ?auto_6985 ) ( LIFTING ?auto_6996 ?auto_6986 ) ( IS-CRATE ?auto_6986 ) ( not ( = ?auto_6985 ?auto_6986 ) ) ( not ( = ?auto_6988 ?auto_6985 ) ) ( not ( = ?auto_6989 ?auto_6985 ) ) ( not ( = ?auto_6987 ?auto_6985 ) ) ( not ( = ?auto_6995 ?auto_6985 ) ) ( not ( = ?auto_6994 ?auto_6985 ) ) ( not ( = ?auto_6997 ?auto_6985 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6987 ?auto_6988 ?auto_6989 )
      ( MAKE-4CRATE-VERIFY ?auto_6985 ?auto_6986 ?auto_6987 ?auto_6988 ?auto_6989 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7000 - SURFACE
      ?auto_7001 - SURFACE
    )
    :vars
    (
      ?auto_7010 - HOIST
      ?auto_7003 - PLACE
      ?auto_7014 - SURFACE
      ?auto_7005 - PLACE
      ?auto_7004 - HOIST
      ?auto_7009 - SURFACE
      ?auto_7006 - SURFACE
      ?auto_7007 - SURFACE
      ?auto_7013 - PLACE
      ?auto_7002 - HOIST
      ?auto_7011 - SURFACE
      ?auto_7012 - TRUCK
      ?auto_7008 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7010 ?auto_7003 ) ( IS-CRATE ?auto_7001 ) ( not ( = ?auto_7000 ?auto_7001 ) ) ( not ( = ?auto_7014 ?auto_7000 ) ) ( not ( = ?auto_7014 ?auto_7001 ) ) ( not ( = ?auto_7005 ?auto_7003 ) ) ( HOIST-AT ?auto_7004 ?auto_7005 ) ( not ( = ?auto_7010 ?auto_7004 ) ) ( SURFACE-AT ?auto_7001 ?auto_7005 ) ( ON ?auto_7001 ?auto_7009 ) ( CLEAR ?auto_7001 ) ( not ( = ?auto_7000 ?auto_7009 ) ) ( not ( = ?auto_7001 ?auto_7009 ) ) ( not ( = ?auto_7014 ?auto_7009 ) ) ( IS-CRATE ?auto_7000 ) ( AVAILABLE ?auto_7004 ) ( SURFACE-AT ?auto_7000 ?auto_7005 ) ( ON ?auto_7000 ?auto_7006 ) ( CLEAR ?auto_7000 ) ( not ( = ?auto_7000 ?auto_7006 ) ) ( not ( = ?auto_7001 ?auto_7006 ) ) ( not ( = ?auto_7014 ?auto_7006 ) ) ( not ( = ?auto_7009 ?auto_7006 ) ) ( IS-CRATE ?auto_7014 ) ( not ( = ?auto_7007 ?auto_7014 ) ) ( not ( = ?auto_7000 ?auto_7007 ) ) ( not ( = ?auto_7001 ?auto_7007 ) ) ( not ( = ?auto_7009 ?auto_7007 ) ) ( not ( = ?auto_7006 ?auto_7007 ) ) ( not ( = ?auto_7013 ?auto_7003 ) ) ( not ( = ?auto_7005 ?auto_7013 ) ) ( HOIST-AT ?auto_7002 ?auto_7013 ) ( not ( = ?auto_7010 ?auto_7002 ) ) ( not ( = ?auto_7004 ?auto_7002 ) ) ( AVAILABLE ?auto_7002 ) ( SURFACE-AT ?auto_7014 ?auto_7013 ) ( ON ?auto_7014 ?auto_7011 ) ( CLEAR ?auto_7014 ) ( not ( = ?auto_7000 ?auto_7011 ) ) ( not ( = ?auto_7001 ?auto_7011 ) ) ( not ( = ?auto_7014 ?auto_7011 ) ) ( not ( = ?auto_7009 ?auto_7011 ) ) ( not ( = ?auto_7006 ?auto_7011 ) ) ( not ( = ?auto_7007 ?auto_7011 ) ) ( TRUCK-AT ?auto_7012 ?auto_7003 ) ( SURFACE-AT ?auto_7008 ?auto_7003 ) ( CLEAR ?auto_7008 ) ( IS-CRATE ?auto_7007 ) ( not ( = ?auto_7008 ?auto_7007 ) ) ( not ( = ?auto_7000 ?auto_7008 ) ) ( not ( = ?auto_7001 ?auto_7008 ) ) ( not ( = ?auto_7014 ?auto_7008 ) ) ( not ( = ?auto_7009 ?auto_7008 ) ) ( not ( = ?auto_7006 ?auto_7008 ) ) ( not ( = ?auto_7011 ?auto_7008 ) ) ( AVAILABLE ?auto_7010 ) ( IN ?auto_7007 ?auto_7012 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7010 ?auto_7007 ?auto_7012 ?auto_7003 )
      ( MAKE-2CRATE ?auto_7014 ?auto_7000 ?auto_7001 )
      ( MAKE-1CRATE-VERIFY ?auto_7000 ?auto_7001 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7015 - SURFACE
      ?auto_7016 - SURFACE
      ?auto_7017 - SURFACE
    )
    :vars
    (
      ?auto_7021 - HOIST
      ?auto_7024 - PLACE
      ?auto_7028 - PLACE
      ?auto_7029 - HOIST
      ?auto_7022 - SURFACE
      ?auto_7019 - SURFACE
      ?auto_7027 - SURFACE
      ?auto_7023 - PLACE
      ?auto_7020 - HOIST
      ?auto_7018 - SURFACE
      ?auto_7026 - TRUCK
      ?auto_7025 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7021 ?auto_7024 ) ( IS-CRATE ?auto_7017 ) ( not ( = ?auto_7016 ?auto_7017 ) ) ( not ( = ?auto_7015 ?auto_7016 ) ) ( not ( = ?auto_7015 ?auto_7017 ) ) ( not ( = ?auto_7028 ?auto_7024 ) ) ( HOIST-AT ?auto_7029 ?auto_7028 ) ( not ( = ?auto_7021 ?auto_7029 ) ) ( SURFACE-AT ?auto_7017 ?auto_7028 ) ( ON ?auto_7017 ?auto_7022 ) ( CLEAR ?auto_7017 ) ( not ( = ?auto_7016 ?auto_7022 ) ) ( not ( = ?auto_7017 ?auto_7022 ) ) ( not ( = ?auto_7015 ?auto_7022 ) ) ( IS-CRATE ?auto_7016 ) ( AVAILABLE ?auto_7029 ) ( SURFACE-AT ?auto_7016 ?auto_7028 ) ( ON ?auto_7016 ?auto_7019 ) ( CLEAR ?auto_7016 ) ( not ( = ?auto_7016 ?auto_7019 ) ) ( not ( = ?auto_7017 ?auto_7019 ) ) ( not ( = ?auto_7015 ?auto_7019 ) ) ( not ( = ?auto_7022 ?auto_7019 ) ) ( IS-CRATE ?auto_7015 ) ( not ( = ?auto_7027 ?auto_7015 ) ) ( not ( = ?auto_7016 ?auto_7027 ) ) ( not ( = ?auto_7017 ?auto_7027 ) ) ( not ( = ?auto_7022 ?auto_7027 ) ) ( not ( = ?auto_7019 ?auto_7027 ) ) ( not ( = ?auto_7023 ?auto_7024 ) ) ( not ( = ?auto_7028 ?auto_7023 ) ) ( HOIST-AT ?auto_7020 ?auto_7023 ) ( not ( = ?auto_7021 ?auto_7020 ) ) ( not ( = ?auto_7029 ?auto_7020 ) ) ( AVAILABLE ?auto_7020 ) ( SURFACE-AT ?auto_7015 ?auto_7023 ) ( ON ?auto_7015 ?auto_7018 ) ( CLEAR ?auto_7015 ) ( not ( = ?auto_7016 ?auto_7018 ) ) ( not ( = ?auto_7017 ?auto_7018 ) ) ( not ( = ?auto_7015 ?auto_7018 ) ) ( not ( = ?auto_7022 ?auto_7018 ) ) ( not ( = ?auto_7019 ?auto_7018 ) ) ( not ( = ?auto_7027 ?auto_7018 ) ) ( TRUCK-AT ?auto_7026 ?auto_7024 ) ( SURFACE-AT ?auto_7025 ?auto_7024 ) ( CLEAR ?auto_7025 ) ( IS-CRATE ?auto_7027 ) ( not ( = ?auto_7025 ?auto_7027 ) ) ( not ( = ?auto_7016 ?auto_7025 ) ) ( not ( = ?auto_7017 ?auto_7025 ) ) ( not ( = ?auto_7015 ?auto_7025 ) ) ( not ( = ?auto_7022 ?auto_7025 ) ) ( not ( = ?auto_7019 ?auto_7025 ) ) ( not ( = ?auto_7018 ?auto_7025 ) ) ( AVAILABLE ?auto_7021 ) ( IN ?auto_7027 ?auto_7026 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7016 ?auto_7017 )
      ( MAKE-2CRATE-VERIFY ?auto_7015 ?auto_7016 ?auto_7017 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7030 - SURFACE
      ?auto_7031 - SURFACE
      ?auto_7032 - SURFACE
      ?auto_7033 - SURFACE
    )
    :vars
    (
      ?auto_7044 - HOIST
      ?auto_7036 - PLACE
      ?auto_7041 - PLACE
      ?auto_7034 - HOIST
      ?auto_7040 - SURFACE
      ?auto_7035 - SURFACE
      ?auto_7039 - PLACE
      ?auto_7043 - HOIST
      ?auto_7037 - SURFACE
      ?auto_7038 - TRUCK
      ?auto_7042 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7044 ?auto_7036 ) ( IS-CRATE ?auto_7033 ) ( not ( = ?auto_7032 ?auto_7033 ) ) ( not ( = ?auto_7031 ?auto_7032 ) ) ( not ( = ?auto_7031 ?auto_7033 ) ) ( not ( = ?auto_7041 ?auto_7036 ) ) ( HOIST-AT ?auto_7034 ?auto_7041 ) ( not ( = ?auto_7044 ?auto_7034 ) ) ( SURFACE-AT ?auto_7033 ?auto_7041 ) ( ON ?auto_7033 ?auto_7040 ) ( CLEAR ?auto_7033 ) ( not ( = ?auto_7032 ?auto_7040 ) ) ( not ( = ?auto_7033 ?auto_7040 ) ) ( not ( = ?auto_7031 ?auto_7040 ) ) ( IS-CRATE ?auto_7032 ) ( AVAILABLE ?auto_7034 ) ( SURFACE-AT ?auto_7032 ?auto_7041 ) ( ON ?auto_7032 ?auto_7035 ) ( CLEAR ?auto_7032 ) ( not ( = ?auto_7032 ?auto_7035 ) ) ( not ( = ?auto_7033 ?auto_7035 ) ) ( not ( = ?auto_7031 ?auto_7035 ) ) ( not ( = ?auto_7040 ?auto_7035 ) ) ( IS-CRATE ?auto_7031 ) ( not ( = ?auto_7030 ?auto_7031 ) ) ( not ( = ?auto_7032 ?auto_7030 ) ) ( not ( = ?auto_7033 ?auto_7030 ) ) ( not ( = ?auto_7040 ?auto_7030 ) ) ( not ( = ?auto_7035 ?auto_7030 ) ) ( not ( = ?auto_7039 ?auto_7036 ) ) ( not ( = ?auto_7041 ?auto_7039 ) ) ( HOIST-AT ?auto_7043 ?auto_7039 ) ( not ( = ?auto_7044 ?auto_7043 ) ) ( not ( = ?auto_7034 ?auto_7043 ) ) ( AVAILABLE ?auto_7043 ) ( SURFACE-AT ?auto_7031 ?auto_7039 ) ( ON ?auto_7031 ?auto_7037 ) ( CLEAR ?auto_7031 ) ( not ( = ?auto_7032 ?auto_7037 ) ) ( not ( = ?auto_7033 ?auto_7037 ) ) ( not ( = ?auto_7031 ?auto_7037 ) ) ( not ( = ?auto_7040 ?auto_7037 ) ) ( not ( = ?auto_7035 ?auto_7037 ) ) ( not ( = ?auto_7030 ?auto_7037 ) ) ( TRUCK-AT ?auto_7038 ?auto_7036 ) ( SURFACE-AT ?auto_7042 ?auto_7036 ) ( CLEAR ?auto_7042 ) ( IS-CRATE ?auto_7030 ) ( not ( = ?auto_7042 ?auto_7030 ) ) ( not ( = ?auto_7032 ?auto_7042 ) ) ( not ( = ?auto_7033 ?auto_7042 ) ) ( not ( = ?auto_7031 ?auto_7042 ) ) ( not ( = ?auto_7040 ?auto_7042 ) ) ( not ( = ?auto_7035 ?auto_7042 ) ) ( not ( = ?auto_7037 ?auto_7042 ) ) ( AVAILABLE ?auto_7044 ) ( IN ?auto_7030 ?auto_7038 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7031 ?auto_7032 ?auto_7033 )
      ( MAKE-3CRATE-VERIFY ?auto_7030 ?auto_7031 ?auto_7032 ?auto_7033 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7045 - SURFACE
      ?auto_7046 - SURFACE
      ?auto_7047 - SURFACE
      ?auto_7048 - SURFACE
      ?auto_7049 - SURFACE
    )
    :vars
    (
      ?auto_7059 - HOIST
      ?auto_7052 - PLACE
      ?auto_7057 - PLACE
      ?auto_7050 - HOIST
      ?auto_7056 - SURFACE
      ?auto_7051 - SURFACE
      ?auto_7055 - PLACE
      ?auto_7058 - HOIST
      ?auto_7053 - SURFACE
      ?auto_7054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7059 ?auto_7052 ) ( IS-CRATE ?auto_7049 ) ( not ( = ?auto_7048 ?auto_7049 ) ) ( not ( = ?auto_7047 ?auto_7048 ) ) ( not ( = ?auto_7047 ?auto_7049 ) ) ( not ( = ?auto_7057 ?auto_7052 ) ) ( HOIST-AT ?auto_7050 ?auto_7057 ) ( not ( = ?auto_7059 ?auto_7050 ) ) ( SURFACE-AT ?auto_7049 ?auto_7057 ) ( ON ?auto_7049 ?auto_7056 ) ( CLEAR ?auto_7049 ) ( not ( = ?auto_7048 ?auto_7056 ) ) ( not ( = ?auto_7049 ?auto_7056 ) ) ( not ( = ?auto_7047 ?auto_7056 ) ) ( IS-CRATE ?auto_7048 ) ( AVAILABLE ?auto_7050 ) ( SURFACE-AT ?auto_7048 ?auto_7057 ) ( ON ?auto_7048 ?auto_7051 ) ( CLEAR ?auto_7048 ) ( not ( = ?auto_7048 ?auto_7051 ) ) ( not ( = ?auto_7049 ?auto_7051 ) ) ( not ( = ?auto_7047 ?auto_7051 ) ) ( not ( = ?auto_7056 ?auto_7051 ) ) ( IS-CRATE ?auto_7047 ) ( not ( = ?auto_7046 ?auto_7047 ) ) ( not ( = ?auto_7048 ?auto_7046 ) ) ( not ( = ?auto_7049 ?auto_7046 ) ) ( not ( = ?auto_7056 ?auto_7046 ) ) ( not ( = ?auto_7051 ?auto_7046 ) ) ( not ( = ?auto_7055 ?auto_7052 ) ) ( not ( = ?auto_7057 ?auto_7055 ) ) ( HOIST-AT ?auto_7058 ?auto_7055 ) ( not ( = ?auto_7059 ?auto_7058 ) ) ( not ( = ?auto_7050 ?auto_7058 ) ) ( AVAILABLE ?auto_7058 ) ( SURFACE-AT ?auto_7047 ?auto_7055 ) ( ON ?auto_7047 ?auto_7053 ) ( CLEAR ?auto_7047 ) ( not ( = ?auto_7048 ?auto_7053 ) ) ( not ( = ?auto_7049 ?auto_7053 ) ) ( not ( = ?auto_7047 ?auto_7053 ) ) ( not ( = ?auto_7056 ?auto_7053 ) ) ( not ( = ?auto_7051 ?auto_7053 ) ) ( not ( = ?auto_7046 ?auto_7053 ) ) ( TRUCK-AT ?auto_7054 ?auto_7052 ) ( SURFACE-AT ?auto_7045 ?auto_7052 ) ( CLEAR ?auto_7045 ) ( IS-CRATE ?auto_7046 ) ( not ( = ?auto_7045 ?auto_7046 ) ) ( not ( = ?auto_7048 ?auto_7045 ) ) ( not ( = ?auto_7049 ?auto_7045 ) ) ( not ( = ?auto_7047 ?auto_7045 ) ) ( not ( = ?auto_7056 ?auto_7045 ) ) ( not ( = ?auto_7051 ?auto_7045 ) ) ( not ( = ?auto_7053 ?auto_7045 ) ) ( AVAILABLE ?auto_7059 ) ( IN ?auto_7046 ?auto_7054 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7047 ?auto_7048 ?auto_7049 )
      ( MAKE-4CRATE-VERIFY ?auto_7045 ?auto_7046 ?auto_7047 ?auto_7048 ?auto_7049 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7060 - SURFACE
      ?auto_7061 - SURFACE
    )
    :vars
    (
      ?auto_7073 - HOIST
      ?auto_7064 - PLACE
      ?auto_7074 - SURFACE
      ?auto_7070 - PLACE
      ?auto_7062 - HOIST
      ?auto_7069 - SURFACE
      ?auto_7063 - SURFACE
      ?auto_7067 - SURFACE
      ?auto_7068 - PLACE
      ?auto_7072 - HOIST
      ?auto_7065 - SURFACE
      ?auto_7071 - SURFACE
      ?auto_7066 - TRUCK
      ?auto_7075 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7073 ?auto_7064 ) ( IS-CRATE ?auto_7061 ) ( not ( = ?auto_7060 ?auto_7061 ) ) ( not ( = ?auto_7074 ?auto_7060 ) ) ( not ( = ?auto_7074 ?auto_7061 ) ) ( not ( = ?auto_7070 ?auto_7064 ) ) ( HOIST-AT ?auto_7062 ?auto_7070 ) ( not ( = ?auto_7073 ?auto_7062 ) ) ( SURFACE-AT ?auto_7061 ?auto_7070 ) ( ON ?auto_7061 ?auto_7069 ) ( CLEAR ?auto_7061 ) ( not ( = ?auto_7060 ?auto_7069 ) ) ( not ( = ?auto_7061 ?auto_7069 ) ) ( not ( = ?auto_7074 ?auto_7069 ) ) ( IS-CRATE ?auto_7060 ) ( AVAILABLE ?auto_7062 ) ( SURFACE-AT ?auto_7060 ?auto_7070 ) ( ON ?auto_7060 ?auto_7063 ) ( CLEAR ?auto_7060 ) ( not ( = ?auto_7060 ?auto_7063 ) ) ( not ( = ?auto_7061 ?auto_7063 ) ) ( not ( = ?auto_7074 ?auto_7063 ) ) ( not ( = ?auto_7069 ?auto_7063 ) ) ( IS-CRATE ?auto_7074 ) ( not ( = ?auto_7067 ?auto_7074 ) ) ( not ( = ?auto_7060 ?auto_7067 ) ) ( not ( = ?auto_7061 ?auto_7067 ) ) ( not ( = ?auto_7069 ?auto_7067 ) ) ( not ( = ?auto_7063 ?auto_7067 ) ) ( not ( = ?auto_7068 ?auto_7064 ) ) ( not ( = ?auto_7070 ?auto_7068 ) ) ( HOIST-AT ?auto_7072 ?auto_7068 ) ( not ( = ?auto_7073 ?auto_7072 ) ) ( not ( = ?auto_7062 ?auto_7072 ) ) ( AVAILABLE ?auto_7072 ) ( SURFACE-AT ?auto_7074 ?auto_7068 ) ( ON ?auto_7074 ?auto_7065 ) ( CLEAR ?auto_7074 ) ( not ( = ?auto_7060 ?auto_7065 ) ) ( not ( = ?auto_7061 ?auto_7065 ) ) ( not ( = ?auto_7074 ?auto_7065 ) ) ( not ( = ?auto_7069 ?auto_7065 ) ) ( not ( = ?auto_7063 ?auto_7065 ) ) ( not ( = ?auto_7067 ?auto_7065 ) ) ( SURFACE-AT ?auto_7071 ?auto_7064 ) ( CLEAR ?auto_7071 ) ( IS-CRATE ?auto_7067 ) ( not ( = ?auto_7071 ?auto_7067 ) ) ( not ( = ?auto_7060 ?auto_7071 ) ) ( not ( = ?auto_7061 ?auto_7071 ) ) ( not ( = ?auto_7074 ?auto_7071 ) ) ( not ( = ?auto_7069 ?auto_7071 ) ) ( not ( = ?auto_7063 ?auto_7071 ) ) ( not ( = ?auto_7065 ?auto_7071 ) ) ( AVAILABLE ?auto_7073 ) ( IN ?auto_7067 ?auto_7066 ) ( TRUCK-AT ?auto_7066 ?auto_7075 ) ( not ( = ?auto_7075 ?auto_7064 ) ) ( not ( = ?auto_7070 ?auto_7075 ) ) ( not ( = ?auto_7068 ?auto_7075 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7066 ?auto_7075 ?auto_7064 )
      ( MAKE-2CRATE ?auto_7074 ?auto_7060 ?auto_7061 )
      ( MAKE-1CRATE-VERIFY ?auto_7060 ?auto_7061 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7076 - SURFACE
      ?auto_7077 - SURFACE
      ?auto_7078 - SURFACE
    )
    :vars
    (
      ?auto_7080 - HOIST
      ?auto_7079 - PLACE
      ?auto_7082 - PLACE
      ?auto_7091 - HOIST
      ?auto_7081 - SURFACE
      ?auto_7085 - SURFACE
      ?auto_7086 - SURFACE
      ?auto_7087 - PLACE
      ?auto_7090 - HOIST
      ?auto_7088 - SURFACE
      ?auto_7083 - SURFACE
      ?auto_7084 - TRUCK
      ?auto_7089 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7080 ?auto_7079 ) ( IS-CRATE ?auto_7078 ) ( not ( = ?auto_7077 ?auto_7078 ) ) ( not ( = ?auto_7076 ?auto_7077 ) ) ( not ( = ?auto_7076 ?auto_7078 ) ) ( not ( = ?auto_7082 ?auto_7079 ) ) ( HOIST-AT ?auto_7091 ?auto_7082 ) ( not ( = ?auto_7080 ?auto_7091 ) ) ( SURFACE-AT ?auto_7078 ?auto_7082 ) ( ON ?auto_7078 ?auto_7081 ) ( CLEAR ?auto_7078 ) ( not ( = ?auto_7077 ?auto_7081 ) ) ( not ( = ?auto_7078 ?auto_7081 ) ) ( not ( = ?auto_7076 ?auto_7081 ) ) ( IS-CRATE ?auto_7077 ) ( AVAILABLE ?auto_7091 ) ( SURFACE-AT ?auto_7077 ?auto_7082 ) ( ON ?auto_7077 ?auto_7085 ) ( CLEAR ?auto_7077 ) ( not ( = ?auto_7077 ?auto_7085 ) ) ( not ( = ?auto_7078 ?auto_7085 ) ) ( not ( = ?auto_7076 ?auto_7085 ) ) ( not ( = ?auto_7081 ?auto_7085 ) ) ( IS-CRATE ?auto_7076 ) ( not ( = ?auto_7086 ?auto_7076 ) ) ( not ( = ?auto_7077 ?auto_7086 ) ) ( not ( = ?auto_7078 ?auto_7086 ) ) ( not ( = ?auto_7081 ?auto_7086 ) ) ( not ( = ?auto_7085 ?auto_7086 ) ) ( not ( = ?auto_7087 ?auto_7079 ) ) ( not ( = ?auto_7082 ?auto_7087 ) ) ( HOIST-AT ?auto_7090 ?auto_7087 ) ( not ( = ?auto_7080 ?auto_7090 ) ) ( not ( = ?auto_7091 ?auto_7090 ) ) ( AVAILABLE ?auto_7090 ) ( SURFACE-AT ?auto_7076 ?auto_7087 ) ( ON ?auto_7076 ?auto_7088 ) ( CLEAR ?auto_7076 ) ( not ( = ?auto_7077 ?auto_7088 ) ) ( not ( = ?auto_7078 ?auto_7088 ) ) ( not ( = ?auto_7076 ?auto_7088 ) ) ( not ( = ?auto_7081 ?auto_7088 ) ) ( not ( = ?auto_7085 ?auto_7088 ) ) ( not ( = ?auto_7086 ?auto_7088 ) ) ( SURFACE-AT ?auto_7083 ?auto_7079 ) ( CLEAR ?auto_7083 ) ( IS-CRATE ?auto_7086 ) ( not ( = ?auto_7083 ?auto_7086 ) ) ( not ( = ?auto_7077 ?auto_7083 ) ) ( not ( = ?auto_7078 ?auto_7083 ) ) ( not ( = ?auto_7076 ?auto_7083 ) ) ( not ( = ?auto_7081 ?auto_7083 ) ) ( not ( = ?auto_7085 ?auto_7083 ) ) ( not ( = ?auto_7088 ?auto_7083 ) ) ( AVAILABLE ?auto_7080 ) ( IN ?auto_7086 ?auto_7084 ) ( TRUCK-AT ?auto_7084 ?auto_7089 ) ( not ( = ?auto_7089 ?auto_7079 ) ) ( not ( = ?auto_7082 ?auto_7089 ) ) ( not ( = ?auto_7087 ?auto_7089 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7077 ?auto_7078 )
      ( MAKE-2CRATE-VERIFY ?auto_7076 ?auto_7077 ?auto_7078 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7092 - SURFACE
      ?auto_7093 - SURFACE
      ?auto_7094 - SURFACE
      ?auto_7095 - SURFACE
    )
    :vars
    (
      ?auto_7099 - HOIST
      ?auto_7107 - PLACE
      ?auto_7105 - PLACE
      ?auto_7103 - HOIST
      ?auto_7097 - SURFACE
      ?auto_7096 - SURFACE
      ?auto_7100 - PLACE
      ?auto_7104 - HOIST
      ?auto_7106 - SURFACE
      ?auto_7098 - SURFACE
      ?auto_7102 - TRUCK
      ?auto_7101 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7099 ?auto_7107 ) ( IS-CRATE ?auto_7095 ) ( not ( = ?auto_7094 ?auto_7095 ) ) ( not ( = ?auto_7093 ?auto_7094 ) ) ( not ( = ?auto_7093 ?auto_7095 ) ) ( not ( = ?auto_7105 ?auto_7107 ) ) ( HOIST-AT ?auto_7103 ?auto_7105 ) ( not ( = ?auto_7099 ?auto_7103 ) ) ( SURFACE-AT ?auto_7095 ?auto_7105 ) ( ON ?auto_7095 ?auto_7097 ) ( CLEAR ?auto_7095 ) ( not ( = ?auto_7094 ?auto_7097 ) ) ( not ( = ?auto_7095 ?auto_7097 ) ) ( not ( = ?auto_7093 ?auto_7097 ) ) ( IS-CRATE ?auto_7094 ) ( AVAILABLE ?auto_7103 ) ( SURFACE-AT ?auto_7094 ?auto_7105 ) ( ON ?auto_7094 ?auto_7096 ) ( CLEAR ?auto_7094 ) ( not ( = ?auto_7094 ?auto_7096 ) ) ( not ( = ?auto_7095 ?auto_7096 ) ) ( not ( = ?auto_7093 ?auto_7096 ) ) ( not ( = ?auto_7097 ?auto_7096 ) ) ( IS-CRATE ?auto_7093 ) ( not ( = ?auto_7092 ?auto_7093 ) ) ( not ( = ?auto_7094 ?auto_7092 ) ) ( not ( = ?auto_7095 ?auto_7092 ) ) ( not ( = ?auto_7097 ?auto_7092 ) ) ( not ( = ?auto_7096 ?auto_7092 ) ) ( not ( = ?auto_7100 ?auto_7107 ) ) ( not ( = ?auto_7105 ?auto_7100 ) ) ( HOIST-AT ?auto_7104 ?auto_7100 ) ( not ( = ?auto_7099 ?auto_7104 ) ) ( not ( = ?auto_7103 ?auto_7104 ) ) ( AVAILABLE ?auto_7104 ) ( SURFACE-AT ?auto_7093 ?auto_7100 ) ( ON ?auto_7093 ?auto_7106 ) ( CLEAR ?auto_7093 ) ( not ( = ?auto_7094 ?auto_7106 ) ) ( not ( = ?auto_7095 ?auto_7106 ) ) ( not ( = ?auto_7093 ?auto_7106 ) ) ( not ( = ?auto_7097 ?auto_7106 ) ) ( not ( = ?auto_7096 ?auto_7106 ) ) ( not ( = ?auto_7092 ?auto_7106 ) ) ( SURFACE-AT ?auto_7098 ?auto_7107 ) ( CLEAR ?auto_7098 ) ( IS-CRATE ?auto_7092 ) ( not ( = ?auto_7098 ?auto_7092 ) ) ( not ( = ?auto_7094 ?auto_7098 ) ) ( not ( = ?auto_7095 ?auto_7098 ) ) ( not ( = ?auto_7093 ?auto_7098 ) ) ( not ( = ?auto_7097 ?auto_7098 ) ) ( not ( = ?auto_7096 ?auto_7098 ) ) ( not ( = ?auto_7106 ?auto_7098 ) ) ( AVAILABLE ?auto_7099 ) ( IN ?auto_7092 ?auto_7102 ) ( TRUCK-AT ?auto_7102 ?auto_7101 ) ( not ( = ?auto_7101 ?auto_7107 ) ) ( not ( = ?auto_7105 ?auto_7101 ) ) ( not ( = ?auto_7100 ?auto_7101 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7093 ?auto_7094 ?auto_7095 )
      ( MAKE-3CRATE-VERIFY ?auto_7092 ?auto_7093 ?auto_7094 ?auto_7095 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7108 - SURFACE
      ?auto_7109 - SURFACE
      ?auto_7110 - SURFACE
      ?auto_7111 - SURFACE
      ?auto_7112 - SURFACE
    )
    :vars
    (
      ?auto_7115 - HOIST
      ?auto_7123 - PLACE
      ?auto_7121 - PLACE
      ?auto_7119 - HOIST
      ?auto_7114 - SURFACE
      ?auto_7113 - SURFACE
      ?auto_7116 - PLACE
      ?auto_7120 - HOIST
      ?auto_7122 - SURFACE
      ?auto_7118 - TRUCK
      ?auto_7117 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7115 ?auto_7123 ) ( IS-CRATE ?auto_7112 ) ( not ( = ?auto_7111 ?auto_7112 ) ) ( not ( = ?auto_7110 ?auto_7111 ) ) ( not ( = ?auto_7110 ?auto_7112 ) ) ( not ( = ?auto_7121 ?auto_7123 ) ) ( HOIST-AT ?auto_7119 ?auto_7121 ) ( not ( = ?auto_7115 ?auto_7119 ) ) ( SURFACE-AT ?auto_7112 ?auto_7121 ) ( ON ?auto_7112 ?auto_7114 ) ( CLEAR ?auto_7112 ) ( not ( = ?auto_7111 ?auto_7114 ) ) ( not ( = ?auto_7112 ?auto_7114 ) ) ( not ( = ?auto_7110 ?auto_7114 ) ) ( IS-CRATE ?auto_7111 ) ( AVAILABLE ?auto_7119 ) ( SURFACE-AT ?auto_7111 ?auto_7121 ) ( ON ?auto_7111 ?auto_7113 ) ( CLEAR ?auto_7111 ) ( not ( = ?auto_7111 ?auto_7113 ) ) ( not ( = ?auto_7112 ?auto_7113 ) ) ( not ( = ?auto_7110 ?auto_7113 ) ) ( not ( = ?auto_7114 ?auto_7113 ) ) ( IS-CRATE ?auto_7110 ) ( not ( = ?auto_7109 ?auto_7110 ) ) ( not ( = ?auto_7111 ?auto_7109 ) ) ( not ( = ?auto_7112 ?auto_7109 ) ) ( not ( = ?auto_7114 ?auto_7109 ) ) ( not ( = ?auto_7113 ?auto_7109 ) ) ( not ( = ?auto_7116 ?auto_7123 ) ) ( not ( = ?auto_7121 ?auto_7116 ) ) ( HOIST-AT ?auto_7120 ?auto_7116 ) ( not ( = ?auto_7115 ?auto_7120 ) ) ( not ( = ?auto_7119 ?auto_7120 ) ) ( AVAILABLE ?auto_7120 ) ( SURFACE-AT ?auto_7110 ?auto_7116 ) ( ON ?auto_7110 ?auto_7122 ) ( CLEAR ?auto_7110 ) ( not ( = ?auto_7111 ?auto_7122 ) ) ( not ( = ?auto_7112 ?auto_7122 ) ) ( not ( = ?auto_7110 ?auto_7122 ) ) ( not ( = ?auto_7114 ?auto_7122 ) ) ( not ( = ?auto_7113 ?auto_7122 ) ) ( not ( = ?auto_7109 ?auto_7122 ) ) ( SURFACE-AT ?auto_7108 ?auto_7123 ) ( CLEAR ?auto_7108 ) ( IS-CRATE ?auto_7109 ) ( not ( = ?auto_7108 ?auto_7109 ) ) ( not ( = ?auto_7111 ?auto_7108 ) ) ( not ( = ?auto_7112 ?auto_7108 ) ) ( not ( = ?auto_7110 ?auto_7108 ) ) ( not ( = ?auto_7114 ?auto_7108 ) ) ( not ( = ?auto_7113 ?auto_7108 ) ) ( not ( = ?auto_7122 ?auto_7108 ) ) ( AVAILABLE ?auto_7115 ) ( IN ?auto_7109 ?auto_7118 ) ( TRUCK-AT ?auto_7118 ?auto_7117 ) ( not ( = ?auto_7117 ?auto_7123 ) ) ( not ( = ?auto_7121 ?auto_7117 ) ) ( not ( = ?auto_7116 ?auto_7117 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7110 ?auto_7111 ?auto_7112 )
      ( MAKE-4CRATE-VERIFY ?auto_7108 ?auto_7109 ?auto_7110 ?auto_7111 ?auto_7112 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7124 - SURFACE
      ?auto_7125 - SURFACE
    )
    :vars
    (
      ?auto_7129 - HOIST
      ?auto_7138 - PLACE
      ?auto_7139 - SURFACE
      ?auto_7135 - PLACE
      ?auto_7133 - HOIST
      ?auto_7127 - SURFACE
      ?auto_7126 - SURFACE
      ?auto_7137 - SURFACE
      ?auto_7130 - PLACE
      ?auto_7134 - HOIST
      ?auto_7136 - SURFACE
      ?auto_7128 - SURFACE
      ?auto_7132 - TRUCK
      ?auto_7131 - PLACE
      ?auto_7140 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7129 ?auto_7138 ) ( IS-CRATE ?auto_7125 ) ( not ( = ?auto_7124 ?auto_7125 ) ) ( not ( = ?auto_7139 ?auto_7124 ) ) ( not ( = ?auto_7139 ?auto_7125 ) ) ( not ( = ?auto_7135 ?auto_7138 ) ) ( HOIST-AT ?auto_7133 ?auto_7135 ) ( not ( = ?auto_7129 ?auto_7133 ) ) ( SURFACE-AT ?auto_7125 ?auto_7135 ) ( ON ?auto_7125 ?auto_7127 ) ( CLEAR ?auto_7125 ) ( not ( = ?auto_7124 ?auto_7127 ) ) ( not ( = ?auto_7125 ?auto_7127 ) ) ( not ( = ?auto_7139 ?auto_7127 ) ) ( IS-CRATE ?auto_7124 ) ( AVAILABLE ?auto_7133 ) ( SURFACE-AT ?auto_7124 ?auto_7135 ) ( ON ?auto_7124 ?auto_7126 ) ( CLEAR ?auto_7124 ) ( not ( = ?auto_7124 ?auto_7126 ) ) ( not ( = ?auto_7125 ?auto_7126 ) ) ( not ( = ?auto_7139 ?auto_7126 ) ) ( not ( = ?auto_7127 ?auto_7126 ) ) ( IS-CRATE ?auto_7139 ) ( not ( = ?auto_7137 ?auto_7139 ) ) ( not ( = ?auto_7124 ?auto_7137 ) ) ( not ( = ?auto_7125 ?auto_7137 ) ) ( not ( = ?auto_7127 ?auto_7137 ) ) ( not ( = ?auto_7126 ?auto_7137 ) ) ( not ( = ?auto_7130 ?auto_7138 ) ) ( not ( = ?auto_7135 ?auto_7130 ) ) ( HOIST-AT ?auto_7134 ?auto_7130 ) ( not ( = ?auto_7129 ?auto_7134 ) ) ( not ( = ?auto_7133 ?auto_7134 ) ) ( AVAILABLE ?auto_7134 ) ( SURFACE-AT ?auto_7139 ?auto_7130 ) ( ON ?auto_7139 ?auto_7136 ) ( CLEAR ?auto_7139 ) ( not ( = ?auto_7124 ?auto_7136 ) ) ( not ( = ?auto_7125 ?auto_7136 ) ) ( not ( = ?auto_7139 ?auto_7136 ) ) ( not ( = ?auto_7127 ?auto_7136 ) ) ( not ( = ?auto_7126 ?auto_7136 ) ) ( not ( = ?auto_7137 ?auto_7136 ) ) ( SURFACE-AT ?auto_7128 ?auto_7138 ) ( CLEAR ?auto_7128 ) ( IS-CRATE ?auto_7137 ) ( not ( = ?auto_7128 ?auto_7137 ) ) ( not ( = ?auto_7124 ?auto_7128 ) ) ( not ( = ?auto_7125 ?auto_7128 ) ) ( not ( = ?auto_7139 ?auto_7128 ) ) ( not ( = ?auto_7127 ?auto_7128 ) ) ( not ( = ?auto_7126 ?auto_7128 ) ) ( not ( = ?auto_7136 ?auto_7128 ) ) ( AVAILABLE ?auto_7129 ) ( TRUCK-AT ?auto_7132 ?auto_7131 ) ( not ( = ?auto_7131 ?auto_7138 ) ) ( not ( = ?auto_7135 ?auto_7131 ) ) ( not ( = ?auto_7130 ?auto_7131 ) ) ( HOIST-AT ?auto_7140 ?auto_7131 ) ( LIFTING ?auto_7140 ?auto_7137 ) ( not ( = ?auto_7129 ?auto_7140 ) ) ( not ( = ?auto_7133 ?auto_7140 ) ) ( not ( = ?auto_7134 ?auto_7140 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7140 ?auto_7137 ?auto_7132 ?auto_7131 )
      ( MAKE-2CRATE ?auto_7139 ?auto_7124 ?auto_7125 )
      ( MAKE-1CRATE-VERIFY ?auto_7124 ?auto_7125 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7141 - SURFACE
      ?auto_7142 - SURFACE
      ?auto_7143 - SURFACE
    )
    :vars
    (
      ?auto_7149 - HOIST
      ?auto_7151 - PLACE
      ?auto_7144 - PLACE
      ?auto_7146 - HOIST
      ?auto_7157 - SURFACE
      ?auto_7152 - SURFACE
      ?auto_7148 - SURFACE
      ?auto_7147 - PLACE
      ?auto_7145 - HOIST
      ?auto_7153 - SURFACE
      ?auto_7155 - SURFACE
      ?auto_7154 - TRUCK
      ?auto_7150 - PLACE
      ?auto_7156 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7149 ?auto_7151 ) ( IS-CRATE ?auto_7143 ) ( not ( = ?auto_7142 ?auto_7143 ) ) ( not ( = ?auto_7141 ?auto_7142 ) ) ( not ( = ?auto_7141 ?auto_7143 ) ) ( not ( = ?auto_7144 ?auto_7151 ) ) ( HOIST-AT ?auto_7146 ?auto_7144 ) ( not ( = ?auto_7149 ?auto_7146 ) ) ( SURFACE-AT ?auto_7143 ?auto_7144 ) ( ON ?auto_7143 ?auto_7157 ) ( CLEAR ?auto_7143 ) ( not ( = ?auto_7142 ?auto_7157 ) ) ( not ( = ?auto_7143 ?auto_7157 ) ) ( not ( = ?auto_7141 ?auto_7157 ) ) ( IS-CRATE ?auto_7142 ) ( AVAILABLE ?auto_7146 ) ( SURFACE-AT ?auto_7142 ?auto_7144 ) ( ON ?auto_7142 ?auto_7152 ) ( CLEAR ?auto_7142 ) ( not ( = ?auto_7142 ?auto_7152 ) ) ( not ( = ?auto_7143 ?auto_7152 ) ) ( not ( = ?auto_7141 ?auto_7152 ) ) ( not ( = ?auto_7157 ?auto_7152 ) ) ( IS-CRATE ?auto_7141 ) ( not ( = ?auto_7148 ?auto_7141 ) ) ( not ( = ?auto_7142 ?auto_7148 ) ) ( not ( = ?auto_7143 ?auto_7148 ) ) ( not ( = ?auto_7157 ?auto_7148 ) ) ( not ( = ?auto_7152 ?auto_7148 ) ) ( not ( = ?auto_7147 ?auto_7151 ) ) ( not ( = ?auto_7144 ?auto_7147 ) ) ( HOIST-AT ?auto_7145 ?auto_7147 ) ( not ( = ?auto_7149 ?auto_7145 ) ) ( not ( = ?auto_7146 ?auto_7145 ) ) ( AVAILABLE ?auto_7145 ) ( SURFACE-AT ?auto_7141 ?auto_7147 ) ( ON ?auto_7141 ?auto_7153 ) ( CLEAR ?auto_7141 ) ( not ( = ?auto_7142 ?auto_7153 ) ) ( not ( = ?auto_7143 ?auto_7153 ) ) ( not ( = ?auto_7141 ?auto_7153 ) ) ( not ( = ?auto_7157 ?auto_7153 ) ) ( not ( = ?auto_7152 ?auto_7153 ) ) ( not ( = ?auto_7148 ?auto_7153 ) ) ( SURFACE-AT ?auto_7155 ?auto_7151 ) ( CLEAR ?auto_7155 ) ( IS-CRATE ?auto_7148 ) ( not ( = ?auto_7155 ?auto_7148 ) ) ( not ( = ?auto_7142 ?auto_7155 ) ) ( not ( = ?auto_7143 ?auto_7155 ) ) ( not ( = ?auto_7141 ?auto_7155 ) ) ( not ( = ?auto_7157 ?auto_7155 ) ) ( not ( = ?auto_7152 ?auto_7155 ) ) ( not ( = ?auto_7153 ?auto_7155 ) ) ( AVAILABLE ?auto_7149 ) ( TRUCK-AT ?auto_7154 ?auto_7150 ) ( not ( = ?auto_7150 ?auto_7151 ) ) ( not ( = ?auto_7144 ?auto_7150 ) ) ( not ( = ?auto_7147 ?auto_7150 ) ) ( HOIST-AT ?auto_7156 ?auto_7150 ) ( LIFTING ?auto_7156 ?auto_7148 ) ( not ( = ?auto_7149 ?auto_7156 ) ) ( not ( = ?auto_7146 ?auto_7156 ) ) ( not ( = ?auto_7145 ?auto_7156 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7142 ?auto_7143 )
      ( MAKE-2CRATE-VERIFY ?auto_7141 ?auto_7142 ?auto_7143 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7158 - SURFACE
      ?auto_7159 - SURFACE
      ?auto_7160 - SURFACE
      ?auto_7161 - SURFACE
    )
    :vars
    (
      ?auto_7163 - HOIST
      ?auto_7169 - PLACE
      ?auto_7165 - PLACE
      ?auto_7173 - HOIST
      ?auto_7171 - SURFACE
      ?auto_7168 - SURFACE
      ?auto_7172 - PLACE
      ?auto_7164 - HOIST
      ?auto_7167 - SURFACE
      ?auto_7174 - SURFACE
      ?auto_7170 - TRUCK
      ?auto_7162 - PLACE
      ?auto_7166 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7163 ?auto_7169 ) ( IS-CRATE ?auto_7161 ) ( not ( = ?auto_7160 ?auto_7161 ) ) ( not ( = ?auto_7159 ?auto_7160 ) ) ( not ( = ?auto_7159 ?auto_7161 ) ) ( not ( = ?auto_7165 ?auto_7169 ) ) ( HOIST-AT ?auto_7173 ?auto_7165 ) ( not ( = ?auto_7163 ?auto_7173 ) ) ( SURFACE-AT ?auto_7161 ?auto_7165 ) ( ON ?auto_7161 ?auto_7171 ) ( CLEAR ?auto_7161 ) ( not ( = ?auto_7160 ?auto_7171 ) ) ( not ( = ?auto_7161 ?auto_7171 ) ) ( not ( = ?auto_7159 ?auto_7171 ) ) ( IS-CRATE ?auto_7160 ) ( AVAILABLE ?auto_7173 ) ( SURFACE-AT ?auto_7160 ?auto_7165 ) ( ON ?auto_7160 ?auto_7168 ) ( CLEAR ?auto_7160 ) ( not ( = ?auto_7160 ?auto_7168 ) ) ( not ( = ?auto_7161 ?auto_7168 ) ) ( not ( = ?auto_7159 ?auto_7168 ) ) ( not ( = ?auto_7171 ?auto_7168 ) ) ( IS-CRATE ?auto_7159 ) ( not ( = ?auto_7158 ?auto_7159 ) ) ( not ( = ?auto_7160 ?auto_7158 ) ) ( not ( = ?auto_7161 ?auto_7158 ) ) ( not ( = ?auto_7171 ?auto_7158 ) ) ( not ( = ?auto_7168 ?auto_7158 ) ) ( not ( = ?auto_7172 ?auto_7169 ) ) ( not ( = ?auto_7165 ?auto_7172 ) ) ( HOIST-AT ?auto_7164 ?auto_7172 ) ( not ( = ?auto_7163 ?auto_7164 ) ) ( not ( = ?auto_7173 ?auto_7164 ) ) ( AVAILABLE ?auto_7164 ) ( SURFACE-AT ?auto_7159 ?auto_7172 ) ( ON ?auto_7159 ?auto_7167 ) ( CLEAR ?auto_7159 ) ( not ( = ?auto_7160 ?auto_7167 ) ) ( not ( = ?auto_7161 ?auto_7167 ) ) ( not ( = ?auto_7159 ?auto_7167 ) ) ( not ( = ?auto_7171 ?auto_7167 ) ) ( not ( = ?auto_7168 ?auto_7167 ) ) ( not ( = ?auto_7158 ?auto_7167 ) ) ( SURFACE-AT ?auto_7174 ?auto_7169 ) ( CLEAR ?auto_7174 ) ( IS-CRATE ?auto_7158 ) ( not ( = ?auto_7174 ?auto_7158 ) ) ( not ( = ?auto_7160 ?auto_7174 ) ) ( not ( = ?auto_7161 ?auto_7174 ) ) ( not ( = ?auto_7159 ?auto_7174 ) ) ( not ( = ?auto_7171 ?auto_7174 ) ) ( not ( = ?auto_7168 ?auto_7174 ) ) ( not ( = ?auto_7167 ?auto_7174 ) ) ( AVAILABLE ?auto_7163 ) ( TRUCK-AT ?auto_7170 ?auto_7162 ) ( not ( = ?auto_7162 ?auto_7169 ) ) ( not ( = ?auto_7165 ?auto_7162 ) ) ( not ( = ?auto_7172 ?auto_7162 ) ) ( HOIST-AT ?auto_7166 ?auto_7162 ) ( LIFTING ?auto_7166 ?auto_7158 ) ( not ( = ?auto_7163 ?auto_7166 ) ) ( not ( = ?auto_7173 ?auto_7166 ) ) ( not ( = ?auto_7164 ?auto_7166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7159 ?auto_7160 ?auto_7161 )
      ( MAKE-3CRATE-VERIFY ?auto_7158 ?auto_7159 ?auto_7160 ?auto_7161 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7175 - SURFACE
      ?auto_7176 - SURFACE
      ?auto_7177 - SURFACE
      ?auto_7178 - SURFACE
      ?auto_7179 - SURFACE
    )
    :vars
    (
      ?auto_7181 - HOIST
      ?auto_7187 - PLACE
      ?auto_7183 - PLACE
      ?auto_7191 - HOIST
      ?auto_7189 - SURFACE
      ?auto_7186 - SURFACE
      ?auto_7190 - PLACE
      ?auto_7182 - HOIST
      ?auto_7185 - SURFACE
      ?auto_7188 - TRUCK
      ?auto_7180 - PLACE
      ?auto_7184 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7181 ?auto_7187 ) ( IS-CRATE ?auto_7179 ) ( not ( = ?auto_7178 ?auto_7179 ) ) ( not ( = ?auto_7177 ?auto_7178 ) ) ( not ( = ?auto_7177 ?auto_7179 ) ) ( not ( = ?auto_7183 ?auto_7187 ) ) ( HOIST-AT ?auto_7191 ?auto_7183 ) ( not ( = ?auto_7181 ?auto_7191 ) ) ( SURFACE-AT ?auto_7179 ?auto_7183 ) ( ON ?auto_7179 ?auto_7189 ) ( CLEAR ?auto_7179 ) ( not ( = ?auto_7178 ?auto_7189 ) ) ( not ( = ?auto_7179 ?auto_7189 ) ) ( not ( = ?auto_7177 ?auto_7189 ) ) ( IS-CRATE ?auto_7178 ) ( AVAILABLE ?auto_7191 ) ( SURFACE-AT ?auto_7178 ?auto_7183 ) ( ON ?auto_7178 ?auto_7186 ) ( CLEAR ?auto_7178 ) ( not ( = ?auto_7178 ?auto_7186 ) ) ( not ( = ?auto_7179 ?auto_7186 ) ) ( not ( = ?auto_7177 ?auto_7186 ) ) ( not ( = ?auto_7189 ?auto_7186 ) ) ( IS-CRATE ?auto_7177 ) ( not ( = ?auto_7176 ?auto_7177 ) ) ( not ( = ?auto_7178 ?auto_7176 ) ) ( not ( = ?auto_7179 ?auto_7176 ) ) ( not ( = ?auto_7189 ?auto_7176 ) ) ( not ( = ?auto_7186 ?auto_7176 ) ) ( not ( = ?auto_7190 ?auto_7187 ) ) ( not ( = ?auto_7183 ?auto_7190 ) ) ( HOIST-AT ?auto_7182 ?auto_7190 ) ( not ( = ?auto_7181 ?auto_7182 ) ) ( not ( = ?auto_7191 ?auto_7182 ) ) ( AVAILABLE ?auto_7182 ) ( SURFACE-AT ?auto_7177 ?auto_7190 ) ( ON ?auto_7177 ?auto_7185 ) ( CLEAR ?auto_7177 ) ( not ( = ?auto_7178 ?auto_7185 ) ) ( not ( = ?auto_7179 ?auto_7185 ) ) ( not ( = ?auto_7177 ?auto_7185 ) ) ( not ( = ?auto_7189 ?auto_7185 ) ) ( not ( = ?auto_7186 ?auto_7185 ) ) ( not ( = ?auto_7176 ?auto_7185 ) ) ( SURFACE-AT ?auto_7175 ?auto_7187 ) ( CLEAR ?auto_7175 ) ( IS-CRATE ?auto_7176 ) ( not ( = ?auto_7175 ?auto_7176 ) ) ( not ( = ?auto_7178 ?auto_7175 ) ) ( not ( = ?auto_7179 ?auto_7175 ) ) ( not ( = ?auto_7177 ?auto_7175 ) ) ( not ( = ?auto_7189 ?auto_7175 ) ) ( not ( = ?auto_7186 ?auto_7175 ) ) ( not ( = ?auto_7185 ?auto_7175 ) ) ( AVAILABLE ?auto_7181 ) ( TRUCK-AT ?auto_7188 ?auto_7180 ) ( not ( = ?auto_7180 ?auto_7187 ) ) ( not ( = ?auto_7183 ?auto_7180 ) ) ( not ( = ?auto_7190 ?auto_7180 ) ) ( HOIST-AT ?auto_7184 ?auto_7180 ) ( LIFTING ?auto_7184 ?auto_7176 ) ( not ( = ?auto_7181 ?auto_7184 ) ) ( not ( = ?auto_7191 ?auto_7184 ) ) ( not ( = ?auto_7182 ?auto_7184 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7177 ?auto_7178 ?auto_7179 )
      ( MAKE-4CRATE-VERIFY ?auto_7175 ?auto_7176 ?auto_7177 ?auto_7178 ?auto_7179 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7192 - SURFACE
      ?auto_7193 - SURFACE
    )
    :vars
    (
      ?auto_7195 - HOIST
      ?auto_7202 - PLACE
      ?auto_7208 - SURFACE
      ?auto_7197 - PLACE
      ?auto_7206 - HOIST
      ?auto_7204 - SURFACE
      ?auto_7201 - SURFACE
      ?auto_7198 - SURFACE
      ?auto_7205 - PLACE
      ?auto_7196 - HOIST
      ?auto_7200 - SURFACE
      ?auto_7207 - SURFACE
      ?auto_7203 - TRUCK
      ?auto_7194 - PLACE
      ?auto_7199 - HOIST
      ?auto_7209 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7195 ?auto_7202 ) ( IS-CRATE ?auto_7193 ) ( not ( = ?auto_7192 ?auto_7193 ) ) ( not ( = ?auto_7208 ?auto_7192 ) ) ( not ( = ?auto_7208 ?auto_7193 ) ) ( not ( = ?auto_7197 ?auto_7202 ) ) ( HOIST-AT ?auto_7206 ?auto_7197 ) ( not ( = ?auto_7195 ?auto_7206 ) ) ( SURFACE-AT ?auto_7193 ?auto_7197 ) ( ON ?auto_7193 ?auto_7204 ) ( CLEAR ?auto_7193 ) ( not ( = ?auto_7192 ?auto_7204 ) ) ( not ( = ?auto_7193 ?auto_7204 ) ) ( not ( = ?auto_7208 ?auto_7204 ) ) ( IS-CRATE ?auto_7192 ) ( AVAILABLE ?auto_7206 ) ( SURFACE-AT ?auto_7192 ?auto_7197 ) ( ON ?auto_7192 ?auto_7201 ) ( CLEAR ?auto_7192 ) ( not ( = ?auto_7192 ?auto_7201 ) ) ( not ( = ?auto_7193 ?auto_7201 ) ) ( not ( = ?auto_7208 ?auto_7201 ) ) ( not ( = ?auto_7204 ?auto_7201 ) ) ( IS-CRATE ?auto_7208 ) ( not ( = ?auto_7198 ?auto_7208 ) ) ( not ( = ?auto_7192 ?auto_7198 ) ) ( not ( = ?auto_7193 ?auto_7198 ) ) ( not ( = ?auto_7204 ?auto_7198 ) ) ( not ( = ?auto_7201 ?auto_7198 ) ) ( not ( = ?auto_7205 ?auto_7202 ) ) ( not ( = ?auto_7197 ?auto_7205 ) ) ( HOIST-AT ?auto_7196 ?auto_7205 ) ( not ( = ?auto_7195 ?auto_7196 ) ) ( not ( = ?auto_7206 ?auto_7196 ) ) ( AVAILABLE ?auto_7196 ) ( SURFACE-AT ?auto_7208 ?auto_7205 ) ( ON ?auto_7208 ?auto_7200 ) ( CLEAR ?auto_7208 ) ( not ( = ?auto_7192 ?auto_7200 ) ) ( not ( = ?auto_7193 ?auto_7200 ) ) ( not ( = ?auto_7208 ?auto_7200 ) ) ( not ( = ?auto_7204 ?auto_7200 ) ) ( not ( = ?auto_7201 ?auto_7200 ) ) ( not ( = ?auto_7198 ?auto_7200 ) ) ( SURFACE-AT ?auto_7207 ?auto_7202 ) ( CLEAR ?auto_7207 ) ( IS-CRATE ?auto_7198 ) ( not ( = ?auto_7207 ?auto_7198 ) ) ( not ( = ?auto_7192 ?auto_7207 ) ) ( not ( = ?auto_7193 ?auto_7207 ) ) ( not ( = ?auto_7208 ?auto_7207 ) ) ( not ( = ?auto_7204 ?auto_7207 ) ) ( not ( = ?auto_7201 ?auto_7207 ) ) ( not ( = ?auto_7200 ?auto_7207 ) ) ( AVAILABLE ?auto_7195 ) ( TRUCK-AT ?auto_7203 ?auto_7194 ) ( not ( = ?auto_7194 ?auto_7202 ) ) ( not ( = ?auto_7197 ?auto_7194 ) ) ( not ( = ?auto_7205 ?auto_7194 ) ) ( HOIST-AT ?auto_7199 ?auto_7194 ) ( not ( = ?auto_7195 ?auto_7199 ) ) ( not ( = ?auto_7206 ?auto_7199 ) ) ( not ( = ?auto_7196 ?auto_7199 ) ) ( AVAILABLE ?auto_7199 ) ( SURFACE-AT ?auto_7198 ?auto_7194 ) ( ON ?auto_7198 ?auto_7209 ) ( CLEAR ?auto_7198 ) ( not ( = ?auto_7192 ?auto_7209 ) ) ( not ( = ?auto_7193 ?auto_7209 ) ) ( not ( = ?auto_7208 ?auto_7209 ) ) ( not ( = ?auto_7204 ?auto_7209 ) ) ( not ( = ?auto_7201 ?auto_7209 ) ) ( not ( = ?auto_7198 ?auto_7209 ) ) ( not ( = ?auto_7200 ?auto_7209 ) ) ( not ( = ?auto_7207 ?auto_7209 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7199 ?auto_7198 ?auto_7209 ?auto_7194 )
      ( MAKE-2CRATE ?auto_7208 ?auto_7192 ?auto_7193 )
      ( MAKE-1CRATE-VERIFY ?auto_7192 ?auto_7193 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7210 - SURFACE
      ?auto_7211 - SURFACE
      ?auto_7212 - SURFACE
    )
    :vars
    (
      ?auto_7220 - HOIST
      ?auto_7216 - PLACE
      ?auto_7221 - PLACE
      ?auto_7224 - HOIST
      ?auto_7219 - SURFACE
      ?auto_7214 - SURFACE
      ?auto_7218 - SURFACE
      ?auto_7215 - PLACE
      ?auto_7226 - HOIST
      ?auto_7222 - SURFACE
      ?auto_7213 - SURFACE
      ?auto_7217 - TRUCK
      ?auto_7227 - PLACE
      ?auto_7223 - HOIST
      ?auto_7225 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7220 ?auto_7216 ) ( IS-CRATE ?auto_7212 ) ( not ( = ?auto_7211 ?auto_7212 ) ) ( not ( = ?auto_7210 ?auto_7211 ) ) ( not ( = ?auto_7210 ?auto_7212 ) ) ( not ( = ?auto_7221 ?auto_7216 ) ) ( HOIST-AT ?auto_7224 ?auto_7221 ) ( not ( = ?auto_7220 ?auto_7224 ) ) ( SURFACE-AT ?auto_7212 ?auto_7221 ) ( ON ?auto_7212 ?auto_7219 ) ( CLEAR ?auto_7212 ) ( not ( = ?auto_7211 ?auto_7219 ) ) ( not ( = ?auto_7212 ?auto_7219 ) ) ( not ( = ?auto_7210 ?auto_7219 ) ) ( IS-CRATE ?auto_7211 ) ( AVAILABLE ?auto_7224 ) ( SURFACE-AT ?auto_7211 ?auto_7221 ) ( ON ?auto_7211 ?auto_7214 ) ( CLEAR ?auto_7211 ) ( not ( = ?auto_7211 ?auto_7214 ) ) ( not ( = ?auto_7212 ?auto_7214 ) ) ( not ( = ?auto_7210 ?auto_7214 ) ) ( not ( = ?auto_7219 ?auto_7214 ) ) ( IS-CRATE ?auto_7210 ) ( not ( = ?auto_7218 ?auto_7210 ) ) ( not ( = ?auto_7211 ?auto_7218 ) ) ( not ( = ?auto_7212 ?auto_7218 ) ) ( not ( = ?auto_7219 ?auto_7218 ) ) ( not ( = ?auto_7214 ?auto_7218 ) ) ( not ( = ?auto_7215 ?auto_7216 ) ) ( not ( = ?auto_7221 ?auto_7215 ) ) ( HOIST-AT ?auto_7226 ?auto_7215 ) ( not ( = ?auto_7220 ?auto_7226 ) ) ( not ( = ?auto_7224 ?auto_7226 ) ) ( AVAILABLE ?auto_7226 ) ( SURFACE-AT ?auto_7210 ?auto_7215 ) ( ON ?auto_7210 ?auto_7222 ) ( CLEAR ?auto_7210 ) ( not ( = ?auto_7211 ?auto_7222 ) ) ( not ( = ?auto_7212 ?auto_7222 ) ) ( not ( = ?auto_7210 ?auto_7222 ) ) ( not ( = ?auto_7219 ?auto_7222 ) ) ( not ( = ?auto_7214 ?auto_7222 ) ) ( not ( = ?auto_7218 ?auto_7222 ) ) ( SURFACE-AT ?auto_7213 ?auto_7216 ) ( CLEAR ?auto_7213 ) ( IS-CRATE ?auto_7218 ) ( not ( = ?auto_7213 ?auto_7218 ) ) ( not ( = ?auto_7211 ?auto_7213 ) ) ( not ( = ?auto_7212 ?auto_7213 ) ) ( not ( = ?auto_7210 ?auto_7213 ) ) ( not ( = ?auto_7219 ?auto_7213 ) ) ( not ( = ?auto_7214 ?auto_7213 ) ) ( not ( = ?auto_7222 ?auto_7213 ) ) ( AVAILABLE ?auto_7220 ) ( TRUCK-AT ?auto_7217 ?auto_7227 ) ( not ( = ?auto_7227 ?auto_7216 ) ) ( not ( = ?auto_7221 ?auto_7227 ) ) ( not ( = ?auto_7215 ?auto_7227 ) ) ( HOIST-AT ?auto_7223 ?auto_7227 ) ( not ( = ?auto_7220 ?auto_7223 ) ) ( not ( = ?auto_7224 ?auto_7223 ) ) ( not ( = ?auto_7226 ?auto_7223 ) ) ( AVAILABLE ?auto_7223 ) ( SURFACE-AT ?auto_7218 ?auto_7227 ) ( ON ?auto_7218 ?auto_7225 ) ( CLEAR ?auto_7218 ) ( not ( = ?auto_7211 ?auto_7225 ) ) ( not ( = ?auto_7212 ?auto_7225 ) ) ( not ( = ?auto_7210 ?auto_7225 ) ) ( not ( = ?auto_7219 ?auto_7225 ) ) ( not ( = ?auto_7214 ?auto_7225 ) ) ( not ( = ?auto_7218 ?auto_7225 ) ) ( not ( = ?auto_7222 ?auto_7225 ) ) ( not ( = ?auto_7213 ?auto_7225 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7211 ?auto_7212 )
      ( MAKE-2CRATE-VERIFY ?auto_7210 ?auto_7211 ?auto_7212 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7228 - SURFACE
      ?auto_7229 - SURFACE
      ?auto_7230 - SURFACE
      ?auto_7231 - SURFACE
    )
    :vars
    (
      ?auto_7245 - HOIST
      ?auto_7234 - PLACE
      ?auto_7242 - PLACE
      ?auto_7238 - HOIST
      ?auto_7232 - SURFACE
      ?auto_7236 - SURFACE
      ?auto_7241 - PLACE
      ?auto_7239 - HOIST
      ?auto_7244 - SURFACE
      ?auto_7233 - SURFACE
      ?auto_7237 - TRUCK
      ?auto_7235 - PLACE
      ?auto_7243 - HOIST
      ?auto_7240 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7245 ?auto_7234 ) ( IS-CRATE ?auto_7231 ) ( not ( = ?auto_7230 ?auto_7231 ) ) ( not ( = ?auto_7229 ?auto_7230 ) ) ( not ( = ?auto_7229 ?auto_7231 ) ) ( not ( = ?auto_7242 ?auto_7234 ) ) ( HOIST-AT ?auto_7238 ?auto_7242 ) ( not ( = ?auto_7245 ?auto_7238 ) ) ( SURFACE-AT ?auto_7231 ?auto_7242 ) ( ON ?auto_7231 ?auto_7232 ) ( CLEAR ?auto_7231 ) ( not ( = ?auto_7230 ?auto_7232 ) ) ( not ( = ?auto_7231 ?auto_7232 ) ) ( not ( = ?auto_7229 ?auto_7232 ) ) ( IS-CRATE ?auto_7230 ) ( AVAILABLE ?auto_7238 ) ( SURFACE-AT ?auto_7230 ?auto_7242 ) ( ON ?auto_7230 ?auto_7236 ) ( CLEAR ?auto_7230 ) ( not ( = ?auto_7230 ?auto_7236 ) ) ( not ( = ?auto_7231 ?auto_7236 ) ) ( not ( = ?auto_7229 ?auto_7236 ) ) ( not ( = ?auto_7232 ?auto_7236 ) ) ( IS-CRATE ?auto_7229 ) ( not ( = ?auto_7228 ?auto_7229 ) ) ( not ( = ?auto_7230 ?auto_7228 ) ) ( not ( = ?auto_7231 ?auto_7228 ) ) ( not ( = ?auto_7232 ?auto_7228 ) ) ( not ( = ?auto_7236 ?auto_7228 ) ) ( not ( = ?auto_7241 ?auto_7234 ) ) ( not ( = ?auto_7242 ?auto_7241 ) ) ( HOIST-AT ?auto_7239 ?auto_7241 ) ( not ( = ?auto_7245 ?auto_7239 ) ) ( not ( = ?auto_7238 ?auto_7239 ) ) ( AVAILABLE ?auto_7239 ) ( SURFACE-AT ?auto_7229 ?auto_7241 ) ( ON ?auto_7229 ?auto_7244 ) ( CLEAR ?auto_7229 ) ( not ( = ?auto_7230 ?auto_7244 ) ) ( not ( = ?auto_7231 ?auto_7244 ) ) ( not ( = ?auto_7229 ?auto_7244 ) ) ( not ( = ?auto_7232 ?auto_7244 ) ) ( not ( = ?auto_7236 ?auto_7244 ) ) ( not ( = ?auto_7228 ?auto_7244 ) ) ( SURFACE-AT ?auto_7233 ?auto_7234 ) ( CLEAR ?auto_7233 ) ( IS-CRATE ?auto_7228 ) ( not ( = ?auto_7233 ?auto_7228 ) ) ( not ( = ?auto_7230 ?auto_7233 ) ) ( not ( = ?auto_7231 ?auto_7233 ) ) ( not ( = ?auto_7229 ?auto_7233 ) ) ( not ( = ?auto_7232 ?auto_7233 ) ) ( not ( = ?auto_7236 ?auto_7233 ) ) ( not ( = ?auto_7244 ?auto_7233 ) ) ( AVAILABLE ?auto_7245 ) ( TRUCK-AT ?auto_7237 ?auto_7235 ) ( not ( = ?auto_7235 ?auto_7234 ) ) ( not ( = ?auto_7242 ?auto_7235 ) ) ( not ( = ?auto_7241 ?auto_7235 ) ) ( HOIST-AT ?auto_7243 ?auto_7235 ) ( not ( = ?auto_7245 ?auto_7243 ) ) ( not ( = ?auto_7238 ?auto_7243 ) ) ( not ( = ?auto_7239 ?auto_7243 ) ) ( AVAILABLE ?auto_7243 ) ( SURFACE-AT ?auto_7228 ?auto_7235 ) ( ON ?auto_7228 ?auto_7240 ) ( CLEAR ?auto_7228 ) ( not ( = ?auto_7230 ?auto_7240 ) ) ( not ( = ?auto_7231 ?auto_7240 ) ) ( not ( = ?auto_7229 ?auto_7240 ) ) ( not ( = ?auto_7232 ?auto_7240 ) ) ( not ( = ?auto_7236 ?auto_7240 ) ) ( not ( = ?auto_7228 ?auto_7240 ) ) ( not ( = ?auto_7244 ?auto_7240 ) ) ( not ( = ?auto_7233 ?auto_7240 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7229 ?auto_7230 ?auto_7231 )
      ( MAKE-3CRATE-VERIFY ?auto_7228 ?auto_7229 ?auto_7230 ?auto_7231 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7246 - SURFACE
      ?auto_7247 - SURFACE
      ?auto_7248 - SURFACE
      ?auto_7249 - SURFACE
      ?auto_7250 - SURFACE
    )
    :vars
    (
      ?auto_7263 - HOIST
      ?auto_7252 - PLACE
      ?auto_7260 - PLACE
      ?auto_7256 - HOIST
      ?auto_7251 - SURFACE
      ?auto_7254 - SURFACE
      ?auto_7259 - PLACE
      ?auto_7257 - HOIST
      ?auto_7262 - SURFACE
      ?auto_7255 - TRUCK
      ?auto_7253 - PLACE
      ?auto_7261 - HOIST
      ?auto_7258 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7263 ?auto_7252 ) ( IS-CRATE ?auto_7250 ) ( not ( = ?auto_7249 ?auto_7250 ) ) ( not ( = ?auto_7248 ?auto_7249 ) ) ( not ( = ?auto_7248 ?auto_7250 ) ) ( not ( = ?auto_7260 ?auto_7252 ) ) ( HOIST-AT ?auto_7256 ?auto_7260 ) ( not ( = ?auto_7263 ?auto_7256 ) ) ( SURFACE-AT ?auto_7250 ?auto_7260 ) ( ON ?auto_7250 ?auto_7251 ) ( CLEAR ?auto_7250 ) ( not ( = ?auto_7249 ?auto_7251 ) ) ( not ( = ?auto_7250 ?auto_7251 ) ) ( not ( = ?auto_7248 ?auto_7251 ) ) ( IS-CRATE ?auto_7249 ) ( AVAILABLE ?auto_7256 ) ( SURFACE-AT ?auto_7249 ?auto_7260 ) ( ON ?auto_7249 ?auto_7254 ) ( CLEAR ?auto_7249 ) ( not ( = ?auto_7249 ?auto_7254 ) ) ( not ( = ?auto_7250 ?auto_7254 ) ) ( not ( = ?auto_7248 ?auto_7254 ) ) ( not ( = ?auto_7251 ?auto_7254 ) ) ( IS-CRATE ?auto_7248 ) ( not ( = ?auto_7247 ?auto_7248 ) ) ( not ( = ?auto_7249 ?auto_7247 ) ) ( not ( = ?auto_7250 ?auto_7247 ) ) ( not ( = ?auto_7251 ?auto_7247 ) ) ( not ( = ?auto_7254 ?auto_7247 ) ) ( not ( = ?auto_7259 ?auto_7252 ) ) ( not ( = ?auto_7260 ?auto_7259 ) ) ( HOIST-AT ?auto_7257 ?auto_7259 ) ( not ( = ?auto_7263 ?auto_7257 ) ) ( not ( = ?auto_7256 ?auto_7257 ) ) ( AVAILABLE ?auto_7257 ) ( SURFACE-AT ?auto_7248 ?auto_7259 ) ( ON ?auto_7248 ?auto_7262 ) ( CLEAR ?auto_7248 ) ( not ( = ?auto_7249 ?auto_7262 ) ) ( not ( = ?auto_7250 ?auto_7262 ) ) ( not ( = ?auto_7248 ?auto_7262 ) ) ( not ( = ?auto_7251 ?auto_7262 ) ) ( not ( = ?auto_7254 ?auto_7262 ) ) ( not ( = ?auto_7247 ?auto_7262 ) ) ( SURFACE-AT ?auto_7246 ?auto_7252 ) ( CLEAR ?auto_7246 ) ( IS-CRATE ?auto_7247 ) ( not ( = ?auto_7246 ?auto_7247 ) ) ( not ( = ?auto_7249 ?auto_7246 ) ) ( not ( = ?auto_7250 ?auto_7246 ) ) ( not ( = ?auto_7248 ?auto_7246 ) ) ( not ( = ?auto_7251 ?auto_7246 ) ) ( not ( = ?auto_7254 ?auto_7246 ) ) ( not ( = ?auto_7262 ?auto_7246 ) ) ( AVAILABLE ?auto_7263 ) ( TRUCK-AT ?auto_7255 ?auto_7253 ) ( not ( = ?auto_7253 ?auto_7252 ) ) ( not ( = ?auto_7260 ?auto_7253 ) ) ( not ( = ?auto_7259 ?auto_7253 ) ) ( HOIST-AT ?auto_7261 ?auto_7253 ) ( not ( = ?auto_7263 ?auto_7261 ) ) ( not ( = ?auto_7256 ?auto_7261 ) ) ( not ( = ?auto_7257 ?auto_7261 ) ) ( AVAILABLE ?auto_7261 ) ( SURFACE-AT ?auto_7247 ?auto_7253 ) ( ON ?auto_7247 ?auto_7258 ) ( CLEAR ?auto_7247 ) ( not ( = ?auto_7249 ?auto_7258 ) ) ( not ( = ?auto_7250 ?auto_7258 ) ) ( not ( = ?auto_7248 ?auto_7258 ) ) ( not ( = ?auto_7251 ?auto_7258 ) ) ( not ( = ?auto_7254 ?auto_7258 ) ) ( not ( = ?auto_7247 ?auto_7258 ) ) ( not ( = ?auto_7262 ?auto_7258 ) ) ( not ( = ?auto_7246 ?auto_7258 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7248 ?auto_7249 ?auto_7250 )
      ( MAKE-4CRATE-VERIFY ?auto_7246 ?auto_7247 ?auto_7248 ?auto_7249 ?auto_7250 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7264 - SURFACE
      ?auto_7265 - SURFACE
    )
    :vars
    (
      ?auto_7280 - HOIST
      ?auto_7269 - PLACE
      ?auto_7281 - SURFACE
      ?auto_7277 - PLACE
      ?auto_7273 - HOIST
      ?auto_7267 - SURFACE
      ?auto_7271 - SURFACE
      ?auto_7266 - SURFACE
      ?auto_7276 - PLACE
      ?auto_7274 - HOIST
      ?auto_7279 - SURFACE
      ?auto_7268 - SURFACE
      ?auto_7270 - PLACE
      ?auto_7278 - HOIST
      ?auto_7275 - SURFACE
      ?auto_7272 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7280 ?auto_7269 ) ( IS-CRATE ?auto_7265 ) ( not ( = ?auto_7264 ?auto_7265 ) ) ( not ( = ?auto_7281 ?auto_7264 ) ) ( not ( = ?auto_7281 ?auto_7265 ) ) ( not ( = ?auto_7277 ?auto_7269 ) ) ( HOIST-AT ?auto_7273 ?auto_7277 ) ( not ( = ?auto_7280 ?auto_7273 ) ) ( SURFACE-AT ?auto_7265 ?auto_7277 ) ( ON ?auto_7265 ?auto_7267 ) ( CLEAR ?auto_7265 ) ( not ( = ?auto_7264 ?auto_7267 ) ) ( not ( = ?auto_7265 ?auto_7267 ) ) ( not ( = ?auto_7281 ?auto_7267 ) ) ( IS-CRATE ?auto_7264 ) ( AVAILABLE ?auto_7273 ) ( SURFACE-AT ?auto_7264 ?auto_7277 ) ( ON ?auto_7264 ?auto_7271 ) ( CLEAR ?auto_7264 ) ( not ( = ?auto_7264 ?auto_7271 ) ) ( not ( = ?auto_7265 ?auto_7271 ) ) ( not ( = ?auto_7281 ?auto_7271 ) ) ( not ( = ?auto_7267 ?auto_7271 ) ) ( IS-CRATE ?auto_7281 ) ( not ( = ?auto_7266 ?auto_7281 ) ) ( not ( = ?auto_7264 ?auto_7266 ) ) ( not ( = ?auto_7265 ?auto_7266 ) ) ( not ( = ?auto_7267 ?auto_7266 ) ) ( not ( = ?auto_7271 ?auto_7266 ) ) ( not ( = ?auto_7276 ?auto_7269 ) ) ( not ( = ?auto_7277 ?auto_7276 ) ) ( HOIST-AT ?auto_7274 ?auto_7276 ) ( not ( = ?auto_7280 ?auto_7274 ) ) ( not ( = ?auto_7273 ?auto_7274 ) ) ( AVAILABLE ?auto_7274 ) ( SURFACE-AT ?auto_7281 ?auto_7276 ) ( ON ?auto_7281 ?auto_7279 ) ( CLEAR ?auto_7281 ) ( not ( = ?auto_7264 ?auto_7279 ) ) ( not ( = ?auto_7265 ?auto_7279 ) ) ( not ( = ?auto_7281 ?auto_7279 ) ) ( not ( = ?auto_7267 ?auto_7279 ) ) ( not ( = ?auto_7271 ?auto_7279 ) ) ( not ( = ?auto_7266 ?auto_7279 ) ) ( SURFACE-AT ?auto_7268 ?auto_7269 ) ( CLEAR ?auto_7268 ) ( IS-CRATE ?auto_7266 ) ( not ( = ?auto_7268 ?auto_7266 ) ) ( not ( = ?auto_7264 ?auto_7268 ) ) ( not ( = ?auto_7265 ?auto_7268 ) ) ( not ( = ?auto_7281 ?auto_7268 ) ) ( not ( = ?auto_7267 ?auto_7268 ) ) ( not ( = ?auto_7271 ?auto_7268 ) ) ( not ( = ?auto_7279 ?auto_7268 ) ) ( AVAILABLE ?auto_7280 ) ( not ( = ?auto_7270 ?auto_7269 ) ) ( not ( = ?auto_7277 ?auto_7270 ) ) ( not ( = ?auto_7276 ?auto_7270 ) ) ( HOIST-AT ?auto_7278 ?auto_7270 ) ( not ( = ?auto_7280 ?auto_7278 ) ) ( not ( = ?auto_7273 ?auto_7278 ) ) ( not ( = ?auto_7274 ?auto_7278 ) ) ( AVAILABLE ?auto_7278 ) ( SURFACE-AT ?auto_7266 ?auto_7270 ) ( ON ?auto_7266 ?auto_7275 ) ( CLEAR ?auto_7266 ) ( not ( = ?auto_7264 ?auto_7275 ) ) ( not ( = ?auto_7265 ?auto_7275 ) ) ( not ( = ?auto_7281 ?auto_7275 ) ) ( not ( = ?auto_7267 ?auto_7275 ) ) ( not ( = ?auto_7271 ?auto_7275 ) ) ( not ( = ?auto_7266 ?auto_7275 ) ) ( not ( = ?auto_7279 ?auto_7275 ) ) ( not ( = ?auto_7268 ?auto_7275 ) ) ( TRUCK-AT ?auto_7272 ?auto_7269 ) )
    :subtasks
    ( ( !DRIVE ?auto_7272 ?auto_7269 ?auto_7270 )
      ( MAKE-2CRATE ?auto_7281 ?auto_7264 ?auto_7265 )
      ( MAKE-1CRATE-VERIFY ?auto_7264 ?auto_7265 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7282 - SURFACE
      ?auto_7283 - SURFACE
      ?auto_7284 - SURFACE
    )
    :vars
    (
      ?auto_7288 - HOIST
      ?auto_7285 - PLACE
      ?auto_7294 - PLACE
      ?auto_7290 - HOIST
      ?auto_7292 - SURFACE
      ?auto_7291 - SURFACE
      ?auto_7295 - SURFACE
      ?auto_7299 - PLACE
      ?auto_7293 - HOIST
      ?auto_7286 - SURFACE
      ?auto_7297 - SURFACE
      ?auto_7296 - PLACE
      ?auto_7287 - HOIST
      ?auto_7298 - SURFACE
      ?auto_7289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7288 ?auto_7285 ) ( IS-CRATE ?auto_7284 ) ( not ( = ?auto_7283 ?auto_7284 ) ) ( not ( = ?auto_7282 ?auto_7283 ) ) ( not ( = ?auto_7282 ?auto_7284 ) ) ( not ( = ?auto_7294 ?auto_7285 ) ) ( HOIST-AT ?auto_7290 ?auto_7294 ) ( not ( = ?auto_7288 ?auto_7290 ) ) ( SURFACE-AT ?auto_7284 ?auto_7294 ) ( ON ?auto_7284 ?auto_7292 ) ( CLEAR ?auto_7284 ) ( not ( = ?auto_7283 ?auto_7292 ) ) ( not ( = ?auto_7284 ?auto_7292 ) ) ( not ( = ?auto_7282 ?auto_7292 ) ) ( IS-CRATE ?auto_7283 ) ( AVAILABLE ?auto_7290 ) ( SURFACE-AT ?auto_7283 ?auto_7294 ) ( ON ?auto_7283 ?auto_7291 ) ( CLEAR ?auto_7283 ) ( not ( = ?auto_7283 ?auto_7291 ) ) ( not ( = ?auto_7284 ?auto_7291 ) ) ( not ( = ?auto_7282 ?auto_7291 ) ) ( not ( = ?auto_7292 ?auto_7291 ) ) ( IS-CRATE ?auto_7282 ) ( not ( = ?auto_7295 ?auto_7282 ) ) ( not ( = ?auto_7283 ?auto_7295 ) ) ( not ( = ?auto_7284 ?auto_7295 ) ) ( not ( = ?auto_7292 ?auto_7295 ) ) ( not ( = ?auto_7291 ?auto_7295 ) ) ( not ( = ?auto_7299 ?auto_7285 ) ) ( not ( = ?auto_7294 ?auto_7299 ) ) ( HOIST-AT ?auto_7293 ?auto_7299 ) ( not ( = ?auto_7288 ?auto_7293 ) ) ( not ( = ?auto_7290 ?auto_7293 ) ) ( AVAILABLE ?auto_7293 ) ( SURFACE-AT ?auto_7282 ?auto_7299 ) ( ON ?auto_7282 ?auto_7286 ) ( CLEAR ?auto_7282 ) ( not ( = ?auto_7283 ?auto_7286 ) ) ( not ( = ?auto_7284 ?auto_7286 ) ) ( not ( = ?auto_7282 ?auto_7286 ) ) ( not ( = ?auto_7292 ?auto_7286 ) ) ( not ( = ?auto_7291 ?auto_7286 ) ) ( not ( = ?auto_7295 ?auto_7286 ) ) ( SURFACE-AT ?auto_7297 ?auto_7285 ) ( CLEAR ?auto_7297 ) ( IS-CRATE ?auto_7295 ) ( not ( = ?auto_7297 ?auto_7295 ) ) ( not ( = ?auto_7283 ?auto_7297 ) ) ( not ( = ?auto_7284 ?auto_7297 ) ) ( not ( = ?auto_7282 ?auto_7297 ) ) ( not ( = ?auto_7292 ?auto_7297 ) ) ( not ( = ?auto_7291 ?auto_7297 ) ) ( not ( = ?auto_7286 ?auto_7297 ) ) ( AVAILABLE ?auto_7288 ) ( not ( = ?auto_7296 ?auto_7285 ) ) ( not ( = ?auto_7294 ?auto_7296 ) ) ( not ( = ?auto_7299 ?auto_7296 ) ) ( HOIST-AT ?auto_7287 ?auto_7296 ) ( not ( = ?auto_7288 ?auto_7287 ) ) ( not ( = ?auto_7290 ?auto_7287 ) ) ( not ( = ?auto_7293 ?auto_7287 ) ) ( AVAILABLE ?auto_7287 ) ( SURFACE-AT ?auto_7295 ?auto_7296 ) ( ON ?auto_7295 ?auto_7298 ) ( CLEAR ?auto_7295 ) ( not ( = ?auto_7283 ?auto_7298 ) ) ( not ( = ?auto_7284 ?auto_7298 ) ) ( not ( = ?auto_7282 ?auto_7298 ) ) ( not ( = ?auto_7292 ?auto_7298 ) ) ( not ( = ?auto_7291 ?auto_7298 ) ) ( not ( = ?auto_7295 ?auto_7298 ) ) ( not ( = ?auto_7286 ?auto_7298 ) ) ( not ( = ?auto_7297 ?auto_7298 ) ) ( TRUCK-AT ?auto_7289 ?auto_7285 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7283 ?auto_7284 )
      ( MAKE-2CRATE-VERIFY ?auto_7282 ?auto_7283 ?auto_7284 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7300 - SURFACE
      ?auto_7301 - SURFACE
      ?auto_7302 - SURFACE
      ?auto_7303 - SURFACE
    )
    :vars
    (
      ?auto_7306 - HOIST
      ?auto_7312 - PLACE
      ?auto_7311 - PLACE
      ?auto_7309 - HOIST
      ?auto_7317 - SURFACE
      ?auto_7305 - SURFACE
      ?auto_7310 - PLACE
      ?auto_7308 - HOIST
      ?auto_7316 - SURFACE
      ?auto_7313 - SURFACE
      ?auto_7315 - PLACE
      ?auto_7304 - HOIST
      ?auto_7314 - SURFACE
      ?auto_7307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7306 ?auto_7312 ) ( IS-CRATE ?auto_7303 ) ( not ( = ?auto_7302 ?auto_7303 ) ) ( not ( = ?auto_7301 ?auto_7302 ) ) ( not ( = ?auto_7301 ?auto_7303 ) ) ( not ( = ?auto_7311 ?auto_7312 ) ) ( HOIST-AT ?auto_7309 ?auto_7311 ) ( not ( = ?auto_7306 ?auto_7309 ) ) ( SURFACE-AT ?auto_7303 ?auto_7311 ) ( ON ?auto_7303 ?auto_7317 ) ( CLEAR ?auto_7303 ) ( not ( = ?auto_7302 ?auto_7317 ) ) ( not ( = ?auto_7303 ?auto_7317 ) ) ( not ( = ?auto_7301 ?auto_7317 ) ) ( IS-CRATE ?auto_7302 ) ( AVAILABLE ?auto_7309 ) ( SURFACE-AT ?auto_7302 ?auto_7311 ) ( ON ?auto_7302 ?auto_7305 ) ( CLEAR ?auto_7302 ) ( not ( = ?auto_7302 ?auto_7305 ) ) ( not ( = ?auto_7303 ?auto_7305 ) ) ( not ( = ?auto_7301 ?auto_7305 ) ) ( not ( = ?auto_7317 ?auto_7305 ) ) ( IS-CRATE ?auto_7301 ) ( not ( = ?auto_7300 ?auto_7301 ) ) ( not ( = ?auto_7302 ?auto_7300 ) ) ( not ( = ?auto_7303 ?auto_7300 ) ) ( not ( = ?auto_7317 ?auto_7300 ) ) ( not ( = ?auto_7305 ?auto_7300 ) ) ( not ( = ?auto_7310 ?auto_7312 ) ) ( not ( = ?auto_7311 ?auto_7310 ) ) ( HOIST-AT ?auto_7308 ?auto_7310 ) ( not ( = ?auto_7306 ?auto_7308 ) ) ( not ( = ?auto_7309 ?auto_7308 ) ) ( AVAILABLE ?auto_7308 ) ( SURFACE-AT ?auto_7301 ?auto_7310 ) ( ON ?auto_7301 ?auto_7316 ) ( CLEAR ?auto_7301 ) ( not ( = ?auto_7302 ?auto_7316 ) ) ( not ( = ?auto_7303 ?auto_7316 ) ) ( not ( = ?auto_7301 ?auto_7316 ) ) ( not ( = ?auto_7317 ?auto_7316 ) ) ( not ( = ?auto_7305 ?auto_7316 ) ) ( not ( = ?auto_7300 ?auto_7316 ) ) ( SURFACE-AT ?auto_7313 ?auto_7312 ) ( CLEAR ?auto_7313 ) ( IS-CRATE ?auto_7300 ) ( not ( = ?auto_7313 ?auto_7300 ) ) ( not ( = ?auto_7302 ?auto_7313 ) ) ( not ( = ?auto_7303 ?auto_7313 ) ) ( not ( = ?auto_7301 ?auto_7313 ) ) ( not ( = ?auto_7317 ?auto_7313 ) ) ( not ( = ?auto_7305 ?auto_7313 ) ) ( not ( = ?auto_7316 ?auto_7313 ) ) ( AVAILABLE ?auto_7306 ) ( not ( = ?auto_7315 ?auto_7312 ) ) ( not ( = ?auto_7311 ?auto_7315 ) ) ( not ( = ?auto_7310 ?auto_7315 ) ) ( HOIST-AT ?auto_7304 ?auto_7315 ) ( not ( = ?auto_7306 ?auto_7304 ) ) ( not ( = ?auto_7309 ?auto_7304 ) ) ( not ( = ?auto_7308 ?auto_7304 ) ) ( AVAILABLE ?auto_7304 ) ( SURFACE-AT ?auto_7300 ?auto_7315 ) ( ON ?auto_7300 ?auto_7314 ) ( CLEAR ?auto_7300 ) ( not ( = ?auto_7302 ?auto_7314 ) ) ( not ( = ?auto_7303 ?auto_7314 ) ) ( not ( = ?auto_7301 ?auto_7314 ) ) ( not ( = ?auto_7317 ?auto_7314 ) ) ( not ( = ?auto_7305 ?auto_7314 ) ) ( not ( = ?auto_7300 ?auto_7314 ) ) ( not ( = ?auto_7316 ?auto_7314 ) ) ( not ( = ?auto_7313 ?auto_7314 ) ) ( TRUCK-AT ?auto_7307 ?auto_7312 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7301 ?auto_7302 ?auto_7303 )
      ( MAKE-3CRATE-VERIFY ?auto_7300 ?auto_7301 ?auto_7302 ?auto_7303 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7318 - SURFACE
      ?auto_7319 - SURFACE
      ?auto_7320 - SURFACE
      ?auto_7321 - SURFACE
      ?auto_7322 - SURFACE
    )
    :vars
    (
      ?auto_7325 - HOIST
      ?auto_7331 - PLACE
      ?auto_7330 - PLACE
      ?auto_7328 - HOIST
      ?auto_7335 - SURFACE
      ?auto_7324 - SURFACE
      ?auto_7329 - PLACE
      ?auto_7327 - HOIST
      ?auto_7334 - SURFACE
      ?auto_7333 - PLACE
      ?auto_7323 - HOIST
      ?auto_7332 - SURFACE
      ?auto_7326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7325 ?auto_7331 ) ( IS-CRATE ?auto_7322 ) ( not ( = ?auto_7321 ?auto_7322 ) ) ( not ( = ?auto_7320 ?auto_7321 ) ) ( not ( = ?auto_7320 ?auto_7322 ) ) ( not ( = ?auto_7330 ?auto_7331 ) ) ( HOIST-AT ?auto_7328 ?auto_7330 ) ( not ( = ?auto_7325 ?auto_7328 ) ) ( SURFACE-AT ?auto_7322 ?auto_7330 ) ( ON ?auto_7322 ?auto_7335 ) ( CLEAR ?auto_7322 ) ( not ( = ?auto_7321 ?auto_7335 ) ) ( not ( = ?auto_7322 ?auto_7335 ) ) ( not ( = ?auto_7320 ?auto_7335 ) ) ( IS-CRATE ?auto_7321 ) ( AVAILABLE ?auto_7328 ) ( SURFACE-AT ?auto_7321 ?auto_7330 ) ( ON ?auto_7321 ?auto_7324 ) ( CLEAR ?auto_7321 ) ( not ( = ?auto_7321 ?auto_7324 ) ) ( not ( = ?auto_7322 ?auto_7324 ) ) ( not ( = ?auto_7320 ?auto_7324 ) ) ( not ( = ?auto_7335 ?auto_7324 ) ) ( IS-CRATE ?auto_7320 ) ( not ( = ?auto_7319 ?auto_7320 ) ) ( not ( = ?auto_7321 ?auto_7319 ) ) ( not ( = ?auto_7322 ?auto_7319 ) ) ( not ( = ?auto_7335 ?auto_7319 ) ) ( not ( = ?auto_7324 ?auto_7319 ) ) ( not ( = ?auto_7329 ?auto_7331 ) ) ( not ( = ?auto_7330 ?auto_7329 ) ) ( HOIST-AT ?auto_7327 ?auto_7329 ) ( not ( = ?auto_7325 ?auto_7327 ) ) ( not ( = ?auto_7328 ?auto_7327 ) ) ( AVAILABLE ?auto_7327 ) ( SURFACE-AT ?auto_7320 ?auto_7329 ) ( ON ?auto_7320 ?auto_7334 ) ( CLEAR ?auto_7320 ) ( not ( = ?auto_7321 ?auto_7334 ) ) ( not ( = ?auto_7322 ?auto_7334 ) ) ( not ( = ?auto_7320 ?auto_7334 ) ) ( not ( = ?auto_7335 ?auto_7334 ) ) ( not ( = ?auto_7324 ?auto_7334 ) ) ( not ( = ?auto_7319 ?auto_7334 ) ) ( SURFACE-AT ?auto_7318 ?auto_7331 ) ( CLEAR ?auto_7318 ) ( IS-CRATE ?auto_7319 ) ( not ( = ?auto_7318 ?auto_7319 ) ) ( not ( = ?auto_7321 ?auto_7318 ) ) ( not ( = ?auto_7322 ?auto_7318 ) ) ( not ( = ?auto_7320 ?auto_7318 ) ) ( not ( = ?auto_7335 ?auto_7318 ) ) ( not ( = ?auto_7324 ?auto_7318 ) ) ( not ( = ?auto_7334 ?auto_7318 ) ) ( AVAILABLE ?auto_7325 ) ( not ( = ?auto_7333 ?auto_7331 ) ) ( not ( = ?auto_7330 ?auto_7333 ) ) ( not ( = ?auto_7329 ?auto_7333 ) ) ( HOIST-AT ?auto_7323 ?auto_7333 ) ( not ( = ?auto_7325 ?auto_7323 ) ) ( not ( = ?auto_7328 ?auto_7323 ) ) ( not ( = ?auto_7327 ?auto_7323 ) ) ( AVAILABLE ?auto_7323 ) ( SURFACE-AT ?auto_7319 ?auto_7333 ) ( ON ?auto_7319 ?auto_7332 ) ( CLEAR ?auto_7319 ) ( not ( = ?auto_7321 ?auto_7332 ) ) ( not ( = ?auto_7322 ?auto_7332 ) ) ( not ( = ?auto_7320 ?auto_7332 ) ) ( not ( = ?auto_7335 ?auto_7332 ) ) ( not ( = ?auto_7324 ?auto_7332 ) ) ( not ( = ?auto_7319 ?auto_7332 ) ) ( not ( = ?auto_7334 ?auto_7332 ) ) ( not ( = ?auto_7318 ?auto_7332 ) ) ( TRUCK-AT ?auto_7326 ?auto_7331 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7320 ?auto_7321 ?auto_7322 )
      ( MAKE-4CRATE-VERIFY ?auto_7318 ?auto_7319 ?auto_7320 ?auto_7321 ?auto_7322 ) )
  )

)

