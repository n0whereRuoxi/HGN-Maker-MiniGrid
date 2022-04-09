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

  ( :method MAKE-10CRATE-VERIFY
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
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264351 - SURFACE
      ?auto_264352 - SURFACE
    )
    :vars
    (
      ?auto_264353 - HOIST
      ?auto_264354 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264353 ?auto_264354 ) ( SURFACE-AT ?auto_264351 ?auto_264354 ) ( CLEAR ?auto_264351 ) ( LIFTING ?auto_264353 ?auto_264352 ) ( IS-CRATE ?auto_264352 ) ( not ( = ?auto_264351 ?auto_264352 ) ) )
    :subtasks
    ( ( !DROP ?auto_264353 ?auto_264352 ?auto_264351 ?auto_264354 )
      ( MAKE-1CRATE-VERIFY ?auto_264351 ?auto_264352 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264355 - SURFACE
      ?auto_264356 - SURFACE
    )
    :vars
    (
      ?auto_264357 - HOIST
      ?auto_264358 - PLACE
      ?auto_264359 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264357 ?auto_264358 ) ( SURFACE-AT ?auto_264355 ?auto_264358 ) ( CLEAR ?auto_264355 ) ( IS-CRATE ?auto_264356 ) ( not ( = ?auto_264355 ?auto_264356 ) ) ( TRUCK-AT ?auto_264359 ?auto_264358 ) ( AVAILABLE ?auto_264357 ) ( IN ?auto_264356 ?auto_264359 ) )
    :subtasks
    ( ( !UNLOAD ?auto_264357 ?auto_264356 ?auto_264359 ?auto_264358 )
      ( MAKE-1CRATE ?auto_264355 ?auto_264356 )
      ( MAKE-1CRATE-VERIFY ?auto_264355 ?auto_264356 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264360 - SURFACE
      ?auto_264361 - SURFACE
    )
    :vars
    (
      ?auto_264362 - HOIST
      ?auto_264364 - PLACE
      ?auto_264363 - TRUCK
      ?auto_264365 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264362 ?auto_264364 ) ( SURFACE-AT ?auto_264360 ?auto_264364 ) ( CLEAR ?auto_264360 ) ( IS-CRATE ?auto_264361 ) ( not ( = ?auto_264360 ?auto_264361 ) ) ( AVAILABLE ?auto_264362 ) ( IN ?auto_264361 ?auto_264363 ) ( TRUCK-AT ?auto_264363 ?auto_264365 ) ( not ( = ?auto_264365 ?auto_264364 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_264363 ?auto_264365 ?auto_264364 )
      ( MAKE-1CRATE ?auto_264360 ?auto_264361 )
      ( MAKE-1CRATE-VERIFY ?auto_264360 ?auto_264361 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264366 - SURFACE
      ?auto_264367 - SURFACE
    )
    :vars
    (
      ?auto_264369 - HOIST
      ?auto_264371 - PLACE
      ?auto_264368 - TRUCK
      ?auto_264370 - PLACE
      ?auto_264372 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_264369 ?auto_264371 ) ( SURFACE-AT ?auto_264366 ?auto_264371 ) ( CLEAR ?auto_264366 ) ( IS-CRATE ?auto_264367 ) ( not ( = ?auto_264366 ?auto_264367 ) ) ( AVAILABLE ?auto_264369 ) ( TRUCK-AT ?auto_264368 ?auto_264370 ) ( not ( = ?auto_264370 ?auto_264371 ) ) ( HOIST-AT ?auto_264372 ?auto_264370 ) ( LIFTING ?auto_264372 ?auto_264367 ) ( not ( = ?auto_264369 ?auto_264372 ) ) )
    :subtasks
    ( ( !LOAD ?auto_264372 ?auto_264367 ?auto_264368 ?auto_264370 )
      ( MAKE-1CRATE ?auto_264366 ?auto_264367 )
      ( MAKE-1CRATE-VERIFY ?auto_264366 ?auto_264367 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264373 - SURFACE
      ?auto_264374 - SURFACE
    )
    :vars
    (
      ?auto_264378 - HOIST
      ?auto_264377 - PLACE
      ?auto_264376 - TRUCK
      ?auto_264375 - PLACE
      ?auto_264379 - HOIST
      ?auto_264380 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264378 ?auto_264377 ) ( SURFACE-AT ?auto_264373 ?auto_264377 ) ( CLEAR ?auto_264373 ) ( IS-CRATE ?auto_264374 ) ( not ( = ?auto_264373 ?auto_264374 ) ) ( AVAILABLE ?auto_264378 ) ( TRUCK-AT ?auto_264376 ?auto_264375 ) ( not ( = ?auto_264375 ?auto_264377 ) ) ( HOIST-AT ?auto_264379 ?auto_264375 ) ( not ( = ?auto_264378 ?auto_264379 ) ) ( AVAILABLE ?auto_264379 ) ( SURFACE-AT ?auto_264374 ?auto_264375 ) ( ON ?auto_264374 ?auto_264380 ) ( CLEAR ?auto_264374 ) ( not ( = ?auto_264373 ?auto_264380 ) ) ( not ( = ?auto_264374 ?auto_264380 ) ) )
    :subtasks
    ( ( !LIFT ?auto_264379 ?auto_264374 ?auto_264380 ?auto_264375 )
      ( MAKE-1CRATE ?auto_264373 ?auto_264374 )
      ( MAKE-1CRATE-VERIFY ?auto_264373 ?auto_264374 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264381 - SURFACE
      ?auto_264382 - SURFACE
    )
    :vars
    (
      ?auto_264385 - HOIST
      ?auto_264388 - PLACE
      ?auto_264383 - PLACE
      ?auto_264386 - HOIST
      ?auto_264384 - SURFACE
      ?auto_264387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264385 ?auto_264388 ) ( SURFACE-AT ?auto_264381 ?auto_264388 ) ( CLEAR ?auto_264381 ) ( IS-CRATE ?auto_264382 ) ( not ( = ?auto_264381 ?auto_264382 ) ) ( AVAILABLE ?auto_264385 ) ( not ( = ?auto_264383 ?auto_264388 ) ) ( HOIST-AT ?auto_264386 ?auto_264383 ) ( not ( = ?auto_264385 ?auto_264386 ) ) ( AVAILABLE ?auto_264386 ) ( SURFACE-AT ?auto_264382 ?auto_264383 ) ( ON ?auto_264382 ?auto_264384 ) ( CLEAR ?auto_264382 ) ( not ( = ?auto_264381 ?auto_264384 ) ) ( not ( = ?auto_264382 ?auto_264384 ) ) ( TRUCK-AT ?auto_264387 ?auto_264388 ) )
    :subtasks
    ( ( !DRIVE ?auto_264387 ?auto_264388 ?auto_264383 )
      ( MAKE-1CRATE ?auto_264381 ?auto_264382 )
      ( MAKE-1CRATE-VERIFY ?auto_264381 ?auto_264382 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264398 - SURFACE
      ?auto_264399 - SURFACE
      ?auto_264400 - SURFACE
    )
    :vars
    (
      ?auto_264402 - HOIST
      ?auto_264401 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264402 ?auto_264401 ) ( SURFACE-AT ?auto_264399 ?auto_264401 ) ( CLEAR ?auto_264399 ) ( LIFTING ?auto_264402 ?auto_264400 ) ( IS-CRATE ?auto_264400 ) ( not ( = ?auto_264399 ?auto_264400 ) ) ( ON ?auto_264399 ?auto_264398 ) ( not ( = ?auto_264398 ?auto_264399 ) ) ( not ( = ?auto_264398 ?auto_264400 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264399 ?auto_264400 )
      ( MAKE-2CRATE-VERIFY ?auto_264398 ?auto_264399 ?auto_264400 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264408 - SURFACE
      ?auto_264409 - SURFACE
      ?auto_264410 - SURFACE
    )
    :vars
    (
      ?auto_264411 - HOIST
      ?auto_264413 - PLACE
      ?auto_264412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264411 ?auto_264413 ) ( SURFACE-AT ?auto_264409 ?auto_264413 ) ( CLEAR ?auto_264409 ) ( IS-CRATE ?auto_264410 ) ( not ( = ?auto_264409 ?auto_264410 ) ) ( TRUCK-AT ?auto_264412 ?auto_264413 ) ( AVAILABLE ?auto_264411 ) ( IN ?auto_264410 ?auto_264412 ) ( ON ?auto_264409 ?auto_264408 ) ( not ( = ?auto_264408 ?auto_264409 ) ) ( not ( = ?auto_264408 ?auto_264410 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264409 ?auto_264410 )
      ( MAKE-2CRATE-VERIFY ?auto_264408 ?auto_264409 ?auto_264410 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264414 - SURFACE
      ?auto_264415 - SURFACE
    )
    :vars
    (
      ?auto_264417 - HOIST
      ?auto_264418 - PLACE
      ?auto_264416 - TRUCK
      ?auto_264419 - SURFACE
      ?auto_264420 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264417 ?auto_264418 ) ( SURFACE-AT ?auto_264414 ?auto_264418 ) ( CLEAR ?auto_264414 ) ( IS-CRATE ?auto_264415 ) ( not ( = ?auto_264414 ?auto_264415 ) ) ( AVAILABLE ?auto_264417 ) ( IN ?auto_264415 ?auto_264416 ) ( ON ?auto_264414 ?auto_264419 ) ( not ( = ?auto_264419 ?auto_264414 ) ) ( not ( = ?auto_264419 ?auto_264415 ) ) ( TRUCK-AT ?auto_264416 ?auto_264420 ) ( not ( = ?auto_264420 ?auto_264418 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_264416 ?auto_264420 ?auto_264418 )
      ( MAKE-2CRATE ?auto_264419 ?auto_264414 ?auto_264415 )
      ( MAKE-1CRATE-VERIFY ?auto_264414 ?auto_264415 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264421 - SURFACE
      ?auto_264422 - SURFACE
      ?auto_264423 - SURFACE
    )
    :vars
    (
      ?auto_264425 - HOIST
      ?auto_264426 - PLACE
      ?auto_264424 - TRUCK
      ?auto_264427 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264425 ?auto_264426 ) ( SURFACE-AT ?auto_264422 ?auto_264426 ) ( CLEAR ?auto_264422 ) ( IS-CRATE ?auto_264423 ) ( not ( = ?auto_264422 ?auto_264423 ) ) ( AVAILABLE ?auto_264425 ) ( IN ?auto_264423 ?auto_264424 ) ( ON ?auto_264422 ?auto_264421 ) ( not ( = ?auto_264421 ?auto_264422 ) ) ( not ( = ?auto_264421 ?auto_264423 ) ) ( TRUCK-AT ?auto_264424 ?auto_264427 ) ( not ( = ?auto_264427 ?auto_264426 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264422 ?auto_264423 )
      ( MAKE-2CRATE-VERIFY ?auto_264421 ?auto_264422 ?auto_264423 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264428 - SURFACE
      ?auto_264429 - SURFACE
    )
    :vars
    (
      ?auto_264430 - HOIST
      ?auto_264432 - PLACE
      ?auto_264434 - SURFACE
      ?auto_264433 - TRUCK
      ?auto_264431 - PLACE
      ?auto_264435 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_264430 ?auto_264432 ) ( SURFACE-AT ?auto_264428 ?auto_264432 ) ( CLEAR ?auto_264428 ) ( IS-CRATE ?auto_264429 ) ( not ( = ?auto_264428 ?auto_264429 ) ) ( AVAILABLE ?auto_264430 ) ( ON ?auto_264428 ?auto_264434 ) ( not ( = ?auto_264434 ?auto_264428 ) ) ( not ( = ?auto_264434 ?auto_264429 ) ) ( TRUCK-AT ?auto_264433 ?auto_264431 ) ( not ( = ?auto_264431 ?auto_264432 ) ) ( HOIST-AT ?auto_264435 ?auto_264431 ) ( LIFTING ?auto_264435 ?auto_264429 ) ( not ( = ?auto_264430 ?auto_264435 ) ) )
    :subtasks
    ( ( !LOAD ?auto_264435 ?auto_264429 ?auto_264433 ?auto_264431 )
      ( MAKE-2CRATE ?auto_264434 ?auto_264428 ?auto_264429 )
      ( MAKE-1CRATE-VERIFY ?auto_264428 ?auto_264429 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264436 - SURFACE
      ?auto_264437 - SURFACE
      ?auto_264438 - SURFACE
    )
    :vars
    (
      ?auto_264440 - HOIST
      ?auto_264443 - PLACE
      ?auto_264442 - TRUCK
      ?auto_264439 - PLACE
      ?auto_264441 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_264440 ?auto_264443 ) ( SURFACE-AT ?auto_264437 ?auto_264443 ) ( CLEAR ?auto_264437 ) ( IS-CRATE ?auto_264438 ) ( not ( = ?auto_264437 ?auto_264438 ) ) ( AVAILABLE ?auto_264440 ) ( ON ?auto_264437 ?auto_264436 ) ( not ( = ?auto_264436 ?auto_264437 ) ) ( not ( = ?auto_264436 ?auto_264438 ) ) ( TRUCK-AT ?auto_264442 ?auto_264439 ) ( not ( = ?auto_264439 ?auto_264443 ) ) ( HOIST-AT ?auto_264441 ?auto_264439 ) ( LIFTING ?auto_264441 ?auto_264438 ) ( not ( = ?auto_264440 ?auto_264441 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264437 ?auto_264438 )
      ( MAKE-2CRATE-VERIFY ?auto_264436 ?auto_264437 ?auto_264438 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264444 - SURFACE
      ?auto_264445 - SURFACE
    )
    :vars
    (
      ?auto_264450 - HOIST
      ?auto_264448 - PLACE
      ?auto_264446 - SURFACE
      ?auto_264447 - TRUCK
      ?auto_264451 - PLACE
      ?auto_264449 - HOIST
      ?auto_264452 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264450 ?auto_264448 ) ( SURFACE-AT ?auto_264444 ?auto_264448 ) ( CLEAR ?auto_264444 ) ( IS-CRATE ?auto_264445 ) ( not ( = ?auto_264444 ?auto_264445 ) ) ( AVAILABLE ?auto_264450 ) ( ON ?auto_264444 ?auto_264446 ) ( not ( = ?auto_264446 ?auto_264444 ) ) ( not ( = ?auto_264446 ?auto_264445 ) ) ( TRUCK-AT ?auto_264447 ?auto_264451 ) ( not ( = ?auto_264451 ?auto_264448 ) ) ( HOIST-AT ?auto_264449 ?auto_264451 ) ( not ( = ?auto_264450 ?auto_264449 ) ) ( AVAILABLE ?auto_264449 ) ( SURFACE-AT ?auto_264445 ?auto_264451 ) ( ON ?auto_264445 ?auto_264452 ) ( CLEAR ?auto_264445 ) ( not ( = ?auto_264444 ?auto_264452 ) ) ( not ( = ?auto_264445 ?auto_264452 ) ) ( not ( = ?auto_264446 ?auto_264452 ) ) )
    :subtasks
    ( ( !LIFT ?auto_264449 ?auto_264445 ?auto_264452 ?auto_264451 )
      ( MAKE-2CRATE ?auto_264446 ?auto_264444 ?auto_264445 )
      ( MAKE-1CRATE-VERIFY ?auto_264444 ?auto_264445 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264453 - SURFACE
      ?auto_264454 - SURFACE
      ?auto_264455 - SURFACE
    )
    :vars
    (
      ?auto_264457 - HOIST
      ?auto_264459 - PLACE
      ?auto_264461 - TRUCK
      ?auto_264460 - PLACE
      ?auto_264456 - HOIST
      ?auto_264458 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264457 ?auto_264459 ) ( SURFACE-AT ?auto_264454 ?auto_264459 ) ( CLEAR ?auto_264454 ) ( IS-CRATE ?auto_264455 ) ( not ( = ?auto_264454 ?auto_264455 ) ) ( AVAILABLE ?auto_264457 ) ( ON ?auto_264454 ?auto_264453 ) ( not ( = ?auto_264453 ?auto_264454 ) ) ( not ( = ?auto_264453 ?auto_264455 ) ) ( TRUCK-AT ?auto_264461 ?auto_264460 ) ( not ( = ?auto_264460 ?auto_264459 ) ) ( HOIST-AT ?auto_264456 ?auto_264460 ) ( not ( = ?auto_264457 ?auto_264456 ) ) ( AVAILABLE ?auto_264456 ) ( SURFACE-AT ?auto_264455 ?auto_264460 ) ( ON ?auto_264455 ?auto_264458 ) ( CLEAR ?auto_264455 ) ( not ( = ?auto_264454 ?auto_264458 ) ) ( not ( = ?auto_264455 ?auto_264458 ) ) ( not ( = ?auto_264453 ?auto_264458 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264454 ?auto_264455 )
      ( MAKE-2CRATE-VERIFY ?auto_264453 ?auto_264454 ?auto_264455 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264462 - SURFACE
      ?auto_264463 - SURFACE
    )
    :vars
    (
      ?auto_264465 - HOIST
      ?auto_264470 - PLACE
      ?auto_264468 - SURFACE
      ?auto_264466 - PLACE
      ?auto_264469 - HOIST
      ?auto_264467 - SURFACE
      ?auto_264464 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264465 ?auto_264470 ) ( SURFACE-AT ?auto_264462 ?auto_264470 ) ( CLEAR ?auto_264462 ) ( IS-CRATE ?auto_264463 ) ( not ( = ?auto_264462 ?auto_264463 ) ) ( AVAILABLE ?auto_264465 ) ( ON ?auto_264462 ?auto_264468 ) ( not ( = ?auto_264468 ?auto_264462 ) ) ( not ( = ?auto_264468 ?auto_264463 ) ) ( not ( = ?auto_264466 ?auto_264470 ) ) ( HOIST-AT ?auto_264469 ?auto_264466 ) ( not ( = ?auto_264465 ?auto_264469 ) ) ( AVAILABLE ?auto_264469 ) ( SURFACE-AT ?auto_264463 ?auto_264466 ) ( ON ?auto_264463 ?auto_264467 ) ( CLEAR ?auto_264463 ) ( not ( = ?auto_264462 ?auto_264467 ) ) ( not ( = ?auto_264463 ?auto_264467 ) ) ( not ( = ?auto_264468 ?auto_264467 ) ) ( TRUCK-AT ?auto_264464 ?auto_264470 ) )
    :subtasks
    ( ( !DRIVE ?auto_264464 ?auto_264470 ?auto_264466 )
      ( MAKE-2CRATE ?auto_264468 ?auto_264462 ?auto_264463 )
      ( MAKE-1CRATE-VERIFY ?auto_264462 ?auto_264463 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264471 - SURFACE
      ?auto_264472 - SURFACE
      ?auto_264473 - SURFACE
    )
    :vars
    (
      ?auto_264475 - HOIST
      ?auto_264476 - PLACE
      ?auto_264477 - PLACE
      ?auto_264474 - HOIST
      ?auto_264478 - SURFACE
      ?auto_264479 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264475 ?auto_264476 ) ( SURFACE-AT ?auto_264472 ?auto_264476 ) ( CLEAR ?auto_264472 ) ( IS-CRATE ?auto_264473 ) ( not ( = ?auto_264472 ?auto_264473 ) ) ( AVAILABLE ?auto_264475 ) ( ON ?auto_264472 ?auto_264471 ) ( not ( = ?auto_264471 ?auto_264472 ) ) ( not ( = ?auto_264471 ?auto_264473 ) ) ( not ( = ?auto_264477 ?auto_264476 ) ) ( HOIST-AT ?auto_264474 ?auto_264477 ) ( not ( = ?auto_264475 ?auto_264474 ) ) ( AVAILABLE ?auto_264474 ) ( SURFACE-AT ?auto_264473 ?auto_264477 ) ( ON ?auto_264473 ?auto_264478 ) ( CLEAR ?auto_264473 ) ( not ( = ?auto_264472 ?auto_264478 ) ) ( not ( = ?auto_264473 ?auto_264478 ) ) ( not ( = ?auto_264471 ?auto_264478 ) ) ( TRUCK-AT ?auto_264479 ?auto_264476 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264472 ?auto_264473 )
      ( MAKE-2CRATE-VERIFY ?auto_264471 ?auto_264472 ?auto_264473 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264480 - SURFACE
      ?auto_264481 - SURFACE
    )
    :vars
    (
      ?auto_264488 - HOIST
      ?auto_264485 - PLACE
      ?auto_264483 - SURFACE
      ?auto_264484 - PLACE
      ?auto_264486 - HOIST
      ?auto_264482 - SURFACE
      ?auto_264487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264488 ?auto_264485 ) ( IS-CRATE ?auto_264481 ) ( not ( = ?auto_264480 ?auto_264481 ) ) ( not ( = ?auto_264483 ?auto_264480 ) ) ( not ( = ?auto_264483 ?auto_264481 ) ) ( not ( = ?auto_264484 ?auto_264485 ) ) ( HOIST-AT ?auto_264486 ?auto_264484 ) ( not ( = ?auto_264488 ?auto_264486 ) ) ( AVAILABLE ?auto_264486 ) ( SURFACE-AT ?auto_264481 ?auto_264484 ) ( ON ?auto_264481 ?auto_264482 ) ( CLEAR ?auto_264481 ) ( not ( = ?auto_264480 ?auto_264482 ) ) ( not ( = ?auto_264481 ?auto_264482 ) ) ( not ( = ?auto_264483 ?auto_264482 ) ) ( TRUCK-AT ?auto_264487 ?auto_264485 ) ( SURFACE-AT ?auto_264483 ?auto_264485 ) ( CLEAR ?auto_264483 ) ( LIFTING ?auto_264488 ?auto_264480 ) ( IS-CRATE ?auto_264480 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264483 ?auto_264480 )
      ( MAKE-2CRATE ?auto_264483 ?auto_264480 ?auto_264481 )
      ( MAKE-1CRATE-VERIFY ?auto_264480 ?auto_264481 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264489 - SURFACE
      ?auto_264490 - SURFACE
      ?auto_264491 - SURFACE
    )
    :vars
    (
      ?auto_264493 - HOIST
      ?auto_264495 - PLACE
      ?auto_264492 - PLACE
      ?auto_264494 - HOIST
      ?auto_264497 - SURFACE
      ?auto_264496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264493 ?auto_264495 ) ( IS-CRATE ?auto_264491 ) ( not ( = ?auto_264490 ?auto_264491 ) ) ( not ( = ?auto_264489 ?auto_264490 ) ) ( not ( = ?auto_264489 ?auto_264491 ) ) ( not ( = ?auto_264492 ?auto_264495 ) ) ( HOIST-AT ?auto_264494 ?auto_264492 ) ( not ( = ?auto_264493 ?auto_264494 ) ) ( AVAILABLE ?auto_264494 ) ( SURFACE-AT ?auto_264491 ?auto_264492 ) ( ON ?auto_264491 ?auto_264497 ) ( CLEAR ?auto_264491 ) ( not ( = ?auto_264490 ?auto_264497 ) ) ( not ( = ?auto_264491 ?auto_264497 ) ) ( not ( = ?auto_264489 ?auto_264497 ) ) ( TRUCK-AT ?auto_264496 ?auto_264495 ) ( SURFACE-AT ?auto_264489 ?auto_264495 ) ( CLEAR ?auto_264489 ) ( LIFTING ?auto_264493 ?auto_264490 ) ( IS-CRATE ?auto_264490 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264490 ?auto_264491 )
      ( MAKE-2CRATE-VERIFY ?auto_264489 ?auto_264490 ?auto_264491 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264498 - SURFACE
      ?auto_264499 - SURFACE
    )
    :vars
    (
      ?auto_264502 - HOIST
      ?auto_264504 - PLACE
      ?auto_264500 - SURFACE
      ?auto_264503 - PLACE
      ?auto_264506 - HOIST
      ?auto_264501 - SURFACE
      ?auto_264505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264502 ?auto_264504 ) ( IS-CRATE ?auto_264499 ) ( not ( = ?auto_264498 ?auto_264499 ) ) ( not ( = ?auto_264500 ?auto_264498 ) ) ( not ( = ?auto_264500 ?auto_264499 ) ) ( not ( = ?auto_264503 ?auto_264504 ) ) ( HOIST-AT ?auto_264506 ?auto_264503 ) ( not ( = ?auto_264502 ?auto_264506 ) ) ( AVAILABLE ?auto_264506 ) ( SURFACE-AT ?auto_264499 ?auto_264503 ) ( ON ?auto_264499 ?auto_264501 ) ( CLEAR ?auto_264499 ) ( not ( = ?auto_264498 ?auto_264501 ) ) ( not ( = ?auto_264499 ?auto_264501 ) ) ( not ( = ?auto_264500 ?auto_264501 ) ) ( TRUCK-AT ?auto_264505 ?auto_264504 ) ( SURFACE-AT ?auto_264500 ?auto_264504 ) ( CLEAR ?auto_264500 ) ( IS-CRATE ?auto_264498 ) ( AVAILABLE ?auto_264502 ) ( IN ?auto_264498 ?auto_264505 ) )
    :subtasks
    ( ( !UNLOAD ?auto_264502 ?auto_264498 ?auto_264505 ?auto_264504 )
      ( MAKE-2CRATE ?auto_264500 ?auto_264498 ?auto_264499 )
      ( MAKE-1CRATE-VERIFY ?auto_264498 ?auto_264499 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264507 - SURFACE
      ?auto_264508 - SURFACE
      ?auto_264509 - SURFACE
    )
    :vars
    (
      ?auto_264514 - HOIST
      ?auto_264511 - PLACE
      ?auto_264510 - PLACE
      ?auto_264512 - HOIST
      ?auto_264513 - SURFACE
      ?auto_264515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264514 ?auto_264511 ) ( IS-CRATE ?auto_264509 ) ( not ( = ?auto_264508 ?auto_264509 ) ) ( not ( = ?auto_264507 ?auto_264508 ) ) ( not ( = ?auto_264507 ?auto_264509 ) ) ( not ( = ?auto_264510 ?auto_264511 ) ) ( HOIST-AT ?auto_264512 ?auto_264510 ) ( not ( = ?auto_264514 ?auto_264512 ) ) ( AVAILABLE ?auto_264512 ) ( SURFACE-AT ?auto_264509 ?auto_264510 ) ( ON ?auto_264509 ?auto_264513 ) ( CLEAR ?auto_264509 ) ( not ( = ?auto_264508 ?auto_264513 ) ) ( not ( = ?auto_264509 ?auto_264513 ) ) ( not ( = ?auto_264507 ?auto_264513 ) ) ( TRUCK-AT ?auto_264515 ?auto_264511 ) ( SURFACE-AT ?auto_264507 ?auto_264511 ) ( CLEAR ?auto_264507 ) ( IS-CRATE ?auto_264508 ) ( AVAILABLE ?auto_264514 ) ( IN ?auto_264508 ?auto_264515 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264508 ?auto_264509 )
      ( MAKE-2CRATE-VERIFY ?auto_264507 ?auto_264508 ?auto_264509 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264552 - SURFACE
      ?auto_264553 - SURFACE
    )
    :vars
    (
      ?auto_264555 - HOIST
      ?auto_264558 - PLACE
      ?auto_264557 - SURFACE
      ?auto_264556 - PLACE
      ?auto_264560 - HOIST
      ?auto_264559 - SURFACE
      ?auto_264554 - TRUCK
      ?auto_264561 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264555 ?auto_264558 ) ( SURFACE-AT ?auto_264552 ?auto_264558 ) ( CLEAR ?auto_264552 ) ( IS-CRATE ?auto_264553 ) ( not ( = ?auto_264552 ?auto_264553 ) ) ( AVAILABLE ?auto_264555 ) ( ON ?auto_264552 ?auto_264557 ) ( not ( = ?auto_264557 ?auto_264552 ) ) ( not ( = ?auto_264557 ?auto_264553 ) ) ( not ( = ?auto_264556 ?auto_264558 ) ) ( HOIST-AT ?auto_264560 ?auto_264556 ) ( not ( = ?auto_264555 ?auto_264560 ) ) ( AVAILABLE ?auto_264560 ) ( SURFACE-AT ?auto_264553 ?auto_264556 ) ( ON ?auto_264553 ?auto_264559 ) ( CLEAR ?auto_264553 ) ( not ( = ?auto_264552 ?auto_264559 ) ) ( not ( = ?auto_264553 ?auto_264559 ) ) ( not ( = ?auto_264557 ?auto_264559 ) ) ( TRUCK-AT ?auto_264554 ?auto_264561 ) ( not ( = ?auto_264561 ?auto_264558 ) ) ( not ( = ?auto_264556 ?auto_264561 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_264554 ?auto_264561 ?auto_264558 )
      ( MAKE-1CRATE ?auto_264552 ?auto_264553 )
      ( MAKE-1CRATE-VERIFY ?auto_264552 ?auto_264553 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_264591 - SURFACE
      ?auto_264592 - SURFACE
      ?auto_264593 - SURFACE
      ?auto_264594 - SURFACE
    )
    :vars
    (
      ?auto_264596 - HOIST
      ?auto_264595 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264596 ?auto_264595 ) ( SURFACE-AT ?auto_264593 ?auto_264595 ) ( CLEAR ?auto_264593 ) ( LIFTING ?auto_264596 ?auto_264594 ) ( IS-CRATE ?auto_264594 ) ( not ( = ?auto_264593 ?auto_264594 ) ) ( ON ?auto_264592 ?auto_264591 ) ( ON ?auto_264593 ?auto_264592 ) ( not ( = ?auto_264591 ?auto_264592 ) ) ( not ( = ?auto_264591 ?auto_264593 ) ) ( not ( = ?auto_264591 ?auto_264594 ) ) ( not ( = ?auto_264592 ?auto_264593 ) ) ( not ( = ?auto_264592 ?auto_264594 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264593 ?auto_264594 )
      ( MAKE-3CRATE-VERIFY ?auto_264591 ?auto_264592 ?auto_264593 ?auto_264594 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_264608 - SURFACE
      ?auto_264609 - SURFACE
      ?auto_264610 - SURFACE
      ?auto_264611 - SURFACE
    )
    :vars
    (
      ?auto_264614 - HOIST
      ?auto_264613 - PLACE
      ?auto_264612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264614 ?auto_264613 ) ( SURFACE-AT ?auto_264610 ?auto_264613 ) ( CLEAR ?auto_264610 ) ( IS-CRATE ?auto_264611 ) ( not ( = ?auto_264610 ?auto_264611 ) ) ( TRUCK-AT ?auto_264612 ?auto_264613 ) ( AVAILABLE ?auto_264614 ) ( IN ?auto_264611 ?auto_264612 ) ( ON ?auto_264610 ?auto_264609 ) ( not ( = ?auto_264609 ?auto_264610 ) ) ( not ( = ?auto_264609 ?auto_264611 ) ) ( ON ?auto_264609 ?auto_264608 ) ( not ( = ?auto_264608 ?auto_264609 ) ) ( not ( = ?auto_264608 ?auto_264610 ) ) ( not ( = ?auto_264608 ?auto_264611 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_264609 ?auto_264610 ?auto_264611 )
      ( MAKE-3CRATE-VERIFY ?auto_264608 ?auto_264609 ?auto_264610 ?auto_264611 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_264629 - SURFACE
      ?auto_264630 - SURFACE
      ?auto_264631 - SURFACE
      ?auto_264632 - SURFACE
    )
    :vars
    (
      ?auto_264633 - HOIST
      ?auto_264636 - PLACE
      ?auto_264635 - TRUCK
      ?auto_264634 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264633 ?auto_264636 ) ( SURFACE-AT ?auto_264631 ?auto_264636 ) ( CLEAR ?auto_264631 ) ( IS-CRATE ?auto_264632 ) ( not ( = ?auto_264631 ?auto_264632 ) ) ( AVAILABLE ?auto_264633 ) ( IN ?auto_264632 ?auto_264635 ) ( ON ?auto_264631 ?auto_264630 ) ( not ( = ?auto_264630 ?auto_264631 ) ) ( not ( = ?auto_264630 ?auto_264632 ) ) ( TRUCK-AT ?auto_264635 ?auto_264634 ) ( not ( = ?auto_264634 ?auto_264636 ) ) ( ON ?auto_264630 ?auto_264629 ) ( not ( = ?auto_264629 ?auto_264630 ) ) ( not ( = ?auto_264629 ?auto_264631 ) ) ( not ( = ?auto_264629 ?auto_264632 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_264630 ?auto_264631 ?auto_264632 )
      ( MAKE-3CRATE-VERIFY ?auto_264629 ?auto_264630 ?auto_264631 ?auto_264632 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_264653 - SURFACE
      ?auto_264654 - SURFACE
      ?auto_264655 - SURFACE
      ?auto_264656 - SURFACE
    )
    :vars
    (
      ?auto_264657 - HOIST
      ?auto_264660 - PLACE
      ?auto_264658 - TRUCK
      ?auto_264659 - PLACE
      ?auto_264661 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_264657 ?auto_264660 ) ( SURFACE-AT ?auto_264655 ?auto_264660 ) ( CLEAR ?auto_264655 ) ( IS-CRATE ?auto_264656 ) ( not ( = ?auto_264655 ?auto_264656 ) ) ( AVAILABLE ?auto_264657 ) ( ON ?auto_264655 ?auto_264654 ) ( not ( = ?auto_264654 ?auto_264655 ) ) ( not ( = ?auto_264654 ?auto_264656 ) ) ( TRUCK-AT ?auto_264658 ?auto_264659 ) ( not ( = ?auto_264659 ?auto_264660 ) ) ( HOIST-AT ?auto_264661 ?auto_264659 ) ( LIFTING ?auto_264661 ?auto_264656 ) ( not ( = ?auto_264657 ?auto_264661 ) ) ( ON ?auto_264654 ?auto_264653 ) ( not ( = ?auto_264653 ?auto_264654 ) ) ( not ( = ?auto_264653 ?auto_264655 ) ) ( not ( = ?auto_264653 ?auto_264656 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_264654 ?auto_264655 ?auto_264656 )
      ( MAKE-3CRATE-VERIFY ?auto_264653 ?auto_264654 ?auto_264655 ?auto_264656 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_264680 - SURFACE
      ?auto_264681 - SURFACE
      ?auto_264682 - SURFACE
      ?auto_264683 - SURFACE
    )
    :vars
    (
      ?auto_264689 - HOIST
      ?auto_264684 - PLACE
      ?auto_264686 - TRUCK
      ?auto_264687 - PLACE
      ?auto_264688 - HOIST
      ?auto_264685 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264689 ?auto_264684 ) ( SURFACE-AT ?auto_264682 ?auto_264684 ) ( CLEAR ?auto_264682 ) ( IS-CRATE ?auto_264683 ) ( not ( = ?auto_264682 ?auto_264683 ) ) ( AVAILABLE ?auto_264689 ) ( ON ?auto_264682 ?auto_264681 ) ( not ( = ?auto_264681 ?auto_264682 ) ) ( not ( = ?auto_264681 ?auto_264683 ) ) ( TRUCK-AT ?auto_264686 ?auto_264687 ) ( not ( = ?auto_264687 ?auto_264684 ) ) ( HOIST-AT ?auto_264688 ?auto_264687 ) ( not ( = ?auto_264689 ?auto_264688 ) ) ( AVAILABLE ?auto_264688 ) ( SURFACE-AT ?auto_264683 ?auto_264687 ) ( ON ?auto_264683 ?auto_264685 ) ( CLEAR ?auto_264683 ) ( not ( = ?auto_264682 ?auto_264685 ) ) ( not ( = ?auto_264683 ?auto_264685 ) ) ( not ( = ?auto_264681 ?auto_264685 ) ) ( ON ?auto_264681 ?auto_264680 ) ( not ( = ?auto_264680 ?auto_264681 ) ) ( not ( = ?auto_264680 ?auto_264682 ) ) ( not ( = ?auto_264680 ?auto_264683 ) ) ( not ( = ?auto_264680 ?auto_264685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_264681 ?auto_264682 ?auto_264683 )
      ( MAKE-3CRATE-VERIFY ?auto_264680 ?auto_264681 ?auto_264682 ?auto_264683 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_264708 - SURFACE
      ?auto_264709 - SURFACE
      ?auto_264710 - SURFACE
      ?auto_264711 - SURFACE
    )
    :vars
    (
      ?auto_264717 - HOIST
      ?auto_264713 - PLACE
      ?auto_264716 - PLACE
      ?auto_264714 - HOIST
      ?auto_264715 - SURFACE
      ?auto_264712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264717 ?auto_264713 ) ( SURFACE-AT ?auto_264710 ?auto_264713 ) ( CLEAR ?auto_264710 ) ( IS-CRATE ?auto_264711 ) ( not ( = ?auto_264710 ?auto_264711 ) ) ( AVAILABLE ?auto_264717 ) ( ON ?auto_264710 ?auto_264709 ) ( not ( = ?auto_264709 ?auto_264710 ) ) ( not ( = ?auto_264709 ?auto_264711 ) ) ( not ( = ?auto_264716 ?auto_264713 ) ) ( HOIST-AT ?auto_264714 ?auto_264716 ) ( not ( = ?auto_264717 ?auto_264714 ) ) ( AVAILABLE ?auto_264714 ) ( SURFACE-AT ?auto_264711 ?auto_264716 ) ( ON ?auto_264711 ?auto_264715 ) ( CLEAR ?auto_264711 ) ( not ( = ?auto_264710 ?auto_264715 ) ) ( not ( = ?auto_264711 ?auto_264715 ) ) ( not ( = ?auto_264709 ?auto_264715 ) ) ( TRUCK-AT ?auto_264712 ?auto_264713 ) ( ON ?auto_264709 ?auto_264708 ) ( not ( = ?auto_264708 ?auto_264709 ) ) ( not ( = ?auto_264708 ?auto_264710 ) ) ( not ( = ?auto_264708 ?auto_264711 ) ) ( not ( = ?auto_264708 ?auto_264715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_264709 ?auto_264710 ?auto_264711 )
      ( MAKE-3CRATE-VERIFY ?auto_264708 ?auto_264709 ?auto_264710 ?auto_264711 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_264736 - SURFACE
      ?auto_264737 - SURFACE
      ?auto_264738 - SURFACE
      ?auto_264739 - SURFACE
    )
    :vars
    (
      ?auto_264745 - HOIST
      ?auto_264741 - PLACE
      ?auto_264744 - PLACE
      ?auto_264740 - HOIST
      ?auto_264743 - SURFACE
      ?auto_264742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264745 ?auto_264741 ) ( IS-CRATE ?auto_264739 ) ( not ( = ?auto_264738 ?auto_264739 ) ) ( not ( = ?auto_264737 ?auto_264738 ) ) ( not ( = ?auto_264737 ?auto_264739 ) ) ( not ( = ?auto_264744 ?auto_264741 ) ) ( HOIST-AT ?auto_264740 ?auto_264744 ) ( not ( = ?auto_264745 ?auto_264740 ) ) ( AVAILABLE ?auto_264740 ) ( SURFACE-AT ?auto_264739 ?auto_264744 ) ( ON ?auto_264739 ?auto_264743 ) ( CLEAR ?auto_264739 ) ( not ( = ?auto_264738 ?auto_264743 ) ) ( not ( = ?auto_264739 ?auto_264743 ) ) ( not ( = ?auto_264737 ?auto_264743 ) ) ( TRUCK-AT ?auto_264742 ?auto_264741 ) ( SURFACE-AT ?auto_264737 ?auto_264741 ) ( CLEAR ?auto_264737 ) ( LIFTING ?auto_264745 ?auto_264738 ) ( IS-CRATE ?auto_264738 ) ( ON ?auto_264737 ?auto_264736 ) ( not ( = ?auto_264736 ?auto_264737 ) ) ( not ( = ?auto_264736 ?auto_264738 ) ) ( not ( = ?auto_264736 ?auto_264739 ) ) ( not ( = ?auto_264736 ?auto_264743 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_264737 ?auto_264738 ?auto_264739 )
      ( MAKE-3CRATE-VERIFY ?auto_264736 ?auto_264737 ?auto_264738 ?auto_264739 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_264764 - SURFACE
      ?auto_264765 - SURFACE
      ?auto_264766 - SURFACE
      ?auto_264767 - SURFACE
    )
    :vars
    (
      ?auto_264773 - HOIST
      ?auto_264771 - PLACE
      ?auto_264770 - PLACE
      ?auto_264768 - HOIST
      ?auto_264769 - SURFACE
      ?auto_264772 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264773 ?auto_264771 ) ( IS-CRATE ?auto_264767 ) ( not ( = ?auto_264766 ?auto_264767 ) ) ( not ( = ?auto_264765 ?auto_264766 ) ) ( not ( = ?auto_264765 ?auto_264767 ) ) ( not ( = ?auto_264770 ?auto_264771 ) ) ( HOIST-AT ?auto_264768 ?auto_264770 ) ( not ( = ?auto_264773 ?auto_264768 ) ) ( AVAILABLE ?auto_264768 ) ( SURFACE-AT ?auto_264767 ?auto_264770 ) ( ON ?auto_264767 ?auto_264769 ) ( CLEAR ?auto_264767 ) ( not ( = ?auto_264766 ?auto_264769 ) ) ( not ( = ?auto_264767 ?auto_264769 ) ) ( not ( = ?auto_264765 ?auto_264769 ) ) ( TRUCK-AT ?auto_264772 ?auto_264771 ) ( SURFACE-AT ?auto_264765 ?auto_264771 ) ( CLEAR ?auto_264765 ) ( IS-CRATE ?auto_264766 ) ( AVAILABLE ?auto_264773 ) ( IN ?auto_264766 ?auto_264772 ) ( ON ?auto_264765 ?auto_264764 ) ( not ( = ?auto_264764 ?auto_264765 ) ) ( not ( = ?auto_264764 ?auto_264766 ) ) ( not ( = ?auto_264764 ?auto_264767 ) ) ( not ( = ?auto_264764 ?auto_264769 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_264765 ?auto_264766 ?auto_264767 )
      ( MAKE-3CRATE-VERIFY ?auto_264764 ?auto_264765 ?auto_264766 ?auto_264767 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265055 - SURFACE
      ?auto_265056 - SURFACE
      ?auto_265057 - SURFACE
      ?auto_265059 - SURFACE
      ?auto_265058 - SURFACE
    )
    :vars
    (
      ?auto_265060 - HOIST
      ?auto_265061 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265060 ?auto_265061 ) ( SURFACE-AT ?auto_265059 ?auto_265061 ) ( CLEAR ?auto_265059 ) ( LIFTING ?auto_265060 ?auto_265058 ) ( IS-CRATE ?auto_265058 ) ( not ( = ?auto_265059 ?auto_265058 ) ) ( ON ?auto_265056 ?auto_265055 ) ( ON ?auto_265057 ?auto_265056 ) ( ON ?auto_265059 ?auto_265057 ) ( not ( = ?auto_265055 ?auto_265056 ) ) ( not ( = ?auto_265055 ?auto_265057 ) ) ( not ( = ?auto_265055 ?auto_265059 ) ) ( not ( = ?auto_265055 ?auto_265058 ) ) ( not ( = ?auto_265056 ?auto_265057 ) ) ( not ( = ?auto_265056 ?auto_265059 ) ) ( not ( = ?auto_265056 ?auto_265058 ) ) ( not ( = ?auto_265057 ?auto_265059 ) ) ( not ( = ?auto_265057 ?auto_265058 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_265059 ?auto_265058 )
      ( MAKE-4CRATE-VERIFY ?auto_265055 ?auto_265056 ?auto_265057 ?auto_265059 ?auto_265058 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265080 - SURFACE
      ?auto_265081 - SURFACE
      ?auto_265082 - SURFACE
      ?auto_265084 - SURFACE
      ?auto_265083 - SURFACE
    )
    :vars
    (
      ?auto_265086 - HOIST
      ?auto_265085 - PLACE
      ?auto_265087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265086 ?auto_265085 ) ( SURFACE-AT ?auto_265084 ?auto_265085 ) ( CLEAR ?auto_265084 ) ( IS-CRATE ?auto_265083 ) ( not ( = ?auto_265084 ?auto_265083 ) ) ( TRUCK-AT ?auto_265087 ?auto_265085 ) ( AVAILABLE ?auto_265086 ) ( IN ?auto_265083 ?auto_265087 ) ( ON ?auto_265084 ?auto_265082 ) ( not ( = ?auto_265082 ?auto_265084 ) ) ( not ( = ?auto_265082 ?auto_265083 ) ) ( ON ?auto_265081 ?auto_265080 ) ( ON ?auto_265082 ?auto_265081 ) ( not ( = ?auto_265080 ?auto_265081 ) ) ( not ( = ?auto_265080 ?auto_265082 ) ) ( not ( = ?auto_265080 ?auto_265084 ) ) ( not ( = ?auto_265080 ?auto_265083 ) ) ( not ( = ?auto_265081 ?auto_265082 ) ) ( not ( = ?auto_265081 ?auto_265084 ) ) ( not ( = ?auto_265081 ?auto_265083 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265082 ?auto_265084 ?auto_265083 )
      ( MAKE-4CRATE-VERIFY ?auto_265080 ?auto_265081 ?auto_265082 ?auto_265084 ?auto_265083 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265110 - SURFACE
      ?auto_265111 - SURFACE
      ?auto_265112 - SURFACE
      ?auto_265114 - SURFACE
      ?auto_265113 - SURFACE
    )
    :vars
    (
      ?auto_265117 - HOIST
      ?auto_265116 - PLACE
      ?auto_265118 - TRUCK
      ?auto_265115 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265117 ?auto_265116 ) ( SURFACE-AT ?auto_265114 ?auto_265116 ) ( CLEAR ?auto_265114 ) ( IS-CRATE ?auto_265113 ) ( not ( = ?auto_265114 ?auto_265113 ) ) ( AVAILABLE ?auto_265117 ) ( IN ?auto_265113 ?auto_265118 ) ( ON ?auto_265114 ?auto_265112 ) ( not ( = ?auto_265112 ?auto_265114 ) ) ( not ( = ?auto_265112 ?auto_265113 ) ) ( TRUCK-AT ?auto_265118 ?auto_265115 ) ( not ( = ?auto_265115 ?auto_265116 ) ) ( ON ?auto_265111 ?auto_265110 ) ( ON ?auto_265112 ?auto_265111 ) ( not ( = ?auto_265110 ?auto_265111 ) ) ( not ( = ?auto_265110 ?auto_265112 ) ) ( not ( = ?auto_265110 ?auto_265114 ) ) ( not ( = ?auto_265110 ?auto_265113 ) ) ( not ( = ?auto_265111 ?auto_265112 ) ) ( not ( = ?auto_265111 ?auto_265114 ) ) ( not ( = ?auto_265111 ?auto_265113 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265112 ?auto_265114 ?auto_265113 )
      ( MAKE-4CRATE-VERIFY ?auto_265110 ?auto_265111 ?auto_265112 ?auto_265114 ?auto_265113 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265144 - SURFACE
      ?auto_265145 - SURFACE
      ?auto_265146 - SURFACE
      ?auto_265148 - SURFACE
      ?auto_265147 - SURFACE
    )
    :vars
    (
      ?auto_265152 - HOIST
      ?auto_265153 - PLACE
      ?auto_265150 - TRUCK
      ?auto_265149 - PLACE
      ?auto_265151 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_265152 ?auto_265153 ) ( SURFACE-AT ?auto_265148 ?auto_265153 ) ( CLEAR ?auto_265148 ) ( IS-CRATE ?auto_265147 ) ( not ( = ?auto_265148 ?auto_265147 ) ) ( AVAILABLE ?auto_265152 ) ( ON ?auto_265148 ?auto_265146 ) ( not ( = ?auto_265146 ?auto_265148 ) ) ( not ( = ?auto_265146 ?auto_265147 ) ) ( TRUCK-AT ?auto_265150 ?auto_265149 ) ( not ( = ?auto_265149 ?auto_265153 ) ) ( HOIST-AT ?auto_265151 ?auto_265149 ) ( LIFTING ?auto_265151 ?auto_265147 ) ( not ( = ?auto_265152 ?auto_265151 ) ) ( ON ?auto_265145 ?auto_265144 ) ( ON ?auto_265146 ?auto_265145 ) ( not ( = ?auto_265144 ?auto_265145 ) ) ( not ( = ?auto_265144 ?auto_265146 ) ) ( not ( = ?auto_265144 ?auto_265148 ) ) ( not ( = ?auto_265144 ?auto_265147 ) ) ( not ( = ?auto_265145 ?auto_265146 ) ) ( not ( = ?auto_265145 ?auto_265148 ) ) ( not ( = ?auto_265145 ?auto_265147 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265146 ?auto_265148 ?auto_265147 )
      ( MAKE-4CRATE-VERIFY ?auto_265144 ?auto_265145 ?auto_265146 ?auto_265148 ?auto_265147 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265182 - SURFACE
      ?auto_265183 - SURFACE
      ?auto_265184 - SURFACE
      ?auto_265186 - SURFACE
      ?auto_265185 - SURFACE
    )
    :vars
    (
      ?auto_265187 - HOIST
      ?auto_265188 - PLACE
      ?auto_265190 - TRUCK
      ?auto_265191 - PLACE
      ?auto_265192 - HOIST
      ?auto_265189 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265187 ?auto_265188 ) ( SURFACE-AT ?auto_265186 ?auto_265188 ) ( CLEAR ?auto_265186 ) ( IS-CRATE ?auto_265185 ) ( not ( = ?auto_265186 ?auto_265185 ) ) ( AVAILABLE ?auto_265187 ) ( ON ?auto_265186 ?auto_265184 ) ( not ( = ?auto_265184 ?auto_265186 ) ) ( not ( = ?auto_265184 ?auto_265185 ) ) ( TRUCK-AT ?auto_265190 ?auto_265191 ) ( not ( = ?auto_265191 ?auto_265188 ) ) ( HOIST-AT ?auto_265192 ?auto_265191 ) ( not ( = ?auto_265187 ?auto_265192 ) ) ( AVAILABLE ?auto_265192 ) ( SURFACE-AT ?auto_265185 ?auto_265191 ) ( ON ?auto_265185 ?auto_265189 ) ( CLEAR ?auto_265185 ) ( not ( = ?auto_265186 ?auto_265189 ) ) ( not ( = ?auto_265185 ?auto_265189 ) ) ( not ( = ?auto_265184 ?auto_265189 ) ) ( ON ?auto_265183 ?auto_265182 ) ( ON ?auto_265184 ?auto_265183 ) ( not ( = ?auto_265182 ?auto_265183 ) ) ( not ( = ?auto_265182 ?auto_265184 ) ) ( not ( = ?auto_265182 ?auto_265186 ) ) ( not ( = ?auto_265182 ?auto_265185 ) ) ( not ( = ?auto_265182 ?auto_265189 ) ) ( not ( = ?auto_265183 ?auto_265184 ) ) ( not ( = ?auto_265183 ?auto_265186 ) ) ( not ( = ?auto_265183 ?auto_265185 ) ) ( not ( = ?auto_265183 ?auto_265189 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265184 ?auto_265186 ?auto_265185 )
      ( MAKE-4CRATE-VERIFY ?auto_265182 ?auto_265183 ?auto_265184 ?auto_265186 ?auto_265185 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265221 - SURFACE
      ?auto_265222 - SURFACE
      ?auto_265223 - SURFACE
      ?auto_265225 - SURFACE
      ?auto_265224 - SURFACE
    )
    :vars
    (
      ?auto_265227 - HOIST
      ?auto_265229 - PLACE
      ?auto_265228 - PLACE
      ?auto_265231 - HOIST
      ?auto_265230 - SURFACE
      ?auto_265226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265227 ?auto_265229 ) ( SURFACE-AT ?auto_265225 ?auto_265229 ) ( CLEAR ?auto_265225 ) ( IS-CRATE ?auto_265224 ) ( not ( = ?auto_265225 ?auto_265224 ) ) ( AVAILABLE ?auto_265227 ) ( ON ?auto_265225 ?auto_265223 ) ( not ( = ?auto_265223 ?auto_265225 ) ) ( not ( = ?auto_265223 ?auto_265224 ) ) ( not ( = ?auto_265228 ?auto_265229 ) ) ( HOIST-AT ?auto_265231 ?auto_265228 ) ( not ( = ?auto_265227 ?auto_265231 ) ) ( AVAILABLE ?auto_265231 ) ( SURFACE-AT ?auto_265224 ?auto_265228 ) ( ON ?auto_265224 ?auto_265230 ) ( CLEAR ?auto_265224 ) ( not ( = ?auto_265225 ?auto_265230 ) ) ( not ( = ?auto_265224 ?auto_265230 ) ) ( not ( = ?auto_265223 ?auto_265230 ) ) ( TRUCK-AT ?auto_265226 ?auto_265229 ) ( ON ?auto_265222 ?auto_265221 ) ( ON ?auto_265223 ?auto_265222 ) ( not ( = ?auto_265221 ?auto_265222 ) ) ( not ( = ?auto_265221 ?auto_265223 ) ) ( not ( = ?auto_265221 ?auto_265225 ) ) ( not ( = ?auto_265221 ?auto_265224 ) ) ( not ( = ?auto_265221 ?auto_265230 ) ) ( not ( = ?auto_265222 ?auto_265223 ) ) ( not ( = ?auto_265222 ?auto_265225 ) ) ( not ( = ?auto_265222 ?auto_265224 ) ) ( not ( = ?auto_265222 ?auto_265230 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265223 ?auto_265225 ?auto_265224 )
      ( MAKE-4CRATE-VERIFY ?auto_265221 ?auto_265222 ?auto_265223 ?auto_265225 ?auto_265224 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265260 - SURFACE
      ?auto_265261 - SURFACE
      ?auto_265262 - SURFACE
      ?auto_265264 - SURFACE
      ?auto_265263 - SURFACE
    )
    :vars
    (
      ?auto_265268 - HOIST
      ?auto_265265 - PLACE
      ?auto_265269 - PLACE
      ?auto_265266 - HOIST
      ?auto_265270 - SURFACE
      ?auto_265267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265268 ?auto_265265 ) ( IS-CRATE ?auto_265263 ) ( not ( = ?auto_265264 ?auto_265263 ) ) ( not ( = ?auto_265262 ?auto_265264 ) ) ( not ( = ?auto_265262 ?auto_265263 ) ) ( not ( = ?auto_265269 ?auto_265265 ) ) ( HOIST-AT ?auto_265266 ?auto_265269 ) ( not ( = ?auto_265268 ?auto_265266 ) ) ( AVAILABLE ?auto_265266 ) ( SURFACE-AT ?auto_265263 ?auto_265269 ) ( ON ?auto_265263 ?auto_265270 ) ( CLEAR ?auto_265263 ) ( not ( = ?auto_265264 ?auto_265270 ) ) ( not ( = ?auto_265263 ?auto_265270 ) ) ( not ( = ?auto_265262 ?auto_265270 ) ) ( TRUCK-AT ?auto_265267 ?auto_265265 ) ( SURFACE-AT ?auto_265262 ?auto_265265 ) ( CLEAR ?auto_265262 ) ( LIFTING ?auto_265268 ?auto_265264 ) ( IS-CRATE ?auto_265264 ) ( ON ?auto_265261 ?auto_265260 ) ( ON ?auto_265262 ?auto_265261 ) ( not ( = ?auto_265260 ?auto_265261 ) ) ( not ( = ?auto_265260 ?auto_265262 ) ) ( not ( = ?auto_265260 ?auto_265264 ) ) ( not ( = ?auto_265260 ?auto_265263 ) ) ( not ( = ?auto_265260 ?auto_265270 ) ) ( not ( = ?auto_265261 ?auto_265262 ) ) ( not ( = ?auto_265261 ?auto_265264 ) ) ( not ( = ?auto_265261 ?auto_265263 ) ) ( not ( = ?auto_265261 ?auto_265270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265262 ?auto_265264 ?auto_265263 )
      ( MAKE-4CRATE-VERIFY ?auto_265260 ?auto_265261 ?auto_265262 ?auto_265264 ?auto_265263 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265299 - SURFACE
      ?auto_265300 - SURFACE
      ?auto_265301 - SURFACE
      ?auto_265303 - SURFACE
      ?auto_265302 - SURFACE
    )
    :vars
    (
      ?auto_265306 - HOIST
      ?auto_265304 - PLACE
      ?auto_265309 - PLACE
      ?auto_265305 - HOIST
      ?auto_265307 - SURFACE
      ?auto_265308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265306 ?auto_265304 ) ( IS-CRATE ?auto_265302 ) ( not ( = ?auto_265303 ?auto_265302 ) ) ( not ( = ?auto_265301 ?auto_265303 ) ) ( not ( = ?auto_265301 ?auto_265302 ) ) ( not ( = ?auto_265309 ?auto_265304 ) ) ( HOIST-AT ?auto_265305 ?auto_265309 ) ( not ( = ?auto_265306 ?auto_265305 ) ) ( AVAILABLE ?auto_265305 ) ( SURFACE-AT ?auto_265302 ?auto_265309 ) ( ON ?auto_265302 ?auto_265307 ) ( CLEAR ?auto_265302 ) ( not ( = ?auto_265303 ?auto_265307 ) ) ( not ( = ?auto_265302 ?auto_265307 ) ) ( not ( = ?auto_265301 ?auto_265307 ) ) ( TRUCK-AT ?auto_265308 ?auto_265304 ) ( SURFACE-AT ?auto_265301 ?auto_265304 ) ( CLEAR ?auto_265301 ) ( IS-CRATE ?auto_265303 ) ( AVAILABLE ?auto_265306 ) ( IN ?auto_265303 ?auto_265308 ) ( ON ?auto_265300 ?auto_265299 ) ( ON ?auto_265301 ?auto_265300 ) ( not ( = ?auto_265299 ?auto_265300 ) ) ( not ( = ?auto_265299 ?auto_265301 ) ) ( not ( = ?auto_265299 ?auto_265303 ) ) ( not ( = ?auto_265299 ?auto_265302 ) ) ( not ( = ?auto_265299 ?auto_265307 ) ) ( not ( = ?auto_265300 ?auto_265301 ) ) ( not ( = ?auto_265300 ?auto_265303 ) ) ( not ( = ?auto_265300 ?auto_265302 ) ) ( not ( = ?auto_265300 ?auto_265307 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265301 ?auto_265303 ?auto_265302 )
      ( MAKE-4CRATE-VERIFY ?auto_265299 ?auto_265300 ?auto_265301 ?auto_265303 ?auto_265302 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_265310 - SURFACE
      ?auto_265311 - SURFACE
    )
    :vars
    (
      ?auto_265314 - HOIST
      ?auto_265312 - PLACE
      ?auto_265315 - SURFACE
      ?auto_265318 - PLACE
      ?auto_265313 - HOIST
      ?auto_265316 - SURFACE
      ?auto_265317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265314 ?auto_265312 ) ( IS-CRATE ?auto_265311 ) ( not ( = ?auto_265310 ?auto_265311 ) ) ( not ( = ?auto_265315 ?auto_265310 ) ) ( not ( = ?auto_265315 ?auto_265311 ) ) ( not ( = ?auto_265318 ?auto_265312 ) ) ( HOIST-AT ?auto_265313 ?auto_265318 ) ( not ( = ?auto_265314 ?auto_265313 ) ) ( AVAILABLE ?auto_265313 ) ( SURFACE-AT ?auto_265311 ?auto_265318 ) ( ON ?auto_265311 ?auto_265316 ) ( CLEAR ?auto_265311 ) ( not ( = ?auto_265310 ?auto_265316 ) ) ( not ( = ?auto_265311 ?auto_265316 ) ) ( not ( = ?auto_265315 ?auto_265316 ) ) ( SURFACE-AT ?auto_265315 ?auto_265312 ) ( CLEAR ?auto_265315 ) ( IS-CRATE ?auto_265310 ) ( AVAILABLE ?auto_265314 ) ( IN ?auto_265310 ?auto_265317 ) ( TRUCK-AT ?auto_265317 ?auto_265318 ) )
    :subtasks
    ( ( !DRIVE ?auto_265317 ?auto_265318 ?auto_265312 )
      ( MAKE-2CRATE ?auto_265315 ?auto_265310 ?auto_265311 )
      ( MAKE-1CRATE-VERIFY ?auto_265310 ?auto_265311 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_265319 - SURFACE
      ?auto_265320 - SURFACE
      ?auto_265321 - SURFACE
    )
    :vars
    (
      ?auto_265324 - HOIST
      ?auto_265322 - PLACE
      ?auto_265327 - PLACE
      ?auto_265323 - HOIST
      ?auto_265326 - SURFACE
      ?auto_265325 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265324 ?auto_265322 ) ( IS-CRATE ?auto_265321 ) ( not ( = ?auto_265320 ?auto_265321 ) ) ( not ( = ?auto_265319 ?auto_265320 ) ) ( not ( = ?auto_265319 ?auto_265321 ) ) ( not ( = ?auto_265327 ?auto_265322 ) ) ( HOIST-AT ?auto_265323 ?auto_265327 ) ( not ( = ?auto_265324 ?auto_265323 ) ) ( AVAILABLE ?auto_265323 ) ( SURFACE-AT ?auto_265321 ?auto_265327 ) ( ON ?auto_265321 ?auto_265326 ) ( CLEAR ?auto_265321 ) ( not ( = ?auto_265320 ?auto_265326 ) ) ( not ( = ?auto_265321 ?auto_265326 ) ) ( not ( = ?auto_265319 ?auto_265326 ) ) ( SURFACE-AT ?auto_265319 ?auto_265322 ) ( CLEAR ?auto_265319 ) ( IS-CRATE ?auto_265320 ) ( AVAILABLE ?auto_265324 ) ( IN ?auto_265320 ?auto_265325 ) ( TRUCK-AT ?auto_265325 ?auto_265327 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_265320 ?auto_265321 )
      ( MAKE-2CRATE-VERIFY ?auto_265319 ?auto_265320 ?auto_265321 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_265328 - SURFACE
      ?auto_265329 - SURFACE
      ?auto_265330 - SURFACE
      ?auto_265331 - SURFACE
    )
    :vars
    (
      ?auto_265333 - HOIST
      ?auto_265334 - PLACE
      ?auto_265335 - PLACE
      ?auto_265336 - HOIST
      ?auto_265337 - SURFACE
      ?auto_265332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265333 ?auto_265334 ) ( IS-CRATE ?auto_265331 ) ( not ( = ?auto_265330 ?auto_265331 ) ) ( not ( = ?auto_265329 ?auto_265330 ) ) ( not ( = ?auto_265329 ?auto_265331 ) ) ( not ( = ?auto_265335 ?auto_265334 ) ) ( HOIST-AT ?auto_265336 ?auto_265335 ) ( not ( = ?auto_265333 ?auto_265336 ) ) ( AVAILABLE ?auto_265336 ) ( SURFACE-AT ?auto_265331 ?auto_265335 ) ( ON ?auto_265331 ?auto_265337 ) ( CLEAR ?auto_265331 ) ( not ( = ?auto_265330 ?auto_265337 ) ) ( not ( = ?auto_265331 ?auto_265337 ) ) ( not ( = ?auto_265329 ?auto_265337 ) ) ( SURFACE-AT ?auto_265329 ?auto_265334 ) ( CLEAR ?auto_265329 ) ( IS-CRATE ?auto_265330 ) ( AVAILABLE ?auto_265333 ) ( IN ?auto_265330 ?auto_265332 ) ( TRUCK-AT ?auto_265332 ?auto_265335 ) ( ON ?auto_265329 ?auto_265328 ) ( not ( = ?auto_265328 ?auto_265329 ) ) ( not ( = ?auto_265328 ?auto_265330 ) ) ( not ( = ?auto_265328 ?auto_265331 ) ) ( not ( = ?auto_265328 ?auto_265337 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265329 ?auto_265330 ?auto_265331 )
      ( MAKE-3CRATE-VERIFY ?auto_265328 ?auto_265329 ?auto_265330 ?auto_265331 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265338 - SURFACE
      ?auto_265339 - SURFACE
      ?auto_265340 - SURFACE
      ?auto_265342 - SURFACE
      ?auto_265341 - SURFACE
    )
    :vars
    (
      ?auto_265344 - HOIST
      ?auto_265345 - PLACE
      ?auto_265346 - PLACE
      ?auto_265347 - HOIST
      ?auto_265348 - SURFACE
      ?auto_265343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265344 ?auto_265345 ) ( IS-CRATE ?auto_265341 ) ( not ( = ?auto_265342 ?auto_265341 ) ) ( not ( = ?auto_265340 ?auto_265342 ) ) ( not ( = ?auto_265340 ?auto_265341 ) ) ( not ( = ?auto_265346 ?auto_265345 ) ) ( HOIST-AT ?auto_265347 ?auto_265346 ) ( not ( = ?auto_265344 ?auto_265347 ) ) ( AVAILABLE ?auto_265347 ) ( SURFACE-AT ?auto_265341 ?auto_265346 ) ( ON ?auto_265341 ?auto_265348 ) ( CLEAR ?auto_265341 ) ( not ( = ?auto_265342 ?auto_265348 ) ) ( not ( = ?auto_265341 ?auto_265348 ) ) ( not ( = ?auto_265340 ?auto_265348 ) ) ( SURFACE-AT ?auto_265340 ?auto_265345 ) ( CLEAR ?auto_265340 ) ( IS-CRATE ?auto_265342 ) ( AVAILABLE ?auto_265344 ) ( IN ?auto_265342 ?auto_265343 ) ( TRUCK-AT ?auto_265343 ?auto_265346 ) ( ON ?auto_265339 ?auto_265338 ) ( ON ?auto_265340 ?auto_265339 ) ( not ( = ?auto_265338 ?auto_265339 ) ) ( not ( = ?auto_265338 ?auto_265340 ) ) ( not ( = ?auto_265338 ?auto_265342 ) ) ( not ( = ?auto_265338 ?auto_265341 ) ) ( not ( = ?auto_265338 ?auto_265348 ) ) ( not ( = ?auto_265339 ?auto_265340 ) ) ( not ( = ?auto_265339 ?auto_265342 ) ) ( not ( = ?auto_265339 ?auto_265341 ) ) ( not ( = ?auto_265339 ?auto_265348 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265340 ?auto_265342 ?auto_265341 )
      ( MAKE-4CRATE-VERIFY ?auto_265338 ?auto_265339 ?auto_265340 ?auto_265342 ?auto_265341 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_265349 - SURFACE
      ?auto_265350 - SURFACE
    )
    :vars
    (
      ?auto_265352 - HOIST
      ?auto_265353 - PLACE
      ?auto_265356 - SURFACE
      ?auto_265354 - PLACE
      ?auto_265355 - HOIST
      ?auto_265357 - SURFACE
      ?auto_265351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265352 ?auto_265353 ) ( IS-CRATE ?auto_265350 ) ( not ( = ?auto_265349 ?auto_265350 ) ) ( not ( = ?auto_265356 ?auto_265349 ) ) ( not ( = ?auto_265356 ?auto_265350 ) ) ( not ( = ?auto_265354 ?auto_265353 ) ) ( HOIST-AT ?auto_265355 ?auto_265354 ) ( not ( = ?auto_265352 ?auto_265355 ) ) ( SURFACE-AT ?auto_265350 ?auto_265354 ) ( ON ?auto_265350 ?auto_265357 ) ( CLEAR ?auto_265350 ) ( not ( = ?auto_265349 ?auto_265357 ) ) ( not ( = ?auto_265350 ?auto_265357 ) ) ( not ( = ?auto_265356 ?auto_265357 ) ) ( SURFACE-AT ?auto_265356 ?auto_265353 ) ( CLEAR ?auto_265356 ) ( IS-CRATE ?auto_265349 ) ( AVAILABLE ?auto_265352 ) ( TRUCK-AT ?auto_265351 ?auto_265354 ) ( LIFTING ?auto_265355 ?auto_265349 ) )
    :subtasks
    ( ( !LOAD ?auto_265355 ?auto_265349 ?auto_265351 ?auto_265354 )
      ( MAKE-2CRATE ?auto_265356 ?auto_265349 ?auto_265350 )
      ( MAKE-1CRATE-VERIFY ?auto_265349 ?auto_265350 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_265358 - SURFACE
      ?auto_265359 - SURFACE
      ?auto_265360 - SURFACE
    )
    :vars
    (
      ?auto_265363 - HOIST
      ?auto_265366 - PLACE
      ?auto_265361 - PLACE
      ?auto_265362 - HOIST
      ?auto_265364 - SURFACE
      ?auto_265365 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265363 ?auto_265366 ) ( IS-CRATE ?auto_265360 ) ( not ( = ?auto_265359 ?auto_265360 ) ) ( not ( = ?auto_265358 ?auto_265359 ) ) ( not ( = ?auto_265358 ?auto_265360 ) ) ( not ( = ?auto_265361 ?auto_265366 ) ) ( HOIST-AT ?auto_265362 ?auto_265361 ) ( not ( = ?auto_265363 ?auto_265362 ) ) ( SURFACE-AT ?auto_265360 ?auto_265361 ) ( ON ?auto_265360 ?auto_265364 ) ( CLEAR ?auto_265360 ) ( not ( = ?auto_265359 ?auto_265364 ) ) ( not ( = ?auto_265360 ?auto_265364 ) ) ( not ( = ?auto_265358 ?auto_265364 ) ) ( SURFACE-AT ?auto_265358 ?auto_265366 ) ( CLEAR ?auto_265358 ) ( IS-CRATE ?auto_265359 ) ( AVAILABLE ?auto_265363 ) ( TRUCK-AT ?auto_265365 ?auto_265361 ) ( LIFTING ?auto_265362 ?auto_265359 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_265359 ?auto_265360 )
      ( MAKE-2CRATE-VERIFY ?auto_265358 ?auto_265359 ?auto_265360 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_265367 - SURFACE
      ?auto_265368 - SURFACE
      ?auto_265369 - SURFACE
      ?auto_265370 - SURFACE
    )
    :vars
    (
      ?auto_265375 - HOIST
      ?auto_265372 - PLACE
      ?auto_265373 - PLACE
      ?auto_265371 - HOIST
      ?auto_265376 - SURFACE
      ?auto_265374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265375 ?auto_265372 ) ( IS-CRATE ?auto_265370 ) ( not ( = ?auto_265369 ?auto_265370 ) ) ( not ( = ?auto_265368 ?auto_265369 ) ) ( not ( = ?auto_265368 ?auto_265370 ) ) ( not ( = ?auto_265373 ?auto_265372 ) ) ( HOIST-AT ?auto_265371 ?auto_265373 ) ( not ( = ?auto_265375 ?auto_265371 ) ) ( SURFACE-AT ?auto_265370 ?auto_265373 ) ( ON ?auto_265370 ?auto_265376 ) ( CLEAR ?auto_265370 ) ( not ( = ?auto_265369 ?auto_265376 ) ) ( not ( = ?auto_265370 ?auto_265376 ) ) ( not ( = ?auto_265368 ?auto_265376 ) ) ( SURFACE-AT ?auto_265368 ?auto_265372 ) ( CLEAR ?auto_265368 ) ( IS-CRATE ?auto_265369 ) ( AVAILABLE ?auto_265375 ) ( TRUCK-AT ?auto_265374 ?auto_265373 ) ( LIFTING ?auto_265371 ?auto_265369 ) ( ON ?auto_265368 ?auto_265367 ) ( not ( = ?auto_265367 ?auto_265368 ) ) ( not ( = ?auto_265367 ?auto_265369 ) ) ( not ( = ?auto_265367 ?auto_265370 ) ) ( not ( = ?auto_265367 ?auto_265376 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265368 ?auto_265369 ?auto_265370 )
      ( MAKE-3CRATE-VERIFY ?auto_265367 ?auto_265368 ?auto_265369 ?auto_265370 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265377 - SURFACE
      ?auto_265378 - SURFACE
      ?auto_265379 - SURFACE
      ?auto_265381 - SURFACE
      ?auto_265380 - SURFACE
    )
    :vars
    (
      ?auto_265386 - HOIST
      ?auto_265383 - PLACE
      ?auto_265384 - PLACE
      ?auto_265382 - HOIST
      ?auto_265387 - SURFACE
      ?auto_265385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265386 ?auto_265383 ) ( IS-CRATE ?auto_265380 ) ( not ( = ?auto_265381 ?auto_265380 ) ) ( not ( = ?auto_265379 ?auto_265381 ) ) ( not ( = ?auto_265379 ?auto_265380 ) ) ( not ( = ?auto_265384 ?auto_265383 ) ) ( HOIST-AT ?auto_265382 ?auto_265384 ) ( not ( = ?auto_265386 ?auto_265382 ) ) ( SURFACE-AT ?auto_265380 ?auto_265384 ) ( ON ?auto_265380 ?auto_265387 ) ( CLEAR ?auto_265380 ) ( not ( = ?auto_265381 ?auto_265387 ) ) ( not ( = ?auto_265380 ?auto_265387 ) ) ( not ( = ?auto_265379 ?auto_265387 ) ) ( SURFACE-AT ?auto_265379 ?auto_265383 ) ( CLEAR ?auto_265379 ) ( IS-CRATE ?auto_265381 ) ( AVAILABLE ?auto_265386 ) ( TRUCK-AT ?auto_265385 ?auto_265384 ) ( LIFTING ?auto_265382 ?auto_265381 ) ( ON ?auto_265378 ?auto_265377 ) ( ON ?auto_265379 ?auto_265378 ) ( not ( = ?auto_265377 ?auto_265378 ) ) ( not ( = ?auto_265377 ?auto_265379 ) ) ( not ( = ?auto_265377 ?auto_265381 ) ) ( not ( = ?auto_265377 ?auto_265380 ) ) ( not ( = ?auto_265377 ?auto_265387 ) ) ( not ( = ?auto_265378 ?auto_265379 ) ) ( not ( = ?auto_265378 ?auto_265381 ) ) ( not ( = ?auto_265378 ?auto_265380 ) ) ( not ( = ?auto_265378 ?auto_265387 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265379 ?auto_265381 ?auto_265380 )
      ( MAKE-4CRATE-VERIFY ?auto_265377 ?auto_265378 ?auto_265379 ?auto_265381 ?auto_265380 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_265388 - SURFACE
      ?auto_265389 - SURFACE
    )
    :vars
    (
      ?auto_265395 - HOIST
      ?auto_265392 - PLACE
      ?auto_265390 - SURFACE
      ?auto_265393 - PLACE
      ?auto_265391 - HOIST
      ?auto_265396 - SURFACE
      ?auto_265394 - TRUCK
      ?auto_265397 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265395 ?auto_265392 ) ( IS-CRATE ?auto_265389 ) ( not ( = ?auto_265388 ?auto_265389 ) ) ( not ( = ?auto_265390 ?auto_265388 ) ) ( not ( = ?auto_265390 ?auto_265389 ) ) ( not ( = ?auto_265393 ?auto_265392 ) ) ( HOIST-AT ?auto_265391 ?auto_265393 ) ( not ( = ?auto_265395 ?auto_265391 ) ) ( SURFACE-AT ?auto_265389 ?auto_265393 ) ( ON ?auto_265389 ?auto_265396 ) ( CLEAR ?auto_265389 ) ( not ( = ?auto_265388 ?auto_265396 ) ) ( not ( = ?auto_265389 ?auto_265396 ) ) ( not ( = ?auto_265390 ?auto_265396 ) ) ( SURFACE-AT ?auto_265390 ?auto_265392 ) ( CLEAR ?auto_265390 ) ( IS-CRATE ?auto_265388 ) ( AVAILABLE ?auto_265395 ) ( TRUCK-AT ?auto_265394 ?auto_265393 ) ( AVAILABLE ?auto_265391 ) ( SURFACE-AT ?auto_265388 ?auto_265393 ) ( ON ?auto_265388 ?auto_265397 ) ( CLEAR ?auto_265388 ) ( not ( = ?auto_265388 ?auto_265397 ) ) ( not ( = ?auto_265389 ?auto_265397 ) ) ( not ( = ?auto_265390 ?auto_265397 ) ) ( not ( = ?auto_265396 ?auto_265397 ) ) )
    :subtasks
    ( ( !LIFT ?auto_265391 ?auto_265388 ?auto_265397 ?auto_265393 )
      ( MAKE-2CRATE ?auto_265390 ?auto_265388 ?auto_265389 )
      ( MAKE-1CRATE-VERIFY ?auto_265388 ?auto_265389 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_265398 - SURFACE
      ?auto_265399 - SURFACE
      ?auto_265400 - SURFACE
    )
    :vars
    (
      ?auto_265407 - HOIST
      ?auto_265406 - PLACE
      ?auto_265401 - PLACE
      ?auto_265405 - HOIST
      ?auto_265404 - SURFACE
      ?auto_265403 - TRUCK
      ?auto_265402 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265407 ?auto_265406 ) ( IS-CRATE ?auto_265400 ) ( not ( = ?auto_265399 ?auto_265400 ) ) ( not ( = ?auto_265398 ?auto_265399 ) ) ( not ( = ?auto_265398 ?auto_265400 ) ) ( not ( = ?auto_265401 ?auto_265406 ) ) ( HOIST-AT ?auto_265405 ?auto_265401 ) ( not ( = ?auto_265407 ?auto_265405 ) ) ( SURFACE-AT ?auto_265400 ?auto_265401 ) ( ON ?auto_265400 ?auto_265404 ) ( CLEAR ?auto_265400 ) ( not ( = ?auto_265399 ?auto_265404 ) ) ( not ( = ?auto_265400 ?auto_265404 ) ) ( not ( = ?auto_265398 ?auto_265404 ) ) ( SURFACE-AT ?auto_265398 ?auto_265406 ) ( CLEAR ?auto_265398 ) ( IS-CRATE ?auto_265399 ) ( AVAILABLE ?auto_265407 ) ( TRUCK-AT ?auto_265403 ?auto_265401 ) ( AVAILABLE ?auto_265405 ) ( SURFACE-AT ?auto_265399 ?auto_265401 ) ( ON ?auto_265399 ?auto_265402 ) ( CLEAR ?auto_265399 ) ( not ( = ?auto_265399 ?auto_265402 ) ) ( not ( = ?auto_265400 ?auto_265402 ) ) ( not ( = ?auto_265398 ?auto_265402 ) ) ( not ( = ?auto_265404 ?auto_265402 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_265399 ?auto_265400 )
      ( MAKE-2CRATE-VERIFY ?auto_265398 ?auto_265399 ?auto_265400 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_265408 - SURFACE
      ?auto_265409 - SURFACE
      ?auto_265410 - SURFACE
      ?auto_265411 - SURFACE
    )
    :vars
    (
      ?auto_265415 - HOIST
      ?auto_265412 - PLACE
      ?auto_265418 - PLACE
      ?auto_265413 - HOIST
      ?auto_265414 - SURFACE
      ?auto_265416 - TRUCK
      ?auto_265417 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265415 ?auto_265412 ) ( IS-CRATE ?auto_265411 ) ( not ( = ?auto_265410 ?auto_265411 ) ) ( not ( = ?auto_265409 ?auto_265410 ) ) ( not ( = ?auto_265409 ?auto_265411 ) ) ( not ( = ?auto_265418 ?auto_265412 ) ) ( HOIST-AT ?auto_265413 ?auto_265418 ) ( not ( = ?auto_265415 ?auto_265413 ) ) ( SURFACE-AT ?auto_265411 ?auto_265418 ) ( ON ?auto_265411 ?auto_265414 ) ( CLEAR ?auto_265411 ) ( not ( = ?auto_265410 ?auto_265414 ) ) ( not ( = ?auto_265411 ?auto_265414 ) ) ( not ( = ?auto_265409 ?auto_265414 ) ) ( SURFACE-AT ?auto_265409 ?auto_265412 ) ( CLEAR ?auto_265409 ) ( IS-CRATE ?auto_265410 ) ( AVAILABLE ?auto_265415 ) ( TRUCK-AT ?auto_265416 ?auto_265418 ) ( AVAILABLE ?auto_265413 ) ( SURFACE-AT ?auto_265410 ?auto_265418 ) ( ON ?auto_265410 ?auto_265417 ) ( CLEAR ?auto_265410 ) ( not ( = ?auto_265410 ?auto_265417 ) ) ( not ( = ?auto_265411 ?auto_265417 ) ) ( not ( = ?auto_265409 ?auto_265417 ) ) ( not ( = ?auto_265414 ?auto_265417 ) ) ( ON ?auto_265409 ?auto_265408 ) ( not ( = ?auto_265408 ?auto_265409 ) ) ( not ( = ?auto_265408 ?auto_265410 ) ) ( not ( = ?auto_265408 ?auto_265411 ) ) ( not ( = ?auto_265408 ?auto_265414 ) ) ( not ( = ?auto_265408 ?auto_265417 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265409 ?auto_265410 ?auto_265411 )
      ( MAKE-3CRATE-VERIFY ?auto_265408 ?auto_265409 ?auto_265410 ?auto_265411 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265419 - SURFACE
      ?auto_265420 - SURFACE
      ?auto_265421 - SURFACE
      ?auto_265423 - SURFACE
      ?auto_265422 - SURFACE
    )
    :vars
    (
      ?auto_265427 - HOIST
      ?auto_265424 - PLACE
      ?auto_265430 - PLACE
      ?auto_265425 - HOIST
      ?auto_265426 - SURFACE
      ?auto_265428 - TRUCK
      ?auto_265429 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265427 ?auto_265424 ) ( IS-CRATE ?auto_265422 ) ( not ( = ?auto_265423 ?auto_265422 ) ) ( not ( = ?auto_265421 ?auto_265423 ) ) ( not ( = ?auto_265421 ?auto_265422 ) ) ( not ( = ?auto_265430 ?auto_265424 ) ) ( HOIST-AT ?auto_265425 ?auto_265430 ) ( not ( = ?auto_265427 ?auto_265425 ) ) ( SURFACE-AT ?auto_265422 ?auto_265430 ) ( ON ?auto_265422 ?auto_265426 ) ( CLEAR ?auto_265422 ) ( not ( = ?auto_265423 ?auto_265426 ) ) ( not ( = ?auto_265422 ?auto_265426 ) ) ( not ( = ?auto_265421 ?auto_265426 ) ) ( SURFACE-AT ?auto_265421 ?auto_265424 ) ( CLEAR ?auto_265421 ) ( IS-CRATE ?auto_265423 ) ( AVAILABLE ?auto_265427 ) ( TRUCK-AT ?auto_265428 ?auto_265430 ) ( AVAILABLE ?auto_265425 ) ( SURFACE-AT ?auto_265423 ?auto_265430 ) ( ON ?auto_265423 ?auto_265429 ) ( CLEAR ?auto_265423 ) ( not ( = ?auto_265423 ?auto_265429 ) ) ( not ( = ?auto_265422 ?auto_265429 ) ) ( not ( = ?auto_265421 ?auto_265429 ) ) ( not ( = ?auto_265426 ?auto_265429 ) ) ( ON ?auto_265420 ?auto_265419 ) ( ON ?auto_265421 ?auto_265420 ) ( not ( = ?auto_265419 ?auto_265420 ) ) ( not ( = ?auto_265419 ?auto_265421 ) ) ( not ( = ?auto_265419 ?auto_265423 ) ) ( not ( = ?auto_265419 ?auto_265422 ) ) ( not ( = ?auto_265419 ?auto_265426 ) ) ( not ( = ?auto_265419 ?auto_265429 ) ) ( not ( = ?auto_265420 ?auto_265421 ) ) ( not ( = ?auto_265420 ?auto_265423 ) ) ( not ( = ?auto_265420 ?auto_265422 ) ) ( not ( = ?auto_265420 ?auto_265426 ) ) ( not ( = ?auto_265420 ?auto_265429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265421 ?auto_265423 ?auto_265422 )
      ( MAKE-4CRATE-VERIFY ?auto_265419 ?auto_265420 ?auto_265421 ?auto_265423 ?auto_265422 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_265431 - SURFACE
      ?auto_265432 - SURFACE
    )
    :vars
    (
      ?auto_265436 - HOIST
      ?auto_265433 - PLACE
      ?auto_265439 - SURFACE
      ?auto_265440 - PLACE
      ?auto_265434 - HOIST
      ?auto_265435 - SURFACE
      ?auto_265438 - SURFACE
      ?auto_265437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265436 ?auto_265433 ) ( IS-CRATE ?auto_265432 ) ( not ( = ?auto_265431 ?auto_265432 ) ) ( not ( = ?auto_265439 ?auto_265431 ) ) ( not ( = ?auto_265439 ?auto_265432 ) ) ( not ( = ?auto_265440 ?auto_265433 ) ) ( HOIST-AT ?auto_265434 ?auto_265440 ) ( not ( = ?auto_265436 ?auto_265434 ) ) ( SURFACE-AT ?auto_265432 ?auto_265440 ) ( ON ?auto_265432 ?auto_265435 ) ( CLEAR ?auto_265432 ) ( not ( = ?auto_265431 ?auto_265435 ) ) ( not ( = ?auto_265432 ?auto_265435 ) ) ( not ( = ?auto_265439 ?auto_265435 ) ) ( SURFACE-AT ?auto_265439 ?auto_265433 ) ( CLEAR ?auto_265439 ) ( IS-CRATE ?auto_265431 ) ( AVAILABLE ?auto_265436 ) ( AVAILABLE ?auto_265434 ) ( SURFACE-AT ?auto_265431 ?auto_265440 ) ( ON ?auto_265431 ?auto_265438 ) ( CLEAR ?auto_265431 ) ( not ( = ?auto_265431 ?auto_265438 ) ) ( not ( = ?auto_265432 ?auto_265438 ) ) ( not ( = ?auto_265439 ?auto_265438 ) ) ( not ( = ?auto_265435 ?auto_265438 ) ) ( TRUCK-AT ?auto_265437 ?auto_265433 ) )
    :subtasks
    ( ( !DRIVE ?auto_265437 ?auto_265433 ?auto_265440 )
      ( MAKE-2CRATE ?auto_265439 ?auto_265431 ?auto_265432 )
      ( MAKE-1CRATE-VERIFY ?auto_265431 ?auto_265432 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_265441 - SURFACE
      ?auto_265442 - SURFACE
      ?auto_265443 - SURFACE
    )
    :vars
    (
      ?auto_265448 - HOIST
      ?auto_265446 - PLACE
      ?auto_265447 - PLACE
      ?auto_265445 - HOIST
      ?auto_265444 - SURFACE
      ?auto_265449 - SURFACE
      ?auto_265450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265448 ?auto_265446 ) ( IS-CRATE ?auto_265443 ) ( not ( = ?auto_265442 ?auto_265443 ) ) ( not ( = ?auto_265441 ?auto_265442 ) ) ( not ( = ?auto_265441 ?auto_265443 ) ) ( not ( = ?auto_265447 ?auto_265446 ) ) ( HOIST-AT ?auto_265445 ?auto_265447 ) ( not ( = ?auto_265448 ?auto_265445 ) ) ( SURFACE-AT ?auto_265443 ?auto_265447 ) ( ON ?auto_265443 ?auto_265444 ) ( CLEAR ?auto_265443 ) ( not ( = ?auto_265442 ?auto_265444 ) ) ( not ( = ?auto_265443 ?auto_265444 ) ) ( not ( = ?auto_265441 ?auto_265444 ) ) ( SURFACE-AT ?auto_265441 ?auto_265446 ) ( CLEAR ?auto_265441 ) ( IS-CRATE ?auto_265442 ) ( AVAILABLE ?auto_265448 ) ( AVAILABLE ?auto_265445 ) ( SURFACE-AT ?auto_265442 ?auto_265447 ) ( ON ?auto_265442 ?auto_265449 ) ( CLEAR ?auto_265442 ) ( not ( = ?auto_265442 ?auto_265449 ) ) ( not ( = ?auto_265443 ?auto_265449 ) ) ( not ( = ?auto_265441 ?auto_265449 ) ) ( not ( = ?auto_265444 ?auto_265449 ) ) ( TRUCK-AT ?auto_265450 ?auto_265446 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_265442 ?auto_265443 )
      ( MAKE-2CRATE-VERIFY ?auto_265441 ?auto_265442 ?auto_265443 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_265451 - SURFACE
      ?auto_265452 - SURFACE
      ?auto_265453 - SURFACE
      ?auto_265454 - SURFACE
    )
    :vars
    (
      ?auto_265455 - HOIST
      ?auto_265457 - PLACE
      ?auto_265458 - PLACE
      ?auto_265456 - HOIST
      ?auto_265460 - SURFACE
      ?auto_265461 - SURFACE
      ?auto_265459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265455 ?auto_265457 ) ( IS-CRATE ?auto_265454 ) ( not ( = ?auto_265453 ?auto_265454 ) ) ( not ( = ?auto_265452 ?auto_265453 ) ) ( not ( = ?auto_265452 ?auto_265454 ) ) ( not ( = ?auto_265458 ?auto_265457 ) ) ( HOIST-AT ?auto_265456 ?auto_265458 ) ( not ( = ?auto_265455 ?auto_265456 ) ) ( SURFACE-AT ?auto_265454 ?auto_265458 ) ( ON ?auto_265454 ?auto_265460 ) ( CLEAR ?auto_265454 ) ( not ( = ?auto_265453 ?auto_265460 ) ) ( not ( = ?auto_265454 ?auto_265460 ) ) ( not ( = ?auto_265452 ?auto_265460 ) ) ( SURFACE-AT ?auto_265452 ?auto_265457 ) ( CLEAR ?auto_265452 ) ( IS-CRATE ?auto_265453 ) ( AVAILABLE ?auto_265455 ) ( AVAILABLE ?auto_265456 ) ( SURFACE-AT ?auto_265453 ?auto_265458 ) ( ON ?auto_265453 ?auto_265461 ) ( CLEAR ?auto_265453 ) ( not ( = ?auto_265453 ?auto_265461 ) ) ( not ( = ?auto_265454 ?auto_265461 ) ) ( not ( = ?auto_265452 ?auto_265461 ) ) ( not ( = ?auto_265460 ?auto_265461 ) ) ( TRUCK-AT ?auto_265459 ?auto_265457 ) ( ON ?auto_265452 ?auto_265451 ) ( not ( = ?auto_265451 ?auto_265452 ) ) ( not ( = ?auto_265451 ?auto_265453 ) ) ( not ( = ?auto_265451 ?auto_265454 ) ) ( not ( = ?auto_265451 ?auto_265460 ) ) ( not ( = ?auto_265451 ?auto_265461 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265452 ?auto_265453 ?auto_265454 )
      ( MAKE-3CRATE-VERIFY ?auto_265451 ?auto_265452 ?auto_265453 ?auto_265454 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265462 - SURFACE
      ?auto_265463 - SURFACE
      ?auto_265464 - SURFACE
      ?auto_265466 - SURFACE
      ?auto_265465 - SURFACE
    )
    :vars
    (
      ?auto_265467 - HOIST
      ?auto_265469 - PLACE
      ?auto_265470 - PLACE
      ?auto_265468 - HOIST
      ?auto_265472 - SURFACE
      ?auto_265473 - SURFACE
      ?auto_265471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265467 ?auto_265469 ) ( IS-CRATE ?auto_265465 ) ( not ( = ?auto_265466 ?auto_265465 ) ) ( not ( = ?auto_265464 ?auto_265466 ) ) ( not ( = ?auto_265464 ?auto_265465 ) ) ( not ( = ?auto_265470 ?auto_265469 ) ) ( HOIST-AT ?auto_265468 ?auto_265470 ) ( not ( = ?auto_265467 ?auto_265468 ) ) ( SURFACE-AT ?auto_265465 ?auto_265470 ) ( ON ?auto_265465 ?auto_265472 ) ( CLEAR ?auto_265465 ) ( not ( = ?auto_265466 ?auto_265472 ) ) ( not ( = ?auto_265465 ?auto_265472 ) ) ( not ( = ?auto_265464 ?auto_265472 ) ) ( SURFACE-AT ?auto_265464 ?auto_265469 ) ( CLEAR ?auto_265464 ) ( IS-CRATE ?auto_265466 ) ( AVAILABLE ?auto_265467 ) ( AVAILABLE ?auto_265468 ) ( SURFACE-AT ?auto_265466 ?auto_265470 ) ( ON ?auto_265466 ?auto_265473 ) ( CLEAR ?auto_265466 ) ( not ( = ?auto_265466 ?auto_265473 ) ) ( not ( = ?auto_265465 ?auto_265473 ) ) ( not ( = ?auto_265464 ?auto_265473 ) ) ( not ( = ?auto_265472 ?auto_265473 ) ) ( TRUCK-AT ?auto_265471 ?auto_265469 ) ( ON ?auto_265463 ?auto_265462 ) ( ON ?auto_265464 ?auto_265463 ) ( not ( = ?auto_265462 ?auto_265463 ) ) ( not ( = ?auto_265462 ?auto_265464 ) ) ( not ( = ?auto_265462 ?auto_265466 ) ) ( not ( = ?auto_265462 ?auto_265465 ) ) ( not ( = ?auto_265462 ?auto_265472 ) ) ( not ( = ?auto_265462 ?auto_265473 ) ) ( not ( = ?auto_265463 ?auto_265464 ) ) ( not ( = ?auto_265463 ?auto_265466 ) ) ( not ( = ?auto_265463 ?auto_265465 ) ) ( not ( = ?auto_265463 ?auto_265472 ) ) ( not ( = ?auto_265463 ?auto_265473 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265464 ?auto_265466 ?auto_265465 )
      ( MAKE-4CRATE-VERIFY ?auto_265462 ?auto_265463 ?auto_265464 ?auto_265466 ?auto_265465 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_265474 - SURFACE
      ?auto_265475 - SURFACE
    )
    :vars
    (
      ?auto_265476 - HOIST
      ?auto_265478 - PLACE
      ?auto_265480 - SURFACE
      ?auto_265479 - PLACE
      ?auto_265477 - HOIST
      ?auto_265482 - SURFACE
      ?auto_265483 - SURFACE
      ?auto_265481 - TRUCK
      ?auto_265484 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265476 ?auto_265478 ) ( IS-CRATE ?auto_265475 ) ( not ( = ?auto_265474 ?auto_265475 ) ) ( not ( = ?auto_265480 ?auto_265474 ) ) ( not ( = ?auto_265480 ?auto_265475 ) ) ( not ( = ?auto_265479 ?auto_265478 ) ) ( HOIST-AT ?auto_265477 ?auto_265479 ) ( not ( = ?auto_265476 ?auto_265477 ) ) ( SURFACE-AT ?auto_265475 ?auto_265479 ) ( ON ?auto_265475 ?auto_265482 ) ( CLEAR ?auto_265475 ) ( not ( = ?auto_265474 ?auto_265482 ) ) ( not ( = ?auto_265475 ?auto_265482 ) ) ( not ( = ?auto_265480 ?auto_265482 ) ) ( IS-CRATE ?auto_265474 ) ( AVAILABLE ?auto_265477 ) ( SURFACE-AT ?auto_265474 ?auto_265479 ) ( ON ?auto_265474 ?auto_265483 ) ( CLEAR ?auto_265474 ) ( not ( = ?auto_265474 ?auto_265483 ) ) ( not ( = ?auto_265475 ?auto_265483 ) ) ( not ( = ?auto_265480 ?auto_265483 ) ) ( not ( = ?auto_265482 ?auto_265483 ) ) ( TRUCK-AT ?auto_265481 ?auto_265478 ) ( SURFACE-AT ?auto_265484 ?auto_265478 ) ( CLEAR ?auto_265484 ) ( LIFTING ?auto_265476 ?auto_265480 ) ( IS-CRATE ?auto_265480 ) ( not ( = ?auto_265484 ?auto_265480 ) ) ( not ( = ?auto_265474 ?auto_265484 ) ) ( not ( = ?auto_265475 ?auto_265484 ) ) ( not ( = ?auto_265482 ?auto_265484 ) ) ( not ( = ?auto_265483 ?auto_265484 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_265484 ?auto_265480 )
      ( MAKE-2CRATE ?auto_265480 ?auto_265474 ?auto_265475 )
      ( MAKE-1CRATE-VERIFY ?auto_265474 ?auto_265475 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_265485 - SURFACE
      ?auto_265486 - SURFACE
      ?auto_265487 - SURFACE
    )
    :vars
    (
      ?auto_265488 - HOIST
      ?auto_265493 - PLACE
      ?auto_265489 - PLACE
      ?auto_265490 - HOIST
      ?auto_265494 - SURFACE
      ?auto_265492 - SURFACE
      ?auto_265491 - TRUCK
      ?auto_265495 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265488 ?auto_265493 ) ( IS-CRATE ?auto_265487 ) ( not ( = ?auto_265486 ?auto_265487 ) ) ( not ( = ?auto_265485 ?auto_265486 ) ) ( not ( = ?auto_265485 ?auto_265487 ) ) ( not ( = ?auto_265489 ?auto_265493 ) ) ( HOIST-AT ?auto_265490 ?auto_265489 ) ( not ( = ?auto_265488 ?auto_265490 ) ) ( SURFACE-AT ?auto_265487 ?auto_265489 ) ( ON ?auto_265487 ?auto_265494 ) ( CLEAR ?auto_265487 ) ( not ( = ?auto_265486 ?auto_265494 ) ) ( not ( = ?auto_265487 ?auto_265494 ) ) ( not ( = ?auto_265485 ?auto_265494 ) ) ( IS-CRATE ?auto_265486 ) ( AVAILABLE ?auto_265490 ) ( SURFACE-AT ?auto_265486 ?auto_265489 ) ( ON ?auto_265486 ?auto_265492 ) ( CLEAR ?auto_265486 ) ( not ( = ?auto_265486 ?auto_265492 ) ) ( not ( = ?auto_265487 ?auto_265492 ) ) ( not ( = ?auto_265485 ?auto_265492 ) ) ( not ( = ?auto_265494 ?auto_265492 ) ) ( TRUCK-AT ?auto_265491 ?auto_265493 ) ( SURFACE-AT ?auto_265495 ?auto_265493 ) ( CLEAR ?auto_265495 ) ( LIFTING ?auto_265488 ?auto_265485 ) ( IS-CRATE ?auto_265485 ) ( not ( = ?auto_265495 ?auto_265485 ) ) ( not ( = ?auto_265486 ?auto_265495 ) ) ( not ( = ?auto_265487 ?auto_265495 ) ) ( not ( = ?auto_265494 ?auto_265495 ) ) ( not ( = ?auto_265492 ?auto_265495 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_265486 ?auto_265487 )
      ( MAKE-2CRATE-VERIFY ?auto_265485 ?auto_265486 ?auto_265487 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_265496 - SURFACE
      ?auto_265497 - SURFACE
      ?auto_265498 - SURFACE
      ?auto_265499 - SURFACE
    )
    :vars
    (
      ?auto_265505 - HOIST
      ?auto_265504 - PLACE
      ?auto_265506 - PLACE
      ?auto_265503 - HOIST
      ?auto_265500 - SURFACE
      ?auto_265501 - SURFACE
      ?auto_265502 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265505 ?auto_265504 ) ( IS-CRATE ?auto_265499 ) ( not ( = ?auto_265498 ?auto_265499 ) ) ( not ( = ?auto_265497 ?auto_265498 ) ) ( not ( = ?auto_265497 ?auto_265499 ) ) ( not ( = ?auto_265506 ?auto_265504 ) ) ( HOIST-AT ?auto_265503 ?auto_265506 ) ( not ( = ?auto_265505 ?auto_265503 ) ) ( SURFACE-AT ?auto_265499 ?auto_265506 ) ( ON ?auto_265499 ?auto_265500 ) ( CLEAR ?auto_265499 ) ( not ( = ?auto_265498 ?auto_265500 ) ) ( not ( = ?auto_265499 ?auto_265500 ) ) ( not ( = ?auto_265497 ?auto_265500 ) ) ( IS-CRATE ?auto_265498 ) ( AVAILABLE ?auto_265503 ) ( SURFACE-AT ?auto_265498 ?auto_265506 ) ( ON ?auto_265498 ?auto_265501 ) ( CLEAR ?auto_265498 ) ( not ( = ?auto_265498 ?auto_265501 ) ) ( not ( = ?auto_265499 ?auto_265501 ) ) ( not ( = ?auto_265497 ?auto_265501 ) ) ( not ( = ?auto_265500 ?auto_265501 ) ) ( TRUCK-AT ?auto_265502 ?auto_265504 ) ( SURFACE-AT ?auto_265496 ?auto_265504 ) ( CLEAR ?auto_265496 ) ( LIFTING ?auto_265505 ?auto_265497 ) ( IS-CRATE ?auto_265497 ) ( not ( = ?auto_265496 ?auto_265497 ) ) ( not ( = ?auto_265498 ?auto_265496 ) ) ( not ( = ?auto_265499 ?auto_265496 ) ) ( not ( = ?auto_265500 ?auto_265496 ) ) ( not ( = ?auto_265501 ?auto_265496 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265497 ?auto_265498 ?auto_265499 )
      ( MAKE-3CRATE-VERIFY ?auto_265496 ?auto_265497 ?auto_265498 ?auto_265499 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265507 - SURFACE
      ?auto_265508 - SURFACE
      ?auto_265509 - SURFACE
      ?auto_265511 - SURFACE
      ?auto_265510 - SURFACE
    )
    :vars
    (
      ?auto_265517 - HOIST
      ?auto_265516 - PLACE
      ?auto_265518 - PLACE
      ?auto_265515 - HOIST
      ?auto_265512 - SURFACE
      ?auto_265513 - SURFACE
      ?auto_265514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265517 ?auto_265516 ) ( IS-CRATE ?auto_265510 ) ( not ( = ?auto_265511 ?auto_265510 ) ) ( not ( = ?auto_265509 ?auto_265511 ) ) ( not ( = ?auto_265509 ?auto_265510 ) ) ( not ( = ?auto_265518 ?auto_265516 ) ) ( HOIST-AT ?auto_265515 ?auto_265518 ) ( not ( = ?auto_265517 ?auto_265515 ) ) ( SURFACE-AT ?auto_265510 ?auto_265518 ) ( ON ?auto_265510 ?auto_265512 ) ( CLEAR ?auto_265510 ) ( not ( = ?auto_265511 ?auto_265512 ) ) ( not ( = ?auto_265510 ?auto_265512 ) ) ( not ( = ?auto_265509 ?auto_265512 ) ) ( IS-CRATE ?auto_265511 ) ( AVAILABLE ?auto_265515 ) ( SURFACE-AT ?auto_265511 ?auto_265518 ) ( ON ?auto_265511 ?auto_265513 ) ( CLEAR ?auto_265511 ) ( not ( = ?auto_265511 ?auto_265513 ) ) ( not ( = ?auto_265510 ?auto_265513 ) ) ( not ( = ?auto_265509 ?auto_265513 ) ) ( not ( = ?auto_265512 ?auto_265513 ) ) ( TRUCK-AT ?auto_265514 ?auto_265516 ) ( SURFACE-AT ?auto_265508 ?auto_265516 ) ( CLEAR ?auto_265508 ) ( LIFTING ?auto_265517 ?auto_265509 ) ( IS-CRATE ?auto_265509 ) ( not ( = ?auto_265508 ?auto_265509 ) ) ( not ( = ?auto_265511 ?auto_265508 ) ) ( not ( = ?auto_265510 ?auto_265508 ) ) ( not ( = ?auto_265512 ?auto_265508 ) ) ( not ( = ?auto_265513 ?auto_265508 ) ) ( ON ?auto_265508 ?auto_265507 ) ( not ( = ?auto_265507 ?auto_265508 ) ) ( not ( = ?auto_265507 ?auto_265509 ) ) ( not ( = ?auto_265507 ?auto_265511 ) ) ( not ( = ?auto_265507 ?auto_265510 ) ) ( not ( = ?auto_265507 ?auto_265512 ) ) ( not ( = ?auto_265507 ?auto_265513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265509 ?auto_265511 ?auto_265510 )
      ( MAKE-4CRATE-VERIFY ?auto_265507 ?auto_265508 ?auto_265509 ?auto_265511 ?auto_265510 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_265954 - SURFACE
      ?auto_265955 - SURFACE
      ?auto_265956 - SURFACE
      ?auto_265958 - SURFACE
      ?auto_265957 - SURFACE
      ?auto_265959 - SURFACE
    )
    :vars
    (
      ?auto_265960 - HOIST
      ?auto_265961 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265960 ?auto_265961 ) ( SURFACE-AT ?auto_265957 ?auto_265961 ) ( CLEAR ?auto_265957 ) ( LIFTING ?auto_265960 ?auto_265959 ) ( IS-CRATE ?auto_265959 ) ( not ( = ?auto_265957 ?auto_265959 ) ) ( ON ?auto_265955 ?auto_265954 ) ( ON ?auto_265956 ?auto_265955 ) ( ON ?auto_265958 ?auto_265956 ) ( ON ?auto_265957 ?auto_265958 ) ( not ( = ?auto_265954 ?auto_265955 ) ) ( not ( = ?auto_265954 ?auto_265956 ) ) ( not ( = ?auto_265954 ?auto_265958 ) ) ( not ( = ?auto_265954 ?auto_265957 ) ) ( not ( = ?auto_265954 ?auto_265959 ) ) ( not ( = ?auto_265955 ?auto_265956 ) ) ( not ( = ?auto_265955 ?auto_265958 ) ) ( not ( = ?auto_265955 ?auto_265957 ) ) ( not ( = ?auto_265955 ?auto_265959 ) ) ( not ( = ?auto_265956 ?auto_265958 ) ) ( not ( = ?auto_265956 ?auto_265957 ) ) ( not ( = ?auto_265956 ?auto_265959 ) ) ( not ( = ?auto_265958 ?auto_265957 ) ) ( not ( = ?auto_265958 ?auto_265959 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_265957 ?auto_265959 )
      ( MAKE-5CRATE-VERIFY ?auto_265954 ?auto_265955 ?auto_265956 ?auto_265958 ?auto_265957 ?auto_265959 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_265988 - SURFACE
      ?auto_265989 - SURFACE
      ?auto_265990 - SURFACE
      ?auto_265992 - SURFACE
      ?auto_265991 - SURFACE
      ?auto_265993 - SURFACE
    )
    :vars
    (
      ?auto_265995 - HOIST
      ?auto_265996 - PLACE
      ?auto_265994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265995 ?auto_265996 ) ( SURFACE-AT ?auto_265991 ?auto_265996 ) ( CLEAR ?auto_265991 ) ( IS-CRATE ?auto_265993 ) ( not ( = ?auto_265991 ?auto_265993 ) ) ( TRUCK-AT ?auto_265994 ?auto_265996 ) ( AVAILABLE ?auto_265995 ) ( IN ?auto_265993 ?auto_265994 ) ( ON ?auto_265991 ?auto_265992 ) ( not ( = ?auto_265992 ?auto_265991 ) ) ( not ( = ?auto_265992 ?auto_265993 ) ) ( ON ?auto_265989 ?auto_265988 ) ( ON ?auto_265990 ?auto_265989 ) ( ON ?auto_265992 ?auto_265990 ) ( not ( = ?auto_265988 ?auto_265989 ) ) ( not ( = ?auto_265988 ?auto_265990 ) ) ( not ( = ?auto_265988 ?auto_265992 ) ) ( not ( = ?auto_265988 ?auto_265991 ) ) ( not ( = ?auto_265988 ?auto_265993 ) ) ( not ( = ?auto_265989 ?auto_265990 ) ) ( not ( = ?auto_265989 ?auto_265992 ) ) ( not ( = ?auto_265989 ?auto_265991 ) ) ( not ( = ?auto_265989 ?auto_265993 ) ) ( not ( = ?auto_265990 ?auto_265992 ) ) ( not ( = ?auto_265990 ?auto_265991 ) ) ( not ( = ?auto_265990 ?auto_265993 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265992 ?auto_265991 ?auto_265993 )
      ( MAKE-5CRATE-VERIFY ?auto_265988 ?auto_265989 ?auto_265990 ?auto_265992 ?auto_265991 ?auto_265993 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266028 - SURFACE
      ?auto_266029 - SURFACE
      ?auto_266030 - SURFACE
      ?auto_266032 - SURFACE
      ?auto_266031 - SURFACE
      ?auto_266033 - SURFACE
    )
    :vars
    (
      ?auto_266037 - HOIST
      ?auto_266034 - PLACE
      ?auto_266036 - TRUCK
      ?auto_266035 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_266037 ?auto_266034 ) ( SURFACE-AT ?auto_266031 ?auto_266034 ) ( CLEAR ?auto_266031 ) ( IS-CRATE ?auto_266033 ) ( not ( = ?auto_266031 ?auto_266033 ) ) ( AVAILABLE ?auto_266037 ) ( IN ?auto_266033 ?auto_266036 ) ( ON ?auto_266031 ?auto_266032 ) ( not ( = ?auto_266032 ?auto_266031 ) ) ( not ( = ?auto_266032 ?auto_266033 ) ) ( TRUCK-AT ?auto_266036 ?auto_266035 ) ( not ( = ?auto_266035 ?auto_266034 ) ) ( ON ?auto_266029 ?auto_266028 ) ( ON ?auto_266030 ?auto_266029 ) ( ON ?auto_266032 ?auto_266030 ) ( not ( = ?auto_266028 ?auto_266029 ) ) ( not ( = ?auto_266028 ?auto_266030 ) ) ( not ( = ?auto_266028 ?auto_266032 ) ) ( not ( = ?auto_266028 ?auto_266031 ) ) ( not ( = ?auto_266028 ?auto_266033 ) ) ( not ( = ?auto_266029 ?auto_266030 ) ) ( not ( = ?auto_266029 ?auto_266032 ) ) ( not ( = ?auto_266029 ?auto_266031 ) ) ( not ( = ?auto_266029 ?auto_266033 ) ) ( not ( = ?auto_266030 ?auto_266032 ) ) ( not ( = ?auto_266030 ?auto_266031 ) ) ( not ( = ?auto_266030 ?auto_266033 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_266032 ?auto_266031 ?auto_266033 )
      ( MAKE-5CRATE-VERIFY ?auto_266028 ?auto_266029 ?auto_266030 ?auto_266032 ?auto_266031 ?auto_266033 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266073 - SURFACE
      ?auto_266074 - SURFACE
      ?auto_266075 - SURFACE
      ?auto_266077 - SURFACE
      ?auto_266076 - SURFACE
      ?auto_266078 - SURFACE
    )
    :vars
    (
      ?auto_266080 - HOIST
      ?auto_266081 - PLACE
      ?auto_266082 - TRUCK
      ?auto_266079 - PLACE
      ?auto_266083 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_266080 ?auto_266081 ) ( SURFACE-AT ?auto_266076 ?auto_266081 ) ( CLEAR ?auto_266076 ) ( IS-CRATE ?auto_266078 ) ( not ( = ?auto_266076 ?auto_266078 ) ) ( AVAILABLE ?auto_266080 ) ( ON ?auto_266076 ?auto_266077 ) ( not ( = ?auto_266077 ?auto_266076 ) ) ( not ( = ?auto_266077 ?auto_266078 ) ) ( TRUCK-AT ?auto_266082 ?auto_266079 ) ( not ( = ?auto_266079 ?auto_266081 ) ) ( HOIST-AT ?auto_266083 ?auto_266079 ) ( LIFTING ?auto_266083 ?auto_266078 ) ( not ( = ?auto_266080 ?auto_266083 ) ) ( ON ?auto_266074 ?auto_266073 ) ( ON ?auto_266075 ?auto_266074 ) ( ON ?auto_266077 ?auto_266075 ) ( not ( = ?auto_266073 ?auto_266074 ) ) ( not ( = ?auto_266073 ?auto_266075 ) ) ( not ( = ?auto_266073 ?auto_266077 ) ) ( not ( = ?auto_266073 ?auto_266076 ) ) ( not ( = ?auto_266073 ?auto_266078 ) ) ( not ( = ?auto_266074 ?auto_266075 ) ) ( not ( = ?auto_266074 ?auto_266077 ) ) ( not ( = ?auto_266074 ?auto_266076 ) ) ( not ( = ?auto_266074 ?auto_266078 ) ) ( not ( = ?auto_266075 ?auto_266077 ) ) ( not ( = ?auto_266075 ?auto_266076 ) ) ( not ( = ?auto_266075 ?auto_266078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_266077 ?auto_266076 ?auto_266078 )
      ( MAKE-5CRATE-VERIFY ?auto_266073 ?auto_266074 ?auto_266075 ?auto_266077 ?auto_266076 ?auto_266078 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266123 - SURFACE
      ?auto_266124 - SURFACE
      ?auto_266125 - SURFACE
      ?auto_266127 - SURFACE
      ?auto_266126 - SURFACE
      ?auto_266128 - SURFACE
    )
    :vars
    (
      ?auto_266132 - HOIST
      ?auto_266129 - PLACE
      ?auto_266134 - TRUCK
      ?auto_266131 - PLACE
      ?auto_266133 - HOIST
      ?auto_266130 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_266132 ?auto_266129 ) ( SURFACE-AT ?auto_266126 ?auto_266129 ) ( CLEAR ?auto_266126 ) ( IS-CRATE ?auto_266128 ) ( not ( = ?auto_266126 ?auto_266128 ) ) ( AVAILABLE ?auto_266132 ) ( ON ?auto_266126 ?auto_266127 ) ( not ( = ?auto_266127 ?auto_266126 ) ) ( not ( = ?auto_266127 ?auto_266128 ) ) ( TRUCK-AT ?auto_266134 ?auto_266131 ) ( not ( = ?auto_266131 ?auto_266129 ) ) ( HOIST-AT ?auto_266133 ?auto_266131 ) ( not ( = ?auto_266132 ?auto_266133 ) ) ( AVAILABLE ?auto_266133 ) ( SURFACE-AT ?auto_266128 ?auto_266131 ) ( ON ?auto_266128 ?auto_266130 ) ( CLEAR ?auto_266128 ) ( not ( = ?auto_266126 ?auto_266130 ) ) ( not ( = ?auto_266128 ?auto_266130 ) ) ( not ( = ?auto_266127 ?auto_266130 ) ) ( ON ?auto_266124 ?auto_266123 ) ( ON ?auto_266125 ?auto_266124 ) ( ON ?auto_266127 ?auto_266125 ) ( not ( = ?auto_266123 ?auto_266124 ) ) ( not ( = ?auto_266123 ?auto_266125 ) ) ( not ( = ?auto_266123 ?auto_266127 ) ) ( not ( = ?auto_266123 ?auto_266126 ) ) ( not ( = ?auto_266123 ?auto_266128 ) ) ( not ( = ?auto_266123 ?auto_266130 ) ) ( not ( = ?auto_266124 ?auto_266125 ) ) ( not ( = ?auto_266124 ?auto_266127 ) ) ( not ( = ?auto_266124 ?auto_266126 ) ) ( not ( = ?auto_266124 ?auto_266128 ) ) ( not ( = ?auto_266124 ?auto_266130 ) ) ( not ( = ?auto_266125 ?auto_266127 ) ) ( not ( = ?auto_266125 ?auto_266126 ) ) ( not ( = ?auto_266125 ?auto_266128 ) ) ( not ( = ?auto_266125 ?auto_266130 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_266127 ?auto_266126 ?auto_266128 )
      ( MAKE-5CRATE-VERIFY ?auto_266123 ?auto_266124 ?auto_266125 ?auto_266127 ?auto_266126 ?auto_266128 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266174 - SURFACE
      ?auto_266175 - SURFACE
      ?auto_266176 - SURFACE
      ?auto_266178 - SURFACE
      ?auto_266177 - SURFACE
      ?auto_266179 - SURFACE
    )
    :vars
    (
      ?auto_266182 - HOIST
      ?auto_266185 - PLACE
      ?auto_266184 - PLACE
      ?auto_266183 - HOIST
      ?auto_266181 - SURFACE
      ?auto_266180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_266182 ?auto_266185 ) ( SURFACE-AT ?auto_266177 ?auto_266185 ) ( CLEAR ?auto_266177 ) ( IS-CRATE ?auto_266179 ) ( not ( = ?auto_266177 ?auto_266179 ) ) ( AVAILABLE ?auto_266182 ) ( ON ?auto_266177 ?auto_266178 ) ( not ( = ?auto_266178 ?auto_266177 ) ) ( not ( = ?auto_266178 ?auto_266179 ) ) ( not ( = ?auto_266184 ?auto_266185 ) ) ( HOIST-AT ?auto_266183 ?auto_266184 ) ( not ( = ?auto_266182 ?auto_266183 ) ) ( AVAILABLE ?auto_266183 ) ( SURFACE-AT ?auto_266179 ?auto_266184 ) ( ON ?auto_266179 ?auto_266181 ) ( CLEAR ?auto_266179 ) ( not ( = ?auto_266177 ?auto_266181 ) ) ( not ( = ?auto_266179 ?auto_266181 ) ) ( not ( = ?auto_266178 ?auto_266181 ) ) ( TRUCK-AT ?auto_266180 ?auto_266185 ) ( ON ?auto_266175 ?auto_266174 ) ( ON ?auto_266176 ?auto_266175 ) ( ON ?auto_266178 ?auto_266176 ) ( not ( = ?auto_266174 ?auto_266175 ) ) ( not ( = ?auto_266174 ?auto_266176 ) ) ( not ( = ?auto_266174 ?auto_266178 ) ) ( not ( = ?auto_266174 ?auto_266177 ) ) ( not ( = ?auto_266174 ?auto_266179 ) ) ( not ( = ?auto_266174 ?auto_266181 ) ) ( not ( = ?auto_266175 ?auto_266176 ) ) ( not ( = ?auto_266175 ?auto_266178 ) ) ( not ( = ?auto_266175 ?auto_266177 ) ) ( not ( = ?auto_266175 ?auto_266179 ) ) ( not ( = ?auto_266175 ?auto_266181 ) ) ( not ( = ?auto_266176 ?auto_266178 ) ) ( not ( = ?auto_266176 ?auto_266177 ) ) ( not ( = ?auto_266176 ?auto_266179 ) ) ( not ( = ?auto_266176 ?auto_266181 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_266178 ?auto_266177 ?auto_266179 )
      ( MAKE-5CRATE-VERIFY ?auto_266174 ?auto_266175 ?auto_266176 ?auto_266178 ?auto_266177 ?auto_266179 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266225 - SURFACE
      ?auto_266226 - SURFACE
      ?auto_266227 - SURFACE
      ?auto_266229 - SURFACE
      ?auto_266228 - SURFACE
      ?auto_266230 - SURFACE
    )
    :vars
    (
      ?auto_266231 - HOIST
      ?auto_266232 - PLACE
      ?auto_266233 - PLACE
      ?auto_266236 - HOIST
      ?auto_266235 - SURFACE
      ?auto_266234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_266231 ?auto_266232 ) ( IS-CRATE ?auto_266230 ) ( not ( = ?auto_266228 ?auto_266230 ) ) ( not ( = ?auto_266229 ?auto_266228 ) ) ( not ( = ?auto_266229 ?auto_266230 ) ) ( not ( = ?auto_266233 ?auto_266232 ) ) ( HOIST-AT ?auto_266236 ?auto_266233 ) ( not ( = ?auto_266231 ?auto_266236 ) ) ( AVAILABLE ?auto_266236 ) ( SURFACE-AT ?auto_266230 ?auto_266233 ) ( ON ?auto_266230 ?auto_266235 ) ( CLEAR ?auto_266230 ) ( not ( = ?auto_266228 ?auto_266235 ) ) ( not ( = ?auto_266230 ?auto_266235 ) ) ( not ( = ?auto_266229 ?auto_266235 ) ) ( TRUCK-AT ?auto_266234 ?auto_266232 ) ( SURFACE-AT ?auto_266229 ?auto_266232 ) ( CLEAR ?auto_266229 ) ( LIFTING ?auto_266231 ?auto_266228 ) ( IS-CRATE ?auto_266228 ) ( ON ?auto_266226 ?auto_266225 ) ( ON ?auto_266227 ?auto_266226 ) ( ON ?auto_266229 ?auto_266227 ) ( not ( = ?auto_266225 ?auto_266226 ) ) ( not ( = ?auto_266225 ?auto_266227 ) ) ( not ( = ?auto_266225 ?auto_266229 ) ) ( not ( = ?auto_266225 ?auto_266228 ) ) ( not ( = ?auto_266225 ?auto_266230 ) ) ( not ( = ?auto_266225 ?auto_266235 ) ) ( not ( = ?auto_266226 ?auto_266227 ) ) ( not ( = ?auto_266226 ?auto_266229 ) ) ( not ( = ?auto_266226 ?auto_266228 ) ) ( not ( = ?auto_266226 ?auto_266230 ) ) ( not ( = ?auto_266226 ?auto_266235 ) ) ( not ( = ?auto_266227 ?auto_266229 ) ) ( not ( = ?auto_266227 ?auto_266228 ) ) ( not ( = ?auto_266227 ?auto_266230 ) ) ( not ( = ?auto_266227 ?auto_266235 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_266229 ?auto_266228 ?auto_266230 )
      ( MAKE-5CRATE-VERIFY ?auto_266225 ?auto_266226 ?auto_266227 ?auto_266229 ?auto_266228 ?auto_266230 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266276 - SURFACE
      ?auto_266277 - SURFACE
      ?auto_266278 - SURFACE
      ?auto_266280 - SURFACE
      ?auto_266279 - SURFACE
      ?auto_266281 - SURFACE
    )
    :vars
    (
      ?auto_266285 - HOIST
      ?auto_266287 - PLACE
      ?auto_266282 - PLACE
      ?auto_266286 - HOIST
      ?auto_266283 - SURFACE
      ?auto_266284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_266285 ?auto_266287 ) ( IS-CRATE ?auto_266281 ) ( not ( = ?auto_266279 ?auto_266281 ) ) ( not ( = ?auto_266280 ?auto_266279 ) ) ( not ( = ?auto_266280 ?auto_266281 ) ) ( not ( = ?auto_266282 ?auto_266287 ) ) ( HOIST-AT ?auto_266286 ?auto_266282 ) ( not ( = ?auto_266285 ?auto_266286 ) ) ( AVAILABLE ?auto_266286 ) ( SURFACE-AT ?auto_266281 ?auto_266282 ) ( ON ?auto_266281 ?auto_266283 ) ( CLEAR ?auto_266281 ) ( not ( = ?auto_266279 ?auto_266283 ) ) ( not ( = ?auto_266281 ?auto_266283 ) ) ( not ( = ?auto_266280 ?auto_266283 ) ) ( TRUCK-AT ?auto_266284 ?auto_266287 ) ( SURFACE-AT ?auto_266280 ?auto_266287 ) ( CLEAR ?auto_266280 ) ( IS-CRATE ?auto_266279 ) ( AVAILABLE ?auto_266285 ) ( IN ?auto_266279 ?auto_266284 ) ( ON ?auto_266277 ?auto_266276 ) ( ON ?auto_266278 ?auto_266277 ) ( ON ?auto_266280 ?auto_266278 ) ( not ( = ?auto_266276 ?auto_266277 ) ) ( not ( = ?auto_266276 ?auto_266278 ) ) ( not ( = ?auto_266276 ?auto_266280 ) ) ( not ( = ?auto_266276 ?auto_266279 ) ) ( not ( = ?auto_266276 ?auto_266281 ) ) ( not ( = ?auto_266276 ?auto_266283 ) ) ( not ( = ?auto_266277 ?auto_266278 ) ) ( not ( = ?auto_266277 ?auto_266280 ) ) ( not ( = ?auto_266277 ?auto_266279 ) ) ( not ( = ?auto_266277 ?auto_266281 ) ) ( not ( = ?auto_266277 ?auto_266283 ) ) ( not ( = ?auto_266278 ?auto_266280 ) ) ( not ( = ?auto_266278 ?auto_266279 ) ) ( not ( = ?auto_266278 ?auto_266281 ) ) ( not ( = ?auto_266278 ?auto_266283 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_266280 ?auto_266279 ?auto_266281 )
      ( MAKE-5CRATE-VERIFY ?auto_266276 ?auto_266277 ?auto_266278 ?auto_266280 ?auto_266279 ?auto_266281 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_266644 - SURFACE
      ?auto_266645 - SURFACE
    )
    :vars
    (
      ?auto_266649 - HOIST
      ?auto_266647 - PLACE
      ?auto_266651 - SURFACE
      ?auto_266650 - PLACE
      ?auto_266648 - HOIST
      ?auto_266646 - SURFACE
      ?auto_266652 - TRUCK
      ?auto_266653 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_266649 ?auto_266647 ) ( SURFACE-AT ?auto_266644 ?auto_266647 ) ( CLEAR ?auto_266644 ) ( IS-CRATE ?auto_266645 ) ( not ( = ?auto_266644 ?auto_266645 ) ) ( ON ?auto_266644 ?auto_266651 ) ( not ( = ?auto_266651 ?auto_266644 ) ) ( not ( = ?auto_266651 ?auto_266645 ) ) ( not ( = ?auto_266650 ?auto_266647 ) ) ( HOIST-AT ?auto_266648 ?auto_266650 ) ( not ( = ?auto_266649 ?auto_266648 ) ) ( AVAILABLE ?auto_266648 ) ( SURFACE-AT ?auto_266645 ?auto_266650 ) ( ON ?auto_266645 ?auto_266646 ) ( CLEAR ?auto_266645 ) ( not ( = ?auto_266644 ?auto_266646 ) ) ( not ( = ?auto_266645 ?auto_266646 ) ) ( not ( = ?auto_266651 ?auto_266646 ) ) ( TRUCK-AT ?auto_266652 ?auto_266647 ) ( LIFTING ?auto_266649 ?auto_266653 ) ( IS-CRATE ?auto_266653 ) ( not ( = ?auto_266644 ?auto_266653 ) ) ( not ( = ?auto_266645 ?auto_266653 ) ) ( not ( = ?auto_266651 ?auto_266653 ) ) ( not ( = ?auto_266646 ?auto_266653 ) ) )
    :subtasks
    ( ( !LOAD ?auto_266649 ?auto_266653 ?auto_266652 ?auto_266647 )
      ( MAKE-1CRATE ?auto_266644 ?auto_266645 )
      ( MAKE-1CRATE-VERIFY ?auto_266644 ?auto_266645 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_267264 - SURFACE
      ?auto_267265 - SURFACE
    )
    :vars
    (
      ?auto_267267 - HOIST
      ?auto_267271 - PLACE
      ?auto_267272 - SURFACE
      ?auto_267270 - TRUCK
      ?auto_267268 - PLACE
      ?auto_267269 - HOIST
      ?auto_267266 - SURFACE
      ?auto_267273 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_267267 ?auto_267271 ) ( SURFACE-AT ?auto_267264 ?auto_267271 ) ( CLEAR ?auto_267264 ) ( IS-CRATE ?auto_267265 ) ( not ( = ?auto_267264 ?auto_267265 ) ) ( AVAILABLE ?auto_267267 ) ( ON ?auto_267264 ?auto_267272 ) ( not ( = ?auto_267272 ?auto_267264 ) ) ( not ( = ?auto_267272 ?auto_267265 ) ) ( TRUCK-AT ?auto_267270 ?auto_267268 ) ( not ( = ?auto_267268 ?auto_267271 ) ) ( HOIST-AT ?auto_267269 ?auto_267268 ) ( not ( = ?auto_267267 ?auto_267269 ) ) ( SURFACE-AT ?auto_267265 ?auto_267268 ) ( ON ?auto_267265 ?auto_267266 ) ( CLEAR ?auto_267265 ) ( not ( = ?auto_267264 ?auto_267266 ) ) ( not ( = ?auto_267265 ?auto_267266 ) ) ( not ( = ?auto_267272 ?auto_267266 ) ) ( LIFTING ?auto_267269 ?auto_267273 ) ( IS-CRATE ?auto_267273 ) ( not ( = ?auto_267264 ?auto_267273 ) ) ( not ( = ?auto_267265 ?auto_267273 ) ) ( not ( = ?auto_267272 ?auto_267273 ) ) ( not ( = ?auto_267266 ?auto_267273 ) ) )
    :subtasks
    ( ( !LOAD ?auto_267269 ?auto_267273 ?auto_267270 ?auto_267268 )
      ( MAKE-1CRATE ?auto_267264 ?auto_267265 )
      ( MAKE-1CRATE-VERIFY ?auto_267264 ?auto_267265 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_267479 - SURFACE
      ?auto_267480 - SURFACE
      ?auto_267481 - SURFACE
      ?auto_267483 - SURFACE
      ?auto_267482 - SURFACE
      ?auto_267484 - SURFACE
      ?auto_267485 - SURFACE
    )
    :vars
    (
      ?auto_267486 - HOIST
      ?auto_267487 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_267486 ?auto_267487 ) ( SURFACE-AT ?auto_267484 ?auto_267487 ) ( CLEAR ?auto_267484 ) ( LIFTING ?auto_267486 ?auto_267485 ) ( IS-CRATE ?auto_267485 ) ( not ( = ?auto_267484 ?auto_267485 ) ) ( ON ?auto_267480 ?auto_267479 ) ( ON ?auto_267481 ?auto_267480 ) ( ON ?auto_267483 ?auto_267481 ) ( ON ?auto_267482 ?auto_267483 ) ( ON ?auto_267484 ?auto_267482 ) ( not ( = ?auto_267479 ?auto_267480 ) ) ( not ( = ?auto_267479 ?auto_267481 ) ) ( not ( = ?auto_267479 ?auto_267483 ) ) ( not ( = ?auto_267479 ?auto_267482 ) ) ( not ( = ?auto_267479 ?auto_267484 ) ) ( not ( = ?auto_267479 ?auto_267485 ) ) ( not ( = ?auto_267480 ?auto_267481 ) ) ( not ( = ?auto_267480 ?auto_267483 ) ) ( not ( = ?auto_267480 ?auto_267482 ) ) ( not ( = ?auto_267480 ?auto_267484 ) ) ( not ( = ?auto_267480 ?auto_267485 ) ) ( not ( = ?auto_267481 ?auto_267483 ) ) ( not ( = ?auto_267481 ?auto_267482 ) ) ( not ( = ?auto_267481 ?auto_267484 ) ) ( not ( = ?auto_267481 ?auto_267485 ) ) ( not ( = ?auto_267483 ?auto_267482 ) ) ( not ( = ?auto_267483 ?auto_267484 ) ) ( not ( = ?auto_267483 ?auto_267485 ) ) ( not ( = ?auto_267482 ?auto_267484 ) ) ( not ( = ?auto_267482 ?auto_267485 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_267484 ?auto_267485 )
      ( MAKE-6CRATE-VERIFY ?auto_267479 ?auto_267480 ?auto_267481 ?auto_267483 ?auto_267482 ?auto_267484 ?auto_267485 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_267523 - SURFACE
      ?auto_267524 - SURFACE
      ?auto_267525 - SURFACE
      ?auto_267527 - SURFACE
      ?auto_267526 - SURFACE
      ?auto_267528 - SURFACE
      ?auto_267529 - SURFACE
    )
    :vars
    (
      ?auto_267532 - HOIST
      ?auto_267531 - PLACE
      ?auto_267530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_267532 ?auto_267531 ) ( SURFACE-AT ?auto_267528 ?auto_267531 ) ( CLEAR ?auto_267528 ) ( IS-CRATE ?auto_267529 ) ( not ( = ?auto_267528 ?auto_267529 ) ) ( TRUCK-AT ?auto_267530 ?auto_267531 ) ( AVAILABLE ?auto_267532 ) ( IN ?auto_267529 ?auto_267530 ) ( ON ?auto_267528 ?auto_267526 ) ( not ( = ?auto_267526 ?auto_267528 ) ) ( not ( = ?auto_267526 ?auto_267529 ) ) ( ON ?auto_267524 ?auto_267523 ) ( ON ?auto_267525 ?auto_267524 ) ( ON ?auto_267527 ?auto_267525 ) ( ON ?auto_267526 ?auto_267527 ) ( not ( = ?auto_267523 ?auto_267524 ) ) ( not ( = ?auto_267523 ?auto_267525 ) ) ( not ( = ?auto_267523 ?auto_267527 ) ) ( not ( = ?auto_267523 ?auto_267526 ) ) ( not ( = ?auto_267523 ?auto_267528 ) ) ( not ( = ?auto_267523 ?auto_267529 ) ) ( not ( = ?auto_267524 ?auto_267525 ) ) ( not ( = ?auto_267524 ?auto_267527 ) ) ( not ( = ?auto_267524 ?auto_267526 ) ) ( not ( = ?auto_267524 ?auto_267528 ) ) ( not ( = ?auto_267524 ?auto_267529 ) ) ( not ( = ?auto_267525 ?auto_267527 ) ) ( not ( = ?auto_267525 ?auto_267526 ) ) ( not ( = ?auto_267525 ?auto_267528 ) ) ( not ( = ?auto_267525 ?auto_267529 ) ) ( not ( = ?auto_267527 ?auto_267526 ) ) ( not ( = ?auto_267527 ?auto_267528 ) ) ( not ( = ?auto_267527 ?auto_267529 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_267526 ?auto_267528 ?auto_267529 )
      ( MAKE-6CRATE-VERIFY ?auto_267523 ?auto_267524 ?auto_267525 ?auto_267527 ?auto_267526 ?auto_267528 ?auto_267529 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_267574 - SURFACE
      ?auto_267575 - SURFACE
      ?auto_267576 - SURFACE
      ?auto_267578 - SURFACE
      ?auto_267577 - SURFACE
      ?auto_267579 - SURFACE
      ?auto_267580 - SURFACE
    )
    :vars
    (
      ?auto_267583 - HOIST
      ?auto_267582 - PLACE
      ?auto_267584 - TRUCK
      ?auto_267581 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_267583 ?auto_267582 ) ( SURFACE-AT ?auto_267579 ?auto_267582 ) ( CLEAR ?auto_267579 ) ( IS-CRATE ?auto_267580 ) ( not ( = ?auto_267579 ?auto_267580 ) ) ( AVAILABLE ?auto_267583 ) ( IN ?auto_267580 ?auto_267584 ) ( ON ?auto_267579 ?auto_267577 ) ( not ( = ?auto_267577 ?auto_267579 ) ) ( not ( = ?auto_267577 ?auto_267580 ) ) ( TRUCK-AT ?auto_267584 ?auto_267581 ) ( not ( = ?auto_267581 ?auto_267582 ) ) ( ON ?auto_267575 ?auto_267574 ) ( ON ?auto_267576 ?auto_267575 ) ( ON ?auto_267578 ?auto_267576 ) ( ON ?auto_267577 ?auto_267578 ) ( not ( = ?auto_267574 ?auto_267575 ) ) ( not ( = ?auto_267574 ?auto_267576 ) ) ( not ( = ?auto_267574 ?auto_267578 ) ) ( not ( = ?auto_267574 ?auto_267577 ) ) ( not ( = ?auto_267574 ?auto_267579 ) ) ( not ( = ?auto_267574 ?auto_267580 ) ) ( not ( = ?auto_267575 ?auto_267576 ) ) ( not ( = ?auto_267575 ?auto_267578 ) ) ( not ( = ?auto_267575 ?auto_267577 ) ) ( not ( = ?auto_267575 ?auto_267579 ) ) ( not ( = ?auto_267575 ?auto_267580 ) ) ( not ( = ?auto_267576 ?auto_267578 ) ) ( not ( = ?auto_267576 ?auto_267577 ) ) ( not ( = ?auto_267576 ?auto_267579 ) ) ( not ( = ?auto_267576 ?auto_267580 ) ) ( not ( = ?auto_267578 ?auto_267577 ) ) ( not ( = ?auto_267578 ?auto_267579 ) ) ( not ( = ?auto_267578 ?auto_267580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_267577 ?auto_267579 ?auto_267580 )
      ( MAKE-6CRATE-VERIFY ?auto_267574 ?auto_267575 ?auto_267576 ?auto_267578 ?auto_267577 ?auto_267579 ?auto_267580 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_267631 - SURFACE
      ?auto_267632 - SURFACE
      ?auto_267633 - SURFACE
      ?auto_267635 - SURFACE
      ?auto_267634 - SURFACE
      ?auto_267636 - SURFACE
      ?auto_267637 - SURFACE
    )
    :vars
    (
      ?auto_267639 - HOIST
      ?auto_267640 - PLACE
      ?auto_267638 - TRUCK
      ?auto_267642 - PLACE
      ?auto_267641 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_267639 ?auto_267640 ) ( SURFACE-AT ?auto_267636 ?auto_267640 ) ( CLEAR ?auto_267636 ) ( IS-CRATE ?auto_267637 ) ( not ( = ?auto_267636 ?auto_267637 ) ) ( AVAILABLE ?auto_267639 ) ( ON ?auto_267636 ?auto_267634 ) ( not ( = ?auto_267634 ?auto_267636 ) ) ( not ( = ?auto_267634 ?auto_267637 ) ) ( TRUCK-AT ?auto_267638 ?auto_267642 ) ( not ( = ?auto_267642 ?auto_267640 ) ) ( HOIST-AT ?auto_267641 ?auto_267642 ) ( LIFTING ?auto_267641 ?auto_267637 ) ( not ( = ?auto_267639 ?auto_267641 ) ) ( ON ?auto_267632 ?auto_267631 ) ( ON ?auto_267633 ?auto_267632 ) ( ON ?auto_267635 ?auto_267633 ) ( ON ?auto_267634 ?auto_267635 ) ( not ( = ?auto_267631 ?auto_267632 ) ) ( not ( = ?auto_267631 ?auto_267633 ) ) ( not ( = ?auto_267631 ?auto_267635 ) ) ( not ( = ?auto_267631 ?auto_267634 ) ) ( not ( = ?auto_267631 ?auto_267636 ) ) ( not ( = ?auto_267631 ?auto_267637 ) ) ( not ( = ?auto_267632 ?auto_267633 ) ) ( not ( = ?auto_267632 ?auto_267635 ) ) ( not ( = ?auto_267632 ?auto_267634 ) ) ( not ( = ?auto_267632 ?auto_267636 ) ) ( not ( = ?auto_267632 ?auto_267637 ) ) ( not ( = ?auto_267633 ?auto_267635 ) ) ( not ( = ?auto_267633 ?auto_267634 ) ) ( not ( = ?auto_267633 ?auto_267636 ) ) ( not ( = ?auto_267633 ?auto_267637 ) ) ( not ( = ?auto_267635 ?auto_267634 ) ) ( not ( = ?auto_267635 ?auto_267636 ) ) ( not ( = ?auto_267635 ?auto_267637 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_267634 ?auto_267636 ?auto_267637 )
      ( MAKE-6CRATE-VERIFY ?auto_267631 ?auto_267632 ?auto_267633 ?auto_267635 ?auto_267634 ?auto_267636 ?auto_267637 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_267694 - SURFACE
      ?auto_267695 - SURFACE
      ?auto_267696 - SURFACE
      ?auto_267698 - SURFACE
      ?auto_267697 - SURFACE
      ?auto_267699 - SURFACE
      ?auto_267700 - SURFACE
    )
    :vars
    (
      ?auto_267705 - HOIST
      ?auto_267704 - PLACE
      ?auto_267702 - TRUCK
      ?auto_267701 - PLACE
      ?auto_267706 - HOIST
      ?auto_267703 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_267705 ?auto_267704 ) ( SURFACE-AT ?auto_267699 ?auto_267704 ) ( CLEAR ?auto_267699 ) ( IS-CRATE ?auto_267700 ) ( not ( = ?auto_267699 ?auto_267700 ) ) ( AVAILABLE ?auto_267705 ) ( ON ?auto_267699 ?auto_267697 ) ( not ( = ?auto_267697 ?auto_267699 ) ) ( not ( = ?auto_267697 ?auto_267700 ) ) ( TRUCK-AT ?auto_267702 ?auto_267701 ) ( not ( = ?auto_267701 ?auto_267704 ) ) ( HOIST-AT ?auto_267706 ?auto_267701 ) ( not ( = ?auto_267705 ?auto_267706 ) ) ( AVAILABLE ?auto_267706 ) ( SURFACE-AT ?auto_267700 ?auto_267701 ) ( ON ?auto_267700 ?auto_267703 ) ( CLEAR ?auto_267700 ) ( not ( = ?auto_267699 ?auto_267703 ) ) ( not ( = ?auto_267700 ?auto_267703 ) ) ( not ( = ?auto_267697 ?auto_267703 ) ) ( ON ?auto_267695 ?auto_267694 ) ( ON ?auto_267696 ?auto_267695 ) ( ON ?auto_267698 ?auto_267696 ) ( ON ?auto_267697 ?auto_267698 ) ( not ( = ?auto_267694 ?auto_267695 ) ) ( not ( = ?auto_267694 ?auto_267696 ) ) ( not ( = ?auto_267694 ?auto_267698 ) ) ( not ( = ?auto_267694 ?auto_267697 ) ) ( not ( = ?auto_267694 ?auto_267699 ) ) ( not ( = ?auto_267694 ?auto_267700 ) ) ( not ( = ?auto_267694 ?auto_267703 ) ) ( not ( = ?auto_267695 ?auto_267696 ) ) ( not ( = ?auto_267695 ?auto_267698 ) ) ( not ( = ?auto_267695 ?auto_267697 ) ) ( not ( = ?auto_267695 ?auto_267699 ) ) ( not ( = ?auto_267695 ?auto_267700 ) ) ( not ( = ?auto_267695 ?auto_267703 ) ) ( not ( = ?auto_267696 ?auto_267698 ) ) ( not ( = ?auto_267696 ?auto_267697 ) ) ( not ( = ?auto_267696 ?auto_267699 ) ) ( not ( = ?auto_267696 ?auto_267700 ) ) ( not ( = ?auto_267696 ?auto_267703 ) ) ( not ( = ?auto_267698 ?auto_267697 ) ) ( not ( = ?auto_267698 ?auto_267699 ) ) ( not ( = ?auto_267698 ?auto_267700 ) ) ( not ( = ?auto_267698 ?auto_267703 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_267697 ?auto_267699 ?auto_267700 )
      ( MAKE-6CRATE-VERIFY ?auto_267694 ?auto_267695 ?auto_267696 ?auto_267698 ?auto_267697 ?auto_267699 ?auto_267700 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_267758 - SURFACE
      ?auto_267759 - SURFACE
      ?auto_267760 - SURFACE
      ?auto_267762 - SURFACE
      ?auto_267761 - SURFACE
      ?auto_267763 - SURFACE
      ?auto_267764 - SURFACE
    )
    :vars
    (
      ?auto_267767 - HOIST
      ?auto_267766 - PLACE
      ?auto_267769 - PLACE
      ?auto_267768 - HOIST
      ?auto_267770 - SURFACE
      ?auto_267765 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_267767 ?auto_267766 ) ( SURFACE-AT ?auto_267763 ?auto_267766 ) ( CLEAR ?auto_267763 ) ( IS-CRATE ?auto_267764 ) ( not ( = ?auto_267763 ?auto_267764 ) ) ( AVAILABLE ?auto_267767 ) ( ON ?auto_267763 ?auto_267761 ) ( not ( = ?auto_267761 ?auto_267763 ) ) ( not ( = ?auto_267761 ?auto_267764 ) ) ( not ( = ?auto_267769 ?auto_267766 ) ) ( HOIST-AT ?auto_267768 ?auto_267769 ) ( not ( = ?auto_267767 ?auto_267768 ) ) ( AVAILABLE ?auto_267768 ) ( SURFACE-AT ?auto_267764 ?auto_267769 ) ( ON ?auto_267764 ?auto_267770 ) ( CLEAR ?auto_267764 ) ( not ( = ?auto_267763 ?auto_267770 ) ) ( not ( = ?auto_267764 ?auto_267770 ) ) ( not ( = ?auto_267761 ?auto_267770 ) ) ( TRUCK-AT ?auto_267765 ?auto_267766 ) ( ON ?auto_267759 ?auto_267758 ) ( ON ?auto_267760 ?auto_267759 ) ( ON ?auto_267762 ?auto_267760 ) ( ON ?auto_267761 ?auto_267762 ) ( not ( = ?auto_267758 ?auto_267759 ) ) ( not ( = ?auto_267758 ?auto_267760 ) ) ( not ( = ?auto_267758 ?auto_267762 ) ) ( not ( = ?auto_267758 ?auto_267761 ) ) ( not ( = ?auto_267758 ?auto_267763 ) ) ( not ( = ?auto_267758 ?auto_267764 ) ) ( not ( = ?auto_267758 ?auto_267770 ) ) ( not ( = ?auto_267759 ?auto_267760 ) ) ( not ( = ?auto_267759 ?auto_267762 ) ) ( not ( = ?auto_267759 ?auto_267761 ) ) ( not ( = ?auto_267759 ?auto_267763 ) ) ( not ( = ?auto_267759 ?auto_267764 ) ) ( not ( = ?auto_267759 ?auto_267770 ) ) ( not ( = ?auto_267760 ?auto_267762 ) ) ( not ( = ?auto_267760 ?auto_267761 ) ) ( not ( = ?auto_267760 ?auto_267763 ) ) ( not ( = ?auto_267760 ?auto_267764 ) ) ( not ( = ?auto_267760 ?auto_267770 ) ) ( not ( = ?auto_267762 ?auto_267761 ) ) ( not ( = ?auto_267762 ?auto_267763 ) ) ( not ( = ?auto_267762 ?auto_267764 ) ) ( not ( = ?auto_267762 ?auto_267770 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_267761 ?auto_267763 ?auto_267764 )
      ( MAKE-6CRATE-VERIFY ?auto_267758 ?auto_267759 ?auto_267760 ?auto_267762 ?auto_267761 ?auto_267763 ?auto_267764 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_267822 - SURFACE
      ?auto_267823 - SURFACE
      ?auto_267824 - SURFACE
      ?auto_267826 - SURFACE
      ?auto_267825 - SURFACE
      ?auto_267827 - SURFACE
      ?auto_267828 - SURFACE
    )
    :vars
    (
      ?auto_267830 - HOIST
      ?auto_267831 - PLACE
      ?auto_267833 - PLACE
      ?auto_267834 - HOIST
      ?auto_267829 - SURFACE
      ?auto_267832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_267830 ?auto_267831 ) ( IS-CRATE ?auto_267828 ) ( not ( = ?auto_267827 ?auto_267828 ) ) ( not ( = ?auto_267825 ?auto_267827 ) ) ( not ( = ?auto_267825 ?auto_267828 ) ) ( not ( = ?auto_267833 ?auto_267831 ) ) ( HOIST-AT ?auto_267834 ?auto_267833 ) ( not ( = ?auto_267830 ?auto_267834 ) ) ( AVAILABLE ?auto_267834 ) ( SURFACE-AT ?auto_267828 ?auto_267833 ) ( ON ?auto_267828 ?auto_267829 ) ( CLEAR ?auto_267828 ) ( not ( = ?auto_267827 ?auto_267829 ) ) ( not ( = ?auto_267828 ?auto_267829 ) ) ( not ( = ?auto_267825 ?auto_267829 ) ) ( TRUCK-AT ?auto_267832 ?auto_267831 ) ( SURFACE-AT ?auto_267825 ?auto_267831 ) ( CLEAR ?auto_267825 ) ( LIFTING ?auto_267830 ?auto_267827 ) ( IS-CRATE ?auto_267827 ) ( ON ?auto_267823 ?auto_267822 ) ( ON ?auto_267824 ?auto_267823 ) ( ON ?auto_267826 ?auto_267824 ) ( ON ?auto_267825 ?auto_267826 ) ( not ( = ?auto_267822 ?auto_267823 ) ) ( not ( = ?auto_267822 ?auto_267824 ) ) ( not ( = ?auto_267822 ?auto_267826 ) ) ( not ( = ?auto_267822 ?auto_267825 ) ) ( not ( = ?auto_267822 ?auto_267827 ) ) ( not ( = ?auto_267822 ?auto_267828 ) ) ( not ( = ?auto_267822 ?auto_267829 ) ) ( not ( = ?auto_267823 ?auto_267824 ) ) ( not ( = ?auto_267823 ?auto_267826 ) ) ( not ( = ?auto_267823 ?auto_267825 ) ) ( not ( = ?auto_267823 ?auto_267827 ) ) ( not ( = ?auto_267823 ?auto_267828 ) ) ( not ( = ?auto_267823 ?auto_267829 ) ) ( not ( = ?auto_267824 ?auto_267826 ) ) ( not ( = ?auto_267824 ?auto_267825 ) ) ( not ( = ?auto_267824 ?auto_267827 ) ) ( not ( = ?auto_267824 ?auto_267828 ) ) ( not ( = ?auto_267824 ?auto_267829 ) ) ( not ( = ?auto_267826 ?auto_267825 ) ) ( not ( = ?auto_267826 ?auto_267827 ) ) ( not ( = ?auto_267826 ?auto_267828 ) ) ( not ( = ?auto_267826 ?auto_267829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_267825 ?auto_267827 ?auto_267828 )
      ( MAKE-6CRATE-VERIFY ?auto_267822 ?auto_267823 ?auto_267824 ?auto_267826 ?auto_267825 ?auto_267827 ?auto_267828 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_267886 - SURFACE
      ?auto_267887 - SURFACE
      ?auto_267888 - SURFACE
      ?auto_267890 - SURFACE
      ?auto_267889 - SURFACE
      ?auto_267891 - SURFACE
      ?auto_267892 - SURFACE
    )
    :vars
    (
      ?auto_267894 - HOIST
      ?auto_267896 - PLACE
      ?auto_267897 - PLACE
      ?auto_267898 - HOIST
      ?auto_267895 - SURFACE
      ?auto_267893 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_267894 ?auto_267896 ) ( IS-CRATE ?auto_267892 ) ( not ( = ?auto_267891 ?auto_267892 ) ) ( not ( = ?auto_267889 ?auto_267891 ) ) ( not ( = ?auto_267889 ?auto_267892 ) ) ( not ( = ?auto_267897 ?auto_267896 ) ) ( HOIST-AT ?auto_267898 ?auto_267897 ) ( not ( = ?auto_267894 ?auto_267898 ) ) ( AVAILABLE ?auto_267898 ) ( SURFACE-AT ?auto_267892 ?auto_267897 ) ( ON ?auto_267892 ?auto_267895 ) ( CLEAR ?auto_267892 ) ( not ( = ?auto_267891 ?auto_267895 ) ) ( not ( = ?auto_267892 ?auto_267895 ) ) ( not ( = ?auto_267889 ?auto_267895 ) ) ( TRUCK-AT ?auto_267893 ?auto_267896 ) ( SURFACE-AT ?auto_267889 ?auto_267896 ) ( CLEAR ?auto_267889 ) ( IS-CRATE ?auto_267891 ) ( AVAILABLE ?auto_267894 ) ( IN ?auto_267891 ?auto_267893 ) ( ON ?auto_267887 ?auto_267886 ) ( ON ?auto_267888 ?auto_267887 ) ( ON ?auto_267890 ?auto_267888 ) ( ON ?auto_267889 ?auto_267890 ) ( not ( = ?auto_267886 ?auto_267887 ) ) ( not ( = ?auto_267886 ?auto_267888 ) ) ( not ( = ?auto_267886 ?auto_267890 ) ) ( not ( = ?auto_267886 ?auto_267889 ) ) ( not ( = ?auto_267886 ?auto_267891 ) ) ( not ( = ?auto_267886 ?auto_267892 ) ) ( not ( = ?auto_267886 ?auto_267895 ) ) ( not ( = ?auto_267887 ?auto_267888 ) ) ( not ( = ?auto_267887 ?auto_267890 ) ) ( not ( = ?auto_267887 ?auto_267889 ) ) ( not ( = ?auto_267887 ?auto_267891 ) ) ( not ( = ?auto_267887 ?auto_267892 ) ) ( not ( = ?auto_267887 ?auto_267895 ) ) ( not ( = ?auto_267888 ?auto_267890 ) ) ( not ( = ?auto_267888 ?auto_267889 ) ) ( not ( = ?auto_267888 ?auto_267891 ) ) ( not ( = ?auto_267888 ?auto_267892 ) ) ( not ( = ?auto_267888 ?auto_267895 ) ) ( not ( = ?auto_267890 ?auto_267889 ) ) ( not ( = ?auto_267890 ?auto_267891 ) ) ( not ( = ?auto_267890 ?auto_267892 ) ) ( not ( = ?auto_267890 ?auto_267895 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_267889 ?auto_267891 ?auto_267892 )
      ( MAKE-6CRATE-VERIFY ?auto_267886 ?auto_267887 ?auto_267888 ?auto_267890 ?auto_267889 ?auto_267891 ?auto_267892 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_269830 - SURFACE
      ?auto_269831 - SURFACE
      ?auto_269832 - SURFACE
      ?auto_269834 - SURFACE
      ?auto_269833 - SURFACE
      ?auto_269835 - SURFACE
      ?auto_269836 - SURFACE
      ?auto_269837 - SURFACE
    )
    :vars
    (
      ?auto_269839 - HOIST
      ?auto_269838 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_269839 ?auto_269838 ) ( SURFACE-AT ?auto_269836 ?auto_269838 ) ( CLEAR ?auto_269836 ) ( LIFTING ?auto_269839 ?auto_269837 ) ( IS-CRATE ?auto_269837 ) ( not ( = ?auto_269836 ?auto_269837 ) ) ( ON ?auto_269831 ?auto_269830 ) ( ON ?auto_269832 ?auto_269831 ) ( ON ?auto_269834 ?auto_269832 ) ( ON ?auto_269833 ?auto_269834 ) ( ON ?auto_269835 ?auto_269833 ) ( ON ?auto_269836 ?auto_269835 ) ( not ( = ?auto_269830 ?auto_269831 ) ) ( not ( = ?auto_269830 ?auto_269832 ) ) ( not ( = ?auto_269830 ?auto_269834 ) ) ( not ( = ?auto_269830 ?auto_269833 ) ) ( not ( = ?auto_269830 ?auto_269835 ) ) ( not ( = ?auto_269830 ?auto_269836 ) ) ( not ( = ?auto_269830 ?auto_269837 ) ) ( not ( = ?auto_269831 ?auto_269832 ) ) ( not ( = ?auto_269831 ?auto_269834 ) ) ( not ( = ?auto_269831 ?auto_269833 ) ) ( not ( = ?auto_269831 ?auto_269835 ) ) ( not ( = ?auto_269831 ?auto_269836 ) ) ( not ( = ?auto_269831 ?auto_269837 ) ) ( not ( = ?auto_269832 ?auto_269834 ) ) ( not ( = ?auto_269832 ?auto_269833 ) ) ( not ( = ?auto_269832 ?auto_269835 ) ) ( not ( = ?auto_269832 ?auto_269836 ) ) ( not ( = ?auto_269832 ?auto_269837 ) ) ( not ( = ?auto_269834 ?auto_269833 ) ) ( not ( = ?auto_269834 ?auto_269835 ) ) ( not ( = ?auto_269834 ?auto_269836 ) ) ( not ( = ?auto_269834 ?auto_269837 ) ) ( not ( = ?auto_269833 ?auto_269835 ) ) ( not ( = ?auto_269833 ?auto_269836 ) ) ( not ( = ?auto_269833 ?auto_269837 ) ) ( not ( = ?auto_269835 ?auto_269836 ) ) ( not ( = ?auto_269835 ?auto_269837 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_269836 ?auto_269837 )
      ( MAKE-7CRATE-VERIFY ?auto_269830 ?auto_269831 ?auto_269832 ?auto_269834 ?auto_269833 ?auto_269835 ?auto_269836 ?auto_269837 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_269885 - SURFACE
      ?auto_269886 - SURFACE
      ?auto_269887 - SURFACE
      ?auto_269889 - SURFACE
      ?auto_269888 - SURFACE
      ?auto_269890 - SURFACE
      ?auto_269891 - SURFACE
      ?auto_269892 - SURFACE
    )
    :vars
    (
      ?auto_269895 - HOIST
      ?auto_269893 - PLACE
      ?auto_269894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_269895 ?auto_269893 ) ( SURFACE-AT ?auto_269891 ?auto_269893 ) ( CLEAR ?auto_269891 ) ( IS-CRATE ?auto_269892 ) ( not ( = ?auto_269891 ?auto_269892 ) ) ( TRUCK-AT ?auto_269894 ?auto_269893 ) ( AVAILABLE ?auto_269895 ) ( IN ?auto_269892 ?auto_269894 ) ( ON ?auto_269891 ?auto_269890 ) ( not ( = ?auto_269890 ?auto_269891 ) ) ( not ( = ?auto_269890 ?auto_269892 ) ) ( ON ?auto_269886 ?auto_269885 ) ( ON ?auto_269887 ?auto_269886 ) ( ON ?auto_269889 ?auto_269887 ) ( ON ?auto_269888 ?auto_269889 ) ( ON ?auto_269890 ?auto_269888 ) ( not ( = ?auto_269885 ?auto_269886 ) ) ( not ( = ?auto_269885 ?auto_269887 ) ) ( not ( = ?auto_269885 ?auto_269889 ) ) ( not ( = ?auto_269885 ?auto_269888 ) ) ( not ( = ?auto_269885 ?auto_269890 ) ) ( not ( = ?auto_269885 ?auto_269891 ) ) ( not ( = ?auto_269885 ?auto_269892 ) ) ( not ( = ?auto_269886 ?auto_269887 ) ) ( not ( = ?auto_269886 ?auto_269889 ) ) ( not ( = ?auto_269886 ?auto_269888 ) ) ( not ( = ?auto_269886 ?auto_269890 ) ) ( not ( = ?auto_269886 ?auto_269891 ) ) ( not ( = ?auto_269886 ?auto_269892 ) ) ( not ( = ?auto_269887 ?auto_269889 ) ) ( not ( = ?auto_269887 ?auto_269888 ) ) ( not ( = ?auto_269887 ?auto_269890 ) ) ( not ( = ?auto_269887 ?auto_269891 ) ) ( not ( = ?auto_269887 ?auto_269892 ) ) ( not ( = ?auto_269889 ?auto_269888 ) ) ( not ( = ?auto_269889 ?auto_269890 ) ) ( not ( = ?auto_269889 ?auto_269891 ) ) ( not ( = ?auto_269889 ?auto_269892 ) ) ( not ( = ?auto_269888 ?auto_269890 ) ) ( not ( = ?auto_269888 ?auto_269891 ) ) ( not ( = ?auto_269888 ?auto_269892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_269890 ?auto_269891 ?auto_269892 )
      ( MAKE-7CRATE-VERIFY ?auto_269885 ?auto_269886 ?auto_269887 ?auto_269889 ?auto_269888 ?auto_269890 ?auto_269891 ?auto_269892 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_269948 - SURFACE
      ?auto_269949 - SURFACE
      ?auto_269950 - SURFACE
      ?auto_269952 - SURFACE
      ?auto_269951 - SURFACE
      ?auto_269953 - SURFACE
      ?auto_269954 - SURFACE
      ?auto_269955 - SURFACE
    )
    :vars
    (
      ?auto_269956 - HOIST
      ?auto_269959 - PLACE
      ?auto_269958 - TRUCK
      ?auto_269957 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_269956 ?auto_269959 ) ( SURFACE-AT ?auto_269954 ?auto_269959 ) ( CLEAR ?auto_269954 ) ( IS-CRATE ?auto_269955 ) ( not ( = ?auto_269954 ?auto_269955 ) ) ( AVAILABLE ?auto_269956 ) ( IN ?auto_269955 ?auto_269958 ) ( ON ?auto_269954 ?auto_269953 ) ( not ( = ?auto_269953 ?auto_269954 ) ) ( not ( = ?auto_269953 ?auto_269955 ) ) ( TRUCK-AT ?auto_269958 ?auto_269957 ) ( not ( = ?auto_269957 ?auto_269959 ) ) ( ON ?auto_269949 ?auto_269948 ) ( ON ?auto_269950 ?auto_269949 ) ( ON ?auto_269952 ?auto_269950 ) ( ON ?auto_269951 ?auto_269952 ) ( ON ?auto_269953 ?auto_269951 ) ( not ( = ?auto_269948 ?auto_269949 ) ) ( not ( = ?auto_269948 ?auto_269950 ) ) ( not ( = ?auto_269948 ?auto_269952 ) ) ( not ( = ?auto_269948 ?auto_269951 ) ) ( not ( = ?auto_269948 ?auto_269953 ) ) ( not ( = ?auto_269948 ?auto_269954 ) ) ( not ( = ?auto_269948 ?auto_269955 ) ) ( not ( = ?auto_269949 ?auto_269950 ) ) ( not ( = ?auto_269949 ?auto_269952 ) ) ( not ( = ?auto_269949 ?auto_269951 ) ) ( not ( = ?auto_269949 ?auto_269953 ) ) ( not ( = ?auto_269949 ?auto_269954 ) ) ( not ( = ?auto_269949 ?auto_269955 ) ) ( not ( = ?auto_269950 ?auto_269952 ) ) ( not ( = ?auto_269950 ?auto_269951 ) ) ( not ( = ?auto_269950 ?auto_269953 ) ) ( not ( = ?auto_269950 ?auto_269954 ) ) ( not ( = ?auto_269950 ?auto_269955 ) ) ( not ( = ?auto_269952 ?auto_269951 ) ) ( not ( = ?auto_269952 ?auto_269953 ) ) ( not ( = ?auto_269952 ?auto_269954 ) ) ( not ( = ?auto_269952 ?auto_269955 ) ) ( not ( = ?auto_269951 ?auto_269953 ) ) ( not ( = ?auto_269951 ?auto_269954 ) ) ( not ( = ?auto_269951 ?auto_269955 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_269953 ?auto_269954 ?auto_269955 )
      ( MAKE-7CRATE-VERIFY ?auto_269948 ?auto_269949 ?auto_269950 ?auto_269952 ?auto_269951 ?auto_269953 ?auto_269954 ?auto_269955 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_270018 - SURFACE
      ?auto_270019 - SURFACE
      ?auto_270020 - SURFACE
      ?auto_270022 - SURFACE
      ?auto_270021 - SURFACE
      ?auto_270023 - SURFACE
      ?auto_270024 - SURFACE
      ?auto_270025 - SURFACE
    )
    :vars
    (
      ?auto_270026 - HOIST
      ?auto_270027 - PLACE
      ?auto_270030 - TRUCK
      ?auto_270029 - PLACE
      ?auto_270028 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_270026 ?auto_270027 ) ( SURFACE-AT ?auto_270024 ?auto_270027 ) ( CLEAR ?auto_270024 ) ( IS-CRATE ?auto_270025 ) ( not ( = ?auto_270024 ?auto_270025 ) ) ( AVAILABLE ?auto_270026 ) ( ON ?auto_270024 ?auto_270023 ) ( not ( = ?auto_270023 ?auto_270024 ) ) ( not ( = ?auto_270023 ?auto_270025 ) ) ( TRUCK-AT ?auto_270030 ?auto_270029 ) ( not ( = ?auto_270029 ?auto_270027 ) ) ( HOIST-AT ?auto_270028 ?auto_270029 ) ( LIFTING ?auto_270028 ?auto_270025 ) ( not ( = ?auto_270026 ?auto_270028 ) ) ( ON ?auto_270019 ?auto_270018 ) ( ON ?auto_270020 ?auto_270019 ) ( ON ?auto_270022 ?auto_270020 ) ( ON ?auto_270021 ?auto_270022 ) ( ON ?auto_270023 ?auto_270021 ) ( not ( = ?auto_270018 ?auto_270019 ) ) ( not ( = ?auto_270018 ?auto_270020 ) ) ( not ( = ?auto_270018 ?auto_270022 ) ) ( not ( = ?auto_270018 ?auto_270021 ) ) ( not ( = ?auto_270018 ?auto_270023 ) ) ( not ( = ?auto_270018 ?auto_270024 ) ) ( not ( = ?auto_270018 ?auto_270025 ) ) ( not ( = ?auto_270019 ?auto_270020 ) ) ( not ( = ?auto_270019 ?auto_270022 ) ) ( not ( = ?auto_270019 ?auto_270021 ) ) ( not ( = ?auto_270019 ?auto_270023 ) ) ( not ( = ?auto_270019 ?auto_270024 ) ) ( not ( = ?auto_270019 ?auto_270025 ) ) ( not ( = ?auto_270020 ?auto_270022 ) ) ( not ( = ?auto_270020 ?auto_270021 ) ) ( not ( = ?auto_270020 ?auto_270023 ) ) ( not ( = ?auto_270020 ?auto_270024 ) ) ( not ( = ?auto_270020 ?auto_270025 ) ) ( not ( = ?auto_270022 ?auto_270021 ) ) ( not ( = ?auto_270022 ?auto_270023 ) ) ( not ( = ?auto_270022 ?auto_270024 ) ) ( not ( = ?auto_270022 ?auto_270025 ) ) ( not ( = ?auto_270021 ?auto_270023 ) ) ( not ( = ?auto_270021 ?auto_270024 ) ) ( not ( = ?auto_270021 ?auto_270025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_270023 ?auto_270024 ?auto_270025 )
      ( MAKE-7CRATE-VERIFY ?auto_270018 ?auto_270019 ?auto_270020 ?auto_270022 ?auto_270021 ?auto_270023 ?auto_270024 ?auto_270025 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_270095 - SURFACE
      ?auto_270096 - SURFACE
      ?auto_270097 - SURFACE
      ?auto_270099 - SURFACE
      ?auto_270098 - SURFACE
      ?auto_270100 - SURFACE
      ?auto_270101 - SURFACE
      ?auto_270102 - SURFACE
    )
    :vars
    (
      ?auto_270104 - HOIST
      ?auto_270103 - PLACE
      ?auto_270107 - TRUCK
      ?auto_270105 - PLACE
      ?auto_270106 - HOIST
      ?auto_270108 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_270104 ?auto_270103 ) ( SURFACE-AT ?auto_270101 ?auto_270103 ) ( CLEAR ?auto_270101 ) ( IS-CRATE ?auto_270102 ) ( not ( = ?auto_270101 ?auto_270102 ) ) ( AVAILABLE ?auto_270104 ) ( ON ?auto_270101 ?auto_270100 ) ( not ( = ?auto_270100 ?auto_270101 ) ) ( not ( = ?auto_270100 ?auto_270102 ) ) ( TRUCK-AT ?auto_270107 ?auto_270105 ) ( not ( = ?auto_270105 ?auto_270103 ) ) ( HOIST-AT ?auto_270106 ?auto_270105 ) ( not ( = ?auto_270104 ?auto_270106 ) ) ( AVAILABLE ?auto_270106 ) ( SURFACE-AT ?auto_270102 ?auto_270105 ) ( ON ?auto_270102 ?auto_270108 ) ( CLEAR ?auto_270102 ) ( not ( = ?auto_270101 ?auto_270108 ) ) ( not ( = ?auto_270102 ?auto_270108 ) ) ( not ( = ?auto_270100 ?auto_270108 ) ) ( ON ?auto_270096 ?auto_270095 ) ( ON ?auto_270097 ?auto_270096 ) ( ON ?auto_270099 ?auto_270097 ) ( ON ?auto_270098 ?auto_270099 ) ( ON ?auto_270100 ?auto_270098 ) ( not ( = ?auto_270095 ?auto_270096 ) ) ( not ( = ?auto_270095 ?auto_270097 ) ) ( not ( = ?auto_270095 ?auto_270099 ) ) ( not ( = ?auto_270095 ?auto_270098 ) ) ( not ( = ?auto_270095 ?auto_270100 ) ) ( not ( = ?auto_270095 ?auto_270101 ) ) ( not ( = ?auto_270095 ?auto_270102 ) ) ( not ( = ?auto_270095 ?auto_270108 ) ) ( not ( = ?auto_270096 ?auto_270097 ) ) ( not ( = ?auto_270096 ?auto_270099 ) ) ( not ( = ?auto_270096 ?auto_270098 ) ) ( not ( = ?auto_270096 ?auto_270100 ) ) ( not ( = ?auto_270096 ?auto_270101 ) ) ( not ( = ?auto_270096 ?auto_270102 ) ) ( not ( = ?auto_270096 ?auto_270108 ) ) ( not ( = ?auto_270097 ?auto_270099 ) ) ( not ( = ?auto_270097 ?auto_270098 ) ) ( not ( = ?auto_270097 ?auto_270100 ) ) ( not ( = ?auto_270097 ?auto_270101 ) ) ( not ( = ?auto_270097 ?auto_270102 ) ) ( not ( = ?auto_270097 ?auto_270108 ) ) ( not ( = ?auto_270099 ?auto_270098 ) ) ( not ( = ?auto_270099 ?auto_270100 ) ) ( not ( = ?auto_270099 ?auto_270101 ) ) ( not ( = ?auto_270099 ?auto_270102 ) ) ( not ( = ?auto_270099 ?auto_270108 ) ) ( not ( = ?auto_270098 ?auto_270100 ) ) ( not ( = ?auto_270098 ?auto_270101 ) ) ( not ( = ?auto_270098 ?auto_270102 ) ) ( not ( = ?auto_270098 ?auto_270108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_270100 ?auto_270101 ?auto_270102 )
      ( MAKE-7CRATE-VERIFY ?auto_270095 ?auto_270096 ?auto_270097 ?auto_270099 ?auto_270098 ?auto_270100 ?auto_270101 ?auto_270102 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_270173 - SURFACE
      ?auto_270174 - SURFACE
      ?auto_270175 - SURFACE
      ?auto_270177 - SURFACE
      ?auto_270176 - SURFACE
      ?auto_270178 - SURFACE
      ?auto_270179 - SURFACE
      ?auto_270180 - SURFACE
    )
    :vars
    (
      ?auto_270186 - HOIST
      ?auto_270182 - PLACE
      ?auto_270181 - PLACE
      ?auto_270184 - HOIST
      ?auto_270183 - SURFACE
      ?auto_270185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_270186 ?auto_270182 ) ( SURFACE-AT ?auto_270179 ?auto_270182 ) ( CLEAR ?auto_270179 ) ( IS-CRATE ?auto_270180 ) ( not ( = ?auto_270179 ?auto_270180 ) ) ( AVAILABLE ?auto_270186 ) ( ON ?auto_270179 ?auto_270178 ) ( not ( = ?auto_270178 ?auto_270179 ) ) ( not ( = ?auto_270178 ?auto_270180 ) ) ( not ( = ?auto_270181 ?auto_270182 ) ) ( HOIST-AT ?auto_270184 ?auto_270181 ) ( not ( = ?auto_270186 ?auto_270184 ) ) ( AVAILABLE ?auto_270184 ) ( SURFACE-AT ?auto_270180 ?auto_270181 ) ( ON ?auto_270180 ?auto_270183 ) ( CLEAR ?auto_270180 ) ( not ( = ?auto_270179 ?auto_270183 ) ) ( not ( = ?auto_270180 ?auto_270183 ) ) ( not ( = ?auto_270178 ?auto_270183 ) ) ( TRUCK-AT ?auto_270185 ?auto_270182 ) ( ON ?auto_270174 ?auto_270173 ) ( ON ?auto_270175 ?auto_270174 ) ( ON ?auto_270177 ?auto_270175 ) ( ON ?auto_270176 ?auto_270177 ) ( ON ?auto_270178 ?auto_270176 ) ( not ( = ?auto_270173 ?auto_270174 ) ) ( not ( = ?auto_270173 ?auto_270175 ) ) ( not ( = ?auto_270173 ?auto_270177 ) ) ( not ( = ?auto_270173 ?auto_270176 ) ) ( not ( = ?auto_270173 ?auto_270178 ) ) ( not ( = ?auto_270173 ?auto_270179 ) ) ( not ( = ?auto_270173 ?auto_270180 ) ) ( not ( = ?auto_270173 ?auto_270183 ) ) ( not ( = ?auto_270174 ?auto_270175 ) ) ( not ( = ?auto_270174 ?auto_270177 ) ) ( not ( = ?auto_270174 ?auto_270176 ) ) ( not ( = ?auto_270174 ?auto_270178 ) ) ( not ( = ?auto_270174 ?auto_270179 ) ) ( not ( = ?auto_270174 ?auto_270180 ) ) ( not ( = ?auto_270174 ?auto_270183 ) ) ( not ( = ?auto_270175 ?auto_270177 ) ) ( not ( = ?auto_270175 ?auto_270176 ) ) ( not ( = ?auto_270175 ?auto_270178 ) ) ( not ( = ?auto_270175 ?auto_270179 ) ) ( not ( = ?auto_270175 ?auto_270180 ) ) ( not ( = ?auto_270175 ?auto_270183 ) ) ( not ( = ?auto_270177 ?auto_270176 ) ) ( not ( = ?auto_270177 ?auto_270178 ) ) ( not ( = ?auto_270177 ?auto_270179 ) ) ( not ( = ?auto_270177 ?auto_270180 ) ) ( not ( = ?auto_270177 ?auto_270183 ) ) ( not ( = ?auto_270176 ?auto_270178 ) ) ( not ( = ?auto_270176 ?auto_270179 ) ) ( not ( = ?auto_270176 ?auto_270180 ) ) ( not ( = ?auto_270176 ?auto_270183 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_270178 ?auto_270179 ?auto_270180 )
      ( MAKE-7CRATE-VERIFY ?auto_270173 ?auto_270174 ?auto_270175 ?auto_270177 ?auto_270176 ?auto_270178 ?auto_270179 ?auto_270180 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_270251 - SURFACE
      ?auto_270252 - SURFACE
      ?auto_270253 - SURFACE
      ?auto_270255 - SURFACE
      ?auto_270254 - SURFACE
      ?auto_270256 - SURFACE
      ?auto_270257 - SURFACE
      ?auto_270258 - SURFACE
    )
    :vars
    (
      ?auto_270262 - HOIST
      ?auto_270259 - PLACE
      ?auto_270263 - PLACE
      ?auto_270260 - HOIST
      ?auto_270264 - SURFACE
      ?auto_270261 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_270262 ?auto_270259 ) ( IS-CRATE ?auto_270258 ) ( not ( = ?auto_270257 ?auto_270258 ) ) ( not ( = ?auto_270256 ?auto_270257 ) ) ( not ( = ?auto_270256 ?auto_270258 ) ) ( not ( = ?auto_270263 ?auto_270259 ) ) ( HOIST-AT ?auto_270260 ?auto_270263 ) ( not ( = ?auto_270262 ?auto_270260 ) ) ( AVAILABLE ?auto_270260 ) ( SURFACE-AT ?auto_270258 ?auto_270263 ) ( ON ?auto_270258 ?auto_270264 ) ( CLEAR ?auto_270258 ) ( not ( = ?auto_270257 ?auto_270264 ) ) ( not ( = ?auto_270258 ?auto_270264 ) ) ( not ( = ?auto_270256 ?auto_270264 ) ) ( TRUCK-AT ?auto_270261 ?auto_270259 ) ( SURFACE-AT ?auto_270256 ?auto_270259 ) ( CLEAR ?auto_270256 ) ( LIFTING ?auto_270262 ?auto_270257 ) ( IS-CRATE ?auto_270257 ) ( ON ?auto_270252 ?auto_270251 ) ( ON ?auto_270253 ?auto_270252 ) ( ON ?auto_270255 ?auto_270253 ) ( ON ?auto_270254 ?auto_270255 ) ( ON ?auto_270256 ?auto_270254 ) ( not ( = ?auto_270251 ?auto_270252 ) ) ( not ( = ?auto_270251 ?auto_270253 ) ) ( not ( = ?auto_270251 ?auto_270255 ) ) ( not ( = ?auto_270251 ?auto_270254 ) ) ( not ( = ?auto_270251 ?auto_270256 ) ) ( not ( = ?auto_270251 ?auto_270257 ) ) ( not ( = ?auto_270251 ?auto_270258 ) ) ( not ( = ?auto_270251 ?auto_270264 ) ) ( not ( = ?auto_270252 ?auto_270253 ) ) ( not ( = ?auto_270252 ?auto_270255 ) ) ( not ( = ?auto_270252 ?auto_270254 ) ) ( not ( = ?auto_270252 ?auto_270256 ) ) ( not ( = ?auto_270252 ?auto_270257 ) ) ( not ( = ?auto_270252 ?auto_270258 ) ) ( not ( = ?auto_270252 ?auto_270264 ) ) ( not ( = ?auto_270253 ?auto_270255 ) ) ( not ( = ?auto_270253 ?auto_270254 ) ) ( not ( = ?auto_270253 ?auto_270256 ) ) ( not ( = ?auto_270253 ?auto_270257 ) ) ( not ( = ?auto_270253 ?auto_270258 ) ) ( not ( = ?auto_270253 ?auto_270264 ) ) ( not ( = ?auto_270255 ?auto_270254 ) ) ( not ( = ?auto_270255 ?auto_270256 ) ) ( not ( = ?auto_270255 ?auto_270257 ) ) ( not ( = ?auto_270255 ?auto_270258 ) ) ( not ( = ?auto_270255 ?auto_270264 ) ) ( not ( = ?auto_270254 ?auto_270256 ) ) ( not ( = ?auto_270254 ?auto_270257 ) ) ( not ( = ?auto_270254 ?auto_270258 ) ) ( not ( = ?auto_270254 ?auto_270264 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_270256 ?auto_270257 ?auto_270258 )
      ( MAKE-7CRATE-VERIFY ?auto_270251 ?auto_270252 ?auto_270253 ?auto_270255 ?auto_270254 ?auto_270256 ?auto_270257 ?auto_270258 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_270329 - SURFACE
      ?auto_270330 - SURFACE
      ?auto_270331 - SURFACE
      ?auto_270333 - SURFACE
      ?auto_270332 - SURFACE
      ?auto_270334 - SURFACE
      ?auto_270335 - SURFACE
      ?auto_270336 - SURFACE
    )
    :vars
    (
      ?auto_270341 - HOIST
      ?auto_270337 - PLACE
      ?auto_270338 - PLACE
      ?auto_270339 - HOIST
      ?auto_270340 - SURFACE
      ?auto_270342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_270341 ?auto_270337 ) ( IS-CRATE ?auto_270336 ) ( not ( = ?auto_270335 ?auto_270336 ) ) ( not ( = ?auto_270334 ?auto_270335 ) ) ( not ( = ?auto_270334 ?auto_270336 ) ) ( not ( = ?auto_270338 ?auto_270337 ) ) ( HOIST-AT ?auto_270339 ?auto_270338 ) ( not ( = ?auto_270341 ?auto_270339 ) ) ( AVAILABLE ?auto_270339 ) ( SURFACE-AT ?auto_270336 ?auto_270338 ) ( ON ?auto_270336 ?auto_270340 ) ( CLEAR ?auto_270336 ) ( not ( = ?auto_270335 ?auto_270340 ) ) ( not ( = ?auto_270336 ?auto_270340 ) ) ( not ( = ?auto_270334 ?auto_270340 ) ) ( TRUCK-AT ?auto_270342 ?auto_270337 ) ( SURFACE-AT ?auto_270334 ?auto_270337 ) ( CLEAR ?auto_270334 ) ( IS-CRATE ?auto_270335 ) ( AVAILABLE ?auto_270341 ) ( IN ?auto_270335 ?auto_270342 ) ( ON ?auto_270330 ?auto_270329 ) ( ON ?auto_270331 ?auto_270330 ) ( ON ?auto_270333 ?auto_270331 ) ( ON ?auto_270332 ?auto_270333 ) ( ON ?auto_270334 ?auto_270332 ) ( not ( = ?auto_270329 ?auto_270330 ) ) ( not ( = ?auto_270329 ?auto_270331 ) ) ( not ( = ?auto_270329 ?auto_270333 ) ) ( not ( = ?auto_270329 ?auto_270332 ) ) ( not ( = ?auto_270329 ?auto_270334 ) ) ( not ( = ?auto_270329 ?auto_270335 ) ) ( not ( = ?auto_270329 ?auto_270336 ) ) ( not ( = ?auto_270329 ?auto_270340 ) ) ( not ( = ?auto_270330 ?auto_270331 ) ) ( not ( = ?auto_270330 ?auto_270333 ) ) ( not ( = ?auto_270330 ?auto_270332 ) ) ( not ( = ?auto_270330 ?auto_270334 ) ) ( not ( = ?auto_270330 ?auto_270335 ) ) ( not ( = ?auto_270330 ?auto_270336 ) ) ( not ( = ?auto_270330 ?auto_270340 ) ) ( not ( = ?auto_270331 ?auto_270333 ) ) ( not ( = ?auto_270331 ?auto_270332 ) ) ( not ( = ?auto_270331 ?auto_270334 ) ) ( not ( = ?auto_270331 ?auto_270335 ) ) ( not ( = ?auto_270331 ?auto_270336 ) ) ( not ( = ?auto_270331 ?auto_270340 ) ) ( not ( = ?auto_270333 ?auto_270332 ) ) ( not ( = ?auto_270333 ?auto_270334 ) ) ( not ( = ?auto_270333 ?auto_270335 ) ) ( not ( = ?auto_270333 ?auto_270336 ) ) ( not ( = ?auto_270333 ?auto_270340 ) ) ( not ( = ?auto_270332 ?auto_270334 ) ) ( not ( = ?auto_270332 ?auto_270335 ) ) ( not ( = ?auto_270332 ?auto_270336 ) ) ( not ( = ?auto_270332 ?auto_270340 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_270334 ?auto_270335 ?auto_270336 )
      ( MAKE-7CRATE-VERIFY ?auto_270329 ?auto_270330 ?auto_270331 ?auto_270333 ?auto_270332 ?auto_270334 ?auto_270335 ?auto_270336 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_273248 - SURFACE
      ?auto_273249 - SURFACE
      ?auto_273250 - SURFACE
      ?auto_273252 - SURFACE
      ?auto_273251 - SURFACE
      ?auto_273253 - SURFACE
      ?auto_273254 - SURFACE
      ?auto_273255 - SURFACE
      ?auto_273256 - SURFACE
    )
    :vars
    (
      ?auto_273257 - HOIST
      ?auto_273258 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_273257 ?auto_273258 ) ( SURFACE-AT ?auto_273255 ?auto_273258 ) ( CLEAR ?auto_273255 ) ( LIFTING ?auto_273257 ?auto_273256 ) ( IS-CRATE ?auto_273256 ) ( not ( = ?auto_273255 ?auto_273256 ) ) ( ON ?auto_273249 ?auto_273248 ) ( ON ?auto_273250 ?auto_273249 ) ( ON ?auto_273252 ?auto_273250 ) ( ON ?auto_273251 ?auto_273252 ) ( ON ?auto_273253 ?auto_273251 ) ( ON ?auto_273254 ?auto_273253 ) ( ON ?auto_273255 ?auto_273254 ) ( not ( = ?auto_273248 ?auto_273249 ) ) ( not ( = ?auto_273248 ?auto_273250 ) ) ( not ( = ?auto_273248 ?auto_273252 ) ) ( not ( = ?auto_273248 ?auto_273251 ) ) ( not ( = ?auto_273248 ?auto_273253 ) ) ( not ( = ?auto_273248 ?auto_273254 ) ) ( not ( = ?auto_273248 ?auto_273255 ) ) ( not ( = ?auto_273248 ?auto_273256 ) ) ( not ( = ?auto_273249 ?auto_273250 ) ) ( not ( = ?auto_273249 ?auto_273252 ) ) ( not ( = ?auto_273249 ?auto_273251 ) ) ( not ( = ?auto_273249 ?auto_273253 ) ) ( not ( = ?auto_273249 ?auto_273254 ) ) ( not ( = ?auto_273249 ?auto_273255 ) ) ( not ( = ?auto_273249 ?auto_273256 ) ) ( not ( = ?auto_273250 ?auto_273252 ) ) ( not ( = ?auto_273250 ?auto_273251 ) ) ( not ( = ?auto_273250 ?auto_273253 ) ) ( not ( = ?auto_273250 ?auto_273254 ) ) ( not ( = ?auto_273250 ?auto_273255 ) ) ( not ( = ?auto_273250 ?auto_273256 ) ) ( not ( = ?auto_273252 ?auto_273251 ) ) ( not ( = ?auto_273252 ?auto_273253 ) ) ( not ( = ?auto_273252 ?auto_273254 ) ) ( not ( = ?auto_273252 ?auto_273255 ) ) ( not ( = ?auto_273252 ?auto_273256 ) ) ( not ( = ?auto_273251 ?auto_273253 ) ) ( not ( = ?auto_273251 ?auto_273254 ) ) ( not ( = ?auto_273251 ?auto_273255 ) ) ( not ( = ?auto_273251 ?auto_273256 ) ) ( not ( = ?auto_273253 ?auto_273254 ) ) ( not ( = ?auto_273253 ?auto_273255 ) ) ( not ( = ?auto_273253 ?auto_273256 ) ) ( not ( = ?auto_273254 ?auto_273255 ) ) ( not ( = ?auto_273254 ?auto_273256 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_273255 ?auto_273256 )
      ( MAKE-8CRATE-VERIFY ?auto_273248 ?auto_273249 ?auto_273250 ?auto_273252 ?auto_273251 ?auto_273253 ?auto_273254 ?auto_273255 ?auto_273256 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_273315 - SURFACE
      ?auto_273316 - SURFACE
      ?auto_273317 - SURFACE
      ?auto_273319 - SURFACE
      ?auto_273318 - SURFACE
      ?auto_273320 - SURFACE
      ?auto_273321 - SURFACE
      ?auto_273322 - SURFACE
      ?auto_273323 - SURFACE
    )
    :vars
    (
      ?auto_273324 - HOIST
      ?auto_273326 - PLACE
      ?auto_273325 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_273324 ?auto_273326 ) ( SURFACE-AT ?auto_273322 ?auto_273326 ) ( CLEAR ?auto_273322 ) ( IS-CRATE ?auto_273323 ) ( not ( = ?auto_273322 ?auto_273323 ) ) ( TRUCK-AT ?auto_273325 ?auto_273326 ) ( AVAILABLE ?auto_273324 ) ( IN ?auto_273323 ?auto_273325 ) ( ON ?auto_273322 ?auto_273321 ) ( not ( = ?auto_273321 ?auto_273322 ) ) ( not ( = ?auto_273321 ?auto_273323 ) ) ( ON ?auto_273316 ?auto_273315 ) ( ON ?auto_273317 ?auto_273316 ) ( ON ?auto_273319 ?auto_273317 ) ( ON ?auto_273318 ?auto_273319 ) ( ON ?auto_273320 ?auto_273318 ) ( ON ?auto_273321 ?auto_273320 ) ( not ( = ?auto_273315 ?auto_273316 ) ) ( not ( = ?auto_273315 ?auto_273317 ) ) ( not ( = ?auto_273315 ?auto_273319 ) ) ( not ( = ?auto_273315 ?auto_273318 ) ) ( not ( = ?auto_273315 ?auto_273320 ) ) ( not ( = ?auto_273315 ?auto_273321 ) ) ( not ( = ?auto_273315 ?auto_273322 ) ) ( not ( = ?auto_273315 ?auto_273323 ) ) ( not ( = ?auto_273316 ?auto_273317 ) ) ( not ( = ?auto_273316 ?auto_273319 ) ) ( not ( = ?auto_273316 ?auto_273318 ) ) ( not ( = ?auto_273316 ?auto_273320 ) ) ( not ( = ?auto_273316 ?auto_273321 ) ) ( not ( = ?auto_273316 ?auto_273322 ) ) ( not ( = ?auto_273316 ?auto_273323 ) ) ( not ( = ?auto_273317 ?auto_273319 ) ) ( not ( = ?auto_273317 ?auto_273318 ) ) ( not ( = ?auto_273317 ?auto_273320 ) ) ( not ( = ?auto_273317 ?auto_273321 ) ) ( not ( = ?auto_273317 ?auto_273322 ) ) ( not ( = ?auto_273317 ?auto_273323 ) ) ( not ( = ?auto_273319 ?auto_273318 ) ) ( not ( = ?auto_273319 ?auto_273320 ) ) ( not ( = ?auto_273319 ?auto_273321 ) ) ( not ( = ?auto_273319 ?auto_273322 ) ) ( not ( = ?auto_273319 ?auto_273323 ) ) ( not ( = ?auto_273318 ?auto_273320 ) ) ( not ( = ?auto_273318 ?auto_273321 ) ) ( not ( = ?auto_273318 ?auto_273322 ) ) ( not ( = ?auto_273318 ?auto_273323 ) ) ( not ( = ?auto_273320 ?auto_273321 ) ) ( not ( = ?auto_273320 ?auto_273322 ) ) ( not ( = ?auto_273320 ?auto_273323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_273321 ?auto_273322 ?auto_273323 )
      ( MAKE-8CRATE-VERIFY ?auto_273315 ?auto_273316 ?auto_273317 ?auto_273319 ?auto_273318 ?auto_273320 ?auto_273321 ?auto_273322 ?auto_273323 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_273391 - SURFACE
      ?auto_273392 - SURFACE
      ?auto_273393 - SURFACE
      ?auto_273395 - SURFACE
      ?auto_273394 - SURFACE
      ?auto_273396 - SURFACE
      ?auto_273397 - SURFACE
      ?auto_273398 - SURFACE
      ?auto_273399 - SURFACE
    )
    :vars
    (
      ?auto_273401 - HOIST
      ?auto_273402 - PLACE
      ?auto_273403 - TRUCK
      ?auto_273400 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_273401 ?auto_273402 ) ( SURFACE-AT ?auto_273398 ?auto_273402 ) ( CLEAR ?auto_273398 ) ( IS-CRATE ?auto_273399 ) ( not ( = ?auto_273398 ?auto_273399 ) ) ( AVAILABLE ?auto_273401 ) ( IN ?auto_273399 ?auto_273403 ) ( ON ?auto_273398 ?auto_273397 ) ( not ( = ?auto_273397 ?auto_273398 ) ) ( not ( = ?auto_273397 ?auto_273399 ) ) ( TRUCK-AT ?auto_273403 ?auto_273400 ) ( not ( = ?auto_273400 ?auto_273402 ) ) ( ON ?auto_273392 ?auto_273391 ) ( ON ?auto_273393 ?auto_273392 ) ( ON ?auto_273395 ?auto_273393 ) ( ON ?auto_273394 ?auto_273395 ) ( ON ?auto_273396 ?auto_273394 ) ( ON ?auto_273397 ?auto_273396 ) ( not ( = ?auto_273391 ?auto_273392 ) ) ( not ( = ?auto_273391 ?auto_273393 ) ) ( not ( = ?auto_273391 ?auto_273395 ) ) ( not ( = ?auto_273391 ?auto_273394 ) ) ( not ( = ?auto_273391 ?auto_273396 ) ) ( not ( = ?auto_273391 ?auto_273397 ) ) ( not ( = ?auto_273391 ?auto_273398 ) ) ( not ( = ?auto_273391 ?auto_273399 ) ) ( not ( = ?auto_273392 ?auto_273393 ) ) ( not ( = ?auto_273392 ?auto_273395 ) ) ( not ( = ?auto_273392 ?auto_273394 ) ) ( not ( = ?auto_273392 ?auto_273396 ) ) ( not ( = ?auto_273392 ?auto_273397 ) ) ( not ( = ?auto_273392 ?auto_273398 ) ) ( not ( = ?auto_273392 ?auto_273399 ) ) ( not ( = ?auto_273393 ?auto_273395 ) ) ( not ( = ?auto_273393 ?auto_273394 ) ) ( not ( = ?auto_273393 ?auto_273396 ) ) ( not ( = ?auto_273393 ?auto_273397 ) ) ( not ( = ?auto_273393 ?auto_273398 ) ) ( not ( = ?auto_273393 ?auto_273399 ) ) ( not ( = ?auto_273395 ?auto_273394 ) ) ( not ( = ?auto_273395 ?auto_273396 ) ) ( not ( = ?auto_273395 ?auto_273397 ) ) ( not ( = ?auto_273395 ?auto_273398 ) ) ( not ( = ?auto_273395 ?auto_273399 ) ) ( not ( = ?auto_273394 ?auto_273396 ) ) ( not ( = ?auto_273394 ?auto_273397 ) ) ( not ( = ?auto_273394 ?auto_273398 ) ) ( not ( = ?auto_273394 ?auto_273399 ) ) ( not ( = ?auto_273396 ?auto_273397 ) ) ( not ( = ?auto_273396 ?auto_273398 ) ) ( not ( = ?auto_273396 ?auto_273399 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_273397 ?auto_273398 ?auto_273399 )
      ( MAKE-8CRATE-VERIFY ?auto_273391 ?auto_273392 ?auto_273393 ?auto_273395 ?auto_273394 ?auto_273396 ?auto_273397 ?auto_273398 ?auto_273399 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_273475 - SURFACE
      ?auto_273476 - SURFACE
      ?auto_273477 - SURFACE
      ?auto_273479 - SURFACE
      ?auto_273478 - SURFACE
      ?auto_273480 - SURFACE
      ?auto_273481 - SURFACE
      ?auto_273482 - SURFACE
      ?auto_273483 - SURFACE
    )
    :vars
    (
      ?auto_273487 - HOIST
      ?auto_273488 - PLACE
      ?auto_273486 - TRUCK
      ?auto_273484 - PLACE
      ?auto_273485 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_273487 ?auto_273488 ) ( SURFACE-AT ?auto_273482 ?auto_273488 ) ( CLEAR ?auto_273482 ) ( IS-CRATE ?auto_273483 ) ( not ( = ?auto_273482 ?auto_273483 ) ) ( AVAILABLE ?auto_273487 ) ( ON ?auto_273482 ?auto_273481 ) ( not ( = ?auto_273481 ?auto_273482 ) ) ( not ( = ?auto_273481 ?auto_273483 ) ) ( TRUCK-AT ?auto_273486 ?auto_273484 ) ( not ( = ?auto_273484 ?auto_273488 ) ) ( HOIST-AT ?auto_273485 ?auto_273484 ) ( LIFTING ?auto_273485 ?auto_273483 ) ( not ( = ?auto_273487 ?auto_273485 ) ) ( ON ?auto_273476 ?auto_273475 ) ( ON ?auto_273477 ?auto_273476 ) ( ON ?auto_273479 ?auto_273477 ) ( ON ?auto_273478 ?auto_273479 ) ( ON ?auto_273480 ?auto_273478 ) ( ON ?auto_273481 ?auto_273480 ) ( not ( = ?auto_273475 ?auto_273476 ) ) ( not ( = ?auto_273475 ?auto_273477 ) ) ( not ( = ?auto_273475 ?auto_273479 ) ) ( not ( = ?auto_273475 ?auto_273478 ) ) ( not ( = ?auto_273475 ?auto_273480 ) ) ( not ( = ?auto_273475 ?auto_273481 ) ) ( not ( = ?auto_273475 ?auto_273482 ) ) ( not ( = ?auto_273475 ?auto_273483 ) ) ( not ( = ?auto_273476 ?auto_273477 ) ) ( not ( = ?auto_273476 ?auto_273479 ) ) ( not ( = ?auto_273476 ?auto_273478 ) ) ( not ( = ?auto_273476 ?auto_273480 ) ) ( not ( = ?auto_273476 ?auto_273481 ) ) ( not ( = ?auto_273476 ?auto_273482 ) ) ( not ( = ?auto_273476 ?auto_273483 ) ) ( not ( = ?auto_273477 ?auto_273479 ) ) ( not ( = ?auto_273477 ?auto_273478 ) ) ( not ( = ?auto_273477 ?auto_273480 ) ) ( not ( = ?auto_273477 ?auto_273481 ) ) ( not ( = ?auto_273477 ?auto_273482 ) ) ( not ( = ?auto_273477 ?auto_273483 ) ) ( not ( = ?auto_273479 ?auto_273478 ) ) ( not ( = ?auto_273479 ?auto_273480 ) ) ( not ( = ?auto_273479 ?auto_273481 ) ) ( not ( = ?auto_273479 ?auto_273482 ) ) ( not ( = ?auto_273479 ?auto_273483 ) ) ( not ( = ?auto_273478 ?auto_273480 ) ) ( not ( = ?auto_273478 ?auto_273481 ) ) ( not ( = ?auto_273478 ?auto_273482 ) ) ( not ( = ?auto_273478 ?auto_273483 ) ) ( not ( = ?auto_273480 ?auto_273481 ) ) ( not ( = ?auto_273480 ?auto_273482 ) ) ( not ( = ?auto_273480 ?auto_273483 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_273481 ?auto_273482 ?auto_273483 )
      ( MAKE-8CRATE-VERIFY ?auto_273475 ?auto_273476 ?auto_273477 ?auto_273479 ?auto_273478 ?auto_273480 ?auto_273481 ?auto_273482 ?auto_273483 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_273567 - SURFACE
      ?auto_273568 - SURFACE
      ?auto_273569 - SURFACE
      ?auto_273571 - SURFACE
      ?auto_273570 - SURFACE
      ?auto_273572 - SURFACE
      ?auto_273573 - SURFACE
      ?auto_273574 - SURFACE
      ?auto_273575 - SURFACE
    )
    :vars
    (
      ?auto_273581 - HOIST
      ?auto_273580 - PLACE
      ?auto_273576 - TRUCK
      ?auto_273579 - PLACE
      ?auto_273578 - HOIST
      ?auto_273577 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_273581 ?auto_273580 ) ( SURFACE-AT ?auto_273574 ?auto_273580 ) ( CLEAR ?auto_273574 ) ( IS-CRATE ?auto_273575 ) ( not ( = ?auto_273574 ?auto_273575 ) ) ( AVAILABLE ?auto_273581 ) ( ON ?auto_273574 ?auto_273573 ) ( not ( = ?auto_273573 ?auto_273574 ) ) ( not ( = ?auto_273573 ?auto_273575 ) ) ( TRUCK-AT ?auto_273576 ?auto_273579 ) ( not ( = ?auto_273579 ?auto_273580 ) ) ( HOIST-AT ?auto_273578 ?auto_273579 ) ( not ( = ?auto_273581 ?auto_273578 ) ) ( AVAILABLE ?auto_273578 ) ( SURFACE-AT ?auto_273575 ?auto_273579 ) ( ON ?auto_273575 ?auto_273577 ) ( CLEAR ?auto_273575 ) ( not ( = ?auto_273574 ?auto_273577 ) ) ( not ( = ?auto_273575 ?auto_273577 ) ) ( not ( = ?auto_273573 ?auto_273577 ) ) ( ON ?auto_273568 ?auto_273567 ) ( ON ?auto_273569 ?auto_273568 ) ( ON ?auto_273571 ?auto_273569 ) ( ON ?auto_273570 ?auto_273571 ) ( ON ?auto_273572 ?auto_273570 ) ( ON ?auto_273573 ?auto_273572 ) ( not ( = ?auto_273567 ?auto_273568 ) ) ( not ( = ?auto_273567 ?auto_273569 ) ) ( not ( = ?auto_273567 ?auto_273571 ) ) ( not ( = ?auto_273567 ?auto_273570 ) ) ( not ( = ?auto_273567 ?auto_273572 ) ) ( not ( = ?auto_273567 ?auto_273573 ) ) ( not ( = ?auto_273567 ?auto_273574 ) ) ( not ( = ?auto_273567 ?auto_273575 ) ) ( not ( = ?auto_273567 ?auto_273577 ) ) ( not ( = ?auto_273568 ?auto_273569 ) ) ( not ( = ?auto_273568 ?auto_273571 ) ) ( not ( = ?auto_273568 ?auto_273570 ) ) ( not ( = ?auto_273568 ?auto_273572 ) ) ( not ( = ?auto_273568 ?auto_273573 ) ) ( not ( = ?auto_273568 ?auto_273574 ) ) ( not ( = ?auto_273568 ?auto_273575 ) ) ( not ( = ?auto_273568 ?auto_273577 ) ) ( not ( = ?auto_273569 ?auto_273571 ) ) ( not ( = ?auto_273569 ?auto_273570 ) ) ( not ( = ?auto_273569 ?auto_273572 ) ) ( not ( = ?auto_273569 ?auto_273573 ) ) ( not ( = ?auto_273569 ?auto_273574 ) ) ( not ( = ?auto_273569 ?auto_273575 ) ) ( not ( = ?auto_273569 ?auto_273577 ) ) ( not ( = ?auto_273571 ?auto_273570 ) ) ( not ( = ?auto_273571 ?auto_273572 ) ) ( not ( = ?auto_273571 ?auto_273573 ) ) ( not ( = ?auto_273571 ?auto_273574 ) ) ( not ( = ?auto_273571 ?auto_273575 ) ) ( not ( = ?auto_273571 ?auto_273577 ) ) ( not ( = ?auto_273570 ?auto_273572 ) ) ( not ( = ?auto_273570 ?auto_273573 ) ) ( not ( = ?auto_273570 ?auto_273574 ) ) ( not ( = ?auto_273570 ?auto_273575 ) ) ( not ( = ?auto_273570 ?auto_273577 ) ) ( not ( = ?auto_273572 ?auto_273573 ) ) ( not ( = ?auto_273572 ?auto_273574 ) ) ( not ( = ?auto_273572 ?auto_273575 ) ) ( not ( = ?auto_273572 ?auto_273577 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_273573 ?auto_273574 ?auto_273575 )
      ( MAKE-8CRATE-VERIFY ?auto_273567 ?auto_273568 ?auto_273569 ?auto_273571 ?auto_273570 ?auto_273572 ?auto_273573 ?auto_273574 ?auto_273575 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_273660 - SURFACE
      ?auto_273661 - SURFACE
      ?auto_273662 - SURFACE
      ?auto_273664 - SURFACE
      ?auto_273663 - SURFACE
      ?auto_273665 - SURFACE
      ?auto_273666 - SURFACE
      ?auto_273667 - SURFACE
      ?auto_273668 - SURFACE
    )
    :vars
    (
      ?auto_273672 - HOIST
      ?auto_273674 - PLACE
      ?auto_273670 - PLACE
      ?auto_273671 - HOIST
      ?auto_273669 - SURFACE
      ?auto_273673 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_273672 ?auto_273674 ) ( SURFACE-AT ?auto_273667 ?auto_273674 ) ( CLEAR ?auto_273667 ) ( IS-CRATE ?auto_273668 ) ( not ( = ?auto_273667 ?auto_273668 ) ) ( AVAILABLE ?auto_273672 ) ( ON ?auto_273667 ?auto_273666 ) ( not ( = ?auto_273666 ?auto_273667 ) ) ( not ( = ?auto_273666 ?auto_273668 ) ) ( not ( = ?auto_273670 ?auto_273674 ) ) ( HOIST-AT ?auto_273671 ?auto_273670 ) ( not ( = ?auto_273672 ?auto_273671 ) ) ( AVAILABLE ?auto_273671 ) ( SURFACE-AT ?auto_273668 ?auto_273670 ) ( ON ?auto_273668 ?auto_273669 ) ( CLEAR ?auto_273668 ) ( not ( = ?auto_273667 ?auto_273669 ) ) ( not ( = ?auto_273668 ?auto_273669 ) ) ( not ( = ?auto_273666 ?auto_273669 ) ) ( TRUCK-AT ?auto_273673 ?auto_273674 ) ( ON ?auto_273661 ?auto_273660 ) ( ON ?auto_273662 ?auto_273661 ) ( ON ?auto_273664 ?auto_273662 ) ( ON ?auto_273663 ?auto_273664 ) ( ON ?auto_273665 ?auto_273663 ) ( ON ?auto_273666 ?auto_273665 ) ( not ( = ?auto_273660 ?auto_273661 ) ) ( not ( = ?auto_273660 ?auto_273662 ) ) ( not ( = ?auto_273660 ?auto_273664 ) ) ( not ( = ?auto_273660 ?auto_273663 ) ) ( not ( = ?auto_273660 ?auto_273665 ) ) ( not ( = ?auto_273660 ?auto_273666 ) ) ( not ( = ?auto_273660 ?auto_273667 ) ) ( not ( = ?auto_273660 ?auto_273668 ) ) ( not ( = ?auto_273660 ?auto_273669 ) ) ( not ( = ?auto_273661 ?auto_273662 ) ) ( not ( = ?auto_273661 ?auto_273664 ) ) ( not ( = ?auto_273661 ?auto_273663 ) ) ( not ( = ?auto_273661 ?auto_273665 ) ) ( not ( = ?auto_273661 ?auto_273666 ) ) ( not ( = ?auto_273661 ?auto_273667 ) ) ( not ( = ?auto_273661 ?auto_273668 ) ) ( not ( = ?auto_273661 ?auto_273669 ) ) ( not ( = ?auto_273662 ?auto_273664 ) ) ( not ( = ?auto_273662 ?auto_273663 ) ) ( not ( = ?auto_273662 ?auto_273665 ) ) ( not ( = ?auto_273662 ?auto_273666 ) ) ( not ( = ?auto_273662 ?auto_273667 ) ) ( not ( = ?auto_273662 ?auto_273668 ) ) ( not ( = ?auto_273662 ?auto_273669 ) ) ( not ( = ?auto_273664 ?auto_273663 ) ) ( not ( = ?auto_273664 ?auto_273665 ) ) ( not ( = ?auto_273664 ?auto_273666 ) ) ( not ( = ?auto_273664 ?auto_273667 ) ) ( not ( = ?auto_273664 ?auto_273668 ) ) ( not ( = ?auto_273664 ?auto_273669 ) ) ( not ( = ?auto_273663 ?auto_273665 ) ) ( not ( = ?auto_273663 ?auto_273666 ) ) ( not ( = ?auto_273663 ?auto_273667 ) ) ( not ( = ?auto_273663 ?auto_273668 ) ) ( not ( = ?auto_273663 ?auto_273669 ) ) ( not ( = ?auto_273665 ?auto_273666 ) ) ( not ( = ?auto_273665 ?auto_273667 ) ) ( not ( = ?auto_273665 ?auto_273668 ) ) ( not ( = ?auto_273665 ?auto_273669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_273666 ?auto_273667 ?auto_273668 )
      ( MAKE-8CRATE-VERIFY ?auto_273660 ?auto_273661 ?auto_273662 ?auto_273664 ?auto_273663 ?auto_273665 ?auto_273666 ?auto_273667 ?auto_273668 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_273753 - SURFACE
      ?auto_273754 - SURFACE
      ?auto_273755 - SURFACE
      ?auto_273757 - SURFACE
      ?auto_273756 - SURFACE
      ?auto_273758 - SURFACE
      ?auto_273759 - SURFACE
      ?auto_273760 - SURFACE
      ?auto_273761 - SURFACE
    )
    :vars
    (
      ?auto_273765 - HOIST
      ?auto_273766 - PLACE
      ?auto_273763 - PLACE
      ?auto_273762 - HOIST
      ?auto_273764 - SURFACE
      ?auto_273767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_273765 ?auto_273766 ) ( IS-CRATE ?auto_273761 ) ( not ( = ?auto_273760 ?auto_273761 ) ) ( not ( = ?auto_273759 ?auto_273760 ) ) ( not ( = ?auto_273759 ?auto_273761 ) ) ( not ( = ?auto_273763 ?auto_273766 ) ) ( HOIST-AT ?auto_273762 ?auto_273763 ) ( not ( = ?auto_273765 ?auto_273762 ) ) ( AVAILABLE ?auto_273762 ) ( SURFACE-AT ?auto_273761 ?auto_273763 ) ( ON ?auto_273761 ?auto_273764 ) ( CLEAR ?auto_273761 ) ( not ( = ?auto_273760 ?auto_273764 ) ) ( not ( = ?auto_273761 ?auto_273764 ) ) ( not ( = ?auto_273759 ?auto_273764 ) ) ( TRUCK-AT ?auto_273767 ?auto_273766 ) ( SURFACE-AT ?auto_273759 ?auto_273766 ) ( CLEAR ?auto_273759 ) ( LIFTING ?auto_273765 ?auto_273760 ) ( IS-CRATE ?auto_273760 ) ( ON ?auto_273754 ?auto_273753 ) ( ON ?auto_273755 ?auto_273754 ) ( ON ?auto_273757 ?auto_273755 ) ( ON ?auto_273756 ?auto_273757 ) ( ON ?auto_273758 ?auto_273756 ) ( ON ?auto_273759 ?auto_273758 ) ( not ( = ?auto_273753 ?auto_273754 ) ) ( not ( = ?auto_273753 ?auto_273755 ) ) ( not ( = ?auto_273753 ?auto_273757 ) ) ( not ( = ?auto_273753 ?auto_273756 ) ) ( not ( = ?auto_273753 ?auto_273758 ) ) ( not ( = ?auto_273753 ?auto_273759 ) ) ( not ( = ?auto_273753 ?auto_273760 ) ) ( not ( = ?auto_273753 ?auto_273761 ) ) ( not ( = ?auto_273753 ?auto_273764 ) ) ( not ( = ?auto_273754 ?auto_273755 ) ) ( not ( = ?auto_273754 ?auto_273757 ) ) ( not ( = ?auto_273754 ?auto_273756 ) ) ( not ( = ?auto_273754 ?auto_273758 ) ) ( not ( = ?auto_273754 ?auto_273759 ) ) ( not ( = ?auto_273754 ?auto_273760 ) ) ( not ( = ?auto_273754 ?auto_273761 ) ) ( not ( = ?auto_273754 ?auto_273764 ) ) ( not ( = ?auto_273755 ?auto_273757 ) ) ( not ( = ?auto_273755 ?auto_273756 ) ) ( not ( = ?auto_273755 ?auto_273758 ) ) ( not ( = ?auto_273755 ?auto_273759 ) ) ( not ( = ?auto_273755 ?auto_273760 ) ) ( not ( = ?auto_273755 ?auto_273761 ) ) ( not ( = ?auto_273755 ?auto_273764 ) ) ( not ( = ?auto_273757 ?auto_273756 ) ) ( not ( = ?auto_273757 ?auto_273758 ) ) ( not ( = ?auto_273757 ?auto_273759 ) ) ( not ( = ?auto_273757 ?auto_273760 ) ) ( not ( = ?auto_273757 ?auto_273761 ) ) ( not ( = ?auto_273757 ?auto_273764 ) ) ( not ( = ?auto_273756 ?auto_273758 ) ) ( not ( = ?auto_273756 ?auto_273759 ) ) ( not ( = ?auto_273756 ?auto_273760 ) ) ( not ( = ?auto_273756 ?auto_273761 ) ) ( not ( = ?auto_273756 ?auto_273764 ) ) ( not ( = ?auto_273758 ?auto_273759 ) ) ( not ( = ?auto_273758 ?auto_273760 ) ) ( not ( = ?auto_273758 ?auto_273761 ) ) ( not ( = ?auto_273758 ?auto_273764 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_273759 ?auto_273760 ?auto_273761 )
      ( MAKE-8CRATE-VERIFY ?auto_273753 ?auto_273754 ?auto_273755 ?auto_273757 ?auto_273756 ?auto_273758 ?auto_273759 ?auto_273760 ?auto_273761 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_273846 - SURFACE
      ?auto_273847 - SURFACE
      ?auto_273848 - SURFACE
      ?auto_273850 - SURFACE
      ?auto_273849 - SURFACE
      ?auto_273851 - SURFACE
      ?auto_273852 - SURFACE
      ?auto_273853 - SURFACE
      ?auto_273854 - SURFACE
    )
    :vars
    (
      ?auto_273860 - HOIST
      ?auto_273855 - PLACE
      ?auto_273859 - PLACE
      ?auto_273858 - HOIST
      ?auto_273857 - SURFACE
      ?auto_273856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_273860 ?auto_273855 ) ( IS-CRATE ?auto_273854 ) ( not ( = ?auto_273853 ?auto_273854 ) ) ( not ( = ?auto_273852 ?auto_273853 ) ) ( not ( = ?auto_273852 ?auto_273854 ) ) ( not ( = ?auto_273859 ?auto_273855 ) ) ( HOIST-AT ?auto_273858 ?auto_273859 ) ( not ( = ?auto_273860 ?auto_273858 ) ) ( AVAILABLE ?auto_273858 ) ( SURFACE-AT ?auto_273854 ?auto_273859 ) ( ON ?auto_273854 ?auto_273857 ) ( CLEAR ?auto_273854 ) ( not ( = ?auto_273853 ?auto_273857 ) ) ( not ( = ?auto_273854 ?auto_273857 ) ) ( not ( = ?auto_273852 ?auto_273857 ) ) ( TRUCK-AT ?auto_273856 ?auto_273855 ) ( SURFACE-AT ?auto_273852 ?auto_273855 ) ( CLEAR ?auto_273852 ) ( IS-CRATE ?auto_273853 ) ( AVAILABLE ?auto_273860 ) ( IN ?auto_273853 ?auto_273856 ) ( ON ?auto_273847 ?auto_273846 ) ( ON ?auto_273848 ?auto_273847 ) ( ON ?auto_273850 ?auto_273848 ) ( ON ?auto_273849 ?auto_273850 ) ( ON ?auto_273851 ?auto_273849 ) ( ON ?auto_273852 ?auto_273851 ) ( not ( = ?auto_273846 ?auto_273847 ) ) ( not ( = ?auto_273846 ?auto_273848 ) ) ( not ( = ?auto_273846 ?auto_273850 ) ) ( not ( = ?auto_273846 ?auto_273849 ) ) ( not ( = ?auto_273846 ?auto_273851 ) ) ( not ( = ?auto_273846 ?auto_273852 ) ) ( not ( = ?auto_273846 ?auto_273853 ) ) ( not ( = ?auto_273846 ?auto_273854 ) ) ( not ( = ?auto_273846 ?auto_273857 ) ) ( not ( = ?auto_273847 ?auto_273848 ) ) ( not ( = ?auto_273847 ?auto_273850 ) ) ( not ( = ?auto_273847 ?auto_273849 ) ) ( not ( = ?auto_273847 ?auto_273851 ) ) ( not ( = ?auto_273847 ?auto_273852 ) ) ( not ( = ?auto_273847 ?auto_273853 ) ) ( not ( = ?auto_273847 ?auto_273854 ) ) ( not ( = ?auto_273847 ?auto_273857 ) ) ( not ( = ?auto_273848 ?auto_273850 ) ) ( not ( = ?auto_273848 ?auto_273849 ) ) ( not ( = ?auto_273848 ?auto_273851 ) ) ( not ( = ?auto_273848 ?auto_273852 ) ) ( not ( = ?auto_273848 ?auto_273853 ) ) ( not ( = ?auto_273848 ?auto_273854 ) ) ( not ( = ?auto_273848 ?auto_273857 ) ) ( not ( = ?auto_273850 ?auto_273849 ) ) ( not ( = ?auto_273850 ?auto_273851 ) ) ( not ( = ?auto_273850 ?auto_273852 ) ) ( not ( = ?auto_273850 ?auto_273853 ) ) ( not ( = ?auto_273850 ?auto_273854 ) ) ( not ( = ?auto_273850 ?auto_273857 ) ) ( not ( = ?auto_273849 ?auto_273851 ) ) ( not ( = ?auto_273849 ?auto_273852 ) ) ( not ( = ?auto_273849 ?auto_273853 ) ) ( not ( = ?auto_273849 ?auto_273854 ) ) ( not ( = ?auto_273849 ?auto_273857 ) ) ( not ( = ?auto_273851 ?auto_273852 ) ) ( not ( = ?auto_273851 ?auto_273853 ) ) ( not ( = ?auto_273851 ?auto_273854 ) ) ( not ( = ?auto_273851 ?auto_273857 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_273852 ?auto_273853 ?auto_273854 )
      ( MAKE-8CRATE-VERIFY ?auto_273846 ?auto_273847 ?auto_273848 ?auto_273850 ?auto_273849 ?auto_273851 ?auto_273852 ?auto_273853 ?auto_273854 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_277962 - SURFACE
      ?auto_277963 - SURFACE
      ?auto_277964 - SURFACE
      ?auto_277966 - SURFACE
      ?auto_277965 - SURFACE
      ?auto_277967 - SURFACE
      ?auto_277968 - SURFACE
      ?auto_277969 - SURFACE
      ?auto_277970 - SURFACE
      ?auto_277971 - SURFACE
    )
    :vars
    (
      ?auto_277972 - HOIST
      ?auto_277973 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_277972 ?auto_277973 ) ( SURFACE-AT ?auto_277970 ?auto_277973 ) ( CLEAR ?auto_277970 ) ( LIFTING ?auto_277972 ?auto_277971 ) ( IS-CRATE ?auto_277971 ) ( not ( = ?auto_277970 ?auto_277971 ) ) ( ON ?auto_277963 ?auto_277962 ) ( ON ?auto_277964 ?auto_277963 ) ( ON ?auto_277966 ?auto_277964 ) ( ON ?auto_277965 ?auto_277966 ) ( ON ?auto_277967 ?auto_277965 ) ( ON ?auto_277968 ?auto_277967 ) ( ON ?auto_277969 ?auto_277968 ) ( ON ?auto_277970 ?auto_277969 ) ( not ( = ?auto_277962 ?auto_277963 ) ) ( not ( = ?auto_277962 ?auto_277964 ) ) ( not ( = ?auto_277962 ?auto_277966 ) ) ( not ( = ?auto_277962 ?auto_277965 ) ) ( not ( = ?auto_277962 ?auto_277967 ) ) ( not ( = ?auto_277962 ?auto_277968 ) ) ( not ( = ?auto_277962 ?auto_277969 ) ) ( not ( = ?auto_277962 ?auto_277970 ) ) ( not ( = ?auto_277962 ?auto_277971 ) ) ( not ( = ?auto_277963 ?auto_277964 ) ) ( not ( = ?auto_277963 ?auto_277966 ) ) ( not ( = ?auto_277963 ?auto_277965 ) ) ( not ( = ?auto_277963 ?auto_277967 ) ) ( not ( = ?auto_277963 ?auto_277968 ) ) ( not ( = ?auto_277963 ?auto_277969 ) ) ( not ( = ?auto_277963 ?auto_277970 ) ) ( not ( = ?auto_277963 ?auto_277971 ) ) ( not ( = ?auto_277964 ?auto_277966 ) ) ( not ( = ?auto_277964 ?auto_277965 ) ) ( not ( = ?auto_277964 ?auto_277967 ) ) ( not ( = ?auto_277964 ?auto_277968 ) ) ( not ( = ?auto_277964 ?auto_277969 ) ) ( not ( = ?auto_277964 ?auto_277970 ) ) ( not ( = ?auto_277964 ?auto_277971 ) ) ( not ( = ?auto_277966 ?auto_277965 ) ) ( not ( = ?auto_277966 ?auto_277967 ) ) ( not ( = ?auto_277966 ?auto_277968 ) ) ( not ( = ?auto_277966 ?auto_277969 ) ) ( not ( = ?auto_277966 ?auto_277970 ) ) ( not ( = ?auto_277966 ?auto_277971 ) ) ( not ( = ?auto_277965 ?auto_277967 ) ) ( not ( = ?auto_277965 ?auto_277968 ) ) ( not ( = ?auto_277965 ?auto_277969 ) ) ( not ( = ?auto_277965 ?auto_277970 ) ) ( not ( = ?auto_277965 ?auto_277971 ) ) ( not ( = ?auto_277967 ?auto_277968 ) ) ( not ( = ?auto_277967 ?auto_277969 ) ) ( not ( = ?auto_277967 ?auto_277970 ) ) ( not ( = ?auto_277967 ?auto_277971 ) ) ( not ( = ?auto_277968 ?auto_277969 ) ) ( not ( = ?auto_277968 ?auto_277970 ) ) ( not ( = ?auto_277968 ?auto_277971 ) ) ( not ( = ?auto_277969 ?auto_277970 ) ) ( not ( = ?auto_277969 ?auto_277971 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_277970 ?auto_277971 )
      ( MAKE-9CRATE-VERIFY ?auto_277962 ?auto_277963 ?auto_277964 ?auto_277966 ?auto_277965 ?auto_277967 ?auto_277968 ?auto_277969 ?auto_277970 ?auto_277971 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278042 - SURFACE
      ?auto_278043 - SURFACE
      ?auto_278044 - SURFACE
      ?auto_278046 - SURFACE
      ?auto_278045 - SURFACE
      ?auto_278047 - SURFACE
      ?auto_278048 - SURFACE
      ?auto_278049 - SURFACE
      ?auto_278050 - SURFACE
      ?auto_278051 - SURFACE
    )
    :vars
    (
      ?auto_278052 - HOIST
      ?auto_278053 - PLACE
      ?auto_278054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_278052 ?auto_278053 ) ( SURFACE-AT ?auto_278050 ?auto_278053 ) ( CLEAR ?auto_278050 ) ( IS-CRATE ?auto_278051 ) ( not ( = ?auto_278050 ?auto_278051 ) ) ( TRUCK-AT ?auto_278054 ?auto_278053 ) ( AVAILABLE ?auto_278052 ) ( IN ?auto_278051 ?auto_278054 ) ( ON ?auto_278050 ?auto_278049 ) ( not ( = ?auto_278049 ?auto_278050 ) ) ( not ( = ?auto_278049 ?auto_278051 ) ) ( ON ?auto_278043 ?auto_278042 ) ( ON ?auto_278044 ?auto_278043 ) ( ON ?auto_278046 ?auto_278044 ) ( ON ?auto_278045 ?auto_278046 ) ( ON ?auto_278047 ?auto_278045 ) ( ON ?auto_278048 ?auto_278047 ) ( ON ?auto_278049 ?auto_278048 ) ( not ( = ?auto_278042 ?auto_278043 ) ) ( not ( = ?auto_278042 ?auto_278044 ) ) ( not ( = ?auto_278042 ?auto_278046 ) ) ( not ( = ?auto_278042 ?auto_278045 ) ) ( not ( = ?auto_278042 ?auto_278047 ) ) ( not ( = ?auto_278042 ?auto_278048 ) ) ( not ( = ?auto_278042 ?auto_278049 ) ) ( not ( = ?auto_278042 ?auto_278050 ) ) ( not ( = ?auto_278042 ?auto_278051 ) ) ( not ( = ?auto_278043 ?auto_278044 ) ) ( not ( = ?auto_278043 ?auto_278046 ) ) ( not ( = ?auto_278043 ?auto_278045 ) ) ( not ( = ?auto_278043 ?auto_278047 ) ) ( not ( = ?auto_278043 ?auto_278048 ) ) ( not ( = ?auto_278043 ?auto_278049 ) ) ( not ( = ?auto_278043 ?auto_278050 ) ) ( not ( = ?auto_278043 ?auto_278051 ) ) ( not ( = ?auto_278044 ?auto_278046 ) ) ( not ( = ?auto_278044 ?auto_278045 ) ) ( not ( = ?auto_278044 ?auto_278047 ) ) ( not ( = ?auto_278044 ?auto_278048 ) ) ( not ( = ?auto_278044 ?auto_278049 ) ) ( not ( = ?auto_278044 ?auto_278050 ) ) ( not ( = ?auto_278044 ?auto_278051 ) ) ( not ( = ?auto_278046 ?auto_278045 ) ) ( not ( = ?auto_278046 ?auto_278047 ) ) ( not ( = ?auto_278046 ?auto_278048 ) ) ( not ( = ?auto_278046 ?auto_278049 ) ) ( not ( = ?auto_278046 ?auto_278050 ) ) ( not ( = ?auto_278046 ?auto_278051 ) ) ( not ( = ?auto_278045 ?auto_278047 ) ) ( not ( = ?auto_278045 ?auto_278048 ) ) ( not ( = ?auto_278045 ?auto_278049 ) ) ( not ( = ?auto_278045 ?auto_278050 ) ) ( not ( = ?auto_278045 ?auto_278051 ) ) ( not ( = ?auto_278047 ?auto_278048 ) ) ( not ( = ?auto_278047 ?auto_278049 ) ) ( not ( = ?auto_278047 ?auto_278050 ) ) ( not ( = ?auto_278047 ?auto_278051 ) ) ( not ( = ?auto_278048 ?auto_278049 ) ) ( not ( = ?auto_278048 ?auto_278050 ) ) ( not ( = ?auto_278048 ?auto_278051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_278049 ?auto_278050 ?auto_278051 )
      ( MAKE-9CRATE-VERIFY ?auto_278042 ?auto_278043 ?auto_278044 ?auto_278046 ?auto_278045 ?auto_278047 ?auto_278048 ?auto_278049 ?auto_278050 ?auto_278051 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278132 - SURFACE
      ?auto_278133 - SURFACE
      ?auto_278134 - SURFACE
      ?auto_278136 - SURFACE
      ?auto_278135 - SURFACE
      ?auto_278137 - SURFACE
      ?auto_278138 - SURFACE
      ?auto_278139 - SURFACE
      ?auto_278140 - SURFACE
      ?auto_278141 - SURFACE
    )
    :vars
    (
      ?auto_278142 - HOIST
      ?auto_278145 - PLACE
      ?auto_278143 - TRUCK
      ?auto_278144 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_278142 ?auto_278145 ) ( SURFACE-AT ?auto_278140 ?auto_278145 ) ( CLEAR ?auto_278140 ) ( IS-CRATE ?auto_278141 ) ( not ( = ?auto_278140 ?auto_278141 ) ) ( AVAILABLE ?auto_278142 ) ( IN ?auto_278141 ?auto_278143 ) ( ON ?auto_278140 ?auto_278139 ) ( not ( = ?auto_278139 ?auto_278140 ) ) ( not ( = ?auto_278139 ?auto_278141 ) ) ( TRUCK-AT ?auto_278143 ?auto_278144 ) ( not ( = ?auto_278144 ?auto_278145 ) ) ( ON ?auto_278133 ?auto_278132 ) ( ON ?auto_278134 ?auto_278133 ) ( ON ?auto_278136 ?auto_278134 ) ( ON ?auto_278135 ?auto_278136 ) ( ON ?auto_278137 ?auto_278135 ) ( ON ?auto_278138 ?auto_278137 ) ( ON ?auto_278139 ?auto_278138 ) ( not ( = ?auto_278132 ?auto_278133 ) ) ( not ( = ?auto_278132 ?auto_278134 ) ) ( not ( = ?auto_278132 ?auto_278136 ) ) ( not ( = ?auto_278132 ?auto_278135 ) ) ( not ( = ?auto_278132 ?auto_278137 ) ) ( not ( = ?auto_278132 ?auto_278138 ) ) ( not ( = ?auto_278132 ?auto_278139 ) ) ( not ( = ?auto_278132 ?auto_278140 ) ) ( not ( = ?auto_278132 ?auto_278141 ) ) ( not ( = ?auto_278133 ?auto_278134 ) ) ( not ( = ?auto_278133 ?auto_278136 ) ) ( not ( = ?auto_278133 ?auto_278135 ) ) ( not ( = ?auto_278133 ?auto_278137 ) ) ( not ( = ?auto_278133 ?auto_278138 ) ) ( not ( = ?auto_278133 ?auto_278139 ) ) ( not ( = ?auto_278133 ?auto_278140 ) ) ( not ( = ?auto_278133 ?auto_278141 ) ) ( not ( = ?auto_278134 ?auto_278136 ) ) ( not ( = ?auto_278134 ?auto_278135 ) ) ( not ( = ?auto_278134 ?auto_278137 ) ) ( not ( = ?auto_278134 ?auto_278138 ) ) ( not ( = ?auto_278134 ?auto_278139 ) ) ( not ( = ?auto_278134 ?auto_278140 ) ) ( not ( = ?auto_278134 ?auto_278141 ) ) ( not ( = ?auto_278136 ?auto_278135 ) ) ( not ( = ?auto_278136 ?auto_278137 ) ) ( not ( = ?auto_278136 ?auto_278138 ) ) ( not ( = ?auto_278136 ?auto_278139 ) ) ( not ( = ?auto_278136 ?auto_278140 ) ) ( not ( = ?auto_278136 ?auto_278141 ) ) ( not ( = ?auto_278135 ?auto_278137 ) ) ( not ( = ?auto_278135 ?auto_278138 ) ) ( not ( = ?auto_278135 ?auto_278139 ) ) ( not ( = ?auto_278135 ?auto_278140 ) ) ( not ( = ?auto_278135 ?auto_278141 ) ) ( not ( = ?auto_278137 ?auto_278138 ) ) ( not ( = ?auto_278137 ?auto_278139 ) ) ( not ( = ?auto_278137 ?auto_278140 ) ) ( not ( = ?auto_278137 ?auto_278141 ) ) ( not ( = ?auto_278138 ?auto_278139 ) ) ( not ( = ?auto_278138 ?auto_278140 ) ) ( not ( = ?auto_278138 ?auto_278141 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_278139 ?auto_278140 ?auto_278141 )
      ( MAKE-9CRATE-VERIFY ?auto_278132 ?auto_278133 ?auto_278134 ?auto_278136 ?auto_278135 ?auto_278137 ?auto_278138 ?auto_278139 ?auto_278140 ?auto_278141 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278231 - SURFACE
      ?auto_278232 - SURFACE
      ?auto_278233 - SURFACE
      ?auto_278235 - SURFACE
      ?auto_278234 - SURFACE
      ?auto_278236 - SURFACE
      ?auto_278237 - SURFACE
      ?auto_278238 - SURFACE
      ?auto_278239 - SURFACE
      ?auto_278240 - SURFACE
    )
    :vars
    (
      ?auto_278244 - HOIST
      ?auto_278241 - PLACE
      ?auto_278242 - TRUCK
      ?auto_278243 - PLACE
      ?auto_278245 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_278244 ?auto_278241 ) ( SURFACE-AT ?auto_278239 ?auto_278241 ) ( CLEAR ?auto_278239 ) ( IS-CRATE ?auto_278240 ) ( not ( = ?auto_278239 ?auto_278240 ) ) ( AVAILABLE ?auto_278244 ) ( ON ?auto_278239 ?auto_278238 ) ( not ( = ?auto_278238 ?auto_278239 ) ) ( not ( = ?auto_278238 ?auto_278240 ) ) ( TRUCK-AT ?auto_278242 ?auto_278243 ) ( not ( = ?auto_278243 ?auto_278241 ) ) ( HOIST-AT ?auto_278245 ?auto_278243 ) ( LIFTING ?auto_278245 ?auto_278240 ) ( not ( = ?auto_278244 ?auto_278245 ) ) ( ON ?auto_278232 ?auto_278231 ) ( ON ?auto_278233 ?auto_278232 ) ( ON ?auto_278235 ?auto_278233 ) ( ON ?auto_278234 ?auto_278235 ) ( ON ?auto_278236 ?auto_278234 ) ( ON ?auto_278237 ?auto_278236 ) ( ON ?auto_278238 ?auto_278237 ) ( not ( = ?auto_278231 ?auto_278232 ) ) ( not ( = ?auto_278231 ?auto_278233 ) ) ( not ( = ?auto_278231 ?auto_278235 ) ) ( not ( = ?auto_278231 ?auto_278234 ) ) ( not ( = ?auto_278231 ?auto_278236 ) ) ( not ( = ?auto_278231 ?auto_278237 ) ) ( not ( = ?auto_278231 ?auto_278238 ) ) ( not ( = ?auto_278231 ?auto_278239 ) ) ( not ( = ?auto_278231 ?auto_278240 ) ) ( not ( = ?auto_278232 ?auto_278233 ) ) ( not ( = ?auto_278232 ?auto_278235 ) ) ( not ( = ?auto_278232 ?auto_278234 ) ) ( not ( = ?auto_278232 ?auto_278236 ) ) ( not ( = ?auto_278232 ?auto_278237 ) ) ( not ( = ?auto_278232 ?auto_278238 ) ) ( not ( = ?auto_278232 ?auto_278239 ) ) ( not ( = ?auto_278232 ?auto_278240 ) ) ( not ( = ?auto_278233 ?auto_278235 ) ) ( not ( = ?auto_278233 ?auto_278234 ) ) ( not ( = ?auto_278233 ?auto_278236 ) ) ( not ( = ?auto_278233 ?auto_278237 ) ) ( not ( = ?auto_278233 ?auto_278238 ) ) ( not ( = ?auto_278233 ?auto_278239 ) ) ( not ( = ?auto_278233 ?auto_278240 ) ) ( not ( = ?auto_278235 ?auto_278234 ) ) ( not ( = ?auto_278235 ?auto_278236 ) ) ( not ( = ?auto_278235 ?auto_278237 ) ) ( not ( = ?auto_278235 ?auto_278238 ) ) ( not ( = ?auto_278235 ?auto_278239 ) ) ( not ( = ?auto_278235 ?auto_278240 ) ) ( not ( = ?auto_278234 ?auto_278236 ) ) ( not ( = ?auto_278234 ?auto_278237 ) ) ( not ( = ?auto_278234 ?auto_278238 ) ) ( not ( = ?auto_278234 ?auto_278239 ) ) ( not ( = ?auto_278234 ?auto_278240 ) ) ( not ( = ?auto_278236 ?auto_278237 ) ) ( not ( = ?auto_278236 ?auto_278238 ) ) ( not ( = ?auto_278236 ?auto_278239 ) ) ( not ( = ?auto_278236 ?auto_278240 ) ) ( not ( = ?auto_278237 ?auto_278238 ) ) ( not ( = ?auto_278237 ?auto_278239 ) ) ( not ( = ?auto_278237 ?auto_278240 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_278238 ?auto_278239 ?auto_278240 )
      ( MAKE-9CRATE-VERIFY ?auto_278231 ?auto_278232 ?auto_278233 ?auto_278235 ?auto_278234 ?auto_278236 ?auto_278237 ?auto_278238 ?auto_278239 ?auto_278240 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278339 - SURFACE
      ?auto_278340 - SURFACE
      ?auto_278341 - SURFACE
      ?auto_278343 - SURFACE
      ?auto_278342 - SURFACE
      ?auto_278344 - SURFACE
      ?auto_278345 - SURFACE
      ?auto_278346 - SURFACE
      ?auto_278347 - SURFACE
      ?auto_278348 - SURFACE
    )
    :vars
    (
      ?auto_278354 - HOIST
      ?auto_278353 - PLACE
      ?auto_278352 - TRUCK
      ?auto_278349 - PLACE
      ?auto_278351 - HOIST
      ?auto_278350 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_278354 ?auto_278353 ) ( SURFACE-AT ?auto_278347 ?auto_278353 ) ( CLEAR ?auto_278347 ) ( IS-CRATE ?auto_278348 ) ( not ( = ?auto_278347 ?auto_278348 ) ) ( AVAILABLE ?auto_278354 ) ( ON ?auto_278347 ?auto_278346 ) ( not ( = ?auto_278346 ?auto_278347 ) ) ( not ( = ?auto_278346 ?auto_278348 ) ) ( TRUCK-AT ?auto_278352 ?auto_278349 ) ( not ( = ?auto_278349 ?auto_278353 ) ) ( HOIST-AT ?auto_278351 ?auto_278349 ) ( not ( = ?auto_278354 ?auto_278351 ) ) ( AVAILABLE ?auto_278351 ) ( SURFACE-AT ?auto_278348 ?auto_278349 ) ( ON ?auto_278348 ?auto_278350 ) ( CLEAR ?auto_278348 ) ( not ( = ?auto_278347 ?auto_278350 ) ) ( not ( = ?auto_278348 ?auto_278350 ) ) ( not ( = ?auto_278346 ?auto_278350 ) ) ( ON ?auto_278340 ?auto_278339 ) ( ON ?auto_278341 ?auto_278340 ) ( ON ?auto_278343 ?auto_278341 ) ( ON ?auto_278342 ?auto_278343 ) ( ON ?auto_278344 ?auto_278342 ) ( ON ?auto_278345 ?auto_278344 ) ( ON ?auto_278346 ?auto_278345 ) ( not ( = ?auto_278339 ?auto_278340 ) ) ( not ( = ?auto_278339 ?auto_278341 ) ) ( not ( = ?auto_278339 ?auto_278343 ) ) ( not ( = ?auto_278339 ?auto_278342 ) ) ( not ( = ?auto_278339 ?auto_278344 ) ) ( not ( = ?auto_278339 ?auto_278345 ) ) ( not ( = ?auto_278339 ?auto_278346 ) ) ( not ( = ?auto_278339 ?auto_278347 ) ) ( not ( = ?auto_278339 ?auto_278348 ) ) ( not ( = ?auto_278339 ?auto_278350 ) ) ( not ( = ?auto_278340 ?auto_278341 ) ) ( not ( = ?auto_278340 ?auto_278343 ) ) ( not ( = ?auto_278340 ?auto_278342 ) ) ( not ( = ?auto_278340 ?auto_278344 ) ) ( not ( = ?auto_278340 ?auto_278345 ) ) ( not ( = ?auto_278340 ?auto_278346 ) ) ( not ( = ?auto_278340 ?auto_278347 ) ) ( not ( = ?auto_278340 ?auto_278348 ) ) ( not ( = ?auto_278340 ?auto_278350 ) ) ( not ( = ?auto_278341 ?auto_278343 ) ) ( not ( = ?auto_278341 ?auto_278342 ) ) ( not ( = ?auto_278341 ?auto_278344 ) ) ( not ( = ?auto_278341 ?auto_278345 ) ) ( not ( = ?auto_278341 ?auto_278346 ) ) ( not ( = ?auto_278341 ?auto_278347 ) ) ( not ( = ?auto_278341 ?auto_278348 ) ) ( not ( = ?auto_278341 ?auto_278350 ) ) ( not ( = ?auto_278343 ?auto_278342 ) ) ( not ( = ?auto_278343 ?auto_278344 ) ) ( not ( = ?auto_278343 ?auto_278345 ) ) ( not ( = ?auto_278343 ?auto_278346 ) ) ( not ( = ?auto_278343 ?auto_278347 ) ) ( not ( = ?auto_278343 ?auto_278348 ) ) ( not ( = ?auto_278343 ?auto_278350 ) ) ( not ( = ?auto_278342 ?auto_278344 ) ) ( not ( = ?auto_278342 ?auto_278345 ) ) ( not ( = ?auto_278342 ?auto_278346 ) ) ( not ( = ?auto_278342 ?auto_278347 ) ) ( not ( = ?auto_278342 ?auto_278348 ) ) ( not ( = ?auto_278342 ?auto_278350 ) ) ( not ( = ?auto_278344 ?auto_278345 ) ) ( not ( = ?auto_278344 ?auto_278346 ) ) ( not ( = ?auto_278344 ?auto_278347 ) ) ( not ( = ?auto_278344 ?auto_278348 ) ) ( not ( = ?auto_278344 ?auto_278350 ) ) ( not ( = ?auto_278345 ?auto_278346 ) ) ( not ( = ?auto_278345 ?auto_278347 ) ) ( not ( = ?auto_278345 ?auto_278348 ) ) ( not ( = ?auto_278345 ?auto_278350 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_278346 ?auto_278347 ?auto_278348 )
      ( MAKE-9CRATE-VERIFY ?auto_278339 ?auto_278340 ?auto_278341 ?auto_278343 ?auto_278342 ?auto_278344 ?auto_278345 ?auto_278346 ?auto_278347 ?auto_278348 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278448 - SURFACE
      ?auto_278449 - SURFACE
      ?auto_278450 - SURFACE
      ?auto_278452 - SURFACE
      ?auto_278451 - SURFACE
      ?auto_278453 - SURFACE
      ?auto_278454 - SURFACE
      ?auto_278455 - SURFACE
      ?auto_278456 - SURFACE
      ?auto_278457 - SURFACE
    )
    :vars
    (
      ?auto_278462 - HOIST
      ?auto_278460 - PLACE
      ?auto_278458 - PLACE
      ?auto_278459 - HOIST
      ?auto_278463 - SURFACE
      ?auto_278461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_278462 ?auto_278460 ) ( SURFACE-AT ?auto_278456 ?auto_278460 ) ( CLEAR ?auto_278456 ) ( IS-CRATE ?auto_278457 ) ( not ( = ?auto_278456 ?auto_278457 ) ) ( AVAILABLE ?auto_278462 ) ( ON ?auto_278456 ?auto_278455 ) ( not ( = ?auto_278455 ?auto_278456 ) ) ( not ( = ?auto_278455 ?auto_278457 ) ) ( not ( = ?auto_278458 ?auto_278460 ) ) ( HOIST-AT ?auto_278459 ?auto_278458 ) ( not ( = ?auto_278462 ?auto_278459 ) ) ( AVAILABLE ?auto_278459 ) ( SURFACE-AT ?auto_278457 ?auto_278458 ) ( ON ?auto_278457 ?auto_278463 ) ( CLEAR ?auto_278457 ) ( not ( = ?auto_278456 ?auto_278463 ) ) ( not ( = ?auto_278457 ?auto_278463 ) ) ( not ( = ?auto_278455 ?auto_278463 ) ) ( TRUCK-AT ?auto_278461 ?auto_278460 ) ( ON ?auto_278449 ?auto_278448 ) ( ON ?auto_278450 ?auto_278449 ) ( ON ?auto_278452 ?auto_278450 ) ( ON ?auto_278451 ?auto_278452 ) ( ON ?auto_278453 ?auto_278451 ) ( ON ?auto_278454 ?auto_278453 ) ( ON ?auto_278455 ?auto_278454 ) ( not ( = ?auto_278448 ?auto_278449 ) ) ( not ( = ?auto_278448 ?auto_278450 ) ) ( not ( = ?auto_278448 ?auto_278452 ) ) ( not ( = ?auto_278448 ?auto_278451 ) ) ( not ( = ?auto_278448 ?auto_278453 ) ) ( not ( = ?auto_278448 ?auto_278454 ) ) ( not ( = ?auto_278448 ?auto_278455 ) ) ( not ( = ?auto_278448 ?auto_278456 ) ) ( not ( = ?auto_278448 ?auto_278457 ) ) ( not ( = ?auto_278448 ?auto_278463 ) ) ( not ( = ?auto_278449 ?auto_278450 ) ) ( not ( = ?auto_278449 ?auto_278452 ) ) ( not ( = ?auto_278449 ?auto_278451 ) ) ( not ( = ?auto_278449 ?auto_278453 ) ) ( not ( = ?auto_278449 ?auto_278454 ) ) ( not ( = ?auto_278449 ?auto_278455 ) ) ( not ( = ?auto_278449 ?auto_278456 ) ) ( not ( = ?auto_278449 ?auto_278457 ) ) ( not ( = ?auto_278449 ?auto_278463 ) ) ( not ( = ?auto_278450 ?auto_278452 ) ) ( not ( = ?auto_278450 ?auto_278451 ) ) ( not ( = ?auto_278450 ?auto_278453 ) ) ( not ( = ?auto_278450 ?auto_278454 ) ) ( not ( = ?auto_278450 ?auto_278455 ) ) ( not ( = ?auto_278450 ?auto_278456 ) ) ( not ( = ?auto_278450 ?auto_278457 ) ) ( not ( = ?auto_278450 ?auto_278463 ) ) ( not ( = ?auto_278452 ?auto_278451 ) ) ( not ( = ?auto_278452 ?auto_278453 ) ) ( not ( = ?auto_278452 ?auto_278454 ) ) ( not ( = ?auto_278452 ?auto_278455 ) ) ( not ( = ?auto_278452 ?auto_278456 ) ) ( not ( = ?auto_278452 ?auto_278457 ) ) ( not ( = ?auto_278452 ?auto_278463 ) ) ( not ( = ?auto_278451 ?auto_278453 ) ) ( not ( = ?auto_278451 ?auto_278454 ) ) ( not ( = ?auto_278451 ?auto_278455 ) ) ( not ( = ?auto_278451 ?auto_278456 ) ) ( not ( = ?auto_278451 ?auto_278457 ) ) ( not ( = ?auto_278451 ?auto_278463 ) ) ( not ( = ?auto_278453 ?auto_278454 ) ) ( not ( = ?auto_278453 ?auto_278455 ) ) ( not ( = ?auto_278453 ?auto_278456 ) ) ( not ( = ?auto_278453 ?auto_278457 ) ) ( not ( = ?auto_278453 ?auto_278463 ) ) ( not ( = ?auto_278454 ?auto_278455 ) ) ( not ( = ?auto_278454 ?auto_278456 ) ) ( not ( = ?auto_278454 ?auto_278457 ) ) ( not ( = ?auto_278454 ?auto_278463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_278455 ?auto_278456 ?auto_278457 )
      ( MAKE-9CRATE-VERIFY ?auto_278448 ?auto_278449 ?auto_278450 ?auto_278452 ?auto_278451 ?auto_278453 ?auto_278454 ?auto_278455 ?auto_278456 ?auto_278457 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278557 - SURFACE
      ?auto_278558 - SURFACE
      ?auto_278559 - SURFACE
      ?auto_278561 - SURFACE
      ?auto_278560 - SURFACE
      ?auto_278562 - SURFACE
      ?auto_278563 - SURFACE
      ?auto_278564 - SURFACE
      ?auto_278565 - SURFACE
      ?auto_278566 - SURFACE
    )
    :vars
    (
      ?auto_278572 - HOIST
      ?auto_278569 - PLACE
      ?auto_278571 - PLACE
      ?auto_278568 - HOIST
      ?auto_278567 - SURFACE
      ?auto_278570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_278572 ?auto_278569 ) ( IS-CRATE ?auto_278566 ) ( not ( = ?auto_278565 ?auto_278566 ) ) ( not ( = ?auto_278564 ?auto_278565 ) ) ( not ( = ?auto_278564 ?auto_278566 ) ) ( not ( = ?auto_278571 ?auto_278569 ) ) ( HOIST-AT ?auto_278568 ?auto_278571 ) ( not ( = ?auto_278572 ?auto_278568 ) ) ( AVAILABLE ?auto_278568 ) ( SURFACE-AT ?auto_278566 ?auto_278571 ) ( ON ?auto_278566 ?auto_278567 ) ( CLEAR ?auto_278566 ) ( not ( = ?auto_278565 ?auto_278567 ) ) ( not ( = ?auto_278566 ?auto_278567 ) ) ( not ( = ?auto_278564 ?auto_278567 ) ) ( TRUCK-AT ?auto_278570 ?auto_278569 ) ( SURFACE-AT ?auto_278564 ?auto_278569 ) ( CLEAR ?auto_278564 ) ( LIFTING ?auto_278572 ?auto_278565 ) ( IS-CRATE ?auto_278565 ) ( ON ?auto_278558 ?auto_278557 ) ( ON ?auto_278559 ?auto_278558 ) ( ON ?auto_278561 ?auto_278559 ) ( ON ?auto_278560 ?auto_278561 ) ( ON ?auto_278562 ?auto_278560 ) ( ON ?auto_278563 ?auto_278562 ) ( ON ?auto_278564 ?auto_278563 ) ( not ( = ?auto_278557 ?auto_278558 ) ) ( not ( = ?auto_278557 ?auto_278559 ) ) ( not ( = ?auto_278557 ?auto_278561 ) ) ( not ( = ?auto_278557 ?auto_278560 ) ) ( not ( = ?auto_278557 ?auto_278562 ) ) ( not ( = ?auto_278557 ?auto_278563 ) ) ( not ( = ?auto_278557 ?auto_278564 ) ) ( not ( = ?auto_278557 ?auto_278565 ) ) ( not ( = ?auto_278557 ?auto_278566 ) ) ( not ( = ?auto_278557 ?auto_278567 ) ) ( not ( = ?auto_278558 ?auto_278559 ) ) ( not ( = ?auto_278558 ?auto_278561 ) ) ( not ( = ?auto_278558 ?auto_278560 ) ) ( not ( = ?auto_278558 ?auto_278562 ) ) ( not ( = ?auto_278558 ?auto_278563 ) ) ( not ( = ?auto_278558 ?auto_278564 ) ) ( not ( = ?auto_278558 ?auto_278565 ) ) ( not ( = ?auto_278558 ?auto_278566 ) ) ( not ( = ?auto_278558 ?auto_278567 ) ) ( not ( = ?auto_278559 ?auto_278561 ) ) ( not ( = ?auto_278559 ?auto_278560 ) ) ( not ( = ?auto_278559 ?auto_278562 ) ) ( not ( = ?auto_278559 ?auto_278563 ) ) ( not ( = ?auto_278559 ?auto_278564 ) ) ( not ( = ?auto_278559 ?auto_278565 ) ) ( not ( = ?auto_278559 ?auto_278566 ) ) ( not ( = ?auto_278559 ?auto_278567 ) ) ( not ( = ?auto_278561 ?auto_278560 ) ) ( not ( = ?auto_278561 ?auto_278562 ) ) ( not ( = ?auto_278561 ?auto_278563 ) ) ( not ( = ?auto_278561 ?auto_278564 ) ) ( not ( = ?auto_278561 ?auto_278565 ) ) ( not ( = ?auto_278561 ?auto_278566 ) ) ( not ( = ?auto_278561 ?auto_278567 ) ) ( not ( = ?auto_278560 ?auto_278562 ) ) ( not ( = ?auto_278560 ?auto_278563 ) ) ( not ( = ?auto_278560 ?auto_278564 ) ) ( not ( = ?auto_278560 ?auto_278565 ) ) ( not ( = ?auto_278560 ?auto_278566 ) ) ( not ( = ?auto_278560 ?auto_278567 ) ) ( not ( = ?auto_278562 ?auto_278563 ) ) ( not ( = ?auto_278562 ?auto_278564 ) ) ( not ( = ?auto_278562 ?auto_278565 ) ) ( not ( = ?auto_278562 ?auto_278566 ) ) ( not ( = ?auto_278562 ?auto_278567 ) ) ( not ( = ?auto_278563 ?auto_278564 ) ) ( not ( = ?auto_278563 ?auto_278565 ) ) ( not ( = ?auto_278563 ?auto_278566 ) ) ( not ( = ?auto_278563 ?auto_278567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_278564 ?auto_278565 ?auto_278566 )
      ( MAKE-9CRATE-VERIFY ?auto_278557 ?auto_278558 ?auto_278559 ?auto_278561 ?auto_278560 ?auto_278562 ?auto_278563 ?auto_278564 ?auto_278565 ?auto_278566 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278666 - SURFACE
      ?auto_278667 - SURFACE
      ?auto_278668 - SURFACE
      ?auto_278670 - SURFACE
      ?auto_278669 - SURFACE
      ?auto_278671 - SURFACE
      ?auto_278672 - SURFACE
      ?auto_278673 - SURFACE
      ?auto_278674 - SURFACE
      ?auto_278675 - SURFACE
    )
    :vars
    (
      ?auto_278679 - HOIST
      ?auto_278677 - PLACE
      ?auto_278678 - PLACE
      ?auto_278680 - HOIST
      ?auto_278676 - SURFACE
      ?auto_278681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_278679 ?auto_278677 ) ( IS-CRATE ?auto_278675 ) ( not ( = ?auto_278674 ?auto_278675 ) ) ( not ( = ?auto_278673 ?auto_278674 ) ) ( not ( = ?auto_278673 ?auto_278675 ) ) ( not ( = ?auto_278678 ?auto_278677 ) ) ( HOIST-AT ?auto_278680 ?auto_278678 ) ( not ( = ?auto_278679 ?auto_278680 ) ) ( AVAILABLE ?auto_278680 ) ( SURFACE-AT ?auto_278675 ?auto_278678 ) ( ON ?auto_278675 ?auto_278676 ) ( CLEAR ?auto_278675 ) ( not ( = ?auto_278674 ?auto_278676 ) ) ( not ( = ?auto_278675 ?auto_278676 ) ) ( not ( = ?auto_278673 ?auto_278676 ) ) ( TRUCK-AT ?auto_278681 ?auto_278677 ) ( SURFACE-AT ?auto_278673 ?auto_278677 ) ( CLEAR ?auto_278673 ) ( IS-CRATE ?auto_278674 ) ( AVAILABLE ?auto_278679 ) ( IN ?auto_278674 ?auto_278681 ) ( ON ?auto_278667 ?auto_278666 ) ( ON ?auto_278668 ?auto_278667 ) ( ON ?auto_278670 ?auto_278668 ) ( ON ?auto_278669 ?auto_278670 ) ( ON ?auto_278671 ?auto_278669 ) ( ON ?auto_278672 ?auto_278671 ) ( ON ?auto_278673 ?auto_278672 ) ( not ( = ?auto_278666 ?auto_278667 ) ) ( not ( = ?auto_278666 ?auto_278668 ) ) ( not ( = ?auto_278666 ?auto_278670 ) ) ( not ( = ?auto_278666 ?auto_278669 ) ) ( not ( = ?auto_278666 ?auto_278671 ) ) ( not ( = ?auto_278666 ?auto_278672 ) ) ( not ( = ?auto_278666 ?auto_278673 ) ) ( not ( = ?auto_278666 ?auto_278674 ) ) ( not ( = ?auto_278666 ?auto_278675 ) ) ( not ( = ?auto_278666 ?auto_278676 ) ) ( not ( = ?auto_278667 ?auto_278668 ) ) ( not ( = ?auto_278667 ?auto_278670 ) ) ( not ( = ?auto_278667 ?auto_278669 ) ) ( not ( = ?auto_278667 ?auto_278671 ) ) ( not ( = ?auto_278667 ?auto_278672 ) ) ( not ( = ?auto_278667 ?auto_278673 ) ) ( not ( = ?auto_278667 ?auto_278674 ) ) ( not ( = ?auto_278667 ?auto_278675 ) ) ( not ( = ?auto_278667 ?auto_278676 ) ) ( not ( = ?auto_278668 ?auto_278670 ) ) ( not ( = ?auto_278668 ?auto_278669 ) ) ( not ( = ?auto_278668 ?auto_278671 ) ) ( not ( = ?auto_278668 ?auto_278672 ) ) ( not ( = ?auto_278668 ?auto_278673 ) ) ( not ( = ?auto_278668 ?auto_278674 ) ) ( not ( = ?auto_278668 ?auto_278675 ) ) ( not ( = ?auto_278668 ?auto_278676 ) ) ( not ( = ?auto_278670 ?auto_278669 ) ) ( not ( = ?auto_278670 ?auto_278671 ) ) ( not ( = ?auto_278670 ?auto_278672 ) ) ( not ( = ?auto_278670 ?auto_278673 ) ) ( not ( = ?auto_278670 ?auto_278674 ) ) ( not ( = ?auto_278670 ?auto_278675 ) ) ( not ( = ?auto_278670 ?auto_278676 ) ) ( not ( = ?auto_278669 ?auto_278671 ) ) ( not ( = ?auto_278669 ?auto_278672 ) ) ( not ( = ?auto_278669 ?auto_278673 ) ) ( not ( = ?auto_278669 ?auto_278674 ) ) ( not ( = ?auto_278669 ?auto_278675 ) ) ( not ( = ?auto_278669 ?auto_278676 ) ) ( not ( = ?auto_278671 ?auto_278672 ) ) ( not ( = ?auto_278671 ?auto_278673 ) ) ( not ( = ?auto_278671 ?auto_278674 ) ) ( not ( = ?auto_278671 ?auto_278675 ) ) ( not ( = ?auto_278671 ?auto_278676 ) ) ( not ( = ?auto_278672 ?auto_278673 ) ) ( not ( = ?auto_278672 ?auto_278674 ) ) ( not ( = ?auto_278672 ?auto_278675 ) ) ( not ( = ?auto_278672 ?auto_278676 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_278673 ?auto_278674 ?auto_278675 )
      ( MAKE-9CRATE-VERIFY ?auto_278666 ?auto_278667 ?auto_278668 ?auto_278670 ?auto_278669 ?auto_278671 ?auto_278672 ?auto_278673 ?auto_278674 ?auto_278675 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_284215 - SURFACE
      ?auto_284216 - SURFACE
      ?auto_284217 - SURFACE
      ?auto_284219 - SURFACE
      ?auto_284218 - SURFACE
      ?auto_284220 - SURFACE
      ?auto_284221 - SURFACE
      ?auto_284222 - SURFACE
      ?auto_284223 - SURFACE
      ?auto_284224 - SURFACE
      ?auto_284225 - SURFACE
    )
    :vars
    (
      ?auto_284227 - HOIST
      ?auto_284226 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_284227 ?auto_284226 ) ( SURFACE-AT ?auto_284224 ?auto_284226 ) ( CLEAR ?auto_284224 ) ( LIFTING ?auto_284227 ?auto_284225 ) ( IS-CRATE ?auto_284225 ) ( not ( = ?auto_284224 ?auto_284225 ) ) ( ON ?auto_284216 ?auto_284215 ) ( ON ?auto_284217 ?auto_284216 ) ( ON ?auto_284219 ?auto_284217 ) ( ON ?auto_284218 ?auto_284219 ) ( ON ?auto_284220 ?auto_284218 ) ( ON ?auto_284221 ?auto_284220 ) ( ON ?auto_284222 ?auto_284221 ) ( ON ?auto_284223 ?auto_284222 ) ( ON ?auto_284224 ?auto_284223 ) ( not ( = ?auto_284215 ?auto_284216 ) ) ( not ( = ?auto_284215 ?auto_284217 ) ) ( not ( = ?auto_284215 ?auto_284219 ) ) ( not ( = ?auto_284215 ?auto_284218 ) ) ( not ( = ?auto_284215 ?auto_284220 ) ) ( not ( = ?auto_284215 ?auto_284221 ) ) ( not ( = ?auto_284215 ?auto_284222 ) ) ( not ( = ?auto_284215 ?auto_284223 ) ) ( not ( = ?auto_284215 ?auto_284224 ) ) ( not ( = ?auto_284215 ?auto_284225 ) ) ( not ( = ?auto_284216 ?auto_284217 ) ) ( not ( = ?auto_284216 ?auto_284219 ) ) ( not ( = ?auto_284216 ?auto_284218 ) ) ( not ( = ?auto_284216 ?auto_284220 ) ) ( not ( = ?auto_284216 ?auto_284221 ) ) ( not ( = ?auto_284216 ?auto_284222 ) ) ( not ( = ?auto_284216 ?auto_284223 ) ) ( not ( = ?auto_284216 ?auto_284224 ) ) ( not ( = ?auto_284216 ?auto_284225 ) ) ( not ( = ?auto_284217 ?auto_284219 ) ) ( not ( = ?auto_284217 ?auto_284218 ) ) ( not ( = ?auto_284217 ?auto_284220 ) ) ( not ( = ?auto_284217 ?auto_284221 ) ) ( not ( = ?auto_284217 ?auto_284222 ) ) ( not ( = ?auto_284217 ?auto_284223 ) ) ( not ( = ?auto_284217 ?auto_284224 ) ) ( not ( = ?auto_284217 ?auto_284225 ) ) ( not ( = ?auto_284219 ?auto_284218 ) ) ( not ( = ?auto_284219 ?auto_284220 ) ) ( not ( = ?auto_284219 ?auto_284221 ) ) ( not ( = ?auto_284219 ?auto_284222 ) ) ( not ( = ?auto_284219 ?auto_284223 ) ) ( not ( = ?auto_284219 ?auto_284224 ) ) ( not ( = ?auto_284219 ?auto_284225 ) ) ( not ( = ?auto_284218 ?auto_284220 ) ) ( not ( = ?auto_284218 ?auto_284221 ) ) ( not ( = ?auto_284218 ?auto_284222 ) ) ( not ( = ?auto_284218 ?auto_284223 ) ) ( not ( = ?auto_284218 ?auto_284224 ) ) ( not ( = ?auto_284218 ?auto_284225 ) ) ( not ( = ?auto_284220 ?auto_284221 ) ) ( not ( = ?auto_284220 ?auto_284222 ) ) ( not ( = ?auto_284220 ?auto_284223 ) ) ( not ( = ?auto_284220 ?auto_284224 ) ) ( not ( = ?auto_284220 ?auto_284225 ) ) ( not ( = ?auto_284221 ?auto_284222 ) ) ( not ( = ?auto_284221 ?auto_284223 ) ) ( not ( = ?auto_284221 ?auto_284224 ) ) ( not ( = ?auto_284221 ?auto_284225 ) ) ( not ( = ?auto_284222 ?auto_284223 ) ) ( not ( = ?auto_284222 ?auto_284224 ) ) ( not ( = ?auto_284222 ?auto_284225 ) ) ( not ( = ?auto_284223 ?auto_284224 ) ) ( not ( = ?auto_284223 ?auto_284225 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_284224 ?auto_284225 )
      ( MAKE-10CRATE-VERIFY ?auto_284215 ?auto_284216 ?auto_284217 ?auto_284219 ?auto_284218 ?auto_284220 ?auto_284221 ?auto_284222 ?auto_284223 ?auto_284224 ?auto_284225 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_284309 - SURFACE
      ?auto_284310 - SURFACE
      ?auto_284311 - SURFACE
      ?auto_284313 - SURFACE
      ?auto_284312 - SURFACE
      ?auto_284314 - SURFACE
      ?auto_284315 - SURFACE
      ?auto_284316 - SURFACE
      ?auto_284317 - SURFACE
      ?auto_284318 - SURFACE
      ?auto_284319 - SURFACE
    )
    :vars
    (
      ?auto_284322 - HOIST
      ?auto_284320 - PLACE
      ?auto_284321 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_284322 ?auto_284320 ) ( SURFACE-AT ?auto_284318 ?auto_284320 ) ( CLEAR ?auto_284318 ) ( IS-CRATE ?auto_284319 ) ( not ( = ?auto_284318 ?auto_284319 ) ) ( TRUCK-AT ?auto_284321 ?auto_284320 ) ( AVAILABLE ?auto_284322 ) ( IN ?auto_284319 ?auto_284321 ) ( ON ?auto_284318 ?auto_284317 ) ( not ( = ?auto_284317 ?auto_284318 ) ) ( not ( = ?auto_284317 ?auto_284319 ) ) ( ON ?auto_284310 ?auto_284309 ) ( ON ?auto_284311 ?auto_284310 ) ( ON ?auto_284313 ?auto_284311 ) ( ON ?auto_284312 ?auto_284313 ) ( ON ?auto_284314 ?auto_284312 ) ( ON ?auto_284315 ?auto_284314 ) ( ON ?auto_284316 ?auto_284315 ) ( ON ?auto_284317 ?auto_284316 ) ( not ( = ?auto_284309 ?auto_284310 ) ) ( not ( = ?auto_284309 ?auto_284311 ) ) ( not ( = ?auto_284309 ?auto_284313 ) ) ( not ( = ?auto_284309 ?auto_284312 ) ) ( not ( = ?auto_284309 ?auto_284314 ) ) ( not ( = ?auto_284309 ?auto_284315 ) ) ( not ( = ?auto_284309 ?auto_284316 ) ) ( not ( = ?auto_284309 ?auto_284317 ) ) ( not ( = ?auto_284309 ?auto_284318 ) ) ( not ( = ?auto_284309 ?auto_284319 ) ) ( not ( = ?auto_284310 ?auto_284311 ) ) ( not ( = ?auto_284310 ?auto_284313 ) ) ( not ( = ?auto_284310 ?auto_284312 ) ) ( not ( = ?auto_284310 ?auto_284314 ) ) ( not ( = ?auto_284310 ?auto_284315 ) ) ( not ( = ?auto_284310 ?auto_284316 ) ) ( not ( = ?auto_284310 ?auto_284317 ) ) ( not ( = ?auto_284310 ?auto_284318 ) ) ( not ( = ?auto_284310 ?auto_284319 ) ) ( not ( = ?auto_284311 ?auto_284313 ) ) ( not ( = ?auto_284311 ?auto_284312 ) ) ( not ( = ?auto_284311 ?auto_284314 ) ) ( not ( = ?auto_284311 ?auto_284315 ) ) ( not ( = ?auto_284311 ?auto_284316 ) ) ( not ( = ?auto_284311 ?auto_284317 ) ) ( not ( = ?auto_284311 ?auto_284318 ) ) ( not ( = ?auto_284311 ?auto_284319 ) ) ( not ( = ?auto_284313 ?auto_284312 ) ) ( not ( = ?auto_284313 ?auto_284314 ) ) ( not ( = ?auto_284313 ?auto_284315 ) ) ( not ( = ?auto_284313 ?auto_284316 ) ) ( not ( = ?auto_284313 ?auto_284317 ) ) ( not ( = ?auto_284313 ?auto_284318 ) ) ( not ( = ?auto_284313 ?auto_284319 ) ) ( not ( = ?auto_284312 ?auto_284314 ) ) ( not ( = ?auto_284312 ?auto_284315 ) ) ( not ( = ?auto_284312 ?auto_284316 ) ) ( not ( = ?auto_284312 ?auto_284317 ) ) ( not ( = ?auto_284312 ?auto_284318 ) ) ( not ( = ?auto_284312 ?auto_284319 ) ) ( not ( = ?auto_284314 ?auto_284315 ) ) ( not ( = ?auto_284314 ?auto_284316 ) ) ( not ( = ?auto_284314 ?auto_284317 ) ) ( not ( = ?auto_284314 ?auto_284318 ) ) ( not ( = ?auto_284314 ?auto_284319 ) ) ( not ( = ?auto_284315 ?auto_284316 ) ) ( not ( = ?auto_284315 ?auto_284317 ) ) ( not ( = ?auto_284315 ?auto_284318 ) ) ( not ( = ?auto_284315 ?auto_284319 ) ) ( not ( = ?auto_284316 ?auto_284317 ) ) ( not ( = ?auto_284316 ?auto_284318 ) ) ( not ( = ?auto_284316 ?auto_284319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_284317 ?auto_284318 ?auto_284319 )
      ( MAKE-10CRATE-VERIFY ?auto_284309 ?auto_284310 ?auto_284311 ?auto_284313 ?auto_284312 ?auto_284314 ?auto_284315 ?auto_284316 ?auto_284317 ?auto_284318 ?auto_284319 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_284414 - SURFACE
      ?auto_284415 - SURFACE
      ?auto_284416 - SURFACE
      ?auto_284418 - SURFACE
      ?auto_284417 - SURFACE
      ?auto_284419 - SURFACE
      ?auto_284420 - SURFACE
      ?auto_284421 - SURFACE
      ?auto_284422 - SURFACE
      ?auto_284423 - SURFACE
      ?auto_284424 - SURFACE
    )
    :vars
    (
      ?auto_284425 - HOIST
      ?auto_284427 - PLACE
      ?auto_284426 - TRUCK
      ?auto_284428 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_284425 ?auto_284427 ) ( SURFACE-AT ?auto_284423 ?auto_284427 ) ( CLEAR ?auto_284423 ) ( IS-CRATE ?auto_284424 ) ( not ( = ?auto_284423 ?auto_284424 ) ) ( AVAILABLE ?auto_284425 ) ( IN ?auto_284424 ?auto_284426 ) ( ON ?auto_284423 ?auto_284422 ) ( not ( = ?auto_284422 ?auto_284423 ) ) ( not ( = ?auto_284422 ?auto_284424 ) ) ( TRUCK-AT ?auto_284426 ?auto_284428 ) ( not ( = ?auto_284428 ?auto_284427 ) ) ( ON ?auto_284415 ?auto_284414 ) ( ON ?auto_284416 ?auto_284415 ) ( ON ?auto_284418 ?auto_284416 ) ( ON ?auto_284417 ?auto_284418 ) ( ON ?auto_284419 ?auto_284417 ) ( ON ?auto_284420 ?auto_284419 ) ( ON ?auto_284421 ?auto_284420 ) ( ON ?auto_284422 ?auto_284421 ) ( not ( = ?auto_284414 ?auto_284415 ) ) ( not ( = ?auto_284414 ?auto_284416 ) ) ( not ( = ?auto_284414 ?auto_284418 ) ) ( not ( = ?auto_284414 ?auto_284417 ) ) ( not ( = ?auto_284414 ?auto_284419 ) ) ( not ( = ?auto_284414 ?auto_284420 ) ) ( not ( = ?auto_284414 ?auto_284421 ) ) ( not ( = ?auto_284414 ?auto_284422 ) ) ( not ( = ?auto_284414 ?auto_284423 ) ) ( not ( = ?auto_284414 ?auto_284424 ) ) ( not ( = ?auto_284415 ?auto_284416 ) ) ( not ( = ?auto_284415 ?auto_284418 ) ) ( not ( = ?auto_284415 ?auto_284417 ) ) ( not ( = ?auto_284415 ?auto_284419 ) ) ( not ( = ?auto_284415 ?auto_284420 ) ) ( not ( = ?auto_284415 ?auto_284421 ) ) ( not ( = ?auto_284415 ?auto_284422 ) ) ( not ( = ?auto_284415 ?auto_284423 ) ) ( not ( = ?auto_284415 ?auto_284424 ) ) ( not ( = ?auto_284416 ?auto_284418 ) ) ( not ( = ?auto_284416 ?auto_284417 ) ) ( not ( = ?auto_284416 ?auto_284419 ) ) ( not ( = ?auto_284416 ?auto_284420 ) ) ( not ( = ?auto_284416 ?auto_284421 ) ) ( not ( = ?auto_284416 ?auto_284422 ) ) ( not ( = ?auto_284416 ?auto_284423 ) ) ( not ( = ?auto_284416 ?auto_284424 ) ) ( not ( = ?auto_284418 ?auto_284417 ) ) ( not ( = ?auto_284418 ?auto_284419 ) ) ( not ( = ?auto_284418 ?auto_284420 ) ) ( not ( = ?auto_284418 ?auto_284421 ) ) ( not ( = ?auto_284418 ?auto_284422 ) ) ( not ( = ?auto_284418 ?auto_284423 ) ) ( not ( = ?auto_284418 ?auto_284424 ) ) ( not ( = ?auto_284417 ?auto_284419 ) ) ( not ( = ?auto_284417 ?auto_284420 ) ) ( not ( = ?auto_284417 ?auto_284421 ) ) ( not ( = ?auto_284417 ?auto_284422 ) ) ( not ( = ?auto_284417 ?auto_284423 ) ) ( not ( = ?auto_284417 ?auto_284424 ) ) ( not ( = ?auto_284419 ?auto_284420 ) ) ( not ( = ?auto_284419 ?auto_284421 ) ) ( not ( = ?auto_284419 ?auto_284422 ) ) ( not ( = ?auto_284419 ?auto_284423 ) ) ( not ( = ?auto_284419 ?auto_284424 ) ) ( not ( = ?auto_284420 ?auto_284421 ) ) ( not ( = ?auto_284420 ?auto_284422 ) ) ( not ( = ?auto_284420 ?auto_284423 ) ) ( not ( = ?auto_284420 ?auto_284424 ) ) ( not ( = ?auto_284421 ?auto_284422 ) ) ( not ( = ?auto_284421 ?auto_284423 ) ) ( not ( = ?auto_284421 ?auto_284424 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_284422 ?auto_284423 ?auto_284424 )
      ( MAKE-10CRATE-VERIFY ?auto_284414 ?auto_284415 ?auto_284416 ?auto_284418 ?auto_284417 ?auto_284419 ?auto_284420 ?auto_284421 ?auto_284422 ?auto_284423 ?auto_284424 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_284529 - SURFACE
      ?auto_284530 - SURFACE
      ?auto_284531 - SURFACE
      ?auto_284533 - SURFACE
      ?auto_284532 - SURFACE
      ?auto_284534 - SURFACE
      ?auto_284535 - SURFACE
      ?auto_284536 - SURFACE
      ?auto_284537 - SURFACE
      ?auto_284538 - SURFACE
      ?auto_284539 - SURFACE
    )
    :vars
    (
      ?auto_284542 - HOIST
      ?auto_284541 - PLACE
      ?auto_284544 - TRUCK
      ?auto_284543 - PLACE
      ?auto_284540 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_284542 ?auto_284541 ) ( SURFACE-AT ?auto_284538 ?auto_284541 ) ( CLEAR ?auto_284538 ) ( IS-CRATE ?auto_284539 ) ( not ( = ?auto_284538 ?auto_284539 ) ) ( AVAILABLE ?auto_284542 ) ( ON ?auto_284538 ?auto_284537 ) ( not ( = ?auto_284537 ?auto_284538 ) ) ( not ( = ?auto_284537 ?auto_284539 ) ) ( TRUCK-AT ?auto_284544 ?auto_284543 ) ( not ( = ?auto_284543 ?auto_284541 ) ) ( HOIST-AT ?auto_284540 ?auto_284543 ) ( LIFTING ?auto_284540 ?auto_284539 ) ( not ( = ?auto_284542 ?auto_284540 ) ) ( ON ?auto_284530 ?auto_284529 ) ( ON ?auto_284531 ?auto_284530 ) ( ON ?auto_284533 ?auto_284531 ) ( ON ?auto_284532 ?auto_284533 ) ( ON ?auto_284534 ?auto_284532 ) ( ON ?auto_284535 ?auto_284534 ) ( ON ?auto_284536 ?auto_284535 ) ( ON ?auto_284537 ?auto_284536 ) ( not ( = ?auto_284529 ?auto_284530 ) ) ( not ( = ?auto_284529 ?auto_284531 ) ) ( not ( = ?auto_284529 ?auto_284533 ) ) ( not ( = ?auto_284529 ?auto_284532 ) ) ( not ( = ?auto_284529 ?auto_284534 ) ) ( not ( = ?auto_284529 ?auto_284535 ) ) ( not ( = ?auto_284529 ?auto_284536 ) ) ( not ( = ?auto_284529 ?auto_284537 ) ) ( not ( = ?auto_284529 ?auto_284538 ) ) ( not ( = ?auto_284529 ?auto_284539 ) ) ( not ( = ?auto_284530 ?auto_284531 ) ) ( not ( = ?auto_284530 ?auto_284533 ) ) ( not ( = ?auto_284530 ?auto_284532 ) ) ( not ( = ?auto_284530 ?auto_284534 ) ) ( not ( = ?auto_284530 ?auto_284535 ) ) ( not ( = ?auto_284530 ?auto_284536 ) ) ( not ( = ?auto_284530 ?auto_284537 ) ) ( not ( = ?auto_284530 ?auto_284538 ) ) ( not ( = ?auto_284530 ?auto_284539 ) ) ( not ( = ?auto_284531 ?auto_284533 ) ) ( not ( = ?auto_284531 ?auto_284532 ) ) ( not ( = ?auto_284531 ?auto_284534 ) ) ( not ( = ?auto_284531 ?auto_284535 ) ) ( not ( = ?auto_284531 ?auto_284536 ) ) ( not ( = ?auto_284531 ?auto_284537 ) ) ( not ( = ?auto_284531 ?auto_284538 ) ) ( not ( = ?auto_284531 ?auto_284539 ) ) ( not ( = ?auto_284533 ?auto_284532 ) ) ( not ( = ?auto_284533 ?auto_284534 ) ) ( not ( = ?auto_284533 ?auto_284535 ) ) ( not ( = ?auto_284533 ?auto_284536 ) ) ( not ( = ?auto_284533 ?auto_284537 ) ) ( not ( = ?auto_284533 ?auto_284538 ) ) ( not ( = ?auto_284533 ?auto_284539 ) ) ( not ( = ?auto_284532 ?auto_284534 ) ) ( not ( = ?auto_284532 ?auto_284535 ) ) ( not ( = ?auto_284532 ?auto_284536 ) ) ( not ( = ?auto_284532 ?auto_284537 ) ) ( not ( = ?auto_284532 ?auto_284538 ) ) ( not ( = ?auto_284532 ?auto_284539 ) ) ( not ( = ?auto_284534 ?auto_284535 ) ) ( not ( = ?auto_284534 ?auto_284536 ) ) ( not ( = ?auto_284534 ?auto_284537 ) ) ( not ( = ?auto_284534 ?auto_284538 ) ) ( not ( = ?auto_284534 ?auto_284539 ) ) ( not ( = ?auto_284535 ?auto_284536 ) ) ( not ( = ?auto_284535 ?auto_284537 ) ) ( not ( = ?auto_284535 ?auto_284538 ) ) ( not ( = ?auto_284535 ?auto_284539 ) ) ( not ( = ?auto_284536 ?auto_284537 ) ) ( not ( = ?auto_284536 ?auto_284538 ) ) ( not ( = ?auto_284536 ?auto_284539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_284537 ?auto_284538 ?auto_284539 )
      ( MAKE-10CRATE-VERIFY ?auto_284529 ?auto_284530 ?auto_284531 ?auto_284533 ?auto_284532 ?auto_284534 ?auto_284535 ?auto_284536 ?auto_284537 ?auto_284538 ?auto_284539 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_284654 - SURFACE
      ?auto_284655 - SURFACE
      ?auto_284656 - SURFACE
      ?auto_284658 - SURFACE
      ?auto_284657 - SURFACE
      ?auto_284659 - SURFACE
      ?auto_284660 - SURFACE
      ?auto_284661 - SURFACE
      ?auto_284662 - SURFACE
      ?auto_284663 - SURFACE
      ?auto_284664 - SURFACE
    )
    :vars
    (
      ?auto_284666 - HOIST
      ?auto_284665 - PLACE
      ?auto_284667 - TRUCK
      ?auto_284669 - PLACE
      ?auto_284668 - HOIST
      ?auto_284670 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_284666 ?auto_284665 ) ( SURFACE-AT ?auto_284663 ?auto_284665 ) ( CLEAR ?auto_284663 ) ( IS-CRATE ?auto_284664 ) ( not ( = ?auto_284663 ?auto_284664 ) ) ( AVAILABLE ?auto_284666 ) ( ON ?auto_284663 ?auto_284662 ) ( not ( = ?auto_284662 ?auto_284663 ) ) ( not ( = ?auto_284662 ?auto_284664 ) ) ( TRUCK-AT ?auto_284667 ?auto_284669 ) ( not ( = ?auto_284669 ?auto_284665 ) ) ( HOIST-AT ?auto_284668 ?auto_284669 ) ( not ( = ?auto_284666 ?auto_284668 ) ) ( AVAILABLE ?auto_284668 ) ( SURFACE-AT ?auto_284664 ?auto_284669 ) ( ON ?auto_284664 ?auto_284670 ) ( CLEAR ?auto_284664 ) ( not ( = ?auto_284663 ?auto_284670 ) ) ( not ( = ?auto_284664 ?auto_284670 ) ) ( not ( = ?auto_284662 ?auto_284670 ) ) ( ON ?auto_284655 ?auto_284654 ) ( ON ?auto_284656 ?auto_284655 ) ( ON ?auto_284658 ?auto_284656 ) ( ON ?auto_284657 ?auto_284658 ) ( ON ?auto_284659 ?auto_284657 ) ( ON ?auto_284660 ?auto_284659 ) ( ON ?auto_284661 ?auto_284660 ) ( ON ?auto_284662 ?auto_284661 ) ( not ( = ?auto_284654 ?auto_284655 ) ) ( not ( = ?auto_284654 ?auto_284656 ) ) ( not ( = ?auto_284654 ?auto_284658 ) ) ( not ( = ?auto_284654 ?auto_284657 ) ) ( not ( = ?auto_284654 ?auto_284659 ) ) ( not ( = ?auto_284654 ?auto_284660 ) ) ( not ( = ?auto_284654 ?auto_284661 ) ) ( not ( = ?auto_284654 ?auto_284662 ) ) ( not ( = ?auto_284654 ?auto_284663 ) ) ( not ( = ?auto_284654 ?auto_284664 ) ) ( not ( = ?auto_284654 ?auto_284670 ) ) ( not ( = ?auto_284655 ?auto_284656 ) ) ( not ( = ?auto_284655 ?auto_284658 ) ) ( not ( = ?auto_284655 ?auto_284657 ) ) ( not ( = ?auto_284655 ?auto_284659 ) ) ( not ( = ?auto_284655 ?auto_284660 ) ) ( not ( = ?auto_284655 ?auto_284661 ) ) ( not ( = ?auto_284655 ?auto_284662 ) ) ( not ( = ?auto_284655 ?auto_284663 ) ) ( not ( = ?auto_284655 ?auto_284664 ) ) ( not ( = ?auto_284655 ?auto_284670 ) ) ( not ( = ?auto_284656 ?auto_284658 ) ) ( not ( = ?auto_284656 ?auto_284657 ) ) ( not ( = ?auto_284656 ?auto_284659 ) ) ( not ( = ?auto_284656 ?auto_284660 ) ) ( not ( = ?auto_284656 ?auto_284661 ) ) ( not ( = ?auto_284656 ?auto_284662 ) ) ( not ( = ?auto_284656 ?auto_284663 ) ) ( not ( = ?auto_284656 ?auto_284664 ) ) ( not ( = ?auto_284656 ?auto_284670 ) ) ( not ( = ?auto_284658 ?auto_284657 ) ) ( not ( = ?auto_284658 ?auto_284659 ) ) ( not ( = ?auto_284658 ?auto_284660 ) ) ( not ( = ?auto_284658 ?auto_284661 ) ) ( not ( = ?auto_284658 ?auto_284662 ) ) ( not ( = ?auto_284658 ?auto_284663 ) ) ( not ( = ?auto_284658 ?auto_284664 ) ) ( not ( = ?auto_284658 ?auto_284670 ) ) ( not ( = ?auto_284657 ?auto_284659 ) ) ( not ( = ?auto_284657 ?auto_284660 ) ) ( not ( = ?auto_284657 ?auto_284661 ) ) ( not ( = ?auto_284657 ?auto_284662 ) ) ( not ( = ?auto_284657 ?auto_284663 ) ) ( not ( = ?auto_284657 ?auto_284664 ) ) ( not ( = ?auto_284657 ?auto_284670 ) ) ( not ( = ?auto_284659 ?auto_284660 ) ) ( not ( = ?auto_284659 ?auto_284661 ) ) ( not ( = ?auto_284659 ?auto_284662 ) ) ( not ( = ?auto_284659 ?auto_284663 ) ) ( not ( = ?auto_284659 ?auto_284664 ) ) ( not ( = ?auto_284659 ?auto_284670 ) ) ( not ( = ?auto_284660 ?auto_284661 ) ) ( not ( = ?auto_284660 ?auto_284662 ) ) ( not ( = ?auto_284660 ?auto_284663 ) ) ( not ( = ?auto_284660 ?auto_284664 ) ) ( not ( = ?auto_284660 ?auto_284670 ) ) ( not ( = ?auto_284661 ?auto_284662 ) ) ( not ( = ?auto_284661 ?auto_284663 ) ) ( not ( = ?auto_284661 ?auto_284664 ) ) ( not ( = ?auto_284661 ?auto_284670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_284662 ?auto_284663 ?auto_284664 )
      ( MAKE-10CRATE-VERIFY ?auto_284654 ?auto_284655 ?auto_284656 ?auto_284658 ?auto_284657 ?auto_284659 ?auto_284660 ?auto_284661 ?auto_284662 ?auto_284663 ?auto_284664 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_284780 - SURFACE
      ?auto_284781 - SURFACE
      ?auto_284782 - SURFACE
      ?auto_284784 - SURFACE
      ?auto_284783 - SURFACE
      ?auto_284785 - SURFACE
      ?auto_284786 - SURFACE
      ?auto_284787 - SURFACE
      ?auto_284788 - SURFACE
      ?auto_284789 - SURFACE
      ?auto_284790 - SURFACE
    )
    :vars
    (
      ?auto_284792 - HOIST
      ?auto_284796 - PLACE
      ?auto_284793 - PLACE
      ?auto_284795 - HOIST
      ?auto_284791 - SURFACE
      ?auto_284794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_284792 ?auto_284796 ) ( SURFACE-AT ?auto_284789 ?auto_284796 ) ( CLEAR ?auto_284789 ) ( IS-CRATE ?auto_284790 ) ( not ( = ?auto_284789 ?auto_284790 ) ) ( AVAILABLE ?auto_284792 ) ( ON ?auto_284789 ?auto_284788 ) ( not ( = ?auto_284788 ?auto_284789 ) ) ( not ( = ?auto_284788 ?auto_284790 ) ) ( not ( = ?auto_284793 ?auto_284796 ) ) ( HOIST-AT ?auto_284795 ?auto_284793 ) ( not ( = ?auto_284792 ?auto_284795 ) ) ( AVAILABLE ?auto_284795 ) ( SURFACE-AT ?auto_284790 ?auto_284793 ) ( ON ?auto_284790 ?auto_284791 ) ( CLEAR ?auto_284790 ) ( not ( = ?auto_284789 ?auto_284791 ) ) ( not ( = ?auto_284790 ?auto_284791 ) ) ( not ( = ?auto_284788 ?auto_284791 ) ) ( TRUCK-AT ?auto_284794 ?auto_284796 ) ( ON ?auto_284781 ?auto_284780 ) ( ON ?auto_284782 ?auto_284781 ) ( ON ?auto_284784 ?auto_284782 ) ( ON ?auto_284783 ?auto_284784 ) ( ON ?auto_284785 ?auto_284783 ) ( ON ?auto_284786 ?auto_284785 ) ( ON ?auto_284787 ?auto_284786 ) ( ON ?auto_284788 ?auto_284787 ) ( not ( = ?auto_284780 ?auto_284781 ) ) ( not ( = ?auto_284780 ?auto_284782 ) ) ( not ( = ?auto_284780 ?auto_284784 ) ) ( not ( = ?auto_284780 ?auto_284783 ) ) ( not ( = ?auto_284780 ?auto_284785 ) ) ( not ( = ?auto_284780 ?auto_284786 ) ) ( not ( = ?auto_284780 ?auto_284787 ) ) ( not ( = ?auto_284780 ?auto_284788 ) ) ( not ( = ?auto_284780 ?auto_284789 ) ) ( not ( = ?auto_284780 ?auto_284790 ) ) ( not ( = ?auto_284780 ?auto_284791 ) ) ( not ( = ?auto_284781 ?auto_284782 ) ) ( not ( = ?auto_284781 ?auto_284784 ) ) ( not ( = ?auto_284781 ?auto_284783 ) ) ( not ( = ?auto_284781 ?auto_284785 ) ) ( not ( = ?auto_284781 ?auto_284786 ) ) ( not ( = ?auto_284781 ?auto_284787 ) ) ( not ( = ?auto_284781 ?auto_284788 ) ) ( not ( = ?auto_284781 ?auto_284789 ) ) ( not ( = ?auto_284781 ?auto_284790 ) ) ( not ( = ?auto_284781 ?auto_284791 ) ) ( not ( = ?auto_284782 ?auto_284784 ) ) ( not ( = ?auto_284782 ?auto_284783 ) ) ( not ( = ?auto_284782 ?auto_284785 ) ) ( not ( = ?auto_284782 ?auto_284786 ) ) ( not ( = ?auto_284782 ?auto_284787 ) ) ( not ( = ?auto_284782 ?auto_284788 ) ) ( not ( = ?auto_284782 ?auto_284789 ) ) ( not ( = ?auto_284782 ?auto_284790 ) ) ( not ( = ?auto_284782 ?auto_284791 ) ) ( not ( = ?auto_284784 ?auto_284783 ) ) ( not ( = ?auto_284784 ?auto_284785 ) ) ( not ( = ?auto_284784 ?auto_284786 ) ) ( not ( = ?auto_284784 ?auto_284787 ) ) ( not ( = ?auto_284784 ?auto_284788 ) ) ( not ( = ?auto_284784 ?auto_284789 ) ) ( not ( = ?auto_284784 ?auto_284790 ) ) ( not ( = ?auto_284784 ?auto_284791 ) ) ( not ( = ?auto_284783 ?auto_284785 ) ) ( not ( = ?auto_284783 ?auto_284786 ) ) ( not ( = ?auto_284783 ?auto_284787 ) ) ( not ( = ?auto_284783 ?auto_284788 ) ) ( not ( = ?auto_284783 ?auto_284789 ) ) ( not ( = ?auto_284783 ?auto_284790 ) ) ( not ( = ?auto_284783 ?auto_284791 ) ) ( not ( = ?auto_284785 ?auto_284786 ) ) ( not ( = ?auto_284785 ?auto_284787 ) ) ( not ( = ?auto_284785 ?auto_284788 ) ) ( not ( = ?auto_284785 ?auto_284789 ) ) ( not ( = ?auto_284785 ?auto_284790 ) ) ( not ( = ?auto_284785 ?auto_284791 ) ) ( not ( = ?auto_284786 ?auto_284787 ) ) ( not ( = ?auto_284786 ?auto_284788 ) ) ( not ( = ?auto_284786 ?auto_284789 ) ) ( not ( = ?auto_284786 ?auto_284790 ) ) ( not ( = ?auto_284786 ?auto_284791 ) ) ( not ( = ?auto_284787 ?auto_284788 ) ) ( not ( = ?auto_284787 ?auto_284789 ) ) ( not ( = ?auto_284787 ?auto_284790 ) ) ( not ( = ?auto_284787 ?auto_284791 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_284788 ?auto_284789 ?auto_284790 )
      ( MAKE-10CRATE-VERIFY ?auto_284780 ?auto_284781 ?auto_284782 ?auto_284784 ?auto_284783 ?auto_284785 ?auto_284786 ?auto_284787 ?auto_284788 ?auto_284789 ?auto_284790 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_284906 - SURFACE
      ?auto_284907 - SURFACE
      ?auto_284908 - SURFACE
      ?auto_284910 - SURFACE
      ?auto_284909 - SURFACE
      ?auto_284911 - SURFACE
      ?auto_284912 - SURFACE
      ?auto_284913 - SURFACE
      ?auto_284914 - SURFACE
      ?auto_284915 - SURFACE
      ?auto_284916 - SURFACE
    )
    :vars
    (
      ?auto_284922 - HOIST
      ?auto_284921 - PLACE
      ?auto_284919 - PLACE
      ?auto_284920 - HOIST
      ?auto_284917 - SURFACE
      ?auto_284918 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_284922 ?auto_284921 ) ( IS-CRATE ?auto_284916 ) ( not ( = ?auto_284915 ?auto_284916 ) ) ( not ( = ?auto_284914 ?auto_284915 ) ) ( not ( = ?auto_284914 ?auto_284916 ) ) ( not ( = ?auto_284919 ?auto_284921 ) ) ( HOIST-AT ?auto_284920 ?auto_284919 ) ( not ( = ?auto_284922 ?auto_284920 ) ) ( AVAILABLE ?auto_284920 ) ( SURFACE-AT ?auto_284916 ?auto_284919 ) ( ON ?auto_284916 ?auto_284917 ) ( CLEAR ?auto_284916 ) ( not ( = ?auto_284915 ?auto_284917 ) ) ( not ( = ?auto_284916 ?auto_284917 ) ) ( not ( = ?auto_284914 ?auto_284917 ) ) ( TRUCK-AT ?auto_284918 ?auto_284921 ) ( SURFACE-AT ?auto_284914 ?auto_284921 ) ( CLEAR ?auto_284914 ) ( LIFTING ?auto_284922 ?auto_284915 ) ( IS-CRATE ?auto_284915 ) ( ON ?auto_284907 ?auto_284906 ) ( ON ?auto_284908 ?auto_284907 ) ( ON ?auto_284910 ?auto_284908 ) ( ON ?auto_284909 ?auto_284910 ) ( ON ?auto_284911 ?auto_284909 ) ( ON ?auto_284912 ?auto_284911 ) ( ON ?auto_284913 ?auto_284912 ) ( ON ?auto_284914 ?auto_284913 ) ( not ( = ?auto_284906 ?auto_284907 ) ) ( not ( = ?auto_284906 ?auto_284908 ) ) ( not ( = ?auto_284906 ?auto_284910 ) ) ( not ( = ?auto_284906 ?auto_284909 ) ) ( not ( = ?auto_284906 ?auto_284911 ) ) ( not ( = ?auto_284906 ?auto_284912 ) ) ( not ( = ?auto_284906 ?auto_284913 ) ) ( not ( = ?auto_284906 ?auto_284914 ) ) ( not ( = ?auto_284906 ?auto_284915 ) ) ( not ( = ?auto_284906 ?auto_284916 ) ) ( not ( = ?auto_284906 ?auto_284917 ) ) ( not ( = ?auto_284907 ?auto_284908 ) ) ( not ( = ?auto_284907 ?auto_284910 ) ) ( not ( = ?auto_284907 ?auto_284909 ) ) ( not ( = ?auto_284907 ?auto_284911 ) ) ( not ( = ?auto_284907 ?auto_284912 ) ) ( not ( = ?auto_284907 ?auto_284913 ) ) ( not ( = ?auto_284907 ?auto_284914 ) ) ( not ( = ?auto_284907 ?auto_284915 ) ) ( not ( = ?auto_284907 ?auto_284916 ) ) ( not ( = ?auto_284907 ?auto_284917 ) ) ( not ( = ?auto_284908 ?auto_284910 ) ) ( not ( = ?auto_284908 ?auto_284909 ) ) ( not ( = ?auto_284908 ?auto_284911 ) ) ( not ( = ?auto_284908 ?auto_284912 ) ) ( not ( = ?auto_284908 ?auto_284913 ) ) ( not ( = ?auto_284908 ?auto_284914 ) ) ( not ( = ?auto_284908 ?auto_284915 ) ) ( not ( = ?auto_284908 ?auto_284916 ) ) ( not ( = ?auto_284908 ?auto_284917 ) ) ( not ( = ?auto_284910 ?auto_284909 ) ) ( not ( = ?auto_284910 ?auto_284911 ) ) ( not ( = ?auto_284910 ?auto_284912 ) ) ( not ( = ?auto_284910 ?auto_284913 ) ) ( not ( = ?auto_284910 ?auto_284914 ) ) ( not ( = ?auto_284910 ?auto_284915 ) ) ( not ( = ?auto_284910 ?auto_284916 ) ) ( not ( = ?auto_284910 ?auto_284917 ) ) ( not ( = ?auto_284909 ?auto_284911 ) ) ( not ( = ?auto_284909 ?auto_284912 ) ) ( not ( = ?auto_284909 ?auto_284913 ) ) ( not ( = ?auto_284909 ?auto_284914 ) ) ( not ( = ?auto_284909 ?auto_284915 ) ) ( not ( = ?auto_284909 ?auto_284916 ) ) ( not ( = ?auto_284909 ?auto_284917 ) ) ( not ( = ?auto_284911 ?auto_284912 ) ) ( not ( = ?auto_284911 ?auto_284913 ) ) ( not ( = ?auto_284911 ?auto_284914 ) ) ( not ( = ?auto_284911 ?auto_284915 ) ) ( not ( = ?auto_284911 ?auto_284916 ) ) ( not ( = ?auto_284911 ?auto_284917 ) ) ( not ( = ?auto_284912 ?auto_284913 ) ) ( not ( = ?auto_284912 ?auto_284914 ) ) ( not ( = ?auto_284912 ?auto_284915 ) ) ( not ( = ?auto_284912 ?auto_284916 ) ) ( not ( = ?auto_284912 ?auto_284917 ) ) ( not ( = ?auto_284913 ?auto_284914 ) ) ( not ( = ?auto_284913 ?auto_284915 ) ) ( not ( = ?auto_284913 ?auto_284916 ) ) ( not ( = ?auto_284913 ?auto_284917 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_284914 ?auto_284915 ?auto_284916 )
      ( MAKE-10CRATE-VERIFY ?auto_284906 ?auto_284907 ?auto_284908 ?auto_284910 ?auto_284909 ?auto_284911 ?auto_284912 ?auto_284913 ?auto_284914 ?auto_284915 ?auto_284916 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_285032 - SURFACE
      ?auto_285033 - SURFACE
      ?auto_285034 - SURFACE
      ?auto_285036 - SURFACE
      ?auto_285035 - SURFACE
      ?auto_285037 - SURFACE
      ?auto_285038 - SURFACE
      ?auto_285039 - SURFACE
      ?auto_285040 - SURFACE
      ?auto_285041 - SURFACE
      ?auto_285042 - SURFACE
    )
    :vars
    (
      ?auto_285044 - HOIST
      ?auto_285045 - PLACE
      ?auto_285043 - PLACE
      ?auto_285047 - HOIST
      ?auto_285048 - SURFACE
      ?auto_285046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285044 ?auto_285045 ) ( IS-CRATE ?auto_285042 ) ( not ( = ?auto_285041 ?auto_285042 ) ) ( not ( = ?auto_285040 ?auto_285041 ) ) ( not ( = ?auto_285040 ?auto_285042 ) ) ( not ( = ?auto_285043 ?auto_285045 ) ) ( HOIST-AT ?auto_285047 ?auto_285043 ) ( not ( = ?auto_285044 ?auto_285047 ) ) ( AVAILABLE ?auto_285047 ) ( SURFACE-AT ?auto_285042 ?auto_285043 ) ( ON ?auto_285042 ?auto_285048 ) ( CLEAR ?auto_285042 ) ( not ( = ?auto_285041 ?auto_285048 ) ) ( not ( = ?auto_285042 ?auto_285048 ) ) ( not ( = ?auto_285040 ?auto_285048 ) ) ( TRUCK-AT ?auto_285046 ?auto_285045 ) ( SURFACE-AT ?auto_285040 ?auto_285045 ) ( CLEAR ?auto_285040 ) ( IS-CRATE ?auto_285041 ) ( AVAILABLE ?auto_285044 ) ( IN ?auto_285041 ?auto_285046 ) ( ON ?auto_285033 ?auto_285032 ) ( ON ?auto_285034 ?auto_285033 ) ( ON ?auto_285036 ?auto_285034 ) ( ON ?auto_285035 ?auto_285036 ) ( ON ?auto_285037 ?auto_285035 ) ( ON ?auto_285038 ?auto_285037 ) ( ON ?auto_285039 ?auto_285038 ) ( ON ?auto_285040 ?auto_285039 ) ( not ( = ?auto_285032 ?auto_285033 ) ) ( not ( = ?auto_285032 ?auto_285034 ) ) ( not ( = ?auto_285032 ?auto_285036 ) ) ( not ( = ?auto_285032 ?auto_285035 ) ) ( not ( = ?auto_285032 ?auto_285037 ) ) ( not ( = ?auto_285032 ?auto_285038 ) ) ( not ( = ?auto_285032 ?auto_285039 ) ) ( not ( = ?auto_285032 ?auto_285040 ) ) ( not ( = ?auto_285032 ?auto_285041 ) ) ( not ( = ?auto_285032 ?auto_285042 ) ) ( not ( = ?auto_285032 ?auto_285048 ) ) ( not ( = ?auto_285033 ?auto_285034 ) ) ( not ( = ?auto_285033 ?auto_285036 ) ) ( not ( = ?auto_285033 ?auto_285035 ) ) ( not ( = ?auto_285033 ?auto_285037 ) ) ( not ( = ?auto_285033 ?auto_285038 ) ) ( not ( = ?auto_285033 ?auto_285039 ) ) ( not ( = ?auto_285033 ?auto_285040 ) ) ( not ( = ?auto_285033 ?auto_285041 ) ) ( not ( = ?auto_285033 ?auto_285042 ) ) ( not ( = ?auto_285033 ?auto_285048 ) ) ( not ( = ?auto_285034 ?auto_285036 ) ) ( not ( = ?auto_285034 ?auto_285035 ) ) ( not ( = ?auto_285034 ?auto_285037 ) ) ( not ( = ?auto_285034 ?auto_285038 ) ) ( not ( = ?auto_285034 ?auto_285039 ) ) ( not ( = ?auto_285034 ?auto_285040 ) ) ( not ( = ?auto_285034 ?auto_285041 ) ) ( not ( = ?auto_285034 ?auto_285042 ) ) ( not ( = ?auto_285034 ?auto_285048 ) ) ( not ( = ?auto_285036 ?auto_285035 ) ) ( not ( = ?auto_285036 ?auto_285037 ) ) ( not ( = ?auto_285036 ?auto_285038 ) ) ( not ( = ?auto_285036 ?auto_285039 ) ) ( not ( = ?auto_285036 ?auto_285040 ) ) ( not ( = ?auto_285036 ?auto_285041 ) ) ( not ( = ?auto_285036 ?auto_285042 ) ) ( not ( = ?auto_285036 ?auto_285048 ) ) ( not ( = ?auto_285035 ?auto_285037 ) ) ( not ( = ?auto_285035 ?auto_285038 ) ) ( not ( = ?auto_285035 ?auto_285039 ) ) ( not ( = ?auto_285035 ?auto_285040 ) ) ( not ( = ?auto_285035 ?auto_285041 ) ) ( not ( = ?auto_285035 ?auto_285042 ) ) ( not ( = ?auto_285035 ?auto_285048 ) ) ( not ( = ?auto_285037 ?auto_285038 ) ) ( not ( = ?auto_285037 ?auto_285039 ) ) ( not ( = ?auto_285037 ?auto_285040 ) ) ( not ( = ?auto_285037 ?auto_285041 ) ) ( not ( = ?auto_285037 ?auto_285042 ) ) ( not ( = ?auto_285037 ?auto_285048 ) ) ( not ( = ?auto_285038 ?auto_285039 ) ) ( not ( = ?auto_285038 ?auto_285040 ) ) ( not ( = ?auto_285038 ?auto_285041 ) ) ( not ( = ?auto_285038 ?auto_285042 ) ) ( not ( = ?auto_285038 ?auto_285048 ) ) ( not ( = ?auto_285039 ?auto_285040 ) ) ( not ( = ?auto_285039 ?auto_285041 ) ) ( not ( = ?auto_285039 ?auto_285042 ) ) ( not ( = ?auto_285039 ?auto_285048 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285040 ?auto_285041 ?auto_285042 )
      ( MAKE-10CRATE-VERIFY ?auto_285032 ?auto_285033 ?auto_285034 ?auto_285036 ?auto_285035 ?auto_285037 ?auto_285038 ?auto_285039 ?auto_285040 ?auto_285041 ?auto_285042 ) )
  )

)

