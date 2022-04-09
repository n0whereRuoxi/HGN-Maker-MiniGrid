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

  ( :method MAKE-11CRATE-VERIFY
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
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-12CRATE-VERIFY
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
      ?c11 - SURFACE
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
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
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-14CRATE-VERIFY
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
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-15CRATE-VERIFY
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
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21397 - SURFACE
      ?auto_21398 - SURFACE
    )
    :vars
    (
      ?auto_21399 - HOIST
      ?auto_21400 - PLACE
      ?auto_21402 - PLACE
      ?auto_21403 - HOIST
      ?auto_21404 - SURFACE
      ?auto_21401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21399 ?auto_21400 ) ( SURFACE-AT ?auto_21397 ?auto_21400 ) ( CLEAR ?auto_21397 ) ( IS-CRATE ?auto_21398 ) ( AVAILABLE ?auto_21399 ) ( not ( = ?auto_21402 ?auto_21400 ) ) ( HOIST-AT ?auto_21403 ?auto_21402 ) ( AVAILABLE ?auto_21403 ) ( SURFACE-AT ?auto_21398 ?auto_21402 ) ( ON ?auto_21398 ?auto_21404 ) ( CLEAR ?auto_21398 ) ( TRUCK-AT ?auto_21401 ?auto_21400 ) ( not ( = ?auto_21397 ?auto_21398 ) ) ( not ( = ?auto_21397 ?auto_21404 ) ) ( not ( = ?auto_21398 ?auto_21404 ) ) ( not ( = ?auto_21399 ?auto_21403 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21401 ?auto_21400 ?auto_21402 )
      ( !LIFT ?auto_21403 ?auto_21398 ?auto_21404 ?auto_21402 )
      ( !LOAD ?auto_21403 ?auto_21398 ?auto_21401 ?auto_21402 )
      ( !DRIVE ?auto_21401 ?auto_21402 ?auto_21400 )
      ( !UNLOAD ?auto_21399 ?auto_21398 ?auto_21401 ?auto_21400 )
      ( !DROP ?auto_21399 ?auto_21398 ?auto_21397 ?auto_21400 )
      ( MAKE-1CRATE-VERIFY ?auto_21397 ?auto_21398 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21418 - SURFACE
      ?auto_21419 - SURFACE
      ?auto_21420 - SURFACE
    )
    :vars
    (
      ?auto_21421 - HOIST
      ?auto_21423 - PLACE
      ?auto_21424 - PLACE
      ?auto_21425 - HOIST
      ?auto_21422 - SURFACE
      ?auto_21428 - PLACE
      ?auto_21429 - HOIST
      ?auto_21427 - SURFACE
      ?auto_21426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21421 ?auto_21423 ) ( IS-CRATE ?auto_21420 ) ( not ( = ?auto_21424 ?auto_21423 ) ) ( HOIST-AT ?auto_21425 ?auto_21424 ) ( AVAILABLE ?auto_21425 ) ( SURFACE-AT ?auto_21420 ?auto_21424 ) ( ON ?auto_21420 ?auto_21422 ) ( CLEAR ?auto_21420 ) ( not ( = ?auto_21419 ?auto_21420 ) ) ( not ( = ?auto_21419 ?auto_21422 ) ) ( not ( = ?auto_21420 ?auto_21422 ) ) ( not ( = ?auto_21421 ?auto_21425 ) ) ( SURFACE-AT ?auto_21418 ?auto_21423 ) ( CLEAR ?auto_21418 ) ( IS-CRATE ?auto_21419 ) ( AVAILABLE ?auto_21421 ) ( not ( = ?auto_21428 ?auto_21423 ) ) ( HOIST-AT ?auto_21429 ?auto_21428 ) ( AVAILABLE ?auto_21429 ) ( SURFACE-AT ?auto_21419 ?auto_21428 ) ( ON ?auto_21419 ?auto_21427 ) ( CLEAR ?auto_21419 ) ( TRUCK-AT ?auto_21426 ?auto_21423 ) ( not ( = ?auto_21418 ?auto_21419 ) ) ( not ( = ?auto_21418 ?auto_21427 ) ) ( not ( = ?auto_21419 ?auto_21427 ) ) ( not ( = ?auto_21421 ?auto_21429 ) ) ( not ( = ?auto_21418 ?auto_21420 ) ) ( not ( = ?auto_21418 ?auto_21422 ) ) ( not ( = ?auto_21420 ?auto_21427 ) ) ( not ( = ?auto_21424 ?auto_21428 ) ) ( not ( = ?auto_21425 ?auto_21429 ) ) ( not ( = ?auto_21422 ?auto_21427 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21418 ?auto_21419 )
      ( MAKE-1CRATE ?auto_21419 ?auto_21420 )
      ( MAKE-2CRATE-VERIFY ?auto_21418 ?auto_21419 ?auto_21420 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21444 - SURFACE
      ?auto_21445 - SURFACE
      ?auto_21446 - SURFACE
      ?auto_21447 - SURFACE
    )
    :vars
    (
      ?auto_21451 - HOIST
      ?auto_21448 - PLACE
      ?auto_21450 - PLACE
      ?auto_21449 - HOIST
      ?auto_21452 - SURFACE
      ?auto_21455 - PLACE
      ?auto_21459 - HOIST
      ?auto_21454 - SURFACE
      ?auto_21458 - PLACE
      ?auto_21457 - HOIST
      ?auto_21456 - SURFACE
      ?auto_21453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21451 ?auto_21448 ) ( IS-CRATE ?auto_21447 ) ( not ( = ?auto_21450 ?auto_21448 ) ) ( HOIST-AT ?auto_21449 ?auto_21450 ) ( AVAILABLE ?auto_21449 ) ( SURFACE-AT ?auto_21447 ?auto_21450 ) ( ON ?auto_21447 ?auto_21452 ) ( CLEAR ?auto_21447 ) ( not ( = ?auto_21446 ?auto_21447 ) ) ( not ( = ?auto_21446 ?auto_21452 ) ) ( not ( = ?auto_21447 ?auto_21452 ) ) ( not ( = ?auto_21451 ?auto_21449 ) ) ( IS-CRATE ?auto_21446 ) ( not ( = ?auto_21455 ?auto_21448 ) ) ( HOIST-AT ?auto_21459 ?auto_21455 ) ( AVAILABLE ?auto_21459 ) ( SURFACE-AT ?auto_21446 ?auto_21455 ) ( ON ?auto_21446 ?auto_21454 ) ( CLEAR ?auto_21446 ) ( not ( = ?auto_21445 ?auto_21446 ) ) ( not ( = ?auto_21445 ?auto_21454 ) ) ( not ( = ?auto_21446 ?auto_21454 ) ) ( not ( = ?auto_21451 ?auto_21459 ) ) ( SURFACE-AT ?auto_21444 ?auto_21448 ) ( CLEAR ?auto_21444 ) ( IS-CRATE ?auto_21445 ) ( AVAILABLE ?auto_21451 ) ( not ( = ?auto_21458 ?auto_21448 ) ) ( HOIST-AT ?auto_21457 ?auto_21458 ) ( AVAILABLE ?auto_21457 ) ( SURFACE-AT ?auto_21445 ?auto_21458 ) ( ON ?auto_21445 ?auto_21456 ) ( CLEAR ?auto_21445 ) ( TRUCK-AT ?auto_21453 ?auto_21448 ) ( not ( = ?auto_21444 ?auto_21445 ) ) ( not ( = ?auto_21444 ?auto_21456 ) ) ( not ( = ?auto_21445 ?auto_21456 ) ) ( not ( = ?auto_21451 ?auto_21457 ) ) ( not ( = ?auto_21444 ?auto_21446 ) ) ( not ( = ?auto_21444 ?auto_21454 ) ) ( not ( = ?auto_21446 ?auto_21456 ) ) ( not ( = ?auto_21455 ?auto_21458 ) ) ( not ( = ?auto_21459 ?auto_21457 ) ) ( not ( = ?auto_21454 ?auto_21456 ) ) ( not ( = ?auto_21444 ?auto_21447 ) ) ( not ( = ?auto_21444 ?auto_21452 ) ) ( not ( = ?auto_21445 ?auto_21447 ) ) ( not ( = ?auto_21445 ?auto_21452 ) ) ( not ( = ?auto_21447 ?auto_21454 ) ) ( not ( = ?auto_21447 ?auto_21456 ) ) ( not ( = ?auto_21450 ?auto_21455 ) ) ( not ( = ?auto_21450 ?auto_21458 ) ) ( not ( = ?auto_21449 ?auto_21459 ) ) ( not ( = ?auto_21449 ?auto_21457 ) ) ( not ( = ?auto_21452 ?auto_21454 ) ) ( not ( = ?auto_21452 ?auto_21456 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21444 ?auto_21445 ?auto_21446 )
      ( MAKE-1CRATE ?auto_21446 ?auto_21447 )
      ( MAKE-3CRATE-VERIFY ?auto_21444 ?auto_21445 ?auto_21446 ?auto_21447 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21475 - SURFACE
      ?auto_21476 - SURFACE
      ?auto_21477 - SURFACE
      ?auto_21478 - SURFACE
      ?auto_21479 - SURFACE
    )
    :vars
    (
      ?auto_21481 - HOIST
      ?auto_21482 - PLACE
      ?auto_21480 - PLACE
      ?auto_21484 - HOIST
      ?auto_21485 - SURFACE
      ?auto_21493 - PLACE
      ?auto_21490 - HOIST
      ?auto_21492 - SURFACE
      ?auto_21488 - PLACE
      ?auto_21491 - HOIST
      ?auto_21494 - SURFACE
      ?auto_21487 - PLACE
      ?auto_21489 - HOIST
      ?auto_21486 - SURFACE
      ?auto_21483 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21481 ?auto_21482 ) ( IS-CRATE ?auto_21479 ) ( not ( = ?auto_21480 ?auto_21482 ) ) ( HOIST-AT ?auto_21484 ?auto_21480 ) ( AVAILABLE ?auto_21484 ) ( SURFACE-AT ?auto_21479 ?auto_21480 ) ( ON ?auto_21479 ?auto_21485 ) ( CLEAR ?auto_21479 ) ( not ( = ?auto_21478 ?auto_21479 ) ) ( not ( = ?auto_21478 ?auto_21485 ) ) ( not ( = ?auto_21479 ?auto_21485 ) ) ( not ( = ?auto_21481 ?auto_21484 ) ) ( IS-CRATE ?auto_21478 ) ( not ( = ?auto_21493 ?auto_21482 ) ) ( HOIST-AT ?auto_21490 ?auto_21493 ) ( AVAILABLE ?auto_21490 ) ( SURFACE-AT ?auto_21478 ?auto_21493 ) ( ON ?auto_21478 ?auto_21492 ) ( CLEAR ?auto_21478 ) ( not ( = ?auto_21477 ?auto_21478 ) ) ( not ( = ?auto_21477 ?auto_21492 ) ) ( not ( = ?auto_21478 ?auto_21492 ) ) ( not ( = ?auto_21481 ?auto_21490 ) ) ( IS-CRATE ?auto_21477 ) ( not ( = ?auto_21488 ?auto_21482 ) ) ( HOIST-AT ?auto_21491 ?auto_21488 ) ( AVAILABLE ?auto_21491 ) ( SURFACE-AT ?auto_21477 ?auto_21488 ) ( ON ?auto_21477 ?auto_21494 ) ( CLEAR ?auto_21477 ) ( not ( = ?auto_21476 ?auto_21477 ) ) ( not ( = ?auto_21476 ?auto_21494 ) ) ( not ( = ?auto_21477 ?auto_21494 ) ) ( not ( = ?auto_21481 ?auto_21491 ) ) ( SURFACE-AT ?auto_21475 ?auto_21482 ) ( CLEAR ?auto_21475 ) ( IS-CRATE ?auto_21476 ) ( AVAILABLE ?auto_21481 ) ( not ( = ?auto_21487 ?auto_21482 ) ) ( HOIST-AT ?auto_21489 ?auto_21487 ) ( AVAILABLE ?auto_21489 ) ( SURFACE-AT ?auto_21476 ?auto_21487 ) ( ON ?auto_21476 ?auto_21486 ) ( CLEAR ?auto_21476 ) ( TRUCK-AT ?auto_21483 ?auto_21482 ) ( not ( = ?auto_21475 ?auto_21476 ) ) ( not ( = ?auto_21475 ?auto_21486 ) ) ( not ( = ?auto_21476 ?auto_21486 ) ) ( not ( = ?auto_21481 ?auto_21489 ) ) ( not ( = ?auto_21475 ?auto_21477 ) ) ( not ( = ?auto_21475 ?auto_21494 ) ) ( not ( = ?auto_21477 ?auto_21486 ) ) ( not ( = ?auto_21488 ?auto_21487 ) ) ( not ( = ?auto_21491 ?auto_21489 ) ) ( not ( = ?auto_21494 ?auto_21486 ) ) ( not ( = ?auto_21475 ?auto_21478 ) ) ( not ( = ?auto_21475 ?auto_21492 ) ) ( not ( = ?auto_21476 ?auto_21478 ) ) ( not ( = ?auto_21476 ?auto_21492 ) ) ( not ( = ?auto_21478 ?auto_21494 ) ) ( not ( = ?auto_21478 ?auto_21486 ) ) ( not ( = ?auto_21493 ?auto_21488 ) ) ( not ( = ?auto_21493 ?auto_21487 ) ) ( not ( = ?auto_21490 ?auto_21491 ) ) ( not ( = ?auto_21490 ?auto_21489 ) ) ( not ( = ?auto_21492 ?auto_21494 ) ) ( not ( = ?auto_21492 ?auto_21486 ) ) ( not ( = ?auto_21475 ?auto_21479 ) ) ( not ( = ?auto_21475 ?auto_21485 ) ) ( not ( = ?auto_21476 ?auto_21479 ) ) ( not ( = ?auto_21476 ?auto_21485 ) ) ( not ( = ?auto_21477 ?auto_21479 ) ) ( not ( = ?auto_21477 ?auto_21485 ) ) ( not ( = ?auto_21479 ?auto_21492 ) ) ( not ( = ?auto_21479 ?auto_21494 ) ) ( not ( = ?auto_21479 ?auto_21486 ) ) ( not ( = ?auto_21480 ?auto_21493 ) ) ( not ( = ?auto_21480 ?auto_21488 ) ) ( not ( = ?auto_21480 ?auto_21487 ) ) ( not ( = ?auto_21484 ?auto_21490 ) ) ( not ( = ?auto_21484 ?auto_21491 ) ) ( not ( = ?auto_21484 ?auto_21489 ) ) ( not ( = ?auto_21485 ?auto_21492 ) ) ( not ( = ?auto_21485 ?auto_21494 ) ) ( not ( = ?auto_21485 ?auto_21486 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_21475 ?auto_21476 ?auto_21477 ?auto_21478 )
      ( MAKE-1CRATE ?auto_21478 ?auto_21479 )
      ( MAKE-4CRATE-VERIFY ?auto_21475 ?auto_21476 ?auto_21477 ?auto_21478 ?auto_21479 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_21511 - SURFACE
      ?auto_21512 - SURFACE
      ?auto_21513 - SURFACE
      ?auto_21514 - SURFACE
      ?auto_21515 - SURFACE
      ?auto_21516 - SURFACE
    )
    :vars
    (
      ?auto_21517 - HOIST
      ?auto_21518 - PLACE
      ?auto_21519 - PLACE
      ?auto_21522 - HOIST
      ?auto_21521 - SURFACE
      ?auto_21531 - PLACE
      ?auto_21527 - HOIST
      ?auto_21526 - SURFACE
      ?auto_21533 - PLACE
      ?auto_21524 - HOIST
      ?auto_21523 - SURFACE
      ?auto_21530 - PLACE
      ?auto_21525 - HOIST
      ?auto_21532 - SURFACE
      ?auto_21528 - PLACE
      ?auto_21534 - HOIST
      ?auto_21529 - SURFACE
      ?auto_21520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21517 ?auto_21518 ) ( IS-CRATE ?auto_21516 ) ( not ( = ?auto_21519 ?auto_21518 ) ) ( HOIST-AT ?auto_21522 ?auto_21519 ) ( AVAILABLE ?auto_21522 ) ( SURFACE-AT ?auto_21516 ?auto_21519 ) ( ON ?auto_21516 ?auto_21521 ) ( CLEAR ?auto_21516 ) ( not ( = ?auto_21515 ?auto_21516 ) ) ( not ( = ?auto_21515 ?auto_21521 ) ) ( not ( = ?auto_21516 ?auto_21521 ) ) ( not ( = ?auto_21517 ?auto_21522 ) ) ( IS-CRATE ?auto_21515 ) ( not ( = ?auto_21531 ?auto_21518 ) ) ( HOIST-AT ?auto_21527 ?auto_21531 ) ( AVAILABLE ?auto_21527 ) ( SURFACE-AT ?auto_21515 ?auto_21531 ) ( ON ?auto_21515 ?auto_21526 ) ( CLEAR ?auto_21515 ) ( not ( = ?auto_21514 ?auto_21515 ) ) ( not ( = ?auto_21514 ?auto_21526 ) ) ( not ( = ?auto_21515 ?auto_21526 ) ) ( not ( = ?auto_21517 ?auto_21527 ) ) ( IS-CRATE ?auto_21514 ) ( not ( = ?auto_21533 ?auto_21518 ) ) ( HOIST-AT ?auto_21524 ?auto_21533 ) ( AVAILABLE ?auto_21524 ) ( SURFACE-AT ?auto_21514 ?auto_21533 ) ( ON ?auto_21514 ?auto_21523 ) ( CLEAR ?auto_21514 ) ( not ( = ?auto_21513 ?auto_21514 ) ) ( not ( = ?auto_21513 ?auto_21523 ) ) ( not ( = ?auto_21514 ?auto_21523 ) ) ( not ( = ?auto_21517 ?auto_21524 ) ) ( IS-CRATE ?auto_21513 ) ( not ( = ?auto_21530 ?auto_21518 ) ) ( HOIST-AT ?auto_21525 ?auto_21530 ) ( AVAILABLE ?auto_21525 ) ( SURFACE-AT ?auto_21513 ?auto_21530 ) ( ON ?auto_21513 ?auto_21532 ) ( CLEAR ?auto_21513 ) ( not ( = ?auto_21512 ?auto_21513 ) ) ( not ( = ?auto_21512 ?auto_21532 ) ) ( not ( = ?auto_21513 ?auto_21532 ) ) ( not ( = ?auto_21517 ?auto_21525 ) ) ( SURFACE-AT ?auto_21511 ?auto_21518 ) ( CLEAR ?auto_21511 ) ( IS-CRATE ?auto_21512 ) ( AVAILABLE ?auto_21517 ) ( not ( = ?auto_21528 ?auto_21518 ) ) ( HOIST-AT ?auto_21534 ?auto_21528 ) ( AVAILABLE ?auto_21534 ) ( SURFACE-AT ?auto_21512 ?auto_21528 ) ( ON ?auto_21512 ?auto_21529 ) ( CLEAR ?auto_21512 ) ( TRUCK-AT ?auto_21520 ?auto_21518 ) ( not ( = ?auto_21511 ?auto_21512 ) ) ( not ( = ?auto_21511 ?auto_21529 ) ) ( not ( = ?auto_21512 ?auto_21529 ) ) ( not ( = ?auto_21517 ?auto_21534 ) ) ( not ( = ?auto_21511 ?auto_21513 ) ) ( not ( = ?auto_21511 ?auto_21532 ) ) ( not ( = ?auto_21513 ?auto_21529 ) ) ( not ( = ?auto_21530 ?auto_21528 ) ) ( not ( = ?auto_21525 ?auto_21534 ) ) ( not ( = ?auto_21532 ?auto_21529 ) ) ( not ( = ?auto_21511 ?auto_21514 ) ) ( not ( = ?auto_21511 ?auto_21523 ) ) ( not ( = ?auto_21512 ?auto_21514 ) ) ( not ( = ?auto_21512 ?auto_21523 ) ) ( not ( = ?auto_21514 ?auto_21532 ) ) ( not ( = ?auto_21514 ?auto_21529 ) ) ( not ( = ?auto_21533 ?auto_21530 ) ) ( not ( = ?auto_21533 ?auto_21528 ) ) ( not ( = ?auto_21524 ?auto_21525 ) ) ( not ( = ?auto_21524 ?auto_21534 ) ) ( not ( = ?auto_21523 ?auto_21532 ) ) ( not ( = ?auto_21523 ?auto_21529 ) ) ( not ( = ?auto_21511 ?auto_21515 ) ) ( not ( = ?auto_21511 ?auto_21526 ) ) ( not ( = ?auto_21512 ?auto_21515 ) ) ( not ( = ?auto_21512 ?auto_21526 ) ) ( not ( = ?auto_21513 ?auto_21515 ) ) ( not ( = ?auto_21513 ?auto_21526 ) ) ( not ( = ?auto_21515 ?auto_21523 ) ) ( not ( = ?auto_21515 ?auto_21532 ) ) ( not ( = ?auto_21515 ?auto_21529 ) ) ( not ( = ?auto_21531 ?auto_21533 ) ) ( not ( = ?auto_21531 ?auto_21530 ) ) ( not ( = ?auto_21531 ?auto_21528 ) ) ( not ( = ?auto_21527 ?auto_21524 ) ) ( not ( = ?auto_21527 ?auto_21525 ) ) ( not ( = ?auto_21527 ?auto_21534 ) ) ( not ( = ?auto_21526 ?auto_21523 ) ) ( not ( = ?auto_21526 ?auto_21532 ) ) ( not ( = ?auto_21526 ?auto_21529 ) ) ( not ( = ?auto_21511 ?auto_21516 ) ) ( not ( = ?auto_21511 ?auto_21521 ) ) ( not ( = ?auto_21512 ?auto_21516 ) ) ( not ( = ?auto_21512 ?auto_21521 ) ) ( not ( = ?auto_21513 ?auto_21516 ) ) ( not ( = ?auto_21513 ?auto_21521 ) ) ( not ( = ?auto_21514 ?auto_21516 ) ) ( not ( = ?auto_21514 ?auto_21521 ) ) ( not ( = ?auto_21516 ?auto_21526 ) ) ( not ( = ?auto_21516 ?auto_21523 ) ) ( not ( = ?auto_21516 ?auto_21532 ) ) ( not ( = ?auto_21516 ?auto_21529 ) ) ( not ( = ?auto_21519 ?auto_21531 ) ) ( not ( = ?auto_21519 ?auto_21533 ) ) ( not ( = ?auto_21519 ?auto_21530 ) ) ( not ( = ?auto_21519 ?auto_21528 ) ) ( not ( = ?auto_21522 ?auto_21527 ) ) ( not ( = ?auto_21522 ?auto_21524 ) ) ( not ( = ?auto_21522 ?auto_21525 ) ) ( not ( = ?auto_21522 ?auto_21534 ) ) ( not ( = ?auto_21521 ?auto_21526 ) ) ( not ( = ?auto_21521 ?auto_21523 ) ) ( not ( = ?auto_21521 ?auto_21532 ) ) ( not ( = ?auto_21521 ?auto_21529 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_21511 ?auto_21512 ?auto_21513 ?auto_21514 ?auto_21515 )
      ( MAKE-1CRATE ?auto_21515 ?auto_21516 )
      ( MAKE-5CRATE-VERIFY ?auto_21511 ?auto_21512 ?auto_21513 ?auto_21514 ?auto_21515 ?auto_21516 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_21552 - SURFACE
      ?auto_21553 - SURFACE
      ?auto_21554 - SURFACE
      ?auto_21555 - SURFACE
      ?auto_21556 - SURFACE
      ?auto_21557 - SURFACE
      ?auto_21558 - SURFACE
    )
    :vars
    (
      ?auto_21564 - HOIST
      ?auto_21560 - PLACE
      ?auto_21561 - PLACE
      ?auto_21563 - HOIST
      ?auto_21559 - SURFACE
      ?auto_21565 - PLACE
      ?auto_21570 - HOIST
      ?auto_21569 - SURFACE
      ?auto_21575 - PLACE
      ?auto_21578 - HOIST
      ?auto_21566 - SURFACE
      ?auto_21579 - PLACE
      ?auto_21567 - HOIST
      ?auto_21571 - SURFACE
      ?auto_21574 - PLACE
      ?auto_21568 - HOIST
      ?auto_21572 - SURFACE
      ?auto_21577 - PLACE
      ?auto_21573 - HOIST
      ?auto_21576 - SURFACE
      ?auto_21562 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21564 ?auto_21560 ) ( IS-CRATE ?auto_21558 ) ( not ( = ?auto_21561 ?auto_21560 ) ) ( HOIST-AT ?auto_21563 ?auto_21561 ) ( AVAILABLE ?auto_21563 ) ( SURFACE-AT ?auto_21558 ?auto_21561 ) ( ON ?auto_21558 ?auto_21559 ) ( CLEAR ?auto_21558 ) ( not ( = ?auto_21557 ?auto_21558 ) ) ( not ( = ?auto_21557 ?auto_21559 ) ) ( not ( = ?auto_21558 ?auto_21559 ) ) ( not ( = ?auto_21564 ?auto_21563 ) ) ( IS-CRATE ?auto_21557 ) ( not ( = ?auto_21565 ?auto_21560 ) ) ( HOIST-AT ?auto_21570 ?auto_21565 ) ( AVAILABLE ?auto_21570 ) ( SURFACE-AT ?auto_21557 ?auto_21565 ) ( ON ?auto_21557 ?auto_21569 ) ( CLEAR ?auto_21557 ) ( not ( = ?auto_21556 ?auto_21557 ) ) ( not ( = ?auto_21556 ?auto_21569 ) ) ( not ( = ?auto_21557 ?auto_21569 ) ) ( not ( = ?auto_21564 ?auto_21570 ) ) ( IS-CRATE ?auto_21556 ) ( not ( = ?auto_21575 ?auto_21560 ) ) ( HOIST-AT ?auto_21578 ?auto_21575 ) ( AVAILABLE ?auto_21578 ) ( SURFACE-AT ?auto_21556 ?auto_21575 ) ( ON ?auto_21556 ?auto_21566 ) ( CLEAR ?auto_21556 ) ( not ( = ?auto_21555 ?auto_21556 ) ) ( not ( = ?auto_21555 ?auto_21566 ) ) ( not ( = ?auto_21556 ?auto_21566 ) ) ( not ( = ?auto_21564 ?auto_21578 ) ) ( IS-CRATE ?auto_21555 ) ( not ( = ?auto_21579 ?auto_21560 ) ) ( HOIST-AT ?auto_21567 ?auto_21579 ) ( AVAILABLE ?auto_21567 ) ( SURFACE-AT ?auto_21555 ?auto_21579 ) ( ON ?auto_21555 ?auto_21571 ) ( CLEAR ?auto_21555 ) ( not ( = ?auto_21554 ?auto_21555 ) ) ( not ( = ?auto_21554 ?auto_21571 ) ) ( not ( = ?auto_21555 ?auto_21571 ) ) ( not ( = ?auto_21564 ?auto_21567 ) ) ( IS-CRATE ?auto_21554 ) ( not ( = ?auto_21574 ?auto_21560 ) ) ( HOIST-AT ?auto_21568 ?auto_21574 ) ( AVAILABLE ?auto_21568 ) ( SURFACE-AT ?auto_21554 ?auto_21574 ) ( ON ?auto_21554 ?auto_21572 ) ( CLEAR ?auto_21554 ) ( not ( = ?auto_21553 ?auto_21554 ) ) ( not ( = ?auto_21553 ?auto_21572 ) ) ( not ( = ?auto_21554 ?auto_21572 ) ) ( not ( = ?auto_21564 ?auto_21568 ) ) ( SURFACE-AT ?auto_21552 ?auto_21560 ) ( CLEAR ?auto_21552 ) ( IS-CRATE ?auto_21553 ) ( AVAILABLE ?auto_21564 ) ( not ( = ?auto_21577 ?auto_21560 ) ) ( HOIST-AT ?auto_21573 ?auto_21577 ) ( AVAILABLE ?auto_21573 ) ( SURFACE-AT ?auto_21553 ?auto_21577 ) ( ON ?auto_21553 ?auto_21576 ) ( CLEAR ?auto_21553 ) ( TRUCK-AT ?auto_21562 ?auto_21560 ) ( not ( = ?auto_21552 ?auto_21553 ) ) ( not ( = ?auto_21552 ?auto_21576 ) ) ( not ( = ?auto_21553 ?auto_21576 ) ) ( not ( = ?auto_21564 ?auto_21573 ) ) ( not ( = ?auto_21552 ?auto_21554 ) ) ( not ( = ?auto_21552 ?auto_21572 ) ) ( not ( = ?auto_21554 ?auto_21576 ) ) ( not ( = ?auto_21574 ?auto_21577 ) ) ( not ( = ?auto_21568 ?auto_21573 ) ) ( not ( = ?auto_21572 ?auto_21576 ) ) ( not ( = ?auto_21552 ?auto_21555 ) ) ( not ( = ?auto_21552 ?auto_21571 ) ) ( not ( = ?auto_21553 ?auto_21555 ) ) ( not ( = ?auto_21553 ?auto_21571 ) ) ( not ( = ?auto_21555 ?auto_21572 ) ) ( not ( = ?auto_21555 ?auto_21576 ) ) ( not ( = ?auto_21579 ?auto_21574 ) ) ( not ( = ?auto_21579 ?auto_21577 ) ) ( not ( = ?auto_21567 ?auto_21568 ) ) ( not ( = ?auto_21567 ?auto_21573 ) ) ( not ( = ?auto_21571 ?auto_21572 ) ) ( not ( = ?auto_21571 ?auto_21576 ) ) ( not ( = ?auto_21552 ?auto_21556 ) ) ( not ( = ?auto_21552 ?auto_21566 ) ) ( not ( = ?auto_21553 ?auto_21556 ) ) ( not ( = ?auto_21553 ?auto_21566 ) ) ( not ( = ?auto_21554 ?auto_21556 ) ) ( not ( = ?auto_21554 ?auto_21566 ) ) ( not ( = ?auto_21556 ?auto_21571 ) ) ( not ( = ?auto_21556 ?auto_21572 ) ) ( not ( = ?auto_21556 ?auto_21576 ) ) ( not ( = ?auto_21575 ?auto_21579 ) ) ( not ( = ?auto_21575 ?auto_21574 ) ) ( not ( = ?auto_21575 ?auto_21577 ) ) ( not ( = ?auto_21578 ?auto_21567 ) ) ( not ( = ?auto_21578 ?auto_21568 ) ) ( not ( = ?auto_21578 ?auto_21573 ) ) ( not ( = ?auto_21566 ?auto_21571 ) ) ( not ( = ?auto_21566 ?auto_21572 ) ) ( not ( = ?auto_21566 ?auto_21576 ) ) ( not ( = ?auto_21552 ?auto_21557 ) ) ( not ( = ?auto_21552 ?auto_21569 ) ) ( not ( = ?auto_21553 ?auto_21557 ) ) ( not ( = ?auto_21553 ?auto_21569 ) ) ( not ( = ?auto_21554 ?auto_21557 ) ) ( not ( = ?auto_21554 ?auto_21569 ) ) ( not ( = ?auto_21555 ?auto_21557 ) ) ( not ( = ?auto_21555 ?auto_21569 ) ) ( not ( = ?auto_21557 ?auto_21566 ) ) ( not ( = ?auto_21557 ?auto_21571 ) ) ( not ( = ?auto_21557 ?auto_21572 ) ) ( not ( = ?auto_21557 ?auto_21576 ) ) ( not ( = ?auto_21565 ?auto_21575 ) ) ( not ( = ?auto_21565 ?auto_21579 ) ) ( not ( = ?auto_21565 ?auto_21574 ) ) ( not ( = ?auto_21565 ?auto_21577 ) ) ( not ( = ?auto_21570 ?auto_21578 ) ) ( not ( = ?auto_21570 ?auto_21567 ) ) ( not ( = ?auto_21570 ?auto_21568 ) ) ( not ( = ?auto_21570 ?auto_21573 ) ) ( not ( = ?auto_21569 ?auto_21566 ) ) ( not ( = ?auto_21569 ?auto_21571 ) ) ( not ( = ?auto_21569 ?auto_21572 ) ) ( not ( = ?auto_21569 ?auto_21576 ) ) ( not ( = ?auto_21552 ?auto_21558 ) ) ( not ( = ?auto_21552 ?auto_21559 ) ) ( not ( = ?auto_21553 ?auto_21558 ) ) ( not ( = ?auto_21553 ?auto_21559 ) ) ( not ( = ?auto_21554 ?auto_21558 ) ) ( not ( = ?auto_21554 ?auto_21559 ) ) ( not ( = ?auto_21555 ?auto_21558 ) ) ( not ( = ?auto_21555 ?auto_21559 ) ) ( not ( = ?auto_21556 ?auto_21558 ) ) ( not ( = ?auto_21556 ?auto_21559 ) ) ( not ( = ?auto_21558 ?auto_21569 ) ) ( not ( = ?auto_21558 ?auto_21566 ) ) ( not ( = ?auto_21558 ?auto_21571 ) ) ( not ( = ?auto_21558 ?auto_21572 ) ) ( not ( = ?auto_21558 ?auto_21576 ) ) ( not ( = ?auto_21561 ?auto_21565 ) ) ( not ( = ?auto_21561 ?auto_21575 ) ) ( not ( = ?auto_21561 ?auto_21579 ) ) ( not ( = ?auto_21561 ?auto_21574 ) ) ( not ( = ?auto_21561 ?auto_21577 ) ) ( not ( = ?auto_21563 ?auto_21570 ) ) ( not ( = ?auto_21563 ?auto_21578 ) ) ( not ( = ?auto_21563 ?auto_21567 ) ) ( not ( = ?auto_21563 ?auto_21568 ) ) ( not ( = ?auto_21563 ?auto_21573 ) ) ( not ( = ?auto_21559 ?auto_21569 ) ) ( not ( = ?auto_21559 ?auto_21566 ) ) ( not ( = ?auto_21559 ?auto_21571 ) ) ( not ( = ?auto_21559 ?auto_21572 ) ) ( not ( = ?auto_21559 ?auto_21576 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_21552 ?auto_21553 ?auto_21554 ?auto_21555 ?auto_21556 ?auto_21557 )
      ( MAKE-1CRATE ?auto_21557 ?auto_21558 )
      ( MAKE-6CRATE-VERIFY ?auto_21552 ?auto_21553 ?auto_21554 ?auto_21555 ?auto_21556 ?auto_21557 ?auto_21558 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_21598 - SURFACE
      ?auto_21599 - SURFACE
      ?auto_21600 - SURFACE
      ?auto_21601 - SURFACE
      ?auto_21602 - SURFACE
      ?auto_21603 - SURFACE
      ?auto_21604 - SURFACE
      ?auto_21605 - SURFACE
    )
    :vars
    (
      ?auto_21608 - HOIST
      ?auto_21607 - PLACE
      ?auto_21606 - PLACE
      ?auto_21610 - HOIST
      ?auto_21609 - SURFACE
      ?auto_21617 - PLACE
      ?auto_21629 - HOIST
      ?auto_21625 - SURFACE
      ?auto_21620 - PLACE
      ?auto_21615 - HOIST
      ?auto_21616 - SURFACE
      ?auto_21623 - PLACE
      ?auto_21612 - HOIST
      ?auto_21622 - SURFACE
      ?auto_21627 - PLACE
      ?auto_21628 - HOIST
      ?auto_21614 - SURFACE
      ?auto_21618 - PLACE
      ?auto_21621 - HOIST
      ?auto_21613 - SURFACE
      ?auto_21624 - PLACE
      ?auto_21626 - HOIST
      ?auto_21619 - SURFACE
      ?auto_21611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21608 ?auto_21607 ) ( IS-CRATE ?auto_21605 ) ( not ( = ?auto_21606 ?auto_21607 ) ) ( HOIST-AT ?auto_21610 ?auto_21606 ) ( AVAILABLE ?auto_21610 ) ( SURFACE-AT ?auto_21605 ?auto_21606 ) ( ON ?auto_21605 ?auto_21609 ) ( CLEAR ?auto_21605 ) ( not ( = ?auto_21604 ?auto_21605 ) ) ( not ( = ?auto_21604 ?auto_21609 ) ) ( not ( = ?auto_21605 ?auto_21609 ) ) ( not ( = ?auto_21608 ?auto_21610 ) ) ( IS-CRATE ?auto_21604 ) ( not ( = ?auto_21617 ?auto_21607 ) ) ( HOIST-AT ?auto_21629 ?auto_21617 ) ( AVAILABLE ?auto_21629 ) ( SURFACE-AT ?auto_21604 ?auto_21617 ) ( ON ?auto_21604 ?auto_21625 ) ( CLEAR ?auto_21604 ) ( not ( = ?auto_21603 ?auto_21604 ) ) ( not ( = ?auto_21603 ?auto_21625 ) ) ( not ( = ?auto_21604 ?auto_21625 ) ) ( not ( = ?auto_21608 ?auto_21629 ) ) ( IS-CRATE ?auto_21603 ) ( not ( = ?auto_21620 ?auto_21607 ) ) ( HOIST-AT ?auto_21615 ?auto_21620 ) ( AVAILABLE ?auto_21615 ) ( SURFACE-AT ?auto_21603 ?auto_21620 ) ( ON ?auto_21603 ?auto_21616 ) ( CLEAR ?auto_21603 ) ( not ( = ?auto_21602 ?auto_21603 ) ) ( not ( = ?auto_21602 ?auto_21616 ) ) ( not ( = ?auto_21603 ?auto_21616 ) ) ( not ( = ?auto_21608 ?auto_21615 ) ) ( IS-CRATE ?auto_21602 ) ( not ( = ?auto_21623 ?auto_21607 ) ) ( HOIST-AT ?auto_21612 ?auto_21623 ) ( AVAILABLE ?auto_21612 ) ( SURFACE-AT ?auto_21602 ?auto_21623 ) ( ON ?auto_21602 ?auto_21622 ) ( CLEAR ?auto_21602 ) ( not ( = ?auto_21601 ?auto_21602 ) ) ( not ( = ?auto_21601 ?auto_21622 ) ) ( not ( = ?auto_21602 ?auto_21622 ) ) ( not ( = ?auto_21608 ?auto_21612 ) ) ( IS-CRATE ?auto_21601 ) ( not ( = ?auto_21627 ?auto_21607 ) ) ( HOIST-AT ?auto_21628 ?auto_21627 ) ( AVAILABLE ?auto_21628 ) ( SURFACE-AT ?auto_21601 ?auto_21627 ) ( ON ?auto_21601 ?auto_21614 ) ( CLEAR ?auto_21601 ) ( not ( = ?auto_21600 ?auto_21601 ) ) ( not ( = ?auto_21600 ?auto_21614 ) ) ( not ( = ?auto_21601 ?auto_21614 ) ) ( not ( = ?auto_21608 ?auto_21628 ) ) ( IS-CRATE ?auto_21600 ) ( not ( = ?auto_21618 ?auto_21607 ) ) ( HOIST-AT ?auto_21621 ?auto_21618 ) ( AVAILABLE ?auto_21621 ) ( SURFACE-AT ?auto_21600 ?auto_21618 ) ( ON ?auto_21600 ?auto_21613 ) ( CLEAR ?auto_21600 ) ( not ( = ?auto_21599 ?auto_21600 ) ) ( not ( = ?auto_21599 ?auto_21613 ) ) ( not ( = ?auto_21600 ?auto_21613 ) ) ( not ( = ?auto_21608 ?auto_21621 ) ) ( SURFACE-AT ?auto_21598 ?auto_21607 ) ( CLEAR ?auto_21598 ) ( IS-CRATE ?auto_21599 ) ( AVAILABLE ?auto_21608 ) ( not ( = ?auto_21624 ?auto_21607 ) ) ( HOIST-AT ?auto_21626 ?auto_21624 ) ( AVAILABLE ?auto_21626 ) ( SURFACE-AT ?auto_21599 ?auto_21624 ) ( ON ?auto_21599 ?auto_21619 ) ( CLEAR ?auto_21599 ) ( TRUCK-AT ?auto_21611 ?auto_21607 ) ( not ( = ?auto_21598 ?auto_21599 ) ) ( not ( = ?auto_21598 ?auto_21619 ) ) ( not ( = ?auto_21599 ?auto_21619 ) ) ( not ( = ?auto_21608 ?auto_21626 ) ) ( not ( = ?auto_21598 ?auto_21600 ) ) ( not ( = ?auto_21598 ?auto_21613 ) ) ( not ( = ?auto_21600 ?auto_21619 ) ) ( not ( = ?auto_21618 ?auto_21624 ) ) ( not ( = ?auto_21621 ?auto_21626 ) ) ( not ( = ?auto_21613 ?auto_21619 ) ) ( not ( = ?auto_21598 ?auto_21601 ) ) ( not ( = ?auto_21598 ?auto_21614 ) ) ( not ( = ?auto_21599 ?auto_21601 ) ) ( not ( = ?auto_21599 ?auto_21614 ) ) ( not ( = ?auto_21601 ?auto_21613 ) ) ( not ( = ?auto_21601 ?auto_21619 ) ) ( not ( = ?auto_21627 ?auto_21618 ) ) ( not ( = ?auto_21627 ?auto_21624 ) ) ( not ( = ?auto_21628 ?auto_21621 ) ) ( not ( = ?auto_21628 ?auto_21626 ) ) ( not ( = ?auto_21614 ?auto_21613 ) ) ( not ( = ?auto_21614 ?auto_21619 ) ) ( not ( = ?auto_21598 ?auto_21602 ) ) ( not ( = ?auto_21598 ?auto_21622 ) ) ( not ( = ?auto_21599 ?auto_21602 ) ) ( not ( = ?auto_21599 ?auto_21622 ) ) ( not ( = ?auto_21600 ?auto_21602 ) ) ( not ( = ?auto_21600 ?auto_21622 ) ) ( not ( = ?auto_21602 ?auto_21614 ) ) ( not ( = ?auto_21602 ?auto_21613 ) ) ( not ( = ?auto_21602 ?auto_21619 ) ) ( not ( = ?auto_21623 ?auto_21627 ) ) ( not ( = ?auto_21623 ?auto_21618 ) ) ( not ( = ?auto_21623 ?auto_21624 ) ) ( not ( = ?auto_21612 ?auto_21628 ) ) ( not ( = ?auto_21612 ?auto_21621 ) ) ( not ( = ?auto_21612 ?auto_21626 ) ) ( not ( = ?auto_21622 ?auto_21614 ) ) ( not ( = ?auto_21622 ?auto_21613 ) ) ( not ( = ?auto_21622 ?auto_21619 ) ) ( not ( = ?auto_21598 ?auto_21603 ) ) ( not ( = ?auto_21598 ?auto_21616 ) ) ( not ( = ?auto_21599 ?auto_21603 ) ) ( not ( = ?auto_21599 ?auto_21616 ) ) ( not ( = ?auto_21600 ?auto_21603 ) ) ( not ( = ?auto_21600 ?auto_21616 ) ) ( not ( = ?auto_21601 ?auto_21603 ) ) ( not ( = ?auto_21601 ?auto_21616 ) ) ( not ( = ?auto_21603 ?auto_21622 ) ) ( not ( = ?auto_21603 ?auto_21614 ) ) ( not ( = ?auto_21603 ?auto_21613 ) ) ( not ( = ?auto_21603 ?auto_21619 ) ) ( not ( = ?auto_21620 ?auto_21623 ) ) ( not ( = ?auto_21620 ?auto_21627 ) ) ( not ( = ?auto_21620 ?auto_21618 ) ) ( not ( = ?auto_21620 ?auto_21624 ) ) ( not ( = ?auto_21615 ?auto_21612 ) ) ( not ( = ?auto_21615 ?auto_21628 ) ) ( not ( = ?auto_21615 ?auto_21621 ) ) ( not ( = ?auto_21615 ?auto_21626 ) ) ( not ( = ?auto_21616 ?auto_21622 ) ) ( not ( = ?auto_21616 ?auto_21614 ) ) ( not ( = ?auto_21616 ?auto_21613 ) ) ( not ( = ?auto_21616 ?auto_21619 ) ) ( not ( = ?auto_21598 ?auto_21604 ) ) ( not ( = ?auto_21598 ?auto_21625 ) ) ( not ( = ?auto_21599 ?auto_21604 ) ) ( not ( = ?auto_21599 ?auto_21625 ) ) ( not ( = ?auto_21600 ?auto_21604 ) ) ( not ( = ?auto_21600 ?auto_21625 ) ) ( not ( = ?auto_21601 ?auto_21604 ) ) ( not ( = ?auto_21601 ?auto_21625 ) ) ( not ( = ?auto_21602 ?auto_21604 ) ) ( not ( = ?auto_21602 ?auto_21625 ) ) ( not ( = ?auto_21604 ?auto_21616 ) ) ( not ( = ?auto_21604 ?auto_21622 ) ) ( not ( = ?auto_21604 ?auto_21614 ) ) ( not ( = ?auto_21604 ?auto_21613 ) ) ( not ( = ?auto_21604 ?auto_21619 ) ) ( not ( = ?auto_21617 ?auto_21620 ) ) ( not ( = ?auto_21617 ?auto_21623 ) ) ( not ( = ?auto_21617 ?auto_21627 ) ) ( not ( = ?auto_21617 ?auto_21618 ) ) ( not ( = ?auto_21617 ?auto_21624 ) ) ( not ( = ?auto_21629 ?auto_21615 ) ) ( not ( = ?auto_21629 ?auto_21612 ) ) ( not ( = ?auto_21629 ?auto_21628 ) ) ( not ( = ?auto_21629 ?auto_21621 ) ) ( not ( = ?auto_21629 ?auto_21626 ) ) ( not ( = ?auto_21625 ?auto_21616 ) ) ( not ( = ?auto_21625 ?auto_21622 ) ) ( not ( = ?auto_21625 ?auto_21614 ) ) ( not ( = ?auto_21625 ?auto_21613 ) ) ( not ( = ?auto_21625 ?auto_21619 ) ) ( not ( = ?auto_21598 ?auto_21605 ) ) ( not ( = ?auto_21598 ?auto_21609 ) ) ( not ( = ?auto_21599 ?auto_21605 ) ) ( not ( = ?auto_21599 ?auto_21609 ) ) ( not ( = ?auto_21600 ?auto_21605 ) ) ( not ( = ?auto_21600 ?auto_21609 ) ) ( not ( = ?auto_21601 ?auto_21605 ) ) ( not ( = ?auto_21601 ?auto_21609 ) ) ( not ( = ?auto_21602 ?auto_21605 ) ) ( not ( = ?auto_21602 ?auto_21609 ) ) ( not ( = ?auto_21603 ?auto_21605 ) ) ( not ( = ?auto_21603 ?auto_21609 ) ) ( not ( = ?auto_21605 ?auto_21625 ) ) ( not ( = ?auto_21605 ?auto_21616 ) ) ( not ( = ?auto_21605 ?auto_21622 ) ) ( not ( = ?auto_21605 ?auto_21614 ) ) ( not ( = ?auto_21605 ?auto_21613 ) ) ( not ( = ?auto_21605 ?auto_21619 ) ) ( not ( = ?auto_21606 ?auto_21617 ) ) ( not ( = ?auto_21606 ?auto_21620 ) ) ( not ( = ?auto_21606 ?auto_21623 ) ) ( not ( = ?auto_21606 ?auto_21627 ) ) ( not ( = ?auto_21606 ?auto_21618 ) ) ( not ( = ?auto_21606 ?auto_21624 ) ) ( not ( = ?auto_21610 ?auto_21629 ) ) ( not ( = ?auto_21610 ?auto_21615 ) ) ( not ( = ?auto_21610 ?auto_21612 ) ) ( not ( = ?auto_21610 ?auto_21628 ) ) ( not ( = ?auto_21610 ?auto_21621 ) ) ( not ( = ?auto_21610 ?auto_21626 ) ) ( not ( = ?auto_21609 ?auto_21625 ) ) ( not ( = ?auto_21609 ?auto_21616 ) ) ( not ( = ?auto_21609 ?auto_21622 ) ) ( not ( = ?auto_21609 ?auto_21614 ) ) ( not ( = ?auto_21609 ?auto_21613 ) ) ( not ( = ?auto_21609 ?auto_21619 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_21598 ?auto_21599 ?auto_21600 ?auto_21601 ?auto_21602 ?auto_21603 ?auto_21604 )
      ( MAKE-1CRATE ?auto_21604 ?auto_21605 )
      ( MAKE-7CRATE-VERIFY ?auto_21598 ?auto_21599 ?auto_21600 ?auto_21601 ?auto_21602 ?auto_21603 ?auto_21604 ?auto_21605 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_21649 - SURFACE
      ?auto_21650 - SURFACE
      ?auto_21651 - SURFACE
      ?auto_21652 - SURFACE
      ?auto_21653 - SURFACE
      ?auto_21654 - SURFACE
      ?auto_21655 - SURFACE
      ?auto_21656 - SURFACE
      ?auto_21657 - SURFACE
    )
    :vars
    (
      ?auto_21663 - HOIST
      ?auto_21662 - PLACE
      ?auto_21658 - PLACE
      ?auto_21659 - HOIST
      ?auto_21660 - SURFACE
      ?auto_21683 - PLACE
      ?auto_21672 - HOIST
      ?auto_21671 - SURFACE
      ?auto_21667 - PLACE
      ?auto_21670 - HOIST
      ?auto_21680 - SURFACE
      ?auto_21673 - PLACE
      ?auto_21669 - HOIST
      ?auto_21682 - SURFACE
      ?auto_21668 - PLACE
      ?auto_21681 - HOIST
      ?auto_21666 - SURFACE
      ?auto_21677 - PLACE
      ?auto_21678 - HOIST
      ?auto_21674 - SURFACE
      ?auto_21679 - PLACE
      ?auto_21664 - HOIST
      ?auto_21675 - SURFACE
      ?auto_21676 - PLACE
      ?auto_21665 - HOIST
      ?auto_21684 - SURFACE
      ?auto_21661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21663 ?auto_21662 ) ( IS-CRATE ?auto_21657 ) ( not ( = ?auto_21658 ?auto_21662 ) ) ( HOIST-AT ?auto_21659 ?auto_21658 ) ( AVAILABLE ?auto_21659 ) ( SURFACE-AT ?auto_21657 ?auto_21658 ) ( ON ?auto_21657 ?auto_21660 ) ( CLEAR ?auto_21657 ) ( not ( = ?auto_21656 ?auto_21657 ) ) ( not ( = ?auto_21656 ?auto_21660 ) ) ( not ( = ?auto_21657 ?auto_21660 ) ) ( not ( = ?auto_21663 ?auto_21659 ) ) ( IS-CRATE ?auto_21656 ) ( not ( = ?auto_21683 ?auto_21662 ) ) ( HOIST-AT ?auto_21672 ?auto_21683 ) ( AVAILABLE ?auto_21672 ) ( SURFACE-AT ?auto_21656 ?auto_21683 ) ( ON ?auto_21656 ?auto_21671 ) ( CLEAR ?auto_21656 ) ( not ( = ?auto_21655 ?auto_21656 ) ) ( not ( = ?auto_21655 ?auto_21671 ) ) ( not ( = ?auto_21656 ?auto_21671 ) ) ( not ( = ?auto_21663 ?auto_21672 ) ) ( IS-CRATE ?auto_21655 ) ( not ( = ?auto_21667 ?auto_21662 ) ) ( HOIST-AT ?auto_21670 ?auto_21667 ) ( AVAILABLE ?auto_21670 ) ( SURFACE-AT ?auto_21655 ?auto_21667 ) ( ON ?auto_21655 ?auto_21680 ) ( CLEAR ?auto_21655 ) ( not ( = ?auto_21654 ?auto_21655 ) ) ( not ( = ?auto_21654 ?auto_21680 ) ) ( not ( = ?auto_21655 ?auto_21680 ) ) ( not ( = ?auto_21663 ?auto_21670 ) ) ( IS-CRATE ?auto_21654 ) ( not ( = ?auto_21673 ?auto_21662 ) ) ( HOIST-AT ?auto_21669 ?auto_21673 ) ( AVAILABLE ?auto_21669 ) ( SURFACE-AT ?auto_21654 ?auto_21673 ) ( ON ?auto_21654 ?auto_21682 ) ( CLEAR ?auto_21654 ) ( not ( = ?auto_21653 ?auto_21654 ) ) ( not ( = ?auto_21653 ?auto_21682 ) ) ( not ( = ?auto_21654 ?auto_21682 ) ) ( not ( = ?auto_21663 ?auto_21669 ) ) ( IS-CRATE ?auto_21653 ) ( not ( = ?auto_21668 ?auto_21662 ) ) ( HOIST-AT ?auto_21681 ?auto_21668 ) ( AVAILABLE ?auto_21681 ) ( SURFACE-AT ?auto_21653 ?auto_21668 ) ( ON ?auto_21653 ?auto_21666 ) ( CLEAR ?auto_21653 ) ( not ( = ?auto_21652 ?auto_21653 ) ) ( not ( = ?auto_21652 ?auto_21666 ) ) ( not ( = ?auto_21653 ?auto_21666 ) ) ( not ( = ?auto_21663 ?auto_21681 ) ) ( IS-CRATE ?auto_21652 ) ( not ( = ?auto_21677 ?auto_21662 ) ) ( HOIST-AT ?auto_21678 ?auto_21677 ) ( AVAILABLE ?auto_21678 ) ( SURFACE-AT ?auto_21652 ?auto_21677 ) ( ON ?auto_21652 ?auto_21674 ) ( CLEAR ?auto_21652 ) ( not ( = ?auto_21651 ?auto_21652 ) ) ( not ( = ?auto_21651 ?auto_21674 ) ) ( not ( = ?auto_21652 ?auto_21674 ) ) ( not ( = ?auto_21663 ?auto_21678 ) ) ( IS-CRATE ?auto_21651 ) ( not ( = ?auto_21679 ?auto_21662 ) ) ( HOIST-AT ?auto_21664 ?auto_21679 ) ( AVAILABLE ?auto_21664 ) ( SURFACE-AT ?auto_21651 ?auto_21679 ) ( ON ?auto_21651 ?auto_21675 ) ( CLEAR ?auto_21651 ) ( not ( = ?auto_21650 ?auto_21651 ) ) ( not ( = ?auto_21650 ?auto_21675 ) ) ( not ( = ?auto_21651 ?auto_21675 ) ) ( not ( = ?auto_21663 ?auto_21664 ) ) ( SURFACE-AT ?auto_21649 ?auto_21662 ) ( CLEAR ?auto_21649 ) ( IS-CRATE ?auto_21650 ) ( AVAILABLE ?auto_21663 ) ( not ( = ?auto_21676 ?auto_21662 ) ) ( HOIST-AT ?auto_21665 ?auto_21676 ) ( AVAILABLE ?auto_21665 ) ( SURFACE-AT ?auto_21650 ?auto_21676 ) ( ON ?auto_21650 ?auto_21684 ) ( CLEAR ?auto_21650 ) ( TRUCK-AT ?auto_21661 ?auto_21662 ) ( not ( = ?auto_21649 ?auto_21650 ) ) ( not ( = ?auto_21649 ?auto_21684 ) ) ( not ( = ?auto_21650 ?auto_21684 ) ) ( not ( = ?auto_21663 ?auto_21665 ) ) ( not ( = ?auto_21649 ?auto_21651 ) ) ( not ( = ?auto_21649 ?auto_21675 ) ) ( not ( = ?auto_21651 ?auto_21684 ) ) ( not ( = ?auto_21679 ?auto_21676 ) ) ( not ( = ?auto_21664 ?auto_21665 ) ) ( not ( = ?auto_21675 ?auto_21684 ) ) ( not ( = ?auto_21649 ?auto_21652 ) ) ( not ( = ?auto_21649 ?auto_21674 ) ) ( not ( = ?auto_21650 ?auto_21652 ) ) ( not ( = ?auto_21650 ?auto_21674 ) ) ( not ( = ?auto_21652 ?auto_21675 ) ) ( not ( = ?auto_21652 ?auto_21684 ) ) ( not ( = ?auto_21677 ?auto_21679 ) ) ( not ( = ?auto_21677 ?auto_21676 ) ) ( not ( = ?auto_21678 ?auto_21664 ) ) ( not ( = ?auto_21678 ?auto_21665 ) ) ( not ( = ?auto_21674 ?auto_21675 ) ) ( not ( = ?auto_21674 ?auto_21684 ) ) ( not ( = ?auto_21649 ?auto_21653 ) ) ( not ( = ?auto_21649 ?auto_21666 ) ) ( not ( = ?auto_21650 ?auto_21653 ) ) ( not ( = ?auto_21650 ?auto_21666 ) ) ( not ( = ?auto_21651 ?auto_21653 ) ) ( not ( = ?auto_21651 ?auto_21666 ) ) ( not ( = ?auto_21653 ?auto_21674 ) ) ( not ( = ?auto_21653 ?auto_21675 ) ) ( not ( = ?auto_21653 ?auto_21684 ) ) ( not ( = ?auto_21668 ?auto_21677 ) ) ( not ( = ?auto_21668 ?auto_21679 ) ) ( not ( = ?auto_21668 ?auto_21676 ) ) ( not ( = ?auto_21681 ?auto_21678 ) ) ( not ( = ?auto_21681 ?auto_21664 ) ) ( not ( = ?auto_21681 ?auto_21665 ) ) ( not ( = ?auto_21666 ?auto_21674 ) ) ( not ( = ?auto_21666 ?auto_21675 ) ) ( not ( = ?auto_21666 ?auto_21684 ) ) ( not ( = ?auto_21649 ?auto_21654 ) ) ( not ( = ?auto_21649 ?auto_21682 ) ) ( not ( = ?auto_21650 ?auto_21654 ) ) ( not ( = ?auto_21650 ?auto_21682 ) ) ( not ( = ?auto_21651 ?auto_21654 ) ) ( not ( = ?auto_21651 ?auto_21682 ) ) ( not ( = ?auto_21652 ?auto_21654 ) ) ( not ( = ?auto_21652 ?auto_21682 ) ) ( not ( = ?auto_21654 ?auto_21666 ) ) ( not ( = ?auto_21654 ?auto_21674 ) ) ( not ( = ?auto_21654 ?auto_21675 ) ) ( not ( = ?auto_21654 ?auto_21684 ) ) ( not ( = ?auto_21673 ?auto_21668 ) ) ( not ( = ?auto_21673 ?auto_21677 ) ) ( not ( = ?auto_21673 ?auto_21679 ) ) ( not ( = ?auto_21673 ?auto_21676 ) ) ( not ( = ?auto_21669 ?auto_21681 ) ) ( not ( = ?auto_21669 ?auto_21678 ) ) ( not ( = ?auto_21669 ?auto_21664 ) ) ( not ( = ?auto_21669 ?auto_21665 ) ) ( not ( = ?auto_21682 ?auto_21666 ) ) ( not ( = ?auto_21682 ?auto_21674 ) ) ( not ( = ?auto_21682 ?auto_21675 ) ) ( not ( = ?auto_21682 ?auto_21684 ) ) ( not ( = ?auto_21649 ?auto_21655 ) ) ( not ( = ?auto_21649 ?auto_21680 ) ) ( not ( = ?auto_21650 ?auto_21655 ) ) ( not ( = ?auto_21650 ?auto_21680 ) ) ( not ( = ?auto_21651 ?auto_21655 ) ) ( not ( = ?auto_21651 ?auto_21680 ) ) ( not ( = ?auto_21652 ?auto_21655 ) ) ( not ( = ?auto_21652 ?auto_21680 ) ) ( not ( = ?auto_21653 ?auto_21655 ) ) ( not ( = ?auto_21653 ?auto_21680 ) ) ( not ( = ?auto_21655 ?auto_21682 ) ) ( not ( = ?auto_21655 ?auto_21666 ) ) ( not ( = ?auto_21655 ?auto_21674 ) ) ( not ( = ?auto_21655 ?auto_21675 ) ) ( not ( = ?auto_21655 ?auto_21684 ) ) ( not ( = ?auto_21667 ?auto_21673 ) ) ( not ( = ?auto_21667 ?auto_21668 ) ) ( not ( = ?auto_21667 ?auto_21677 ) ) ( not ( = ?auto_21667 ?auto_21679 ) ) ( not ( = ?auto_21667 ?auto_21676 ) ) ( not ( = ?auto_21670 ?auto_21669 ) ) ( not ( = ?auto_21670 ?auto_21681 ) ) ( not ( = ?auto_21670 ?auto_21678 ) ) ( not ( = ?auto_21670 ?auto_21664 ) ) ( not ( = ?auto_21670 ?auto_21665 ) ) ( not ( = ?auto_21680 ?auto_21682 ) ) ( not ( = ?auto_21680 ?auto_21666 ) ) ( not ( = ?auto_21680 ?auto_21674 ) ) ( not ( = ?auto_21680 ?auto_21675 ) ) ( not ( = ?auto_21680 ?auto_21684 ) ) ( not ( = ?auto_21649 ?auto_21656 ) ) ( not ( = ?auto_21649 ?auto_21671 ) ) ( not ( = ?auto_21650 ?auto_21656 ) ) ( not ( = ?auto_21650 ?auto_21671 ) ) ( not ( = ?auto_21651 ?auto_21656 ) ) ( not ( = ?auto_21651 ?auto_21671 ) ) ( not ( = ?auto_21652 ?auto_21656 ) ) ( not ( = ?auto_21652 ?auto_21671 ) ) ( not ( = ?auto_21653 ?auto_21656 ) ) ( not ( = ?auto_21653 ?auto_21671 ) ) ( not ( = ?auto_21654 ?auto_21656 ) ) ( not ( = ?auto_21654 ?auto_21671 ) ) ( not ( = ?auto_21656 ?auto_21680 ) ) ( not ( = ?auto_21656 ?auto_21682 ) ) ( not ( = ?auto_21656 ?auto_21666 ) ) ( not ( = ?auto_21656 ?auto_21674 ) ) ( not ( = ?auto_21656 ?auto_21675 ) ) ( not ( = ?auto_21656 ?auto_21684 ) ) ( not ( = ?auto_21683 ?auto_21667 ) ) ( not ( = ?auto_21683 ?auto_21673 ) ) ( not ( = ?auto_21683 ?auto_21668 ) ) ( not ( = ?auto_21683 ?auto_21677 ) ) ( not ( = ?auto_21683 ?auto_21679 ) ) ( not ( = ?auto_21683 ?auto_21676 ) ) ( not ( = ?auto_21672 ?auto_21670 ) ) ( not ( = ?auto_21672 ?auto_21669 ) ) ( not ( = ?auto_21672 ?auto_21681 ) ) ( not ( = ?auto_21672 ?auto_21678 ) ) ( not ( = ?auto_21672 ?auto_21664 ) ) ( not ( = ?auto_21672 ?auto_21665 ) ) ( not ( = ?auto_21671 ?auto_21680 ) ) ( not ( = ?auto_21671 ?auto_21682 ) ) ( not ( = ?auto_21671 ?auto_21666 ) ) ( not ( = ?auto_21671 ?auto_21674 ) ) ( not ( = ?auto_21671 ?auto_21675 ) ) ( not ( = ?auto_21671 ?auto_21684 ) ) ( not ( = ?auto_21649 ?auto_21657 ) ) ( not ( = ?auto_21649 ?auto_21660 ) ) ( not ( = ?auto_21650 ?auto_21657 ) ) ( not ( = ?auto_21650 ?auto_21660 ) ) ( not ( = ?auto_21651 ?auto_21657 ) ) ( not ( = ?auto_21651 ?auto_21660 ) ) ( not ( = ?auto_21652 ?auto_21657 ) ) ( not ( = ?auto_21652 ?auto_21660 ) ) ( not ( = ?auto_21653 ?auto_21657 ) ) ( not ( = ?auto_21653 ?auto_21660 ) ) ( not ( = ?auto_21654 ?auto_21657 ) ) ( not ( = ?auto_21654 ?auto_21660 ) ) ( not ( = ?auto_21655 ?auto_21657 ) ) ( not ( = ?auto_21655 ?auto_21660 ) ) ( not ( = ?auto_21657 ?auto_21671 ) ) ( not ( = ?auto_21657 ?auto_21680 ) ) ( not ( = ?auto_21657 ?auto_21682 ) ) ( not ( = ?auto_21657 ?auto_21666 ) ) ( not ( = ?auto_21657 ?auto_21674 ) ) ( not ( = ?auto_21657 ?auto_21675 ) ) ( not ( = ?auto_21657 ?auto_21684 ) ) ( not ( = ?auto_21658 ?auto_21683 ) ) ( not ( = ?auto_21658 ?auto_21667 ) ) ( not ( = ?auto_21658 ?auto_21673 ) ) ( not ( = ?auto_21658 ?auto_21668 ) ) ( not ( = ?auto_21658 ?auto_21677 ) ) ( not ( = ?auto_21658 ?auto_21679 ) ) ( not ( = ?auto_21658 ?auto_21676 ) ) ( not ( = ?auto_21659 ?auto_21672 ) ) ( not ( = ?auto_21659 ?auto_21670 ) ) ( not ( = ?auto_21659 ?auto_21669 ) ) ( not ( = ?auto_21659 ?auto_21681 ) ) ( not ( = ?auto_21659 ?auto_21678 ) ) ( not ( = ?auto_21659 ?auto_21664 ) ) ( not ( = ?auto_21659 ?auto_21665 ) ) ( not ( = ?auto_21660 ?auto_21671 ) ) ( not ( = ?auto_21660 ?auto_21680 ) ) ( not ( = ?auto_21660 ?auto_21682 ) ) ( not ( = ?auto_21660 ?auto_21666 ) ) ( not ( = ?auto_21660 ?auto_21674 ) ) ( not ( = ?auto_21660 ?auto_21675 ) ) ( not ( = ?auto_21660 ?auto_21684 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_21649 ?auto_21650 ?auto_21651 ?auto_21652 ?auto_21653 ?auto_21654 ?auto_21655 ?auto_21656 )
      ( MAKE-1CRATE ?auto_21656 ?auto_21657 )
      ( MAKE-8CRATE-VERIFY ?auto_21649 ?auto_21650 ?auto_21651 ?auto_21652 ?auto_21653 ?auto_21654 ?auto_21655 ?auto_21656 ?auto_21657 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_21705 - SURFACE
      ?auto_21706 - SURFACE
      ?auto_21707 - SURFACE
      ?auto_21708 - SURFACE
      ?auto_21709 - SURFACE
      ?auto_21710 - SURFACE
      ?auto_21711 - SURFACE
      ?auto_21712 - SURFACE
      ?auto_21713 - SURFACE
      ?auto_21714 - SURFACE
    )
    :vars
    (
      ?auto_21717 - HOIST
      ?auto_21715 - PLACE
      ?auto_21720 - PLACE
      ?auto_21719 - HOIST
      ?auto_21718 - SURFACE
      ?auto_21741 - PLACE
      ?auto_21729 - HOIST
      ?auto_21724 - SURFACE
      ?auto_21742 - PLACE
      ?auto_21722 - HOIST
      ?auto_21735 - SURFACE
      ?auto_21738 - PLACE
      ?auto_21726 - HOIST
      ?auto_21730 - SURFACE
      ?auto_21728 - PLACE
      ?auto_21723 - HOIST
      ?auto_21727 - SURFACE
      ?auto_21732 - PLACE
      ?auto_21739 - HOIST
      ?auto_21737 - SURFACE
      ?auto_21734 - SURFACE
      ?auto_21740 - PLACE
      ?auto_21736 - HOIST
      ?auto_21725 - SURFACE
      ?auto_21731 - PLACE
      ?auto_21721 - HOIST
      ?auto_21733 - SURFACE
      ?auto_21716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21717 ?auto_21715 ) ( IS-CRATE ?auto_21714 ) ( not ( = ?auto_21720 ?auto_21715 ) ) ( HOIST-AT ?auto_21719 ?auto_21720 ) ( SURFACE-AT ?auto_21714 ?auto_21720 ) ( ON ?auto_21714 ?auto_21718 ) ( CLEAR ?auto_21714 ) ( not ( = ?auto_21713 ?auto_21714 ) ) ( not ( = ?auto_21713 ?auto_21718 ) ) ( not ( = ?auto_21714 ?auto_21718 ) ) ( not ( = ?auto_21717 ?auto_21719 ) ) ( IS-CRATE ?auto_21713 ) ( not ( = ?auto_21741 ?auto_21715 ) ) ( HOIST-AT ?auto_21729 ?auto_21741 ) ( AVAILABLE ?auto_21729 ) ( SURFACE-AT ?auto_21713 ?auto_21741 ) ( ON ?auto_21713 ?auto_21724 ) ( CLEAR ?auto_21713 ) ( not ( = ?auto_21712 ?auto_21713 ) ) ( not ( = ?auto_21712 ?auto_21724 ) ) ( not ( = ?auto_21713 ?auto_21724 ) ) ( not ( = ?auto_21717 ?auto_21729 ) ) ( IS-CRATE ?auto_21712 ) ( not ( = ?auto_21742 ?auto_21715 ) ) ( HOIST-AT ?auto_21722 ?auto_21742 ) ( AVAILABLE ?auto_21722 ) ( SURFACE-AT ?auto_21712 ?auto_21742 ) ( ON ?auto_21712 ?auto_21735 ) ( CLEAR ?auto_21712 ) ( not ( = ?auto_21711 ?auto_21712 ) ) ( not ( = ?auto_21711 ?auto_21735 ) ) ( not ( = ?auto_21712 ?auto_21735 ) ) ( not ( = ?auto_21717 ?auto_21722 ) ) ( IS-CRATE ?auto_21711 ) ( not ( = ?auto_21738 ?auto_21715 ) ) ( HOIST-AT ?auto_21726 ?auto_21738 ) ( AVAILABLE ?auto_21726 ) ( SURFACE-AT ?auto_21711 ?auto_21738 ) ( ON ?auto_21711 ?auto_21730 ) ( CLEAR ?auto_21711 ) ( not ( = ?auto_21710 ?auto_21711 ) ) ( not ( = ?auto_21710 ?auto_21730 ) ) ( not ( = ?auto_21711 ?auto_21730 ) ) ( not ( = ?auto_21717 ?auto_21726 ) ) ( IS-CRATE ?auto_21710 ) ( not ( = ?auto_21728 ?auto_21715 ) ) ( HOIST-AT ?auto_21723 ?auto_21728 ) ( AVAILABLE ?auto_21723 ) ( SURFACE-AT ?auto_21710 ?auto_21728 ) ( ON ?auto_21710 ?auto_21727 ) ( CLEAR ?auto_21710 ) ( not ( = ?auto_21709 ?auto_21710 ) ) ( not ( = ?auto_21709 ?auto_21727 ) ) ( not ( = ?auto_21710 ?auto_21727 ) ) ( not ( = ?auto_21717 ?auto_21723 ) ) ( IS-CRATE ?auto_21709 ) ( not ( = ?auto_21732 ?auto_21715 ) ) ( HOIST-AT ?auto_21739 ?auto_21732 ) ( AVAILABLE ?auto_21739 ) ( SURFACE-AT ?auto_21709 ?auto_21732 ) ( ON ?auto_21709 ?auto_21737 ) ( CLEAR ?auto_21709 ) ( not ( = ?auto_21708 ?auto_21709 ) ) ( not ( = ?auto_21708 ?auto_21737 ) ) ( not ( = ?auto_21709 ?auto_21737 ) ) ( not ( = ?auto_21717 ?auto_21739 ) ) ( IS-CRATE ?auto_21708 ) ( AVAILABLE ?auto_21719 ) ( SURFACE-AT ?auto_21708 ?auto_21720 ) ( ON ?auto_21708 ?auto_21734 ) ( CLEAR ?auto_21708 ) ( not ( = ?auto_21707 ?auto_21708 ) ) ( not ( = ?auto_21707 ?auto_21734 ) ) ( not ( = ?auto_21708 ?auto_21734 ) ) ( IS-CRATE ?auto_21707 ) ( not ( = ?auto_21740 ?auto_21715 ) ) ( HOIST-AT ?auto_21736 ?auto_21740 ) ( AVAILABLE ?auto_21736 ) ( SURFACE-AT ?auto_21707 ?auto_21740 ) ( ON ?auto_21707 ?auto_21725 ) ( CLEAR ?auto_21707 ) ( not ( = ?auto_21706 ?auto_21707 ) ) ( not ( = ?auto_21706 ?auto_21725 ) ) ( not ( = ?auto_21707 ?auto_21725 ) ) ( not ( = ?auto_21717 ?auto_21736 ) ) ( SURFACE-AT ?auto_21705 ?auto_21715 ) ( CLEAR ?auto_21705 ) ( IS-CRATE ?auto_21706 ) ( AVAILABLE ?auto_21717 ) ( not ( = ?auto_21731 ?auto_21715 ) ) ( HOIST-AT ?auto_21721 ?auto_21731 ) ( AVAILABLE ?auto_21721 ) ( SURFACE-AT ?auto_21706 ?auto_21731 ) ( ON ?auto_21706 ?auto_21733 ) ( CLEAR ?auto_21706 ) ( TRUCK-AT ?auto_21716 ?auto_21715 ) ( not ( = ?auto_21705 ?auto_21706 ) ) ( not ( = ?auto_21705 ?auto_21733 ) ) ( not ( = ?auto_21706 ?auto_21733 ) ) ( not ( = ?auto_21717 ?auto_21721 ) ) ( not ( = ?auto_21705 ?auto_21707 ) ) ( not ( = ?auto_21705 ?auto_21725 ) ) ( not ( = ?auto_21707 ?auto_21733 ) ) ( not ( = ?auto_21740 ?auto_21731 ) ) ( not ( = ?auto_21736 ?auto_21721 ) ) ( not ( = ?auto_21725 ?auto_21733 ) ) ( not ( = ?auto_21705 ?auto_21708 ) ) ( not ( = ?auto_21705 ?auto_21734 ) ) ( not ( = ?auto_21706 ?auto_21708 ) ) ( not ( = ?auto_21706 ?auto_21734 ) ) ( not ( = ?auto_21708 ?auto_21725 ) ) ( not ( = ?auto_21708 ?auto_21733 ) ) ( not ( = ?auto_21720 ?auto_21740 ) ) ( not ( = ?auto_21720 ?auto_21731 ) ) ( not ( = ?auto_21719 ?auto_21736 ) ) ( not ( = ?auto_21719 ?auto_21721 ) ) ( not ( = ?auto_21734 ?auto_21725 ) ) ( not ( = ?auto_21734 ?auto_21733 ) ) ( not ( = ?auto_21705 ?auto_21709 ) ) ( not ( = ?auto_21705 ?auto_21737 ) ) ( not ( = ?auto_21706 ?auto_21709 ) ) ( not ( = ?auto_21706 ?auto_21737 ) ) ( not ( = ?auto_21707 ?auto_21709 ) ) ( not ( = ?auto_21707 ?auto_21737 ) ) ( not ( = ?auto_21709 ?auto_21734 ) ) ( not ( = ?auto_21709 ?auto_21725 ) ) ( not ( = ?auto_21709 ?auto_21733 ) ) ( not ( = ?auto_21732 ?auto_21720 ) ) ( not ( = ?auto_21732 ?auto_21740 ) ) ( not ( = ?auto_21732 ?auto_21731 ) ) ( not ( = ?auto_21739 ?auto_21719 ) ) ( not ( = ?auto_21739 ?auto_21736 ) ) ( not ( = ?auto_21739 ?auto_21721 ) ) ( not ( = ?auto_21737 ?auto_21734 ) ) ( not ( = ?auto_21737 ?auto_21725 ) ) ( not ( = ?auto_21737 ?auto_21733 ) ) ( not ( = ?auto_21705 ?auto_21710 ) ) ( not ( = ?auto_21705 ?auto_21727 ) ) ( not ( = ?auto_21706 ?auto_21710 ) ) ( not ( = ?auto_21706 ?auto_21727 ) ) ( not ( = ?auto_21707 ?auto_21710 ) ) ( not ( = ?auto_21707 ?auto_21727 ) ) ( not ( = ?auto_21708 ?auto_21710 ) ) ( not ( = ?auto_21708 ?auto_21727 ) ) ( not ( = ?auto_21710 ?auto_21737 ) ) ( not ( = ?auto_21710 ?auto_21734 ) ) ( not ( = ?auto_21710 ?auto_21725 ) ) ( not ( = ?auto_21710 ?auto_21733 ) ) ( not ( = ?auto_21728 ?auto_21732 ) ) ( not ( = ?auto_21728 ?auto_21720 ) ) ( not ( = ?auto_21728 ?auto_21740 ) ) ( not ( = ?auto_21728 ?auto_21731 ) ) ( not ( = ?auto_21723 ?auto_21739 ) ) ( not ( = ?auto_21723 ?auto_21719 ) ) ( not ( = ?auto_21723 ?auto_21736 ) ) ( not ( = ?auto_21723 ?auto_21721 ) ) ( not ( = ?auto_21727 ?auto_21737 ) ) ( not ( = ?auto_21727 ?auto_21734 ) ) ( not ( = ?auto_21727 ?auto_21725 ) ) ( not ( = ?auto_21727 ?auto_21733 ) ) ( not ( = ?auto_21705 ?auto_21711 ) ) ( not ( = ?auto_21705 ?auto_21730 ) ) ( not ( = ?auto_21706 ?auto_21711 ) ) ( not ( = ?auto_21706 ?auto_21730 ) ) ( not ( = ?auto_21707 ?auto_21711 ) ) ( not ( = ?auto_21707 ?auto_21730 ) ) ( not ( = ?auto_21708 ?auto_21711 ) ) ( not ( = ?auto_21708 ?auto_21730 ) ) ( not ( = ?auto_21709 ?auto_21711 ) ) ( not ( = ?auto_21709 ?auto_21730 ) ) ( not ( = ?auto_21711 ?auto_21727 ) ) ( not ( = ?auto_21711 ?auto_21737 ) ) ( not ( = ?auto_21711 ?auto_21734 ) ) ( not ( = ?auto_21711 ?auto_21725 ) ) ( not ( = ?auto_21711 ?auto_21733 ) ) ( not ( = ?auto_21738 ?auto_21728 ) ) ( not ( = ?auto_21738 ?auto_21732 ) ) ( not ( = ?auto_21738 ?auto_21720 ) ) ( not ( = ?auto_21738 ?auto_21740 ) ) ( not ( = ?auto_21738 ?auto_21731 ) ) ( not ( = ?auto_21726 ?auto_21723 ) ) ( not ( = ?auto_21726 ?auto_21739 ) ) ( not ( = ?auto_21726 ?auto_21719 ) ) ( not ( = ?auto_21726 ?auto_21736 ) ) ( not ( = ?auto_21726 ?auto_21721 ) ) ( not ( = ?auto_21730 ?auto_21727 ) ) ( not ( = ?auto_21730 ?auto_21737 ) ) ( not ( = ?auto_21730 ?auto_21734 ) ) ( not ( = ?auto_21730 ?auto_21725 ) ) ( not ( = ?auto_21730 ?auto_21733 ) ) ( not ( = ?auto_21705 ?auto_21712 ) ) ( not ( = ?auto_21705 ?auto_21735 ) ) ( not ( = ?auto_21706 ?auto_21712 ) ) ( not ( = ?auto_21706 ?auto_21735 ) ) ( not ( = ?auto_21707 ?auto_21712 ) ) ( not ( = ?auto_21707 ?auto_21735 ) ) ( not ( = ?auto_21708 ?auto_21712 ) ) ( not ( = ?auto_21708 ?auto_21735 ) ) ( not ( = ?auto_21709 ?auto_21712 ) ) ( not ( = ?auto_21709 ?auto_21735 ) ) ( not ( = ?auto_21710 ?auto_21712 ) ) ( not ( = ?auto_21710 ?auto_21735 ) ) ( not ( = ?auto_21712 ?auto_21730 ) ) ( not ( = ?auto_21712 ?auto_21727 ) ) ( not ( = ?auto_21712 ?auto_21737 ) ) ( not ( = ?auto_21712 ?auto_21734 ) ) ( not ( = ?auto_21712 ?auto_21725 ) ) ( not ( = ?auto_21712 ?auto_21733 ) ) ( not ( = ?auto_21742 ?auto_21738 ) ) ( not ( = ?auto_21742 ?auto_21728 ) ) ( not ( = ?auto_21742 ?auto_21732 ) ) ( not ( = ?auto_21742 ?auto_21720 ) ) ( not ( = ?auto_21742 ?auto_21740 ) ) ( not ( = ?auto_21742 ?auto_21731 ) ) ( not ( = ?auto_21722 ?auto_21726 ) ) ( not ( = ?auto_21722 ?auto_21723 ) ) ( not ( = ?auto_21722 ?auto_21739 ) ) ( not ( = ?auto_21722 ?auto_21719 ) ) ( not ( = ?auto_21722 ?auto_21736 ) ) ( not ( = ?auto_21722 ?auto_21721 ) ) ( not ( = ?auto_21735 ?auto_21730 ) ) ( not ( = ?auto_21735 ?auto_21727 ) ) ( not ( = ?auto_21735 ?auto_21737 ) ) ( not ( = ?auto_21735 ?auto_21734 ) ) ( not ( = ?auto_21735 ?auto_21725 ) ) ( not ( = ?auto_21735 ?auto_21733 ) ) ( not ( = ?auto_21705 ?auto_21713 ) ) ( not ( = ?auto_21705 ?auto_21724 ) ) ( not ( = ?auto_21706 ?auto_21713 ) ) ( not ( = ?auto_21706 ?auto_21724 ) ) ( not ( = ?auto_21707 ?auto_21713 ) ) ( not ( = ?auto_21707 ?auto_21724 ) ) ( not ( = ?auto_21708 ?auto_21713 ) ) ( not ( = ?auto_21708 ?auto_21724 ) ) ( not ( = ?auto_21709 ?auto_21713 ) ) ( not ( = ?auto_21709 ?auto_21724 ) ) ( not ( = ?auto_21710 ?auto_21713 ) ) ( not ( = ?auto_21710 ?auto_21724 ) ) ( not ( = ?auto_21711 ?auto_21713 ) ) ( not ( = ?auto_21711 ?auto_21724 ) ) ( not ( = ?auto_21713 ?auto_21735 ) ) ( not ( = ?auto_21713 ?auto_21730 ) ) ( not ( = ?auto_21713 ?auto_21727 ) ) ( not ( = ?auto_21713 ?auto_21737 ) ) ( not ( = ?auto_21713 ?auto_21734 ) ) ( not ( = ?auto_21713 ?auto_21725 ) ) ( not ( = ?auto_21713 ?auto_21733 ) ) ( not ( = ?auto_21741 ?auto_21742 ) ) ( not ( = ?auto_21741 ?auto_21738 ) ) ( not ( = ?auto_21741 ?auto_21728 ) ) ( not ( = ?auto_21741 ?auto_21732 ) ) ( not ( = ?auto_21741 ?auto_21720 ) ) ( not ( = ?auto_21741 ?auto_21740 ) ) ( not ( = ?auto_21741 ?auto_21731 ) ) ( not ( = ?auto_21729 ?auto_21722 ) ) ( not ( = ?auto_21729 ?auto_21726 ) ) ( not ( = ?auto_21729 ?auto_21723 ) ) ( not ( = ?auto_21729 ?auto_21739 ) ) ( not ( = ?auto_21729 ?auto_21719 ) ) ( not ( = ?auto_21729 ?auto_21736 ) ) ( not ( = ?auto_21729 ?auto_21721 ) ) ( not ( = ?auto_21724 ?auto_21735 ) ) ( not ( = ?auto_21724 ?auto_21730 ) ) ( not ( = ?auto_21724 ?auto_21727 ) ) ( not ( = ?auto_21724 ?auto_21737 ) ) ( not ( = ?auto_21724 ?auto_21734 ) ) ( not ( = ?auto_21724 ?auto_21725 ) ) ( not ( = ?auto_21724 ?auto_21733 ) ) ( not ( = ?auto_21705 ?auto_21714 ) ) ( not ( = ?auto_21705 ?auto_21718 ) ) ( not ( = ?auto_21706 ?auto_21714 ) ) ( not ( = ?auto_21706 ?auto_21718 ) ) ( not ( = ?auto_21707 ?auto_21714 ) ) ( not ( = ?auto_21707 ?auto_21718 ) ) ( not ( = ?auto_21708 ?auto_21714 ) ) ( not ( = ?auto_21708 ?auto_21718 ) ) ( not ( = ?auto_21709 ?auto_21714 ) ) ( not ( = ?auto_21709 ?auto_21718 ) ) ( not ( = ?auto_21710 ?auto_21714 ) ) ( not ( = ?auto_21710 ?auto_21718 ) ) ( not ( = ?auto_21711 ?auto_21714 ) ) ( not ( = ?auto_21711 ?auto_21718 ) ) ( not ( = ?auto_21712 ?auto_21714 ) ) ( not ( = ?auto_21712 ?auto_21718 ) ) ( not ( = ?auto_21714 ?auto_21724 ) ) ( not ( = ?auto_21714 ?auto_21735 ) ) ( not ( = ?auto_21714 ?auto_21730 ) ) ( not ( = ?auto_21714 ?auto_21727 ) ) ( not ( = ?auto_21714 ?auto_21737 ) ) ( not ( = ?auto_21714 ?auto_21734 ) ) ( not ( = ?auto_21714 ?auto_21725 ) ) ( not ( = ?auto_21714 ?auto_21733 ) ) ( not ( = ?auto_21718 ?auto_21724 ) ) ( not ( = ?auto_21718 ?auto_21735 ) ) ( not ( = ?auto_21718 ?auto_21730 ) ) ( not ( = ?auto_21718 ?auto_21727 ) ) ( not ( = ?auto_21718 ?auto_21737 ) ) ( not ( = ?auto_21718 ?auto_21734 ) ) ( not ( = ?auto_21718 ?auto_21725 ) ) ( not ( = ?auto_21718 ?auto_21733 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_21705 ?auto_21706 ?auto_21707 ?auto_21708 ?auto_21709 ?auto_21710 ?auto_21711 ?auto_21712 ?auto_21713 )
      ( MAKE-1CRATE ?auto_21713 ?auto_21714 )
      ( MAKE-9CRATE-VERIFY ?auto_21705 ?auto_21706 ?auto_21707 ?auto_21708 ?auto_21709 ?auto_21710 ?auto_21711 ?auto_21712 ?auto_21713 ?auto_21714 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_21764 - SURFACE
      ?auto_21765 - SURFACE
      ?auto_21766 - SURFACE
      ?auto_21767 - SURFACE
      ?auto_21768 - SURFACE
      ?auto_21769 - SURFACE
      ?auto_21770 - SURFACE
      ?auto_21771 - SURFACE
      ?auto_21772 - SURFACE
      ?auto_21773 - SURFACE
      ?auto_21774 - SURFACE
    )
    :vars
    (
      ?auto_21780 - HOIST
      ?auto_21778 - PLACE
      ?auto_21776 - PLACE
      ?auto_21777 - HOIST
      ?auto_21779 - SURFACE
      ?auto_21800 - PLACE
      ?auto_21781 - HOIST
      ?auto_21785 - SURFACE
      ?auto_21784 - PLACE
      ?auto_21788 - HOIST
      ?auto_21801 - SURFACE
      ?auto_21804 - PLACE
      ?auto_21799 - HOIST
      ?auto_21786 - SURFACE
      ?auto_21783 - PLACE
      ?auto_21793 - HOIST
      ?auto_21803 - SURFACE
      ?auto_21782 - PLACE
      ?auto_21795 - HOIST
      ?auto_21789 - SURFACE
      ?auto_21802 - PLACE
      ?auto_21796 - HOIST
      ?auto_21794 - SURFACE
      ?auto_21792 - SURFACE
      ?auto_21787 - PLACE
      ?auto_21790 - HOIST
      ?auto_21791 - SURFACE
      ?auto_21797 - PLACE
      ?auto_21798 - HOIST
      ?auto_21805 - SURFACE
      ?auto_21775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21780 ?auto_21778 ) ( IS-CRATE ?auto_21774 ) ( not ( = ?auto_21776 ?auto_21778 ) ) ( HOIST-AT ?auto_21777 ?auto_21776 ) ( AVAILABLE ?auto_21777 ) ( SURFACE-AT ?auto_21774 ?auto_21776 ) ( ON ?auto_21774 ?auto_21779 ) ( CLEAR ?auto_21774 ) ( not ( = ?auto_21773 ?auto_21774 ) ) ( not ( = ?auto_21773 ?auto_21779 ) ) ( not ( = ?auto_21774 ?auto_21779 ) ) ( not ( = ?auto_21780 ?auto_21777 ) ) ( IS-CRATE ?auto_21773 ) ( not ( = ?auto_21800 ?auto_21778 ) ) ( HOIST-AT ?auto_21781 ?auto_21800 ) ( SURFACE-AT ?auto_21773 ?auto_21800 ) ( ON ?auto_21773 ?auto_21785 ) ( CLEAR ?auto_21773 ) ( not ( = ?auto_21772 ?auto_21773 ) ) ( not ( = ?auto_21772 ?auto_21785 ) ) ( not ( = ?auto_21773 ?auto_21785 ) ) ( not ( = ?auto_21780 ?auto_21781 ) ) ( IS-CRATE ?auto_21772 ) ( not ( = ?auto_21784 ?auto_21778 ) ) ( HOIST-AT ?auto_21788 ?auto_21784 ) ( AVAILABLE ?auto_21788 ) ( SURFACE-AT ?auto_21772 ?auto_21784 ) ( ON ?auto_21772 ?auto_21801 ) ( CLEAR ?auto_21772 ) ( not ( = ?auto_21771 ?auto_21772 ) ) ( not ( = ?auto_21771 ?auto_21801 ) ) ( not ( = ?auto_21772 ?auto_21801 ) ) ( not ( = ?auto_21780 ?auto_21788 ) ) ( IS-CRATE ?auto_21771 ) ( not ( = ?auto_21804 ?auto_21778 ) ) ( HOIST-AT ?auto_21799 ?auto_21804 ) ( AVAILABLE ?auto_21799 ) ( SURFACE-AT ?auto_21771 ?auto_21804 ) ( ON ?auto_21771 ?auto_21786 ) ( CLEAR ?auto_21771 ) ( not ( = ?auto_21770 ?auto_21771 ) ) ( not ( = ?auto_21770 ?auto_21786 ) ) ( not ( = ?auto_21771 ?auto_21786 ) ) ( not ( = ?auto_21780 ?auto_21799 ) ) ( IS-CRATE ?auto_21770 ) ( not ( = ?auto_21783 ?auto_21778 ) ) ( HOIST-AT ?auto_21793 ?auto_21783 ) ( AVAILABLE ?auto_21793 ) ( SURFACE-AT ?auto_21770 ?auto_21783 ) ( ON ?auto_21770 ?auto_21803 ) ( CLEAR ?auto_21770 ) ( not ( = ?auto_21769 ?auto_21770 ) ) ( not ( = ?auto_21769 ?auto_21803 ) ) ( not ( = ?auto_21770 ?auto_21803 ) ) ( not ( = ?auto_21780 ?auto_21793 ) ) ( IS-CRATE ?auto_21769 ) ( not ( = ?auto_21782 ?auto_21778 ) ) ( HOIST-AT ?auto_21795 ?auto_21782 ) ( AVAILABLE ?auto_21795 ) ( SURFACE-AT ?auto_21769 ?auto_21782 ) ( ON ?auto_21769 ?auto_21789 ) ( CLEAR ?auto_21769 ) ( not ( = ?auto_21768 ?auto_21769 ) ) ( not ( = ?auto_21768 ?auto_21789 ) ) ( not ( = ?auto_21769 ?auto_21789 ) ) ( not ( = ?auto_21780 ?auto_21795 ) ) ( IS-CRATE ?auto_21768 ) ( not ( = ?auto_21802 ?auto_21778 ) ) ( HOIST-AT ?auto_21796 ?auto_21802 ) ( AVAILABLE ?auto_21796 ) ( SURFACE-AT ?auto_21768 ?auto_21802 ) ( ON ?auto_21768 ?auto_21794 ) ( CLEAR ?auto_21768 ) ( not ( = ?auto_21767 ?auto_21768 ) ) ( not ( = ?auto_21767 ?auto_21794 ) ) ( not ( = ?auto_21768 ?auto_21794 ) ) ( not ( = ?auto_21780 ?auto_21796 ) ) ( IS-CRATE ?auto_21767 ) ( AVAILABLE ?auto_21781 ) ( SURFACE-AT ?auto_21767 ?auto_21800 ) ( ON ?auto_21767 ?auto_21792 ) ( CLEAR ?auto_21767 ) ( not ( = ?auto_21766 ?auto_21767 ) ) ( not ( = ?auto_21766 ?auto_21792 ) ) ( not ( = ?auto_21767 ?auto_21792 ) ) ( IS-CRATE ?auto_21766 ) ( not ( = ?auto_21787 ?auto_21778 ) ) ( HOIST-AT ?auto_21790 ?auto_21787 ) ( AVAILABLE ?auto_21790 ) ( SURFACE-AT ?auto_21766 ?auto_21787 ) ( ON ?auto_21766 ?auto_21791 ) ( CLEAR ?auto_21766 ) ( not ( = ?auto_21765 ?auto_21766 ) ) ( not ( = ?auto_21765 ?auto_21791 ) ) ( not ( = ?auto_21766 ?auto_21791 ) ) ( not ( = ?auto_21780 ?auto_21790 ) ) ( SURFACE-AT ?auto_21764 ?auto_21778 ) ( CLEAR ?auto_21764 ) ( IS-CRATE ?auto_21765 ) ( AVAILABLE ?auto_21780 ) ( not ( = ?auto_21797 ?auto_21778 ) ) ( HOIST-AT ?auto_21798 ?auto_21797 ) ( AVAILABLE ?auto_21798 ) ( SURFACE-AT ?auto_21765 ?auto_21797 ) ( ON ?auto_21765 ?auto_21805 ) ( CLEAR ?auto_21765 ) ( TRUCK-AT ?auto_21775 ?auto_21778 ) ( not ( = ?auto_21764 ?auto_21765 ) ) ( not ( = ?auto_21764 ?auto_21805 ) ) ( not ( = ?auto_21765 ?auto_21805 ) ) ( not ( = ?auto_21780 ?auto_21798 ) ) ( not ( = ?auto_21764 ?auto_21766 ) ) ( not ( = ?auto_21764 ?auto_21791 ) ) ( not ( = ?auto_21766 ?auto_21805 ) ) ( not ( = ?auto_21787 ?auto_21797 ) ) ( not ( = ?auto_21790 ?auto_21798 ) ) ( not ( = ?auto_21791 ?auto_21805 ) ) ( not ( = ?auto_21764 ?auto_21767 ) ) ( not ( = ?auto_21764 ?auto_21792 ) ) ( not ( = ?auto_21765 ?auto_21767 ) ) ( not ( = ?auto_21765 ?auto_21792 ) ) ( not ( = ?auto_21767 ?auto_21791 ) ) ( not ( = ?auto_21767 ?auto_21805 ) ) ( not ( = ?auto_21800 ?auto_21787 ) ) ( not ( = ?auto_21800 ?auto_21797 ) ) ( not ( = ?auto_21781 ?auto_21790 ) ) ( not ( = ?auto_21781 ?auto_21798 ) ) ( not ( = ?auto_21792 ?auto_21791 ) ) ( not ( = ?auto_21792 ?auto_21805 ) ) ( not ( = ?auto_21764 ?auto_21768 ) ) ( not ( = ?auto_21764 ?auto_21794 ) ) ( not ( = ?auto_21765 ?auto_21768 ) ) ( not ( = ?auto_21765 ?auto_21794 ) ) ( not ( = ?auto_21766 ?auto_21768 ) ) ( not ( = ?auto_21766 ?auto_21794 ) ) ( not ( = ?auto_21768 ?auto_21792 ) ) ( not ( = ?auto_21768 ?auto_21791 ) ) ( not ( = ?auto_21768 ?auto_21805 ) ) ( not ( = ?auto_21802 ?auto_21800 ) ) ( not ( = ?auto_21802 ?auto_21787 ) ) ( not ( = ?auto_21802 ?auto_21797 ) ) ( not ( = ?auto_21796 ?auto_21781 ) ) ( not ( = ?auto_21796 ?auto_21790 ) ) ( not ( = ?auto_21796 ?auto_21798 ) ) ( not ( = ?auto_21794 ?auto_21792 ) ) ( not ( = ?auto_21794 ?auto_21791 ) ) ( not ( = ?auto_21794 ?auto_21805 ) ) ( not ( = ?auto_21764 ?auto_21769 ) ) ( not ( = ?auto_21764 ?auto_21789 ) ) ( not ( = ?auto_21765 ?auto_21769 ) ) ( not ( = ?auto_21765 ?auto_21789 ) ) ( not ( = ?auto_21766 ?auto_21769 ) ) ( not ( = ?auto_21766 ?auto_21789 ) ) ( not ( = ?auto_21767 ?auto_21769 ) ) ( not ( = ?auto_21767 ?auto_21789 ) ) ( not ( = ?auto_21769 ?auto_21794 ) ) ( not ( = ?auto_21769 ?auto_21792 ) ) ( not ( = ?auto_21769 ?auto_21791 ) ) ( not ( = ?auto_21769 ?auto_21805 ) ) ( not ( = ?auto_21782 ?auto_21802 ) ) ( not ( = ?auto_21782 ?auto_21800 ) ) ( not ( = ?auto_21782 ?auto_21787 ) ) ( not ( = ?auto_21782 ?auto_21797 ) ) ( not ( = ?auto_21795 ?auto_21796 ) ) ( not ( = ?auto_21795 ?auto_21781 ) ) ( not ( = ?auto_21795 ?auto_21790 ) ) ( not ( = ?auto_21795 ?auto_21798 ) ) ( not ( = ?auto_21789 ?auto_21794 ) ) ( not ( = ?auto_21789 ?auto_21792 ) ) ( not ( = ?auto_21789 ?auto_21791 ) ) ( not ( = ?auto_21789 ?auto_21805 ) ) ( not ( = ?auto_21764 ?auto_21770 ) ) ( not ( = ?auto_21764 ?auto_21803 ) ) ( not ( = ?auto_21765 ?auto_21770 ) ) ( not ( = ?auto_21765 ?auto_21803 ) ) ( not ( = ?auto_21766 ?auto_21770 ) ) ( not ( = ?auto_21766 ?auto_21803 ) ) ( not ( = ?auto_21767 ?auto_21770 ) ) ( not ( = ?auto_21767 ?auto_21803 ) ) ( not ( = ?auto_21768 ?auto_21770 ) ) ( not ( = ?auto_21768 ?auto_21803 ) ) ( not ( = ?auto_21770 ?auto_21789 ) ) ( not ( = ?auto_21770 ?auto_21794 ) ) ( not ( = ?auto_21770 ?auto_21792 ) ) ( not ( = ?auto_21770 ?auto_21791 ) ) ( not ( = ?auto_21770 ?auto_21805 ) ) ( not ( = ?auto_21783 ?auto_21782 ) ) ( not ( = ?auto_21783 ?auto_21802 ) ) ( not ( = ?auto_21783 ?auto_21800 ) ) ( not ( = ?auto_21783 ?auto_21787 ) ) ( not ( = ?auto_21783 ?auto_21797 ) ) ( not ( = ?auto_21793 ?auto_21795 ) ) ( not ( = ?auto_21793 ?auto_21796 ) ) ( not ( = ?auto_21793 ?auto_21781 ) ) ( not ( = ?auto_21793 ?auto_21790 ) ) ( not ( = ?auto_21793 ?auto_21798 ) ) ( not ( = ?auto_21803 ?auto_21789 ) ) ( not ( = ?auto_21803 ?auto_21794 ) ) ( not ( = ?auto_21803 ?auto_21792 ) ) ( not ( = ?auto_21803 ?auto_21791 ) ) ( not ( = ?auto_21803 ?auto_21805 ) ) ( not ( = ?auto_21764 ?auto_21771 ) ) ( not ( = ?auto_21764 ?auto_21786 ) ) ( not ( = ?auto_21765 ?auto_21771 ) ) ( not ( = ?auto_21765 ?auto_21786 ) ) ( not ( = ?auto_21766 ?auto_21771 ) ) ( not ( = ?auto_21766 ?auto_21786 ) ) ( not ( = ?auto_21767 ?auto_21771 ) ) ( not ( = ?auto_21767 ?auto_21786 ) ) ( not ( = ?auto_21768 ?auto_21771 ) ) ( not ( = ?auto_21768 ?auto_21786 ) ) ( not ( = ?auto_21769 ?auto_21771 ) ) ( not ( = ?auto_21769 ?auto_21786 ) ) ( not ( = ?auto_21771 ?auto_21803 ) ) ( not ( = ?auto_21771 ?auto_21789 ) ) ( not ( = ?auto_21771 ?auto_21794 ) ) ( not ( = ?auto_21771 ?auto_21792 ) ) ( not ( = ?auto_21771 ?auto_21791 ) ) ( not ( = ?auto_21771 ?auto_21805 ) ) ( not ( = ?auto_21804 ?auto_21783 ) ) ( not ( = ?auto_21804 ?auto_21782 ) ) ( not ( = ?auto_21804 ?auto_21802 ) ) ( not ( = ?auto_21804 ?auto_21800 ) ) ( not ( = ?auto_21804 ?auto_21787 ) ) ( not ( = ?auto_21804 ?auto_21797 ) ) ( not ( = ?auto_21799 ?auto_21793 ) ) ( not ( = ?auto_21799 ?auto_21795 ) ) ( not ( = ?auto_21799 ?auto_21796 ) ) ( not ( = ?auto_21799 ?auto_21781 ) ) ( not ( = ?auto_21799 ?auto_21790 ) ) ( not ( = ?auto_21799 ?auto_21798 ) ) ( not ( = ?auto_21786 ?auto_21803 ) ) ( not ( = ?auto_21786 ?auto_21789 ) ) ( not ( = ?auto_21786 ?auto_21794 ) ) ( not ( = ?auto_21786 ?auto_21792 ) ) ( not ( = ?auto_21786 ?auto_21791 ) ) ( not ( = ?auto_21786 ?auto_21805 ) ) ( not ( = ?auto_21764 ?auto_21772 ) ) ( not ( = ?auto_21764 ?auto_21801 ) ) ( not ( = ?auto_21765 ?auto_21772 ) ) ( not ( = ?auto_21765 ?auto_21801 ) ) ( not ( = ?auto_21766 ?auto_21772 ) ) ( not ( = ?auto_21766 ?auto_21801 ) ) ( not ( = ?auto_21767 ?auto_21772 ) ) ( not ( = ?auto_21767 ?auto_21801 ) ) ( not ( = ?auto_21768 ?auto_21772 ) ) ( not ( = ?auto_21768 ?auto_21801 ) ) ( not ( = ?auto_21769 ?auto_21772 ) ) ( not ( = ?auto_21769 ?auto_21801 ) ) ( not ( = ?auto_21770 ?auto_21772 ) ) ( not ( = ?auto_21770 ?auto_21801 ) ) ( not ( = ?auto_21772 ?auto_21786 ) ) ( not ( = ?auto_21772 ?auto_21803 ) ) ( not ( = ?auto_21772 ?auto_21789 ) ) ( not ( = ?auto_21772 ?auto_21794 ) ) ( not ( = ?auto_21772 ?auto_21792 ) ) ( not ( = ?auto_21772 ?auto_21791 ) ) ( not ( = ?auto_21772 ?auto_21805 ) ) ( not ( = ?auto_21784 ?auto_21804 ) ) ( not ( = ?auto_21784 ?auto_21783 ) ) ( not ( = ?auto_21784 ?auto_21782 ) ) ( not ( = ?auto_21784 ?auto_21802 ) ) ( not ( = ?auto_21784 ?auto_21800 ) ) ( not ( = ?auto_21784 ?auto_21787 ) ) ( not ( = ?auto_21784 ?auto_21797 ) ) ( not ( = ?auto_21788 ?auto_21799 ) ) ( not ( = ?auto_21788 ?auto_21793 ) ) ( not ( = ?auto_21788 ?auto_21795 ) ) ( not ( = ?auto_21788 ?auto_21796 ) ) ( not ( = ?auto_21788 ?auto_21781 ) ) ( not ( = ?auto_21788 ?auto_21790 ) ) ( not ( = ?auto_21788 ?auto_21798 ) ) ( not ( = ?auto_21801 ?auto_21786 ) ) ( not ( = ?auto_21801 ?auto_21803 ) ) ( not ( = ?auto_21801 ?auto_21789 ) ) ( not ( = ?auto_21801 ?auto_21794 ) ) ( not ( = ?auto_21801 ?auto_21792 ) ) ( not ( = ?auto_21801 ?auto_21791 ) ) ( not ( = ?auto_21801 ?auto_21805 ) ) ( not ( = ?auto_21764 ?auto_21773 ) ) ( not ( = ?auto_21764 ?auto_21785 ) ) ( not ( = ?auto_21765 ?auto_21773 ) ) ( not ( = ?auto_21765 ?auto_21785 ) ) ( not ( = ?auto_21766 ?auto_21773 ) ) ( not ( = ?auto_21766 ?auto_21785 ) ) ( not ( = ?auto_21767 ?auto_21773 ) ) ( not ( = ?auto_21767 ?auto_21785 ) ) ( not ( = ?auto_21768 ?auto_21773 ) ) ( not ( = ?auto_21768 ?auto_21785 ) ) ( not ( = ?auto_21769 ?auto_21773 ) ) ( not ( = ?auto_21769 ?auto_21785 ) ) ( not ( = ?auto_21770 ?auto_21773 ) ) ( not ( = ?auto_21770 ?auto_21785 ) ) ( not ( = ?auto_21771 ?auto_21773 ) ) ( not ( = ?auto_21771 ?auto_21785 ) ) ( not ( = ?auto_21773 ?auto_21801 ) ) ( not ( = ?auto_21773 ?auto_21786 ) ) ( not ( = ?auto_21773 ?auto_21803 ) ) ( not ( = ?auto_21773 ?auto_21789 ) ) ( not ( = ?auto_21773 ?auto_21794 ) ) ( not ( = ?auto_21773 ?auto_21792 ) ) ( not ( = ?auto_21773 ?auto_21791 ) ) ( not ( = ?auto_21773 ?auto_21805 ) ) ( not ( = ?auto_21785 ?auto_21801 ) ) ( not ( = ?auto_21785 ?auto_21786 ) ) ( not ( = ?auto_21785 ?auto_21803 ) ) ( not ( = ?auto_21785 ?auto_21789 ) ) ( not ( = ?auto_21785 ?auto_21794 ) ) ( not ( = ?auto_21785 ?auto_21792 ) ) ( not ( = ?auto_21785 ?auto_21791 ) ) ( not ( = ?auto_21785 ?auto_21805 ) ) ( not ( = ?auto_21764 ?auto_21774 ) ) ( not ( = ?auto_21764 ?auto_21779 ) ) ( not ( = ?auto_21765 ?auto_21774 ) ) ( not ( = ?auto_21765 ?auto_21779 ) ) ( not ( = ?auto_21766 ?auto_21774 ) ) ( not ( = ?auto_21766 ?auto_21779 ) ) ( not ( = ?auto_21767 ?auto_21774 ) ) ( not ( = ?auto_21767 ?auto_21779 ) ) ( not ( = ?auto_21768 ?auto_21774 ) ) ( not ( = ?auto_21768 ?auto_21779 ) ) ( not ( = ?auto_21769 ?auto_21774 ) ) ( not ( = ?auto_21769 ?auto_21779 ) ) ( not ( = ?auto_21770 ?auto_21774 ) ) ( not ( = ?auto_21770 ?auto_21779 ) ) ( not ( = ?auto_21771 ?auto_21774 ) ) ( not ( = ?auto_21771 ?auto_21779 ) ) ( not ( = ?auto_21772 ?auto_21774 ) ) ( not ( = ?auto_21772 ?auto_21779 ) ) ( not ( = ?auto_21774 ?auto_21785 ) ) ( not ( = ?auto_21774 ?auto_21801 ) ) ( not ( = ?auto_21774 ?auto_21786 ) ) ( not ( = ?auto_21774 ?auto_21803 ) ) ( not ( = ?auto_21774 ?auto_21789 ) ) ( not ( = ?auto_21774 ?auto_21794 ) ) ( not ( = ?auto_21774 ?auto_21792 ) ) ( not ( = ?auto_21774 ?auto_21791 ) ) ( not ( = ?auto_21774 ?auto_21805 ) ) ( not ( = ?auto_21776 ?auto_21800 ) ) ( not ( = ?auto_21776 ?auto_21784 ) ) ( not ( = ?auto_21776 ?auto_21804 ) ) ( not ( = ?auto_21776 ?auto_21783 ) ) ( not ( = ?auto_21776 ?auto_21782 ) ) ( not ( = ?auto_21776 ?auto_21802 ) ) ( not ( = ?auto_21776 ?auto_21787 ) ) ( not ( = ?auto_21776 ?auto_21797 ) ) ( not ( = ?auto_21777 ?auto_21781 ) ) ( not ( = ?auto_21777 ?auto_21788 ) ) ( not ( = ?auto_21777 ?auto_21799 ) ) ( not ( = ?auto_21777 ?auto_21793 ) ) ( not ( = ?auto_21777 ?auto_21795 ) ) ( not ( = ?auto_21777 ?auto_21796 ) ) ( not ( = ?auto_21777 ?auto_21790 ) ) ( not ( = ?auto_21777 ?auto_21798 ) ) ( not ( = ?auto_21779 ?auto_21785 ) ) ( not ( = ?auto_21779 ?auto_21801 ) ) ( not ( = ?auto_21779 ?auto_21786 ) ) ( not ( = ?auto_21779 ?auto_21803 ) ) ( not ( = ?auto_21779 ?auto_21789 ) ) ( not ( = ?auto_21779 ?auto_21794 ) ) ( not ( = ?auto_21779 ?auto_21792 ) ) ( not ( = ?auto_21779 ?auto_21791 ) ) ( not ( = ?auto_21779 ?auto_21805 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_21764 ?auto_21765 ?auto_21766 ?auto_21767 ?auto_21768 ?auto_21769 ?auto_21770 ?auto_21771 ?auto_21772 ?auto_21773 )
      ( MAKE-1CRATE ?auto_21773 ?auto_21774 )
      ( MAKE-10CRATE-VERIFY ?auto_21764 ?auto_21765 ?auto_21766 ?auto_21767 ?auto_21768 ?auto_21769 ?auto_21770 ?auto_21771 ?auto_21772 ?auto_21773 ?auto_21774 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_21828 - SURFACE
      ?auto_21829 - SURFACE
      ?auto_21830 - SURFACE
      ?auto_21831 - SURFACE
      ?auto_21832 - SURFACE
      ?auto_21833 - SURFACE
      ?auto_21834 - SURFACE
      ?auto_21835 - SURFACE
      ?auto_21836 - SURFACE
      ?auto_21837 - SURFACE
      ?auto_21838 - SURFACE
      ?auto_21839 - SURFACE
    )
    :vars
    (
      ?auto_21843 - HOIST
      ?auto_21842 - PLACE
      ?auto_21840 - PLACE
      ?auto_21844 - HOIST
      ?auto_21841 - SURFACE
      ?auto_21856 - PLACE
      ?auto_21870 - HOIST
      ?auto_21857 - SURFACE
      ?auto_21848 - SURFACE
      ?auto_21871 - PLACE
      ?auto_21865 - HOIST
      ?auto_21846 - SURFACE
      ?auto_21866 - PLACE
      ?auto_21852 - HOIST
      ?auto_21849 - SURFACE
      ?auto_21867 - PLACE
      ?auto_21869 - HOIST
      ?auto_21850 - SURFACE
      ?auto_21862 - PLACE
      ?auto_21864 - HOIST
      ?auto_21863 - SURFACE
      ?auto_21851 - PLACE
      ?auto_21861 - HOIST
      ?auto_21859 - SURFACE
      ?auto_21853 - SURFACE
      ?auto_21860 - PLACE
      ?auto_21858 - HOIST
      ?auto_21855 - SURFACE
      ?auto_21868 - PLACE
      ?auto_21854 - HOIST
      ?auto_21847 - SURFACE
      ?auto_21845 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21843 ?auto_21842 ) ( IS-CRATE ?auto_21839 ) ( not ( = ?auto_21840 ?auto_21842 ) ) ( HOIST-AT ?auto_21844 ?auto_21840 ) ( SURFACE-AT ?auto_21839 ?auto_21840 ) ( ON ?auto_21839 ?auto_21841 ) ( CLEAR ?auto_21839 ) ( not ( = ?auto_21838 ?auto_21839 ) ) ( not ( = ?auto_21838 ?auto_21841 ) ) ( not ( = ?auto_21839 ?auto_21841 ) ) ( not ( = ?auto_21843 ?auto_21844 ) ) ( IS-CRATE ?auto_21838 ) ( not ( = ?auto_21856 ?auto_21842 ) ) ( HOIST-AT ?auto_21870 ?auto_21856 ) ( AVAILABLE ?auto_21870 ) ( SURFACE-AT ?auto_21838 ?auto_21856 ) ( ON ?auto_21838 ?auto_21857 ) ( CLEAR ?auto_21838 ) ( not ( = ?auto_21837 ?auto_21838 ) ) ( not ( = ?auto_21837 ?auto_21857 ) ) ( not ( = ?auto_21838 ?auto_21857 ) ) ( not ( = ?auto_21843 ?auto_21870 ) ) ( IS-CRATE ?auto_21837 ) ( SURFACE-AT ?auto_21837 ?auto_21840 ) ( ON ?auto_21837 ?auto_21848 ) ( CLEAR ?auto_21837 ) ( not ( = ?auto_21836 ?auto_21837 ) ) ( not ( = ?auto_21836 ?auto_21848 ) ) ( not ( = ?auto_21837 ?auto_21848 ) ) ( IS-CRATE ?auto_21836 ) ( not ( = ?auto_21871 ?auto_21842 ) ) ( HOIST-AT ?auto_21865 ?auto_21871 ) ( AVAILABLE ?auto_21865 ) ( SURFACE-AT ?auto_21836 ?auto_21871 ) ( ON ?auto_21836 ?auto_21846 ) ( CLEAR ?auto_21836 ) ( not ( = ?auto_21835 ?auto_21836 ) ) ( not ( = ?auto_21835 ?auto_21846 ) ) ( not ( = ?auto_21836 ?auto_21846 ) ) ( not ( = ?auto_21843 ?auto_21865 ) ) ( IS-CRATE ?auto_21835 ) ( not ( = ?auto_21866 ?auto_21842 ) ) ( HOIST-AT ?auto_21852 ?auto_21866 ) ( AVAILABLE ?auto_21852 ) ( SURFACE-AT ?auto_21835 ?auto_21866 ) ( ON ?auto_21835 ?auto_21849 ) ( CLEAR ?auto_21835 ) ( not ( = ?auto_21834 ?auto_21835 ) ) ( not ( = ?auto_21834 ?auto_21849 ) ) ( not ( = ?auto_21835 ?auto_21849 ) ) ( not ( = ?auto_21843 ?auto_21852 ) ) ( IS-CRATE ?auto_21834 ) ( not ( = ?auto_21867 ?auto_21842 ) ) ( HOIST-AT ?auto_21869 ?auto_21867 ) ( AVAILABLE ?auto_21869 ) ( SURFACE-AT ?auto_21834 ?auto_21867 ) ( ON ?auto_21834 ?auto_21850 ) ( CLEAR ?auto_21834 ) ( not ( = ?auto_21833 ?auto_21834 ) ) ( not ( = ?auto_21833 ?auto_21850 ) ) ( not ( = ?auto_21834 ?auto_21850 ) ) ( not ( = ?auto_21843 ?auto_21869 ) ) ( IS-CRATE ?auto_21833 ) ( not ( = ?auto_21862 ?auto_21842 ) ) ( HOIST-AT ?auto_21864 ?auto_21862 ) ( AVAILABLE ?auto_21864 ) ( SURFACE-AT ?auto_21833 ?auto_21862 ) ( ON ?auto_21833 ?auto_21863 ) ( CLEAR ?auto_21833 ) ( not ( = ?auto_21832 ?auto_21833 ) ) ( not ( = ?auto_21832 ?auto_21863 ) ) ( not ( = ?auto_21833 ?auto_21863 ) ) ( not ( = ?auto_21843 ?auto_21864 ) ) ( IS-CRATE ?auto_21832 ) ( not ( = ?auto_21851 ?auto_21842 ) ) ( HOIST-AT ?auto_21861 ?auto_21851 ) ( AVAILABLE ?auto_21861 ) ( SURFACE-AT ?auto_21832 ?auto_21851 ) ( ON ?auto_21832 ?auto_21859 ) ( CLEAR ?auto_21832 ) ( not ( = ?auto_21831 ?auto_21832 ) ) ( not ( = ?auto_21831 ?auto_21859 ) ) ( not ( = ?auto_21832 ?auto_21859 ) ) ( not ( = ?auto_21843 ?auto_21861 ) ) ( IS-CRATE ?auto_21831 ) ( AVAILABLE ?auto_21844 ) ( SURFACE-AT ?auto_21831 ?auto_21840 ) ( ON ?auto_21831 ?auto_21853 ) ( CLEAR ?auto_21831 ) ( not ( = ?auto_21830 ?auto_21831 ) ) ( not ( = ?auto_21830 ?auto_21853 ) ) ( not ( = ?auto_21831 ?auto_21853 ) ) ( IS-CRATE ?auto_21830 ) ( not ( = ?auto_21860 ?auto_21842 ) ) ( HOIST-AT ?auto_21858 ?auto_21860 ) ( AVAILABLE ?auto_21858 ) ( SURFACE-AT ?auto_21830 ?auto_21860 ) ( ON ?auto_21830 ?auto_21855 ) ( CLEAR ?auto_21830 ) ( not ( = ?auto_21829 ?auto_21830 ) ) ( not ( = ?auto_21829 ?auto_21855 ) ) ( not ( = ?auto_21830 ?auto_21855 ) ) ( not ( = ?auto_21843 ?auto_21858 ) ) ( SURFACE-AT ?auto_21828 ?auto_21842 ) ( CLEAR ?auto_21828 ) ( IS-CRATE ?auto_21829 ) ( AVAILABLE ?auto_21843 ) ( not ( = ?auto_21868 ?auto_21842 ) ) ( HOIST-AT ?auto_21854 ?auto_21868 ) ( AVAILABLE ?auto_21854 ) ( SURFACE-AT ?auto_21829 ?auto_21868 ) ( ON ?auto_21829 ?auto_21847 ) ( CLEAR ?auto_21829 ) ( TRUCK-AT ?auto_21845 ?auto_21842 ) ( not ( = ?auto_21828 ?auto_21829 ) ) ( not ( = ?auto_21828 ?auto_21847 ) ) ( not ( = ?auto_21829 ?auto_21847 ) ) ( not ( = ?auto_21843 ?auto_21854 ) ) ( not ( = ?auto_21828 ?auto_21830 ) ) ( not ( = ?auto_21828 ?auto_21855 ) ) ( not ( = ?auto_21830 ?auto_21847 ) ) ( not ( = ?auto_21860 ?auto_21868 ) ) ( not ( = ?auto_21858 ?auto_21854 ) ) ( not ( = ?auto_21855 ?auto_21847 ) ) ( not ( = ?auto_21828 ?auto_21831 ) ) ( not ( = ?auto_21828 ?auto_21853 ) ) ( not ( = ?auto_21829 ?auto_21831 ) ) ( not ( = ?auto_21829 ?auto_21853 ) ) ( not ( = ?auto_21831 ?auto_21855 ) ) ( not ( = ?auto_21831 ?auto_21847 ) ) ( not ( = ?auto_21840 ?auto_21860 ) ) ( not ( = ?auto_21840 ?auto_21868 ) ) ( not ( = ?auto_21844 ?auto_21858 ) ) ( not ( = ?auto_21844 ?auto_21854 ) ) ( not ( = ?auto_21853 ?auto_21855 ) ) ( not ( = ?auto_21853 ?auto_21847 ) ) ( not ( = ?auto_21828 ?auto_21832 ) ) ( not ( = ?auto_21828 ?auto_21859 ) ) ( not ( = ?auto_21829 ?auto_21832 ) ) ( not ( = ?auto_21829 ?auto_21859 ) ) ( not ( = ?auto_21830 ?auto_21832 ) ) ( not ( = ?auto_21830 ?auto_21859 ) ) ( not ( = ?auto_21832 ?auto_21853 ) ) ( not ( = ?auto_21832 ?auto_21855 ) ) ( not ( = ?auto_21832 ?auto_21847 ) ) ( not ( = ?auto_21851 ?auto_21840 ) ) ( not ( = ?auto_21851 ?auto_21860 ) ) ( not ( = ?auto_21851 ?auto_21868 ) ) ( not ( = ?auto_21861 ?auto_21844 ) ) ( not ( = ?auto_21861 ?auto_21858 ) ) ( not ( = ?auto_21861 ?auto_21854 ) ) ( not ( = ?auto_21859 ?auto_21853 ) ) ( not ( = ?auto_21859 ?auto_21855 ) ) ( not ( = ?auto_21859 ?auto_21847 ) ) ( not ( = ?auto_21828 ?auto_21833 ) ) ( not ( = ?auto_21828 ?auto_21863 ) ) ( not ( = ?auto_21829 ?auto_21833 ) ) ( not ( = ?auto_21829 ?auto_21863 ) ) ( not ( = ?auto_21830 ?auto_21833 ) ) ( not ( = ?auto_21830 ?auto_21863 ) ) ( not ( = ?auto_21831 ?auto_21833 ) ) ( not ( = ?auto_21831 ?auto_21863 ) ) ( not ( = ?auto_21833 ?auto_21859 ) ) ( not ( = ?auto_21833 ?auto_21853 ) ) ( not ( = ?auto_21833 ?auto_21855 ) ) ( not ( = ?auto_21833 ?auto_21847 ) ) ( not ( = ?auto_21862 ?auto_21851 ) ) ( not ( = ?auto_21862 ?auto_21840 ) ) ( not ( = ?auto_21862 ?auto_21860 ) ) ( not ( = ?auto_21862 ?auto_21868 ) ) ( not ( = ?auto_21864 ?auto_21861 ) ) ( not ( = ?auto_21864 ?auto_21844 ) ) ( not ( = ?auto_21864 ?auto_21858 ) ) ( not ( = ?auto_21864 ?auto_21854 ) ) ( not ( = ?auto_21863 ?auto_21859 ) ) ( not ( = ?auto_21863 ?auto_21853 ) ) ( not ( = ?auto_21863 ?auto_21855 ) ) ( not ( = ?auto_21863 ?auto_21847 ) ) ( not ( = ?auto_21828 ?auto_21834 ) ) ( not ( = ?auto_21828 ?auto_21850 ) ) ( not ( = ?auto_21829 ?auto_21834 ) ) ( not ( = ?auto_21829 ?auto_21850 ) ) ( not ( = ?auto_21830 ?auto_21834 ) ) ( not ( = ?auto_21830 ?auto_21850 ) ) ( not ( = ?auto_21831 ?auto_21834 ) ) ( not ( = ?auto_21831 ?auto_21850 ) ) ( not ( = ?auto_21832 ?auto_21834 ) ) ( not ( = ?auto_21832 ?auto_21850 ) ) ( not ( = ?auto_21834 ?auto_21863 ) ) ( not ( = ?auto_21834 ?auto_21859 ) ) ( not ( = ?auto_21834 ?auto_21853 ) ) ( not ( = ?auto_21834 ?auto_21855 ) ) ( not ( = ?auto_21834 ?auto_21847 ) ) ( not ( = ?auto_21867 ?auto_21862 ) ) ( not ( = ?auto_21867 ?auto_21851 ) ) ( not ( = ?auto_21867 ?auto_21840 ) ) ( not ( = ?auto_21867 ?auto_21860 ) ) ( not ( = ?auto_21867 ?auto_21868 ) ) ( not ( = ?auto_21869 ?auto_21864 ) ) ( not ( = ?auto_21869 ?auto_21861 ) ) ( not ( = ?auto_21869 ?auto_21844 ) ) ( not ( = ?auto_21869 ?auto_21858 ) ) ( not ( = ?auto_21869 ?auto_21854 ) ) ( not ( = ?auto_21850 ?auto_21863 ) ) ( not ( = ?auto_21850 ?auto_21859 ) ) ( not ( = ?auto_21850 ?auto_21853 ) ) ( not ( = ?auto_21850 ?auto_21855 ) ) ( not ( = ?auto_21850 ?auto_21847 ) ) ( not ( = ?auto_21828 ?auto_21835 ) ) ( not ( = ?auto_21828 ?auto_21849 ) ) ( not ( = ?auto_21829 ?auto_21835 ) ) ( not ( = ?auto_21829 ?auto_21849 ) ) ( not ( = ?auto_21830 ?auto_21835 ) ) ( not ( = ?auto_21830 ?auto_21849 ) ) ( not ( = ?auto_21831 ?auto_21835 ) ) ( not ( = ?auto_21831 ?auto_21849 ) ) ( not ( = ?auto_21832 ?auto_21835 ) ) ( not ( = ?auto_21832 ?auto_21849 ) ) ( not ( = ?auto_21833 ?auto_21835 ) ) ( not ( = ?auto_21833 ?auto_21849 ) ) ( not ( = ?auto_21835 ?auto_21850 ) ) ( not ( = ?auto_21835 ?auto_21863 ) ) ( not ( = ?auto_21835 ?auto_21859 ) ) ( not ( = ?auto_21835 ?auto_21853 ) ) ( not ( = ?auto_21835 ?auto_21855 ) ) ( not ( = ?auto_21835 ?auto_21847 ) ) ( not ( = ?auto_21866 ?auto_21867 ) ) ( not ( = ?auto_21866 ?auto_21862 ) ) ( not ( = ?auto_21866 ?auto_21851 ) ) ( not ( = ?auto_21866 ?auto_21840 ) ) ( not ( = ?auto_21866 ?auto_21860 ) ) ( not ( = ?auto_21866 ?auto_21868 ) ) ( not ( = ?auto_21852 ?auto_21869 ) ) ( not ( = ?auto_21852 ?auto_21864 ) ) ( not ( = ?auto_21852 ?auto_21861 ) ) ( not ( = ?auto_21852 ?auto_21844 ) ) ( not ( = ?auto_21852 ?auto_21858 ) ) ( not ( = ?auto_21852 ?auto_21854 ) ) ( not ( = ?auto_21849 ?auto_21850 ) ) ( not ( = ?auto_21849 ?auto_21863 ) ) ( not ( = ?auto_21849 ?auto_21859 ) ) ( not ( = ?auto_21849 ?auto_21853 ) ) ( not ( = ?auto_21849 ?auto_21855 ) ) ( not ( = ?auto_21849 ?auto_21847 ) ) ( not ( = ?auto_21828 ?auto_21836 ) ) ( not ( = ?auto_21828 ?auto_21846 ) ) ( not ( = ?auto_21829 ?auto_21836 ) ) ( not ( = ?auto_21829 ?auto_21846 ) ) ( not ( = ?auto_21830 ?auto_21836 ) ) ( not ( = ?auto_21830 ?auto_21846 ) ) ( not ( = ?auto_21831 ?auto_21836 ) ) ( not ( = ?auto_21831 ?auto_21846 ) ) ( not ( = ?auto_21832 ?auto_21836 ) ) ( not ( = ?auto_21832 ?auto_21846 ) ) ( not ( = ?auto_21833 ?auto_21836 ) ) ( not ( = ?auto_21833 ?auto_21846 ) ) ( not ( = ?auto_21834 ?auto_21836 ) ) ( not ( = ?auto_21834 ?auto_21846 ) ) ( not ( = ?auto_21836 ?auto_21849 ) ) ( not ( = ?auto_21836 ?auto_21850 ) ) ( not ( = ?auto_21836 ?auto_21863 ) ) ( not ( = ?auto_21836 ?auto_21859 ) ) ( not ( = ?auto_21836 ?auto_21853 ) ) ( not ( = ?auto_21836 ?auto_21855 ) ) ( not ( = ?auto_21836 ?auto_21847 ) ) ( not ( = ?auto_21871 ?auto_21866 ) ) ( not ( = ?auto_21871 ?auto_21867 ) ) ( not ( = ?auto_21871 ?auto_21862 ) ) ( not ( = ?auto_21871 ?auto_21851 ) ) ( not ( = ?auto_21871 ?auto_21840 ) ) ( not ( = ?auto_21871 ?auto_21860 ) ) ( not ( = ?auto_21871 ?auto_21868 ) ) ( not ( = ?auto_21865 ?auto_21852 ) ) ( not ( = ?auto_21865 ?auto_21869 ) ) ( not ( = ?auto_21865 ?auto_21864 ) ) ( not ( = ?auto_21865 ?auto_21861 ) ) ( not ( = ?auto_21865 ?auto_21844 ) ) ( not ( = ?auto_21865 ?auto_21858 ) ) ( not ( = ?auto_21865 ?auto_21854 ) ) ( not ( = ?auto_21846 ?auto_21849 ) ) ( not ( = ?auto_21846 ?auto_21850 ) ) ( not ( = ?auto_21846 ?auto_21863 ) ) ( not ( = ?auto_21846 ?auto_21859 ) ) ( not ( = ?auto_21846 ?auto_21853 ) ) ( not ( = ?auto_21846 ?auto_21855 ) ) ( not ( = ?auto_21846 ?auto_21847 ) ) ( not ( = ?auto_21828 ?auto_21837 ) ) ( not ( = ?auto_21828 ?auto_21848 ) ) ( not ( = ?auto_21829 ?auto_21837 ) ) ( not ( = ?auto_21829 ?auto_21848 ) ) ( not ( = ?auto_21830 ?auto_21837 ) ) ( not ( = ?auto_21830 ?auto_21848 ) ) ( not ( = ?auto_21831 ?auto_21837 ) ) ( not ( = ?auto_21831 ?auto_21848 ) ) ( not ( = ?auto_21832 ?auto_21837 ) ) ( not ( = ?auto_21832 ?auto_21848 ) ) ( not ( = ?auto_21833 ?auto_21837 ) ) ( not ( = ?auto_21833 ?auto_21848 ) ) ( not ( = ?auto_21834 ?auto_21837 ) ) ( not ( = ?auto_21834 ?auto_21848 ) ) ( not ( = ?auto_21835 ?auto_21837 ) ) ( not ( = ?auto_21835 ?auto_21848 ) ) ( not ( = ?auto_21837 ?auto_21846 ) ) ( not ( = ?auto_21837 ?auto_21849 ) ) ( not ( = ?auto_21837 ?auto_21850 ) ) ( not ( = ?auto_21837 ?auto_21863 ) ) ( not ( = ?auto_21837 ?auto_21859 ) ) ( not ( = ?auto_21837 ?auto_21853 ) ) ( not ( = ?auto_21837 ?auto_21855 ) ) ( not ( = ?auto_21837 ?auto_21847 ) ) ( not ( = ?auto_21848 ?auto_21846 ) ) ( not ( = ?auto_21848 ?auto_21849 ) ) ( not ( = ?auto_21848 ?auto_21850 ) ) ( not ( = ?auto_21848 ?auto_21863 ) ) ( not ( = ?auto_21848 ?auto_21859 ) ) ( not ( = ?auto_21848 ?auto_21853 ) ) ( not ( = ?auto_21848 ?auto_21855 ) ) ( not ( = ?auto_21848 ?auto_21847 ) ) ( not ( = ?auto_21828 ?auto_21838 ) ) ( not ( = ?auto_21828 ?auto_21857 ) ) ( not ( = ?auto_21829 ?auto_21838 ) ) ( not ( = ?auto_21829 ?auto_21857 ) ) ( not ( = ?auto_21830 ?auto_21838 ) ) ( not ( = ?auto_21830 ?auto_21857 ) ) ( not ( = ?auto_21831 ?auto_21838 ) ) ( not ( = ?auto_21831 ?auto_21857 ) ) ( not ( = ?auto_21832 ?auto_21838 ) ) ( not ( = ?auto_21832 ?auto_21857 ) ) ( not ( = ?auto_21833 ?auto_21838 ) ) ( not ( = ?auto_21833 ?auto_21857 ) ) ( not ( = ?auto_21834 ?auto_21838 ) ) ( not ( = ?auto_21834 ?auto_21857 ) ) ( not ( = ?auto_21835 ?auto_21838 ) ) ( not ( = ?auto_21835 ?auto_21857 ) ) ( not ( = ?auto_21836 ?auto_21838 ) ) ( not ( = ?auto_21836 ?auto_21857 ) ) ( not ( = ?auto_21838 ?auto_21848 ) ) ( not ( = ?auto_21838 ?auto_21846 ) ) ( not ( = ?auto_21838 ?auto_21849 ) ) ( not ( = ?auto_21838 ?auto_21850 ) ) ( not ( = ?auto_21838 ?auto_21863 ) ) ( not ( = ?auto_21838 ?auto_21859 ) ) ( not ( = ?auto_21838 ?auto_21853 ) ) ( not ( = ?auto_21838 ?auto_21855 ) ) ( not ( = ?auto_21838 ?auto_21847 ) ) ( not ( = ?auto_21856 ?auto_21840 ) ) ( not ( = ?auto_21856 ?auto_21871 ) ) ( not ( = ?auto_21856 ?auto_21866 ) ) ( not ( = ?auto_21856 ?auto_21867 ) ) ( not ( = ?auto_21856 ?auto_21862 ) ) ( not ( = ?auto_21856 ?auto_21851 ) ) ( not ( = ?auto_21856 ?auto_21860 ) ) ( not ( = ?auto_21856 ?auto_21868 ) ) ( not ( = ?auto_21870 ?auto_21844 ) ) ( not ( = ?auto_21870 ?auto_21865 ) ) ( not ( = ?auto_21870 ?auto_21852 ) ) ( not ( = ?auto_21870 ?auto_21869 ) ) ( not ( = ?auto_21870 ?auto_21864 ) ) ( not ( = ?auto_21870 ?auto_21861 ) ) ( not ( = ?auto_21870 ?auto_21858 ) ) ( not ( = ?auto_21870 ?auto_21854 ) ) ( not ( = ?auto_21857 ?auto_21848 ) ) ( not ( = ?auto_21857 ?auto_21846 ) ) ( not ( = ?auto_21857 ?auto_21849 ) ) ( not ( = ?auto_21857 ?auto_21850 ) ) ( not ( = ?auto_21857 ?auto_21863 ) ) ( not ( = ?auto_21857 ?auto_21859 ) ) ( not ( = ?auto_21857 ?auto_21853 ) ) ( not ( = ?auto_21857 ?auto_21855 ) ) ( not ( = ?auto_21857 ?auto_21847 ) ) ( not ( = ?auto_21828 ?auto_21839 ) ) ( not ( = ?auto_21828 ?auto_21841 ) ) ( not ( = ?auto_21829 ?auto_21839 ) ) ( not ( = ?auto_21829 ?auto_21841 ) ) ( not ( = ?auto_21830 ?auto_21839 ) ) ( not ( = ?auto_21830 ?auto_21841 ) ) ( not ( = ?auto_21831 ?auto_21839 ) ) ( not ( = ?auto_21831 ?auto_21841 ) ) ( not ( = ?auto_21832 ?auto_21839 ) ) ( not ( = ?auto_21832 ?auto_21841 ) ) ( not ( = ?auto_21833 ?auto_21839 ) ) ( not ( = ?auto_21833 ?auto_21841 ) ) ( not ( = ?auto_21834 ?auto_21839 ) ) ( not ( = ?auto_21834 ?auto_21841 ) ) ( not ( = ?auto_21835 ?auto_21839 ) ) ( not ( = ?auto_21835 ?auto_21841 ) ) ( not ( = ?auto_21836 ?auto_21839 ) ) ( not ( = ?auto_21836 ?auto_21841 ) ) ( not ( = ?auto_21837 ?auto_21839 ) ) ( not ( = ?auto_21837 ?auto_21841 ) ) ( not ( = ?auto_21839 ?auto_21857 ) ) ( not ( = ?auto_21839 ?auto_21848 ) ) ( not ( = ?auto_21839 ?auto_21846 ) ) ( not ( = ?auto_21839 ?auto_21849 ) ) ( not ( = ?auto_21839 ?auto_21850 ) ) ( not ( = ?auto_21839 ?auto_21863 ) ) ( not ( = ?auto_21839 ?auto_21859 ) ) ( not ( = ?auto_21839 ?auto_21853 ) ) ( not ( = ?auto_21839 ?auto_21855 ) ) ( not ( = ?auto_21839 ?auto_21847 ) ) ( not ( = ?auto_21841 ?auto_21857 ) ) ( not ( = ?auto_21841 ?auto_21848 ) ) ( not ( = ?auto_21841 ?auto_21846 ) ) ( not ( = ?auto_21841 ?auto_21849 ) ) ( not ( = ?auto_21841 ?auto_21850 ) ) ( not ( = ?auto_21841 ?auto_21863 ) ) ( not ( = ?auto_21841 ?auto_21859 ) ) ( not ( = ?auto_21841 ?auto_21853 ) ) ( not ( = ?auto_21841 ?auto_21855 ) ) ( not ( = ?auto_21841 ?auto_21847 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_21828 ?auto_21829 ?auto_21830 ?auto_21831 ?auto_21832 ?auto_21833 ?auto_21834 ?auto_21835 ?auto_21836 ?auto_21837 ?auto_21838 )
      ( MAKE-1CRATE ?auto_21838 ?auto_21839 )
      ( MAKE-11CRATE-VERIFY ?auto_21828 ?auto_21829 ?auto_21830 ?auto_21831 ?auto_21832 ?auto_21833 ?auto_21834 ?auto_21835 ?auto_21836 ?auto_21837 ?auto_21838 ?auto_21839 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_21895 - SURFACE
      ?auto_21896 - SURFACE
      ?auto_21897 - SURFACE
      ?auto_21898 - SURFACE
      ?auto_21899 - SURFACE
      ?auto_21900 - SURFACE
      ?auto_21901 - SURFACE
      ?auto_21902 - SURFACE
      ?auto_21903 - SURFACE
      ?auto_21904 - SURFACE
      ?auto_21905 - SURFACE
      ?auto_21906 - SURFACE
      ?auto_21907 - SURFACE
    )
    :vars
    (
      ?auto_21913 - HOIST
      ?auto_21912 - PLACE
      ?auto_21911 - PLACE
      ?auto_21908 - HOIST
      ?auto_21909 - SURFACE
      ?auto_21931 - PLACE
      ?auto_21924 - HOIST
      ?auto_21922 - SURFACE
      ?auto_21934 - PLACE
      ?auto_21938 - HOIST
      ?auto_21928 - SURFACE
      ?auto_21936 - SURFACE
      ?auto_21937 - PLACE
      ?auto_21940 - HOIST
      ?auto_21917 - SURFACE
      ?auto_21932 - PLACE
      ?auto_21919 - HOIST
      ?auto_21915 - SURFACE
      ?auto_21918 - PLACE
      ?auto_21939 - HOIST
      ?auto_21923 - SURFACE
      ?auto_21921 - PLACE
      ?auto_21927 - HOIST
      ?auto_21933 - SURFACE
      ?auto_21926 - PLACE
      ?auto_21916 - HOIST
      ?auto_21929 - SURFACE
      ?auto_21930 - SURFACE
      ?auto_21920 - PLACE
      ?auto_21914 - HOIST
      ?auto_21935 - SURFACE
      ?auto_21925 - SURFACE
      ?auto_21910 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21913 ?auto_21912 ) ( IS-CRATE ?auto_21907 ) ( not ( = ?auto_21911 ?auto_21912 ) ) ( HOIST-AT ?auto_21908 ?auto_21911 ) ( SURFACE-AT ?auto_21907 ?auto_21911 ) ( ON ?auto_21907 ?auto_21909 ) ( CLEAR ?auto_21907 ) ( not ( = ?auto_21906 ?auto_21907 ) ) ( not ( = ?auto_21906 ?auto_21909 ) ) ( not ( = ?auto_21907 ?auto_21909 ) ) ( not ( = ?auto_21913 ?auto_21908 ) ) ( IS-CRATE ?auto_21906 ) ( not ( = ?auto_21931 ?auto_21912 ) ) ( HOIST-AT ?auto_21924 ?auto_21931 ) ( SURFACE-AT ?auto_21906 ?auto_21931 ) ( ON ?auto_21906 ?auto_21922 ) ( CLEAR ?auto_21906 ) ( not ( = ?auto_21905 ?auto_21906 ) ) ( not ( = ?auto_21905 ?auto_21922 ) ) ( not ( = ?auto_21906 ?auto_21922 ) ) ( not ( = ?auto_21913 ?auto_21924 ) ) ( IS-CRATE ?auto_21905 ) ( not ( = ?auto_21934 ?auto_21912 ) ) ( HOIST-AT ?auto_21938 ?auto_21934 ) ( AVAILABLE ?auto_21938 ) ( SURFACE-AT ?auto_21905 ?auto_21934 ) ( ON ?auto_21905 ?auto_21928 ) ( CLEAR ?auto_21905 ) ( not ( = ?auto_21904 ?auto_21905 ) ) ( not ( = ?auto_21904 ?auto_21928 ) ) ( not ( = ?auto_21905 ?auto_21928 ) ) ( not ( = ?auto_21913 ?auto_21938 ) ) ( IS-CRATE ?auto_21904 ) ( SURFACE-AT ?auto_21904 ?auto_21931 ) ( ON ?auto_21904 ?auto_21936 ) ( CLEAR ?auto_21904 ) ( not ( = ?auto_21903 ?auto_21904 ) ) ( not ( = ?auto_21903 ?auto_21936 ) ) ( not ( = ?auto_21904 ?auto_21936 ) ) ( IS-CRATE ?auto_21903 ) ( not ( = ?auto_21937 ?auto_21912 ) ) ( HOIST-AT ?auto_21940 ?auto_21937 ) ( AVAILABLE ?auto_21940 ) ( SURFACE-AT ?auto_21903 ?auto_21937 ) ( ON ?auto_21903 ?auto_21917 ) ( CLEAR ?auto_21903 ) ( not ( = ?auto_21902 ?auto_21903 ) ) ( not ( = ?auto_21902 ?auto_21917 ) ) ( not ( = ?auto_21903 ?auto_21917 ) ) ( not ( = ?auto_21913 ?auto_21940 ) ) ( IS-CRATE ?auto_21902 ) ( not ( = ?auto_21932 ?auto_21912 ) ) ( HOIST-AT ?auto_21919 ?auto_21932 ) ( AVAILABLE ?auto_21919 ) ( SURFACE-AT ?auto_21902 ?auto_21932 ) ( ON ?auto_21902 ?auto_21915 ) ( CLEAR ?auto_21902 ) ( not ( = ?auto_21901 ?auto_21902 ) ) ( not ( = ?auto_21901 ?auto_21915 ) ) ( not ( = ?auto_21902 ?auto_21915 ) ) ( not ( = ?auto_21913 ?auto_21919 ) ) ( IS-CRATE ?auto_21901 ) ( not ( = ?auto_21918 ?auto_21912 ) ) ( HOIST-AT ?auto_21939 ?auto_21918 ) ( AVAILABLE ?auto_21939 ) ( SURFACE-AT ?auto_21901 ?auto_21918 ) ( ON ?auto_21901 ?auto_21923 ) ( CLEAR ?auto_21901 ) ( not ( = ?auto_21900 ?auto_21901 ) ) ( not ( = ?auto_21900 ?auto_21923 ) ) ( not ( = ?auto_21901 ?auto_21923 ) ) ( not ( = ?auto_21913 ?auto_21939 ) ) ( IS-CRATE ?auto_21900 ) ( not ( = ?auto_21921 ?auto_21912 ) ) ( HOIST-AT ?auto_21927 ?auto_21921 ) ( AVAILABLE ?auto_21927 ) ( SURFACE-AT ?auto_21900 ?auto_21921 ) ( ON ?auto_21900 ?auto_21933 ) ( CLEAR ?auto_21900 ) ( not ( = ?auto_21899 ?auto_21900 ) ) ( not ( = ?auto_21899 ?auto_21933 ) ) ( not ( = ?auto_21900 ?auto_21933 ) ) ( not ( = ?auto_21913 ?auto_21927 ) ) ( IS-CRATE ?auto_21899 ) ( not ( = ?auto_21926 ?auto_21912 ) ) ( HOIST-AT ?auto_21916 ?auto_21926 ) ( AVAILABLE ?auto_21916 ) ( SURFACE-AT ?auto_21899 ?auto_21926 ) ( ON ?auto_21899 ?auto_21929 ) ( CLEAR ?auto_21899 ) ( not ( = ?auto_21898 ?auto_21899 ) ) ( not ( = ?auto_21898 ?auto_21929 ) ) ( not ( = ?auto_21899 ?auto_21929 ) ) ( not ( = ?auto_21913 ?auto_21916 ) ) ( IS-CRATE ?auto_21898 ) ( AVAILABLE ?auto_21924 ) ( SURFACE-AT ?auto_21898 ?auto_21931 ) ( ON ?auto_21898 ?auto_21930 ) ( CLEAR ?auto_21898 ) ( not ( = ?auto_21897 ?auto_21898 ) ) ( not ( = ?auto_21897 ?auto_21930 ) ) ( not ( = ?auto_21898 ?auto_21930 ) ) ( IS-CRATE ?auto_21897 ) ( not ( = ?auto_21920 ?auto_21912 ) ) ( HOIST-AT ?auto_21914 ?auto_21920 ) ( AVAILABLE ?auto_21914 ) ( SURFACE-AT ?auto_21897 ?auto_21920 ) ( ON ?auto_21897 ?auto_21935 ) ( CLEAR ?auto_21897 ) ( not ( = ?auto_21896 ?auto_21897 ) ) ( not ( = ?auto_21896 ?auto_21935 ) ) ( not ( = ?auto_21897 ?auto_21935 ) ) ( not ( = ?auto_21913 ?auto_21914 ) ) ( SURFACE-AT ?auto_21895 ?auto_21912 ) ( CLEAR ?auto_21895 ) ( IS-CRATE ?auto_21896 ) ( AVAILABLE ?auto_21913 ) ( AVAILABLE ?auto_21908 ) ( SURFACE-AT ?auto_21896 ?auto_21911 ) ( ON ?auto_21896 ?auto_21925 ) ( CLEAR ?auto_21896 ) ( TRUCK-AT ?auto_21910 ?auto_21912 ) ( not ( = ?auto_21895 ?auto_21896 ) ) ( not ( = ?auto_21895 ?auto_21925 ) ) ( not ( = ?auto_21896 ?auto_21925 ) ) ( not ( = ?auto_21895 ?auto_21897 ) ) ( not ( = ?auto_21895 ?auto_21935 ) ) ( not ( = ?auto_21897 ?auto_21925 ) ) ( not ( = ?auto_21920 ?auto_21911 ) ) ( not ( = ?auto_21914 ?auto_21908 ) ) ( not ( = ?auto_21935 ?auto_21925 ) ) ( not ( = ?auto_21895 ?auto_21898 ) ) ( not ( = ?auto_21895 ?auto_21930 ) ) ( not ( = ?auto_21896 ?auto_21898 ) ) ( not ( = ?auto_21896 ?auto_21930 ) ) ( not ( = ?auto_21898 ?auto_21935 ) ) ( not ( = ?auto_21898 ?auto_21925 ) ) ( not ( = ?auto_21931 ?auto_21920 ) ) ( not ( = ?auto_21931 ?auto_21911 ) ) ( not ( = ?auto_21924 ?auto_21914 ) ) ( not ( = ?auto_21924 ?auto_21908 ) ) ( not ( = ?auto_21930 ?auto_21935 ) ) ( not ( = ?auto_21930 ?auto_21925 ) ) ( not ( = ?auto_21895 ?auto_21899 ) ) ( not ( = ?auto_21895 ?auto_21929 ) ) ( not ( = ?auto_21896 ?auto_21899 ) ) ( not ( = ?auto_21896 ?auto_21929 ) ) ( not ( = ?auto_21897 ?auto_21899 ) ) ( not ( = ?auto_21897 ?auto_21929 ) ) ( not ( = ?auto_21899 ?auto_21930 ) ) ( not ( = ?auto_21899 ?auto_21935 ) ) ( not ( = ?auto_21899 ?auto_21925 ) ) ( not ( = ?auto_21926 ?auto_21931 ) ) ( not ( = ?auto_21926 ?auto_21920 ) ) ( not ( = ?auto_21926 ?auto_21911 ) ) ( not ( = ?auto_21916 ?auto_21924 ) ) ( not ( = ?auto_21916 ?auto_21914 ) ) ( not ( = ?auto_21916 ?auto_21908 ) ) ( not ( = ?auto_21929 ?auto_21930 ) ) ( not ( = ?auto_21929 ?auto_21935 ) ) ( not ( = ?auto_21929 ?auto_21925 ) ) ( not ( = ?auto_21895 ?auto_21900 ) ) ( not ( = ?auto_21895 ?auto_21933 ) ) ( not ( = ?auto_21896 ?auto_21900 ) ) ( not ( = ?auto_21896 ?auto_21933 ) ) ( not ( = ?auto_21897 ?auto_21900 ) ) ( not ( = ?auto_21897 ?auto_21933 ) ) ( not ( = ?auto_21898 ?auto_21900 ) ) ( not ( = ?auto_21898 ?auto_21933 ) ) ( not ( = ?auto_21900 ?auto_21929 ) ) ( not ( = ?auto_21900 ?auto_21930 ) ) ( not ( = ?auto_21900 ?auto_21935 ) ) ( not ( = ?auto_21900 ?auto_21925 ) ) ( not ( = ?auto_21921 ?auto_21926 ) ) ( not ( = ?auto_21921 ?auto_21931 ) ) ( not ( = ?auto_21921 ?auto_21920 ) ) ( not ( = ?auto_21921 ?auto_21911 ) ) ( not ( = ?auto_21927 ?auto_21916 ) ) ( not ( = ?auto_21927 ?auto_21924 ) ) ( not ( = ?auto_21927 ?auto_21914 ) ) ( not ( = ?auto_21927 ?auto_21908 ) ) ( not ( = ?auto_21933 ?auto_21929 ) ) ( not ( = ?auto_21933 ?auto_21930 ) ) ( not ( = ?auto_21933 ?auto_21935 ) ) ( not ( = ?auto_21933 ?auto_21925 ) ) ( not ( = ?auto_21895 ?auto_21901 ) ) ( not ( = ?auto_21895 ?auto_21923 ) ) ( not ( = ?auto_21896 ?auto_21901 ) ) ( not ( = ?auto_21896 ?auto_21923 ) ) ( not ( = ?auto_21897 ?auto_21901 ) ) ( not ( = ?auto_21897 ?auto_21923 ) ) ( not ( = ?auto_21898 ?auto_21901 ) ) ( not ( = ?auto_21898 ?auto_21923 ) ) ( not ( = ?auto_21899 ?auto_21901 ) ) ( not ( = ?auto_21899 ?auto_21923 ) ) ( not ( = ?auto_21901 ?auto_21933 ) ) ( not ( = ?auto_21901 ?auto_21929 ) ) ( not ( = ?auto_21901 ?auto_21930 ) ) ( not ( = ?auto_21901 ?auto_21935 ) ) ( not ( = ?auto_21901 ?auto_21925 ) ) ( not ( = ?auto_21918 ?auto_21921 ) ) ( not ( = ?auto_21918 ?auto_21926 ) ) ( not ( = ?auto_21918 ?auto_21931 ) ) ( not ( = ?auto_21918 ?auto_21920 ) ) ( not ( = ?auto_21918 ?auto_21911 ) ) ( not ( = ?auto_21939 ?auto_21927 ) ) ( not ( = ?auto_21939 ?auto_21916 ) ) ( not ( = ?auto_21939 ?auto_21924 ) ) ( not ( = ?auto_21939 ?auto_21914 ) ) ( not ( = ?auto_21939 ?auto_21908 ) ) ( not ( = ?auto_21923 ?auto_21933 ) ) ( not ( = ?auto_21923 ?auto_21929 ) ) ( not ( = ?auto_21923 ?auto_21930 ) ) ( not ( = ?auto_21923 ?auto_21935 ) ) ( not ( = ?auto_21923 ?auto_21925 ) ) ( not ( = ?auto_21895 ?auto_21902 ) ) ( not ( = ?auto_21895 ?auto_21915 ) ) ( not ( = ?auto_21896 ?auto_21902 ) ) ( not ( = ?auto_21896 ?auto_21915 ) ) ( not ( = ?auto_21897 ?auto_21902 ) ) ( not ( = ?auto_21897 ?auto_21915 ) ) ( not ( = ?auto_21898 ?auto_21902 ) ) ( not ( = ?auto_21898 ?auto_21915 ) ) ( not ( = ?auto_21899 ?auto_21902 ) ) ( not ( = ?auto_21899 ?auto_21915 ) ) ( not ( = ?auto_21900 ?auto_21902 ) ) ( not ( = ?auto_21900 ?auto_21915 ) ) ( not ( = ?auto_21902 ?auto_21923 ) ) ( not ( = ?auto_21902 ?auto_21933 ) ) ( not ( = ?auto_21902 ?auto_21929 ) ) ( not ( = ?auto_21902 ?auto_21930 ) ) ( not ( = ?auto_21902 ?auto_21935 ) ) ( not ( = ?auto_21902 ?auto_21925 ) ) ( not ( = ?auto_21932 ?auto_21918 ) ) ( not ( = ?auto_21932 ?auto_21921 ) ) ( not ( = ?auto_21932 ?auto_21926 ) ) ( not ( = ?auto_21932 ?auto_21931 ) ) ( not ( = ?auto_21932 ?auto_21920 ) ) ( not ( = ?auto_21932 ?auto_21911 ) ) ( not ( = ?auto_21919 ?auto_21939 ) ) ( not ( = ?auto_21919 ?auto_21927 ) ) ( not ( = ?auto_21919 ?auto_21916 ) ) ( not ( = ?auto_21919 ?auto_21924 ) ) ( not ( = ?auto_21919 ?auto_21914 ) ) ( not ( = ?auto_21919 ?auto_21908 ) ) ( not ( = ?auto_21915 ?auto_21923 ) ) ( not ( = ?auto_21915 ?auto_21933 ) ) ( not ( = ?auto_21915 ?auto_21929 ) ) ( not ( = ?auto_21915 ?auto_21930 ) ) ( not ( = ?auto_21915 ?auto_21935 ) ) ( not ( = ?auto_21915 ?auto_21925 ) ) ( not ( = ?auto_21895 ?auto_21903 ) ) ( not ( = ?auto_21895 ?auto_21917 ) ) ( not ( = ?auto_21896 ?auto_21903 ) ) ( not ( = ?auto_21896 ?auto_21917 ) ) ( not ( = ?auto_21897 ?auto_21903 ) ) ( not ( = ?auto_21897 ?auto_21917 ) ) ( not ( = ?auto_21898 ?auto_21903 ) ) ( not ( = ?auto_21898 ?auto_21917 ) ) ( not ( = ?auto_21899 ?auto_21903 ) ) ( not ( = ?auto_21899 ?auto_21917 ) ) ( not ( = ?auto_21900 ?auto_21903 ) ) ( not ( = ?auto_21900 ?auto_21917 ) ) ( not ( = ?auto_21901 ?auto_21903 ) ) ( not ( = ?auto_21901 ?auto_21917 ) ) ( not ( = ?auto_21903 ?auto_21915 ) ) ( not ( = ?auto_21903 ?auto_21923 ) ) ( not ( = ?auto_21903 ?auto_21933 ) ) ( not ( = ?auto_21903 ?auto_21929 ) ) ( not ( = ?auto_21903 ?auto_21930 ) ) ( not ( = ?auto_21903 ?auto_21935 ) ) ( not ( = ?auto_21903 ?auto_21925 ) ) ( not ( = ?auto_21937 ?auto_21932 ) ) ( not ( = ?auto_21937 ?auto_21918 ) ) ( not ( = ?auto_21937 ?auto_21921 ) ) ( not ( = ?auto_21937 ?auto_21926 ) ) ( not ( = ?auto_21937 ?auto_21931 ) ) ( not ( = ?auto_21937 ?auto_21920 ) ) ( not ( = ?auto_21937 ?auto_21911 ) ) ( not ( = ?auto_21940 ?auto_21919 ) ) ( not ( = ?auto_21940 ?auto_21939 ) ) ( not ( = ?auto_21940 ?auto_21927 ) ) ( not ( = ?auto_21940 ?auto_21916 ) ) ( not ( = ?auto_21940 ?auto_21924 ) ) ( not ( = ?auto_21940 ?auto_21914 ) ) ( not ( = ?auto_21940 ?auto_21908 ) ) ( not ( = ?auto_21917 ?auto_21915 ) ) ( not ( = ?auto_21917 ?auto_21923 ) ) ( not ( = ?auto_21917 ?auto_21933 ) ) ( not ( = ?auto_21917 ?auto_21929 ) ) ( not ( = ?auto_21917 ?auto_21930 ) ) ( not ( = ?auto_21917 ?auto_21935 ) ) ( not ( = ?auto_21917 ?auto_21925 ) ) ( not ( = ?auto_21895 ?auto_21904 ) ) ( not ( = ?auto_21895 ?auto_21936 ) ) ( not ( = ?auto_21896 ?auto_21904 ) ) ( not ( = ?auto_21896 ?auto_21936 ) ) ( not ( = ?auto_21897 ?auto_21904 ) ) ( not ( = ?auto_21897 ?auto_21936 ) ) ( not ( = ?auto_21898 ?auto_21904 ) ) ( not ( = ?auto_21898 ?auto_21936 ) ) ( not ( = ?auto_21899 ?auto_21904 ) ) ( not ( = ?auto_21899 ?auto_21936 ) ) ( not ( = ?auto_21900 ?auto_21904 ) ) ( not ( = ?auto_21900 ?auto_21936 ) ) ( not ( = ?auto_21901 ?auto_21904 ) ) ( not ( = ?auto_21901 ?auto_21936 ) ) ( not ( = ?auto_21902 ?auto_21904 ) ) ( not ( = ?auto_21902 ?auto_21936 ) ) ( not ( = ?auto_21904 ?auto_21917 ) ) ( not ( = ?auto_21904 ?auto_21915 ) ) ( not ( = ?auto_21904 ?auto_21923 ) ) ( not ( = ?auto_21904 ?auto_21933 ) ) ( not ( = ?auto_21904 ?auto_21929 ) ) ( not ( = ?auto_21904 ?auto_21930 ) ) ( not ( = ?auto_21904 ?auto_21935 ) ) ( not ( = ?auto_21904 ?auto_21925 ) ) ( not ( = ?auto_21936 ?auto_21917 ) ) ( not ( = ?auto_21936 ?auto_21915 ) ) ( not ( = ?auto_21936 ?auto_21923 ) ) ( not ( = ?auto_21936 ?auto_21933 ) ) ( not ( = ?auto_21936 ?auto_21929 ) ) ( not ( = ?auto_21936 ?auto_21930 ) ) ( not ( = ?auto_21936 ?auto_21935 ) ) ( not ( = ?auto_21936 ?auto_21925 ) ) ( not ( = ?auto_21895 ?auto_21905 ) ) ( not ( = ?auto_21895 ?auto_21928 ) ) ( not ( = ?auto_21896 ?auto_21905 ) ) ( not ( = ?auto_21896 ?auto_21928 ) ) ( not ( = ?auto_21897 ?auto_21905 ) ) ( not ( = ?auto_21897 ?auto_21928 ) ) ( not ( = ?auto_21898 ?auto_21905 ) ) ( not ( = ?auto_21898 ?auto_21928 ) ) ( not ( = ?auto_21899 ?auto_21905 ) ) ( not ( = ?auto_21899 ?auto_21928 ) ) ( not ( = ?auto_21900 ?auto_21905 ) ) ( not ( = ?auto_21900 ?auto_21928 ) ) ( not ( = ?auto_21901 ?auto_21905 ) ) ( not ( = ?auto_21901 ?auto_21928 ) ) ( not ( = ?auto_21902 ?auto_21905 ) ) ( not ( = ?auto_21902 ?auto_21928 ) ) ( not ( = ?auto_21903 ?auto_21905 ) ) ( not ( = ?auto_21903 ?auto_21928 ) ) ( not ( = ?auto_21905 ?auto_21936 ) ) ( not ( = ?auto_21905 ?auto_21917 ) ) ( not ( = ?auto_21905 ?auto_21915 ) ) ( not ( = ?auto_21905 ?auto_21923 ) ) ( not ( = ?auto_21905 ?auto_21933 ) ) ( not ( = ?auto_21905 ?auto_21929 ) ) ( not ( = ?auto_21905 ?auto_21930 ) ) ( not ( = ?auto_21905 ?auto_21935 ) ) ( not ( = ?auto_21905 ?auto_21925 ) ) ( not ( = ?auto_21934 ?auto_21931 ) ) ( not ( = ?auto_21934 ?auto_21937 ) ) ( not ( = ?auto_21934 ?auto_21932 ) ) ( not ( = ?auto_21934 ?auto_21918 ) ) ( not ( = ?auto_21934 ?auto_21921 ) ) ( not ( = ?auto_21934 ?auto_21926 ) ) ( not ( = ?auto_21934 ?auto_21920 ) ) ( not ( = ?auto_21934 ?auto_21911 ) ) ( not ( = ?auto_21938 ?auto_21924 ) ) ( not ( = ?auto_21938 ?auto_21940 ) ) ( not ( = ?auto_21938 ?auto_21919 ) ) ( not ( = ?auto_21938 ?auto_21939 ) ) ( not ( = ?auto_21938 ?auto_21927 ) ) ( not ( = ?auto_21938 ?auto_21916 ) ) ( not ( = ?auto_21938 ?auto_21914 ) ) ( not ( = ?auto_21938 ?auto_21908 ) ) ( not ( = ?auto_21928 ?auto_21936 ) ) ( not ( = ?auto_21928 ?auto_21917 ) ) ( not ( = ?auto_21928 ?auto_21915 ) ) ( not ( = ?auto_21928 ?auto_21923 ) ) ( not ( = ?auto_21928 ?auto_21933 ) ) ( not ( = ?auto_21928 ?auto_21929 ) ) ( not ( = ?auto_21928 ?auto_21930 ) ) ( not ( = ?auto_21928 ?auto_21935 ) ) ( not ( = ?auto_21928 ?auto_21925 ) ) ( not ( = ?auto_21895 ?auto_21906 ) ) ( not ( = ?auto_21895 ?auto_21922 ) ) ( not ( = ?auto_21896 ?auto_21906 ) ) ( not ( = ?auto_21896 ?auto_21922 ) ) ( not ( = ?auto_21897 ?auto_21906 ) ) ( not ( = ?auto_21897 ?auto_21922 ) ) ( not ( = ?auto_21898 ?auto_21906 ) ) ( not ( = ?auto_21898 ?auto_21922 ) ) ( not ( = ?auto_21899 ?auto_21906 ) ) ( not ( = ?auto_21899 ?auto_21922 ) ) ( not ( = ?auto_21900 ?auto_21906 ) ) ( not ( = ?auto_21900 ?auto_21922 ) ) ( not ( = ?auto_21901 ?auto_21906 ) ) ( not ( = ?auto_21901 ?auto_21922 ) ) ( not ( = ?auto_21902 ?auto_21906 ) ) ( not ( = ?auto_21902 ?auto_21922 ) ) ( not ( = ?auto_21903 ?auto_21906 ) ) ( not ( = ?auto_21903 ?auto_21922 ) ) ( not ( = ?auto_21904 ?auto_21906 ) ) ( not ( = ?auto_21904 ?auto_21922 ) ) ( not ( = ?auto_21906 ?auto_21928 ) ) ( not ( = ?auto_21906 ?auto_21936 ) ) ( not ( = ?auto_21906 ?auto_21917 ) ) ( not ( = ?auto_21906 ?auto_21915 ) ) ( not ( = ?auto_21906 ?auto_21923 ) ) ( not ( = ?auto_21906 ?auto_21933 ) ) ( not ( = ?auto_21906 ?auto_21929 ) ) ( not ( = ?auto_21906 ?auto_21930 ) ) ( not ( = ?auto_21906 ?auto_21935 ) ) ( not ( = ?auto_21906 ?auto_21925 ) ) ( not ( = ?auto_21922 ?auto_21928 ) ) ( not ( = ?auto_21922 ?auto_21936 ) ) ( not ( = ?auto_21922 ?auto_21917 ) ) ( not ( = ?auto_21922 ?auto_21915 ) ) ( not ( = ?auto_21922 ?auto_21923 ) ) ( not ( = ?auto_21922 ?auto_21933 ) ) ( not ( = ?auto_21922 ?auto_21929 ) ) ( not ( = ?auto_21922 ?auto_21930 ) ) ( not ( = ?auto_21922 ?auto_21935 ) ) ( not ( = ?auto_21922 ?auto_21925 ) ) ( not ( = ?auto_21895 ?auto_21907 ) ) ( not ( = ?auto_21895 ?auto_21909 ) ) ( not ( = ?auto_21896 ?auto_21907 ) ) ( not ( = ?auto_21896 ?auto_21909 ) ) ( not ( = ?auto_21897 ?auto_21907 ) ) ( not ( = ?auto_21897 ?auto_21909 ) ) ( not ( = ?auto_21898 ?auto_21907 ) ) ( not ( = ?auto_21898 ?auto_21909 ) ) ( not ( = ?auto_21899 ?auto_21907 ) ) ( not ( = ?auto_21899 ?auto_21909 ) ) ( not ( = ?auto_21900 ?auto_21907 ) ) ( not ( = ?auto_21900 ?auto_21909 ) ) ( not ( = ?auto_21901 ?auto_21907 ) ) ( not ( = ?auto_21901 ?auto_21909 ) ) ( not ( = ?auto_21902 ?auto_21907 ) ) ( not ( = ?auto_21902 ?auto_21909 ) ) ( not ( = ?auto_21903 ?auto_21907 ) ) ( not ( = ?auto_21903 ?auto_21909 ) ) ( not ( = ?auto_21904 ?auto_21907 ) ) ( not ( = ?auto_21904 ?auto_21909 ) ) ( not ( = ?auto_21905 ?auto_21907 ) ) ( not ( = ?auto_21905 ?auto_21909 ) ) ( not ( = ?auto_21907 ?auto_21922 ) ) ( not ( = ?auto_21907 ?auto_21928 ) ) ( not ( = ?auto_21907 ?auto_21936 ) ) ( not ( = ?auto_21907 ?auto_21917 ) ) ( not ( = ?auto_21907 ?auto_21915 ) ) ( not ( = ?auto_21907 ?auto_21923 ) ) ( not ( = ?auto_21907 ?auto_21933 ) ) ( not ( = ?auto_21907 ?auto_21929 ) ) ( not ( = ?auto_21907 ?auto_21930 ) ) ( not ( = ?auto_21907 ?auto_21935 ) ) ( not ( = ?auto_21907 ?auto_21925 ) ) ( not ( = ?auto_21909 ?auto_21922 ) ) ( not ( = ?auto_21909 ?auto_21928 ) ) ( not ( = ?auto_21909 ?auto_21936 ) ) ( not ( = ?auto_21909 ?auto_21917 ) ) ( not ( = ?auto_21909 ?auto_21915 ) ) ( not ( = ?auto_21909 ?auto_21923 ) ) ( not ( = ?auto_21909 ?auto_21933 ) ) ( not ( = ?auto_21909 ?auto_21929 ) ) ( not ( = ?auto_21909 ?auto_21930 ) ) ( not ( = ?auto_21909 ?auto_21935 ) ) ( not ( = ?auto_21909 ?auto_21925 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_21895 ?auto_21896 ?auto_21897 ?auto_21898 ?auto_21899 ?auto_21900 ?auto_21901 ?auto_21902 ?auto_21903 ?auto_21904 ?auto_21905 ?auto_21906 )
      ( MAKE-1CRATE ?auto_21906 ?auto_21907 )
      ( MAKE-12CRATE-VERIFY ?auto_21895 ?auto_21896 ?auto_21897 ?auto_21898 ?auto_21899 ?auto_21900 ?auto_21901 ?auto_21902 ?auto_21903 ?auto_21904 ?auto_21905 ?auto_21906 ?auto_21907 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_21965 - SURFACE
      ?auto_21966 - SURFACE
      ?auto_21967 - SURFACE
      ?auto_21968 - SURFACE
      ?auto_21969 - SURFACE
      ?auto_21970 - SURFACE
      ?auto_21971 - SURFACE
      ?auto_21972 - SURFACE
      ?auto_21973 - SURFACE
      ?auto_21974 - SURFACE
      ?auto_21975 - SURFACE
      ?auto_21976 - SURFACE
      ?auto_21977 - SURFACE
      ?auto_21978 - SURFACE
    )
    :vars
    (
      ?auto_21981 - HOIST
      ?auto_21984 - PLACE
      ?auto_21983 - PLACE
      ?auto_21980 - HOIST
      ?auto_21979 - SURFACE
      ?auto_21998 - PLACE
      ?auto_21988 - HOIST
      ?auto_21987 - SURFACE
      ?auto_22009 - PLACE
      ?auto_21993 - HOIST
      ?auto_21989 - SURFACE
      ?auto_22012 - PLACE
      ?auto_22003 - HOIST
      ?auto_22008 - SURFACE
      ?auto_21999 - SURFACE
      ?auto_22011 - PLACE
      ?auto_22001 - HOIST
      ?auto_22007 - SURFACE
      ?auto_21995 - PLACE
      ?auto_22004 - HOIST
      ?auto_21990 - SURFACE
      ?auto_21996 - PLACE
      ?auto_22000 - HOIST
      ?auto_22006 - SURFACE
      ?auto_21986 - SURFACE
      ?auto_22002 - PLACE
      ?auto_22005 - HOIST
      ?auto_21992 - SURFACE
      ?auto_21985 - SURFACE
      ?auto_21991 - PLACE
      ?auto_21997 - HOIST
      ?auto_21994 - SURFACE
      ?auto_22010 - SURFACE
      ?auto_21982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21981 ?auto_21984 ) ( IS-CRATE ?auto_21978 ) ( not ( = ?auto_21983 ?auto_21984 ) ) ( HOIST-AT ?auto_21980 ?auto_21983 ) ( SURFACE-AT ?auto_21978 ?auto_21983 ) ( ON ?auto_21978 ?auto_21979 ) ( CLEAR ?auto_21978 ) ( not ( = ?auto_21977 ?auto_21978 ) ) ( not ( = ?auto_21977 ?auto_21979 ) ) ( not ( = ?auto_21978 ?auto_21979 ) ) ( not ( = ?auto_21981 ?auto_21980 ) ) ( IS-CRATE ?auto_21977 ) ( not ( = ?auto_21998 ?auto_21984 ) ) ( HOIST-AT ?auto_21988 ?auto_21998 ) ( SURFACE-AT ?auto_21977 ?auto_21998 ) ( ON ?auto_21977 ?auto_21987 ) ( CLEAR ?auto_21977 ) ( not ( = ?auto_21976 ?auto_21977 ) ) ( not ( = ?auto_21976 ?auto_21987 ) ) ( not ( = ?auto_21977 ?auto_21987 ) ) ( not ( = ?auto_21981 ?auto_21988 ) ) ( IS-CRATE ?auto_21976 ) ( not ( = ?auto_22009 ?auto_21984 ) ) ( HOIST-AT ?auto_21993 ?auto_22009 ) ( SURFACE-AT ?auto_21976 ?auto_22009 ) ( ON ?auto_21976 ?auto_21989 ) ( CLEAR ?auto_21976 ) ( not ( = ?auto_21975 ?auto_21976 ) ) ( not ( = ?auto_21975 ?auto_21989 ) ) ( not ( = ?auto_21976 ?auto_21989 ) ) ( not ( = ?auto_21981 ?auto_21993 ) ) ( IS-CRATE ?auto_21975 ) ( not ( = ?auto_22012 ?auto_21984 ) ) ( HOIST-AT ?auto_22003 ?auto_22012 ) ( AVAILABLE ?auto_22003 ) ( SURFACE-AT ?auto_21975 ?auto_22012 ) ( ON ?auto_21975 ?auto_22008 ) ( CLEAR ?auto_21975 ) ( not ( = ?auto_21974 ?auto_21975 ) ) ( not ( = ?auto_21974 ?auto_22008 ) ) ( not ( = ?auto_21975 ?auto_22008 ) ) ( not ( = ?auto_21981 ?auto_22003 ) ) ( IS-CRATE ?auto_21974 ) ( SURFACE-AT ?auto_21974 ?auto_22009 ) ( ON ?auto_21974 ?auto_21999 ) ( CLEAR ?auto_21974 ) ( not ( = ?auto_21973 ?auto_21974 ) ) ( not ( = ?auto_21973 ?auto_21999 ) ) ( not ( = ?auto_21974 ?auto_21999 ) ) ( IS-CRATE ?auto_21973 ) ( not ( = ?auto_22011 ?auto_21984 ) ) ( HOIST-AT ?auto_22001 ?auto_22011 ) ( AVAILABLE ?auto_22001 ) ( SURFACE-AT ?auto_21973 ?auto_22011 ) ( ON ?auto_21973 ?auto_22007 ) ( CLEAR ?auto_21973 ) ( not ( = ?auto_21972 ?auto_21973 ) ) ( not ( = ?auto_21972 ?auto_22007 ) ) ( not ( = ?auto_21973 ?auto_22007 ) ) ( not ( = ?auto_21981 ?auto_22001 ) ) ( IS-CRATE ?auto_21972 ) ( not ( = ?auto_21995 ?auto_21984 ) ) ( HOIST-AT ?auto_22004 ?auto_21995 ) ( AVAILABLE ?auto_22004 ) ( SURFACE-AT ?auto_21972 ?auto_21995 ) ( ON ?auto_21972 ?auto_21990 ) ( CLEAR ?auto_21972 ) ( not ( = ?auto_21971 ?auto_21972 ) ) ( not ( = ?auto_21971 ?auto_21990 ) ) ( not ( = ?auto_21972 ?auto_21990 ) ) ( not ( = ?auto_21981 ?auto_22004 ) ) ( IS-CRATE ?auto_21971 ) ( not ( = ?auto_21996 ?auto_21984 ) ) ( HOIST-AT ?auto_22000 ?auto_21996 ) ( AVAILABLE ?auto_22000 ) ( SURFACE-AT ?auto_21971 ?auto_21996 ) ( ON ?auto_21971 ?auto_22006 ) ( CLEAR ?auto_21971 ) ( not ( = ?auto_21970 ?auto_21971 ) ) ( not ( = ?auto_21970 ?auto_22006 ) ) ( not ( = ?auto_21971 ?auto_22006 ) ) ( not ( = ?auto_21981 ?auto_22000 ) ) ( IS-CRATE ?auto_21970 ) ( AVAILABLE ?auto_21980 ) ( SURFACE-AT ?auto_21970 ?auto_21983 ) ( ON ?auto_21970 ?auto_21986 ) ( CLEAR ?auto_21970 ) ( not ( = ?auto_21969 ?auto_21970 ) ) ( not ( = ?auto_21969 ?auto_21986 ) ) ( not ( = ?auto_21970 ?auto_21986 ) ) ( IS-CRATE ?auto_21969 ) ( not ( = ?auto_22002 ?auto_21984 ) ) ( HOIST-AT ?auto_22005 ?auto_22002 ) ( AVAILABLE ?auto_22005 ) ( SURFACE-AT ?auto_21969 ?auto_22002 ) ( ON ?auto_21969 ?auto_21992 ) ( CLEAR ?auto_21969 ) ( not ( = ?auto_21968 ?auto_21969 ) ) ( not ( = ?auto_21968 ?auto_21992 ) ) ( not ( = ?auto_21969 ?auto_21992 ) ) ( not ( = ?auto_21981 ?auto_22005 ) ) ( IS-CRATE ?auto_21968 ) ( AVAILABLE ?auto_21993 ) ( SURFACE-AT ?auto_21968 ?auto_22009 ) ( ON ?auto_21968 ?auto_21985 ) ( CLEAR ?auto_21968 ) ( not ( = ?auto_21967 ?auto_21968 ) ) ( not ( = ?auto_21967 ?auto_21985 ) ) ( not ( = ?auto_21968 ?auto_21985 ) ) ( IS-CRATE ?auto_21967 ) ( not ( = ?auto_21991 ?auto_21984 ) ) ( HOIST-AT ?auto_21997 ?auto_21991 ) ( AVAILABLE ?auto_21997 ) ( SURFACE-AT ?auto_21967 ?auto_21991 ) ( ON ?auto_21967 ?auto_21994 ) ( CLEAR ?auto_21967 ) ( not ( = ?auto_21966 ?auto_21967 ) ) ( not ( = ?auto_21966 ?auto_21994 ) ) ( not ( = ?auto_21967 ?auto_21994 ) ) ( not ( = ?auto_21981 ?auto_21997 ) ) ( SURFACE-AT ?auto_21965 ?auto_21984 ) ( CLEAR ?auto_21965 ) ( IS-CRATE ?auto_21966 ) ( AVAILABLE ?auto_21981 ) ( AVAILABLE ?auto_21988 ) ( SURFACE-AT ?auto_21966 ?auto_21998 ) ( ON ?auto_21966 ?auto_22010 ) ( CLEAR ?auto_21966 ) ( TRUCK-AT ?auto_21982 ?auto_21984 ) ( not ( = ?auto_21965 ?auto_21966 ) ) ( not ( = ?auto_21965 ?auto_22010 ) ) ( not ( = ?auto_21966 ?auto_22010 ) ) ( not ( = ?auto_21965 ?auto_21967 ) ) ( not ( = ?auto_21965 ?auto_21994 ) ) ( not ( = ?auto_21967 ?auto_22010 ) ) ( not ( = ?auto_21991 ?auto_21998 ) ) ( not ( = ?auto_21997 ?auto_21988 ) ) ( not ( = ?auto_21994 ?auto_22010 ) ) ( not ( = ?auto_21965 ?auto_21968 ) ) ( not ( = ?auto_21965 ?auto_21985 ) ) ( not ( = ?auto_21966 ?auto_21968 ) ) ( not ( = ?auto_21966 ?auto_21985 ) ) ( not ( = ?auto_21968 ?auto_21994 ) ) ( not ( = ?auto_21968 ?auto_22010 ) ) ( not ( = ?auto_22009 ?auto_21991 ) ) ( not ( = ?auto_22009 ?auto_21998 ) ) ( not ( = ?auto_21993 ?auto_21997 ) ) ( not ( = ?auto_21993 ?auto_21988 ) ) ( not ( = ?auto_21985 ?auto_21994 ) ) ( not ( = ?auto_21985 ?auto_22010 ) ) ( not ( = ?auto_21965 ?auto_21969 ) ) ( not ( = ?auto_21965 ?auto_21992 ) ) ( not ( = ?auto_21966 ?auto_21969 ) ) ( not ( = ?auto_21966 ?auto_21992 ) ) ( not ( = ?auto_21967 ?auto_21969 ) ) ( not ( = ?auto_21967 ?auto_21992 ) ) ( not ( = ?auto_21969 ?auto_21985 ) ) ( not ( = ?auto_21969 ?auto_21994 ) ) ( not ( = ?auto_21969 ?auto_22010 ) ) ( not ( = ?auto_22002 ?auto_22009 ) ) ( not ( = ?auto_22002 ?auto_21991 ) ) ( not ( = ?auto_22002 ?auto_21998 ) ) ( not ( = ?auto_22005 ?auto_21993 ) ) ( not ( = ?auto_22005 ?auto_21997 ) ) ( not ( = ?auto_22005 ?auto_21988 ) ) ( not ( = ?auto_21992 ?auto_21985 ) ) ( not ( = ?auto_21992 ?auto_21994 ) ) ( not ( = ?auto_21992 ?auto_22010 ) ) ( not ( = ?auto_21965 ?auto_21970 ) ) ( not ( = ?auto_21965 ?auto_21986 ) ) ( not ( = ?auto_21966 ?auto_21970 ) ) ( not ( = ?auto_21966 ?auto_21986 ) ) ( not ( = ?auto_21967 ?auto_21970 ) ) ( not ( = ?auto_21967 ?auto_21986 ) ) ( not ( = ?auto_21968 ?auto_21970 ) ) ( not ( = ?auto_21968 ?auto_21986 ) ) ( not ( = ?auto_21970 ?auto_21992 ) ) ( not ( = ?auto_21970 ?auto_21985 ) ) ( not ( = ?auto_21970 ?auto_21994 ) ) ( not ( = ?auto_21970 ?auto_22010 ) ) ( not ( = ?auto_21983 ?auto_22002 ) ) ( not ( = ?auto_21983 ?auto_22009 ) ) ( not ( = ?auto_21983 ?auto_21991 ) ) ( not ( = ?auto_21983 ?auto_21998 ) ) ( not ( = ?auto_21980 ?auto_22005 ) ) ( not ( = ?auto_21980 ?auto_21993 ) ) ( not ( = ?auto_21980 ?auto_21997 ) ) ( not ( = ?auto_21980 ?auto_21988 ) ) ( not ( = ?auto_21986 ?auto_21992 ) ) ( not ( = ?auto_21986 ?auto_21985 ) ) ( not ( = ?auto_21986 ?auto_21994 ) ) ( not ( = ?auto_21986 ?auto_22010 ) ) ( not ( = ?auto_21965 ?auto_21971 ) ) ( not ( = ?auto_21965 ?auto_22006 ) ) ( not ( = ?auto_21966 ?auto_21971 ) ) ( not ( = ?auto_21966 ?auto_22006 ) ) ( not ( = ?auto_21967 ?auto_21971 ) ) ( not ( = ?auto_21967 ?auto_22006 ) ) ( not ( = ?auto_21968 ?auto_21971 ) ) ( not ( = ?auto_21968 ?auto_22006 ) ) ( not ( = ?auto_21969 ?auto_21971 ) ) ( not ( = ?auto_21969 ?auto_22006 ) ) ( not ( = ?auto_21971 ?auto_21986 ) ) ( not ( = ?auto_21971 ?auto_21992 ) ) ( not ( = ?auto_21971 ?auto_21985 ) ) ( not ( = ?auto_21971 ?auto_21994 ) ) ( not ( = ?auto_21971 ?auto_22010 ) ) ( not ( = ?auto_21996 ?auto_21983 ) ) ( not ( = ?auto_21996 ?auto_22002 ) ) ( not ( = ?auto_21996 ?auto_22009 ) ) ( not ( = ?auto_21996 ?auto_21991 ) ) ( not ( = ?auto_21996 ?auto_21998 ) ) ( not ( = ?auto_22000 ?auto_21980 ) ) ( not ( = ?auto_22000 ?auto_22005 ) ) ( not ( = ?auto_22000 ?auto_21993 ) ) ( not ( = ?auto_22000 ?auto_21997 ) ) ( not ( = ?auto_22000 ?auto_21988 ) ) ( not ( = ?auto_22006 ?auto_21986 ) ) ( not ( = ?auto_22006 ?auto_21992 ) ) ( not ( = ?auto_22006 ?auto_21985 ) ) ( not ( = ?auto_22006 ?auto_21994 ) ) ( not ( = ?auto_22006 ?auto_22010 ) ) ( not ( = ?auto_21965 ?auto_21972 ) ) ( not ( = ?auto_21965 ?auto_21990 ) ) ( not ( = ?auto_21966 ?auto_21972 ) ) ( not ( = ?auto_21966 ?auto_21990 ) ) ( not ( = ?auto_21967 ?auto_21972 ) ) ( not ( = ?auto_21967 ?auto_21990 ) ) ( not ( = ?auto_21968 ?auto_21972 ) ) ( not ( = ?auto_21968 ?auto_21990 ) ) ( not ( = ?auto_21969 ?auto_21972 ) ) ( not ( = ?auto_21969 ?auto_21990 ) ) ( not ( = ?auto_21970 ?auto_21972 ) ) ( not ( = ?auto_21970 ?auto_21990 ) ) ( not ( = ?auto_21972 ?auto_22006 ) ) ( not ( = ?auto_21972 ?auto_21986 ) ) ( not ( = ?auto_21972 ?auto_21992 ) ) ( not ( = ?auto_21972 ?auto_21985 ) ) ( not ( = ?auto_21972 ?auto_21994 ) ) ( not ( = ?auto_21972 ?auto_22010 ) ) ( not ( = ?auto_21995 ?auto_21996 ) ) ( not ( = ?auto_21995 ?auto_21983 ) ) ( not ( = ?auto_21995 ?auto_22002 ) ) ( not ( = ?auto_21995 ?auto_22009 ) ) ( not ( = ?auto_21995 ?auto_21991 ) ) ( not ( = ?auto_21995 ?auto_21998 ) ) ( not ( = ?auto_22004 ?auto_22000 ) ) ( not ( = ?auto_22004 ?auto_21980 ) ) ( not ( = ?auto_22004 ?auto_22005 ) ) ( not ( = ?auto_22004 ?auto_21993 ) ) ( not ( = ?auto_22004 ?auto_21997 ) ) ( not ( = ?auto_22004 ?auto_21988 ) ) ( not ( = ?auto_21990 ?auto_22006 ) ) ( not ( = ?auto_21990 ?auto_21986 ) ) ( not ( = ?auto_21990 ?auto_21992 ) ) ( not ( = ?auto_21990 ?auto_21985 ) ) ( not ( = ?auto_21990 ?auto_21994 ) ) ( not ( = ?auto_21990 ?auto_22010 ) ) ( not ( = ?auto_21965 ?auto_21973 ) ) ( not ( = ?auto_21965 ?auto_22007 ) ) ( not ( = ?auto_21966 ?auto_21973 ) ) ( not ( = ?auto_21966 ?auto_22007 ) ) ( not ( = ?auto_21967 ?auto_21973 ) ) ( not ( = ?auto_21967 ?auto_22007 ) ) ( not ( = ?auto_21968 ?auto_21973 ) ) ( not ( = ?auto_21968 ?auto_22007 ) ) ( not ( = ?auto_21969 ?auto_21973 ) ) ( not ( = ?auto_21969 ?auto_22007 ) ) ( not ( = ?auto_21970 ?auto_21973 ) ) ( not ( = ?auto_21970 ?auto_22007 ) ) ( not ( = ?auto_21971 ?auto_21973 ) ) ( not ( = ?auto_21971 ?auto_22007 ) ) ( not ( = ?auto_21973 ?auto_21990 ) ) ( not ( = ?auto_21973 ?auto_22006 ) ) ( not ( = ?auto_21973 ?auto_21986 ) ) ( not ( = ?auto_21973 ?auto_21992 ) ) ( not ( = ?auto_21973 ?auto_21985 ) ) ( not ( = ?auto_21973 ?auto_21994 ) ) ( not ( = ?auto_21973 ?auto_22010 ) ) ( not ( = ?auto_22011 ?auto_21995 ) ) ( not ( = ?auto_22011 ?auto_21996 ) ) ( not ( = ?auto_22011 ?auto_21983 ) ) ( not ( = ?auto_22011 ?auto_22002 ) ) ( not ( = ?auto_22011 ?auto_22009 ) ) ( not ( = ?auto_22011 ?auto_21991 ) ) ( not ( = ?auto_22011 ?auto_21998 ) ) ( not ( = ?auto_22001 ?auto_22004 ) ) ( not ( = ?auto_22001 ?auto_22000 ) ) ( not ( = ?auto_22001 ?auto_21980 ) ) ( not ( = ?auto_22001 ?auto_22005 ) ) ( not ( = ?auto_22001 ?auto_21993 ) ) ( not ( = ?auto_22001 ?auto_21997 ) ) ( not ( = ?auto_22001 ?auto_21988 ) ) ( not ( = ?auto_22007 ?auto_21990 ) ) ( not ( = ?auto_22007 ?auto_22006 ) ) ( not ( = ?auto_22007 ?auto_21986 ) ) ( not ( = ?auto_22007 ?auto_21992 ) ) ( not ( = ?auto_22007 ?auto_21985 ) ) ( not ( = ?auto_22007 ?auto_21994 ) ) ( not ( = ?auto_22007 ?auto_22010 ) ) ( not ( = ?auto_21965 ?auto_21974 ) ) ( not ( = ?auto_21965 ?auto_21999 ) ) ( not ( = ?auto_21966 ?auto_21974 ) ) ( not ( = ?auto_21966 ?auto_21999 ) ) ( not ( = ?auto_21967 ?auto_21974 ) ) ( not ( = ?auto_21967 ?auto_21999 ) ) ( not ( = ?auto_21968 ?auto_21974 ) ) ( not ( = ?auto_21968 ?auto_21999 ) ) ( not ( = ?auto_21969 ?auto_21974 ) ) ( not ( = ?auto_21969 ?auto_21999 ) ) ( not ( = ?auto_21970 ?auto_21974 ) ) ( not ( = ?auto_21970 ?auto_21999 ) ) ( not ( = ?auto_21971 ?auto_21974 ) ) ( not ( = ?auto_21971 ?auto_21999 ) ) ( not ( = ?auto_21972 ?auto_21974 ) ) ( not ( = ?auto_21972 ?auto_21999 ) ) ( not ( = ?auto_21974 ?auto_22007 ) ) ( not ( = ?auto_21974 ?auto_21990 ) ) ( not ( = ?auto_21974 ?auto_22006 ) ) ( not ( = ?auto_21974 ?auto_21986 ) ) ( not ( = ?auto_21974 ?auto_21992 ) ) ( not ( = ?auto_21974 ?auto_21985 ) ) ( not ( = ?auto_21974 ?auto_21994 ) ) ( not ( = ?auto_21974 ?auto_22010 ) ) ( not ( = ?auto_21999 ?auto_22007 ) ) ( not ( = ?auto_21999 ?auto_21990 ) ) ( not ( = ?auto_21999 ?auto_22006 ) ) ( not ( = ?auto_21999 ?auto_21986 ) ) ( not ( = ?auto_21999 ?auto_21992 ) ) ( not ( = ?auto_21999 ?auto_21985 ) ) ( not ( = ?auto_21999 ?auto_21994 ) ) ( not ( = ?auto_21999 ?auto_22010 ) ) ( not ( = ?auto_21965 ?auto_21975 ) ) ( not ( = ?auto_21965 ?auto_22008 ) ) ( not ( = ?auto_21966 ?auto_21975 ) ) ( not ( = ?auto_21966 ?auto_22008 ) ) ( not ( = ?auto_21967 ?auto_21975 ) ) ( not ( = ?auto_21967 ?auto_22008 ) ) ( not ( = ?auto_21968 ?auto_21975 ) ) ( not ( = ?auto_21968 ?auto_22008 ) ) ( not ( = ?auto_21969 ?auto_21975 ) ) ( not ( = ?auto_21969 ?auto_22008 ) ) ( not ( = ?auto_21970 ?auto_21975 ) ) ( not ( = ?auto_21970 ?auto_22008 ) ) ( not ( = ?auto_21971 ?auto_21975 ) ) ( not ( = ?auto_21971 ?auto_22008 ) ) ( not ( = ?auto_21972 ?auto_21975 ) ) ( not ( = ?auto_21972 ?auto_22008 ) ) ( not ( = ?auto_21973 ?auto_21975 ) ) ( not ( = ?auto_21973 ?auto_22008 ) ) ( not ( = ?auto_21975 ?auto_21999 ) ) ( not ( = ?auto_21975 ?auto_22007 ) ) ( not ( = ?auto_21975 ?auto_21990 ) ) ( not ( = ?auto_21975 ?auto_22006 ) ) ( not ( = ?auto_21975 ?auto_21986 ) ) ( not ( = ?auto_21975 ?auto_21992 ) ) ( not ( = ?auto_21975 ?auto_21985 ) ) ( not ( = ?auto_21975 ?auto_21994 ) ) ( not ( = ?auto_21975 ?auto_22010 ) ) ( not ( = ?auto_22012 ?auto_22009 ) ) ( not ( = ?auto_22012 ?auto_22011 ) ) ( not ( = ?auto_22012 ?auto_21995 ) ) ( not ( = ?auto_22012 ?auto_21996 ) ) ( not ( = ?auto_22012 ?auto_21983 ) ) ( not ( = ?auto_22012 ?auto_22002 ) ) ( not ( = ?auto_22012 ?auto_21991 ) ) ( not ( = ?auto_22012 ?auto_21998 ) ) ( not ( = ?auto_22003 ?auto_21993 ) ) ( not ( = ?auto_22003 ?auto_22001 ) ) ( not ( = ?auto_22003 ?auto_22004 ) ) ( not ( = ?auto_22003 ?auto_22000 ) ) ( not ( = ?auto_22003 ?auto_21980 ) ) ( not ( = ?auto_22003 ?auto_22005 ) ) ( not ( = ?auto_22003 ?auto_21997 ) ) ( not ( = ?auto_22003 ?auto_21988 ) ) ( not ( = ?auto_22008 ?auto_21999 ) ) ( not ( = ?auto_22008 ?auto_22007 ) ) ( not ( = ?auto_22008 ?auto_21990 ) ) ( not ( = ?auto_22008 ?auto_22006 ) ) ( not ( = ?auto_22008 ?auto_21986 ) ) ( not ( = ?auto_22008 ?auto_21992 ) ) ( not ( = ?auto_22008 ?auto_21985 ) ) ( not ( = ?auto_22008 ?auto_21994 ) ) ( not ( = ?auto_22008 ?auto_22010 ) ) ( not ( = ?auto_21965 ?auto_21976 ) ) ( not ( = ?auto_21965 ?auto_21989 ) ) ( not ( = ?auto_21966 ?auto_21976 ) ) ( not ( = ?auto_21966 ?auto_21989 ) ) ( not ( = ?auto_21967 ?auto_21976 ) ) ( not ( = ?auto_21967 ?auto_21989 ) ) ( not ( = ?auto_21968 ?auto_21976 ) ) ( not ( = ?auto_21968 ?auto_21989 ) ) ( not ( = ?auto_21969 ?auto_21976 ) ) ( not ( = ?auto_21969 ?auto_21989 ) ) ( not ( = ?auto_21970 ?auto_21976 ) ) ( not ( = ?auto_21970 ?auto_21989 ) ) ( not ( = ?auto_21971 ?auto_21976 ) ) ( not ( = ?auto_21971 ?auto_21989 ) ) ( not ( = ?auto_21972 ?auto_21976 ) ) ( not ( = ?auto_21972 ?auto_21989 ) ) ( not ( = ?auto_21973 ?auto_21976 ) ) ( not ( = ?auto_21973 ?auto_21989 ) ) ( not ( = ?auto_21974 ?auto_21976 ) ) ( not ( = ?auto_21974 ?auto_21989 ) ) ( not ( = ?auto_21976 ?auto_22008 ) ) ( not ( = ?auto_21976 ?auto_21999 ) ) ( not ( = ?auto_21976 ?auto_22007 ) ) ( not ( = ?auto_21976 ?auto_21990 ) ) ( not ( = ?auto_21976 ?auto_22006 ) ) ( not ( = ?auto_21976 ?auto_21986 ) ) ( not ( = ?auto_21976 ?auto_21992 ) ) ( not ( = ?auto_21976 ?auto_21985 ) ) ( not ( = ?auto_21976 ?auto_21994 ) ) ( not ( = ?auto_21976 ?auto_22010 ) ) ( not ( = ?auto_21989 ?auto_22008 ) ) ( not ( = ?auto_21989 ?auto_21999 ) ) ( not ( = ?auto_21989 ?auto_22007 ) ) ( not ( = ?auto_21989 ?auto_21990 ) ) ( not ( = ?auto_21989 ?auto_22006 ) ) ( not ( = ?auto_21989 ?auto_21986 ) ) ( not ( = ?auto_21989 ?auto_21992 ) ) ( not ( = ?auto_21989 ?auto_21985 ) ) ( not ( = ?auto_21989 ?auto_21994 ) ) ( not ( = ?auto_21989 ?auto_22010 ) ) ( not ( = ?auto_21965 ?auto_21977 ) ) ( not ( = ?auto_21965 ?auto_21987 ) ) ( not ( = ?auto_21966 ?auto_21977 ) ) ( not ( = ?auto_21966 ?auto_21987 ) ) ( not ( = ?auto_21967 ?auto_21977 ) ) ( not ( = ?auto_21967 ?auto_21987 ) ) ( not ( = ?auto_21968 ?auto_21977 ) ) ( not ( = ?auto_21968 ?auto_21987 ) ) ( not ( = ?auto_21969 ?auto_21977 ) ) ( not ( = ?auto_21969 ?auto_21987 ) ) ( not ( = ?auto_21970 ?auto_21977 ) ) ( not ( = ?auto_21970 ?auto_21987 ) ) ( not ( = ?auto_21971 ?auto_21977 ) ) ( not ( = ?auto_21971 ?auto_21987 ) ) ( not ( = ?auto_21972 ?auto_21977 ) ) ( not ( = ?auto_21972 ?auto_21987 ) ) ( not ( = ?auto_21973 ?auto_21977 ) ) ( not ( = ?auto_21973 ?auto_21987 ) ) ( not ( = ?auto_21974 ?auto_21977 ) ) ( not ( = ?auto_21974 ?auto_21987 ) ) ( not ( = ?auto_21975 ?auto_21977 ) ) ( not ( = ?auto_21975 ?auto_21987 ) ) ( not ( = ?auto_21977 ?auto_21989 ) ) ( not ( = ?auto_21977 ?auto_22008 ) ) ( not ( = ?auto_21977 ?auto_21999 ) ) ( not ( = ?auto_21977 ?auto_22007 ) ) ( not ( = ?auto_21977 ?auto_21990 ) ) ( not ( = ?auto_21977 ?auto_22006 ) ) ( not ( = ?auto_21977 ?auto_21986 ) ) ( not ( = ?auto_21977 ?auto_21992 ) ) ( not ( = ?auto_21977 ?auto_21985 ) ) ( not ( = ?auto_21977 ?auto_21994 ) ) ( not ( = ?auto_21977 ?auto_22010 ) ) ( not ( = ?auto_21987 ?auto_21989 ) ) ( not ( = ?auto_21987 ?auto_22008 ) ) ( not ( = ?auto_21987 ?auto_21999 ) ) ( not ( = ?auto_21987 ?auto_22007 ) ) ( not ( = ?auto_21987 ?auto_21990 ) ) ( not ( = ?auto_21987 ?auto_22006 ) ) ( not ( = ?auto_21987 ?auto_21986 ) ) ( not ( = ?auto_21987 ?auto_21992 ) ) ( not ( = ?auto_21987 ?auto_21985 ) ) ( not ( = ?auto_21987 ?auto_21994 ) ) ( not ( = ?auto_21987 ?auto_22010 ) ) ( not ( = ?auto_21965 ?auto_21978 ) ) ( not ( = ?auto_21965 ?auto_21979 ) ) ( not ( = ?auto_21966 ?auto_21978 ) ) ( not ( = ?auto_21966 ?auto_21979 ) ) ( not ( = ?auto_21967 ?auto_21978 ) ) ( not ( = ?auto_21967 ?auto_21979 ) ) ( not ( = ?auto_21968 ?auto_21978 ) ) ( not ( = ?auto_21968 ?auto_21979 ) ) ( not ( = ?auto_21969 ?auto_21978 ) ) ( not ( = ?auto_21969 ?auto_21979 ) ) ( not ( = ?auto_21970 ?auto_21978 ) ) ( not ( = ?auto_21970 ?auto_21979 ) ) ( not ( = ?auto_21971 ?auto_21978 ) ) ( not ( = ?auto_21971 ?auto_21979 ) ) ( not ( = ?auto_21972 ?auto_21978 ) ) ( not ( = ?auto_21972 ?auto_21979 ) ) ( not ( = ?auto_21973 ?auto_21978 ) ) ( not ( = ?auto_21973 ?auto_21979 ) ) ( not ( = ?auto_21974 ?auto_21978 ) ) ( not ( = ?auto_21974 ?auto_21979 ) ) ( not ( = ?auto_21975 ?auto_21978 ) ) ( not ( = ?auto_21975 ?auto_21979 ) ) ( not ( = ?auto_21976 ?auto_21978 ) ) ( not ( = ?auto_21976 ?auto_21979 ) ) ( not ( = ?auto_21978 ?auto_21987 ) ) ( not ( = ?auto_21978 ?auto_21989 ) ) ( not ( = ?auto_21978 ?auto_22008 ) ) ( not ( = ?auto_21978 ?auto_21999 ) ) ( not ( = ?auto_21978 ?auto_22007 ) ) ( not ( = ?auto_21978 ?auto_21990 ) ) ( not ( = ?auto_21978 ?auto_22006 ) ) ( not ( = ?auto_21978 ?auto_21986 ) ) ( not ( = ?auto_21978 ?auto_21992 ) ) ( not ( = ?auto_21978 ?auto_21985 ) ) ( not ( = ?auto_21978 ?auto_21994 ) ) ( not ( = ?auto_21978 ?auto_22010 ) ) ( not ( = ?auto_21979 ?auto_21987 ) ) ( not ( = ?auto_21979 ?auto_21989 ) ) ( not ( = ?auto_21979 ?auto_22008 ) ) ( not ( = ?auto_21979 ?auto_21999 ) ) ( not ( = ?auto_21979 ?auto_22007 ) ) ( not ( = ?auto_21979 ?auto_21990 ) ) ( not ( = ?auto_21979 ?auto_22006 ) ) ( not ( = ?auto_21979 ?auto_21986 ) ) ( not ( = ?auto_21979 ?auto_21992 ) ) ( not ( = ?auto_21979 ?auto_21985 ) ) ( not ( = ?auto_21979 ?auto_21994 ) ) ( not ( = ?auto_21979 ?auto_22010 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_21965 ?auto_21966 ?auto_21967 ?auto_21968 ?auto_21969 ?auto_21970 ?auto_21971 ?auto_21972 ?auto_21973 ?auto_21974 ?auto_21975 ?auto_21976 ?auto_21977 )
      ( MAKE-1CRATE ?auto_21977 ?auto_21978 )
      ( MAKE-13CRATE-VERIFY ?auto_21965 ?auto_21966 ?auto_21967 ?auto_21968 ?auto_21969 ?auto_21970 ?auto_21971 ?auto_21972 ?auto_21973 ?auto_21974 ?auto_21975 ?auto_21976 ?auto_21977 ?auto_21978 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_22038 - SURFACE
      ?auto_22039 - SURFACE
      ?auto_22040 - SURFACE
      ?auto_22041 - SURFACE
      ?auto_22042 - SURFACE
      ?auto_22043 - SURFACE
      ?auto_22044 - SURFACE
      ?auto_22045 - SURFACE
      ?auto_22046 - SURFACE
      ?auto_22047 - SURFACE
      ?auto_22048 - SURFACE
      ?auto_22049 - SURFACE
      ?auto_22050 - SURFACE
      ?auto_22052 - SURFACE
      ?auto_22051 - SURFACE
    )
    :vars
    (
      ?auto_22058 - HOIST
      ?auto_22057 - PLACE
      ?auto_22056 - PLACE
      ?auto_22055 - HOIST
      ?auto_22053 - SURFACE
      ?auto_22070 - PLACE
      ?auto_22069 - HOIST
      ?auto_22062 - SURFACE
      ?auto_22065 - PLACE
      ?auto_22087 - HOIST
      ?auto_22061 - SURFACE
      ?auto_22072 - PLACE
      ?auto_22064 - HOIST
      ?auto_22085 - SURFACE
      ?auto_22073 - PLACE
      ?auto_22059 - HOIST
      ?auto_22083 - SURFACE
      ?auto_22060 - SURFACE
      ?auto_22081 - PLACE
      ?auto_22066 - HOIST
      ?auto_22068 - SURFACE
      ?auto_22074 - PLACE
      ?auto_22082 - HOIST
      ?auto_22080 - SURFACE
      ?auto_22076 - PLACE
      ?auto_22071 - HOIST
      ?auto_22077 - SURFACE
      ?auto_22086 - SURFACE
      ?auto_22079 - SURFACE
      ?auto_22067 - SURFACE
      ?auto_22063 - PLACE
      ?auto_22078 - HOIST
      ?auto_22084 - SURFACE
      ?auto_22075 - SURFACE
      ?auto_22054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22058 ?auto_22057 ) ( IS-CRATE ?auto_22051 ) ( not ( = ?auto_22056 ?auto_22057 ) ) ( HOIST-AT ?auto_22055 ?auto_22056 ) ( SURFACE-AT ?auto_22051 ?auto_22056 ) ( ON ?auto_22051 ?auto_22053 ) ( CLEAR ?auto_22051 ) ( not ( = ?auto_22052 ?auto_22051 ) ) ( not ( = ?auto_22052 ?auto_22053 ) ) ( not ( = ?auto_22051 ?auto_22053 ) ) ( not ( = ?auto_22058 ?auto_22055 ) ) ( IS-CRATE ?auto_22052 ) ( not ( = ?auto_22070 ?auto_22057 ) ) ( HOIST-AT ?auto_22069 ?auto_22070 ) ( SURFACE-AT ?auto_22052 ?auto_22070 ) ( ON ?auto_22052 ?auto_22062 ) ( CLEAR ?auto_22052 ) ( not ( = ?auto_22050 ?auto_22052 ) ) ( not ( = ?auto_22050 ?auto_22062 ) ) ( not ( = ?auto_22052 ?auto_22062 ) ) ( not ( = ?auto_22058 ?auto_22069 ) ) ( IS-CRATE ?auto_22050 ) ( not ( = ?auto_22065 ?auto_22057 ) ) ( HOIST-AT ?auto_22087 ?auto_22065 ) ( SURFACE-AT ?auto_22050 ?auto_22065 ) ( ON ?auto_22050 ?auto_22061 ) ( CLEAR ?auto_22050 ) ( not ( = ?auto_22049 ?auto_22050 ) ) ( not ( = ?auto_22049 ?auto_22061 ) ) ( not ( = ?auto_22050 ?auto_22061 ) ) ( not ( = ?auto_22058 ?auto_22087 ) ) ( IS-CRATE ?auto_22049 ) ( not ( = ?auto_22072 ?auto_22057 ) ) ( HOIST-AT ?auto_22064 ?auto_22072 ) ( SURFACE-AT ?auto_22049 ?auto_22072 ) ( ON ?auto_22049 ?auto_22085 ) ( CLEAR ?auto_22049 ) ( not ( = ?auto_22048 ?auto_22049 ) ) ( not ( = ?auto_22048 ?auto_22085 ) ) ( not ( = ?auto_22049 ?auto_22085 ) ) ( not ( = ?auto_22058 ?auto_22064 ) ) ( IS-CRATE ?auto_22048 ) ( not ( = ?auto_22073 ?auto_22057 ) ) ( HOIST-AT ?auto_22059 ?auto_22073 ) ( AVAILABLE ?auto_22059 ) ( SURFACE-AT ?auto_22048 ?auto_22073 ) ( ON ?auto_22048 ?auto_22083 ) ( CLEAR ?auto_22048 ) ( not ( = ?auto_22047 ?auto_22048 ) ) ( not ( = ?auto_22047 ?auto_22083 ) ) ( not ( = ?auto_22048 ?auto_22083 ) ) ( not ( = ?auto_22058 ?auto_22059 ) ) ( IS-CRATE ?auto_22047 ) ( SURFACE-AT ?auto_22047 ?auto_22072 ) ( ON ?auto_22047 ?auto_22060 ) ( CLEAR ?auto_22047 ) ( not ( = ?auto_22046 ?auto_22047 ) ) ( not ( = ?auto_22046 ?auto_22060 ) ) ( not ( = ?auto_22047 ?auto_22060 ) ) ( IS-CRATE ?auto_22046 ) ( not ( = ?auto_22081 ?auto_22057 ) ) ( HOIST-AT ?auto_22066 ?auto_22081 ) ( AVAILABLE ?auto_22066 ) ( SURFACE-AT ?auto_22046 ?auto_22081 ) ( ON ?auto_22046 ?auto_22068 ) ( CLEAR ?auto_22046 ) ( not ( = ?auto_22045 ?auto_22046 ) ) ( not ( = ?auto_22045 ?auto_22068 ) ) ( not ( = ?auto_22046 ?auto_22068 ) ) ( not ( = ?auto_22058 ?auto_22066 ) ) ( IS-CRATE ?auto_22045 ) ( not ( = ?auto_22074 ?auto_22057 ) ) ( HOIST-AT ?auto_22082 ?auto_22074 ) ( AVAILABLE ?auto_22082 ) ( SURFACE-AT ?auto_22045 ?auto_22074 ) ( ON ?auto_22045 ?auto_22080 ) ( CLEAR ?auto_22045 ) ( not ( = ?auto_22044 ?auto_22045 ) ) ( not ( = ?auto_22044 ?auto_22080 ) ) ( not ( = ?auto_22045 ?auto_22080 ) ) ( not ( = ?auto_22058 ?auto_22082 ) ) ( IS-CRATE ?auto_22044 ) ( not ( = ?auto_22076 ?auto_22057 ) ) ( HOIST-AT ?auto_22071 ?auto_22076 ) ( AVAILABLE ?auto_22071 ) ( SURFACE-AT ?auto_22044 ?auto_22076 ) ( ON ?auto_22044 ?auto_22077 ) ( CLEAR ?auto_22044 ) ( not ( = ?auto_22043 ?auto_22044 ) ) ( not ( = ?auto_22043 ?auto_22077 ) ) ( not ( = ?auto_22044 ?auto_22077 ) ) ( not ( = ?auto_22058 ?auto_22071 ) ) ( IS-CRATE ?auto_22043 ) ( AVAILABLE ?auto_22069 ) ( SURFACE-AT ?auto_22043 ?auto_22070 ) ( ON ?auto_22043 ?auto_22086 ) ( CLEAR ?auto_22043 ) ( not ( = ?auto_22042 ?auto_22043 ) ) ( not ( = ?auto_22042 ?auto_22086 ) ) ( not ( = ?auto_22043 ?auto_22086 ) ) ( IS-CRATE ?auto_22042 ) ( AVAILABLE ?auto_22055 ) ( SURFACE-AT ?auto_22042 ?auto_22056 ) ( ON ?auto_22042 ?auto_22079 ) ( CLEAR ?auto_22042 ) ( not ( = ?auto_22041 ?auto_22042 ) ) ( not ( = ?auto_22041 ?auto_22079 ) ) ( not ( = ?auto_22042 ?auto_22079 ) ) ( IS-CRATE ?auto_22041 ) ( AVAILABLE ?auto_22064 ) ( SURFACE-AT ?auto_22041 ?auto_22072 ) ( ON ?auto_22041 ?auto_22067 ) ( CLEAR ?auto_22041 ) ( not ( = ?auto_22040 ?auto_22041 ) ) ( not ( = ?auto_22040 ?auto_22067 ) ) ( not ( = ?auto_22041 ?auto_22067 ) ) ( IS-CRATE ?auto_22040 ) ( not ( = ?auto_22063 ?auto_22057 ) ) ( HOIST-AT ?auto_22078 ?auto_22063 ) ( AVAILABLE ?auto_22078 ) ( SURFACE-AT ?auto_22040 ?auto_22063 ) ( ON ?auto_22040 ?auto_22084 ) ( CLEAR ?auto_22040 ) ( not ( = ?auto_22039 ?auto_22040 ) ) ( not ( = ?auto_22039 ?auto_22084 ) ) ( not ( = ?auto_22040 ?auto_22084 ) ) ( not ( = ?auto_22058 ?auto_22078 ) ) ( SURFACE-AT ?auto_22038 ?auto_22057 ) ( CLEAR ?auto_22038 ) ( IS-CRATE ?auto_22039 ) ( AVAILABLE ?auto_22058 ) ( AVAILABLE ?auto_22087 ) ( SURFACE-AT ?auto_22039 ?auto_22065 ) ( ON ?auto_22039 ?auto_22075 ) ( CLEAR ?auto_22039 ) ( TRUCK-AT ?auto_22054 ?auto_22057 ) ( not ( = ?auto_22038 ?auto_22039 ) ) ( not ( = ?auto_22038 ?auto_22075 ) ) ( not ( = ?auto_22039 ?auto_22075 ) ) ( not ( = ?auto_22038 ?auto_22040 ) ) ( not ( = ?auto_22038 ?auto_22084 ) ) ( not ( = ?auto_22040 ?auto_22075 ) ) ( not ( = ?auto_22063 ?auto_22065 ) ) ( not ( = ?auto_22078 ?auto_22087 ) ) ( not ( = ?auto_22084 ?auto_22075 ) ) ( not ( = ?auto_22038 ?auto_22041 ) ) ( not ( = ?auto_22038 ?auto_22067 ) ) ( not ( = ?auto_22039 ?auto_22041 ) ) ( not ( = ?auto_22039 ?auto_22067 ) ) ( not ( = ?auto_22041 ?auto_22084 ) ) ( not ( = ?auto_22041 ?auto_22075 ) ) ( not ( = ?auto_22072 ?auto_22063 ) ) ( not ( = ?auto_22072 ?auto_22065 ) ) ( not ( = ?auto_22064 ?auto_22078 ) ) ( not ( = ?auto_22064 ?auto_22087 ) ) ( not ( = ?auto_22067 ?auto_22084 ) ) ( not ( = ?auto_22067 ?auto_22075 ) ) ( not ( = ?auto_22038 ?auto_22042 ) ) ( not ( = ?auto_22038 ?auto_22079 ) ) ( not ( = ?auto_22039 ?auto_22042 ) ) ( not ( = ?auto_22039 ?auto_22079 ) ) ( not ( = ?auto_22040 ?auto_22042 ) ) ( not ( = ?auto_22040 ?auto_22079 ) ) ( not ( = ?auto_22042 ?auto_22067 ) ) ( not ( = ?auto_22042 ?auto_22084 ) ) ( not ( = ?auto_22042 ?auto_22075 ) ) ( not ( = ?auto_22056 ?auto_22072 ) ) ( not ( = ?auto_22056 ?auto_22063 ) ) ( not ( = ?auto_22056 ?auto_22065 ) ) ( not ( = ?auto_22055 ?auto_22064 ) ) ( not ( = ?auto_22055 ?auto_22078 ) ) ( not ( = ?auto_22055 ?auto_22087 ) ) ( not ( = ?auto_22079 ?auto_22067 ) ) ( not ( = ?auto_22079 ?auto_22084 ) ) ( not ( = ?auto_22079 ?auto_22075 ) ) ( not ( = ?auto_22038 ?auto_22043 ) ) ( not ( = ?auto_22038 ?auto_22086 ) ) ( not ( = ?auto_22039 ?auto_22043 ) ) ( not ( = ?auto_22039 ?auto_22086 ) ) ( not ( = ?auto_22040 ?auto_22043 ) ) ( not ( = ?auto_22040 ?auto_22086 ) ) ( not ( = ?auto_22041 ?auto_22043 ) ) ( not ( = ?auto_22041 ?auto_22086 ) ) ( not ( = ?auto_22043 ?auto_22079 ) ) ( not ( = ?auto_22043 ?auto_22067 ) ) ( not ( = ?auto_22043 ?auto_22084 ) ) ( not ( = ?auto_22043 ?auto_22075 ) ) ( not ( = ?auto_22070 ?auto_22056 ) ) ( not ( = ?auto_22070 ?auto_22072 ) ) ( not ( = ?auto_22070 ?auto_22063 ) ) ( not ( = ?auto_22070 ?auto_22065 ) ) ( not ( = ?auto_22069 ?auto_22055 ) ) ( not ( = ?auto_22069 ?auto_22064 ) ) ( not ( = ?auto_22069 ?auto_22078 ) ) ( not ( = ?auto_22069 ?auto_22087 ) ) ( not ( = ?auto_22086 ?auto_22079 ) ) ( not ( = ?auto_22086 ?auto_22067 ) ) ( not ( = ?auto_22086 ?auto_22084 ) ) ( not ( = ?auto_22086 ?auto_22075 ) ) ( not ( = ?auto_22038 ?auto_22044 ) ) ( not ( = ?auto_22038 ?auto_22077 ) ) ( not ( = ?auto_22039 ?auto_22044 ) ) ( not ( = ?auto_22039 ?auto_22077 ) ) ( not ( = ?auto_22040 ?auto_22044 ) ) ( not ( = ?auto_22040 ?auto_22077 ) ) ( not ( = ?auto_22041 ?auto_22044 ) ) ( not ( = ?auto_22041 ?auto_22077 ) ) ( not ( = ?auto_22042 ?auto_22044 ) ) ( not ( = ?auto_22042 ?auto_22077 ) ) ( not ( = ?auto_22044 ?auto_22086 ) ) ( not ( = ?auto_22044 ?auto_22079 ) ) ( not ( = ?auto_22044 ?auto_22067 ) ) ( not ( = ?auto_22044 ?auto_22084 ) ) ( not ( = ?auto_22044 ?auto_22075 ) ) ( not ( = ?auto_22076 ?auto_22070 ) ) ( not ( = ?auto_22076 ?auto_22056 ) ) ( not ( = ?auto_22076 ?auto_22072 ) ) ( not ( = ?auto_22076 ?auto_22063 ) ) ( not ( = ?auto_22076 ?auto_22065 ) ) ( not ( = ?auto_22071 ?auto_22069 ) ) ( not ( = ?auto_22071 ?auto_22055 ) ) ( not ( = ?auto_22071 ?auto_22064 ) ) ( not ( = ?auto_22071 ?auto_22078 ) ) ( not ( = ?auto_22071 ?auto_22087 ) ) ( not ( = ?auto_22077 ?auto_22086 ) ) ( not ( = ?auto_22077 ?auto_22079 ) ) ( not ( = ?auto_22077 ?auto_22067 ) ) ( not ( = ?auto_22077 ?auto_22084 ) ) ( not ( = ?auto_22077 ?auto_22075 ) ) ( not ( = ?auto_22038 ?auto_22045 ) ) ( not ( = ?auto_22038 ?auto_22080 ) ) ( not ( = ?auto_22039 ?auto_22045 ) ) ( not ( = ?auto_22039 ?auto_22080 ) ) ( not ( = ?auto_22040 ?auto_22045 ) ) ( not ( = ?auto_22040 ?auto_22080 ) ) ( not ( = ?auto_22041 ?auto_22045 ) ) ( not ( = ?auto_22041 ?auto_22080 ) ) ( not ( = ?auto_22042 ?auto_22045 ) ) ( not ( = ?auto_22042 ?auto_22080 ) ) ( not ( = ?auto_22043 ?auto_22045 ) ) ( not ( = ?auto_22043 ?auto_22080 ) ) ( not ( = ?auto_22045 ?auto_22077 ) ) ( not ( = ?auto_22045 ?auto_22086 ) ) ( not ( = ?auto_22045 ?auto_22079 ) ) ( not ( = ?auto_22045 ?auto_22067 ) ) ( not ( = ?auto_22045 ?auto_22084 ) ) ( not ( = ?auto_22045 ?auto_22075 ) ) ( not ( = ?auto_22074 ?auto_22076 ) ) ( not ( = ?auto_22074 ?auto_22070 ) ) ( not ( = ?auto_22074 ?auto_22056 ) ) ( not ( = ?auto_22074 ?auto_22072 ) ) ( not ( = ?auto_22074 ?auto_22063 ) ) ( not ( = ?auto_22074 ?auto_22065 ) ) ( not ( = ?auto_22082 ?auto_22071 ) ) ( not ( = ?auto_22082 ?auto_22069 ) ) ( not ( = ?auto_22082 ?auto_22055 ) ) ( not ( = ?auto_22082 ?auto_22064 ) ) ( not ( = ?auto_22082 ?auto_22078 ) ) ( not ( = ?auto_22082 ?auto_22087 ) ) ( not ( = ?auto_22080 ?auto_22077 ) ) ( not ( = ?auto_22080 ?auto_22086 ) ) ( not ( = ?auto_22080 ?auto_22079 ) ) ( not ( = ?auto_22080 ?auto_22067 ) ) ( not ( = ?auto_22080 ?auto_22084 ) ) ( not ( = ?auto_22080 ?auto_22075 ) ) ( not ( = ?auto_22038 ?auto_22046 ) ) ( not ( = ?auto_22038 ?auto_22068 ) ) ( not ( = ?auto_22039 ?auto_22046 ) ) ( not ( = ?auto_22039 ?auto_22068 ) ) ( not ( = ?auto_22040 ?auto_22046 ) ) ( not ( = ?auto_22040 ?auto_22068 ) ) ( not ( = ?auto_22041 ?auto_22046 ) ) ( not ( = ?auto_22041 ?auto_22068 ) ) ( not ( = ?auto_22042 ?auto_22046 ) ) ( not ( = ?auto_22042 ?auto_22068 ) ) ( not ( = ?auto_22043 ?auto_22046 ) ) ( not ( = ?auto_22043 ?auto_22068 ) ) ( not ( = ?auto_22044 ?auto_22046 ) ) ( not ( = ?auto_22044 ?auto_22068 ) ) ( not ( = ?auto_22046 ?auto_22080 ) ) ( not ( = ?auto_22046 ?auto_22077 ) ) ( not ( = ?auto_22046 ?auto_22086 ) ) ( not ( = ?auto_22046 ?auto_22079 ) ) ( not ( = ?auto_22046 ?auto_22067 ) ) ( not ( = ?auto_22046 ?auto_22084 ) ) ( not ( = ?auto_22046 ?auto_22075 ) ) ( not ( = ?auto_22081 ?auto_22074 ) ) ( not ( = ?auto_22081 ?auto_22076 ) ) ( not ( = ?auto_22081 ?auto_22070 ) ) ( not ( = ?auto_22081 ?auto_22056 ) ) ( not ( = ?auto_22081 ?auto_22072 ) ) ( not ( = ?auto_22081 ?auto_22063 ) ) ( not ( = ?auto_22081 ?auto_22065 ) ) ( not ( = ?auto_22066 ?auto_22082 ) ) ( not ( = ?auto_22066 ?auto_22071 ) ) ( not ( = ?auto_22066 ?auto_22069 ) ) ( not ( = ?auto_22066 ?auto_22055 ) ) ( not ( = ?auto_22066 ?auto_22064 ) ) ( not ( = ?auto_22066 ?auto_22078 ) ) ( not ( = ?auto_22066 ?auto_22087 ) ) ( not ( = ?auto_22068 ?auto_22080 ) ) ( not ( = ?auto_22068 ?auto_22077 ) ) ( not ( = ?auto_22068 ?auto_22086 ) ) ( not ( = ?auto_22068 ?auto_22079 ) ) ( not ( = ?auto_22068 ?auto_22067 ) ) ( not ( = ?auto_22068 ?auto_22084 ) ) ( not ( = ?auto_22068 ?auto_22075 ) ) ( not ( = ?auto_22038 ?auto_22047 ) ) ( not ( = ?auto_22038 ?auto_22060 ) ) ( not ( = ?auto_22039 ?auto_22047 ) ) ( not ( = ?auto_22039 ?auto_22060 ) ) ( not ( = ?auto_22040 ?auto_22047 ) ) ( not ( = ?auto_22040 ?auto_22060 ) ) ( not ( = ?auto_22041 ?auto_22047 ) ) ( not ( = ?auto_22041 ?auto_22060 ) ) ( not ( = ?auto_22042 ?auto_22047 ) ) ( not ( = ?auto_22042 ?auto_22060 ) ) ( not ( = ?auto_22043 ?auto_22047 ) ) ( not ( = ?auto_22043 ?auto_22060 ) ) ( not ( = ?auto_22044 ?auto_22047 ) ) ( not ( = ?auto_22044 ?auto_22060 ) ) ( not ( = ?auto_22045 ?auto_22047 ) ) ( not ( = ?auto_22045 ?auto_22060 ) ) ( not ( = ?auto_22047 ?auto_22068 ) ) ( not ( = ?auto_22047 ?auto_22080 ) ) ( not ( = ?auto_22047 ?auto_22077 ) ) ( not ( = ?auto_22047 ?auto_22086 ) ) ( not ( = ?auto_22047 ?auto_22079 ) ) ( not ( = ?auto_22047 ?auto_22067 ) ) ( not ( = ?auto_22047 ?auto_22084 ) ) ( not ( = ?auto_22047 ?auto_22075 ) ) ( not ( = ?auto_22060 ?auto_22068 ) ) ( not ( = ?auto_22060 ?auto_22080 ) ) ( not ( = ?auto_22060 ?auto_22077 ) ) ( not ( = ?auto_22060 ?auto_22086 ) ) ( not ( = ?auto_22060 ?auto_22079 ) ) ( not ( = ?auto_22060 ?auto_22067 ) ) ( not ( = ?auto_22060 ?auto_22084 ) ) ( not ( = ?auto_22060 ?auto_22075 ) ) ( not ( = ?auto_22038 ?auto_22048 ) ) ( not ( = ?auto_22038 ?auto_22083 ) ) ( not ( = ?auto_22039 ?auto_22048 ) ) ( not ( = ?auto_22039 ?auto_22083 ) ) ( not ( = ?auto_22040 ?auto_22048 ) ) ( not ( = ?auto_22040 ?auto_22083 ) ) ( not ( = ?auto_22041 ?auto_22048 ) ) ( not ( = ?auto_22041 ?auto_22083 ) ) ( not ( = ?auto_22042 ?auto_22048 ) ) ( not ( = ?auto_22042 ?auto_22083 ) ) ( not ( = ?auto_22043 ?auto_22048 ) ) ( not ( = ?auto_22043 ?auto_22083 ) ) ( not ( = ?auto_22044 ?auto_22048 ) ) ( not ( = ?auto_22044 ?auto_22083 ) ) ( not ( = ?auto_22045 ?auto_22048 ) ) ( not ( = ?auto_22045 ?auto_22083 ) ) ( not ( = ?auto_22046 ?auto_22048 ) ) ( not ( = ?auto_22046 ?auto_22083 ) ) ( not ( = ?auto_22048 ?auto_22060 ) ) ( not ( = ?auto_22048 ?auto_22068 ) ) ( not ( = ?auto_22048 ?auto_22080 ) ) ( not ( = ?auto_22048 ?auto_22077 ) ) ( not ( = ?auto_22048 ?auto_22086 ) ) ( not ( = ?auto_22048 ?auto_22079 ) ) ( not ( = ?auto_22048 ?auto_22067 ) ) ( not ( = ?auto_22048 ?auto_22084 ) ) ( not ( = ?auto_22048 ?auto_22075 ) ) ( not ( = ?auto_22073 ?auto_22072 ) ) ( not ( = ?auto_22073 ?auto_22081 ) ) ( not ( = ?auto_22073 ?auto_22074 ) ) ( not ( = ?auto_22073 ?auto_22076 ) ) ( not ( = ?auto_22073 ?auto_22070 ) ) ( not ( = ?auto_22073 ?auto_22056 ) ) ( not ( = ?auto_22073 ?auto_22063 ) ) ( not ( = ?auto_22073 ?auto_22065 ) ) ( not ( = ?auto_22059 ?auto_22064 ) ) ( not ( = ?auto_22059 ?auto_22066 ) ) ( not ( = ?auto_22059 ?auto_22082 ) ) ( not ( = ?auto_22059 ?auto_22071 ) ) ( not ( = ?auto_22059 ?auto_22069 ) ) ( not ( = ?auto_22059 ?auto_22055 ) ) ( not ( = ?auto_22059 ?auto_22078 ) ) ( not ( = ?auto_22059 ?auto_22087 ) ) ( not ( = ?auto_22083 ?auto_22060 ) ) ( not ( = ?auto_22083 ?auto_22068 ) ) ( not ( = ?auto_22083 ?auto_22080 ) ) ( not ( = ?auto_22083 ?auto_22077 ) ) ( not ( = ?auto_22083 ?auto_22086 ) ) ( not ( = ?auto_22083 ?auto_22079 ) ) ( not ( = ?auto_22083 ?auto_22067 ) ) ( not ( = ?auto_22083 ?auto_22084 ) ) ( not ( = ?auto_22083 ?auto_22075 ) ) ( not ( = ?auto_22038 ?auto_22049 ) ) ( not ( = ?auto_22038 ?auto_22085 ) ) ( not ( = ?auto_22039 ?auto_22049 ) ) ( not ( = ?auto_22039 ?auto_22085 ) ) ( not ( = ?auto_22040 ?auto_22049 ) ) ( not ( = ?auto_22040 ?auto_22085 ) ) ( not ( = ?auto_22041 ?auto_22049 ) ) ( not ( = ?auto_22041 ?auto_22085 ) ) ( not ( = ?auto_22042 ?auto_22049 ) ) ( not ( = ?auto_22042 ?auto_22085 ) ) ( not ( = ?auto_22043 ?auto_22049 ) ) ( not ( = ?auto_22043 ?auto_22085 ) ) ( not ( = ?auto_22044 ?auto_22049 ) ) ( not ( = ?auto_22044 ?auto_22085 ) ) ( not ( = ?auto_22045 ?auto_22049 ) ) ( not ( = ?auto_22045 ?auto_22085 ) ) ( not ( = ?auto_22046 ?auto_22049 ) ) ( not ( = ?auto_22046 ?auto_22085 ) ) ( not ( = ?auto_22047 ?auto_22049 ) ) ( not ( = ?auto_22047 ?auto_22085 ) ) ( not ( = ?auto_22049 ?auto_22083 ) ) ( not ( = ?auto_22049 ?auto_22060 ) ) ( not ( = ?auto_22049 ?auto_22068 ) ) ( not ( = ?auto_22049 ?auto_22080 ) ) ( not ( = ?auto_22049 ?auto_22077 ) ) ( not ( = ?auto_22049 ?auto_22086 ) ) ( not ( = ?auto_22049 ?auto_22079 ) ) ( not ( = ?auto_22049 ?auto_22067 ) ) ( not ( = ?auto_22049 ?auto_22084 ) ) ( not ( = ?auto_22049 ?auto_22075 ) ) ( not ( = ?auto_22085 ?auto_22083 ) ) ( not ( = ?auto_22085 ?auto_22060 ) ) ( not ( = ?auto_22085 ?auto_22068 ) ) ( not ( = ?auto_22085 ?auto_22080 ) ) ( not ( = ?auto_22085 ?auto_22077 ) ) ( not ( = ?auto_22085 ?auto_22086 ) ) ( not ( = ?auto_22085 ?auto_22079 ) ) ( not ( = ?auto_22085 ?auto_22067 ) ) ( not ( = ?auto_22085 ?auto_22084 ) ) ( not ( = ?auto_22085 ?auto_22075 ) ) ( not ( = ?auto_22038 ?auto_22050 ) ) ( not ( = ?auto_22038 ?auto_22061 ) ) ( not ( = ?auto_22039 ?auto_22050 ) ) ( not ( = ?auto_22039 ?auto_22061 ) ) ( not ( = ?auto_22040 ?auto_22050 ) ) ( not ( = ?auto_22040 ?auto_22061 ) ) ( not ( = ?auto_22041 ?auto_22050 ) ) ( not ( = ?auto_22041 ?auto_22061 ) ) ( not ( = ?auto_22042 ?auto_22050 ) ) ( not ( = ?auto_22042 ?auto_22061 ) ) ( not ( = ?auto_22043 ?auto_22050 ) ) ( not ( = ?auto_22043 ?auto_22061 ) ) ( not ( = ?auto_22044 ?auto_22050 ) ) ( not ( = ?auto_22044 ?auto_22061 ) ) ( not ( = ?auto_22045 ?auto_22050 ) ) ( not ( = ?auto_22045 ?auto_22061 ) ) ( not ( = ?auto_22046 ?auto_22050 ) ) ( not ( = ?auto_22046 ?auto_22061 ) ) ( not ( = ?auto_22047 ?auto_22050 ) ) ( not ( = ?auto_22047 ?auto_22061 ) ) ( not ( = ?auto_22048 ?auto_22050 ) ) ( not ( = ?auto_22048 ?auto_22061 ) ) ( not ( = ?auto_22050 ?auto_22085 ) ) ( not ( = ?auto_22050 ?auto_22083 ) ) ( not ( = ?auto_22050 ?auto_22060 ) ) ( not ( = ?auto_22050 ?auto_22068 ) ) ( not ( = ?auto_22050 ?auto_22080 ) ) ( not ( = ?auto_22050 ?auto_22077 ) ) ( not ( = ?auto_22050 ?auto_22086 ) ) ( not ( = ?auto_22050 ?auto_22079 ) ) ( not ( = ?auto_22050 ?auto_22067 ) ) ( not ( = ?auto_22050 ?auto_22084 ) ) ( not ( = ?auto_22050 ?auto_22075 ) ) ( not ( = ?auto_22061 ?auto_22085 ) ) ( not ( = ?auto_22061 ?auto_22083 ) ) ( not ( = ?auto_22061 ?auto_22060 ) ) ( not ( = ?auto_22061 ?auto_22068 ) ) ( not ( = ?auto_22061 ?auto_22080 ) ) ( not ( = ?auto_22061 ?auto_22077 ) ) ( not ( = ?auto_22061 ?auto_22086 ) ) ( not ( = ?auto_22061 ?auto_22079 ) ) ( not ( = ?auto_22061 ?auto_22067 ) ) ( not ( = ?auto_22061 ?auto_22084 ) ) ( not ( = ?auto_22061 ?auto_22075 ) ) ( not ( = ?auto_22038 ?auto_22052 ) ) ( not ( = ?auto_22038 ?auto_22062 ) ) ( not ( = ?auto_22039 ?auto_22052 ) ) ( not ( = ?auto_22039 ?auto_22062 ) ) ( not ( = ?auto_22040 ?auto_22052 ) ) ( not ( = ?auto_22040 ?auto_22062 ) ) ( not ( = ?auto_22041 ?auto_22052 ) ) ( not ( = ?auto_22041 ?auto_22062 ) ) ( not ( = ?auto_22042 ?auto_22052 ) ) ( not ( = ?auto_22042 ?auto_22062 ) ) ( not ( = ?auto_22043 ?auto_22052 ) ) ( not ( = ?auto_22043 ?auto_22062 ) ) ( not ( = ?auto_22044 ?auto_22052 ) ) ( not ( = ?auto_22044 ?auto_22062 ) ) ( not ( = ?auto_22045 ?auto_22052 ) ) ( not ( = ?auto_22045 ?auto_22062 ) ) ( not ( = ?auto_22046 ?auto_22052 ) ) ( not ( = ?auto_22046 ?auto_22062 ) ) ( not ( = ?auto_22047 ?auto_22052 ) ) ( not ( = ?auto_22047 ?auto_22062 ) ) ( not ( = ?auto_22048 ?auto_22052 ) ) ( not ( = ?auto_22048 ?auto_22062 ) ) ( not ( = ?auto_22049 ?auto_22052 ) ) ( not ( = ?auto_22049 ?auto_22062 ) ) ( not ( = ?auto_22052 ?auto_22061 ) ) ( not ( = ?auto_22052 ?auto_22085 ) ) ( not ( = ?auto_22052 ?auto_22083 ) ) ( not ( = ?auto_22052 ?auto_22060 ) ) ( not ( = ?auto_22052 ?auto_22068 ) ) ( not ( = ?auto_22052 ?auto_22080 ) ) ( not ( = ?auto_22052 ?auto_22077 ) ) ( not ( = ?auto_22052 ?auto_22086 ) ) ( not ( = ?auto_22052 ?auto_22079 ) ) ( not ( = ?auto_22052 ?auto_22067 ) ) ( not ( = ?auto_22052 ?auto_22084 ) ) ( not ( = ?auto_22052 ?auto_22075 ) ) ( not ( = ?auto_22062 ?auto_22061 ) ) ( not ( = ?auto_22062 ?auto_22085 ) ) ( not ( = ?auto_22062 ?auto_22083 ) ) ( not ( = ?auto_22062 ?auto_22060 ) ) ( not ( = ?auto_22062 ?auto_22068 ) ) ( not ( = ?auto_22062 ?auto_22080 ) ) ( not ( = ?auto_22062 ?auto_22077 ) ) ( not ( = ?auto_22062 ?auto_22086 ) ) ( not ( = ?auto_22062 ?auto_22079 ) ) ( not ( = ?auto_22062 ?auto_22067 ) ) ( not ( = ?auto_22062 ?auto_22084 ) ) ( not ( = ?auto_22062 ?auto_22075 ) ) ( not ( = ?auto_22038 ?auto_22051 ) ) ( not ( = ?auto_22038 ?auto_22053 ) ) ( not ( = ?auto_22039 ?auto_22051 ) ) ( not ( = ?auto_22039 ?auto_22053 ) ) ( not ( = ?auto_22040 ?auto_22051 ) ) ( not ( = ?auto_22040 ?auto_22053 ) ) ( not ( = ?auto_22041 ?auto_22051 ) ) ( not ( = ?auto_22041 ?auto_22053 ) ) ( not ( = ?auto_22042 ?auto_22051 ) ) ( not ( = ?auto_22042 ?auto_22053 ) ) ( not ( = ?auto_22043 ?auto_22051 ) ) ( not ( = ?auto_22043 ?auto_22053 ) ) ( not ( = ?auto_22044 ?auto_22051 ) ) ( not ( = ?auto_22044 ?auto_22053 ) ) ( not ( = ?auto_22045 ?auto_22051 ) ) ( not ( = ?auto_22045 ?auto_22053 ) ) ( not ( = ?auto_22046 ?auto_22051 ) ) ( not ( = ?auto_22046 ?auto_22053 ) ) ( not ( = ?auto_22047 ?auto_22051 ) ) ( not ( = ?auto_22047 ?auto_22053 ) ) ( not ( = ?auto_22048 ?auto_22051 ) ) ( not ( = ?auto_22048 ?auto_22053 ) ) ( not ( = ?auto_22049 ?auto_22051 ) ) ( not ( = ?auto_22049 ?auto_22053 ) ) ( not ( = ?auto_22050 ?auto_22051 ) ) ( not ( = ?auto_22050 ?auto_22053 ) ) ( not ( = ?auto_22051 ?auto_22062 ) ) ( not ( = ?auto_22051 ?auto_22061 ) ) ( not ( = ?auto_22051 ?auto_22085 ) ) ( not ( = ?auto_22051 ?auto_22083 ) ) ( not ( = ?auto_22051 ?auto_22060 ) ) ( not ( = ?auto_22051 ?auto_22068 ) ) ( not ( = ?auto_22051 ?auto_22080 ) ) ( not ( = ?auto_22051 ?auto_22077 ) ) ( not ( = ?auto_22051 ?auto_22086 ) ) ( not ( = ?auto_22051 ?auto_22079 ) ) ( not ( = ?auto_22051 ?auto_22067 ) ) ( not ( = ?auto_22051 ?auto_22084 ) ) ( not ( = ?auto_22051 ?auto_22075 ) ) ( not ( = ?auto_22053 ?auto_22062 ) ) ( not ( = ?auto_22053 ?auto_22061 ) ) ( not ( = ?auto_22053 ?auto_22085 ) ) ( not ( = ?auto_22053 ?auto_22083 ) ) ( not ( = ?auto_22053 ?auto_22060 ) ) ( not ( = ?auto_22053 ?auto_22068 ) ) ( not ( = ?auto_22053 ?auto_22080 ) ) ( not ( = ?auto_22053 ?auto_22077 ) ) ( not ( = ?auto_22053 ?auto_22086 ) ) ( not ( = ?auto_22053 ?auto_22079 ) ) ( not ( = ?auto_22053 ?auto_22067 ) ) ( not ( = ?auto_22053 ?auto_22084 ) ) ( not ( = ?auto_22053 ?auto_22075 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_22038 ?auto_22039 ?auto_22040 ?auto_22041 ?auto_22042 ?auto_22043 ?auto_22044 ?auto_22045 ?auto_22046 ?auto_22047 ?auto_22048 ?auto_22049 ?auto_22050 ?auto_22052 )
      ( MAKE-1CRATE ?auto_22052 ?auto_22051 )
      ( MAKE-14CRATE-VERIFY ?auto_22038 ?auto_22039 ?auto_22040 ?auto_22041 ?auto_22042 ?auto_22043 ?auto_22044 ?auto_22045 ?auto_22046 ?auto_22047 ?auto_22048 ?auto_22049 ?auto_22050 ?auto_22052 ?auto_22051 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_22114 - SURFACE
      ?auto_22115 - SURFACE
      ?auto_22116 - SURFACE
      ?auto_22117 - SURFACE
      ?auto_22118 - SURFACE
      ?auto_22119 - SURFACE
      ?auto_22120 - SURFACE
      ?auto_22121 - SURFACE
      ?auto_22122 - SURFACE
      ?auto_22123 - SURFACE
      ?auto_22124 - SURFACE
      ?auto_22125 - SURFACE
      ?auto_22126 - SURFACE
      ?auto_22128 - SURFACE
      ?auto_22127 - SURFACE
      ?auto_22129 - SURFACE
    )
    :vars
    (
      ?auto_22133 - HOIST
      ?auto_22135 - PLACE
      ?auto_22130 - PLACE
      ?auto_22132 - HOIST
      ?auto_22131 - SURFACE
      ?auto_22158 - PLACE
      ?auto_22147 - HOIST
      ?auto_22136 - SURFACE
      ?auto_22154 - PLACE
      ?auto_22149 - HOIST
      ?auto_22140 - SURFACE
      ?auto_22166 - PLACE
      ?auto_22144 - HOIST
      ?auto_22164 - SURFACE
      ?auto_22160 - PLACE
      ?auto_22161 - HOIST
      ?auto_22143 - SURFACE
      ?auto_22146 - PLACE
      ?auto_22142 - HOIST
      ?auto_22138 - SURFACE
      ?auto_22153 - SURFACE
      ?auto_22156 - PLACE
      ?auto_22162 - HOIST
      ?auto_22165 - SURFACE
      ?auto_22150 - PLACE
      ?auto_22152 - HOIST
      ?auto_22151 - SURFACE
      ?auto_22159 - PLACE
      ?auto_22148 - HOIST
      ?auto_22137 - SURFACE
      ?auto_22157 - SURFACE
      ?auto_22141 - SURFACE
      ?auto_22167 - SURFACE
      ?auto_22139 - PLACE
      ?auto_22163 - HOIST
      ?auto_22145 - SURFACE
      ?auto_22155 - SURFACE
      ?auto_22134 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22133 ?auto_22135 ) ( IS-CRATE ?auto_22129 ) ( not ( = ?auto_22130 ?auto_22135 ) ) ( HOIST-AT ?auto_22132 ?auto_22130 ) ( AVAILABLE ?auto_22132 ) ( SURFACE-AT ?auto_22129 ?auto_22130 ) ( ON ?auto_22129 ?auto_22131 ) ( CLEAR ?auto_22129 ) ( not ( = ?auto_22127 ?auto_22129 ) ) ( not ( = ?auto_22127 ?auto_22131 ) ) ( not ( = ?auto_22129 ?auto_22131 ) ) ( not ( = ?auto_22133 ?auto_22132 ) ) ( IS-CRATE ?auto_22127 ) ( not ( = ?auto_22158 ?auto_22135 ) ) ( HOIST-AT ?auto_22147 ?auto_22158 ) ( SURFACE-AT ?auto_22127 ?auto_22158 ) ( ON ?auto_22127 ?auto_22136 ) ( CLEAR ?auto_22127 ) ( not ( = ?auto_22128 ?auto_22127 ) ) ( not ( = ?auto_22128 ?auto_22136 ) ) ( not ( = ?auto_22127 ?auto_22136 ) ) ( not ( = ?auto_22133 ?auto_22147 ) ) ( IS-CRATE ?auto_22128 ) ( not ( = ?auto_22154 ?auto_22135 ) ) ( HOIST-AT ?auto_22149 ?auto_22154 ) ( SURFACE-AT ?auto_22128 ?auto_22154 ) ( ON ?auto_22128 ?auto_22140 ) ( CLEAR ?auto_22128 ) ( not ( = ?auto_22126 ?auto_22128 ) ) ( not ( = ?auto_22126 ?auto_22140 ) ) ( not ( = ?auto_22128 ?auto_22140 ) ) ( not ( = ?auto_22133 ?auto_22149 ) ) ( IS-CRATE ?auto_22126 ) ( not ( = ?auto_22166 ?auto_22135 ) ) ( HOIST-AT ?auto_22144 ?auto_22166 ) ( SURFACE-AT ?auto_22126 ?auto_22166 ) ( ON ?auto_22126 ?auto_22164 ) ( CLEAR ?auto_22126 ) ( not ( = ?auto_22125 ?auto_22126 ) ) ( not ( = ?auto_22125 ?auto_22164 ) ) ( not ( = ?auto_22126 ?auto_22164 ) ) ( not ( = ?auto_22133 ?auto_22144 ) ) ( IS-CRATE ?auto_22125 ) ( not ( = ?auto_22160 ?auto_22135 ) ) ( HOIST-AT ?auto_22161 ?auto_22160 ) ( SURFACE-AT ?auto_22125 ?auto_22160 ) ( ON ?auto_22125 ?auto_22143 ) ( CLEAR ?auto_22125 ) ( not ( = ?auto_22124 ?auto_22125 ) ) ( not ( = ?auto_22124 ?auto_22143 ) ) ( not ( = ?auto_22125 ?auto_22143 ) ) ( not ( = ?auto_22133 ?auto_22161 ) ) ( IS-CRATE ?auto_22124 ) ( not ( = ?auto_22146 ?auto_22135 ) ) ( HOIST-AT ?auto_22142 ?auto_22146 ) ( AVAILABLE ?auto_22142 ) ( SURFACE-AT ?auto_22124 ?auto_22146 ) ( ON ?auto_22124 ?auto_22138 ) ( CLEAR ?auto_22124 ) ( not ( = ?auto_22123 ?auto_22124 ) ) ( not ( = ?auto_22123 ?auto_22138 ) ) ( not ( = ?auto_22124 ?auto_22138 ) ) ( not ( = ?auto_22133 ?auto_22142 ) ) ( IS-CRATE ?auto_22123 ) ( SURFACE-AT ?auto_22123 ?auto_22160 ) ( ON ?auto_22123 ?auto_22153 ) ( CLEAR ?auto_22123 ) ( not ( = ?auto_22122 ?auto_22123 ) ) ( not ( = ?auto_22122 ?auto_22153 ) ) ( not ( = ?auto_22123 ?auto_22153 ) ) ( IS-CRATE ?auto_22122 ) ( not ( = ?auto_22156 ?auto_22135 ) ) ( HOIST-AT ?auto_22162 ?auto_22156 ) ( AVAILABLE ?auto_22162 ) ( SURFACE-AT ?auto_22122 ?auto_22156 ) ( ON ?auto_22122 ?auto_22165 ) ( CLEAR ?auto_22122 ) ( not ( = ?auto_22121 ?auto_22122 ) ) ( not ( = ?auto_22121 ?auto_22165 ) ) ( not ( = ?auto_22122 ?auto_22165 ) ) ( not ( = ?auto_22133 ?auto_22162 ) ) ( IS-CRATE ?auto_22121 ) ( not ( = ?auto_22150 ?auto_22135 ) ) ( HOIST-AT ?auto_22152 ?auto_22150 ) ( AVAILABLE ?auto_22152 ) ( SURFACE-AT ?auto_22121 ?auto_22150 ) ( ON ?auto_22121 ?auto_22151 ) ( CLEAR ?auto_22121 ) ( not ( = ?auto_22120 ?auto_22121 ) ) ( not ( = ?auto_22120 ?auto_22151 ) ) ( not ( = ?auto_22121 ?auto_22151 ) ) ( not ( = ?auto_22133 ?auto_22152 ) ) ( IS-CRATE ?auto_22120 ) ( not ( = ?auto_22159 ?auto_22135 ) ) ( HOIST-AT ?auto_22148 ?auto_22159 ) ( AVAILABLE ?auto_22148 ) ( SURFACE-AT ?auto_22120 ?auto_22159 ) ( ON ?auto_22120 ?auto_22137 ) ( CLEAR ?auto_22120 ) ( not ( = ?auto_22119 ?auto_22120 ) ) ( not ( = ?auto_22119 ?auto_22137 ) ) ( not ( = ?auto_22120 ?auto_22137 ) ) ( not ( = ?auto_22133 ?auto_22148 ) ) ( IS-CRATE ?auto_22119 ) ( AVAILABLE ?auto_22149 ) ( SURFACE-AT ?auto_22119 ?auto_22154 ) ( ON ?auto_22119 ?auto_22157 ) ( CLEAR ?auto_22119 ) ( not ( = ?auto_22118 ?auto_22119 ) ) ( not ( = ?auto_22118 ?auto_22157 ) ) ( not ( = ?auto_22119 ?auto_22157 ) ) ( IS-CRATE ?auto_22118 ) ( AVAILABLE ?auto_22147 ) ( SURFACE-AT ?auto_22118 ?auto_22158 ) ( ON ?auto_22118 ?auto_22141 ) ( CLEAR ?auto_22118 ) ( not ( = ?auto_22117 ?auto_22118 ) ) ( not ( = ?auto_22117 ?auto_22141 ) ) ( not ( = ?auto_22118 ?auto_22141 ) ) ( IS-CRATE ?auto_22117 ) ( AVAILABLE ?auto_22161 ) ( SURFACE-AT ?auto_22117 ?auto_22160 ) ( ON ?auto_22117 ?auto_22167 ) ( CLEAR ?auto_22117 ) ( not ( = ?auto_22116 ?auto_22117 ) ) ( not ( = ?auto_22116 ?auto_22167 ) ) ( not ( = ?auto_22117 ?auto_22167 ) ) ( IS-CRATE ?auto_22116 ) ( not ( = ?auto_22139 ?auto_22135 ) ) ( HOIST-AT ?auto_22163 ?auto_22139 ) ( AVAILABLE ?auto_22163 ) ( SURFACE-AT ?auto_22116 ?auto_22139 ) ( ON ?auto_22116 ?auto_22145 ) ( CLEAR ?auto_22116 ) ( not ( = ?auto_22115 ?auto_22116 ) ) ( not ( = ?auto_22115 ?auto_22145 ) ) ( not ( = ?auto_22116 ?auto_22145 ) ) ( not ( = ?auto_22133 ?auto_22163 ) ) ( SURFACE-AT ?auto_22114 ?auto_22135 ) ( CLEAR ?auto_22114 ) ( IS-CRATE ?auto_22115 ) ( AVAILABLE ?auto_22133 ) ( AVAILABLE ?auto_22144 ) ( SURFACE-AT ?auto_22115 ?auto_22166 ) ( ON ?auto_22115 ?auto_22155 ) ( CLEAR ?auto_22115 ) ( TRUCK-AT ?auto_22134 ?auto_22135 ) ( not ( = ?auto_22114 ?auto_22115 ) ) ( not ( = ?auto_22114 ?auto_22155 ) ) ( not ( = ?auto_22115 ?auto_22155 ) ) ( not ( = ?auto_22114 ?auto_22116 ) ) ( not ( = ?auto_22114 ?auto_22145 ) ) ( not ( = ?auto_22116 ?auto_22155 ) ) ( not ( = ?auto_22139 ?auto_22166 ) ) ( not ( = ?auto_22163 ?auto_22144 ) ) ( not ( = ?auto_22145 ?auto_22155 ) ) ( not ( = ?auto_22114 ?auto_22117 ) ) ( not ( = ?auto_22114 ?auto_22167 ) ) ( not ( = ?auto_22115 ?auto_22117 ) ) ( not ( = ?auto_22115 ?auto_22167 ) ) ( not ( = ?auto_22117 ?auto_22145 ) ) ( not ( = ?auto_22117 ?auto_22155 ) ) ( not ( = ?auto_22160 ?auto_22139 ) ) ( not ( = ?auto_22160 ?auto_22166 ) ) ( not ( = ?auto_22161 ?auto_22163 ) ) ( not ( = ?auto_22161 ?auto_22144 ) ) ( not ( = ?auto_22167 ?auto_22145 ) ) ( not ( = ?auto_22167 ?auto_22155 ) ) ( not ( = ?auto_22114 ?auto_22118 ) ) ( not ( = ?auto_22114 ?auto_22141 ) ) ( not ( = ?auto_22115 ?auto_22118 ) ) ( not ( = ?auto_22115 ?auto_22141 ) ) ( not ( = ?auto_22116 ?auto_22118 ) ) ( not ( = ?auto_22116 ?auto_22141 ) ) ( not ( = ?auto_22118 ?auto_22167 ) ) ( not ( = ?auto_22118 ?auto_22145 ) ) ( not ( = ?auto_22118 ?auto_22155 ) ) ( not ( = ?auto_22158 ?auto_22160 ) ) ( not ( = ?auto_22158 ?auto_22139 ) ) ( not ( = ?auto_22158 ?auto_22166 ) ) ( not ( = ?auto_22147 ?auto_22161 ) ) ( not ( = ?auto_22147 ?auto_22163 ) ) ( not ( = ?auto_22147 ?auto_22144 ) ) ( not ( = ?auto_22141 ?auto_22167 ) ) ( not ( = ?auto_22141 ?auto_22145 ) ) ( not ( = ?auto_22141 ?auto_22155 ) ) ( not ( = ?auto_22114 ?auto_22119 ) ) ( not ( = ?auto_22114 ?auto_22157 ) ) ( not ( = ?auto_22115 ?auto_22119 ) ) ( not ( = ?auto_22115 ?auto_22157 ) ) ( not ( = ?auto_22116 ?auto_22119 ) ) ( not ( = ?auto_22116 ?auto_22157 ) ) ( not ( = ?auto_22117 ?auto_22119 ) ) ( not ( = ?auto_22117 ?auto_22157 ) ) ( not ( = ?auto_22119 ?auto_22141 ) ) ( not ( = ?auto_22119 ?auto_22167 ) ) ( not ( = ?auto_22119 ?auto_22145 ) ) ( not ( = ?auto_22119 ?auto_22155 ) ) ( not ( = ?auto_22154 ?auto_22158 ) ) ( not ( = ?auto_22154 ?auto_22160 ) ) ( not ( = ?auto_22154 ?auto_22139 ) ) ( not ( = ?auto_22154 ?auto_22166 ) ) ( not ( = ?auto_22149 ?auto_22147 ) ) ( not ( = ?auto_22149 ?auto_22161 ) ) ( not ( = ?auto_22149 ?auto_22163 ) ) ( not ( = ?auto_22149 ?auto_22144 ) ) ( not ( = ?auto_22157 ?auto_22141 ) ) ( not ( = ?auto_22157 ?auto_22167 ) ) ( not ( = ?auto_22157 ?auto_22145 ) ) ( not ( = ?auto_22157 ?auto_22155 ) ) ( not ( = ?auto_22114 ?auto_22120 ) ) ( not ( = ?auto_22114 ?auto_22137 ) ) ( not ( = ?auto_22115 ?auto_22120 ) ) ( not ( = ?auto_22115 ?auto_22137 ) ) ( not ( = ?auto_22116 ?auto_22120 ) ) ( not ( = ?auto_22116 ?auto_22137 ) ) ( not ( = ?auto_22117 ?auto_22120 ) ) ( not ( = ?auto_22117 ?auto_22137 ) ) ( not ( = ?auto_22118 ?auto_22120 ) ) ( not ( = ?auto_22118 ?auto_22137 ) ) ( not ( = ?auto_22120 ?auto_22157 ) ) ( not ( = ?auto_22120 ?auto_22141 ) ) ( not ( = ?auto_22120 ?auto_22167 ) ) ( not ( = ?auto_22120 ?auto_22145 ) ) ( not ( = ?auto_22120 ?auto_22155 ) ) ( not ( = ?auto_22159 ?auto_22154 ) ) ( not ( = ?auto_22159 ?auto_22158 ) ) ( not ( = ?auto_22159 ?auto_22160 ) ) ( not ( = ?auto_22159 ?auto_22139 ) ) ( not ( = ?auto_22159 ?auto_22166 ) ) ( not ( = ?auto_22148 ?auto_22149 ) ) ( not ( = ?auto_22148 ?auto_22147 ) ) ( not ( = ?auto_22148 ?auto_22161 ) ) ( not ( = ?auto_22148 ?auto_22163 ) ) ( not ( = ?auto_22148 ?auto_22144 ) ) ( not ( = ?auto_22137 ?auto_22157 ) ) ( not ( = ?auto_22137 ?auto_22141 ) ) ( not ( = ?auto_22137 ?auto_22167 ) ) ( not ( = ?auto_22137 ?auto_22145 ) ) ( not ( = ?auto_22137 ?auto_22155 ) ) ( not ( = ?auto_22114 ?auto_22121 ) ) ( not ( = ?auto_22114 ?auto_22151 ) ) ( not ( = ?auto_22115 ?auto_22121 ) ) ( not ( = ?auto_22115 ?auto_22151 ) ) ( not ( = ?auto_22116 ?auto_22121 ) ) ( not ( = ?auto_22116 ?auto_22151 ) ) ( not ( = ?auto_22117 ?auto_22121 ) ) ( not ( = ?auto_22117 ?auto_22151 ) ) ( not ( = ?auto_22118 ?auto_22121 ) ) ( not ( = ?auto_22118 ?auto_22151 ) ) ( not ( = ?auto_22119 ?auto_22121 ) ) ( not ( = ?auto_22119 ?auto_22151 ) ) ( not ( = ?auto_22121 ?auto_22137 ) ) ( not ( = ?auto_22121 ?auto_22157 ) ) ( not ( = ?auto_22121 ?auto_22141 ) ) ( not ( = ?auto_22121 ?auto_22167 ) ) ( not ( = ?auto_22121 ?auto_22145 ) ) ( not ( = ?auto_22121 ?auto_22155 ) ) ( not ( = ?auto_22150 ?auto_22159 ) ) ( not ( = ?auto_22150 ?auto_22154 ) ) ( not ( = ?auto_22150 ?auto_22158 ) ) ( not ( = ?auto_22150 ?auto_22160 ) ) ( not ( = ?auto_22150 ?auto_22139 ) ) ( not ( = ?auto_22150 ?auto_22166 ) ) ( not ( = ?auto_22152 ?auto_22148 ) ) ( not ( = ?auto_22152 ?auto_22149 ) ) ( not ( = ?auto_22152 ?auto_22147 ) ) ( not ( = ?auto_22152 ?auto_22161 ) ) ( not ( = ?auto_22152 ?auto_22163 ) ) ( not ( = ?auto_22152 ?auto_22144 ) ) ( not ( = ?auto_22151 ?auto_22137 ) ) ( not ( = ?auto_22151 ?auto_22157 ) ) ( not ( = ?auto_22151 ?auto_22141 ) ) ( not ( = ?auto_22151 ?auto_22167 ) ) ( not ( = ?auto_22151 ?auto_22145 ) ) ( not ( = ?auto_22151 ?auto_22155 ) ) ( not ( = ?auto_22114 ?auto_22122 ) ) ( not ( = ?auto_22114 ?auto_22165 ) ) ( not ( = ?auto_22115 ?auto_22122 ) ) ( not ( = ?auto_22115 ?auto_22165 ) ) ( not ( = ?auto_22116 ?auto_22122 ) ) ( not ( = ?auto_22116 ?auto_22165 ) ) ( not ( = ?auto_22117 ?auto_22122 ) ) ( not ( = ?auto_22117 ?auto_22165 ) ) ( not ( = ?auto_22118 ?auto_22122 ) ) ( not ( = ?auto_22118 ?auto_22165 ) ) ( not ( = ?auto_22119 ?auto_22122 ) ) ( not ( = ?auto_22119 ?auto_22165 ) ) ( not ( = ?auto_22120 ?auto_22122 ) ) ( not ( = ?auto_22120 ?auto_22165 ) ) ( not ( = ?auto_22122 ?auto_22151 ) ) ( not ( = ?auto_22122 ?auto_22137 ) ) ( not ( = ?auto_22122 ?auto_22157 ) ) ( not ( = ?auto_22122 ?auto_22141 ) ) ( not ( = ?auto_22122 ?auto_22167 ) ) ( not ( = ?auto_22122 ?auto_22145 ) ) ( not ( = ?auto_22122 ?auto_22155 ) ) ( not ( = ?auto_22156 ?auto_22150 ) ) ( not ( = ?auto_22156 ?auto_22159 ) ) ( not ( = ?auto_22156 ?auto_22154 ) ) ( not ( = ?auto_22156 ?auto_22158 ) ) ( not ( = ?auto_22156 ?auto_22160 ) ) ( not ( = ?auto_22156 ?auto_22139 ) ) ( not ( = ?auto_22156 ?auto_22166 ) ) ( not ( = ?auto_22162 ?auto_22152 ) ) ( not ( = ?auto_22162 ?auto_22148 ) ) ( not ( = ?auto_22162 ?auto_22149 ) ) ( not ( = ?auto_22162 ?auto_22147 ) ) ( not ( = ?auto_22162 ?auto_22161 ) ) ( not ( = ?auto_22162 ?auto_22163 ) ) ( not ( = ?auto_22162 ?auto_22144 ) ) ( not ( = ?auto_22165 ?auto_22151 ) ) ( not ( = ?auto_22165 ?auto_22137 ) ) ( not ( = ?auto_22165 ?auto_22157 ) ) ( not ( = ?auto_22165 ?auto_22141 ) ) ( not ( = ?auto_22165 ?auto_22167 ) ) ( not ( = ?auto_22165 ?auto_22145 ) ) ( not ( = ?auto_22165 ?auto_22155 ) ) ( not ( = ?auto_22114 ?auto_22123 ) ) ( not ( = ?auto_22114 ?auto_22153 ) ) ( not ( = ?auto_22115 ?auto_22123 ) ) ( not ( = ?auto_22115 ?auto_22153 ) ) ( not ( = ?auto_22116 ?auto_22123 ) ) ( not ( = ?auto_22116 ?auto_22153 ) ) ( not ( = ?auto_22117 ?auto_22123 ) ) ( not ( = ?auto_22117 ?auto_22153 ) ) ( not ( = ?auto_22118 ?auto_22123 ) ) ( not ( = ?auto_22118 ?auto_22153 ) ) ( not ( = ?auto_22119 ?auto_22123 ) ) ( not ( = ?auto_22119 ?auto_22153 ) ) ( not ( = ?auto_22120 ?auto_22123 ) ) ( not ( = ?auto_22120 ?auto_22153 ) ) ( not ( = ?auto_22121 ?auto_22123 ) ) ( not ( = ?auto_22121 ?auto_22153 ) ) ( not ( = ?auto_22123 ?auto_22165 ) ) ( not ( = ?auto_22123 ?auto_22151 ) ) ( not ( = ?auto_22123 ?auto_22137 ) ) ( not ( = ?auto_22123 ?auto_22157 ) ) ( not ( = ?auto_22123 ?auto_22141 ) ) ( not ( = ?auto_22123 ?auto_22167 ) ) ( not ( = ?auto_22123 ?auto_22145 ) ) ( not ( = ?auto_22123 ?auto_22155 ) ) ( not ( = ?auto_22153 ?auto_22165 ) ) ( not ( = ?auto_22153 ?auto_22151 ) ) ( not ( = ?auto_22153 ?auto_22137 ) ) ( not ( = ?auto_22153 ?auto_22157 ) ) ( not ( = ?auto_22153 ?auto_22141 ) ) ( not ( = ?auto_22153 ?auto_22167 ) ) ( not ( = ?auto_22153 ?auto_22145 ) ) ( not ( = ?auto_22153 ?auto_22155 ) ) ( not ( = ?auto_22114 ?auto_22124 ) ) ( not ( = ?auto_22114 ?auto_22138 ) ) ( not ( = ?auto_22115 ?auto_22124 ) ) ( not ( = ?auto_22115 ?auto_22138 ) ) ( not ( = ?auto_22116 ?auto_22124 ) ) ( not ( = ?auto_22116 ?auto_22138 ) ) ( not ( = ?auto_22117 ?auto_22124 ) ) ( not ( = ?auto_22117 ?auto_22138 ) ) ( not ( = ?auto_22118 ?auto_22124 ) ) ( not ( = ?auto_22118 ?auto_22138 ) ) ( not ( = ?auto_22119 ?auto_22124 ) ) ( not ( = ?auto_22119 ?auto_22138 ) ) ( not ( = ?auto_22120 ?auto_22124 ) ) ( not ( = ?auto_22120 ?auto_22138 ) ) ( not ( = ?auto_22121 ?auto_22124 ) ) ( not ( = ?auto_22121 ?auto_22138 ) ) ( not ( = ?auto_22122 ?auto_22124 ) ) ( not ( = ?auto_22122 ?auto_22138 ) ) ( not ( = ?auto_22124 ?auto_22153 ) ) ( not ( = ?auto_22124 ?auto_22165 ) ) ( not ( = ?auto_22124 ?auto_22151 ) ) ( not ( = ?auto_22124 ?auto_22137 ) ) ( not ( = ?auto_22124 ?auto_22157 ) ) ( not ( = ?auto_22124 ?auto_22141 ) ) ( not ( = ?auto_22124 ?auto_22167 ) ) ( not ( = ?auto_22124 ?auto_22145 ) ) ( not ( = ?auto_22124 ?auto_22155 ) ) ( not ( = ?auto_22146 ?auto_22160 ) ) ( not ( = ?auto_22146 ?auto_22156 ) ) ( not ( = ?auto_22146 ?auto_22150 ) ) ( not ( = ?auto_22146 ?auto_22159 ) ) ( not ( = ?auto_22146 ?auto_22154 ) ) ( not ( = ?auto_22146 ?auto_22158 ) ) ( not ( = ?auto_22146 ?auto_22139 ) ) ( not ( = ?auto_22146 ?auto_22166 ) ) ( not ( = ?auto_22142 ?auto_22161 ) ) ( not ( = ?auto_22142 ?auto_22162 ) ) ( not ( = ?auto_22142 ?auto_22152 ) ) ( not ( = ?auto_22142 ?auto_22148 ) ) ( not ( = ?auto_22142 ?auto_22149 ) ) ( not ( = ?auto_22142 ?auto_22147 ) ) ( not ( = ?auto_22142 ?auto_22163 ) ) ( not ( = ?auto_22142 ?auto_22144 ) ) ( not ( = ?auto_22138 ?auto_22153 ) ) ( not ( = ?auto_22138 ?auto_22165 ) ) ( not ( = ?auto_22138 ?auto_22151 ) ) ( not ( = ?auto_22138 ?auto_22137 ) ) ( not ( = ?auto_22138 ?auto_22157 ) ) ( not ( = ?auto_22138 ?auto_22141 ) ) ( not ( = ?auto_22138 ?auto_22167 ) ) ( not ( = ?auto_22138 ?auto_22145 ) ) ( not ( = ?auto_22138 ?auto_22155 ) ) ( not ( = ?auto_22114 ?auto_22125 ) ) ( not ( = ?auto_22114 ?auto_22143 ) ) ( not ( = ?auto_22115 ?auto_22125 ) ) ( not ( = ?auto_22115 ?auto_22143 ) ) ( not ( = ?auto_22116 ?auto_22125 ) ) ( not ( = ?auto_22116 ?auto_22143 ) ) ( not ( = ?auto_22117 ?auto_22125 ) ) ( not ( = ?auto_22117 ?auto_22143 ) ) ( not ( = ?auto_22118 ?auto_22125 ) ) ( not ( = ?auto_22118 ?auto_22143 ) ) ( not ( = ?auto_22119 ?auto_22125 ) ) ( not ( = ?auto_22119 ?auto_22143 ) ) ( not ( = ?auto_22120 ?auto_22125 ) ) ( not ( = ?auto_22120 ?auto_22143 ) ) ( not ( = ?auto_22121 ?auto_22125 ) ) ( not ( = ?auto_22121 ?auto_22143 ) ) ( not ( = ?auto_22122 ?auto_22125 ) ) ( not ( = ?auto_22122 ?auto_22143 ) ) ( not ( = ?auto_22123 ?auto_22125 ) ) ( not ( = ?auto_22123 ?auto_22143 ) ) ( not ( = ?auto_22125 ?auto_22138 ) ) ( not ( = ?auto_22125 ?auto_22153 ) ) ( not ( = ?auto_22125 ?auto_22165 ) ) ( not ( = ?auto_22125 ?auto_22151 ) ) ( not ( = ?auto_22125 ?auto_22137 ) ) ( not ( = ?auto_22125 ?auto_22157 ) ) ( not ( = ?auto_22125 ?auto_22141 ) ) ( not ( = ?auto_22125 ?auto_22167 ) ) ( not ( = ?auto_22125 ?auto_22145 ) ) ( not ( = ?auto_22125 ?auto_22155 ) ) ( not ( = ?auto_22143 ?auto_22138 ) ) ( not ( = ?auto_22143 ?auto_22153 ) ) ( not ( = ?auto_22143 ?auto_22165 ) ) ( not ( = ?auto_22143 ?auto_22151 ) ) ( not ( = ?auto_22143 ?auto_22137 ) ) ( not ( = ?auto_22143 ?auto_22157 ) ) ( not ( = ?auto_22143 ?auto_22141 ) ) ( not ( = ?auto_22143 ?auto_22167 ) ) ( not ( = ?auto_22143 ?auto_22145 ) ) ( not ( = ?auto_22143 ?auto_22155 ) ) ( not ( = ?auto_22114 ?auto_22126 ) ) ( not ( = ?auto_22114 ?auto_22164 ) ) ( not ( = ?auto_22115 ?auto_22126 ) ) ( not ( = ?auto_22115 ?auto_22164 ) ) ( not ( = ?auto_22116 ?auto_22126 ) ) ( not ( = ?auto_22116 ?auto_22164 ) ) ( not ( = ?auto_22117 ?auto_22126 ) ) ( not ( = ?auto_22117 ?auto_22164 ) ) ( not ( = ?auto_22118 ?auto_22126 ) ) ( not ( = ?auto_22118 ?auto_22164 ) ) ( not ( = ?auto_22119 ?auto_22126 ) ) ( not ( = ?auto_22119 ?auto_22164 ) ) ( not ( = ?auto_22120 ?auto_22126 ) ) ( not ( = ?auto_22120 ?auto_22164 ) ) ( not ( = ?auto_22121 ?auto_22126 ) ) ( not ( = ?auto_22121 ?auto_22164 ) ) ( not ( = ?auto_22122 ?auto_22126 ) ) ( not ( = ?auto_22122 ?auto_22164 ) ) ( not ( = ?auto_22123 ?auto_22126 ) ) ( not ( = ?auto_22123 ?auto_22164 ) ) ( not ( = ?auto_22124 ?auto_22126 ) ) ( not ( = ?auto_22124 ?auto_22164 ) ) ( not ( = ?auto_22126 ?auto_22143 ) ) ( not ( = ?auto_22126 ?auto_22138 ) ) ( not ( = ?auto_22126 ?auto_22153 ) ) ( not ( = ?auto_22126 ?auto_22165 ) ) ( not ( = ?auto_22126 ?auto_22151 ) ) ( not ( = ?auto_22126 ?auto_22137 ) ) ( not ( = ?auto_22126 ?auto_22157 ) ) ( not ( = ?auto_22126 ?auto_22141 ) ) ( not ( = ?auto_22126 ?auto_22167 ) ) ( not ( = ?auto_22126 ?auto_22145 ) ) ( not ( = ?auto_22126 ?auto_22155 ) ) ( not ( = ?auto_22164 ?auto_22143 ) ) ( not ( = ?auto_22164 ?auto_22138 ) ) ( not ( = ?auto_22164 ?auto_22153 ) ) ( not ( = ?auto_22164 ?auto_22165 ) ) ( not ( = ?auto_22164 ?auto_22151 ) ) ( not ( = ?auto_22164 ?auto_22137 ) ) ( not ( = ?auto_22164 ?auto_22157 ) ) ( not ( = ?auto_22164 ?auto_22141 ) ) ( not ( = ?auto_22164 ?auto_22167 ) ) ( not ( = ?auto_22164 ?auto_22145 ) ) ( not ( = ?auto_22164 ?auto_22155 ) ) ( not ( = ?auto_22114 ?auto_22128 ) ) ( not ( = ?auto_22114 ?auto_22140 ) ) ( not ( = ?auto_22115 ?auto_22128 ) ) ( not ( = ?auto_22115 ?auto_22140 ) ) ( not ( = ?auto_22116 ?auto_22128 ) ) ( not ( = ?auto_22116 ?auto_22140 ) ) ( not ( = ?auto_22117 ?auto_22128 ) ) ( not ( = ?auto_22117 ?auto_22140 ) ) ( not ( = ?auto_22118 ?auto_22128 ) ) ( not ( = ?auto_22118 ?auto_22140 ) ) ( not ( = ?auto_22119 ?auto_22128 ) ) ( not ( = ?auto_22119 ?auto_22140 ) ) ( not ( = ?auto_22120 ?auto_22128 ) ) ( not ( = ?auto_22120 ?auto_22140 ) ) ( not ( = ?auto_22121 ?auto_22128 ) ) ( not ( = ?auto_22121 ?auto_22140 ) ) ( not ( = ?auto_22122 ?auto_22128 ) ) ( not ( = ?auto_22122 ?auto_22140 ) ) ( not ( = ?auto_22123 ?auto_22128 ) ) ( not ( = ?auto_22123 ?auto_22140 ) ) ( not ( = ?auto_22124 ?auto_22128 ) ) ( not ( = ?auto_22124 ?auto_22140 ) ) ( not ( = ?auto_22125 ?auto_22128 ) ) ( not ( = ?auto_22125 ?auto_22140 ) ) ( not ( = ?auto_22128 ?auto_22164 ) ) ( not ( = ?auto_22128 ?auto_22143 ) ) ( not ( = ?auto_22128 ?auto_22138 ) ) ( not ( = ?auto_22128 ?auto_22153 ) ) ( not ( = ?auto_22128 ?auto_22165 ) ) ( not ( = ?auto_22128 ?auto_22151 ) ) ( not ( = ?auto_22128 ?auto_22137 ) ) ( not ( = ?auto_22128 ?auto_22157 ) ) ( not ( = ?auto_22128 ?auto_22141 ) ) ( not ( = ?auto_22128 ?auto_22167 ) ) ( not ( = ?auto_22128 ?auto_22145 ) ) ( not ( = ?auto_22128 ?auto_22155 ) ) ( not ( = ?auto_22140 ?auto_22164 ) ) ( not ( = ?auto_22140 ?auto_22143 ) ) ( not ( = ?auto_22140 ?auto_22138 ) ) ( not ( = ?auto_22140 ?auto_22153 ) ) ( not ( = ?auto_22140 ?auto_22165 ) ) ( not ( = ?auto_22140 ?auto_22151 ) ) ( not ( = ?auto_22140 ?auto_22137 ) ) ( not ( = ?auto_22140 ?auto_22157 ) ) ( not ( = ?auto_22140 ?auto_22141 ) ) ( not ( = ?auto_22140 ?auto_22167 ) ) ( not ( = ?auto_22140 ?auto_22145 ) ) ( not ( = ?auto_22140 ?auto_22155 ) ) ( not ( = ?auto_22114 ?auto_22127 ) ) ( not ( = ?auto_22114 ?auto_22136 ) ) ( not ( = ?auto_22115 ?auto_22127 ) ) ( not ( = ?auto_22115 ?auto_22136 ) ) ( not ( = ?auto_22116 ?auto_22127 ) ) ( not ( = ?auto_22116 ?auto_22136 ) ) ( not ( = ?auto_22117 ?auto_22127 ) ) ( not ( = ?auto_22117 ?auto_22136 ) ) ( not ( = ?auto_22118 ?auto_22127 ) ) ( not ( = ?auto_22118 ?auto_22136 ) ) ( not ( = ?auto_22119 ?auto_22127 ) ) ( not ( = ?auto_22119 ?auto_22136 ) ) ( not ( = ?auto_22120 ?auto_22127 ) ) ( not ( = ?auto_22120 ?auto_22136 ) ) ( not ( = ?auto_22121 ?auto_22127 ) ) ( not ( = ?auto_22121 ?auto_22136 ) ) ( not ( = ?auto_22122 ?auto_22127 ) ) ( not ( = ?auto_22122 ?auto_22136 ) ) ( not ( = ?auto_22123 ?auto_22127 ) ) ( not ( = ?auto_22123 ?auto_22136 ) ) ( not ( = ?auto_22124 ?auto_22127 ) ) ( not ( = ?auto_22124 ?auto_22136 ) ) ( not ( = ?auto_22125 ?auto_22127 ) ) ( not ( = ?auto_22125 ?auto_22136 ) ) ( not ( = ?auto_22126 ?auto_22127 ) ) ( not ( = ?auto_22126 ?auto_22136 ) ) ( not ( = ?auto_22127 ?auto_22140 ) ) ( not ( = ?auto_22127 ?auto_22164 ) ) ( not ( = ?auto_22127 ?auto_22143 ) ) ( not ( = ?auto_22127 ?auto_22138 ) ) ( not ( = ?auto_22127 ?auto_22153 ) ) ( not ( = ?auto_22127 ?auto_22165 ) ) ( not ( = ?auto_22127 ?auto_22151 ) ) ( not ( = ?auto_22127 ?auto_22137 ) ) ( not ( = ?auto_22127 ?auto_22157 ) ) ( not ( = ?auto_22127 ?auto_22141 ) ) ( not ( = ?auto_22127 ?auto_22167 ) ) ( not ( = ?auto_22127 ?auto_22145 ) ) ( not ( = ?auto_22127 ?auto_22155 ) ) ( not ( = ?auto_22136 ?auto_22140 ) ) ( not ( = ?auto_22136 ?auto_22164 ) ) ( not ( = ?auto_22136 ?auto_22143 ) ) ( not ( = ?auto_22136 ?auto_22138 ) ) ( not ( = ?auto_22136 ?auto_22153 ) ) ( not ( = ?auto_22136 ?auto_22165 ) ) ( not ( = ?auto_22136 ?auto_22151 ) ) ( not ( = ?auto_22136 ?auto_22137 ) ) ( not ( = ?auto_22136 ?auto_22157 ) ) ( not ( = ?auto_22136 ?auto_22141 ) ) ( not ( = ?auto_22136 ?auto_22167 ) ) ( not ( = ?auto_22136 ?auto_22145 ) ) ( not ( = ?auto_22136 ?auto_22155 ) ) ( not ( = ?auto_22114 ?auto_22129 ) ) ( not ( = ?auto_22114 ?auto_22131 ) ) ( not ( = ?auto_22115 ?auto_22129 ) ) ( not ( = ?auto_22115 ?auto_22131 ) ) ( not ( = ?auto_22116 ?auto_22129 ) ) ( not ( = ?auto_22116 ?auto_22131 ) ) ( not ( = ?auto_22117 ?auto_22129 ) ) ( not ( = ?auto_22117 ?auto_22131 ) ) ( not ( = ?auto_22118 ?auto_22129 ) ) ( not ( = ?auto_22118 ?auto_22131 ) ) ( not ( = ?auto_22119 ?auto_22129 ) ) ( not ( = ?auto_22119 ?auto_22131 ) ) ( not ( = ?auto_22120 ?auto_22129 ) ) ( not ( = ?auto_22120 ?auto_22131 ) ) ( not ( = ?auto_22121 ?auto_22129 ) ) ( not ( = ?auto_22121 ?auto_22131 ) ) ( not ( = ?auto_22122 ?auto_22129 ) ) ( not ( = ?auto_22122 ?auto_22131 ) ) ( not ( = ?auto_22123 ?auto_22129 ) ) ( not ( = ?auto_22123 ?auto_22131 ) ) ( not ( = ?auto_22124 ?auto_22129 ) ) ( not ( = ?auto_22124 ?auto_22131 ) ) ( not ( = ?auto_22125 ?auto_22129 ) ) ( not ( = ?auto_22125 ?auto_22131 ) ) ( not ( = ?auto_22126 ?auto_22129 ) ) ( not ( = ?auto_22126 ?auto_22131 ) ) ( not ( = ?auto_22128 ?auto_22129 ) ) ( not ( = ?auto_22128 ?auto_22131 ) ) ( not ( = ?auto_22129 ?auto_22136 ) ) ( not ( = ?auto_22129 ?auto_22140 ) ) ( not ( = ?auto_22129 ?auto_22164 ) ) ( not ( = ?auto_22129 ?auto_22143 ) ) ( not ( = ?auto_22129 ?auto_22138 ) ) ( not ( = ?auto_22129 ?auto_22153 ) ) ( not ( = ?auto_22129 ?auto_22165 ) ) ( not ( = ?auto_22129 ?auto_22151 ) ) ( not ( = ?auto_22129 ?auto_22137 ) ) ( not ( = ?auto_22129 ?auto_22157 ) ) ( not ( = ?auto_22129 ?auto_22141 ) ) ( not ( = ?auto_22129 ?auto_22167 ) ) ( not ( = ?auto_22129 ?auto_22145 ) ) ( not ( = ?auto_22129 ?auto_22155 ) ) ( not ( = ?auto_22130 ?auto_22158 ) ) ( not ( = ?auto_22130 ?auto_22154 ) ) ( not ( = ?auto_22130 ?auto_22166 ) ) ( not ( = ?auto_22130 ?auto_22160 ) ) ( not ( = ?auto_22130 ?auto_22146 ) ) ( not ( = ?auto_22130 ?auto_22156 ) ) ( not ( = ?auto_22130 ?auto_22150 ) ) ( not ( = ?auto_22130 ?auto_22159 ) ) ( not ( = ?auto_22130 ?auto_22139 ) ) ( not ( = ?auto_22132 ?auto_22147 ) ) ( not ( = ?auto_22132 ?auto_22149 ) ) ( not ( = ?auto_22132 ?auto_22144 ) ) ( not ( = ?auto_22132 ?auto_22161 ) ) ( not ( = ?auto_22132 ?auto_22142 ) ) ( not ( = ?auto_22132 ?auto_22162 ) ) ( not ( = ?auto_22132 ?auto_22152 ) ) ( not ( = ?auto_22132 ?auto_22148 ) ) ( not ( = ?auto_22132 ?auto_22163 ) ) ( not ( = ?auto_22131 ?auto_22136 ) ) ( not ( = ?auto_22131 ?auto_22140 ) ) ( not ( = ?auto_22131 ?auto_22164 ) ) ( not ( = ?auto_22131 ?auto_22143 ) ) ( not ( = ?auto_22131 ?auto_22138 ) ) ( not ( = ?auto_22131 ?auto_22153 ) ) ( not ( = ?auto_22131 ?auto_22165 ) ) ( not ( = ?auto_22131 ?auto_22151 ) ) ( not ( = ?auto_22131 ?auto_22137 ) ) ( not ( = ?auto_22131 ?auto_22157 ) ) ( not ( = ?auto_22131 ?auto_22141 ) ) ( not ( = ?auto_22131 ?auto_22167 ) ) ( not ( = ?auto_22131 ?auto_22145 ) ) ( not ( = ?auto_22131 ?auto_22155 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_22114 ?auto_22115 ?auto_22116 ?auto_22117 ?auto_22118 ?auto_22119 ?auto_22120 ?auto_22121 ?auto_22122 ?auto_22123 ?auto_22124 ?auto_22125 ?auto_22126 ?auto_22128 ?auto_22127 )
      ( MAKE-1CRATE ?auto_22127 ?auto_22129 )
      ( MAKE-15CRATE-VERIFY ?auto_22114 ?auto_22115 ?auto_22116 ?auto_22117 ?auto_22118 ?auto_22119 ?auto_22120 ?auto_22121 ?auto_22122 ?auto_22123 ?auto_22124 ?auto_22125 ?auto_22126 ?auto_22128 ?auto_22127 ?auto_22129 ) )
  )

)

