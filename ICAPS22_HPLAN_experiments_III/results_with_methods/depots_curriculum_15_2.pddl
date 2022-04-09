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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21407 - SURFACE
      ?auto_21408 - SURFACE
    )
    :vars
    (
      ?auto_21409 - HOIST
      ?auto_21410 - PLACE
      ?auto_21412 - PLACE
      ?auto_21413 - HOIST
      ?auto_21414 - SURFACE
      ?auto_21411 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21409 ?auto_21410 ) ( SURFACE-AT ?auto_21407 ?auto_21410 ) ( CLEAR ?auto_21407 ) ( IS-CRATE ?auto_21408 ) ( AVAILABLE ?auto_21409 ) ( not ( = ?auto_21412 ?auto_21410 ) ) ( HOIST-AT ?auto_21413 ?auto_21412 ) ( AVAILABLE ?auto_21413 ) ( SURFACE-AT ?auto_21408 ?auto_21412 ) ( ON ?auto_21408 ?auto_21414 ) ( CLEAR ?auto_21408 ) ( TRUCK-AT ?auto_21411 ?auto_21410 ) ( not ( = ?auto_21407 ?auto_21408 ) ) ( not ( = ?auto_21407 ?auto_21414 ) ) ( not ( = ?auto_21408 ?auto_21414 ) ) ( not ( = ?auto_21409 ?auto_21413 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21411 ?auto_21410 ?auto_21412 )
      ( !LIFT ?auto_21413 ?auto_21408 ?auto_21414 ?auto_21412 )
      ( !LOAD ?auto_21413 ?auto_21408 ?auto_21411 ?auto_21412 )
      ( !DRIVE ?auto_21411 ?auto_21412 ?auto_21410 )
      ( !UNLOAD ?auto_21409 ?auto_21408 ?auto_21411 ?auto_21410 )
      ( !DROP ?auto_21409 ?auto_21408 ?auto_21407 ?auto_21410 )
      ( MAKE-1CRATE-VERIFY ?auto_21407 ?auto_21408 ) )
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
      ?auto_21426 - HOIST
      ?auto_21424 - PLACE
      ?auto_21422 - PLACE
      ?auto_21425 - HOIST
      ?auto_21423 - SURFACE
      ?auto_21428 - PLACE
      ?auto_21427 - HOIST
      ?auto_21429 - SURFACE
      ?auto_21421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21426 ?auto_21424 ) ( IS-CRATE ?auto_21420 ) ( not ( = ?auto_21422 ?auto_21424 ) ) ( HOIST-AT ?auto_21425 ?auto_21422 ) ( AVAILABLE ?auto_21425 ) ( SURFACE-AT ?auto_21420 ?auto_21422 ) ( ON ?auto_21420 ?auto_21423 ) ( CLEAR ?auto_21420 ) ( not ( = ?auto_21419 ?auto_21420 ) ) ( not ( = ?auto_21419 ?auto_21423 ) ) ( not ( = ?auto_21420 ?auto_21423 ) ) ( not ( = ?auto_21426 ?auto_21425 ) ) ( SURFACE-AT ?auto_21418 ?auto_21424 ) ( CLEAR ?auto_21418 ) ( IS-CRATE ?auto_21419 ) ( AVAILABLE ?auto_21426 ) ( not ( = ?auto_21428 ?auto_21424 ) ) ( HOIST-AT ?auto_21427 ?auto_21428 ) ( AVAILABLE ?auto_21427 ) ( SURFACE-AT ?auto_21419 ?auto_21428 ) ( ON ?auto_21419 ?auto_21429 ) ( CLEAR ?auto_21419 ) ( TRUCK-AT ?auto_21421 ?auto_21424 ) ( not ( = ?auto_21418 ?auto_21419 ) ) ( not ( = ?auto_21418 ?auto_21429 ) ) ( not ( = ?auto_21419 ?auto_21429 ) ) ( not ( = ?auto_21426 ?auto_21427 ) ) ( not ( = ?auto_21418 ?auto_21420 ) ) ( not ( = ?auto_21418 ?auto_21423 ) ) ( not ( = ?auto_21420 ?auto_21429 ) ) ( not ( = ?auto_21422 ?auto_21428 ) ) ( not ( = ?auto_21425 ?auto_21427 ) ) ( not ( = ?auto_21423 ?auto_21429 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21418 ?auto_21419 )
      ( MAKE-1CRATE ?auto_21419 ?auto_21420 )
      ( MAKE-2CRATE-VERIFY ?auto_21418 ?auto_21419 ?auto_21420 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21432 - SURFACE
      ?auto_21433 - SURFACE
    )
    :vars
    (
      ?auto_21434 - HOIST
      ?auto_21435 - PLACE
      ?auto_21437 - PLACE
      ?auto_21438 - HOIST
      ?auto_21439 - SURFACE
      ?auto_21436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21434 ?auto_21435 ) ( SURFACE-AT ?auto_21432 ?auto_21435 ) ( CLEAR ?auto_21432 ) ( IS-CRATE ?auto_21433 ) ( AVAILABLE ?auto_21434 ) ( not ( = ?auto_21437 ?auto_21435 ) ) ( HOIST-AT ?auto_21438 ?auto_21437 ) ( AVAILABLE ?auto_21438 ) ( SURFACE-AT ?auto_21433 ?auto_21437 ) ( ON ?auto_21433 ?auto_21439 ) ( CLEAR ?auto_21433 ) ( TRUCK-AT ?auto_21436 ?auto_21435 ) ( not ( = ?auto_21432 ?auto_21433 ) ) ( not ( = ?auto_21432 ?auto_21439 ) ) ( not ( = ?auto_21433 ?auto_21439 ) ) ( not ( = ?auto_21434 ?auto_21438 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21436 ?auto_21435 ?auto_21437 )
      ( !LIFT ?auto_21438 ?auto_21433 ?auto_21439 ?auto_21437 )
      ( !LOAD ?auto_21438 ?auto_21433 ?auto_21436 ?auto_21437 )
      ( !DRIVE ?auto_21436 ?auto_21437 ?auto_21435 )
      ( !UNLOAD ?auto_21434 ?auto_21433 ?auto_21436 ?auto_21435 )
      ( !DROP ?auto_21434 ?auto_21433 ?auto_21432 ?auto_21435 )
      ( MAKE-1CRATE-VERIFY ?auto_21432 ?auto_21433 ) )
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
      ?auto_21450 - HOIST
      ?auto_21449 - PLACE
      ?auto_21453 - PLACE
      ?auto_21451 - HOIST
      ?auto_21452 - SURFACE
      ?auto_21459 - PLACE
      ?auto_21458 - HOIST
      ?auto_21455 - SURFACE
      ?auto_21457 - PLACE
      ?auto_21456 - HOIST
      ?auto_21454 - SURFACE
      ?auto_21448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21450 ?auto_21449 ) ( IS-CRATE ?auto_21447 ) ( not ( = ?auto_21453 ?auto_21449 ) ) ( HOIST-AT ?auto_21451 ?auto_21453 ) ( AVAILABLE ?auto_21451 ) ( SURFACE-AT ?auto_21447 ?auto_21453 ) ( ON ?auto_21447 ?auto_21452 ) ( CLEAR ?auto_21447 ) ( not ( = ?auto_21446 ?auto_21447 ) ) ( not ( = ?auto_21446 ?auto_21452 ) ) ( not ( = ?auto_21447 ?auto_21452 ) ) ( not ( = ?auto_21450 ?auto_21451 ) ) ( IS-CRATE ?auto_21446 ) ( not ( = ?auto_21459 ?auto_21449 ) ) ( HOIST-AT ?auto_21458 ?auto_21459 ) ( AVAILABLE ?auto_21458 ) ( SURFACE-AT ?auto_21446 ?auto_21459 ) ( ON ?auto_21446 ?auto_21455 ) ( CLEAR ?auto_21446 ) ( not ( = ?auto_21445 ?auto_21446 ) ) ( not ( = ?auto_21445 ?auto_21455 ) ) ( not ( = ?auto_21446 ?auto_21455 ) ) ( not ( = ?auto_21450 ?auto_21458 ) ) ( SURFACE-AT ?auto_21444 ?auto_21449 ) ( CLEAR ?auto_21444 ) ( IS-CRATE ?auto_21445 ) ( AVAILABLE ?auto_21450 ) ( not ( = ?auto_21457 ?auto_21449 ) ) ( HOIST-AT ?auto_21456 ?auto_21457 ) ( AVAILABLE ?auto_21456 ) ( SURFACE-AT ?auto_21445 ?auto_21457 ) ( ON ?auto_21445 ?auto_21454 ) ( CLEAR ?auto_21445 ) ( TRUCK-AT ?auto_21448 ?auto_21449 ) ( not ( = ?auto_21444 ?auto_21445 ) ) ( not ( = ?auto_21444 ?auto_21454 ) ) ( not ( = ?auto_21445 ?auto_21454 ) ) ( not ( = ?auto_21450 ?auto_21456 ) ) ( not ( = ?auto_21444 ?auto_21446 ) ) ( not ( = ?auto_21444 ?auto_21455 ) ) ( not ( = ?auto_21446 ?auto_21454 ) ) ( not ( = ?auto_21459 ?auto_21457 ) ) ( not ( = ?auto_21458 ?auto_21456 ) ) ( not ( = ?auto_21455 ?auto_21454 ) ) ( not ( = ?auto_21444 ?auto_21447 ) ) ( not ( = ?auto_21444 ?auto_21452 ) ) ( not ( = ?auto_21445 ?auto_21447 ) ) ( not ( = ?auto_21445 ?auto_21452 ) ) ( not ( = ?auto_21447 ?auto_21455 ) ) ( not ( = ?auto_21447 ?auto_21454 ) ) ( not ( = ?auto_21453 ?auto_21459 ) ) ( not ( = ?auto_21453 ?auto_21457 ) ) ( not ( = ?auto_21451 ?auto_21458 ) ) ( not ( = ?auto_21451 ?auto_21456 ) ) ( not ( = ?auto_21452 ?auto_21455 ) ) ( not ( = ?auto_21452 ?auto_21454 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21444 ?auto_21445 ?auto_21446 )
      ( MAKE-1CRATE ?auto_21446 ?auto_21447 )
      ( MAKE-3CRATE-VERIFY ?auto_21444 ?auto_21445 ?auto_21446 ?auto_21447 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21462 - SURFACE
      ?auto_21463 - SURFACE
    )
    :vars
    (
      ?auto_21464 - HOIST
      ?auto_21465 - PLACE
      ?auto_21467 - PLACE
      ?auto_21468 - HOIST
      ?auto_21469 - SURFACE
      ?auto_21466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21464 ?auto_21465 ) ( SURFACE-AT ?auto_21462 ?auto_21465 ) ( CLEAR ?auto_21462 ) ( IS-CRATE ?auto_21463 ) ( AVAILABLE ?auto_21464 ) ( not ( = ?auto_21467 ?auto_21465 ) ) ( HOIST-AT ?auto_21468 ?auto_21467 ) ( AVAILABLE ?auto_21468 ) ( SURFACE-AT ?auto_21463 ?auto_21467 ) ( ON ?auto_21463 ?auto_21469 ) ( CLEAR ?auto_21463 ) ( TRUCK-AT ?auto_21466 ?auto_21465 ) ( not ( = ?auto_21462 ?auto_21463 ) ) ( not ( = ?auto_21462 ?auto_21469 ) ) ( not ( = ?auto_21463 ?auto_21469 ) ) ( not ( = ?auto_21464 ?auto_21468 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21466 ?auto_21465 ?auto_21467 )
      ( !LIFT ?auto_21468 ?auto_21463 ?auto_21469 ?auto_21467 )
      ( !LOAD ?auto_21468 ?auto_21463 ?auto_21466 ?auto_21467 )
      ( !DRIVE ?auto_21466 ?auto_21467 ?auto_21465 )
      ( !UNLOAD ?auto_21464 ?auto_21463 ?auto_21466 ?auto_21465 )
      ( !DROP ?auto_21464 ?auto_21463 ?auto_21462 ?auto_21465 )
      ( MAKE-1CRATE-VERIFY ?auto_21462 ?auto_21463 ) )
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
      ?auto_21482 - HOIST
      ?auto_21485 - PLACE
      ?auto_21483 - PLACE
      ?auto_21480 - HOIST
      ?auto_21484 - SURFACE
      ?auto_21491 - PLACE
      ?auto_21487 - HOIST
      ?auto_21492 - SURFACE
      ?auto_21490 - PLACE
      ?auto_21486 - HOIST
      ?auto_21488 - SURFACE
      ?auto_21489 - PLACE
      ?auto_21493 - HOIST
      ?auto_21494 - SURFACE
      ?auto_21481 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21482 ?auto_21485 ) ( IS-CRATE ?auto_21479 ) ( not ( = ?auto_21483 ?auto_21485 ) ) ( HOIST-AT ?auto_21480 ?auto_21483 ) ( AVAILABLE ?auto_21480 ) ( SURFACE-AT ?auto_21479 ?auto_21483 ) ( ON ?auto_21479 ?auto_21484 ) ( CLEAR ?auto_21479 ) ( not ( = ?auto_21478 ?auto_21479 ) ) ( not ( = ?auto_21478 ?auto_21484 ) ) ( not ( = ?auto_21479 ?auto_21484 ) ) ( not ( = ?auto_21482 ?auto_21480 ) ) ( IS-CRATE ?auto_21478 ) ( not ( = ?auto_21491 ?auto_21485 ) ) ( HOIST-AT ?auto_21487 ?auto_21491 ) ( AVAILABLE ?auto_21487 ) ( SURFACE-AT ?auto_21478 ?auto_21491 ) ( ON ?auto_21478 ?auto_21492 ) ( CLEAR ?auto_21478 ) ( not ( = ?auto_21477 ?auto_21478 ) ) ( not ( = ?auto_21477 ?auto_21492 ) ) ( not ( = ?auto_21478 ?auto_21492 ) ) ( not ( = ?auto_21482 ?auto_21487 ) ) ( IS-CRATE ?auto_21477 ) ( not ( = ?auto_21490 ?auto_21485 ) ) ( HOIST-AT ?auto_21486 ?auto_21490 ) ( AVAILABLE ?auto_21486 ) ( SURFACE-AT ?auto_21477 ?auto_21490 ) ( ON ?auto_21477 ?auto_21488 ) ( CLEAR ?auto_21477 ) ( not ( = ?auto_21476 ?auto_21477 ) ) ( not ( = ?auto_21476 ?auto_21488 ) ) ( not ( = ?auto_21477 ?auto_21488 ) ) ( not ( = ?auto_21482 ?auto_21486 ) ) ( SURFACE-AT ?auto_21475 ?auto_21485 ) ( CLEAR ?auto_21475 ) ( IS-CRATE ?auto_21476 ) ( AVAILABLE ?auto_21482 ) ( not ( = ?auto_21489 ?auto_21485 ) ) ( HOIST-AT ?auto_21493 ?auto_21489 ) ( AVAILABLE ?auto_21493 ) ( SURFACE-AT ?auto_21476 ?auto_21489 ) ( ON ?auto_21476 ?auto_21494 ) ( CLEAR ?auto_21476 ) ( TRUCK-AT ?auto_21481 ?auto_21485 ) ( not ( = ?auto_21475 ?auto_21476 ) ) ( not ( = ?auto_21475 ?auto_21494 ) ) ( not ( = ?auto_21476 ?auto_21494 ) ) ( not ( = ?auto_21482 ?auto_21493 ) ) ( not ( = ?auto_21475 ?auto_21477 ) ) ( not ( = ?auto_21475 ?auto_21488 ) ) ( not ( = ?auto_21477 ?auto_21494 ) ) ( not ( = ?auto_21490 ?auto_21489 ) ) ( not ( = ?auto_21486 ?auto_21493 ) ) ( not ( = ?auto_21488 ?auto_21494 ) ) ( not ( = ?auto_21475 ?auto_21478 ) ) ( not ( = ?auto_21475 ?auto_21492 ) ) ( not ( = ?auto_21476 ?auto_21478 ) ) ( not ( = ?auto_21476 ?auto_21492 ) ) ( not ( = ?auto_21478 ?auto_21488 ) ) ( not ( = ?auto_21478 ?auto_21494 ) ) ( not ( = ?auto_21491 ?auto_21490 ) ) ( not ( = ?auto_21491 ?auto_21489 ) ) ( not ( = ?auto_21487 ?auto_21486 ) ) ( not ( = ?auto_21487 ?auto_21493 ) ) ( not ( = ?auto_21492 ?auto_21488 ) ) ( not ( = ?auto_21492 ?auto_21494 ) ) ( not ( = ?auto_21475 ?auto_21479 ) ) ( not ( = ?auto_21475 ?auto_21484 ) ) ( not ( = ?auto_21476 ?auto_21479 ) ) ( not ( = ?auto_21476 ?auto_21484 ) ) ( not ( = ?auto_21477 ?auto_21479 ) ) ( not ( = ?auto_21477 ?auto_21484 ) ) ( not ( = ?auto_21479 ?auto_21492 ) ) ( not ( = ?auto_21479 ?auto_21488 ) ) ( not ( = ?auto_21479 ?auto_21494 ) ) ( not ( = ?auto_21483 ?auto_21491 ) ) ( not ( = ?auto_21483 ?auto_21490 ) ) ( not ( = ?auto_21483 ?auto_21489 ) ) ( not ( = ?auto_21480 ?auto_21487 ) ) ( not ( = ?auto_21480 ?auto_21486 ) ) ( not ( = ?auto_21480 ?auto_21493 ) ) ( not ( = ?auto_21484 ?auto_21492 ) ) ( not ( = ?auto_21484 ?auto_21488 ) ) ( not ( = ?auto_21484 ?auto_21494 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_21475 ?auto_21476 ?auto_21477 ?auto_21478 )
      ( MAKE-1CRATE ?auto_21478 ?auto_21479 )
      ( MAKE-4CRATE-VERIFY ?auto_21475 ?auto_21476 ?auto_21477 ?auto_21478 ?auto_21479 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21497 - SURFACE
      ?auto_21498 - SURFACE
    )
    :vars
    (
      ?auto_21499 - HOIST
      ?auto_21500 - PLACE
      ?auto_21502 - PLACE
      ?auto_21503 - HOIST
      ?auto_21504 - SURFACE
      ?auto_21501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21499 ?auto_21500 ) ( SURFACE-AT ?auto_21497 ?auto_21500 ) ( CLEAR ?auto_21497 ) ( IS-CRATE ?auto_21498 ) ( AVAILABLE ?auto_21499 ) ( not ( = ?auto_21502 ?auto_21500 ) ) ( HOIST-AT ?auto_21503 ?auto_21502 ) ( AVAILABLE ?auto_21503 ) ( SURFACE-AT ?auto_21498 ?auto_21502 ) ( ON ?auto_21498 ?auto_21504 ) ( CLEAR ?auto_21498 ) ( TRUCK-AT ?auto_21501 ?auto_21500 ) ( not ( = ?auto_21497 ?auto_21498 ) ) ( not ( = ?auto_21497 ?auto_21504 ) ) ( not ( = ?auto_21498 ?auto_21504 ) ) ( not ( = ?auto_21499 ?auto_21503 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21501 ?auto_21500 ?auto_21502 )
      ( !LIFT ?auto_21503 ?auto_21498 ?auto_21504 ?auto_21502 )
      ( !LOAD ?auto_21503 ?auto_21498 ?auto_21501 ?auto_21502 )
      ( !DRIVE ?auto_21501 ?auto_21502 ?auto_21500 )
      ( !UNLOAD ?auto_21499 ?auto_21498 ?auto_21501 ?auto_21500 )
      ( !DROP ?auto_21499 ?auto_21498 ?auto_21497 ?auto_21500 )
      ( MAKE-1CRATE-VERIFY ?auto_21497 ?auto_21498 ) )
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
      ?auto_21519 - HOIST
      ?auto_21518 - PLACE
      ?auto_21517 - PLACE
      ?auto_21520 - HOIST
      ?auto_21521 - SURFACE
      ?auto_21531 - PLACE
      ?auto_21523 - HOIST
      ?auto_21529 - SURFACE
      ?auto_21527 - PLACE
      ?auto_21528 - HOIST
      ?auto_21524 - SURFACE
      ?auto_21526 - PLACE
      ?auto_21530 - HOIST
      ?auto_21532 - SURFACE
      ?auto_21525 - PLACE
      ?auto_21534 - HOIST
      ?auto_21533 - SURFACE
      ?auto_21522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21519 ?auto_21518 ) ( IS-CRATE ?auto_21516 ) ( not ( = ?auto_21517 ?auto_21518 ) ) ( HOIST-AT ?auto_21520 ?auto_21517 ) ( AVAILABLE ?auto_21520 ) ( SURFACE-AT ?auto_21516 ?auto_21517 ) ( ON ?auto_21516 ?auto_21521 ) ( CLEAR ?auto_21516 ) ( not ( = ?auto_21515 ?auto_21516 ) ) ( not ( = ?auto_21515 ?auto_21521 ) ) ( not ( = ?auto_21516 ?auto_21521 ) ) ( not ( = ?auto_21519 ?auto_21520 ) ) ( IS-CRATE ?auto_21515 ) ( not ( = ?auto_21531 ?auto_21518 ) ) ( HOIST-AT ?auto_21523 ?auto_21531 ) ( AVAILABLE ?auto_21523 ) ( SURFACE-AT ?auto_21515 ?auto_21531 ) ( ON ?auto_21515 ?auto_21529 ) ( CLEAR ?auto_21515 ) ( not ( = ?auto_21514 ?auto_21515 ) ) ( not ( = ?auto_21514 ?auto_21529 ) ) ( not ( = ?auto_21515 ?auto_21529 ) ) ( not ( = ?auto_21519 ?auto_21523 ) ) ( IS-CRATE ?auto_21514 ) ( not ( = ?auto_21527 ?auto_21518 ) ) ( HOIST-AT ?auto_21528 ?auto_21527 ) ( AVAILABLE ?auto_21528 ) ( SURFACE-AT ?auto_21514 ?auto_21527 ) ( ON ?auto_21514 ?auto_21524 ) ( CLEAR ?auto_21514 ) ( not ( = ?auto_21513 ?auto_21514 ) ) ( not ( = ?auto_21513 ?auto_21524 ) ) ( not ( = ?auto_21514 ?auto_21524 ) ) ( not ( = ?auto_21519 ?auto_21528 ) ) ( IS-CRATE ?auto_21513 ) ( not ( = ?auto_21526 ?auto_21518 ) ) ( HOIST-AT ?auto_21530 ?auto_21526 ) ( AVAILABLE ?auto_21530 ) ( SURFACE-AT ?auto_21513 ?auto_21526 ) ( ON ?auto_21513 ?auto_21532 ) ( CLEAR ?auto_21513 ) ( not ( = ?auto_21512 ?auto_21513 ) ) ( not ( = ?auto_21512 ?auto_21532 ) ) ( not ( = ?auto_21513 ?auto_21532 ) ) ( not ( = ?auto_21519 ?auto_21530 ) ) ( SURFACE-AT ?auto_21511 ?auto_21518 ) ( CLEAR ?auto_21511 ) ( IS-CRATE ?auto_21512 ) ( AVAILABLE ?auto_21519 ) ( not ( = ?auto_21525 ?auto_21518 ) ) ( HOIST-AT ?auto_21534 ?auto_21525 ) ( AVAILABLE ?auto_21534 ) ( SURFACE-AT ?auto_21512 ?auto_21525 ) ( ON ?auto_21512 ?auto_21533 ) ( CLEAR ?auto_21512 ) ( TRUCK-AT ?auto_21522 ?auto_21518 ) ( not ( = ?auto_21511 ?auto_21512 ) ) ( not ( = ?auto_21511 ?auto_21533 ) ) ( not ( = ?auto_21512 ?auto_21533 ) ) ( not ( = ?auto_21519 ?auto_21534 ) ) ( not ( = ?auto_21511 ?auto_21513 ) ) ( not ( = ?auto_21511 ?auto_21532 ) ) ( not ( = ?auto_21513 ?auto_21533 ) ) ( not ( = ?auto_21526 ?auto_21525 ) ) ( not ( = ?auto_21530 ?auto_21534 ) ) ( not ( = ?auto_21532 ?auto_21533 ) ) ( not ( = ?auto_21511 ?auto_21514 ) ) ( not ( = ?auto_21511 ?auto_21524 ) ) ( not ( = ?auto_21512 ?auto_21514 ) ) ( not ( = ?auto_21512 ?auto_21524 ) ) ( not ( = ?auto_21514 ?auto_21532 ) ) ( not ( = ?auto_21514 ?auto_21533 ) ) ( not ( = ?auto_21527 ?auto_21526 ) ) ( not ( = ?auto_21527 ?auto_21525 ) ) ( not ( = ?auto_21528 ?auto_21530 ) ) ( not ( = ?auto_21528 ?auto_21534 ) ) ( not ( = ?auto_21524 ?auto_21532 ) ) ( not ( = ?auto_21524 ?auto_21533 ) ) ( not ( = ?auto_21511 ?auto_21515 ) ) ( not ( = ?auto_21511 ?auto_21529 ) ) ( not ( = ?auto_21512 ?auto_21515 ) ) ( not ( = ?auto_21512 ?auto_21529 ) ) ( not ( = ?auto_21513 ?auto_21515 ) ) ( not ( = ?auto_21513 ?auto_21529 ) ) ( not ( = ?auto_21515 ?auto_21524 ) ) ( not ( = ?auto_21515 ?auto_21532 ) ) ( not ( = ?auto_21515 ?auto_21533 ) ) ( not ( = ?auto_21531 ?auto_21527 ) ) ( not ( = ?auto_21531 ?auto_21526 ) ) ( not ( = ?auto_21531 ?auto_21525 ) ) ( not ( = ?auto_21523 ?auto_21528 ) ) ( not ( = ?auto_21523 ?auto_21530 ) ) ( not ( = ?auto_21523 ?auto_21534 ) ) ( not ( = ?auto_21529 ?auto_21524 ) ) ( not ( = ?auto_21529 ?auto_21532 ) ) ( not ( = ?auto_21529 ?auto_21533 ) ) ( not ( = ?auto_21511 ?auto_21516 ) ) ( not ( = ?auto_21511 ?auto_21521 ) ) ( not ( = ?auto_21512 ?auto_21516 ) ) ( not ( = ?auto_21512 ?auto_21521 ) ) ( not ( = ?auto_21513 ?auto_21516 ) ) ( not ( = ?auto_21513 ?auto_21521 ) ) ( not ( = ?auto_21514 ?auto_21516 ) ) ( not ( = ?auto_21514 ?auto_21521 ) ) ( not ( = ?auto_21516 ?auto_21529 ) ) ( not ( = ?auto_21516 ?auto_21524 ) ) ( not ( = ?auto_21516 ?auto_21532 ) ) ( not ( = ?auto_21516 ?auto_21533 ) ) ( not ( = ?auto_21517 ?auto_21531 ) ) ( not ( = ?auto_21517 ?auto_21527 ) ) ( not ( = ?auto_21517 ?auto_21526 ) ) ( not ( = ?auto_21517 ?auto_21525 ) ) ( not ( = ?auto_21520 ?auto_21523 ) ) ( not ( = ?auto_21520 ?auto_21528 ) ) ( not ( = ?auto_21520 ?auto_21530 ) ) ( not ( = ?auto_21520 ?auto_21534 ) ) ( not ( = ?auto_21521 ?auto_21529 ) ) ( not ( = ?auto_21521 ?auto_21524 ) ) ( not ( = ?auto_21521 ?auto_21532 ) ) ( not ( = ?auto_21521 ?auto_21533 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_21511 ?auto_21512 ?auto_21513 ?auto_21514 ?auto_21515 )
      ( MAKE-1CRATE ?auto_21515 ?auto_21516 )
      ( MAKE-5CRATE-VERIFY ?auto_21511 ?auto_21512 ?auto_21513 ?auto_21514 ?auto_21515 ?auto_21516 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21537 - SURFACE
      ?auto_21538 - SURFACE
    )
    :vars
    (
      ?auto_21539 - HOIST
      ?auto_21540 - PLACE
      ?auto_21542 - PLACE
      ?auto_21543 - HOIST
      ?auto_21544 - SURFACE
      ?auto_21541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21539 ?auto_21540 ) ( SURFACE-AT ?auto_21537 ?auto_21540 ) ( CLEAR ?auto_21537 ) ( IS-CRATE ?auto_21538 ) ( AVAILABLE ?auto_21539 ) ( not ( = ?auto_21542 ?auto_21540 ) ) ( HOIST-AT ?auto_21543 ?auto_21542 ) ( AVAILABLE ?auto_21543 ) ( SURFACE-AT ?auto_21538 ?auto_21542 ) ( ON ?auto_21538 ?auto_21544 ) ( CLEAR ?auto_21538 ) ( TRUCK-AT ?auto_21541 ?auto_21540 ) ( not ( = ?auto_21537 ?auto_21538 ) ) ( not ( = ?auto_21537 ?auto_21544 ) ) ( not ( = ?auto_21538 ?auto_21544 ) ) ( not ( = ?auto_21539 ?auto_21543 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21541 ?auto_21540 ?auto_21542 )
      ( !LIFT ?auto_21543 ?auto_21538 ?auto_21544 ?auto_21542 )
      ( !LOAD ?auto_21543 ?auto_21538 ?auto_21541 ?auto_21542 )
      ( !DRIVE ?auto_21541 ?auto_21542 ?auto_21540 )
      ( !UNLOAD ?auto_21539 ?auto_21538 ?auto_21541 ?auto_21540 )
      ( !DROP ?auto_21539 ?auto_21538 ?auto_21537 ?auto_21540 )
      ( MAKE-1CRATE-VERIFY ?auto_21537 ?auto_21538 ) )
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
      ?auto_21561 - PLACE
      ?auto_21560 - PLACE
      ?auto_21562 - HOIST
      ?auto_21559 - SURFACE
      ?auto_21565 - PLACE
      ?auto_21579 - HOIST
      ?auto_21566 - SURFACE
      ?auto_21576 - PLACE
      ?auto_21573 - HOIST
      ?auto_21577 - SURFACE
      ?auto_21569 - PLACE
      ?auto_21570 - HOIST
      ?auto_21567 - SURFACE
      ?auto_21575 - PLACE
      ?auto_21571 - HOIST
      ?auto_21572 - SURFACE
      ?auto_21568 - PLACE
      ?auto_21574 - HOIST
      ?auto_21578 - SURFACE
      ?auto_21563 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21564 ?auto_21561 ) ( IS-CRATE ?auto_21558 ) ( not ( = ?auto_21560 ?auto_21561 ) ) ( HOIST-AT ?auto_21562 ?auto_21560 ) ( AVAILABLE ?auto_21562 ) ( SURFACE-AT ?auto_21558 ?auto_21560 ) ( ON ?auto_21558 ?auto_21559 ) ( CLEAR ?auto_21558 ) ( not ( = ?auto_21557 ?auto_21558 ) ) ( not ( = ?auto_21557 ?auto_21559 ) ) ( not ( = ?auto_21558 ?auto_21559 ) ) ( not ( = ?auto_21564 ?auto_21562 ) ) ( IS-CRATE ?auto_21557 ) ( not ( = ?auto_21565 ?auto_21561 ) ) ( HOIST-AT ?auto_21579 ?auto_21565 ) ( AVAILABLE ?auto_21579 ) ( SURFACE-AT ?auto_21557 ?auto_21565 ) ( ON ?auto_21557 ?auto_21566 ) ( CLEAR ?auto_21557 ) ( not ( = ?auto_21556 ?auto_21557 ) ) ( not ( = ?auto_21556 ?auto_21566 ) ) ( not ( = ?auto_21557 ?auto_21566 ) ) ( not ( = ?auto_21564 ?auto_21579 ) ) ( IS-CRATE ?auto_21556 ) ( not ( = ?auto_21576 ?auto_21561 ) ) ( HOIST-AT ?auto_21573 ?auto_21576 ) ( AVAILABLE ?auto_21573 ) ( SURFACE-AT ?auto_21556 ?auto_21576 ) ( ON ?auto_21556 ?auto_21577 ) ( CLEAR ?auto_21556 ) ( not ( = ?auto_21555 ?auto_21556 ) ) ( not ( = ?auto_21555 ?auto_21577 ) ) ( not ( = ?auto_21556 ?auto_21577 ) ) ( not ( = ?auto_21564 ?auto_21573 ) ) ( IS-CRATE ?auto_21555 ) ( not ( = ?auto_21569 ?auto_21561 ) ) ( HOIST-AT ?auto_21570 ?auto_21569 ) ( AVAILABLE ?auto_21570 ) ( SURFACE-AT ?auto_21555 ?auto_21569 ) ( ON ?auto_21555 ?auto_21567 ) ( CLEAR ?auto_21555 ) ( not ( = ?auto_21554 ?auto_21555 ) ) ( not ( = ?auto_21554 ?auto_21567 ) ) ( not ( = ?auto_21555 ?auto_21567 ) ) ( not ( = ?auto_21564 ?auto_21570 ) ) ( IS-CRATE ?auto_21554 ) ( not ( = ?auto_21575 ?auto_21561 ) ) ( HOIST-AT ?auto_21571 ?auto_21575 ) ( AVAILABLE ?auto_21571 ) ( SURFACE-AT ?auto_21554 ?auto_21575 ) ( ON ?auto_21554 ?auto_21572 ) ( CLEAR ?auto_21554 ) ( not ( = ?auto_21553 ?auto_21554 ) ) ( not ( = ?auto_21553 ?auto_21572 ) ) ( not ( = ?auto_21554 ?auto_21572 ) ) ( not ( = ?auto_21564 ?auto_21571 ) ) ( SURFACE-AT ?auto_21552 ?auto_21561 ) ( CLEAR ?auto_21552 ) ( IS-CRATE ?auto_21553 ) ( AVAILABLE ?auto_21564 ) ( not ( = ?auto_21568 ?auto_21561 ) ) ( HOIST-AT ?auto_21574 ?auto_21568 ) ( AVAILABLE ?auto_21574 ) ( SURFACE-AT ?auto_21553 ?auto_21568 ) ( ON ?auto_21553 ?auto_21578 ) ( CLEAR ?auto_21553 ) ( TRUCK-AT ?auto_21563 ?auto_21561 ) ( not ( = ?auto_21552 ?auto_21553 ) ) ( not ( = ?auto_21552 ?auto_21578 ) ) ( not ( = ?auto_21553 ?auto_21578 ) ) ( not ( = ?auto_21564 ?auto_21574 ) ) ( not ( = ?auto_21552 ?auto_21554 ) ) ( not ( = ?auto_21552 ?auto_21572 ) ) ( not ( = ?auto_21554 ?auto_21578 ) ) ( not ( = ?auto_21575 ?auto_21568 ) ) ( not ( = ?auto_21571 ?auto_21574 ) ) ( not ( = ?auto_21572 ?auto_21578 ) ) ( not ( = ?auto_21552 ?auto_21555 ) ) ( not ( = ?auto_21552 ?auto_21567 ) ) ( not ( = ?auto_21553 ?auto_21555 ) ) ( not ( = ?auto_21553 ?auto_21567 ) ) ( not ( = ?auto_21555 ?auto_21572 ) ) ( not ( = ?auto_21555 ?auto_21578 ) ) ( not ( = ?auto_21569 ?auto_21575 ) ) ( not ( = ?auto_21569 ?auto_21568 ) ) ( not ( = ?auto_21570 ?auto_21571 ) ) ( not ( = ?auto_21570 ?auto_21574 ) ) ( not ( = ?auto_21567 ?auto_21572 ) ) ( not ( = ?auto_21567 ?auto_21578 ) ) ( not ( = ?auto_21552 ?auto_21556 ) ) ( not ( = ?auto_21552 ?auto_21577 ) ) ( not ( = ?auto_21553 ?auto_21556 ) ) ( not ( = ?auto_21553 ?auto_21577 ) ) ( not ( = ?auto_21554 ?auto_21556 ) ) ( not ( = ?auto_21554 ?auto_21577 ) ) ( not ( = ?auto_21556 ?auto_21567 ) ) ( not ( = ?auto_21556 ?auto_21572 ) ) ( not ( = ?auto_21556 ?auto_21578 ) ) ( not ( = ?auto_21576 ?auto_21569 ) ) ( not ( = ?auto_21576 ?auto_21575 ) ) ( not ( = ?auto_21576 ?auto_21568 ) ) ( not ( = ?auto_21573 ?auto_21570 ) ) ( not ( = ?auto_21573 ?auto_21571 ) ) ( not ( = ?auto_21573 ?auto_21574 ) ) ( not ( = ?auto_21577 ?auto_21567 ) ) ( not ( = ?auto_21577 ?auto_21572 ) ) ( not ( = ?auto_21577 ?auto_21578 ) ) ( not ( = ?auto_21552 ?auto_21557 ) ) ( not ( = ?auto_21552 ?auto_21566 ) ) ( not ( = ?auto_21553 ?auto_21557 ) ) ( not ( = ?auto_21553 ?auto_21566 ) ) ( not ( = ?auto_21554 ?auto_21557 ) ) ( not ( = ?auto_21554 ?auto_21566 ) ) ( not ( = ?auto_21555 ?auto_21557 ) ) ( not ( = ?auto_21555 ?auto_21566 ) ) ( not ( = ?auto_21557 ?auto_21577 ) ) ( not ( = ?auto_21557 ?auto_21567 ) ) ( not ( = ?auto_21557 ?auto_21572 ) ) ( not ( = ?auto_21557 ?auto_21578 ) ) ( not ( = ?auto_21565 ?auto_21576 ) ) ( not ( = ?auto_21565 ?auto_21569 ) ) ( not ( = ?auto_21565 ?auto_21575 ) ) ( not ( = ?auto_21565 ?auto_21568 ) ) ( not ( = ?auto_21579 ?auto_21573 ) ) ( not ( = ?auto_21579 ?auto_21570 ) ) ( not ( = ?auto_21579 ?auto_21571 ) ) ( not ( = ?auto_21579 ?auto_21574 ) ) ( not ( = ?auto_21566 ?auto_21577 ) ) ( not ( = ?auto_21566 ?auto_21567 ) ) ( not ( = ?auto_21566 ?auto_21572 ) ) ( not ( = ?auto_21566 ?auto_21578 ) ) ( not ( = ?auto_21552 ?auto_21558 ) ) ( not ( = ?auto_21552 ?auto_21559 ) ) ( not ( = ?auto_21553 ?auto_21558 ) ) ( not ( = ?auto_21553 ?auto_21559 ) ) ( not ( = ?auto_21554 ?auto_21558 ) ) ( not ( = ?auto_21554 ?auto_21559 ) ) ( not ( = ?auto_21555 ?auto_21558 ) ) ( not ( = ?auto_21555 ?auto_21559 ) ) ( not ( = ?auto_21556 ?auto_21558 ) ) ( not ( = ?auto_21556 ?auto_21559 ) ) ( not ( = ?auto_21558 ?auto_21566 ) ) ( not ( = ?auto_21558 ?auto_21577 ) ) ( not ( = ?auto_21558 ?auto_21567 ) ) ( not ( = ?auto_21558 ?auto_21572 ) ) ( not ( = ?auto_21558 ?auto_21578 ) ) ( not ( = ?auto_21560 ?auto_21565 ) ) ( not ( = ?auto_21560 ?auto_21576 ) ) ( not ( = ?auto_21560 ?auto_21569 ) ) ( not ( = ?auto_21560 ?auto_21575 ) ) ( not ( = ?auto_21560 ?auto_21568 ) ) ( not ( = ?auto_21562 ?auto_21579 ) ) ( not ( = ?auto_21562 ?auto_21573 ) ) ( not ( = ?auto_21562 ?auto_21570 ) ) ( not ( = ?auto_21562 ?auto_21571 ) ) ( not ( = ?auto_21562 ?auto_21574 ) ) ( not ( = ?auto_21559 ?auto_21566 ) ) ( not ( = ?auto_21559 ?auto_21577 ) ) ( not ( = ?auto_21559 ?auto_21567 ) ) ( not ( = ?auto_21559 ?auto_21572 ) ) ( not ( = ?auto_21559 ?auto_21578 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_21552 ?auto_21553 ?auto_21554 ?auto_21555 ?auto_21556 ?auto_21557 )
      ( MAKE-1CRATE ?auto_21557 ?auto_21558 )
      ( MAKE-6CRATE-VERIFY ?auto_21552 ?auto_21553 ?auto_21554 ?auto_21555 ?auto_21556 ?auto_21557 ?auto_21558 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21582 - SURFACE
      ?auto_21583 - SURFACE
    )
    :vars
    (
      ?auto_21584 - HOIST
      ?auto_21585 - PLACE
      ?auto_21587 - PLACE
      ?auto_21588 - HOIST
      ?auto_21589 - SURFACE
      ?auto_21586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21584 ?auto_21585 ) ( SURFACE-AT ?auto_21582 ?auto_21585 ) ( CLEAR ?auto_21582 ) ( IS-CRATE ?auto_21583 ) ( AVAILABLE ?auto_21584 ) ( not ( = ?auto_21587 ?auto_21585 ) ) ( HOIST-AT ?auto_21588 ?auto_21587 ) ( AVAILABLE ?auto_21588 ) ( SURFACE-AT ?auto_21583 ?auto_21587 ) ( ON ?auto_21583 ?auto_21589 ) ( CLEAR ?auto_21583 ) ( TRUCK-AT ?auto_21586 ?auto_21585 ) ( not ( = ?auto_21582 ?auto_21583 ) ) ( not ( = ?auto_21582 ?auto_21589 ) ) ( not ( = ?auto_21583 ?auto_21589 ) ) ( not ( = ?auto_21584 ?auto_21588 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21586 ?auto_21585 ?auto_21587 )
      ( !LIFT ?auto_21588 ?auto_21583 ?auto_21589 ?auto_21587 )
      ( !LOAD ?auto_21588 ?auto_21583 ?auto_21586 ?auto_21587 )
      ( !DRIVE ?auto_21586 ?auto_21587 ?auto_21585 )
      ( !UNLOAD ?auto_21584 ?auto_21583 ?auto_21586 ?auto_21585 )
      ( !DROP ?auto_21584 ?auto_21583 ?auto_21582 ?auto_21585 )
      ( MAKE-1CRATE-VERIFY ?auto_21582 ?auto_21583 ) )
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
      ?auto_21607 - HOIST
      ?auto_21610 - PLACE
      ?auto_21606 - PLACE
      ?auto_21611 - HOIST
      ?auto_21608 - SURFACE
      ?auto_21620 - PLACE
      ?auto_21615 - HOIST
      ?auto_21624 - SURFACE
      ?auto_21625 - PLACE
      ?auto_21619 - HOIST
      ?auto_21617 - SURFACE
      ?auto_21626 - PLACE
      ?auto_21621 - HOIST
      ?auto_21627 - SURFACE
      ?auto_21614 - PLACE
      ?auto_21613 - HOIST
      ?auto_21616 - SURFACE
      ?auto_21622 - PLACE
      ?auto_21612 - HOIST
      ?auto_21629 - SURFACE
      ?auto_21618 - PLACE
      ?auto_21623 - HOIST
      ?auto_21628 - SURFACE
      ?auto_21609 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21607 ?auto_21610 ) ( IS-CRATE ?auto_21605 ) ( not ( = ?auto_21606 ?auto_21610 ) ) ( HOIST-AT ?auto_21611 ?auto_21606 ) ( AVAILABLE ?auto_21611 ) ( SURFACE-AT ?auto_21605 ?auto_21606 ) ( ON ?auto_21605 ?auto_21608 ) ( CLEAR ?auto_21605 ) ( not ( = ?auto_21604 ?auto_21605 ) ) ( not ( = ?auto_21604 ?auto_21608 ) ) ( not ( = ?auto_21605 ?auto_21608 ) ) ( not ( = ?auto_21607 ?auto_21611 ) ) ( IS-CRATE ?auto_21604 ) ( not ( = ?auto_21620 ?auto_21610 ) ) ( HOIST-AT ?auto_21615 ?auto_21620 ) ( AVAILABLE ?auto_21615 ) ( SURFACE-AT ?auto_21604 ?auto_21620 ) ( ON ?auto_21604 ?auto_21624 ) ( CLEAR ?auto_21604 ) ( not ( = ?auto_21603 ?auto_21604 ) ) ( not ( = ?auto_21603 ?auto_21624 ) ) ( not ( = ?auto_21604 ?auto_21624 ) ) ( not ( = ?auto_21607 ?auto_21615 ) ) ( IS-CRATE ?auto_21603 ) ( not ( = ?auto_21625 ?auto_21610 ) ) ( HOIST-AT ?auto_21619 ?auto_21625 ) ( AVAILABLE ?auto_21619 ) ( SURFACE-AT ?auto_21603 ?auto_21625 ) ( ON ?auto_21603 ?auto_21617 ) ( CLEAR ?auto_21603 ) ( not ( = ?auto_21602 ?auto_21603 ) ) ( not ( = ?auto_21602 ?auto_21617 ) ) ( not ( = ?auto_21603 ?auto_21617 ) ) ( not ( = ?auto_21607 ?auto_21619 ) ) ( IS-CRATE ?auto_21602 ) ( not ( = ?auto_21626 ?auto_21610 ) ) ( HOIST-AT ?auto_21621 ?auto_21626 ) ( AVAILABLE ?auto_21621 ) ( SURFACE-AT ?auto_21602 ?auto_21626 ) ( ON ?auto_21602 ?auto_21627 ) ( CLEAR ?auto_21602 ) ( not ( = ?auto_21601 ?auto_21602 ) ) ( not ( = ?auto_21601 ?auto_21627 ) ) ( not ( = ?auto_21602 ?auto_21627 ) ) ( not ( = ?auto_21607 ?auto_21621 ) ) ( IS-CRATE ?auto_21601 ) ( not ( = ?auto_21614 ?auto_21610 ) ) ( HOIST-AT ?auto_21613 ?auto_21614 ) ( AVAILABLE ?auto_21613 ) ( SURFACE-AT ?auto_21601 ?auto_21614 ) ( ON ?auto_21601 ?auto_21616 ) ( CLEAR ?auto_21601 ) ( not ( = ?auto_21600 ?auto_21601 ) ) ( not ( = ?auto_21600 ?auto_21616 ) ) ( not ( = ?auto_21601 ?auto_21616 ) ) ( not ( = ?auto_21607 ?auto_21613 ) ) ( IS-CRATE ?auto_21600 ) ( not ( = ?auto_21622 ?auto_21610 ) ) ( HOIST-AT ?auto_21612 ?auto_21622 ) ( AVAILABLE ?auto_21612 ) ( SURFACE-AT ?auto_21600 ?auto_21622 ) ( ON ?auto_21600 ?auto_21629 ) ( CLEAR ?auto_21600 ) ( not ( = ?auto_21599 ?auto_21600 ) ) ( not ( = ?auto_21599 ?auto_21629 ) ) ( not ( = ?auto_21600 ?auto_21629 ) ) ( not ( = ?auto_21607 ?auto_21612 ) ) ( SURFACE-AT ?auto_21598 ?auto_21610 ) ( CLEAR ?auto_21598 ) ( IS-CRATE ?auto_21599 ) ( AVAILABLE ?auto_21607 ) ( not ( = ?auto_21618 ?auto_21610 ) ) ( HOIST-AT ?auto_21623 ?auto_21618 ) ( AVAILABLE ?auto_21623 ) ( SURFACE-AT ?auto_21599 ?auto_21618 ) ( ON ?auto_21599 ?auto_21628 ) ( CLEAR ?auto_21599 ) ( TRUCK-AT ?auto_21609 ?auto_21610 ) ( not ( = ?auto_21598 ?auto_21599 ) ) ( not ( = ?auto_21598 ?auto_21628 ) ) ( not ( = ?auto_21599 ?auto_21628 ) ) ( not ( = ?auto_21607 ?auto_21623 ) ) ( not ( = ?auto_21598 ?auto_21600 ) ) ( not ( = ?auto_21598 ?auto_21629 ) ) ( not ( = ?auto_21600 ?auto_21628 ) ) ( not ( = ?auto_21622 ?auto_21618 ) ) ( not ( = ?auto_21612 ?auto_21623 ) ) ( not ( = ?auto_21629 ?auto_21628 ) ) ( not ( = ?auto_21598 ?auto_21601 ) ) ( not ( = ?auto_21598 ?auto_21616 ) ) ( not ( = ?auto_21599 ?auto_21601 ) ) ( not ( = ?auto_21599 ?auto_21616 ) ) ( not ( = ?auto_21601 ?auto_21629 ) ) ( not ( = ?auto_21601 ?auto_21628 ) ) ( not ( = ?auto_21614 ?auto_21622 ) ) ( not ( = ?auto_21614 ?auto_21618 ) ) ( not ( = ?auto_21613 ?auto_21612 ) ) ( not ( = ?auto_21613 ?auto_21623 ) ) ( not ( = ?auto_21616 ?auto_21629 ) ) ( not ( = ?auto_21616 ?auto_21628 ) ) ( not ( = ?auto_21598 ?auto_21602 ) ) ( not ( = ?auto_21598 ?auto_21627 ) ) ( not ( = ?auto_21599 ?auto_21602 ) ) ( not ( = ?auto_21599 ?auto_21627 ) ) ( not ( = ?auto_21600 ?auto_21602 ) ) ( not ( = ?auto_21600 ?auto_21627 ) ) ( not ( = ?auto_21602 ?auto_21616 ) ) ( not ( = ?auto_21602 ?auto_21629 ) ) ( not ( = ?auto_21602 ?auto_21628 ) ) ( not ( = ?auto_21626 ?auto_21614 ) ) ( not ( = ?auto_21626 ?auto_21622 ) ) ( not ( = ?auto_21626 ?auto_21618 ) ) ( not ( = ?auto_21621 ?auto_21613 ) ) ( not ( = ?auto_21621 ?auto_21612 ) ) ( not ( = ?auto_21621 ?auto_21623 ) ) ( not ( = ?auto_21627 ?auto_21616 ) ) ( not ( = ?auto_21627 ?auto_21629 ) ) ( not ( = ?auto_21627 ?auto_21628 ) ) ( not ( = ?auto_21598 ?auto_21603 ) ) ( not ( = ?auto_21598 ?auto_21617 ) ) ( not ( = ?auto_21599 ?auto_21603 ) ) ( not ( = ?auto_21599 ?auto_21617 ) ) ( not ( = ?auto_21600 ?auto_21603 ) ) ( not ( = ?auto_21600 ?auto_21617 ) ) ( not ( = ?auto_21601 ?auto_21603 ) ) ( not ( = ?auto_21601 ?auto_21617 ) ) ( not ( = ?auto_21603 ?auto_21627 ) ) ( not ( = ?auto_21603 ?auto_21616 ) ) ( not ( = ?auto_21603 ?auto_21629 ) ) ( not ( = ?auto_21603 ?auto_21628 ) ) ( not ( = ?auto_21625 ?auto_21626 ) ) ( not ( = ?auto_21625 ?auto_21614 ) ) ( not ( = ?auto_21625 ?auto_21622 ) ) ( not ( = ?auto_21625 ?auto_21618 ) ) ( not ( = ?auto_21619 ?auto_21621 ) ) ( not ( = ?auto_21619 ?auto_21613 ) ) ( not ( = ?auto_21619 ?auto_21612 ) ) ( not ( = ?auto_21619 ?auto_21623 ) ) ( not ( = ?auto_21617 ?auto_21627 ) ) ( not ( = ?auto_21617 ?auto_21616 ) ) ( not ( = ?auto_21617 ?auto_21629 ) ) ( not ( = ?auto_21617 ?auto_21628 ) ) ( not ( = ?auto_21598 ?auto_21604 ) ) ( not ( = ?auto_21598 ?auto_21624 ) ) ( not ( = ?auto_21599 ?auto_21604 ) ) ( not ( = ?auto_21599 ?auto_21624 ) ) ( not ( = ?auto_21600 ?auto_21604 ) ) ( not ( = ?auto_21600 ?auto_21624 ) ) ( not ( = ?auto_21601 ?auto_21604 ) ) ( not ( = ?auto_21601 ?auto_21624 ) ) ( not ( = ?auto_21602 ?auto_21604 ) ) ( not ( = ?auto_21602 ?auto_21624 ) ) ( not ( = ?auto_21604 ?auto_21617 ) ) ( not ( = ?auto_21604 ?auto_21627 ) ) ( not ( = ?auto_21604 ?auto_21616 ) ) ( not ( = ?auto_21604 ?auto_21629 ) ) ( not ( = ?auto_21604 ?auto_21628 ) ) ( not ( = ?auto_21620 ?auto_21625 ) ) ( not ( = ?auto_21620 ?auto_21626 ) ) ( not ( = ?auto_21620 ?auto_21614 ) ) ( not ( = ?auto_21620 ?auto_21622 ) ) ( not ( = ?auto_21620 ?auto_21618 ) ) ( not ( = ?auto_21615 ?auto_21619 ) ) ( not ( = ?auto_21615 ?auto_21621 ) ) ( not ( = ?auto_21615 ?auto_21613 ) ) ( not ( = ?auto_21615 ?auto_21612 ) ) ( not ( = ?auto_21615 ?auto_21623 ) ) ( not ( = ?auto_21624 ?auto_21617 ) ) ( not ( = ?auto_21624 ?auto_21627 ) ) ( not ( = ?auto_21624 ?auto_21616 ) ) ( not ( = ?auto_21624 ?auto_21629 ) ) ( not ( = ?auto_21624 ?auto_21628 ) ) ( not ( = ?auto_21598 ?auto_21605 ) ) ( not ( = ?auto_21598 ?auto_21608 ) ) ( not ( = ?auto_21599 ?auto_21605 ) ) ( not ( = ?auto_21599 ?auto_21608 ) ) ( not ( = ?auto_21600 ?auto_21605 ) ) ( not ( = ?auto_21600 ?auto_21608 ) ) ( not ( = ?auto_21601 ?auto_21605 ) ) ( not ( = ?auto_21601 ?auto_21608 ) ) ( not ( = ?auto_21602 ?auto_21605 ) ) ( not ( = ?auto_21602 ?auto_21608 ) ) ( not ( = ?auto_21603 ?auto_21605 ) ) ( not ( = ?auto_21603 ?auto_21608 ) ) ( not ( = ?auto_21605 ?auto_21624 ) ) ( not ( = ?auto_21605 ?auto_21617 ) ) ( not ( = ?auto_21605 ?auto_21627 ) ) ( not ( = ?auto_21605 ?auto_21616 ) ) ( not ( = ?auto_21605 ?auto_21629 ) ) ( not ( = ?auto_21605 ?auto_21628 ) ) ( not ( = ?auto_21606 ?auto_21620 ) ) ( not ( = ?auto_21606 ?auto_21625 ) ) ( not ( = ?auto_21606 ?auto_21626 ) ) ( not ( = ?auto_21606 ?auto_21614 ) ) ( not ( = ?auto_21606 ?auto_21622 ) ) ( not ( = ?auto_21606 ?auto_21618 ) ) ( not ( = ?auto_21611 ?auto_21615 ) ) ( not ( = ?auto_21611 ?auto_21619 ) ) ( not ( = ?auto_21611 ?auto_21621 ) ) ( not ( = ?auto_21611 ?auto_21613 ) ) ( not ( = ?auto_21611 ?auto_21612 ) ) ( not ( = ?auto_21611 ?auto_21623 ) ) ( not ( = ?auto_21608 ?auto_21624 ) ) ( not ( = ?auto_21608 ?auto_21617 ) ) ( not ( = ?auto_21608 ?auto_21627 ) ) ( not ( = ?auto_21608 ?auto_21616 ) ) ( not ( = ?auto_21608 ?auto_21629 ) ) ( not ( = ?auto_21608 ?auto_21628 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_21598 ?auto_21599 ?auto_21600 ?auto_21601 ?auto_21602 ?auto_21603 ?auto_21604 )
      ( MAKE-1CRATE ?auto_21604 ?auto_21605 )
      ( MAKE-7CRATE-VERIFY ?auto_21598 ?auto_21599 ?auto_21600 ?auto_21601 ?auto_21602 ?auto_21603 ?auto_21604 ?auto_21605 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21632 - SURFACE
      ?auto_21633 - SURFACE
    )
    :vars
    (
      ?auto_21634 - HOIST
      ?auto_21635 - PLACE
      ?auto_21637 - PLACE
      ?auto_21638 - HOIST
      ?auto_21639 - SURFACE
      ?auto_21636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21634 ?auto_21635 ) ( SURFACE-AT ?auto_21632 ?auto_21635 ) ( CLEAR ?auto_21632 ) ( IS-CRATE ?auto_21633 ) ( AVAILABLE ?auto_21634 ) ( not ( = ?auto_21637 ?auto_21635 ) ) ( HOIST-AT ?auto_21638 ?auto_21637 ) ( AVAILABLE ?auto_21638 ) ( SURFACE-AT ?auto_21633 ?auto_21637 ) ( ON ?auto_21633 ?auto_21639 ) ( CLEAR ?auto_21633 ) ( TRUCK-AT ?auto_21636 ?auto_21635 ) ( not ( = ?auto_21632 ?auto_21633 ) ) ( not ( = ?auto_21632 ?auto_21639 ) ) ( not ( = ?auto_21633 ?auto_21639 ) ) ( not ( = ?auto_21634 ?auto_21638 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21636 ?auto_21635 ?auto_21637 )
      ( !LIFT ?auto_21638 ?auto_21633 ?auto_21639 ?auto_21637 )
      ( !LOAD ?auto_21638 ?auto_21633 ?auto_21636 ?auto_21637 )
      ( !DRIVE ?auto_21636 ?auto_21637 ?auto_21635 )
      ( !UNLOAD ?auto_21634 ?auto_21633 ?auto_21636 ?auto_21635 )
      ( !DROP ?auto_21634 ?auto_21633 ?auto_21632 ?auto_21635 )
      ( MAKE-1CRATE-VERIFY ?auto_21632 ?auto_21633 ) )
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
      ?auto_21657 - SURFACE
      ?auto_21656 - SURFACE
    )
    :vars
    (
      ?auto_21660 - HOIST
      ?auto_21658 - PLACE
      ?auto_21659 - PLACE
      ?auto_21662 - HOIST
      ?auto_21663 - SURFACE
      ?auto_21683 - PLACE
      ?auto_21682 - HOIST
      ?auto_21681 - SURFACE
      ?auto_21673 - PLACE
      ?auto_21670 - HOIST
      ?auto_21677 - SURFACE
      ?auto_21678 - PLACE
      ?auto_21679 - HOIST
      ?auto_21665 - SURFACE
      ?auto_21669 - PLACE
      ?auto_21675 - HOIST
      ?auto_21672 - SURFACE
      ?auto_21668 - PLACE
      ?auto_21667 - HOIST
      ?auto_21666 - SURFACE
      ?auto_21674 - PLACE
      ?auto_21684 - HOIST
      ?auto_21664 - SURFACE
      ?auto_21680 - PLACE
      ?auto_21676 - HOIST
      ?auto_21671 - SURFACE
      ?auto_21661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21660 ?auto_21658 ) ( IS-CRATE ?auto_21656 ) ( not ( = ?auto_21659 ?auto_21658 ) ) ( HOIST-AT ?auto_21662 ?auto_21659 ) ( AVAILABLE ?auto_21662 ) ( SURFACE-AT ?auto_21656 ?auto_21659 ) ( ON ?auto_21656 ?auto_21663 ) ( CLEAR ?auto_21656 ) ( not ( = ?auto_21657 ?auto_21656 ) ) ( not ( = ?auto_21657 ?auto_21663 ) ) ( not ( = ?auto_21656 ?auto_21663 ) ) ( not ( = ?auto_21660 ?auto_21662 ) ) ( IS-CRATE ?auto_21657 ) ( not ( = ?auto_21683 ?auto_21658 ) ) ( HOIST-AT ?auto_21682 ?auto_21683 ) ( AVAILABLE ?auto_21682 ) ( SURFACE-AT ?auto_21657 ?auto_21683 ) ( ON ?auto_21657 ?auto_21681 ) ( CLEAR ?auto_21657 ) ( not ( = ?auto_21655 ?auto_21657 ) ) ( not ( = ?auto_21655 ?auto_21681 ) ) ( not ( = ?auto_21657 ?auto_21681 ) ) ( not ( = ?auto_21660 ?auto_21682 ) ) ( IS-CRATE ?auto_21655 ) ( not ( = ?auto_21673 ?auto_21658 ) ) ( HOIST-AT ?auto_21670 ?auto_21673 ) ( AVAILABLE ?auto_21670 ) ( SURFACE-AT ?auto_21655 ?auto_21673 ) ( ON ?auto_21655 ?auto_21677 ) ( CLEAR ?auto_21655 ) ( not ( = ?auto_21654 ?auto_21655 ) ) ( not ( = ?auto_21654 ?auto_21677 ) ) ( not ( = ?auto_21655 ?auto_21677 ) ) ( not ( = ?auto_21660 ?auto_21670 ) ) ( IS-CRATE ?auto_21654 ) ( not ( = ?auto_21678 ?auto_21658 ) ) ( HOIST-AT ?auto_21679 ?auto_21678 ) ( AVAILABLE ?auto_21679 ) ( SURFACE-AT ?auto_21654 ?auto_21678 ) ( ON ?auto_21654 ?auto_21665 ) ( CLEAR ?auto_21654 ) ( not ( = ?auto_21653 ?auto_21654 ) ) ( not ( = ?auto_21653 ?auto_21665 ) ) ( not ( = ?auto_21654 ?auto_21665 ) ) ( not ( = ?auto_21660 ?auto_21679 ) ) ( IS-CRATE ?auto_21653 ) ( not ( = ?auto_21669 ?auto_21658 ) ) ( HOIST-AT ?auto_21675 ?auto_21669 ) ( AVAILABLE ?auto_21675 ) ( SURFACE-AT ?auto_21653 ?auto_21669 ) ( ON ?auto_21653 ?auto_21672 ) ( CLEAR ?auto_21653 ) ( not ( = ?auto_21652 ?auto_21653 ) ) ( not ( = ?auto_21652 ?auto_21672 ) ) ( not ( = ?auto_21653 ?auto_21672 ) ) ( not ( = ?auto_21660 ?auto_21675 ) ) ( IS-CRATE ?auto_21652 ) ( not ( = ?auto_21668 ?auto_21658 ) ) ( HOIST-AT ?auto_21667 ?auto_21668 ) ( AVAILABLE ?auto_21667 ) ( SURFACE-AT ?auto_21652 ?auto_21668 ) ( ON ?auto_21652 ?auto_21666 ) ( CLEAR ?auto_21652 ) ( not ( = ?auto_21651 ?auto_21652 ) ) ( not ( = ?auto_21651 ?auto_21666 ) ) ( not ( = ?auto_21652 ?auto_21666 ) ) ( not ( = ?auto_21660 ?auto_21667 ) ) ( IS-CRATE ?auto_21651 ) ( not ( = ?auto_21674 ?auto_21658 ) ) ( HOIST-AT ?auto_21684 ?auto_21674 ) ( AVAILABLE ?auto_21684 ) ( SURFACE-AT ?auto_21651 ?auto_21674 ) ( ON ?auto_21651 ?auto_21664 ) ( CLEAR ?auto_21651 ) ( not ( = ?auto_21650 ?auto_21651 ) ) ( not ( = ?auto_21650 ?auto_21664 ) ) ( not ( = ?auto_21651 ?auto_21664 ) ) ( not ( = ?auto_21660 ?auto_21684 ) ) ( SURFACE-AT ?auto_21649 ?auto_21658 ) ( CLEAR ?auto_21649 ) ( IS-CRATE ?auto_21650 ) ( AVAILABLE ?auto_21660 ) ( not ( = ?auto_21680 ?auto_21658 ) ) ( HOIST-AT ?auto_21676 ?auto_21680 ) ( AVAILABLE ?auto_21676 ) ( SURFACE-AT ?auto_21650 ?auto_21680 ) ( ON ?auto_21650 ?auto_21671 ) ( CLEAR ?auto_21650 ) ( TRUCK-AT ?auto_21661 ?auto_21658 ) ( not ( = ?auto_21649 ?auto_21650 ) ) ( not ( = ?auto_21649 ?auto_21671 ) ) ( not ( = ?auto_21650 ?auto_21671 ) ) ( not ( = ?auto_21660 ?auto_21676 ) ) ( not ( = ?auto_21649 ?auto_21651 ) ) ( not ( = ?auto_21649 ?auto_21664 ) ) ( not ( = ?auto_21651 ?auto_21671 ) ) ( not ( = ?auto_21674 ?auto_21680 ) ) ( not ( = ?auto_21684 ?auto_21676 ) ) ( not ( = ?auto_21664 ?auto_21671 ) ) ( not ( = ?auto_21649 ?auto_21652 ) ) ( not ( = ?auto_21649 ?auto_21666 ) ) ( not ( = ?auto_21650 ?auto_21652 ) ) ( not ( = ?auto_21650 ?auto_21666 ) ) ( not ( = ?auto_21652 ?auto_21664 ) ) ( not ( = ?auto_21652 ?auto_21671 ) ) ( not ( = ?auto_21668 ?auto_21674 ) ) ( not ( = ?auto_21668 ?auto_21680 ) ) ( not ( = ?auto_21667 ?auto_21684 ) ) ( not ( = ?auto_21667 ?auto_21676 ) ) ( not ( = ?auto_21666 ?auto_21664 ) ) ( not ( = ?auto_21666 ?auto_21671 ) ) ( not ( = ?auto_21649 ?auto_21653 ) ) ( not ( = ?auto_21649 ?auto_21672 ) ) ( not ( = ?auto_21650 ?auto_21653 ) ) ( not ( = ?auto_21650 ?auto_21672 ) ) ( not ( = ?auto_21651 ?auto_21653 ) ) ( not ( = ?auto_21651 ?auto_21672 ) ) ( not ( = ?auto_21653 ?auto_21666 ) ) ( not ( = ?auto_21653 ?auto_21664 ) ) ( not ( = ?auto_21653 ?auto_21671 ) ) ( not ( = ?auto_21669 ?auto_21668 ) ) ( not ( = ?auto_21669 ?auto_21674 ) ) ( not ( = ?auto_21669 ?auto_21680 ) ) ( not ( = ?auto_21675 ?auto_21667 ) ) ( not ( = ?auto_21675 ?auto_21684 ) ) ( not ( = ?auto_21675 ?auto_21676 ) ) ( not ( = ?auto_21672 ?auto_21666 ) ) ( not ( = ?auto_21672 ?auto_21664 ) ) ( not ( = ?auto_21672 ?auto_21671 ) ) ( not ( = ?auto_21649 ?auto_21654 ) ) ( not ( = ?auto_21649 ?auto_21665 ) ) ( not ( = ?auto_21650 ?auto_21654 ) ) ( not ( = ?auto_21650 ?auto_21665 ) ) ( not ( = ?auto_21651 ?auto_21654 ) ) ( not ( = ?auto_21651 ?auto_21665 ) ) ( not ( = ?auto_21652 ?auto_21654 ) ) ( not ( = ?auto_21652 ?auto_21665 ) ) ( not ( = ?auto_21654 ?auto_21672 ) ) ( not ( = ?auto_21654 ?auto_21666 ) ) ( not ( = ?auto_21654 ?auto_21664 ) ) ( not ( = ?auto_21654 ?auto_21671 ) ) ( not ( = ?auto_21678 ?auto_21669 ) ) ( not ( = ?auto_21678 ?auto_21668 ) ) ( not ( = ?auto_21678 ?auto_21674 ) ) ( not ( = ?auto_21678 ?auto_21680 ) ) ( not ( = ?auto_21679 ?auto_21675 ) ) ( not ( = ?auto_21679 ?auto_21667 ) ) ( not ( = ?auto_21679 ?auto_21684 ) ) ( not ( = ?auto_21679 ?auto_21676 ) ) ( not ( = ?auto_21665 ?auto_21672 ) ) ( not ( = ?auto_21665 ?auto_21666 ) ) ( not ( = ?auto_21665 ?auto_21664 ) ) ( not ( = ?auto_21665 ?auto_21671 ) ) ( not ( = ?auto_21649 ?auto_21655 ) ) ( not ( = ?auto_21649 ?auto_21677 ) ) ( not ( = ?auto_21650 ?auto_21655 ) ) ( not ( = ?auto_21650 ?auto_21677 ) ) ( not ( = ?auto_21651 ?auto_21655 ) ) ( not ( = ?auto_21651 ?auto_21677 ) ) ( not ( = ?auto_21652 ?auto_21655 ) ) ( not ( = ?auto_21652 ?auto_21677 ) ) ( not ( = ?auto_21653 ?auto_21655 ) ) ( not ( = ?auto_21653 ?auto_21677 ) ) ( not ( = ?auto_21655 ?auto_21665 ) ) ( not ( = ?auto_21655 ?auto_21672 ) ) ( not ( = ?auto_21655 ?auto_21666 ) ) ( not ( = ?auto_21655 ?auto_21664 ) ) ( not ( = ?auto_21655 ?auto_21671 ) ) ( not ( = ?auto_21673 ?auto_21678 ) ) ( not ( = ?auto_21673 ?auto_21669 ) ) ( not ( = ?auto_21673 ?auto_21668 ) ) ( not ( = ?auto_21673 ?auto_21674 ) ) ( not ( = ?auto_21673 ?auto_21680 ) ) ( not ( = ?auto_21670 ?auto_21679 ) ) ( not ( = ?auto_21670 ?auto_21675 ) ) ( not ( = ?auto_21670 ?auto_21667 ) ) ( not ( = ?auto_21670 ?auto_21684 ) ) ( not ( = ?auto_21670 ?auto_21676 ) ) ( not ( = ?auto_21677 ?auto_21665 ) ) ( not ( = ?auto_21677 ?auto_21672 ) ) ( not ( = ?auto_21677 ?auto_21666 ) ) ( not ( = ?auto_21677 ?auto_21664 ) ) ( not ( = ?auto_21677 ?auto_21671 ) ) ( not ( = ?auto_21649 ?auto_21657 ) ) ( not ( = ?auto_21649 ?auto_21681 ) ) ( not ( = ?auto_21650 ?auto_21657 ) ) ( not ( = ?auto_21650 ?auto_21681 ) ) ( not ( = ?auto_21651 ?auto_21657 ) ) ( not ( = ?auto_21651 ?auto_21681 ) ) ( not ( = ?auto_21652 ?auto_21657 ) ) ( not ( = ?auto_21652 ?auto_21681 ) ) ( not ( = ?auto_21653 ?auto_21657 ) ) ( not ( = ?auto_21653 ?auto_21681 ) ) ( not ( = ?auto_21654 ?auto_21657 ) ) ( not ( = ?auto_21654 ?auto_21681 ) ) ( not ( = ?auto_21657 ?auto_21677 ) ) ( not ( = ?auto_21657 ?auto_21665 ) ) ( not ( = ?auto_21657 ?auto_21672 ) ) ( not ( = ?auto_21657 ?auto_21666 ) ) ( not ( = ?auto_21657 ?auto_21664 ) ) ( not ( = ?auto_21657 ?auto_21671 ) ) ( not ( = ?auto_21683 ?auto_21673 ) ) ( not ( = ?auto_21683 ?auto_21678 ) ) ( not ( = ?auto_21683 ?auto_21669 ) ) ( not ( = ?auto_21683 ?auto_21668 ) ) ( not ( = ?auto_21683 ?auto_21674 ) ) ( not ( = ?auto_21683 ?auto_21680 ) ) ( not ( = ?auto_21682 ?auto_21670 ) ) ( not ( = ?auto_21682 ?auto_21679 ) ) ( not ( = ?auto_21682 ?auto_21675 ) ) ( not ( = ?auto_21682 ?auto_21667 ) ) ( not ( = ?auto_21682 ?auto_21684 ) ) ( not ( = ?auto_21682 ?auto_21676 ) ) ( not ( = ?auto_21681 ?auto_21677 ) ) ( not ( = ?auto_21681 ?auto_21665 ) ) ( not ( = ?auto_21681 ?auto_21672 ) ) ( not ( = ?auto_21681 ?auto_21666 ) ) ( not ( = ?auto_21681 ?auto_21664 ) ) ( not ( = ?auto_21681 ?auto_21671 ) ) ( not ( = ?auto_21649 ?auto_21656 ) ) ( not ( = ?auto_21649 ?auto_21663 ) ) ( not ( = ?auto_21650 ?auto_21656 ) ) ( not ( = ?auto_21650 ?auto_21663 ) ) ( not ( = ?auto_21651 ?auto_21656 ) ) ( not ( = ?auto_21651 ?auto_21663 ) ) ( not ( = ?auto_21652 ?auto_21656 ) ) ( not ( = ?auto_21652 ?auto_21663 ) ) ( not ( = ?auto_21653 ?auto_21656 ) ) ( not ( = ?auto_21653 ?auto_21663 ) ) ( not ( = ?auto_21654 ?auto_21656 ) ) ( not ( = ?auto_21654 ?auto_21663 ) ) ( not ( = ?auto_21655 ?auto_21656 ) ) ( not ( = ?auto_21655 ?auto_21663 ) ) ( not ( = ?auto_21656 ?auto_21681 ) ) ( not ( = ?auto_21656 ?auto_21677 ) ) ( not ( = ?auto_21656 ?auto_21665 ) ) ( not ( = ?auto_21656 ?auto_21672 ) ) ( not ( = ?auto_21656 ?auto_21666 ) ) ( not ( = ?auto_21656 ?auto_21664 ) ) ( not ( = ?auto_21656 ?auto_21671 ) ) ( not ( = ?auto_21659 ?auto_21683 ) ) ( not ( = ?auto_21659 ?auto_21673 ) ) ( not ( = ?auto_21659 ?auto_21678 ) ) ( not ( = ?auto_21659 ?auto_21669 ) ) ( not ( = ?auto_21659 ?auto_21668 ) ) ( not ( = ?auto_21659 ?auto_21674 ) ) ( not ( = ?auto_21659 ?auto_21680 ) ) ( not ( = ?auto_21662 ?auto_21682 ) ) ( not ( = ?auto_21662 ?auto_21670 ) ) ( not ( = ?auto_21662 ?auto_21679 ) ) ( not ( = ?auto_21662 ?auto_21675 ) ) ( not ( = ?auto_21662 ?auto_21667 ) ) ( not ( = ?auto_21662 ?auto_21684 ) ) ( not ( = ?auto_21662 ?auto_21676 ) ) ( not ( = ?auto_21663 ?auto_21681 ) ) ( not ( = ?auto_21663 ?auto_21677 ) ) ( not ( = ?auto_21663 ?auto_21665 ) ) ( not ( = ?auto_21663 ?auto_21672 ) ) ( not ( = ?auto_21663 ?auto_21666 ) ) ( not ( = ?auto_21663 ?auto_21664 ) ) ( not ( = ?auto_21663 ?auto_21671 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_21649 ?auto_21650 ?auto_21651 ?auto_21652 ?auto_21653 ?auto_21654 ?auto_21655 ?auto_21657 )
      ( MAKE-1CRATE ?auto_21657 ?auto_21656 )
      ( MAKE-8CRATE-VERIFY ?auto_21649 ?auto_21650 ?auto_21651 ?auto_21652 ?auto_21653 ?auto_21654 ?auto_21655 ?auto_21657 ?auto_21656 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21687 - SURFACE
      ?auto_21688 - SURFACE
    )
    :vars
    (
      ?auto_21689 - HOIST
      ?auto_21690 - PLACE
      ?auto_21692 - PLACE
      ?auto_21693 - HOIST
      ?auto_21694 - SURFACE
      ?auto_21691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21689 ?auto_21690 ) ( SURFACE-AT ?auto_21687 ?auto_21690 ) ( CLEAR ?auto_21687 ) ( IS-CRATE ?auto_21688 ) ( AVAILABLE ?auto_21689 ) ( not ( = ?auto_21692 ?auto_21690 ) ) ( HOIST-AT ?auto_21693 ?auto_21692 ) ( AVAILABLE ?auto_21693 ) ( SURFACE-AT ?auto_21688 ?auto_21692 ) ( ON ?auto_21688 ?auto_21694 ) ( CLEAR ?auto_21688 ) ( TRUCK-AT ?auto_21691 ?auto_21690 ) ( not ( = ?auto_21687 ?auto_21688 ) ) ( not ( = ?auto_21687 ?auto_21694 ) ) ( not ( = ?auto_21688 ?auto_21694 ) ) ( not ( = ?auto_21689 ?auto_21693 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21691 ?auto_21690 ?auto_21692 )
      ( !LIFT ?auto_21693 ?auto_21688 ?auto_21694 ?auto_21692 )
      ( !LOAD ?auto_21693 ?auto_21688 ?auto_21691 ?auto_21692 )
      ( !DRIVE ?auto_21691 ?auto_21692 ?auto_21690 )
      ( !UNLOAD ?auto_21689 ?auto_21688 ?auto_21691 ?auto_21690 )
      ( !DROP ?auto_21689 ?auto_21688 ?auto_21687 ?auto_21690 )
      ( MAKE-1CRATE-VERIFY ?auto_21687 ?auto_21688 ) )
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
      ?auto_21714 - SURFACE
      ?auto_21713 - SURFACE
      ?auto_21712 - SURFACE
    )
    :vars
    (
      ?auto_21716 - HOIST
      ?auto_21717 - PLACE
      ?auto_21720 - PLACE
      ?auto_21718 - HOIST
      ?auto_21719 - SURFACE
      ?auto_21738 - PLACE
      ?auto_21740 - HOIST
      ?auto_21724 - SURFACE
      ?auto_21728 - PLACE
      ?auto_21726 - HOIST
      ?auto_21722 - SURFACE
      ?auto_21732 - PLACE
      ?auto_21737 - HOIST
      ?auto_21735 - SURFACE
      ?auto_21723 - PLACE
      ?auto_21729 - HOIST
      ?auto_21721 - SURFACE
      ?auto_21739 - PLACE
      ?auto_21733 - HOIST
      ?auto_21730 - SURFACE
      ?auto_21725 - SURFACE
      ?auto_21731 - PLACE
      ?auto_21727 - HOIST
      ?auto_21741 - SURFACE
      ?auto_21742 - PLACE
      ?auto_21734 - HOIST
      ?auto_21736 - SURFACE
      ?auto_21715 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21716 ?auto_21717 ) ( IS-CRATE ?auto_21712 ) ( not ( = ?auto_21720 ?auto_21717 ) ) ( HOIST-AT ?auto_21718 ?auto_21720 ) ( SURFACE-AT ?auto_21712 ?auto_21720 ) ( ON ?auto_21712 ?auto_21719 ) ( CLEAR ?auto_21712 ) ( not ( = ?auto_21713 ?auto_21712 ) ) ( not ( = ?auto_21713 ?auto_21719 ) ) ( not ( = ?auto_21712 ?auto_21719 ) ) ( not ( = ?auto_21716 ?auto_21718 ) ) ( IS-CRATE ?auto_21713 ) ( not ( = ?auto_21738 ?auto_21717 ) ) ( HOIST-AT ?auto_21740 ?auto_21738 ) ( AVAILABLE ?auto_21740 ) ( SURFACE-AT ?auto_21713 ?auto_21738 ) ( ON ?auto_21713 ?auto_21724 ) ( CLEAR ?auto_21713 ) ( not ( = ?auto_21714 ?auto_21713 ) ) ( not ( = ?auto_21714 ?auto_21724 ) ) ( not ( = ?auto_21713 ?auto_21724 ) ) ( not ( = ?auto_21716 ?auto_21740 ) ) ( IS-CRATE ?auto_21714 ) ( not ( = ?auto_21728 ?auto_21717 ) ) ( HOIST-AT ?auto_21726 ?auto_21728 ) ( AVAILABLE ?auto_21726 ) ( SURFACE-AT ?auto_21714 ?auto_21728 ) ( ON ?auto_21714 ?auto_21722 ) ( CLEAR ?auto_21714 ) ( not ( = ?auto_21711 ?auto_21714 ) ) ( not ( = ?auto_21711 ?auto_21722 ) ) ( not ( = ?auto_21714 ?auto_21722 ) ) ( not ( = ?auto_21716 ?auto_21726 ) ) ( IS-CRATE ?auto_21711 ) ( not ( = ?auto_21732 ?auto_21717 ) ) ( HOIST-AT ?auto_21737 ?auto_21732 ) ( AVAILABLE ?auto_21737 ) ( SURFACE-AT ?auto_21711 ?auto_21732 ) ( ON ?auto_21711 ?auto_21735 ) ( CLEAR ?auto_21711 ) ( not ( = ?auto_21710 ?auto_21711 ) ) ( not ( = ?auto_21710 ?auto_21735 ) ) ( not ( = ?auto_21711 ?auto_21735 ) ) ( not ( = ?auto_21716 ?auto_21737 ) ) ( IS-CRATE ?auto_21710 ) ( not ( = ?auto_21723 ?auto_21717 ) ) ( HOIST-AT ?auto_21729 ?auto_21723 ) ( AVAILABLE ?auto_21729 ) ( SURFACE-AT ?auto_21710 ?auto_21723 ) ( ON ?auto_21710 ?auto_21721 ) ( CLEAR ?auto_21710 ) ( not ( = ?auto_21709 ?auto_21710 ) ) ( not ( = ?auto_21709 ?auto_21721 ) ) ( not ( = ?auto_21710 ?auto_21721 ) ) ( not ( = ?auto_21716 ?auto_21729 ) ) ( IS-CRATE ?auto_21709 ) ( not ( = ?auto_21739 ?auto_21717 ) ) ( HOIST-AT ?auto_21733 ?auto_21739 ) ( AVAILABLE ?auto_21733 ) ( SURFACE-AT ?auto_21709 ?auto_21739 ) ( ON ?auto_21709 ?auto_21730 ) ( CLEAR ?auto_21709 ) ( not ( = ?auto_21708 ?auto_21709 ) ) ( not ( = ?auto_21708 ?auto_21730 ) ) ( not ( = ?auto_21709 ?auto_21730 ) ) ( not ( = ?auto_21716 ?auto_21733 ) ) ( IS-CRATE ?auto_21708 ) ( AVAILABLE ?auto_21718 ) ( SURFACE-AT ?auto_21708 ?auto_21720 ) ( ON ?auto_21708 ?auto_21725 ) ( CLEAR ?auto_21708 ) ( not ( = ?auto_21707 ?auto_21708 ) ) ( not ( = ?auto_21707 ?auto_21725 ) ) ( not ( = ?auto_21708 ?auto_21725 ) ) ( IS-CRATE ?auto_21707 ) ( not ( = ?auto_21731 ?auto_21717 ) ) ( HOIST-AT ?auto_21727 ?auto_21731 ) ( AVAILABLE ?auto_21727 ) ( SURFACE-AT ?auto_21707 ?auto_21731 ) ( ON ?auto_21707 ?auto_21741 ) ( CLEAR ?auto_21707 ) ( not ( = ?auto_21706 ?auto_21707 ) ) ( not ( = ?auto_21706 ?auto_21741 ) ) ( not ( = ?auto_21707 ?auto_21741 ) ) ( not ( = ?auto_21716 ?auto_21727 ) ) ( SURFACE-AT ?auto_21705 ?auto_21717 ) ( CLEAR ?auto_21705 ) ( IS-CRATE ?auto_21706 ) ( AVAILABLE ?auto_21716 ) ( not ( = ?auto_21742 ?auto_21717 ) ) ( HOIST-AT ?auto_21734 ?auto_21742 ) ( AVAILABLE ?auto_21734 ) ( SURFACE-AT ?auto_21706 ?auto_21742 ) ( ON ?auto_21706 ?auto_21736 ) ( CLEAR ?auto_21706 ) ( TRUCK-AT ?auto_21715 ?auto_21717 ) ( not ( = ?auto_21705 ?auto_21706 ) ) ( not ( = ?auto_21705 ?auto_21736 ) ) ( not ( = ?auto_21706 ?auto_21736 ) ) ( not ( = ?auto_21716 ?auto_21734 ) ) ( not ( = ?auto_21705 ?auto_21707 ) ) ( not ( = ?auto_21705 ?auto_21741 ) ) ( not ( = ?auto_21707 ?auto_21736 ) ) ( not ( = ?auto_21731 ?auto_21742 ) ) ( not ( = ?auto_21727 ?auto_21734 ) ) ( not ( = ?auto_21741 ?auto_21736 ) ) ( not ( = ?auto_21705 ?auto_21708 ) ) ( not ( = ?auto_21705 ?auto_21725 ) ) ( not ( = ?auto_21706 ?auto_21708 ) ) ( not ( = ?auto_21706 ?auto_21725 ) ) ( not ( = ?auto_21708 ?auto_21741 ) ) ( not ( = ?auto_21708 ?auto_21736 ) ) ( not ( = ?auto_21720 ?auto_21731 ) ) ( not ( = ?auto_21720 ?auto_21742 ) ) ( not ( = ?auto_21718 ?auto_21727 ) ) ( not ( = ?auto_21718 ?auto_21734 ) ) ( not ( = ?auto_21725 ?auto_21741 ) ) ( not ( = ?auto_21725 ?auto_21736 ) ) ( not ( = ?auto_21705 ?auto_21709 ) ) ( not ( = ?auto_21705 ?auto_21730 ) ) ( not ( = ?auto_21706 ?auto_21709 ) ) ( not ( = ?auto_21706 ?auto_21730 ) ) ( not ( = ?auto_21707 ?auto_21709 ) ) ( not ( = ?auto_21707 ?auto_21730 ) ) ( not ( = ?auto_21709 ?auto_21725 ) ) ( not ( = ?auto_21709 ?auto_21741 ) ) ( not ( = ?auto_21709 ?auto_21736 ) ) ( not ( = ?auto_21739 ?auto_21720 ) ) ( not ( = ?auto_21739 ?auto_21731 ) ) ( not ( = ?auto_21739 ?auto_21742 ) ) ( not ( = ?auto_21733 ?auto_21718 ) ) ( not ( = ?auto_21733 ?auto_21727 ) ) ( not ( = ?auto_21733 ?auto_21734 ) ) ( not ( = ?auto_21730 ?auto_21725 ) ) ( not ( = ?auto_21730 ?auto_21741 ) ) ( not ( = ?auto_21730 ?auto_21736 ) ) ( not ( = ?auto_21705 ?auto_21710 ) ) ( not ( = ?auto_21705 ?auto_21721 ) ) ( not ( = ?auto_21706 ?auto_21710 ) ) ( not ( = ?auto_21706 ?auto_21721 ) ) ( not ( = ?auto_21707 ?auto_21710 ) ) ( not ( = ?auto_21707 ?auto_21721 ) ) ( not ( = ?auto_21708 ?auto_21710 ) ) ( not ( = ?auto_21708 ?auto_21721 ) ) ( not ( = ?auto_21710 ?auto_21730 ) ) ( not ( = ?auto_21710 ?auto_21725 ) ) ( not ( = ?auto_21710 ?auto_21741 ) ) ( not ( = ?auto_21710 ?auto_21736 ) ) ( not ( = ?auto_21723 ?auto_21739 ) ) ( not ( = ?auto_21723 ?auto_21720 ) ) ( not ( = ?auto_21723 ?auto_21731 ) ) ( not ( = ?auto_21723 ?auto_21742 ) ) ( not ( = ?auto_21729 ?auto_21733 ) ) ( not ( = ?auto_21729 ?auto_21718 ) ) ( not ( = ?auto_21729 ?auto_21727 ) ) ( not ( = ?auto_21729 ?auto_21734 ) ) ( not ( = ?auto_21721 ?auto_21730 ) ) ( not ( = ?auto_21721 ?auto_21725 ) ) ( not ( = ?auto_21721 ?auto_21741 ) ) ( not ( = ?auto_21721 ?auto_21736 ) ) ( not ( = ?auto_21705 ?auto_21711 ) ) ( not ( = ?auto_21705 ?auto_21735 ) ) ( not ( = ?auto_21706 ?auto_21711 ) ) ( not ( = ?auto_21706 ?auto_21735 ) ) ( not ( = ?auto_21707 ?auto_21711 ) ) ( not ( = ?auto_21707 ?auto_21735 ) ) ( not ( = ?auto_21708 ?auto_21711 ) ) ( not ( = ?auto_21708 ?auto_21735 ) ) ( not ( = ?auto_21709 ?auto_21711 ) ) ( not ( = ?auto_21709 ?auto_21735 ) ) ( not ( = ?auto_21711 ?auto_21721 ) ) ( not ( = ?auto_21711 ?auto_21730 ) ) ( not ( = ?auto_21711 ?auto_21725 ) ) ( not ( = ?auto_21711 ?auto_21741 ) ) ( not ( = ?auto_21711 ?auto_21736 ) ) ( not ( = ?auto_21732 ?auto_21723 ) ) ( not ( = ?auto_21732 ?auto_21739 ) ) ( not ( = ?auto_21732 ?auto_21720 ) ) ( not ( = ?auto_21732 ?auto_21731 ) ) ( not ( = ?auto_21732 ?auto_21742 ) ) ( not ( = ?auto_21737 ?auto_21729 ) ) ( not ( = ?auto_21737 ?auto_21733 ) ) ( not ( = ?auto_21737 ?auto_21718 ) ) ( not ( = ?auto_21737 ?auto_21727 ) ) ( not ( = ?auto_21737 ?auto_21734 ) ) ( not ( = ?auto_21735 ?auto_21721 ) ) ( not ( = ?auto_21735 ?auto_21730 ) ) ( not ( = ?auto_21735 ?auto_21725 ) ) ( not ( = ?auto_21735 ?auto_21741 ) ) ( not ( = ?auto_21735 ?auto_21736 ) ) ( not ( = ?auto_21705 ?auto_21714 ) ) ( not ( = ?auto_21705 ?auto_21722 ) ) ( not ( = ?auto_21706 ?auto_21714 ) ) ( not ( = ?auto_21706 ?auto_21722 ) ) ( not ( = ?auto_21707 ?auto_21714 ) ) ( not ( = ?auto_21707 ?auto_21722 ) ) ( not ( = ?auto_21708 ?auto_21714 ) ) ( not ( = ?auto_21708 ?auto_21722 ) ) ( not ( = ?auto_21709 ?auto_21714 ) ) ( not ( = ?auto_21709 ?auto_21722 ) ) ( not ( = ?auto_21710 ?auto_21714 ) ) ( not ( = ?auto_21710 ?auto_21722 ) ) ( not ( = ?auto_21714 ?auto_21735 ) ) ( not ( = ?auto_21714 ?auto_21721 ) ) ( not ( = ?auto_21714 ?auto_21730 ) ) ( not ( = ?auto_21714 ?auto_21725 ) ) ( not ( = ?auto_21714 ?auto_21741 ) ) ( not ( = ?auto_21714 ?auto_21736 ) ) ( not ( = ?auto_21728 ?auto_21732 ) ) ( not ( = ?auto_21728 ?auto_21723 ) ) ( not ( = ?auto_21728 ?auto_21739 ) ) ( not ( = ?auto_21728 ?auto_21720 ) ) ( not ( = ?auto_21728 ?auto_21731 ) ) ( not ( = ?auto_21728 ?auto_21742 ) ) ( not ( = ?auto_21726 ?auto_21737 ) ) ( not ( = ?auto_21726 ?auto_21729 ) ) ( not ( = ?auto_21726 ?auto_21733 ) ) ( not ( = ?auto_21726 ?auto_21718 ) ) ( not ( = ?auto_21726 ?auto_21727 ) ) ( not ( = ?auto_21726 ?auto_21734 ) ) ( not ( = ?auto_21722 ?auto_21735 ) ) ( not ( = ?auto_21722 ?auto_21721 ) ) ( not ( = ?auto_21722 ?auto_21730 ) ) ( not ( = ?auto_21722 ?auto_21725 ) ) ( not ( = ?auto_21722 ?auto_21741 ) ) ( not ( = ?auto_21722 ?auto_21736 ) ) ( not ( = ?auto_21705 ?auto_21713 ) ) ( not ( = ?auto_21705 ?auto_21724 ) ) ( not ( = ?auto_21706 ?auto_21713 ) ) ( not ( = ?auto_21706 ?auto_21724 ) ) ( not ( = ?auto_21707 ?auto_21713 ) ) ( not ( = ?auto_21707 ?auto_21724 ) ) ( not ( = ?auto_21708 ?auto_21713 ) ) ( not ( = ?auto_21708 ?auto_21724 ) ) ( not ( = ?auto_21709 ?auto_21713 ) ) ( not ( = ?auto_21709 ?auto_21724 ) ) ( not ( = ?auto_21710 ?auto_21713 ) ) ( not ( = ?auto_21710 ?auto_21724 ) ) ( not ( = ?auto_21711 ?auto_21713 ) ) ( not ( = ?auto_21711 ?auto_21724 ) ) ( not ( = ?auto_21713 ?auto_21722 ) ) ( not ( = ?auto_21713 ?auto_21735 ) ) ( not ( = ?auto_21713 ?auto_21721 ) ) ( not ( = ?auto_21713 ?auto_21730 ) ) ( not ( = ?auto_21713 ?auto_21725 ) ) ( not ( = ?auto_21713 ?auto_21741 ) ) ( not ( = ?auto_21713 ?auto_21736 ) ) ( not ( = ?auto_21738 ?auto_21728 ) ) ( not ( = ?auto_21738 ?auto_21732 ) ) ( not ( = ?auto_21738 ?auto_21723 ) ) ( not ( = ?auto_21738 ?auto_21739 ) ) ( not ( = ?auto_21738 ?auto_21720 ) ) ( not ( = ?auto_21738 ?auto_21731 ) ) ( not ( = ?auto_21738 ?auto_21742 ) ) ( not ( = ?auto_21740 ?auto_21726 ) ) ( not ( = ?auto_21740 ?auto_21737 ) ) ( not ( = ?auto_21740 ?auto_21729 ) ) ( not ( = ?auto_21740 ?auto_21733 ) ) ( not ( = ?auto_21740 ?auto_21718 ) ) ( not ( = ?auto_21740 ?auto_21727 ) ) ( not ( = ?auto_21740 ?auto_21734 ) ) ( not ( = ?auto_21724 ?auto_21722 ) ) ( not ( = ?auto_21724 ?auto_21735 ) ) ( not ( = ?auto_21724 ?auto_21721 ) ) ( not ( = ?auto_21724 ?auto_21730 ) ) ( not ( = ?auto_21724 ?auto_21725 ) ) ( not ( = ?auto_21724 ?auto_21741 ) ) ( not ( = ?auto_21724 ?auto_21736 ) ) ( not ( = ?auto_21705 ?auto_21712 ) ) ( not ( = ?auto_21705 ?auto_21719 ) ) ( not ( = ?auto_21706 ?auto_21712 ) ) ( not ( = ?auto_21706 ?auto_21719 ) ) ( not ( = ?auto_21707 ?auto_21712 ) ) ( not ( = ?auto_21707 ?auto_21719 ) ) ( not ( = ?auto_21708 ?auto_21712 ) ) ( not ( = ?auto_21708 ?auto_21719 ) ) ( not ( = ?auto_21709 ?auto_21712 ) ) ( not ( = ?auto_21709 ?auto_21719 ) ) ( not ( = ?auto_21710 ?auto_21712 ) ) ( not ( = ?auto_21710 ?auto_21719 ) ) ( not ( = ?auto_21711 ?auto_21712 ) ) ( not ( = ?auto_21711 ?auto_21719 ) ) ( not ( = ?auto_21714 ?auto_21712 ) ) ( not ( = ?auto_21714 ?auto_21719 ) ) ( not ( = ?auto_21712 ?auto_21724 ) ) ( not ( = ?auto_21712 ?auto_21722 ) ) ( not ( = ?auto_21712 ?auto_21735 ) ) ( not ( = ?auto_21712 ?auto_21721 ) ) ( not ( = ?auto_21712 ?auto_21730 ) ) ( not ( = ?auto_21712 ?auto_21725 ) ) ( not ( = ?auto_21712 ?auto_21741 ) ) ( not ( = ?auto_21712 ?auto_21736 ) ) ( not ( = ?auto_21719 ?auto_21724 ) ) ( not ( = ?auto_21719 ?auto_21722 ) ) ( not ( = ?auto_21719 ?auto_21735 ) ) ( not ( = ?auto_21719 ?auto_21721 ) ) ( not ( = ?auto_21719 ?auto_21730 ) ) ( not ( = ?auto_21719 ?auto_21725 ) ) ( not ( = ?auto_21719 ?auto_21741 ) ) ( not ( = ?auto_21719 ?auto_21736 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_21705 ?auto_21706 ?auto_21707 ?auto_21708 ?auto_21709 ?auto_21710 ?auto_21711 ?auto_21714 ?auto_21713 )
      ( MAKE-1CRATE ?auto_21713 ?auto_21712 )
      ( MAKE-9CRATE-VERIFY ?auto_21705 ?auto_21706 ?auto_21707 ?auto_21708 ?auto_21709 ?auto_21710 ?auto_21711 ?auto_21714 ?auto_21713 ?auto_21712 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21745 - SURFACE
      ?auto_21746 - SURFACE
    )
    :vars
    (
      ?auto_21747 - HOIST
      ?auto_21748 - PLACE
      ?auto_21750 - PLACE
      ?auto_21751 - HOIST
      ?auto_21752 - SURFACE
      ?auto_21749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21747 ?auto_21748 ) ( SURFACE-AT ?auto_21745 ?auto_21748 ) ( CLEAR ?auto_21745 ) ( IS-CRATE ?auto_21746 ) ( AVAILABLE ?auto_21747 ) ( not ( = ?auto_21750 ?auto_21748 ) ) ( HOIST-AT ?auto_21751 ?auto_21750 ) ( AVAILABLE ?auto_21751 ) ( SURFACE-AT ?auto_21746 ?auto_21750 ) ( ON ?auto_21746 ?auto_21752 ) ( CLEAR ?auto_21746 ) ( TRUCK-AT ?auto_21749 ?auto_21748 ) ( not ( = ?auto_21745 ?auto_21746 ) ) ( not ( = ?auto_21745 ?auto_21752 ) ) ( not ( = ?auto_21746 ?auto_21752 ) ) ( not ( = ?auto_21747 ?auto_21751 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21749 ?auto_21748 ?auto_21750 )
      ( !LIFT ?auto_21751 ?auto_21746 ?auto_21752 ?auto_21750 )
      ( !LOAD ?auto_21751 ?auto_21746 ?auto_21749 ?auto_21750 )
      ( !DRIVE ?auto_21749 ?auto_21750 ?auto_21748 )
      ( !UNLOAD ?auto_21747 ?auto_21746 ?auto_21749 ?auto_21748 )
      ( !DROP ?auto_21747 ?auto_21746 ?auto_21745 ?auto_21748 )
      ( MAKE-1CRATE-VERIFY ?auto_21745 ?auto_21746 ) )
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
      ?auto_21773 - SURFACE
      ?auto_21772 - SURFACE
      ?auto_21771 - SURFACE
      ?auto_21774 - SURFACE
    )
    :vars
    (
      ?auto_21777 - HOIST
      ?auto_21776 - PLACE
      ?auto_21775 - PLACE
      ?auto_21778 - HOIST
      ?auto_21780 - SURFACE
      ?auto_21789 - PLACE
      ?auto_21791 - HOIST
      ?auto_21786 - SURFACE
      ?auto_21787 - PLACE
      ?auto_21784 - HOIST
      ?auto_21788 - SURFACE
      ?auto_21802 - PLACE
      ?auto_21804 - HOIST
      ?auto_21801 - SURFACE
      ?auto_21799 - PLACE
      ?auto_21783 - HOIST
      ?auto_21790 - SURFACE
      ?auto_21782 - PLACE
      ?auto_21793 - HOIST
      ?auto_21800 - SURFACE
      ?auto_21798 - PLACE
      ?auto_21795 - HOIST
      ?auto_21794 - SURFACE
      ?auto_21805 - SURFACE
      ?auto_21781 - PLACE
      ?auto_21803 - HOIST
      ?auto_21785 - SURFACE
      ?auto_21792 - PLACE
      ?auto_21796 - HOIST
      ?auto_21797 - SURFACE
      ?auto_21779 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21777 ?auto_21776 ) ( IS-CRATE ?auto_21774 ) ( not ( = ?auto_21775 ?auto_21776 ) ) ( HOIST-AT ?auto_21778 ?auto_21775 ) ( AVAILABLE ?auto_21778 ) ( SURFACE-AT ?auto_21774 ?auto_21775 ) ( ON ?auto_21774 ?auto_21780 ) ( CLEAR ?auto_21774 ) ( not ( = ?auto_21771 ?auto_21774 ) ) ( not ( = ?auto_21771 ?auto_21780 ) ) ( not ( = ?auto_21774 ?auto_21780 ) ) ( not ( = ?auto_21777 ?auto_21778 ) ) ( IS-CRATE ?auto_21771 ) ( not ( = ?auto_21789 ?auto_21776 ) ) ( HOIST-AT ?auto_21791 ?auto_21789 ) ( SURFACE-AT ?auto_21771 ?auto_21789 ) ( ON ?auto_21771 ?auto_21786 ) ( CLEAR ?auto_21771 ) ( not ( = ?auto_21772 ?auto_21771 ) ) ( not ( = ?auto_21772 ?auto_21786 ) ) ( not ( = ?auto_21771 ?auto_21786 ) ) ( not ( = ?auto_21777 ?auto_21791 ) ) ( IS-CRATE ?auto_21772 ) ( not ( = ?auto_21787 ?auto_21776 ) ) ( HOIST-AT ?auto_21784 ?auto_21787 ) ( AVAILABLE ?auto_21784 ) ( SURFACE-AT ?auto_21772 ?auto_21787 ) ( ON ?auto_21772 ?auto_21788 ) ( CLEAR ?auto_21772 ) ( not ( = ?auto_21773 ?auto_21772 ) ) ( not ( = ?auto_21773 ?auto_21788 ) ) ( not ( = ?auto_21772 ?auto_21788 ) ) ( not ( = ?auto_21777 ?auto_21784 ) ) ( IS-CRATE ?auto_21773 ) ( not ( = ?auto_21802 ?auto_21776 ) ) ( HOIST-AT ?auto_21804 ?auto_21802 ) ( AVAILABLE ?auto_21804 ) ( SURFACE-AT ?auto_21773 ?auto_21802 ) ( ON ?auto_21773 ?auto_21801 ) ( CLEAR ?auto_21773 ) ( not ( = ?auto_21770 ?auto_21773 ) ) ( not ( = ?auto_21770 ?auto_21801 ) ) ( not ( = ?auto_21773 ?auto_21801 ) ) ( not ( = ?auto_21777 ?auto_21804 ) ) ( IS-CRATE ?auto_21770 ) ( not ( = ?auto_21799 ?auto_21776 ) ) ( HOIST-AT ?auto_21783 ?auto_21799 ) ( AVAILABLE ?auto_21783 ) ( SURFACE-AT ?auto_21770 ?auto_21799 ) ( ON ?auto_21770 ?auto_21790 ) ( CLEAR ?auto_21770 ) ( not ( = ?auto_21769 ?auto_21770 ) ) ( not ( = ?auto_21769 ?auto_21790 ) ) ( not ( = ?auto_21770 ?auto_21790 ) ) ( not ( = ?auto_21777 ?auto_21783 ) ) ( IS-CRATE ?auto_21769 ) ( not ( = ?auto_21782 ?auto_21776 ) ) ( HOIST-AT ?auto_21793 ?auto_21782 ) ( AVAILABLE ?auto_21793 ) ( SURFACE-AT ?auto_21769 ?auto_21782 ) ( ON ?auto_21769 ?auto_21800 ) ( CLEAR ?auto_21769 ) ( not ( = ?auto_21768 ?auto_21769 ) ) ( not ( = ?auto_21768 ?auto_21800 ) ) ( not ( = ?auto_21769 ?auto_21800 ) ) ( not ( = ?auto_21777 ?auto_21793 ) ) ( IS-CRATE ?auto_21768 ) ( not ( = ?auto_21798 ?auto_21776 ) ) ( HOIST-AT ?auto_21795 ?auto_21798 ) ( AVAILABLE ?auto_21795 ) ( SURFACE-AT ?auto_21768 ?auto_21798 ) ( ON ?auto_21768 ?auto_21794 ) ( CLEAR ?auto_21768 ) ( not ( = ?auto_21767 ?auto_21768 ) ) ( not ( = ?auto_21767 ?auto_21794 ) ) ( not ( = ?auto_21768 ?auto_21794 ) ) ( not ( = ?auto_21777 ?auto_21795 ) ) ( IS-CRATE ?auto_21767 ) ( AVAILABLE ?auto_21791 ) ( SURFACE-AT ?auto_21767 ?auto_21789 ) ( ON ?auto_21767 ?auto_21805 ) ( CLEAR ?auto_21767 ) ( not ( = ?auto_21766 ?auto_21767 ) ) ( not ( = ?auto_21766 ?auto_21805 ) ) ( not ( = ?auto_21767 ?auto_21805 ) ) ( IS-CRATE ?auto_21766 ) ( not ( = ?auto_21781 ?auto_21776 ) ) ( HOIST-AT ?auto_21803 ?auto_21781 ) ( AVAILABLE ?auto_21803 ) ( SURFACE-AT ?auto_21766 ?auto_21781 ) ( ON ?auto_21766 ?auto_21785 ) ( CLEAR ?auto_21766 ) ( not ( = ?auto_21765 ?auto_21766 ) ) ( not ( = ?auto_21765 ?auto_21785 ) ) ( not ( = ?auto_21766 ?auto_21785 ) ) ( not ( = ?auto_21777 ?auto_21803 ) ) ( SURFACE-AT ?auto_21764 ?auto_21776 ) ( CLEAR ?auto_21764 ) ( IS-CRATE ?auto_21765 ) ( AVAILABLE ?auto_21777 ) ( not ( = ?auto_21792 ?auto_21776 ) ) ( HOIST-AT ?auto_21796 ?auto_21792 ) ( AVAILABLE ?auto_21796 ) ( SURFACE-AT ?auto_21765 ?auto_21792 ) ( ON ?auto_21765 ?auto_21797 ) ( CLEAR ?auto_21765 ) ( TRUCK-AT ?auto_21779 ?auto_21776 ) ( not ( = ?auto_21764 ?auto_21765 ) ) ( not ( = ?auto_21764 ?auto_21797 ) ) ( not ( = ?auto_21765 ?auto_21797 ) ) ( not ( = ?auto_21777 ?auto_21796 ) ) ( not ( = ?auto_21764 ?auto_21766 ) ) ( not ( = ?auto_21764 ?auto_21785 ) ) ( not ( = ?auto_21766 ?auto_21797 ) ) ( not ( = ?auto_21781 ?auto_21792 ) ) ( not ( = ?auto_21803 ?auto_21796 ) ) ( not ( = ?auto_21785 ?auto_21797 ) ) ( not ( = ?auto_21764 ?auto_21767 ) ) ( not ( = ?auto_21764 ?auto_21805 ) ) ( not ( = ?auto_21765 ?auto_21767 ) ) ( not ( = ?auto_21765 ?auto_21805 ) ) ( not ( = ?auto_21767 ?auto_21785 ) ) ( not ( = ?auto_21767 ?auto_21797 ) ) ( not ( = ?auto_21789 ?auto_21781 ) ) ( not ( = ?auto_21789 ?auto_21792 ) ) ( not ( = ?auto_21791 ?auto_21803 ) ) ( not ( = ?auto_21791 ?auto_21796 ) ) ( not ( = ?auto_21805 ?auto_21785 ) ) ( not ( = ?auto_21805 ?auto_21797 ) ) ( not ( = ?auto_21764 ?auto_21768 ) ) ( not ( = ?auto_21764 ?auto_21794 ) ) ( not ( = ?auto_21765 ?auto_21768 ) ) ( not ( = ?auto_21765 ?auto_21794 ) ) ( not ( = ?auto_21766 ?auto_21768 ) ) ( not ( = ?auto_21766 ?auto_21794 ) ) ( not ( = ?auto_21768 ?auto_21805 ) ) ( not ( = ?auto_21768 ?auto_21785 ) ) ( not ( = ?auto_21768 ?auto_21797 ) ) ( not ( = ?auto_21798 ?auto_21789 ) ) ( not ( = ?auto_21798 ?auto_21781 ) ) ( not ( = ?auto_21798 ?auto_21792 ) ) ( not ( = ?auto_21795 ?auto_21791 ) ) ( not ( = ?auto_21795 ?auto_21803 ) ) ( not ( = ?auto_21795 ?auto_21796 ) ) ( not ( = ?auto_21794 ?auto_21805 ) ) ( not ( = ?auto_21794 ?auto_21785 ) ) ( not ( = ?auto_21794 ?auto_21797 ) ) ( not ( = ?auto_21764 ?auto_21769 ) ) ( not ( = ?auto_21764 ?auto_21800 ) ) ( not ( = ?auto_21765 ?auto_21769 ) ) ( not ( = ?auto_21765 ?auto_21800 ) ) ( not ( = ?auto_21766 ?auto_21769 ) ) ( not ( = ?auto_21766 ?auto_21800 ) ) ( not ( = ?auto_21767 ?auto_21769 ) ) ( not ( = ?auto_21767 ?auto_21800 ) ) ( not ( = ?auto_21769 ?auto_21794 ) ) ( not ( = ?auto_21769 ?auto_21805 ) ) ( not ( = ?auto_21769 ?auto_21785 ) ) ( not ( = ?auto_21769 ?auto_21797 ) ) ( not ( = ?auto_21782 ?auto_21798 ) ) ( not ( = ?auto_21782 ?auto_21789 ) ) ( not ( = ?auto_21782 ?auto_21781 ) ) ( not ( = ?auto_21782 ?auto_21792 ) ) ( not ( = ?auto_21793 ?auto_21795 ) ) ( not ( = ?auto_21793 ?auto_21791 ) ) ( not ( = ?auto_21793 ?auto_21803 ) ) ( not ( = ?auto_21793 ?auto_21796 ) ) ( not ( = ?auto_21800 ?auto_21794 ) ) ( not ( = ?auto_21800 ?auto_21805 ) ) ( not ( = ?auto_21800 ?auto_21785 ) ) ( not ( = ?auto_21800 ?auto_21797 ) ) ( not ( = ?auto_21764 ?auto_21770 ) ) ( not ( = ?auto_21764 ?auto_21790 ) ) ( not ( = ?auto_21765 ?auto_21770 ) ) ( not ( = ?auto_21765 ?auto_21790 ) ) ( not ( = ?auto_21766 ?auto_21770 ) ) ( not ( = ?auto_21766 ?auto_21790 ) ) ( not ( = ?auto_21767 ?auto_21770 ) ) ( not ( = ?auto_21767 ?auto_21790 ) ) ( not ( = ?auto_21768 ?auto_21770 ) ) ( not ( = ?auto_21768 ?auto_21790 ) ) ( not ( = ?auto_21770 ?auto_21800 ) ) ( not ( = ?auto_21770 ?auto_21794 ) ) ( not ( = ?auto_21770 ?auto_21805 ) ) ( not ( = ?auto_21770 ?auto_21785 ) ) ( not ( = ?auto_21770 ?auto_21797 ) ) ( not ( = ?auto_21799 ?auto_21782 ) ) ( not ( = ?auto_21799 ?auto_21798 ) ) ( not ( = ?auto_21799 ?auto_21789 ) ) ( not ( = ?auto_21799 ?auto_21781 ) ) ( not ( = ?auto_21799 ?auto_21792 ) ) ( not ( = ?auto_21783 ?auto_21793 ) ) ( not ( = ?auto_21783 ?auto_21795 ) ) ( not ( = ?auto_21783 ?auto_21791 ) ) ( not ( = ?auto_21783 ?auto_21803 ) ) ( not ( = ?auto_21783 ?auto_21796 ) ) ( not ( = ?auto_21790 ?auto_21800 ) ) ( not ( = ?auto_21790 ?auto_21794 ) ) ( not ( = ?auto_21790 ?auto_21805 ) ) ( not ( = ?auto_21790 ?auto_21785 ) ) ( not ( = ?auto_21790 ?auto_21797 ) ) ( not ( = ?auto_21764 ?auto_21773 ) ) ( not ( = ?auto_21764 ?auto_21801 ) ) ( not ( = ?auto_21765 ?auto_21773 ) ) ( not ( = ?auto_21765 ?auto_21801 ) ) ( not ( = ?auto_21766 ?auto_21773 ) ) ( not ( = ?auto_21766 ?auto_21801 ) ) ( not ( = ?auto_21767 ?auto_21773 ) ) ( not ( = ?auto_21767 ?auto_21801 ) ) ( not ( = ?auto_21768 ?auto_21773 ) ) ( not ( = ?auto_21768 ?auto_21801 ) ) ( not ( = ?auto_21769 ?auto_21773 ) ) ( not ( = ?auto_21769 ?auto_21801 ) ) ( not ( = ?auto_21773 ?auto_21790 ) ) ( not ( = ?auto_21773 ?auto_21800 ) ) ( not ( = ?auto_21773 ?auto_21794 ) ) ( not ( = ?auto_21773 ?auto_21805 ) ) ( not ( = ?auto_21773 ?auto_21785 ) ) ( not ( = ?auto_21773 ?auto_21797 ) ) ( not ( = ?auto_21802 ?auto_21799 ) ) ( not ( = ?auto_21802 ?auto_21782 ) ) ( not ( = ?auto_21802 ?auto_21798 ) ) ( not ( = ?auto_21802 ?auto_21789 ) ) ( not ( = ?auto_21802 ?auto_21781 ) ) ( not ( = ?auto_21802 ?auto_21792 ) ) ( not ( = ?auto_21804 ?auto_21783 ) ) ( not ( = ?auto_21804 ?auto_21793 ) ) ( not ( = ?auto_21804 ?auto_21795 ) ) ( not ( = ?auto_21804 ?auto_21791 ) ) ( not ( = ?auto_21804 ?auto_21803 ) ) ( not ( = ?auto_21804 ?auto_21796 ) ) ( not ( = ?auto_21801 ?auto_21790 ) ) ( not ( = ?auto_21801 ?auto_21800 ) ) ( not ( = ?auto_21801 ?auto_21794 ) ) ( not ( = ?auto_21801 ?auto_21805 ) ) ( not ( = ?auto_21801 ?auto_21785 ) ) ( not ( = ?auto_21801 ?auto_21797 ) ) ( not ( = ?auto_21764 ?auto_21772 ) ) ( not ( = ?auto_21764 ?auto_21788 ) ) ( not ( = ?auto_21765 ?auto_21772 ) ) ( not ( = ?auto_21765 ?auto_21788 ) ) ( not ( = ?auto_21766 ?auto_21772 ) ) ( not ( = ?auto_21766 ?auto_21788 ) ) ( not ( = ?auto_21767 ?auto_21772 ) ) ( not ( = ?auto_21767 ?auto_21788 ) ) ( not ( = ?auto_21768 ?auto_21772 ) ) ( not ( = ?auto_21768 ?auto_21788 ) ) ( not ( = ?auto_21769 ?auto_21772 ) ) ( not ( = ?auto_21769 ?auto_21788 ) ) ( not ( = ?auto_21770 ?auto_21772 ) ) ( not ( = ?auto_21770 ?auto_21788 ) ) ( not ( = ?auto_21772 ?auto_21801 ) ) ( not ( = ?auto_21772 ?auto_21790 ) ) ( not ( = ?auto_21772 ?auto_21800 ) ) ( not ( = ?auto_21772 ?auto_21794 ) ) ( not ( = ?auto_21772 ?auto_21805 ) ) ( not ( = ?auto_21772 ?auto_21785 ) ) ( not ( = ?auto_21772 ?auto_21797 ) ) ( not ( = ?auto_21787 ?auto_21802 ) ) ( not ( = ?auto_21787 ?auto_21799 ) ) ( not ( = ?auto_21787 ?auto_21782 ) ) ( not ( = ?auto_21787 ?auto_21798 ) ) ( not ( = ?auto_21787 ?auto_21789 ) ) ( not ( = ?auto_21787 ?auto_21781 ) ) ( not ( = ?auto_21787 ?auto_21792 ) ) ( not ( = ?auto_21784 ?auto_21804 ) ) ( not ( = ?auto_21784 ?auto_21783 ) ) ( not ( = ?auto_21784 ?auto_21793 ) ) ( not ( = ?auto_21784 ?auto_21795 ) ) ( not ( = ?auto_21784 ?auto_21791 ) ) ( not ( = ?auto_21784 ?auto_21803 ) ) ( not ( = ?auto_21784 ?auto_21796 ) ) ( not ( = ?auto_21788 ?auto_21801 ) ) ( not ( = ?auto_21788 ?auto_21790 ) ) ( not ( = ?auto_21788 ?auto_21800 ) ) ( not ( = ?auto_21788 ?auto_21794 ) ) ( not ( = ?auto_21788 ?auto_21805 ) ) ( not ( = ?auto_21788 ?auto_21785 ) ) ( not ( = ?auto_21788 ?auto_21797 ) ) ( not ( = ?auto_21764 ?auto_21771 ) ) ( not ( = ?auto_21764 ?auto_21786 ) ) ( not ( = ?auto_21765 ?auto_21771 ) ) ( not ( = ?auto_21765 ?auto_21786 ) ) ( not ( = ?auto_21766 ?auto_21771 ) ) ( not ( = ?auto_21766 ?auto_21786 ) ) ( not ( = ?auto_21767 ?auto_21771 ) ) ( not ( = ?auto_21767 ?auto_21786 ) ) ( not ( = ?auto_21768 ?auto_21771 ) ) ( not ( = ?auto_21768 ?auto_21786 ) ) ( not ( = ?auto_21769 ?auto_21771 ) ) ( not ( = ?auto_21769 ?auto_21786 ) ) ( not ( = ?auto_21770 ?auto_21771 ) ) ( not ( = ?auto_21770 ?auto_21786 ) ) ( not ( = ?auto_21773 ?auto_21771 ) ) ( not ( = ?auto_21773 ?auto_21786 ) ) ( not ( = ?auto_21771 ?auto_21788 ) ) ( not ( = ?auto_21771 ?auto_21801 ) ) ( not ( = ?auto_21771 ?auto_21790 ) ) ( not ( = ?auto_21771 ?auto_21800 ) ) ( not ( = ?auto_21771 ?auto_21794 ) ) ( not ( = ?auto_21771 ?auto_21805 ) ) ( not ( = ?auto_21771 ?auto_21785 ) ) ( not ( = ?auto_21771 ?auto_21797 ) ) ( not ( = ?auto_21786 ?auto_21788 ) ) ( not ( = ?auto_21786 ?auto_21801 ) ) ( not ( = ?auto_21786 ?auto_21790 ) ) ( not ( = ?auto_21786 ?auto_21800 ) ) ( not ( = ?auto_21786 ?auto_21794 ) ) ( not ( = ?auto_21786 ?auto_21805 ) ) ( not ( = ?auto_21786 ?auto_21785 ) ) ( not ( = ?auto_21786 ?auto_21797 ) ) ( not ( = ?auto_21764 ?auto_21774 ) ) ( not ( = ?auto_21764 ?auto_21780 ) ) ( not ( = ?auto_21765 ?auto_21774 ) ) ( not ( = ?auto_21765 ?auto_21780 ) ) ( not ( = ?auto_21766 ?auto_21774 ) ) ( not ( = ?auto_21766 ?auto_21780 ) ) ( not ( = ?auto_21767 ?auto_21774 ) ) ( not ( = ?auto_21767 ?auto_21780 ) ) ( not ( = ?auto_21768 ?auto_21774 ) ) ( not ( = ?auto_21768 ?auto_21780 ) ) ( not ( = ?auto_21769 ?auto_21774 ) ) ( not ( = ?auto_21769 ?auto_21780 ) ) ( not ( = ?auto_21770 ?auto_21774 ) ) ( not ( = ?auto_21770 ?auto_21780 ) ) ( not ( = ?auto_21773 ?auto_21774 ) ) ( not ( = ?auto_21773 ?auto_21780 ) ) ( not ( = ?auto_21772 ?auto_21774 ) ) ( not ( = ?auto_21772 ?auto_21780 ) ) ( not ( = ?auto_21774 ?auto_21786 ) ) ( not ( = ?auto_21774 ?auto_21788 ) ) ( not ( = ?auto_21774 ?auto_21801 ) ) ( not ( = ?auto_21774 ?auto_21790 ) ) ( not ( = ?auto_21774 ?auto_21800 ) ) ( not ( = ?auto_21774 ?auto_21794 ) ) ( not ( = ?auto_21774 ?auto_21805 ) ) ( not ( = ?auto_21774 ?auto_21785 ) ) ( not ( = ?auto_21774 ?auto_21797 ) ) ( not ( = ?auto_21775 ?auto_21789 ) ) ( not ( = ?auto_21775 ?auto_21787 ) ) ( not ( = ?auto_21775 ?auto_21802 ) ) ( not ( = ?auto_21775 ?auto_21799 ) ) ( not ( = ?auto_21775 ?auto_21782 ) ) ( not ( = ?auto_21775 ?auto_21798 ) ) ( not ( = ?auto_21775 ?auto_21781 ) ) ( not ( = ?auto_21775 ?auto_21792 ) ) ( not ( = ?auto_21778 ?auto_21791 ) ) ( not ( = ?auto_21778 ?auto_21784 ) ) ( not ( = ?auto_21778 ?auto_21804 ) ) ( not ( = ?auto_21778 ?auto_21783 ) ) ( not ( = ?auto_21778 ?auto_21793 ) ) ( not ( = ?auto_21778 ?auto_21795 ) ) ( not ( = ?auto_21778 ?auto_21803 ) ) ( not ( = ?auto_21778 ?auto_21796 ) ) ( not ( = ?auto_21780 ?auto_21786 ) ) ( not ( = ?auto_21780 ?auto_21788 ) ) ( not ( = ?auto_21780 ?auto_21801 ) ) ( not ( = ?auto_21780 ?auto_21790 ) ) ( not ( = ?auto_21780 ?auto_21800 ) ) ( not ( = ?auto_21780 ?auto_21794 ) ) ( not ( = ?auto_21780 ?auto_21805 ) ) ( not ( = ?auto_21780 ?auto_21785 ) ) ( not ( = ?auto_21780 ?auto_21797 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_21764 ?auto_21765 ?auto_21766 ?auto_21767 ?auto_21768 ?auto_21769 ?auto_21770 ?auto_21773 ?auto_21772 ?auto_21771 )
      ( MAKE-1CRATE ?auto_21771 ?auto_21774 )
      ( MAKE-10CRATE-VERIFY ?auto_21764 ?auto_21765 ?auto_21766 ?auto_21767 ?auto_21768 ?auto_21769 ?auto_21770 ?auto_21773 ?auto_21772 ?auto_21771 ?auto_21774 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21808 - SURFACE
      ?auto_21809 - SURFACE
    )
    :vars
    (
      ?auto_21810 - HOIST
      ?auto_21811 - PLACE
      ?auto_21813 - PLACE
      ?auto_21814 - HOIST
      ?auto_21815 - SURFACE
      ?auto_21812 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21810 ?auto_21811 ) ( SURFACE-AT ?auto_21808 ?auto_21811 ) ( CLEAR ?auto_21808 ) ( IS-CRATE ?auto_21809 ) ( AVAILABLE ?auto_21810 ) ( not ( = ?auto_21813 ?auto_21811 ) ) ( HOIST-AT ?auto_21814 ?auto_21813 ) ( AVAILABLE ?auto_21814 ) ( SURFACE-AT ?auto_21809 ?auto_21813 ) ( ON ?auto_21809 ?auto_21815 ) ( CLEAR ?auto_21809 ) ( TRUCK-AT ?auto_21812 ?auto_21811 ) ( not ( = ?auto_21808 ?auto_21809 ) ) ( not ( = ?auto_21808 ?auto_21815 ) ) ( not ( = ?auto_21809 ?auto_21815 ) ) ( not ( = ?auto_21810 ?auto_21814 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21812 ?auto_21811 ?auto_21813 )
      ( !LIFT ?auto_21814 ?auto_21809 ?auto_21815 ?auto_21813 )
      ( !LOAD ?auto_21814 ?auto_21809 ?auto_21812 ?auto_21813 )
      ( !DRIVE ?auto_21812 ?auto_21813 ?auto_21811 )
      ( !UNLOAD ?auto_21810 ?auto_21809 ?auto_21812 ?auto_21811 )
      ( !DROP ?auto_21810 ?auto_21809 ?auto_21808 ?auto_21811 )
      ( MAKE-1CRATE-VERIFY ?auto_21808 ?auto_21809 ) )
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
      ?auto_21837 - SURFACE
      ?auto_21836 - SURFACE
      ?auto_21835 - SURFACE
      ?auto_21838 - SURFACE
      ?auto_21839 - SURFACE
    )
    :vars
    (
      ?auto_21843 - HOIST
      ?auto_21842 - PLACE
      ?auto_21845 - PLACE
      ?auto_21844 - HOIST
      ?auto_21841 - SURFACE
      ?auto_21868 - PLACE
      ?auto_21865 - HOIST
      ?auto_21866 - SURFACE
      ?auto_21851 - SURFACE
      ?auto_21848 - PLACE
      ?auto_21852 - HOIST
      ?auto_21862 - SURFACE
      ?auto_21864 - PLACE
      ?auto_21846 - HOIST
      ?auto_21863 - SURFACE
      ?auto_21856 - PLACE
      ?auto_21854 - HOIST
      ?auto_21867 - SURFACE
      ?auto_21870 - PLACE
      ?auto_21850 - HOIST
      ?auto_21861 - SURFACE
      ?auto_21858 - PLACE
      ?auto_21847 - HOIST
      ?auto_21871 - SURFACE
      ?auto_21849 - SURFACE
      ?auto_21853 - PLACE
      ?auto_21860 - HOIST
      ?auto_21859 - SURFACE
      ?auto_21857 - PLACE
      ?auto_21869 - HOIST
      ?auto_21855 - SURFACE
      ?auto_21840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21843 ?auto_21842 ) ( IS-CRATE ?auto_21839 ) ( not ( = ?auto_21845 ?auto_21842 ) ) ( HOIST-AT ?auto_21844 ?auto_21845 ) ( SURFACE-AT ?auto_21839 ?auto_21845 ) ( ON ?auto_21839 ?auto_21841 ) ( CLEAR ?auto_21839 ) ( not ( = ?auto_21838 ?auto_21839 ) ) ( not ( = ?auto_21838 ?auto_21841 ) ) ( not ( = ?auto_21839 ?auto_21841 ) ) ( not ( = ?auto_21843 ?auto_21844 ) ) ( IS-CRATE ?auto_21838 ) ( not ( = ?auto_21868 ?auto_21842 ) ) ( HOIST-AT ?auto_21865 ?auto_21868 ) ( AVAILABLE ?auto_21865 ) ( SURFACE-AT ?auto_21838 ?auto_21868 ) ( ON ?auto_21838 ?auto_21866 ) ( CLEAR ?auto_21838 ) ( not ( = ?auto_21835 ?auto_21838 ) ) ( not ( = ?auto_21835 ?auto_21866 ) ) ( not ( = ?auto_21838 ?auto_21866 ) ) ( not ( = ?auto_21843 ?auto_21865 ) ) ( IS-CRATE ?auto_21835 ) ( SURFACE-AT ?auto_21835 ?auto_21845 ) ( ON ?auto_21835 ?auto_21851 ) ( CLEAR ?auto_21835 ) ( not ( = ?auto_21836 ?auto_21835 ) ) ( not ( = ?auto_21836 ?auto_21851 ) ) ( not ( = ?auto_21835 ?auto_21851 ) ) ( IS-CRATE ?auto_21836 ) ( not ( = ?auto_21848 ?auto_21842 ) ) ( HOIST-AT ?auto_21852 ?auto_21848 ) ( AVAILABLE ?auto_21852 ) ( SURFACE-AT ?auto_21836 ?auto_21848 ) ( ON ?auto_21836 ?auto_21862 ) ( CLEAR ?auto_21836 ) ( not ( = ?auto_21837 ?auto_21836 ) ) ( not ( = ?auto_21837 ?auto_21862 ) ) ( not ( = ?auto_21836 ?auto_21862 ) ) ( not ( = ?auto_21843 ?auto_21852 ) ) ( IS-CRATE ?auto_21837 ) ( not ( = ?auto_21864 ?auto_21842 ) ) ( HOIST-AT ?auto_21846 ?auto_21864 ) ( AVAILABLE ?auto_21846 ) ( SURFACE-AT ?auto_21837 ?auto_21864 ) ( ON ?auto_21837 ?auto_21863 ) ( CLEAR ?auto_21837 ) ( not ( = ?auto_21834 ?auto_21837 ) ) ( not ( = ?auto_21834 ?auto_21863 ) ) ( not ( = ?auto_21837 ?auto_21863 ) ) ( not ( = ?auto_21843 ?auto_21846 ) ) ( IS-CRATE ?auto_21834 ) ( not ( = ?auto_21856 ?auto_21842 ) ) ( HOIST-AT ?auto_21854 ?auto_21856 ) ( AVAILABLE ?auto_21854 ) ( SURFACE-AT ?auto_21834 ?auto_21856 ) ( ON ?auto_21834 ?auto_21867 ) ( CLEAR ?auto_21834 ) ( not ( = ?auto_21833 ?auto_21834 ) ) ( not ( = ?auto_21833 ?auto_21867 ) ) ( not ( = ?auto_21834 ?auto_21867 ) ) ( not ( = ?auto_21843 ?auto_21854 ) ) ( IS-CRATE ?auto_21833 ) ( not ( = ?auto_21870 ?auto_21842 ) ) ( HOIST-AT ?auto_21850 ?auto_21870 ) ( AVAILABLE ?auto_21850 ) ( SURFACE-AT ?auto_21833 ?auto_21870 ) ( ON ?auto_21833 ?auto_21861 ) ( CLEAR ?auto_21833 ) ( not ( = ?auto_21832 ?auto_21833 ) ) ( not ( = ?auto_21832 ?auto_21861 ) ) ( not ( = ?auto_21833 ?auto_21861 ) ) ( not ( = ?auto_21843 ?auto_21850 ) ) ( IS-CRATE ?auto_21832 ) ( not ( = ?auto_21858 ?auto_21842 ) ) ( HOIST-AT ?auto_21847 ?auto_21858 ) ( AVAILABLE ?auto_21847 ) ( SURFACE-AT ?auto_21832 ?auto_21858 ) ( ON ?auto_21832 ?auto_21871 ) ( CLEAR ?auto_21832 ) ( not ( = ?auto_21831 ?auto_21832 ) ) ( not ( = ?auto_21831 ?auto_21871 ) ) ( not ( = ?auto_21832 ?auto_21871 ) ) ( not ( = ?auto_21843 ?auto_21847 ) ) ( IS-CRATE ?auto_21831 ) ( AVAILABLE ?auto_21844 ) ( SURFACE-AT ?auto_21831 ?auto_21845 ) ( ON ?auto_21831 ?auto_21849 ) ( CLEAR ?auto_21831 ) ( not ( = ?auto_21830 ?auto_21831 ) ) ( not ( = ?auto_21830 ?auto_21849 ) ) ( not ( = ?auto_21831 ?auto_21849 ) ) ( IS-CRATE ?auto_21830 ) ( not ( = ?auto_21853 ?auto_21842 ) ) ( HOIST-AT ?auto_21860 ?auto_21853 ) ( AVAILABLE ?auto_21860 ) ( SURFACE-AT ?auto_21830 ?auto_21853 ) ( ON ?auto_21830 ?auto_21859 ) ( CLEAR ?auto_21830 ) ( not ( = ?auto_21829 ?auto_21830 ) ) ( not ( = ?auto_21829 ?auto_21859 ) ) ( not ( = ?auto_21830 ?auto_21859 ) ) ( not ( = ?auto_21843 ?auto_21860 ) ) ( SURFACE-AT ?auto_21828 ?auto_21842 ) ( CLEAR ?auto_21828 ) ( IS-CRATE ?auto_21829 ) ( AVAILABLE ?auto_21843 ) ( not ( = ?auto_21857 ?auto_21842 ) ) ( HOIST-AT ?auto_21869 ?auto_21857 ) ( AVAILABLE ?auto_21869 ) ( SURFACE-AT ?auto_21829 ?auto_21857 ) ( ON ?auto_21829 ?auto_21855 ) ( CLEAR ?auto_21829 ) ( TRUCK-AT ?auto_21840 ?auto_21842 ) ( not ( = ?auto_21828 ?auto_21829 ) ) ( not ( = ?auto_21828 ?auto_21855 ) ) ( not ( = ?auto_21829 ?auto_21855 ) ) ( not ( = ?auto_21843 ?auto_21869 ) ) ( not ( = ?auto_21828 ?auto_21830 ) ) ( not ( = ?auto_21828 ?auto_21859 ) ) ( not ( = ?auto_21830 ?auto_21855 ) ) ( not ( = ?auto_21853 ?auto_21857 ) ) ( not ( = ?auto_21860 ?auto_21869 ) ) ( not ( = ?auto_21859 ?auto_21855 ) ) ( not ( = ?auto_21828 ?auto_21831 ) ) ( not ( = ?auto_21828 ?auto_21849 ) ) ( not ( = ?auto_21829 ?auto_21831 ) ) ( not ( = ?auto_21829 ?auto_21849 ) ) ( not ( = ?auto_21831 ?auto_21859 ) ) ( not ( = ?auto_21831 ?auto_21855 ) ) ( not ( = ?auto_21845 ?auto_21853 ) ) ( not ( = ?auto_21845 ?auto_21857 ) ) ( not ( = ?auto_21844 ?auto_21860 ) ) ( not ( = ?auto_21844 ?auto_21869 ) ) ( not ( = ?auto_21849 ?auto_21859 ) ) ( not ( = ?auto_21849 ?auto_21855 ) ) ( not ( = ?auto_21828 ?auto_21832 ) ) ( not ( = ?auto_21828 ?auto_21871 ) ) ( not ( = ?auto_21829 ?auto_21832 ) ) ( not ( = ?auto_21829 ?auto_21871 ) ) ( not ( = ?auto_21830 ?auto_21832 ) ) ( not ( = ?auto_21830 ?auto_21871 ) ) ( not ( = ?auto_21832 ?auto_21849 ) ) ( not ( = ?auto_21832 ?auto_21859 ) ) ( not ( = ?auto_21832 ?auto_21855 ) ) ( not ( = ?auto_21858 ?auto_21845 ) ) ( not ( = ?auto_21858 ?auto_21853 ) ) ( not ( = ?auto_21858 ?auto_21857 ) ) ( not ( = ?auto_21847 ?auto_21844 ) ) ( not ( = ?auto_21847 ?auto_21860 ) ) ( not ( = ?auto_21847 ?auto_21869 ) ) ( not ( = ?auto_21871 ?auto_21849 ) ) ( not ( = ?auto_21871 ?auto_21859 ) ) ( not ( = ?auto_21871 ?auto_21855 ) ) ( not ( = ?auto_21828 ?auto_21833 ) ) ( not ( = ?auto_21828 ?auto_21861 ) ) ( not ( = ?auto_21829 ?auto_21833 ) ) ( not ( = ?auto_21829 ?auto_21861 ) ) ( not ( = ?auto_21830 ?auto_21833 ) ) ( not ( = ?auto_21830 ?auto_21861 ) ) ( not ( = ?auto_21831 ?auto_21833 ) ) ( not ( = ?auto_21831 ?auto_21861 ) ) ( not ( = ?auto_21833 ?auto_21871 ) ) ( not ( = ?auto_21833 ?auto_21849 ) ) ( not ( = ?auto_21833 ?auto_21859 ) ) ( not ( = ?auto_21833 ?auto_21855 ) ) ( not ( = ?auto_21870 ?auto_21858 ) ) ( not ( = ?auto_21870 ?auto_21845 ) ) ( not ( = ?auto_21870 ?auto_21853 ) ) ( not ( = ?auto_21870 ?auto_21857 ) ) ( not ( = ?auto_21850 ?auto_21847 ) ) ( not ( = ?auto_21850 ?auto_21844 ) ) ( not ( = ?auto_21850 ?auto_21860 ) ) ( not ( = ?auto_21850 ?auto_21869 ) ) ( not ( = ?auto_21861 ?auto_21871 ) ) ( not ( = ?auto_21861 ?auto_21849 ) ) ( not ( = ?auto_21861 ?auto_21859 ) ) ( not ( = ?auto_21861 ?auto_21855 ) ) ( not ( = ?auto_21828 ?auto_21834 ) ) ( not ( = ?auto_21828 ?auto_21867 ) ) ( not ( = ?auto_21829 ?auto_21834 ) ) ( not ( = ?auto_21829 ?auto_21867 ) ) ( not ( = ?auto_21830 ?auto_21834 ) ) ( not ( = ?auto_21830 ?auto_21867 ) ) ( not ( = ?auto_21831 ?auto_21834 ) ) ( not ( = ?auto_21831 ?auto_21867 ) ) ( not ( = ?auto_21832 ?auto_21834 ) ) ( not ( = ?auto_21832 ?auto_21867 ) ) ( not ( = ?auto_21834 ?auto_21861 ) ) ( not ( = ?auto_21834 ?auto_21871 ) ) ( not ( = ?auto_21834 ?auto_21849 ) ) ( not ( = ?auto_21834 ?auto_21859 ) ) ( not ( = ?auto_21834 ?auto_21855 ) ) ( not ( = ?auto_21856 ?auto_21870 ) ) ( not ( = ?auto_21856 ?auto_21858 ) ) ( not ( = ?auto_21856 ?auto_21845 ) ) ( not ( = ?auto_21856 ?auto_21853 ) ) ( not ( = ?auto_21856 ?auto_21857 ) ) ( not ( = ?auto_21854 ?auto_21850 ) ) ( not ( = ?auto_21854 ?auto_21847 ) ) ( not ( = ?auto_21854 ?auto_21844 ) ) ( not ( = ?auto_21854 ?auto_21860 ) ) ( not ( = ?auto_21854 ?auto_21869 ) ) ( not ( = ?auto_21867 ?auto_21861 ) ) ( not ( = ?auto_21867 ?auto_21871 ) ) ( not ( = ?auto_21867 ?auto_21849 ) ) ( not ( = ?auto_21867 ?auto_21859 ) ) ( not ( = ?auto_21867 ?auto_21855 ) ) ( not ( = ?auto_21828 ?auto_21837 ) ) ( not ( = ?auto_21828 ?auto_21863 ) ) ( not ( = ?auto_21829 ?auto_21837 ) ) ( not ( = ?auto_21829 ?auto_21863 ) ) ( not ( = ?auto_21830 ?auto_21837 ) ) ( not ( = ?auto_21830 ?auto_21863 ) ) ( not ( = ?auto_21831 ?auto_21837 ) ) ( not ( = ?auto_21831 ?auto_21863 ) ) ( not ( = ?auto_21832 ?auto_21837 ) ) ( not ( = ?auto_21832 ?auto_21863 ) ) ( not ( = ?auto_21833 ?auto_21837 ) ) ( not ( = ?auto_21833 ?auto_21863 ) ) ( not ( = ?auto_21837 ?auto_21867 ) ) ( not ( = ?auto_21837 ?auto_21861 ) ) ( not ( = ?auto_21837 ?auto_21871 ) ) ( not ( = ?auto_21837 ?auto_21849 ) ) ( not ( = ?auto_21837 ?auto_21859 ) ) ( not ( = ?auto_21837 ?auto_21855 ) ) ( not ( = ?auto_21864 ?auto_21856 ) ) ( not ( = ?auto_21864 ?auto_21870 ) ) ( not ( = ?auto_21864 ?auto_21858 ) ) ( not ( = ?auto_21864 ?auto_21845 ) ) ( not ( = ?auto_21864 ?auto_21853 ) ) ( not ( = ?auto_21864 ?auto_21857 ) ) ( not ( = ?auto_21846 ?auto_21854 ) ) ( not ( = ?auto_21846 ?auto_21850 ) ) ( not ( = ?auto_21846 ?auto_21847 ) ) ( not ( = ?auto_21846 ?auto_21844 ) ) ( not ( = ?auto_21846 ?auto_21860 ) ) ( not ( = ?auto_21846 ?auto_21869 ) ) ( not ( = ?auto_21863 ?auto_21867 ) ) ( not ( = ?auto_21863 ?auto_21861 ) ) ( not ( = ?auto_21863 ?auto_21871 ) ) ( not ( = ?auto_21863 ?auto_21849 ) ) ( not ( = ?auto_21863 ?auto_21859 ) ) ( not ( = ?auto_21863 ?auto_21855 ) ) ( not ( = ?auto_21828 ?auto_21836 ) ) ( not ( = ?auto_21828 ?auto_21862 ) ) ( not ( = ?auto_21829 ?auto_21836 ) ) ( not ( = ?auto_21829 ?auto_21862 ) ) ( not ( = ?auto_21830 ?auto_21836 ) ) ( not ( = ?auto_21830 ?auto_21862 ) ) ( not ( = ?auto_21831 ?auto_21836 ) ) ( not ( = ?auto_21831 ?auto_21862 ) ) ( not ( = ?auto_21832 ?auto_21836 ) ) ( not ( = ?auto_21832 ?auto_21862 ) ) ( not ( = ?auto_21833 ?auto_21836 ) ) ( not ( = ?auto_21833 ?auto_21862 ) ) ( not ( = ?auto_21834 ?auto_21836 ) ) ( not ( = ?auto_21834 ?auto_21862 ) ) ( not ( = ?auto_21836 ?auto_21863 ) ) ( not ( = ?auto_21836 ?auto_21867 ) ) ( not ( = ?auto_21836 ?auto_21861 ) ) ( not ( = ?auto_21836 ?auto_21871 ) ) ( not ( = ?auto_21836 ?auto_21849 ) ) ( not ( = ?auto_21836 ?auto_21859 ) ) ( not ( = ?auto_21836 ?auto_21855 ) ) ( not ( = ?auto_21848 ?auto_21864 ) ) ( not ( = ?auto_21848 ?auto_21856 ) ) ( not ( = ?auto_21848 ?auto_21870 ) ) ( not ( = ?auto_21848 ?auto_21858 ) ) ( not ( = ?auto_21848 ?auto_21845 ) ) ( not ( = ?auto_21848 ?auto_21853 ) ) ( not ( = ?auto_21848 ?auto_21857 ) ) ( not ( = ?auto_21852 ?auto_21846 ) ) ( not ( = ?auto_21852 ?auto_21854 ) ) ( not ( = ?auto_21852 ?auto_21850 ) ) ( not ( = ?auto_21852 ?auto_21847 ) ) ( not ( = ?auto_21852 ?auto_21844 ) ) ( not ( = ?auto_21852 ?auto_21860 ) ) ( not ( = ?auto_21852 ?auto_21869 ) ) ( not ( = ?auto_21862 ?auto_21863 ) ) ( not ( = ?auto_21862 ?auto_21867 ) ) ( not ( = ?auto_21862 ?auto_21861 ) ) ( not ( = ?auto_21862 ?auto_21871 ) ) ( not ( = ?auto_21862 ?auto_21849 ) ) ( not ( = ?auto_21862 ?auto_21859 ) ) ( not ( = ?auto_21862 ?auto_21855 ) ) ( not ( = ?auto_21828 ?auto_21835 ) ) ( not ( = ?auto_21828 ?auto_21851 ) ) ( not ( = ?auto_21829 ?auto_21835 ) ) ( not ( = ?auto_21829 ?auto_21851 ) ) ( not ( = ?auto_21830 ?auto_21835 ) ) ( not ( = ?auto_21830 ?auto_21851 ) ) ( not ( = ?auto_21831 ?auto_21835 ) ) ( not ( = ?auto_21831 ?auto_21851 ) ) ( not ( = ?auto_21832 ?auto_21835 ) ) ( not ( = ?auto_21832 ?auto_21851 ) ) ( not ( = ?auto_21833 ?auto_21835 ) ) ( not ( = ?auto_21833 ?auto_21851 ) ) ( not ( = ?auto_21834 ?auto_21835 ) ) ( not ( = ?auto_21834 ?auto_21851 ) ) ( not ( = ?auto_21837 ?auto_21835 ) ) ( not ( = ?auto_21837 ?auto_21851 ) ) ( not ( = ?auto_21835 ?auto_21862 ) ) ( not ( = ?auto_21835 ?auto_21863 ) ) ( not ( = ?auto_21835 ?auto_21867 ) ) ( not ( = ?auto_21835 ?auto_21861 ) ) ( not ( = ?auto_21835 ?auto_21871 ) ) ( not ( = ?auto_21835 ?auto_21849 ) ) ( not ( = ?auto_21835 ?auto_21859 ) ) ( not ( = ?auto_21835 ?auto_21855 ) ) ( not ( = ?auto_21851 ?auto_21862 ) ) ( not ( = ?auto_21851 ?auto_21863 ) ) ( not ( = ?auto_21851 ?auto_21867 ) ) ( not ( = ?auto_21851 ?auto_21861 ) ) ( not ( = ?auto_21851 ?auto_21871 ) ) ( not ( = ?auto_21851 ?auto_21849 ) ) ( not ( = ?auto_21851 ?auto_21859 ) ) ( not ( = ?auto_21851 ?auto_21855 ) ) ( not ( = ?auto_21828 ?auto_21838 ) ) ( not ( = ?auto_21828 ?auto_21866 ) ) ( not ( = ?auto_21829 ?auto_21838 ) ) ( not ( = ?auto_21829 ?auto_21866 ) ) ( not ( = ?auto_21830 ?auto_21838 ) ) ( not ( = ?auto_21830 ?auto_21866 ) ) ( not ( = ?auto_21831 ?auto_21838 ) ) ( not ( = ?auto_21831 ?auto_21866 ) ) ( not ( = ?auto_21832 ?auto_21838 ) ) ( not ( = ?auto_21832 ?auto_21866 ) ) ( not ( = ?auto_21833 ?auto_21838 ) ) ( not ( = ?auto_21833 ?auto_21866 ) ) ( not ( = ?auto_21834 ?auto_21838 ) ) ( not ( = ?auto_21834 ?auto_21866 ) ) ( not ( = ?auto_21837 ?auto_21838 ) ) ( not ( = ?auto_21837 ?auto_21866 ) ) ( not ( = ?auto_21836 ?auto_21838 ) ) ( not ( = ?auto_21836 ?auto_21866 ) ) ( not ( = ?auto_21838 ?auto_21851 ) ) ( not ( = ?auto_21838 ?auto_21862 ) ) ( not ( = ?auto_21838 ?auto_21863 ) ) ( not ( = ?auto_21838 ?auto_21867 ) ) ( not ( = ?auto_21838 ?auto_21861 ) ) ( not ( = ?auto_21838 ?auto_21871 ) ) ( not ( = ?auto_21838 ?auto_21849 ) ) ( not ( = ?auto_21838 ?auto_21859 ) ) ( not ( = ?auto_21838 ?auto_21855 ) ) ( not ( = ?auto_21868 ?auto_21845 ) ) ( not ( = ?auto_21868 ?auto_21848 ) ) ( not ( = ?auto_21868 ?auto_21864 ) ) ( not ( = ?auto_21868 ?auto_21856 ) ) ( not ( = ?auto_21868 ?auto_21870 ) ) ( not ( = ?auto_21868 ?auto_21858 ) ) ( not ( = ?auto_21868 ?auto_21853 ) ) ( not ( = ?auto_21868 ?auto_21857 ) ) ( not ( = ?auto_21865 ?auto_21844 ) ) ( not ( = ?auto_21865 ?auto_21852 ) ) ( not ( = ?auto_21865 ?auto_21846 ) ) ( not ( = ?auto_21865 ?auto_21854 ) ) ( not ( = ?auto_21865 ?auto_21850 ) ) ( not ( = ?auto_21865 ?auto_21847 ) ) ( not ( = ?auto_21865 ?auto_21860 ) ) ( not ( = ?auto_21865 ?auto_21869 ) ) ( not ( = ?auto_21866 ?auto_21851 ) ) ( not ( = ?auto_21866 ?auto_21862 ) ) ( not ( = ?auto_21866 ?auto_21863 ) ) ( not ( = ?auto_21866 ?auto_21867 ) ) ( not ( = ?auto_21866 ?auto_21861 ) ) ( not ( = ?auto_21866 ?auto_21871 ) ) ( not ( = ?auto_21866 ?auto_21849 ) ) ( not ( = ?auto_21866 ?auto_21859 ) ) ( not ( = ?auto_21866 ?auto_21855 ) ) ( not ( = ?auto_21828 ?auto_21839 ) ) ( not ( = ?auto_21828 ?auto_21841 ) ) ( not ( = ?auto_21829 ?auto_21839 ) ) ( not ( = ?auto_21829 ?auto_21841 ) ) ( not ( = ?auto_21830 ?auto_21839 ) ) ( not ( = ?auto_21830 ?auto_21841 ) ) ( not ( = ?auto_21831 ?auto_21839 ) ) ( not ( = ?auto_21831 ?auto_21841 ) ) ( not ( = ?auto_21832 ?auto_21839 ) ) ( not ( = ?auto_21832 ?auto_21841 ) ) ( not ( = ?auto_21833 ?auto_21839 ) ) ( not ( = ?auto_21833 ?auto_21841 ) ) ( not ( = ?auto_21834 ?auto_21839 ) ) ( not ( = ?auto_21834 ?auto_21841 ) ) ( not ( = ?auto_21837 ?auto_21839 ) ) ( not ( = ?auto_21837 ?auto_21841 ) ) ( not ( = ?auto_21836 ?auto_21839 ) ) ( not ( = ?auto_21836 ?auto_21841 ) ) ( not ( = ?auto_21835 ?auto_21839 ) ) ( not ( = ?auto_21835 ?auto_21841 ) ) ( not ( = ?auto_21839 ?auto_21866 ) ) ( not ( = ?auto_21839 ?auto_21851 ) ) ( not ( = ?auto_21839 ?auto_21862 ) ) ( not ( = ?auto_21839 ?auto_21863 ) ) ( not ( = ?auto_21839 ?auto_21867 ) ) ( not ( = ?auto_21839 ?auto_21861 ) ) ( not ( = ?auto_21839 ?auto_21871 ) ) ( not ( = ?auto_21839 ?auto_21849 ) ) ( not ( = ?auto_21839 ?auto_21859 ) ) ( not ( = ?auto_21839 ?auto_21855 ) ) ( not ( = ?auto_21841 ?auto_21866 ) ) ( not ( = ?auto_21841 ?auto_21851 ) ) ( not ( = ?auto_21841 ?auto_21862 ) ) ( not ( = ?auto_21841 ?auto_21863 ) ) ( not ( = ?auto_21841 ?auto_21867 ) ) ( not ( = ?auto_21841 ?auto_21861 ) ) ( not ( = ?auto_21841 ?auto_21871 ) ) ( not ( = ?auto_21841 ?auto_21849 ) ) ( not ( = ?auto_21841 ?auto_21859 ) ) ( not ( = ?auto_21841 ?auto_21855 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_21828 ?auto_21829 ?auto_21830 ?auto_21831 ?auto_21832 ?auto_21833 ?auto_21834 ?auto_21837 ?auto_21836 ?auto_21835 ?auto_21838 )
      ( MAKE-1CRATE ?auto_21838 ?auto_21839 )
      ( MAKE-11CRATE-VERIFY ?auto_21828 ?auto_21829 ?auto_21830 ?auto_21831 ?auto_21832 ?auto_21833 ?auto_21834 ?auto_21837 ?auto_21836 ?auto_21835 ?auto_21838 ?auto_21839 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21874 - SURFACE
      ?auto_21875 - SURFACE
    )
    :vars
    (
      ?auto_21876 - HOIST
      ?auto_21877 - PLACE
      ?auto_21879 - PLACE
      ?auto_21880 - HOIST
      ?auto_21881 - SURFACE
      ?auto_21878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21876 ?auto_21877 ) ( SURFACE-AT ?auto_21874 ?auto_21877 ) ( CLEAR ?auto_21874 ) ( IS-CRATE ?auto_21875 ) ( AVAILABLE ?auto_21876 ) ( not ( = ?auto_21879 ?auto_21877 ) ) ( HOIST-AT ?auto_21880 ?auto_21879 ) ( AVAILABLE ?auto_21880 ) ( SURFACE-AT ?auto_21875 ?auto_21879 ) ( ON ?auto_21875 ?auto_21881 ) ( CLEAR ?auto_21875 ) ( TRUCK-AT ?auto_21878 ?auto_21877 ) ( not ( = ?auto_21874 ?auto_21875 ) ) ( not ( = ?auto_21874 ?auto_21881 ) ) ( not ( = ?auto_21875 ?auto_21881 ) ) ( not ( = ?auto_21876 ?auto_21880 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21878 ?auto_21877 ?auto_21879 )
      ( !LIFT ?auto_21880 ?auto_21875 ?auto_21881 ?auto_21879 )
      ( !LOAD ?auto_21880 ?auto_21875 ?auto_21878 ?auto_21879 )
      ( !DRIVE ?auto_21878 ?auto_21879 ?auto_21877 )
      ( !UNLOAD ?auto_21876 ?auto_21875 ?auto_21878 ?auto_21877 )
      ( !DROP ?auto_21876 ?auto_21875 ?auto_21874 ?auto_21877 )
      ( MAKE-1CRATE-VERIFY ?auto_21874 ?auto_21875 ) )
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
      ?auto_21904 - SURFACE
      ?auto_21903 - SURFACE
      ?auto_21902 - SURFACE
      ?auto_21905 - SURFACE
      ?auto_21906 - SURFACE
      ?auto_21907 - SURFACE
    )
    :vars
    (
      ?auto_21913 - HOIST
      ?auto_21912 - PLACE
      ?auto_21909 - PLACE
      ?auto_21911 - HOIST
      ?auto_21910 - SURFACE
      ?auto_21928 - PLACE
      ?auto_21930 - HOIST
      ?auto_21922 - SURFACE
      ?auto_21938 - PLACE
      ?auto_21940 - HOIST
      ?auto_21924 - SURFACE
      ?auto_21937 - SURFACE
      ?auto_21935 - PLACE
      ?auto_21916 - HOIST
      ?auto_21915 - SURFACE
      ?auto_21932 - PLACE
      ?auto_21934 - HOIST
      ?auto_21917 - SURFACE
      ?auto_21925 - PLACE
      ?auto_21923 - HOIST
      ?auto_21927 - SURFACE
      ?auto_21914 - PLACE
      ?auto_21921 - HOIST
      ?auto_21939 - SURFACE
      ?auto_21920 - PLACE
      ?auto_21929 - HOIST
      ?auto_21918 - SURFACE
      ?auto_21933 - SURFACE
      ?auto_21919 - PLACE
      ?auto_21936 - HOIST
      ?auto_21931 - SURFACE
      ?auto_21926 - SURFACE
      ?auto_21908 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21913 ?auto_21912 ) ( IS-CRATE ?auto_21907 ) ( not ( = ?auto_21909 ?auto_21912 ) ) ( HOIST-AT ?auto_21911 ?auto_21909 ) ( SURFACE-AT ?auto_21907 ?auto_21909 ) ( ON ?auto_21907 ?auto_21910 ) ( CLEAR ?auto_21907 ) ( not ( = ?auto_21906 ?auto_21907 ) ) ( not ( = ?auto_21906 ?auto_21910 ) ) ( not ( = ?auto_21907 ?auto_21910 ) ) ( not ( = ?auto_21913 ?auto_21911 ) ) ( IS-CRATE ?auto_21906 ) ( not ( = ?auto_21928 ?auto_21912 ) ) ( HOIST-AT ?auto_21930 ?auto_21928 ) ( SURFACE-AT ?auto_21906 ?auto_21928 ) ( ON ?auto_21906 ?auto_21922 ) ( CLEAR ?auto_21906 ) ( not ( = ?auto_21905 ?auto_21906 ) ) ( not ( = ?auto_21905 ?auto_21922 ) ) ( not ( = ?auto_21906 ?auto_21922 ) ) ( not ( = ?auto_21913 ?auto_21930 ) ) ( IS-CRATE ?auto_21905 ) ( not ( = ?auto_21938 ?auto_21912 ) ) ( HOIST-AT ?auto_21940 ?auto_21938 ) ( AVAILABLE ?auto_21940 ) ( SURFACE-AT ?auto_21905 ?auto_21938 ) ( ON ?auto_21905 ?auto_21924 ) ( CLEAR ?auto_21905 ) ( not ( = ?auto_21902 ?auto_21905 ) ) ( not ( = ?auto_21902 ?auto_21924 ) ) ( not ( = ?auto_21905 ?auto_21924 ) ) ( not ( = ?auto_21913 ?auto_21940 ) ) ( IS-CRATE ?auto_21902 ) ( SURFACE-AT ?auto_21902 ?auto_21928 ) ( ON ?auto_21902 ?auto_21937 ) ( CLEAR ?auto_21902 ) ( not ( = ?auto_21903 ?auto_21902 ) ) ( not ( = ?auto_21903 ?auto_21937 ) ) ( not ( = ?auto_21902 ?auto_21937 ) ) ( IS-CRATE ?auto_21903 ) ( not ( = ?auto_21935 ?auto_21912 ) ) ( HOIST-AT ?auto_21916 ?auto_21935 ) ( AVAILABLE ?auto_21916 ) ( SURFACE-AT ?auto_21903 ?auto_21935 ) ( ON ?auto_21903 ?auto_21915 ) ( CLEAR ?auto_21903 ) ( not ( = ?auto_21904 ?auto_21903 ) ) ( not ( = ?auto_21904 ?auto_21915 ) ) ( not ( = ?auto_21903 ?auto_21915 ) ) ( not ( = ?auto_21913 ?auto_21916 ) ) ( IS-CRATE ?auto_21904 ) ( not ( = ?auto_21932 ?auto_21912 ) ) ( HOIST-AT ?auto_21934 ?auto_21932 ) ( AVAILABLE ?auto_21934 ) ( SURFACE-AT ?auto_21904 ?auto_21932 ) ( ON ?auto_21904 ?auto_21917 ) ( CLEAR ?auto_21904 ) ( not ( = ?auto_21901 ?auto_21904 ) ) ( not ( = ?auto_21901 ?auto_21917 ) ) ( not ( = ?auto_21904 ?auto_21917 ) ) ( not ( = ?auto_21913 ?auto_21934 ) ) ( IS-CRATE ?auto_21901 ) ( not ( = ?auto_21925 ?auto_21912 ) ) ( HOIST-AT ?auto_21923 ?auto_21925 ) ( AVAILABLE ?auto_21923 ) ( SURFACE-AT ?auto_21901 ?auto_21925 ) ( ON ?auto_21901 ?auto_21927 ) ( CLEAR ?auto_21901 ) ( not ( = ?auto_21900 ?auto_21901 ) ) ( not ( = ?auto_21900 ?auto_21927 ) ) ( not ( = ?auto_21901 ?auto_21927 ) ) ( not ( = ?auto_21913 ?auto_21923 ) ) ( IS-CRATE ?auto_21900 ) ( not ( = ?auto_21914 ?auto_21912 ) ) ( HOIST-AT ?auto_21921 ?auto_21914 ) ( AVAILABLE ?auto_21921 ) ( SURFACE-AT ?auto_21900 ?auto_21914 ) ( ON ?auto_21900 ?auto_21939 ) ( CLEAR ?auto_21900 ) ( not ( = ?auto_21899 ?auto_21900 ) ) ( not ( = ?auto_21899 ?auto_21939 ) ) ( not ( = ?auto_21900 ?auto_21939 ) ) ( not ( = ?auto_21913 ?auto_21921 ) ) ( IS-CRATE ?auto_21899 ) ( not ( = ?auto_21920 ?auto_21912 ) ) ( HOIST-AT ?auto_21929 ?auto_21920 ) ( AVAILABLE ?auto_21929 ) ( SURFACE-AT ?auto_21899 ?auto_21920 ) ( ON ?auto_21899 ?auto_21918 ) ( CLEAR ?auto_21899 ) ( not ( = ?auto_21898 ?auto_21899 ) ) ( not ( = ?auto_21898 ?auto_21918 ) ) ( not ( = ?auto_21899 ?auto_21918 ) ) ( not ( = ?auto_21913 ?auto_21929 ) ) ( IS-CRATE ?auto_21898 ) ( AVAILABLE ?auto_21930 ) ( SURFACE-AT ?auto_21898 ?auto_21928 ) ( ON ?auto_21898 ?auto_21933 ) ( CLEAR ?auto_21898 ) ( not ( = ?auto_21897 ?auto_21898 ) ) ( not ( = ?auto_21897 ?auto_21933 ) ) ( not ( = ?auto_21898 ?auto_21933 ) ) ( IS-CRATE ?auto_21897 ) ( not ( = ?auto_21919 ?auto_21912 ) ) ( HOIST-AT ?auto_21936 ?auto_21919 ) ( AVAILABLE ?auto_21936 ) ( SURFACE-AT ?auto_21897 ?auto_21919 ) ( ON ?auto_21897 ?auto_21931 ) ( CLEAR ?auto_21897 ) ( not ( = ?auto_21896 ?auto_21897 ) ) ( not ( = ?auto_21896 ?auto_21931 ) ) ( not ( = ?auto_21897 ?auto_21931 ) ) ( not ( = ?auto_21913 ?auto_21936 ) ) ( SURFACE-AT ?auto_21895 ?auto_21912 ) ( CLEAR ?auto_21895 ) ( IS-CRATE ?auto_21896 ) ( AVAILABLE ?auto_21913 ) ( AVAILABLE ?auto_21911 ) ( SURFACE-AT ?auto_21896 ?auto_21909 ) ( ON ?auto_21896 ?auto_21926 ) ( CLEAR ?auto_21896 ) ( TRUCK-AT ?auto_21908 ?auto_21912 ) ( not ( = ?auto_21895 ?auto_21896 ) ) ( not ( = ?auto_21895 ?auto_21926 ) ) ( not ( = ?auto_21896 ?auto_21926 ) ) ( not ( = ?auto_21895 ?auto_21897 ) ) ( not ( = ?auto_21895 ?auto_21931 ) ) ( not ( = ?auto_21897 ?auto_21926 ) ) ( not ( = ?auto_21919 ?auto_21909 ) ) ( not ( = ?auto_21936 ?auto_21911 ) ) ( not ( = ?auto_21931 ?auto_21926 ) ) ( not ( = ?auto_21895 ?auto_21898 ) ) ( not ( = ?auto_21895 ?auto_21933 ) ) ( not ( = ?auto_21896 ?auto_21898 ) ) ( not ( = ?auto_21896 ?auto_21933 ) ) ( not ( = ?auto_21898 ?auto_21931 ) ) ( not ( = ?auto_21898 ?auto_21926 ) ) ( not ( = ?auto_21928 ?auto_21919 ) ) ( not ( = ?auto_21928 ?auto_21909 ) ) ( not ( = ?auto_21930 ?auto_21936 ) ) ( not ( = ?auto_21930 ?auto_21911 ) ) ( not ( = ?auto_21933 ?auto_21931 ) ) ( not ( = ?auto_21933 ?auto_21926 ) ) ( not ( = ?auto_21895 ?auto_21899 ) ) ( not ( = ?auto_21895 ?auto_21918 ) ) ( not ( = ?auto_21896 ?auto_21899 ) ) ( not ( = ?auto_21896 ?auto_21918 ) ) ( not ( = ?auto_21897 ?auto_21899 ) ) ( not ( = ?auto_21897 ?auto_21918 ) ) ( not ( = ?auto_21899 ?auto_21933 ) ) ( not ( = ?auto_21899 ?auto_21931 ) ) ( not ( = ?auto_21899 ?auto_21926 ) ) ( not ( = ?auto_21920 ?auto_21928 ) ) ( not ( = ?auto_21920 ?auto_21919 ) ) ( not ( = ?auto_21920 ?auto_21909 ) ) ( not ( = ?auto_21929 ?auto_21930 ) ) ( not ( = ?auto_21929 ?auto_21936 ) ) ( not ( = ?auto_21929 ?auto_21911 ) ) ( not ( = ?auto_21918 ?auto_21933 ) ) ( not ( = ?auto_21918 ?auto_21931 ) ) ( not ( = ?auto_21918 ?auto_21926 ) ) ( not ( = ?auto_21895 ?auto_21900 ) ) ( not ( = ?auto_21895 ?auto_21939 ) ) ( not ( = ?auto_21896 ?auto_21900 ) ) ( not ( = ?auto_21896 ?auto_21939 ) ) ( not ( = ?auto_21897 ?auto_21900 ) ) ( not ( = ?auto_21897 ?auto_21939 ) ) ( not ( = ?auto_21898 ?auto_21900 ) ) ( not ( = ?auto_21898 ?auto_21939 ) ) ( not ( = ?auto_21900 ?auto_21918 ) ) ( not ( = ?auto_21900 ?auto_21933 ) ) ( not ( = ?auto_21900 ?auto_21931 ) ) ( not ( = ?auto_21900 ?auto_21926 ) ) ( not ( = ?auto_21914 ?auto_21920 ) ) ( not ( = ?auto_21914 ?auto_21928 ) ) ( not ( = ?auto_21914 ?auto_21919 ) ) ( not ( = ?auto_21914 ?auto_21909 ) ) ( not ( = ?auto_21921 ?auto_21929 ) ) ( not ( = ?auto_21921 ?auto_21930 ) ) ( not ( = ?auto_21921 ?auto_21936 ) ) ( not ( = ?auto_21921 ?auto_21911 ) ) ( not ( = ?auto_21939 ?auto_21918 ) ) ( not ( = ?auto_21939 ?auto_21933 ) ) ( not ( = ?auto_21939 ?auto_21931 ) ) ( not ( = ?auto_21939 ?auto_21926 ) ) ( not ( = ?auto_21895 ?auto_21901 ) ) ( not ( = ?auto_21895 ?auto_21927 ) ) ( not ( = ?auto_21896 ?auto_21901 ) ) ( not ( = ?auto_21896 ?auto_21927 ) ) ( not ( = ?auto_21897 ?auto_21901 ) ) ( not ( = ?auto_21897 ?auto_21927 ) ) ( not ( = ?auto_21898 ?auto_21901 ) ) ( not ( = ?auto_21898 ?auto_21927 ) ) ( not ( = ?auto_21899 ?auto_21901 ) ) ( not ( = ?auto_21899 ?auto_21927 ) ) ( not ( = ?auto_21901 ?auto_21939 ) ) ( not ( = ?auto_21901 ?auto_21918 ) ) ( not ( = ?auto_21901 ?auto_21933 ) ) ( not ( = ?auto_21901 ?auto_21931 ) ) ( not ( = ?auto_21901 ?auto_21926 ) ) ( not ( = ?auto_21925 ?auto_21914 ) ) ( not ( = ?auto_21925 ?auto_21920 ) ) ( not ( = ?auto_21925 ?auto_21928 ) ) ( not ( = ?auto_21925 ?auto_21919 ) ) ( not ( = ?auto_21925 ?auto_21909 ) ) ( not ( = ?auto_21923 ?auto_21921 ) ) ( not ( = ?auto_21923 ?auto_21929 ) ) ( not ( = ?auto_21923 ?auto_21930 ) ) ( not ( = ?auto_21923 ?auto_21936 ) ) ( not ( = ?auto_21923 ?auto_21911 ) ) ( not ( = ?auto_21927 ?auto_21939 ) ) ( not ( = ?auto_21927 ?auto_21918 ) ) ( not ( = ?auto_21927 ?auto_21933 ) ) ( not ( = ?auto_21927 ?auto_21931 ) ) ( not ( = ?auto_21927 ?auto_21926 ) ) ( not ( = ?auto_21895 ?auto_21904 ) ) ( not ( = ?auto_21895 ?auto_21917 ) ) ( not ( = ?auto_21896 ?auto_21904 ) ) ( not ( = ?auto_21896 ?auto_21917 ) ) ( not ( = ?auto_21897 ?auto_21904 ) ) ( not ( = ?auto_21897 ?auto_21917 ) ) ( not ( = ?auto_21898 ?auto_21904 ) ) ( not ( = ?auto_21898 ?auto_21917 ) ) ( not ( = ?auto_21899 ?auto_21904 ) ) ( not ( = ?auto_21899 ?auto_21917 ) ) ( not ( = ?auto_21900 ?auto_21904 ) ) ( not ( = ?auto_21900 ?auto_21917 ) ) ( not ( = ?auto_21904 ?auto_21927 ) ) ( not ( = ?auto_21904 ?auto_21939 ) ) ( not ( = ?auto_21904 ?auto_21918 ) ) ( not ( = ?auto_21904 ?auto_21933 ) ) ( not ( = ?auto_21904 ?auto_21931 ) ) ( not ( = ?auto_21904 ?auto_21926 ) ) ( not ( = ?auto_21932 ?auto_21925 ) ) ( not ( = ?auto_21932 ?auto_21914 ) ) ( not ( = ?auto_21932 ?auto_21920 ) ) ( not ( = ?auto_21932 ?auto_21928 ) ) ( not ( = ?auto_21932 ?auto_21919 ) ) ( not ( = ?auto_21932 ?auto_21909 ) ) ( not ( = ?auto_21934 ?auto_21923 ) ) ( not ( = ?auto_21934 ?auto_21921 ) ) ( not ( = ?auto_21934 ?auto_21929 ) ) ( not ( = ?auto_21934 ?auto_21930 ) ) ( not ( = ?auto_21934 ?auto_21936 ) ) ( not ( = ?auto_21934 ?auto_21911 ) ) ( not ( = ?auto_21917 ?auto_21927 ) ) ( not ( = ?auto_21917 ?auto_21939 ) ) ( not ( = ?auto_21917 ?auto_21918 ) ) ( not ( = ?auto_21917 ?auto_21933 ) ) ( not ( = ?auto_21917 ?auto_21931 ) ) ( not ( = ?auto_21917 ?auto_21926 ) ) ( not ( = ?auto_21895 ?auto_21903 ) ) ( not ( = ?auto_21895 ?auto_21915 ) ) ( not ( = ?auto_21896 ?auto_21903 ) ) ( not ( = ?auto_21896 ?auto_21915 ) ) ( not ( = ?auto_21897 ?auto_21903 ) ) ( not ( = ?auto_21897 ?auto_21915 ) ) ( not ( = ?auto_21898 ?auto_21903 ) ) ( not ( = ?auto_21898 ?auto_21915 ) ) ( not ( = ?auto_21899 ?auto_21903 ) ) ( not ( = ?auto_21899 ?auto_21915 ) ) ( not ( = ?auto_21900 ?auto_21903 ) ) ( not ( = ?auto_21900 ?auto_21915 ) ) ( not ( = ?auto_21901 ?auto_21903 ) ) ( not ( = ?auto_21901 ?auto_21915 ) ) ( not ( = ?auto_21903 ?auto_21917 ) ) ( not ( = ?auto_21903 ?auto_21927 ) ) ( not ( = ?auto_21903 ?auto_21939 ) ) ( not ( = ?auto_21903 ?auto_21918 ) ) ( not ( = ?auto_21903 ?auto_21933 ) ) ( not ( = ?auto_21903 ?auto_21931 ) ) ( not ( = ?auto_21903 ?auto_21926 ) ) ( not ( = ?auto_21935 ?auto_21932 ) ) ( not ( = ?auto_21935 ?auto_21925 ) ) ( not ( = ?auto_21935 ?auto_21914 ) ) ( not ( = ?auto_21935 ?auto_21920 ) ) ( not ( = ?auto_21935 ?auto_21928 ) ) ( not ( = ?auto_21935 ?auto_21919 ) ) ( not ( = ?auto_21935 ?auto_21909 ) ) ( not ( = ?auto_21916 ?auto_21934 ) ) ( not ( = ?auto_21916 ?auto_21923 ) ) ( not ( = ?auto_21916 ?auto_21921 ) ) ( not ( = ?auto_21916 ?auto_21929 ) ) ( not ( = ?auto_21916 ?auto_21930 ) ) ( not ( = ?auto_21916 ?auto_21936 ) ) ( not ( = ?auto_21916 ?auto_21911 ) ) ( not ( = ?auto_21915 ?auto_21917 ) ) ( not ( = ?auto_21915 ?auto_21927 ) ) ( not ( = ?auto_21915 ?auto_21939 ) ) ( not ( = ?auto_21915 ?auto_21918 ) ) ( not ( = ?auto_21915 ?auto_21933 ) ) ( not ( = ?auto_21915 ?auto_21931 ) ) ( not ( = ?auto_21915 ?auto_21926 ) ) ( not ( = ?auto_21895 ?auto_21902 ) ) ( not ( = ?auto_21895 ?auto_21937 ) ) ( not ( = ?auto_21896 ?auto_21902 ) ) ( not ( = ?auto_21896 ?auto_21937 ) ) ( not ( = ?auto_21897 ?auto_21902 ) ) ( not ( = ?auto_21897 ?auto_21937 ) ) ( not ( = ?auto_21898 ?auto_21902 ) ) ( not ( = ?auto_21898 ?auto_21937 ) ) ( not ( = ?auto_21899 ?auto_21902 ) ) ( not ( = ?auto_21899 ?auto_21937 ) ) ( not ( = ?auto_21900 ?auto_21902 ) ) ( not ( = ?auto_21900 ?auto_21937 ) ) ( not ( = ?auto_21901 ?auto_21902 ) ) ( not ( = ?auto_21901 ?auto_21937 ) ) ( not ( = ?auto_21904 ?auto_21902 ) ) ( not ( = ?auto_21904 ?auto_21937 ) ) ( not ( = ?auto_21902 ?auto_21915 ) ) ( not ( = ?auto_21902 ?auto_21917 ) ) ( not ( = ?auto_21902 ?auto_21927 ) ) ( not ( = ?auto_21902 ?auto_21939 ) ) ( not ( = ?auto_21902 ?auto_21918 ) ) ( not ( = ?auto_21902 ?auto_21933 ) ) ( not ( = ?auto_21902 ?auto_21931 ) ) ( not ( = ?auto_21902 ?auto_21926 ) ) ( not ( = ?auto_21937 ?auto_21915 ) ) ( not ( = ?auto_21937 ?auto_21917 ) ) ( not ( = ?auto_21937 ?auto_21927 ) ) ( not ( = ?auto_21937 ?auto_21939 ) ) ( not ( = ?auto_21937 ?auto_21918 ) ) ( not ( = ?auto_21937 ?auto_21933 ) ) ( not ( = ?auto_21937 ?auto_21931 ) ) ( not ( = ?auto_21937 ?auto_21926 ) ) ( not ( = ?auto_21895 ?auto_21905 ) ) ( not ( = ?auto_21895 ?auto_21924 ) ) ( not ( = ?auto_21896 ?auto_21905 ) ) ( not ( = ?auto_21896 ?auto_21924 ) ) ( not ( = ?auto_21897 ?auto_21905 ) ) ( not ( = ?auto_21897 ?auto_21924 ) ) ( not ( = ?auto_21898 ?auto_21905 ) ) ( not ( = ?auto_21898 ?auto_21924 ) ) ( not ( = ?auto_21899 ?auto_21905 ) ) ( not ( = ?auto_21899 ?auto_21924 ) ) ( not ( = ?auto_21900 ?auto_21905 ) ) ( not ( = ?auto_21900 ?auto_21924 ) ) ( not ( = ?auto_21901 ?auto_21905 ) ) ( not ( = ?auto_21901 ?auto_21924 ) ) ( not ( = ?auto_21904 ?auto_21905 ) ) ( not ( = ?auto_21904 ?auto_21924 ) ) ( not ( = ?auto_21903 ?auto_21905 ) ) ( not ( = ?auto_21903 ?auto_21924 ) ) ( not ( = ?auto_21905 ?auto_21937 ) ) ( not ( = ?auto_21905 ?auto_21915 ) ) ( not ( = ?auto_21905 ?auto_21917 ) ) ( not ( = ?auto_21905 ?auto_21927 ) ) ( not ( = ?auto_21905 ?auto_21939 ) ) ( not ( = ?auto_21905 ?auto_21918 ) ) ( not ( = ?auto_21905 ?auto_21933 ) ) ( not ( = ?auto_21905 ?auto_21931 ) ) ( not ( = ?auto_21905 ?auto_21926 ) ) ( not ( = ?auto_21938 ?auto_21928 ) ) ( not ( = ?auto_21938 ?auto_21935 ) ) ( not ( = ?auto_21938 ?auto_21932 ) ) ( not ( = ?auto_21938 ?auto_21925 ) ) ( not ( = ?auto_21938 ?auto_21914 ) ) ( not ( = ?auto_21938 ?auto_21920 ) ) ( not ( = ?auto_21938 ?auto_21919 ) ) ( not ( = ?auto_21938 ?auto_21909 ) ) ( not ( = ?auto_21940 ?auto_21930 ) ) ( not ( = ?auto_21940 ?auto_21916 ) ) ( not ( = ?auto_21940 ?auto_21934 ) ) ( not ( = ?auto_21940 ?auto_21923 ) ) ( not ( = ?auto_21940 ?auto_21921 ) ) ( not ( = ?auto_21940 ?auto_21929 ) ) ( not ( = ?auto_21940 ?auto_21936 ) ) ( not ( = ?auto_21940 ?auto_21911 ) ) ( not ( = ?auto_21924 ?auto_21937 ) ) ( not ( = ?auto_21924 ?auto_21915 ) ) ( not ( = ?auto_21924 ?auto_21917 ) ) ( not ( = ?auto_21924 ?auto_21927 ) ) ( not ( = ?auto_21924 ?auto_21939 ) ) ( not ( = ?auto_21924 ?auto_21918 ) ) ( not ( = ?auto_21924 ?auto_21933 ) ) ( not ( = ?auto_21924 ?auto_21931 ) ) ( not ( = ?auto_21924 ?auto_21926 ) ) ( not ( = ?auto_21895 ?auto_21906 ) ) ( not ( = ?auto_21895 ?auto_21922 ) ) ( not ( = ?auto_21896 ?auto_21906 ) ) ( not ( = ?auto_21896 ?auto_21922 ) ) ( not ( = ?auto_21897 ?auto_21906 ) ) ( not ( = ?auto_21897 ?auto_21922 ) ) ( not ( = ?auto_21898 ?auto_21906 ) ) ( not ( = ?auto_21898 ?auto_21922 ) ) ( not ( = ?auto_21899 ?auto_21906 ) ) ( not ( = ?auto_21899 ?auto_21922 ) ) ( not ( = ?auto_21900 ?auto_21906 ) ) ( not ( = ?auto_21900 ?auto_21922 ) ) ( not ( = ?auto_21901 ?auto_21906 ) ) ( not ( = ?auto_21901 ?auto_21922 ) ) ( not ( = ?auto_21904 ?auto_21906 ) ) ( not ( = ?auto_21904 ?auto_21922 ) ) ( not ( = ?auto_21903 ?auto_21906 ) ) ( not ( = ?auto_21903 ?auto_21922 ) ) ( not ( = ?auto_21902 ?auto_21906 ) ) ( not ( = ?auto_21902 ?auto_21922 ) ) ( not ( = ?auto_21906 ?auto_21924 ) ) ( not ( = ?auto_21906 ?auto_21937 ) ) ( not ( = ?auto_21906 ?auto_21915 ) ) ( not ( = ?auto_21906 ?auto_21917 ) ) ( not ( = ?auto_21906 ?auto_21927 ) ) ( not ( = ?auto_21906 ?auto_21939 ) ) ( not ( = ?auto_21906 ?auto_21918 ) ) ( not ( = ?auto_21906 ?auto_21933 ) ) ( not ( = ?auto_21906 ?auto_21931 ) ) ( not ( = ?auto_21906 ?auto_21926 ) ) ( not ( = ?auto_21922 ?auto_21924 ) ) ( not ( = ?auto_21922 ?auto_21937 ) ) ( not ( = ?auto_21922 ?auto_21915 ) ) ( not ( = ?auto_21922 ?auto_21917 ) ) ( not ( = ?auto_21922 ?auto_21927 ) ) ( not ( = ?auto_21922 ?auto_21939 ) ) ( not ( = ?auto_21922 ?auto_21918 ) ) ( not ( = ?auto_21922 ?auto_21933 ) ) ( not ( = ?auto_21922 ?auto_21931 ) ) ( not ( = ?auto_21922 ?auto_21926 ) ) ( not ( = ?auto_21895 ?auto_21907 ) ) ( not ( = ?auto_21895 ?auto_21910 ) ) ( not ( = ?auto_21896 ?auto_21907 ) ) ( not ( = ?auto_21896 ?auto_21910 ) ) ( not ( = ?auto_21897 ?auto_21907 ) ) ( not ( = ?auto_21897 ?auto_21910 ) ) ( not ( = ?auto_21898 ?auto_21907 ) ) ( not ( = ?auto_21898 ?auto_21910 ) ) ( not ( = ?auto_21899 ?auto_21907 ) ) ( not ( = ?auto_21899 ?auto_21910 ) ) ( not ( = ?auto_21900 ?auto_21907 ) ) ( not ( = ?auto_21900 ?auto_21910 ) ) ( not ( = ?auto_21901 ?auto_21907 ) ) ( not ( = ?auto_21901 ?auto_21910 ) ) ( not ( = ?auto_21904 ?auto_21907 ) ) ( not ( = ?auto_21904 ?auto_21910 ) ) ( not ( = ?auto_21903 ?auto_21907 ) ) ( not ( = ?auto_21903 ?auto_21910 ) ) ( not ( = ?auto_21902 ?auto_21907 ) ) ( not ( = ?auto_21902 ?auto_21910 ) ) ( not ( = ?auto_21905 ?auto_21907 ) ) ( not ( = ?auto_21905 ?auto_21910 ) ) ( not ( = ?auto_21907 ?auto_21922 ) ) ( not ( = ?auto_21907 ?auto_21924 ) ) ( not ( = ?auto_21907 ?auto_21937 ) ) ( not ( = ?auto_21907 ?auto_21915 ) ) ( not ( = ?auto_21907 ?auto_21917 ) ) ( not ( = ?auto_21907 ?auto_21927 ) ) ( not ( = ?auto_21907 ?auto_21939 ) ) ( not ( = ?auto_21907 ?auto_21918 ) ) ( not ( = ?auto_21907 ?auto_21933 ) ) ( not ( = ?auto_21907 ?auto_21931 ) ) ( not ( = ?auto_21907 ?auto_21926 ) ) ( not ( = ?auto_21910 ?auto_21922 ) ) ( not ( = ?auto_21910 ?auto_21924 ) ) ( not ( = ?auto_21910 ?auto_21937 ) ) ( not ( = ?auto_21910 ?auto_21915 ) ) ( not ( = ?auto_21910 ?auto_21917 ) ) ( not ( = ?auto_21910 ?auto_21927 ) ) ( not ( = ?auto_21910 ?auto_21939 ) ) ( not ( = ?auto_21910 ?auto_21918 ) ) ( not ( = ?auto_21910 ?auto_21933 ) ) ( not ( = ?auto_21910 ?auto_21931 ) ) ( not ( = ?auto_21910 ?auto_21926 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_21895 ?auto_21896 ?auto_21897 ?auto_21898 ?auto_21899 ?auto_21900 ?auto_21901 ?auto_21904 ?auto_21903 ?auto_21902 ?auto_21905 ?auto_21906 )
      ( MAKE-1CRATE ?auto_21906 ?auto_21907 )
      ( MAKE-12CRATE-VERIFY ?auto_21895 ?auto_21896 ?auto_21897 ?auto_21898 ?auto_21899 ?auto_21900 ?auto_21901 ?auto_21904 ?auto_21903 ?auto_21902 ?auto_21905 ?auto_21906 ?auto_21907 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21943 - SURFACE
      ?auto_21944 - SURFACE
    )
    :vars
    (
      ?auto_21945 - HOIST
      ?auto_21946 - PLACE
      ?auto_21948 - PLACE
      ?auto_21949 - HOIST
      ?auto_21950 - SURFACE
      ?auto_21947 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21945 ?auto_21946 ) ( SURFACE-AT ?auto_21943 ?auto_21946 ) ( CLEAR ?auto_21943 ) ( IS-CRATE ?auto_21944 ) ( AVAILABLE ?auto_21945 ) ( not ( = ?auto_21948 ?auto_21946 ) ) ( HOIST-AT ?auto_21949 ?auto_21948 ) ( AVAILABLE ?auto_21949 ) ( SURFACE-AT ?auto_21944 ?auto_21948 ) ( ON ?auto_21944 ?auto_21950 ) ( CLEAR ?auto_21944 ) ( TRUCK-AT ?auto_21947 ?auto_21946 ) ( not ( = ?auto_21943 ?auto_21944 ) ) ( not ( = ?auto_21943 ?auto_21950 ) ) ( not ( = ?auto_21944 ?auto_21950 ) ) ( not ( = ?auto_21945 ?auto_21949 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21947 ?auto_21946 ?auto_21948 )
      ( !LIFT ?auto_21949 ?auto_21944 ?auto_21950 ?auto_21948 )
      ( !LOAD ?auto_21949 ?auto_21944 ?auto_21947 ?auto_21948 )
      ( !DRIVE ?auto_21947 ?auto_21948 ?auto_21946 )
      ( !UNLOAD ?auto_21945 ?auto_21944 ?auto_21947 ?auto_21946 )
      ( !DROP ?auto_21945 ?auto_21944 ?auto_21943 ?auto_21946 )
      ( MAKE-1CRATE-VERIFY ?auto_21943 ?auto_21944 ) )
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
      ?auto_21974 - SURFACE
      ?auto_21973 - SURFACE
      ?auto_21972 - SURFACE
      ?auto_21975 - SURFACE
      ?auto_21976 - SURFACE
      ?auto_21977 - SURFACE
      ?auto_21978 - SURFACE
    )
    :vars
    (
      ?auto_21984 - HOIST
      ?auto_21981 - PLACE
      ?auto_21980 - PLACE
      ?auto_21982 - HOIST
      ?auto_21983 - SURFACE
      ?auto_21988 - PLACE
      ?auto_21996 - HOIST
      ?auto_21986 - SURFACE
      ?auto_21993 - PLACE
      ?auto_21987 - HOIST
      ?auto_22003 - SURFACE
      ?auto_22005 - PLACE
      ?auto_21989 - HOIST
      ?auto_22006 - SURFACE
      ?auto_21997 - SURFACE
      ?auto_21985 - PLACE
      ?auto_22009 - HOIST
      ?auto_22002 - SURFACE
      ?auto_22007 - PLACE
      ?auto_21999 - HOIST
      ?auto_22008 - SURFACE
      ?auto_22000 - PLACE
      ?auto_22011 - HOIST
      ?auto_22012 - SURFACE
      ?auto_21990 - SURFACE
      ?auto_22004 - PLACE
      ?auto_22001 - HOIST
      ?auto_21998 - SURFACE
      ?auto_21994 - SURFACE
      ?auto_22010 - PLACE
      ?auto_21992 - HOIST
      ?auto_21991 - SURFACE
      ?auto_21995 - SURFACE
      ?auto_21979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21984 ?auto_21981 ) ( IS-CRATE ?auto_21978 ) ( not ( = ?auto_21980 ?auto_21981 ) ) ( HOIST-AT ?auto_21982 ?auto_21980 ) ( SURFACE-AT ?auto_21978 ?auto_21980 ) ( ON ?auto_21978 ?auto_21983 ) ( CLEAR ?auto_21978 ) ( not ( = ?auto_21977 ?auto_21978 ) ) ( not ( = ?auto_21977 ?auto_21983 ) ) ( not ( = ?auto_21978 ?auto_21983 ) ) ( not ( = ?auto_21984 ?auto_21982 ) ) ( IS-CRATE ?auto_21977 ) ( not ( = ?auto_21988 ?auto_21981 ) ) ( HOIST-AT ?auto_21996 ?auto_21988 ) ( SURFACE-AT ?auto_21977 ?auto_21988 ) ( ON ?auto_21977 ?auto_21986 ) ( CLEAR ?auto_21977 ) ( not ( = ?auto_21976 ?auto_21977 ) ) ( not ( = ?auto_21976 ?auto_21986 ) ) ( not ( = ?auto_21977 ?auto_21986 ) ) ( not ( = ?auto_21984 ?auto_21996 ) ) ( IS-CRATE ?auto_21976 ) ( not ( = ?auto_21993 ?auto_21981 ) ) ( HOIST-AT ?auto_21987 ?auto_21993 ) ( SURFACE-AT ?auto_21976 ?auto_21993 ) ( ON ?auto_21976 ?auto_22003 ) ( CLEAR ?auto_21976 ) ( not ( = ?auto_21975 ?auto_21976 ) ) ( not ( = ?auto_21975 ?auto_22003 ) ) ( not ( = ?auto_21976 ?auto_22003 ) ) ( not ( = ?auto_21984 ?auto_21987 ) ) ( IS-CRATE ?auto_21975 ) ( not ( = ?auto_22005 ?auto_21981 ) ) ( HOIST-AT ?auto_21989 ?auto_22005 ) ( AVAILABLE ?auto_21989 ) ( SURFACE-AT ?auto_21975 ?auto_22005 ) ( ON ?auto_21975 ?auto_22006 ) ( CLEAR ?auto_21975 ) ( not ( = ?auto_21972 ?auto_21975 ) ) ( not ( = ?auto_21972 ?auto_22006 ) ) ( not ( = ?auto_21975 ?auto_22006 ) ) ( not ( = ?auto_21984 ?auto_21989 ) ) ( IS-CRATE ?auto_21972 ) ( SURFACE-AT ?auto_21972 ?auto_21993 ) ( ON ?auto_21972 ?auto_21997 ) ( CLEAR ?auto_21972 ) ( not ( = ?auto_21973 ?auto_21972 ) ) ( not ( = ?auto_21973 ?auto_21997 ) ) ( not ( = ?auto_21972 ?auto_21997 ) ) ( IS-CRATE ?auto_21973 ) ( not ( = ?auto_21985 ?auto_21981 ) ) ( HOIST-AT ?auto_22009 ?auto_21985 ) ( AVAILABLE ?auto_22009 ) ( SURFACE-AT ?auto_21973 ?auto_21985 ) ( ON ?auto_21973 ?auto_22002 ) ( CLEAR ?auto_21973 ) ( not ( = ?auto_21974 ?auto_21973 ) ) ( not ( = ?auto_21974 ?auto_22002 ) ) ( not ( = ?auto_21973 ?auto_22002 ) ) ( not ( = ?auto_21984 ?auto_22009 ) ) ( IS-CRATE ?auto_21974 ) ( not ( = ?auto_22007 ?auto_21981 ) ) ( HOIST-AT ?auto_21999 ?auto_22007 ) ( AVAILABLE ?auto_21999 ) ( SURFACE-AT ?auto_21974 ?auto_22007 ) ( ON ?auto_21974 ?auto_22008 ) ( CLEAR ?auto_21974 ) ( not ( = ?auto_21971 ?auto_21974 ) ) ( not ( = ?auto_21971 ?auto_22008 ) ) ( not ( = ?auto_21974 ?auto_22008 ) ) ( not ( = ?auto_21984 ?auto_21999 ) ) ( IS-CRATE ?auto_21971 ) ( not ( = ?auto_22000 ?auto_21981 ) ) ( HOIST-AT ?auto_22011 ?auto_22000 ) ( AVAILABLE ?auto_22011 ) ( SURFACE-AT ?auto_21971 ?auto_22000 ) ( ON ?auto_21971 ?auto_22012 ) ( CLEAR ?auto_21971 ) ( not ( = ?auto_21970 ?auto_21971 ) ) ( not ( = ?auto_21970 ?auto_22012 ) ) ( not ( = ?auto_21971 ?auto_22012 ) ) ( not ( = ?auto_21984 ?auto_22011 ) ) ( IS-CRATE ?auto_21970 ) ( AVAILABLE ?auto_21982 ) ( SURFACE-AT ?auto_21970 ?auto_21980 ) ( ON ?auto_21970 ?auto_21990 ) ( CLEAR ?auto_21970 ) ( not ( = ?auto_21969 ?auto_21970 ) ) ( not ( = ?auto_21969 ?auto_21990 ) ) ( not ( = ?auto_21970 ?auto_21990 ) ) ( IS-CRATE ?auto_21969 ) ( not ( = ?auto_22004 ?auto_21981 ) ) ( HOIST-AT ?auto_22001 ?auto_22004 ) ( AVAILABLE ?auto_22001 ) ( SURFACE-AT ?auto_21969 ?auto_22004 ) ( ON ?auto_21969 ?auto_21998 ) ( CLEAR ?auto_21969 ) ( not ( = ?auto_21968 ?auto_21969 ) ) ( not ( = ?auto_21968 ?auto_21998 ) ) ( not ( = ?auto_21969 ?auto_21998 ) ) ( not ( = ?auto_21984 ?auto_22001 ) ) ( IS-CRATE ?auto_21968 ) ( AVAILABLE ?auto_21987 ) ( SURFACE-AT ?auto_21968 ?auto_21993 ) ( ON ?auto_21968 ?auto_21994 ) ( CLEAR ?auto_21968 ) ( not ( = ?auto_21967 ?auto_21968 ) ) ( not ( = ?auto_21967 ?auto_21994 ) ) ( not ( = ?auto_21968 ?auto_21994 ) ) ( IS-CRATE ?auto_21967 ) ( not ( = ?auto_22010 ?auto_21981 ) ) ( HOIST-AT ?auto_21992 ?auto_22010 ) ( AVAILABLE ?auto_21992 ) ( SURFACE-AT ?auto_21967 ?auto_22010 ) ( ON ?auto_21967 ?auto_21991 ) ( CLEAR ?auto_21967 ) ( not ( = ?auto_21966 ?auto_21967 ) ) ( not ( = ?auto_21966 ?auto_21991 ) ) ( not ( = ?auto_21967 ?auto_21991 ) ) ( not ( = ?auto_21984 ?auto_21992 ) ) ( SURFACE-AT ?auto_21965 ?auto_21981 ) ( CLEAR ?auto_21965 ) ( IS-CRATE ?auto_21966 ) ( AVAILABLE ?auto_21984 ) ( AVAILABLE ?auto_21996 ) ( SURFACE-AT ?auto_21966 ?auto_21988 ) ( ON ?auto_21966 ?auto_21995 ) ( CLEAR ?auto_21966 ) ( TRUCK-AT ?auto_21979 ?auto_21981 ) ( not ( = ?auto_21965 ?auto_21966 ) ) ( not ( = ?auto_21965 ?auto_21995 ) ) ( not ( = ?auto_21966 ?auto_21995 ) ) ( not ( = ?auto_21965 ?auto_21967 ) ) ( not ( = ?auto_21965 ?auto_21991 ) ) ( not ( = ?auto_21967 ?auto_21995 ) ) ( not ( = ?auto_22010 ?auto_21988 ) ) ( not ( = ?auto_21992 ?auto_21996 ) ) ( not ( = ?auto_21991 ?auto_21995 ) ) ( not ( = ?auto_21965 ?auto_21968 ) ) ( not ( = ?auto_21965 ?auto_21994 ) ) ( not ( = ?auto_21966 ?auto_21968 ) ) ( not ( = ?auto_21966 ?auto_21994 ) ) ( not ( = ?auto_21968 ?auto_21991 ) ) ( not ( = ?auto_21968 ?auto_21995 ) ) ( not ( = ?auto_21993 ?auto_22010 ) ) ( not ( = ?auto_21993 ?auto_21988 ) ) ( not ( = ?auto_21987 ?auto_21992 ) ) ( not ( = ?auto_21987 ?auto_21996 ) ) ( not ( = ?auto_21994 ?auto_21991 ) ) ( not ( = ?auto_21994 ?auto_21995 ) ) ( not ( = ?auto_21965 ?auto_21969 ) ) ( not ( = ?auto_21965 ?auto_21998 ) ) ( not ( = ?auto_21966 ?auto_21969 ) ) ( not ( = ?auto_21966 ?auto_21998 ) ) ( not ( = ?auto_21967 ?auto_21969 ) ) ( not ( = ?auto_21967 ?auto_21998 ) ) ( not ( = ?auto_21969 ?auto_21994 ) ) ( not ( = ?auto_21969 ?auto_21991 ) ) ( not ( = ?auto_21969 ?auto_21995 ) ) ( not ( = ?auto_22004 ?auto_21993 ) ) ( not ( = ?auto_22004 ?auto_22010 ) ) ( not ( = ?auto_22004 ?auto_21988 ) ) ( not ( = ?auto_22001 ?auto_21987 ) ) ( not ( = ?auto_22001 ?auto_21992 ) ) ( not ( = ?auto_22001 ?auto_21996 ) ) ( not ( = ?auto_21998 ?auto_21994 ) ) ( not ( = ?auto_21998 ?auto_21991 ) ) ( not ( = ?auto_21998 ?auto_21995 ) ) ( not ( = ?auto_21965 ?auto_21970 ) ) ( not ( = ?auto_21965 ?auto_21990 ) ) ( not ( = ?auto_21966 ?auto_21970 ) ) ( not ( = ?auto_21966 ?auto_21990 ) ) ( not ( = ?auto_21967 ?auto_21970 ) ) ( not ( = ?auto_21967 ?auto_21990 ) ) ( not ( = ?auto_21968 ?auto_21970 ) ) ( not ( = ?auto_21968 ?auto_21990 ) ) ( not ( = ?auto_21970 ?auto_21998 ) ) ( not ( = ?auto_21970 ?auto_21994 ) ) ( not ( = ?auto_21970 ?auto_21991 ) ) ( not ( = ?auto_21970 ?auto_21995 ) ) ( not ( = ?auto_21980 ?auto_22004 ) ) ( not ( = ?auto_21980 ?auto_21993 ) ) ( not ( = ?auto_21980 ?auto_22010 ) ) ( not ( = ?auto_21980 ?auto_21988 ) ) ( not ( = ?auto_21982 ?auto_22001 ) ) ( not ( = ?auto_21982 ?auto_21987 ) ) ( not ( = ?auto_21982 ?auto_21992 ) ) ( not ( = ?auto_21982 ?auto_21996 ) ) ( not ( = ?auto_21990 ?auto_21998 ) ) ( not ( = ?auto_21990 ?auto_21994 ) ) ( not ( = ?auto_21990 ?auto_21991 ) ) ( not ( = ?auto_21990 ?auto_21995 ) ) ( not ( = ?auto_21965 ?auto_21971 ) ) ( not ( = ?auto_21965 ?auto_22012 ) ) ( not ( = ?auto_21966 ?auto_21971 ) ) ( not ( = ?auto_21966 ?auto_22012 ) ) ( not ( = ?auto_21967 ?auto_21971 ) ) ( not ( = ?auto_21967 ?auto_22012 ) ) ( not ( = ?auto_21968 ?auto_21971 ) ) ( not ( = ?auto_21968 ?auto_22012 ) ) ( not ( = ?auto_21969 ?auto_21971 ) ) ( not ( = ?auto_21969 ?auto_22012 ) ) ( not ( = ?auto_21971 ?auto_21990 ) ) ( not ( = ?auto_21971 ?auto_21998 ) ) ( not ( = ?auto_21971 ?auto_21994 ) ) ( not ( = ?auto_21971 ?auto_21991 ) ) ( not ( = ?auto_21971 ?auto_21995 ) ) ( not ( = ?auto_22000 ?auto_21980 ) ) ( not ( = ?auto_22000 ?auto_22004 ) ) ( not ( = ?auto_22000 ?auto_21993 ) ) ( not ( = ?auto_22000 ?auto_22010 ) ) ( not ( = ?auto_22000 ?auto_21988 ) ) ( not ( = ?auto_22011 ?auto_21982 ) ) ( not ( = ?auto_22011 ?auto_22001 ) ) ( not ( = ?auto_22011 ?auto_21987 ) ) ( not ( = ?auto_22011 ?auto_21992 ) ) ( not ( = ?auto_22011 ?auto_21996 ) ) ( not ( = ?auto_22012 ?auto_21990 ) ) ( not ( = ?auto_22012 ?auto_21998 ) ) ( not ( = ?auto_22012 ?auto_21994 ) ) ( not ( = ?auto_22012 ?auto_21991 ) ) ( not ( = ?auto_22012 ?auto_21995 ) ) ( not ( = ?auto_21965 ?auto_21974 ) ) ( not ( = ?auto_21965 ?auto_22008 ) ) ( not ( = ?auto_21966 ?auto_21974 ) ) ( not ( = ?auto_21966 ?auto_22008 ) ) ( not ( = ?auto_21967 ?auto_21974 ) ) ( not ( = ?auto_21967 ?auto_22008 ) ) ( not ( = ?auto_21968 ?auto_21974 ) ) ( not ( = ?auto_21968 ?auto_22008 ) ) ( not ( = ?auto_21969 ?auto_21974 ) ) ( not ( = ?auto_21969 ?auto_22008 ) ) ( not ( = ?auto_21970 ?auto_21974 ) ) ( not ( = ?auto_21970 ?auto_22008 ) ) ( not ( = ?auto_21974 ?auto_22012 ) ) ( not ( = ?auto_21974 ?auto_21990 ) ) ( not ( = ?auto_21974 ?auto_21998 ) ) ( not ( = ?auto_21974 ?auto_21994 ) ) ( not ( = ?auto_21974 ?auto_21991 ) ) ( not ( = ?auto_21974 ?auto_21995 ) ) ( not ( = ?auto_22007 ?auto_22000 ) ) ( not ( = ?auto_22007 ?auto_21980 ) ) ( not ( = ?auto_22007 ?auto_22004 ) ) ( not ( = ?auto_22007 ?auto_21993 ) ) ( not ( = ?auto_22007 ?auto_22010 ) ) ( not ( = ?auto_22007 ?auto_21988 ) ) ( not ( = ?auto_21999 ?auto_22011 ) ) ( not ( = ?auto_21999 ?auto_21982 ) ) ( not ( = ?auto_21999 ?auto_22001 ) ) ( not ( = ?auto_21999 ?auto_21987 ) ) ( not ( = ?auto_21999 ?auto_21992 ) ) ( not ( = ?auto_21999 ?auto_21996 ) ) ( not ( = ?auto_22008 ?auto_22012 ) ) ( not ( = ?auto_22008 ?auto_21990 ) ) ( not ( = ?auto_22008 ?auto_21998 ) ) ( not ( = ?auto_22008 ?auto_21994 ) ) ( not ( = ?auto_22008 ?auto_21991 ) ) ( not ( = ?auto_22008 ?auto_21995 ) ) ( not ( = ?auto_21965 ?auto_21973 ) ) ( not ( = ?auto_21965 ?auto_22002 ) ) ( not ( = ?auto_21966 ?auto_21973 ) ) ( not ( = ?auto_21966 ?auto_22002 ) ) ( not ( = ?auto_21967 ?auto_21973 ) ) ( not ( = ?auto_21967 ?auto_22002 ) ) ( not ( = ?auto_21968 ?auto_21973 ) ) ( not ( = ?auto_21968 ?auto_22002 ) ) ( not ( = ?auto_21969 ?auto_21973 ) ) ( not ( = ?auto_21969 ?auto_22002 ) ) ( not ( = ?auto_21970 ?auto_21973 ) ) ( not ( = ?auto_21970 ?auto_22002 ) ) ( not ( = ?auto_21971 ?auto_21973 ) ) ( not ( = ?auto_21971 ?auto_22002 ) ) ( not ( = ?auto_21973 ?auto_22008 ) ) ( not ( = ?auto_21973 ?auto_22012 ) ) ( not ( = ?auto_21973 ?auto_21990 ) ) ( not ( = ?auto_21973 ?auto_21998 ) ) ( not ( = ?auto_21973 ?auto_21994 ) ) ( not ( = ?auto_21973 ?auto_21991 ) ) ( not ( = ?auto_21973 ?auto_21995 ) ) ( not ( = ?auto_21985 ?auto_22007 ) ) ( not ( = ?auto_21985 ?auto_22000 ) ) ( not ( = ?auto_21985 ?auto_21980 ) ) ( not ( = ?auto_21985 ?auto_22004 ) ) ( not ( = ?auto_21985 ?auto_21993 ) ) ( not ( = ?auto_21985 ?auto_22010 ) ) ( not ( = ?auto_21985 ?auto_21988 ) ) ( not ( = ?auto_22009 ?auto_21999 ) ) ( not ( = ?auto_22009 ?auto_22011 ) ) ( not ( = ?auto_22009 ?auto_21982 ) ) ( not ( = ?auto_22009 ?auto_22001 ) ) ( not ( = ?auto_22009 ?auto_21987 ) ) ( not ( = ?auto_22009 ?auto_21992 ) ) ( not ( = ?auto_22009 ?auto_21996 ) ) ( not ( = ?auto_22002 ?auto_22008 ) ) ( not ( = ?auto_22002 ?auto_22012 ) ) ( not ( = ?auto_22002 ?auto_21990 ) ) ( not ( = ?auto_22002 ?auto_21998 ) ) ( not ( = ?auto_22002 ?auto_21994 ) ) ( not ( = ?auto_22002 ?auto_21991 ) ) ( not ( = ?auto_22002 ?auto_21995 ) ) ( not ( = ?auto_21965 ?auto_21972 ) ) ( not ( = ?auto_21965 ?auto_21997 ) ) ( not ( = ?auto_21966 ?auto_21972 ) ) ( not ( = ?auto_21966 ?auto_21997 ) ) ( not ( = ?auto_21967 ?auto_21972 ) ) ( not ( = ?auto_21967 ?auto_21997 ) ) ( not ( = ?auto_21968 ?auto_21972 ) ) ( not ( = ?auto_21968 ?auto_21997 ) ) ( not ( = ?auto_21969 ?auto_21972 ) ) ( not ( = ?auto_21969 ?auto_21997 ) ) ( not ( = ?auto_21970 ?auto_21972 ) ) ( not ( = ?auto_21970 ?auto_21997 ) ) ( not ( = ?auto_21971 ?auto_21972 ) ) ( not ( = ?auto_21971 ?auto_21997 ) ) ( not ( = ?auto_21974 ?auto_21972 ) ) ( not ( = ?auto_21974 ?auto_21997 ) ) ( not ( = ?auto_21972 ?auto_22002 ) ) ( not ( = ?auto_21972 ?auto_22008 ) ) ( not ( = ?auto_21972 ?auto_22012 ) ) ( not ( = ?auto_21972 ?auto_21990 ) ) ( not ( = ?auto_21972 ?auto_21998 ) ) ( not ( = ?auto_21972 ?auto_21994 ) ) ( not ( = ?auto_21972 ?auto_21991 ) ) ( not ( = ?auto_21972 ?auto_21995 ) ) ( not ( = ?auto_21997 ?auto_22002 ) ) ( not ( = ?auto_21997 ?auto_22008 ) ) ( not ( = ?auto_21997 ?auto_22012 ) ) ( not ( = ?auto_21997 ?auto_21990 ) ) ( not ( = ?auto_21997 ?auto_21998 ) ) ( not ( = ?auto_21997 ?auto_21994 ) ) ( not ( = ?auto_21997 ?auto_21991 ) ) ( not ( = ?auto_21997 ?auto_21995 ) ) ( not ( = ?auto_21965 ?auto_21975 ) ) ( not ( = ?auto_21965 ?auto_22006 ) ) ( not ( = ?auto_21966 ?auto_21975 ) ) ( not ( = ?auto_21966 ?auto_22006 ) ) ( not ( = ?auto_21967 ?auto_21975 ) ) ( not ( = ?auto_21967 ?auto_22006 ) ) ( not ( = ?auto_21968 ?auto_21975 ) ) ( not ( = ?auto_21968 ?auto_22006 ) ) ( not ( = ?auto_21969 ?auto_21975 ) ) ( not ( = ?auto_21969 ?auto_22006 ) ) ( not ( = ?auto_21970 ?auto_21975 ) ) ( not ( = ?auto_21970 ?auto_22006 ) ) ( not ( = ?auto_21971 ?auto_21975 ) ) ( not ( = ?auto_21971 ?auto_22006 ) ) ( not ( = ?auto_21974 ?auto_21975 ) ) ( not ( = ?auto_21974 ?auto_22006 ) ) ( not ( = ?auto_21973 ?auto_21975 ) ) ( not ( = ?auto_21973 ?auto_22006 ) ) ( not ( = ?auto_21975 ?auto_21997 ) ) ( not ( = ?auto_21975 ?auto_22002 ) ) ( not ( = ?auto_21975 ?auto_22008 ) ) ( not ( = ?auto_21975 ?auto_22012 ) ) ( not ( = ?auto_21975 ?auto_21990 ) ) ( not ( = ?auto_21975 ?auto_21998 ) ) ( not ( = ?auto_21975 ?auto_21994 ) ) ( not ( = ?auto_21975 ?auto_21991 ) ) ( not ( = ?auto_21975 ?auto_21995 ) ) ( not ( = ?auto_22005 ?auto_21993 ) ) ( not ( = ?auto_22005 ?auto_21985 ) ) ( not ( = ?auto_22005 ?auto_22007 ) ) ( not ( = ?auto_22005 ?auto_22000 ) ) ( not ( = ?auto_22005 ?auto_21980 ) ) ( not ( = ?auto_22005 ?auto_22004 ) ) ( not ( = ?auto_22005 ?auto_22010 ) ) ( not ( = ?auto_22005 ?auto_21988 ) ) ( not ( = ?auto_21989 ?auto_21987 ) ) ( not ( = ?auto_21989 ?auto_22009 ) ) ( not ( = ?auto_21989 ?auto_21999 ) ) ( not ( = ?auto_21989 ?auto_22011 ) ) ( not ( = ?auto_21989 ?auto_21982 ) ) ( not ( = ?auto_21989 ?auto_22001 ) ) ( not ( = ?auto_21989 ?auto_21992 ) ) ( not ( = ?auto_21989 ?auto_21996 ) ) ( not ( = ?auto_22006 ?auto_21997 ) ) ( not ( = ?auto_22006 ?auto_22002 ) ) ( not ( = ?auto_22006 ?auto_22008 ) ) ( not ( = ?auto_22006 ?auto_22012 ) ) ( not ( = ?auto_22006 ?auto_21990 ) ) ( not ( = ?auto_22006 ?auto_21998 ) ) ( not ( = ?auto_22006 ?auto_21994 ) ) ( not ( = ?auto_22006 ?auto_21991 ) ) ( not ( = ?auto_22006 ?auto_21995 ) ) ( not ( = ?auto_21965 ?auto_21976 ) ) ( not ( = ?auto_21965 ?auto_22003 ) ) ( not ( = ?auto_21966 ?auto_21976 ) ) ( not ( = ?auto_21966 ?auto_22003 ) ) ( not ( = ?auto_21967 ?auto_21976 ) ) ( not ( = ?auto_21967 ?auto_22003 ) ) ( not ( = ?auto_21968 ?auto_21976 ) ) ( not ( = ?auto_21968 ?auto_22003 ) ) ( not ( = ?auto_21969 ?auto_21976 ) ) ( not ( = ?auto_21969 ?auto_22003 ) ) ( not ( = ?auto_21970 ?auto_21976 ) ) ( not ( = ?auto_21970 ?auto_22003 ) ) ( not ( = ?auto_21971 ?auto_21976 ) ) ( not ( = ?auto_21971 ?auto_22003 ) ) ( not ( = ?auto_21974 ?auto_21976 ) ) ( not ( = ?auto_21974 ?auto_22003 ) ) ( not ( = ?auto_21973 ?auto_21976 ) ) ( not ( = ?auto_21973 ?auto_22003 ) ) ( not ( = ?auto_21972 ?auto_21976 ) ) ( not ( = ?auto_21972 ?auto_22003 ) ) ( not ( = ?auto_21976 ?auto_22006 ) ) ( not ( = ?auto_21976 ?auto_21997 ) ) ( not ( = ?auto_21976 ?auto_22002 ) ) ( not ( = ?auto_21976 ?auto_22008 ) ) ( not ( = ?auto_21976 ?auto_22012 ) ) ( not ( = ?auto_21976 ?auto_21990 ) ) ( not ( = ?auto_21976 ?auto_21998 ) ) ( not ( = ?auto_21976 ?auto_21994 ) ) ( not ( = ?auto_21976 ?auto_21991 ) ) ( not ( = ?auto_21976 ?auto_21995 ) ) ( not ( = ?auto_22003 ?auto_22006 ) ) ( not ( = ?auto_22003 ?auto_21997 ) ) ( not ( = ?auto_22003 ?auto_22002 ) ) ( not ( = ?auto_22003 ?auto_22008 ) ) ( not ( = ?auto_22003 ?auto_22012 ) ) ( not ( = ?auto_22003 ?auto_21990 ) ) ( not ( = ?auto_22003 ?auto_21998 ) ) ( not ( = ?auto_22003 ?auto_21994 ) ) ( not ( = ?auto_22003 ?auto_21991 ) ) ( not ( = ?auto_22003 ?auto_21995 ) ) ( not ( = ?auto_21965 ?auto_21977 ) ) ( not ( = ?auto_21965 ?auto_21986 ) ) ( not ( = ?auto_21966 ?auto_21977 ) ) ( not ( = ?auto_21966 ?auto_21986 ) ) ( not ( = ?auto_21967 ?auto_21977 ) ) ( not ( = ?auto_21967 ?auto_21986 ) ) ( not ( = ?auto_21968 ?auto_21977 ) ) ( not ( = ?auto_21968 ?auto_21986 ) ) ( not ( = ?auto_21969 ?auto_21977 ) ) ( not ( = ?auto_21969 ?auto_21986 ) ) ( not ( = ?auto_21970 ?auto_21977 ) ) ( not ( = ?auto_21970 ?auto_21986 ) ) ( not ( = ?auto_21971 ?auto_21977 ) ) ( not ( = ?auto_21971 ?auto_21986 ) ) ( not ( = ?auto_21974 ?auto_21977 ) ) ( not ( = ?auto_21974 ?auto_21986 ) ) ( not ( = ?auto_21973 ?auto_21977 ) ) ( not ( = ?auto_21973 ?auto_21986 ) ) ( not ( = ?auto_21972 ?auto_21977 ) ) ( not ( = ?auto_21972 ?auto_21986 ) ) ( not ( = ?auto_21975 ?auto_21977 ) ) ( not ( = ?auto_21975 ?auto_21986 ) ) ( not ( = ?auto_21977 ?auto_22003 ) ) ( not ( = ?auto_21977 ?auto_22006 ) ) ( not ( = ?auto_21977 ?auto_21997 ) ) ( not ( = ?auto_21977 ?auto_22002 ) ) ( not ( = ?auto_21977 ?auto_22008 ) ) ( not ( = ?auto_21977 ?auto_22012 ) ) ( not ( = ?auto_21977 ?auto_21990 ) ) ( not ( = ?auto_21977 ?auto_21998 ) ) ( not ( = ?auto_21977 ?auto_21994 ) ) ( not ( = ?auto_21977 ?auto_21991 ) ) ( not ( = ?auto_21977 ?auto_21995 ) ) ( not ( = ?auto_21986 ?auto_22003 ) ) ( not ( = ?auto_21986 ?auto_22006 ) ) ( not ( = ?auto_21986 ?auto_21997 ) ) ( not ( = ?auto_21986 ?auto_22002 ) ) ( not ( = ?auto_21986 ?auto_22008 ) ) ( not ( = ?auto_21986 ?auto_22012 ) ) ( not ( = ?auto_21986 ?auto_21990 ) ) ( not ( = ?auto_21986 ?auto_21998 ) ) ( not ( = ?auto_21986 ?auto_21994 ) ) ( not ( = ?auto_21986 ?auto_21991 ) ) ( not ( = ?auto_21986 ?auto_21995 ) ) ( not ( = ?auto_21965 ?auto_21978 ) ) ( not ( = ?auto_21965 ?auto_21983 ) ) ( not ( = ?auto_21966 ?auto_21978 ) ) ( not ( = ?auto_21966 ?auto_21983 ) ) ( not ( = ?auto_21967 ?auto_21978 ) ) ( not ( = ?auto_21967 ?auto_21983 ) ) ( not ( = ?auto_21968 ?auto_21978 ) ) ( not ( = ?auto_21968 ?auto_21983 ) ) ( not ( = ?auto_21969 ?auto_21978 ) ) ( not ( = ?auto_21969 ?auto_21983 ) ) ( not ( = ?auto_21970 ?auto_21978 ) ) ( not ( = ?auto_21970 ?auto_21983 ) ) ( not ( = ?auto_21971 ?auto_21978 ) ) ( not ( = ?auto_21971 ?auto_21983 ) ) ( not ( = ?auto_21974 ?auto_21978 ) ) ( not ( = ?auto_21974 ?auto_21983 ) ) ( not ( = ?auto_21973 ?auto_21978 ) ) ( not ( = ?auto_21973 ?auto_21983 ) ) ( not ( = ?auto_21972 ?auto_21978 ) ) ( not ( = ?auto_21972 ?auto_21983 ) ) ( not ( = ?auto_21975 ?auto_21978 ) ) ( not ( = ?auto_21975 ?auto_21983 ) ) ( not ( = ?auto_21976 ?auto_21978 ) ) ( not ( = ?auto_21976 ?auto_21983 ) ) ( not ( = ?auto_21978 ?auto_21986 ) ) ( not ( = ?auto_21978 ?auto_22003 ) ) ( not ( = ?auto_21978 ?auto_22006 ) ) ( not ( = ?auto_21978 ?auto_21997 ) ) ( not ( = ?auto_21978 ?auto_22002 ) ) ( not ( = ?auto_21978 ?auto_22008 ) ) ( not ( = ?auto_21978 ?auto_22012 ) ) ( not ( = ?auto_21978 ?auto_21990 ) ) ( not ( = ?auto_21978 ?auto_21998 ) ) ( not ( = ?auto_21978 ?auto_21994 ) ) ( not ( = ?auto_21978 ?auto_21991 ) ) ( not ( = ?auto_21978 ?auto_21995 ) ) ( not ( = ?auto_21983 ?auto_21986 ) ) ( not ( = ?auto_21983 ?auto_22003 ) ) ( not ( = ?auto_21983 ?auto_22006 ) ) ( not ( = ?auto_21983 ?auto_21997 ) ) ( not ( = ?auto_21983 ?auto_22002 ) ) ( not ( = ?auto_21983 ?auto_22008 ) ) ( not ( = ?auto_21983 ?auto_22012 ) ) ( not ( = ?auto_21983 ?auto_21990 ) ) ( not ( = ?auto_21983 ?auto_21998 ) ) ( not ( = ?auto_21983 ?auto_21994 ) ) ( not ( = ?auto_21983 ?auto_21991 ) ) ( not ( = ?auto_21983 ?auto_21995 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_21965 ?auto_21966 ?auto_21967 ?auto_21968 ?auto_21969 ?auto_21970 ?auto_21971 ?auto_21974 ?auto_21973 ?auto_21972 ?auto_21975 ?auto_21976 ?auto_21977 )
      ( MAKE-1CRATE ?auto_21977 ?auto_21978 )
      ( MAKE-13CRATE-VERIFY ?auto_21965 ?auto_21966 ?auto_21967 ?auto_21968 ?auto_21969 ?auto_21970 ?auto_21971 ?auto_21974 ?auto_21973 ?auto_21972 ?auto_21975 ?auto_21976 ?auto_21977 ?auto_21978 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22015 - SURFACE
      ?auto_22016 - SURFACE
    )
    :vars
    (
      ?auto_22017 - HOIST
      ?auto_22018 - PLACE
      ?auto_22020 - PLACE
      ?auto_22021 - HOIST
      ?auto_22022 - SURFACE
      ?auto_22019 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22017 ?auto_22018 ) ( SURFACE-AT ?auto_22015 ?auto_22018 ) ( CLEAR ?auto_22015 ) ( IS-CRATE ?auto_22016 ) ( AVAILABLE ?auto_22017 ) ( not ( = ?auto_22020 ?auto_22018 ) ) ( HOIST-AT ?auto_22021 ?auto_22020 ) ( AVAILABLE ?auto_22021 ) ( SURFACE-AT ?auto_22016 ?auto_22020 ) ( ON ?auto_22016 ?auto_22022 ) ( CLEAR ?auto_22016 ) ( TRUCK-AT ?auto_22019 ?auto_22018 ) ( not ( = ?auto_22015 ?auto_22016 ) ) ( not ( = ?auto_22015 ?auto_22022 ) ) ( not ( = ?auto_22016 ?auto_22022 ) ) ( not ( = ?auto_22017 ?auto_22021 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22019 ?auto_22018 ?auto_22020 )
      ( !LIFT ?auto_22021 ?auto_22016 ?auto_22022 ?auto_22020 )
      ( !LOAD ?auto_22021 ?auto_22016 ?auto_22019 ?auto_22020 )
      ( !DRIVE ?auto_22019 ?auto_22020 ?auto_22018 )
      ( !UNLOAD ?auto_22017 ?auto_22016 ?auto_22019 ?auto_22018 )
      ( !DROP ?auto_22017 ?auto_22016 ?auto_22015 ?auto_22018 )
      ( MAKE-1CRATE-VERIFY ?auto_22015 ?auto_22016 ) )
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
      ?auto_22047 - SURFACE
      ?auto_22046 - SURFACE
      ?auto_22045 - SURFACE
      ?auto_22048 - SURFACE
      ?auto_22049 - SURFACE
      ?auto_22050 - SURFACE
      ?auto_22051 - SURFACE
      ?auto_22052 - SURFACE
    )
    :vars
    (
      ?auto_22058 - HOIST
      ?auto_22057 - PLACE
      ?auto_22054 - PLACE
      ?auto_22053 - HOIST
      ?auto_22055 - SURFACE
      ?auto_22082 - PLACE
      ?auto_22079 - HOIST
      ?auto_22074 - SURFACE
      ?auto_22069 - PLACE
      ?auto_22065 - HOIST
      ?auto_22068 - SURFACE
      ?auto_22063 - PLACE
      ?auto_22078 - HOIST
      ?auto_22085 - SURFACE
      ?auto_22084 - PLACE
      ?auto_22067 - HOIST
      ?auto_22086 - SURFACE
      ?auto_22060 - SURFACE
      ?auto_22081 - PLACE
      ?auto_22083 - HOIST
      ?auto_22077 - SURFACE
      ?auto_22073 - PLACE
      ?auto_22072 - HOIST
      ?auto_22076 - SURFACE
      ?auto_22059 - PLACE
      ?auto_22066 - HOIST
      ?auto_22080 - SURFACE
      ?auto_22062 - SURFACE
      ?auto_22064 - SURFACE
      ?auto_22075 - SURFACE
      ?auto_22070 - PLACE
      ?auto_22071 - HOIST
      ?auto_22087 - SURFACE
      ?auto_22061 - SURFACE
      ?auto_22056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22058 ?auto_22057 ) ( IS-CRATE ?auto_22052 ) ( not ( = ?auto_22054 ?auto_22057 ) ) ( HOIST-AT ?auto_22053 ?auto_22054 ) ( SURFACE-AT ?auto_22052 ?auto_22054 ) ( ON ?auto_22052 ?auto_22055 ) ( CLEAR ?auto_22052 ) ( not ( = ?auto_22051 ?auto_22052 ) ) ( not ( = ?auto_22051 ?auto_22055 ) ) ( not ( = ?auto_22052 ?auto_22055 ) ) ( not ( = ?auto_22058 ?auto_22053 ) ) ( IS-CRATE ?auto_22051 ) ( not ( = ?auto_22082 ?auto_22057 ) ) ( HOIST-AT ?auto_22079 ?auto_22082 ) ( SURFACE-AT ?auto_22051 ?auto_22082 ) ( ON ?auto_22051 ?auto_22074 ) ( CLEAR ?auto_22051 ) ( not ( = ?auto_22050 ?auto_22051 ) ) ( not ( = ?auto_22050 ?auto_22074 ) ) ( not ( = ?auto_22051 ?auto_22074 ) ) ( not ( = ?auto_22058 ?auto_22079 ) ) ( IS-CRATE ?auto_22050 ) ( not ( = ?auto_22069 ?auto_22057 ) ) ( HOIST-AT ?auto_22065 ?auto_22069 ) ( SURFACE-AT ?auto_22050 ?auto_22069 ) ( ON ?auto_22050 ?auto_22068 ) ( CLEAR ?auto_22050 ) ( not ( = ?auto_22049 ?auto_22050 ) ) ( not ( = ?auto_22049 ?auto_22068 ) ) ( not ( = ?auto_22050 ?auto_22068 ) ) ( not ( = ?auto_22058 ?auto_22065 ) ) ( IS-CRATE ?auto_22049 ) ( not ( = ?auto_22063 ?auto_22057 ) ) ( HOIST-AT ?auto_22078 ?auto_22063 ) ( SURFACE-AT ?auto_22049 ?auto_22063 ) ( ON ?auto_22049 ?auto_22085 ) ( CLEAR ?auto_22049 ) ( not ( = ?auto_22048 ?auto_22049 ) ) ( not ( = ?auto_22048 ?auto_22085 ) ) ( not ( = ?auto_22049 ?auto_22085 ) ) ( not ( = ?auto_22058 ?auto_22078 ) ) ( IS-CRATE ?auto_22048 ) ( not ( = ?auto_22084 ?auto_22057 ) ) ( HOIST-AT ?auto_22067 ?auto_22084 ) ( AVAILABLE ?auto_22067 ) ( SURFACE-AT ?auto_22048 ?auto_22084 ) ( ON ?auto_22048 ?auto_22086 ) ( CLEAR ?auto_22048 ) ( not ( = ?auto_22045 ?auto_22048 ) ) ( not ( = ?auto_22045 ?auto_22086 ) ) ( not ( = ?auto_22048 ?auto_22086 ) ) ( not ( = ?auto_22058 ?auto_22067 ) ) ( IS-CRATE ?auto_22045 ) ( SURFACE-AT ?auto_22045 ?auto_22063 ) ( ON ?auto_22045 ?auto_22060 ) ( CLEAR ?auto_22045 ) ( not ( = ?auto_22046 ?auto_22045 ) ) ( not ( = ?auto_22046 ?auto_22060 ) ) ( not ( = ?auto_22045 ?auto_22060 ) ) ( IS-CRATE ?auto_22046 ) ( not ( = ?auto_22081 ?auto_22057 ) ) ( HOIST-AT ?auto_22083 ?auto_22081 ) ( AVAILABLE ?auto_22083 ) ( SURFACE-AT ?auto_22046 ?auto_22081 ) ( ON ?auto_22046 ?auto_22077 ) ( CLEAR ?auto_22046 ) ( not ( = ?auto_22047 ?auto_22046 ) ) ( not ( = ?auto_22047 ?auto_22077 ) ) ( not ( = ?auto_22046 ?auto_22077 ) ) ( not ( = ?auto_22058 ?auto_22083 ) ) ( IS-CRATE ?auto_22047 ) ( not ( = ?auto_22073 ?auto_22057 ) ) ( HOIST-AT ?auto_22072 ?auto_22073 ) ( AVAILABLE ?auto_22072 ) ( SURFACE-AT ?auto_22047 ?auto_22073 ) ( ON ?auto_22047 ?auto_22076 ) ( CLEAR ?auto_22047 ) ( not ( = ?auto_22044 ?auto_22047 ) ) ( not ( = ?auto_22044 ?auto_22076 ) ) ( not ( = ?auto_22047 ?auto_22076 ) ) ( not ( = ?auto_22058 ?auto_22072 ) ) ( IS-CRATE ?auto_22044 ) ( not ( = ?auto_22059 ?auto_22057 ) ) ( HOIST-AT ?auto_22066 ?auto_22059 ) ( AVAILABLE ?auto_22066 ) ( SURFACE-AT ?auto_22044 ?auto_22059 ) ( ON ?auto_22044 ?auto_22080 ) ( CLEAR ?auto_22044 ) ( not ( = ?auto_22043 ?auto_22044 ) ) ( not ( = ?auto_22043 ?auto_22080 ) ) ( not ( = ?auto_22044 ?auto_22080 ) ) ( not ( = ?auto_22058 ?auto_22066 ) ) ( IS-CRATE ?auto_22043 ) ( AVAILABLE ?auto_22079 ) ( SURFACE-AT ?auto_22043 ?auto_22082 ) ( ON ?auto_22043 ?auto_22062 ) ( CLEAR ?auto_22043 ) ( not ( = ?auto_22042 ?auto_22043 ) ) ( not ( = ?auto_22042 ?auto_22062 ) ) ( not ( = ?auto_22043 ?auto_22062 ) ) ( IS-CRATE ?auto_22042 ) ( AVAILABLE ?auto_22053 ) ( SURFACE-AT ?auto_22042 ?auto_22054 ) ( ON ?auto_22042 ?auto_22064 ) ( CLEAR ?auto_22042 ) ( not ( = ?auto_22041 ?auto_22042 ) ) ( not ( = ?auto_22041 ?auto_22064 ) ) ( not ( = ?auto_22042 ?auto_22064 ) ) ( IS-CRATE ?auto_22041 ) ( AVAILABLE ?auto_22078 ) ( SURFACE-AT ?auto_22041 ?auto_22063 ) ( ON ?auto_22041 ?auto_22075 ) ( CLEAR ?auto_22041 ) ( not ( = ?auto_22040 ?auto_22041 ) ) ( not ( = ?auto_22040 ?auto_22075 ) ) ( not ( = ?auto_22041 ?auto_22075 ) ) ( IS-CRATE ?auto_22040 ) ( not ( = ?auto_22070 ?auto_22057 ) ) ( HOIST-AT ?auto_22071 ?auto_22070 ) ( AVAILABLE ?auto_22071 ) ( SURFACE-AT ?auto_22040 ?auto_22070 ) ( ON ?auto_22040 ?auto_22087 ) ( CLEAR ?auto_22040 ) ( not ( = ?auto_22039 ?auto_22040 ) ) ( not ( = ?auto_22039 ?auto_22087 ) ) ( not ( = ?auto_22040 ?auto_22087 ) ) ( not ( = ?auto_22058 ?auto_22071 ) ) ( SURFACE-AT ?auto_22038 ?auto_22057 ) ( CLEAR ?auto_22038 ) ( IS-CRATE ?auto_22039 ) ( AVAILABLE ?auto_22058 ) ( AVAILABLE ?auto_22065 ) ( SURFACE-AT ?auto_22039 ?auto_22069 ) ( ON ?auto_22039 ?auto_22061 ) ( CLEAR ?auto_22039 ) ( TRUCK-AT ?auto_22056 ?auto_22057 ) ( not ( = ?auto_22038 ?auto_22039 ) ) ( not ( = ?auto_22038 ?auto_22061 ) ) ( not ( = ?auto_22039 ?auto_22061 ) ) ( not ( = ?auto_22038 ?auto_22040 ) ) ( not ( = ?auto_22038 ?auto_22087 ) ) ( not ( = ?auto_22040 ?auto_22061 ) ) ( not ( = ?auto_22070 ?auto_22069 ) ) ( not ( = ?auto_22071 ?auto_22065 ) ) ( not ( = ?auto_22087 ?auto_22061 ) ) ( not ( = ?auto_22038 ?auto_22041 ) ) ( not ( = ?auto_22038 ?auto_22075 ) ) ( not ( = ?auto_22039 ?auto_22041 ) ) ( not ( = ?auto_22039 ?auto_22075 ) ) ( not ( = ?auto_22041 ?auto_22087 ) ) ( not ( = ?auto_22041 ?auto_22061 ) ) ( not ( = ?auto_22063 ?auto_22070 ) ) ( not ( = ?auto_22063 ?auto_22069 ) ) ( not ( = ?auto_22078 ?auto_22071 ) ) ( not ( = ?auto_22078 ?auto_22065 ) ) ( not ( = ?auto_22075 ?auto_22087 ) ) ( not ( = ?auto_22075 ?auto_22061 ) ) ( not ( = ?auto_22038 ?auto_22042 ) ) ( not ( = ?auto_22038 ?auto_22064 ) ) ( not ( = ?auto_22039 ?auto_22042 ) ) ( not ( = ?auto_22039 ?auto_22064 ) ) ( not ( = ?auto_22040 ?auto_22042 ) ) ( not ( = ?auto_22040 ?auto_22064 ) ) ( not ( = ?auto_22042 ?auto_22075 ) ) ( not ( = ?auto_22042 ?auto_22087 ) ) ( not ( = ?auto_22042 ?auto_22061 ) ) ( not ( = ?auto_22054 ?auto_22063 ) ) ( not ( = ?auto_22054 ?auto_22070 ) ) ( not ( = ?auto_22054 ?auto_22069 ) ) ( not ( = ?auto_22053 ?auto_22078 ) ) ( not ( = ?auto_22053 ?auto_22071 ) ) ( not ( = ?auto_22053 ?auto_22065 ) ) ( not ( = ?auto_22064 ?auto_22075 ) ) ( not ( = ?auto_22064 ?auto_22087 ) ) ( not ( = ?auto_22064 ?auto_22061 ) ) ( not ( = ?auto_22038 ?auto_22043 ) ) ( not ( = ?auto_22038 ?auto_22062 ) ) ( not ( = ?auto_22039 ?auto_22043 ) ) ( not ( = ?auto_22039 ?auto_22062 ) ) ( not ( = ?auto_22040 ?auto_22043 ) ) ( not ( = ?auto_22040 ?auto_22062 ) ) ( not ( = ?auto_22041 ?auto_22043 ) ) ( not ( = ?auto_22041 ?auto_22062 ) ) ( not ( = ?auto_22043 ?auto_22064 ) ) ( not ( = ?auto_22043 ?auto_22075 ) ) ( not ( = ?auto_22043 ?auto_22087 ) ) ( not ( = ?auto_22043 ?auto_22061 ) ) ( not ( = ?auto_22082 ?auto_22054 ) ) ( not ( = ?auto_22082 ?auto_22063 ) ) ( not ( = ?auto_22082 ?auto_22070 ) ) ( not ( = ?auto_22082 ?auto_22069 ) ) ( not ( = ?auto_22079 ?auto_22053 ) ) ( not ( = ?auto_22079 ?auto_22078 ) ) ( not ( = ?auto_22079 ?auto_22071 ) ) ( not ( = ?auto_22079 ?auto_22065 ) ) ( not ( = ?auto_22062 ?auto_22064 ) ) ( not ( = ?auto_22062 ?auto_22075 ) ) ( not ( = ?auto_22062 ?auto_22087 ) ) ( not ( = ?auto_22062 ?auto_22061 ) ) ( not ( = ?auto_22038 ?auto_22044 ) ) ( not ( = ?auto_22038 ?auto_22080 ) ) ( not ( = ?auto_22039 ?auto_22044 ) ) ( not ( = ?auto_22039 ?auto_22080 ) ) ( not ( = ?auto_22040 ?auto_22044 ) ) ( not ( = ?auto_22040 ?auto_22080 ) ) ( not ( = ?auto_22041 ?auto_22044 ) ) ( not ( = ?auto_22041 ?auto_22080 ) ) ( not ( = ?auto_22042 ?auto_22044 ) ) ( not ( = ?auto_22042 ?auto_22080 ) ) ( not ( = ?auto_22044 ?auto_22062 ) ) ( not ( = ?auto_22044 ?auto_22064 ) ) ( not ( = ?auto_22044 ?auto_22075 ) ) ( not ( = ?auto_22044 ?auto_22087 ) ) ( not ( = ?auto_22044 ?auto_22061 ) ) ( not ( = ?auto_22059 ?auto_22082 ) ) ( not ( = ?auto_22059 ?auto_22054 ) ) ( not ( = ?auto_22059 ?auto_22063 ) ) ( not ( = ?auto_22059 ?auto_22070 ) ) ( not ( = ?auto_22059 ?auto_22069 ) ) ( not ( = ?auto_22066 ?auto_22079 ) ) ( not ( = ?auto_22066 ?auto_22053 ) ) ( not ( = ?auto_22066 ?auto_22078 ) ) ( not ( = ?auto_22066 ?auto_22071 ) ) ( not ( = ?auto_22066 ?auto_22065 ) ) ( not ( = ?auto_22080 ?auto_22062 ) ) ( not ( = ?auto_22080 ?auto_22064 ) ) ( not ( = ?auto_22080 ?auto_22075 ) ) ( not ( = ?auto_22080 ?auto_22087 ) ) ( not ( = ?auto_22080 ?auto_22061 ) ) ( not ( = ?auto_22038 ?auto_22047 ) ) ( not ( = ?auto_22038 ?auto_22076 ) ) ( not ( = ?auto_22039 ?auto_22047 ) ) ( not ( = ?auto_22039 ?auto_22076 ) ) ( not ( = ?auto_22040 ?auto_22047 ) ) ( not ( = ?auto_22040 ?auto_22076 ) ) ( not ( = ?auto_22041 ?auto_22047 ) ) ( not ( = ?auto_22041 ?auto_22076 ) ) ( not ( = ?auto_22042 ?auto_22047 ) ) ( not ( = ?auto_22042 ?auto_22076 ) ) ( not ( = ?auto_22043 ?auto_22047 ) ) ( not ( = ?auto_22043 ?auto_22076 ) ) ( not ( = ?auto_22047 ?auto_22080 ) ) ( not ( = ?auto_22047 ?auto_22062 ) ) ( not ( = ?auto_22047 ?auto_22064 ) ) ( not ( = ?auto_22047 ?auto_22075 ) ) ( not ( = ?auto_22047 ?auto_22087 ) ) ( not ( = ?auto_22047 ?auto_22061 ) ) ( not ( = ?auto_22073 ?auto_22059 ) ) ( not ( = ?auto_22073 ?auto_22082 ) ) ( not ( = ?auto_22073 ?auto_22054 ) ) ( not ( = ?auto_22073 ?auto_22063 ) ) ( not ( = ?auto_22073 ?auto_22070 ) ) ( not ( = ?auto_22073 ?auto_22069 ) ) ( not ( = ?auto_22072 ?auto_22066 ) ) ( not ( = ?auto_22072 ?auto_22079 ) ) ( not ( = ?auto_22072 ?auto_22053 ) ) ( not ( = ?auto_22072 ?auto_22078 ) ) ( not ( = ?auto_22072 ?auto_22071 ) ) ( not ( = ?auto_22072 ?auto_22065 ) ) ( not ( = ?auto_22076 ?auto_22080 ) ) ( not ( = ?auto_22076 ?auto_22062 ) ) ( not ( = ?auto_22076 ?auto_22064 ) ) ( not ( = ?auto_22076 ?auto_22075 ) ) ( not ( = ?auto_22076 ?auto_22087 ) ) ( not ( = ?auto_22076 ?auto_22061 ) ) ( not ( = ?auto_22038 ?auto_22046 ) ) ( not ( = ?auto_22038 ?auto_22077 ) ) ( not ( = ?auto_22039 ?auto_22046 ) ) ( not ( = ?auto_22039 ?auto_22077 ) ) ( not ( = ?auto_22040 ?auto_22046 ) ) ( not ( = ?auto_22040 ?auto_22077 ) ) ( not ( = ?auto_22041 ?auto_22046 ) ) ( not ( = ?auto_22041 ?auto_22077 ) ) ( not ( = ?auto_22042 ?auto_22046 ) ) ( not ( = ?auto_22042 ?auto_22077 ) ) ( not ( = ?auto_22043 ?auto_22046 ) ) ( not ( = ?auto_22043 ?auto_22077 ) ) ( not ( = ?auto_22044 ?auto_22046 ) ) ( not ( = ?auto_22044 ?auto_22077 ) ) ( not ( = ?auto_22046 ?auto_22076 ) ) ( not ( = ?auto_22046 ?auto_22080 ) ) ( not ( = ?auto_22046 ?auto_22062 ) ) ( not ( = ?auto_22046 ?auto_22064 ) ) ( not ( = ?auto_22046 ?auto_22075 ) ) ( not ( = ?auto_22046 ?auto_22087 ) ) ( not ( = ?auto_22046 ?auto_22061 ) ) ( not ( = ?auto_22081 ?auto_22073 ) ) ( not ( = ?auto_22081 ?auto_22059 ) ) ( not ( = ?auto_22081 ?auto_22082 ) ) ( not ( = ?auto_22081 ?auto_22054 ) ) ( not ( = ?auto_22081 ?auto_22063 ) ) ( not ( = ?auto_22081 ?auto_22070 ) ) ( not ( = ?auto_22081 ?auto_22069 ) ) ( not ( = ?auto_22083 ?auto_22072 ) ) ( not ( = ?auto_22083 ?auto_22066 ) ) ( not ( = ?auto_22083 ?auto_22079 ) ) ( not ( = ?auto_22083 ?auto_22053 ) ) ( not ( = ?auto_22083 ?auto_22078 ) ) ( not ( = ?auto_22083 ?auto_22071 ) ) ( not ( = ?auto_22083 ?auto_22065 ) ) ( not ( = ?auto_22077 ?auto_22076 ) ) ( not ( = ?auto_22077 ?auto_22080 ) ) ( not ( = ?auto_22077 ?auto_22062 ) ) ( not ( = ?auto_22077 ?auto_22064 ) ) ( not ( = ?auto_22077 ?auto_22075 ) ) ( not ( = ?auto_22077 ?auto_22087 ) ) ( not ( = ?auto_22077 ?auto_22061 ) ) ( not ( = ?auto_22038 ?auto_22045 ) ) ( not ( = ?auto_22038 ?auto_22060 ) ) ( not ( = ?auto_22039 ?auto_22045 ) ) ( not ( = ?auto_22039 ?auto_22060 ) ) ( not ( = ?auto_22040 ?auto_22045 ) ) ( not ( = ?auto_22040 ?auto_22060 ) ) ( not ( = ?auto_22041 ?auto_22045 ) ) ( not ( = ?auto_22041 ?auto_22060 ) ) ( not ( = ?auto_22042 ?auto_22045 ) ) ( not ( = ?auto_22042 ?auto_22060 ) ) ( not ( = ?auto_22043 ?auto_22045 ) ) ( not ( = ?auto_22043 ?auto_22060 ) ) ( not ( = ?auto_22044 ?auto_22045 ) ) ( not ( = ?auto_22044 ?auto_22060 ) ) ( not ( = ?auto_22047 ?auto_22045 ) ) ( not ( = ?auto_22047 ?auto_22060 ) ) ( not ( = ?auto_22045 ?auto_22077 ) ) ( not ( = ?auto_22045 ?auto_22076 ) ) ( not ( = ?auto_22045 ?auto_22080 ) ) ( not ( = ?auto_22045 ?auto_22062 ) ) ( not ( = ?auto_22045 ?auto_22064 ) ) ( not ( = ?auto_22045 ?auto_22075 ) ) ( not ( = ?auto_22045 ?auto_22087 ) ) ( not ( = ?auto_22045 ?auto_22061 ) ) ( not ( = ?auto_22060 ?auto_22077 ) ) ( not ( = ?auto_22060 ?auto_22076 ) ) ( not ( = ?auto_22060 ?auto_22080 ) ) ( not ( = ?auto_22060 ?auto_22062 ) ) ( not ( = ?auto_22060 ?auto_22064 ) ) ( not ( = ?auto_22060 ?auto_22075 ) ) ( not ( = ?auto_22060 ?auto_22087 ) ) ( not ( = ?auto_22060 ?auto_22061 ) ) ( not ( = ?auto_22038 ?auto_22048 ) ) ( not ( = ?auto_22038 ?auto_22086 ) ) ( not ( = ?auto_22039 ?auto_22048 ) ) ( not ( = ?auto_22039 ?auto_22086 ) ) ( not ( = ?auto_22040 ?auto_22048 ) ) ( not ( = ?auto_22040 ?auto_22086 ) ) ( not ( = ?auto_22041 ?auto_22048 ) ) ( not ( = ?auto_22041 ?auto_22086 ) ) ( not ( = ?auto_22042 ?auto_22048 ) ) ( not ( = ?auto_22042 ?auto_22086 ) ) ( not ( = ?auto_22043 ?auto_22048 ) ) ( not ( = ?auto_22043 ?auto_22086 ) ) ( not ( = ?auto_22044 ?auto_22048 ) ) ( not ( = ?auto_22044 ?auto_22086 ) ) ( not ( = ?auto_22047 ?auto_22048 ) ) ( not ( = ?auto_22047 ?auto_22086 ) ) ( not ( = ?auto_22046 ?auto_22048 ) ) ( not ( = ?auto_22046 ?auto_22086 ) ) ( not ( = ?auto_22048 ?auto_22060 ) ) ( not ( = ?auto_22048 ?auto_22077 ) ) ( not ( = ?auto_22048 ?auto_22076 ) ) ( not ( = ?auto_22048 ?auto_22080 ) ) ( not ( = ?auto_22048 ?auto_22062 ) ) ( not ( = ?auto_22048 ?auto_22064 ) ) ( not ( = ?auto_22048 ?auto_22075 ) ) ( not ( = ?auto_22048 ?auto_22087 ) ) ( not ( = ?auto_22048 ?auto_22061 ) ) ( not ( = ?auto_22084 ?auto_22063 ) ) ( not ( = ?auto_22084 ?auto_22081 ) ) ( not ( = ?auto_22084 ?auto_22073 ) ) ( not ( = ?auto_22084 ?auto_22059 ) ) ( not ( = ?auto_22084 ?auto_22082 ) ) ( not ( = ?auto_22084 ?auto_22054 ) ) ( not ( = ?auto_22084 ?auto_22070 ) ) ( not ( = ?auto_22084 ?auto_22069 ) ) ( not ( = ?auto_22067 ?auto_22078 ) ) ( not ( = ?auto_22067 ?auto_22083 ) ) ( not ( = ?auto_22067 ?auto_22072 ) ) ( not ( = ?auto_22067 ?auto_22066 ) ) ( not ( = ?auto_22067 ?auto_22079 ) ) ( not ( = ?auto_22067 ?auto_22053 ) ) ( not ( = ?auto_22067 ?auto_22071 ) ) ( not ( = ?auto_22067 ?auto_22065 ) ) ( not ( = ?auto_22086 ?auto_22060 ) ) ( not ( = ?auto_22086 ?auto_22077 ) ) ( not ( = ?auto_22086 ?auto_22076 ) ) ( not ( = ?auto_22086 ?auto_22080 ) ) ( not ( = ?auto_22086 ?auto_22062 ) ) ( not ( = ?auto_22086 ?auto_22064 ) ) ( not ( = ?auto_22086 ?auto_22075 ) ) ( not ( = ?auto_22086 ?auto_22087 ) ) ( not ( = ?auto_22086 ?auto_22061 ) ) ( not ( = ?auto_22038 ?auto_22049 ) ) ( not ( = ?auto_22038 ?auto_22085 ) ) ( not ( = ?auto_22039 ?auto_22049 ) ) ( not ( = ?auto_22039 ?auto_22085 ) ) ( not ( = ?auto_22040 ?auto_22049 ) ) ( not ( = ?auto_22040 ?auto_22085 ) ) ( not ( = ?auto_22041 ?auto_22049 ) ) ( not ( = ?auto_22041 ?auto_22085 ) ) ( not ( = ?auto_22042 ?auto_22049 ) ) ( not ( = ?auto_22042 ?auto_22085 ) ) ( not ( = ?auto_22043 ?auto_22049 ) ) ( not ( = ?auto_22043 ?auto_22085 ) ) ( not ( = ?auto_22044 ?auto_22049 ) ) ( not ( = ?auto_22044 ?auto_22085 ) ) ( not ( = ?auto_22047 ?auto_22049 ) ) ( not ( = ?auto_22047 ?auto_22085 ) ) ( not ( = ?auto_22046 ?auto_22049 ) ) ( not ( = ?auto_22046 ?auto_22085 ) ) ( not ( = ?auto_22045 ?auto_22049 ) ) ( not ( = ?auto_22045 ?auto_22085 ) ) ( not ( = ?auto_22049 ?auto_22086 ) ) ( not ( = ?auto_22049 ?auto_22060 ) ) ( not ( = ?auto_22049 ?auto_22077 ) ) ( not ( = ?auto_22049 ?auto_22076 ) ) ( not ( = ?auto_22049 ?auto_22080 ) ) ( not ( = ?auto_22049 ?auto_22062 ) ) ( not ( = ?auto_22049 ?auto_22064 ) ) ( not ( = ?auto_22049 ?auto_22075 ) ) ( not ( = ?auto_22049 ?auto_22087 ) ) ( not ( = ?auto_22049 ?auto_22061 ) ) ( not ( = ?auto_22085 ?auto_22086 ) ) ( not ( = ?auto_22085 ?auto_22060 ) ) ( not ( = ?auto_22085 ?auto_22077 ) ) ( not ( = ?auto_22085 ?auto_22076 ) ) ( not ( = ?auto_22085 ?auto_22080 ) ) ( not ( = ?auto_22085 ?auto_22062 ) ) ( not ( = ?auto_22085 ?auto_22064 ) ) ( not ( = ?auto_22085 ?auto_22075 ) ) ( not ( = ?auto_22085 ?auto_22087 ) ) ( not ( = ?auto_22085 ?auto_22061 ) ) ( not ( = ?auto_22038 ?auto_22050 ) ) ( not ( = ?auto_22038 ?auto_22068 ) ) ( not ( = ?auto_22039 ?auto_22050 ) ) ( not ( = ?auto_22039 ?auto_22068 ) ) ( not ( = ?auto_22040 ?auto_22050 ) ) ( not ( = ?auto_22040 ?auto_22068 ) ) ( not ( = ?auto_22041 ?auto_22050 ) ) ( not ( = ?auto_22041 ?auto_22068 ) ) ( not ( = ?auto_22042 ?auto_22050 ) ) ( not ( = ?auto_22042 ?auto_22068 ) ) ( not ( = ?auto_22043 ?auto_22050 ) ) ( not ( = ?auto_22043 ?auto_22068 ) ) ( not ( = ?auto_22044 ?auto_22050 ) ) ( not ( = ?auto_22044 ?auto_22068 ) ) ( not ( = ?auto_22047 ?auto_22050 ) ) ( not ( = ?auto_22047 ?auto_22068 ) ) ( not ( = ?auto_22046 ?auto_22050 ) ) ( not ( = ?auto_22046 ?auto_22068 ) ) ( not ( = ?auto_22045 ?auto_22050 ) ) ( not ( = ?auto_22045 ?auto_22068 ) ) ( not ( = ?auto_22048 ?auto_22050 ) ) ( not ( = ?auto_22048 ?auto_22068 ) ) ( not ( = ?auto_22050 ?auto_22085 ) ) ( not ( = ?auto_22050 ?auto_22086 ) ) ( not ( = ?auto_22050 ?auto_22060 ) ) ( not ( = ?auto_22050 ?auto_22077 ) ) ( not ( = ?auto_22050 ?auto_22076 ) ) ( not ( = ?auto_22050 ?auto_22080 ) ) ( not ( = ?auto_22050 ?auto_22062 ) ) ( not ( = ?auto_22050 ?auto_22064 ) ) ( not ( = ?auto_22050 ?auto_22075 ) ) ( not ( = ?auto_22050 ?auto_22087 ) ) ( not ( = ?auto_22050 ?auto_22061 ) ) ( not ( = ?auto_22068 ?auto_22085 ) ) ( not ( = ?auto_22068 ?auto_22086 ) ) ( not ( = ?auto_22068 ?auto_22060 ) ) ( not ( = ?auto_22068 ?auto_22077 ) ) ( not ( = ?auto_22068 ?auto_22076 ) ) ( not ( = ?auto_22068 ?auto_22080 ) ) ( not ( = ?auto_22068 ?auto_22062 ) ) ( not ( = ?auto_22068 ?auto_22064 ) ) ( not ( = ?auto_22068 ?auto_22075 ) ) ( not ( = ?auto_22068 ?auto_22087 ) ) ( not ( = ?auto_22068 ?auto_22061 ) ) ( not ( = ?auto_22038 ?auto_22051 ) ) ( not ( = ?auto_22038 ?auto_22074 ) ) ( not ( = ?auto_22039 ?auto_22051 ) ) ( not ( = ?auto_22039 ?auto_22074 ) ) ( not ( = ?auto_22040 ?auto_22051 ) ) ( not ( = ?auto_22040 ?auto_22074 ) ) ( not ( = ?auto_22041 ?auto_22051 ) ) ( not ( = ?auto_22041 ?auto_22074 ) ) ( not ( = ?auto_22042 ?auto_22051 ) ) ( not ( = ?auto_22042 ?auto_22074 ) ) ( not ( = ?auto_22043 ?auto_22051 ) ) ( not ( = ?auto_22043 ?auto_22074 ) ) ( not ( = ?auto_22044 ?auto_22051 ) ) ( not ( = ?auto_22044 ?auto_22074 ) ) ( not ( = ?auto_22047 ?auto_22051 ) ) ( not ( = ?auto_22047 ?auto_22074 ) ) ( not ( = ?auto_22046 ?auto_22051 ) ) ( not ( = ?auto_22046 ?auto_22074 ) ) ( not ( = ?auto_22045 ?auto_22051 ) ) ( not ( = ?auto_22045 ?auto_22074 ) ) ( not ( = ?auto_22048 ?auto_22051 ) ) ( not ( = ?auto_22048 ?auto_22074 ) ) ( not ( = ?auto_22049 ?auto_22051 ) ) ( not ( = ?auto_22049 ?auto_22074 ) ) ( not ( = ?auto_22051 ?auto_22068 ) ) ( not ( = ?auto_22051 ?auto_22085 ) ) ( not ( = ?auto_22051 ?auto_22086 ) ) ( not ( = ?auto_22051 ?auto_22060 ) ) ( not ( = ?auto_22051 ?auto_22077 ) ) ( not ( = ?auto_22051 ?auto_22076 ) ) ( not ( = ?auto_22051 ?auto_22080 ) ) ( not ( = ?auto_22051 ?auto_22062 ) ) ( not ( = ?auto_22051 ?auto_22064 ) ) ( not ( = ?auto_22051 ?auto_22075 ) ) ( not ( = ?auto_22051 ?auto_22087 ) ) ( not ( = ?auto_22051 ?auto_22061 ) ) ( not ( = ?auto_22074 ?auto_22068 ) ) ( not ( = ?auto_22074 ?auto_22085 ) ) ( not ( = ?auto_22074 ?auto_22086 ) ) ( not ( = ?auto_22074 ?auto_22060 ) ) ( not ( = ?auto_22074 ?auto_22077 ) ) ( not ( = ?auto_22074 ?auto_22076 ) ) ( not ( = ?auto_22074 ?auto_22080 ) ) ( not ( = ?auto_22074 ?auto_22062 ) ) ( not ( = ?auto_22074 ?auto_22064 ) ) ( not ( = ?auto_22074 ?auto_22075 ) ) ( not ( = ?auto_22074 ?auto_22087 ) ) ( not ( = ?auto_22074 ?auto_22061 ) ) ( not ( = ?auto_22038 ?auto_22052 ) ) ( not ( = ?auto_22038 ?auto_22055 ) ) ( not ( = ?auto_22039 ?auto_22052 ) ) ( not ( = ?auto_22039 ?auto_22055 ) ) ( not ( = ?auto_22040 ?auto_22052 ) ) ( not ( = ?auto_22040 ?auto_22055 ) ) ( not ( = ?auto_22041 ?auto_22052 ) ) ( not ( = ?auto_22041 ?auto_22055 ) ) ( not ( = ?auto_22042 ?auto_22052 ) ) ( not ( = ?auto_22042 ?auto_22055 ) ) ( not ( = ?auto_22043 ?auto_22052 ) ) ( not ( = ?auto_22043 ?auto_22055 ) ) ( not ( = ?auto_22044 ?auto_22052 ) ) ( not ( = ?auto_22044 ?auto_22055 ) ) ( not ( = ?auto_22047 ?auto_22052 ) ) ( not ( = ?auto_22047 ?auto_22055 ) ) ( not ( = ?auto_22046 ?auto_22052 ) ) ( not ( = ?auto_22046 ?auto_22055 ) ) ( not ( = ?auto_22045 ?auto_22052 ) ) ( not ( = ?auto_22045 ?auto_22055 ) ) ( not ( = ?auto_22048 ?auto_22052 ) ) ( not ( = ?auto_22048 ?auto_22055 ) ) ( not ( = ?auto_22049 ?auto_22052 ) ) ( not ( = ?auto_22049 ?auto_22055 ) ) ( not ( = ?auto_22050 ?auto_22052 ) ) ( not ( = ?auto_22050 ?auto_22055 ) ) ( not ( = ?auto_22052 ?auto_22074 ) ) ( not ( = ?auto_22052 ?auto_22068 ) ) ( not ( = ?auto_22052 ?auto_22085 ) ) ( not ( = ?auto_22052 ?auto_22086 ) ) ( not ( = ?auto_22052 ?auto_22060 ) ) ( not ( = ?auto_22052 ?auto_22077 ) ) ( not ( = ?auto_22052 ?auto_22076 ) ) ( not ( = ?auto_22052 ?auto_22080 ) ) ( not ( = ?auto_22052 ?auto_22062 ) ) ( not ( = ?auto_22052 ?auto_22064 ) ) ( not ( = ?auto_22052 ?auto_22075 ) ) ( not ( = ?auto_22052 ?auto_22087 ) ) ( not ( = ?auto_22052 ?auto_22061 ) ) ( not ( = ?auto_22055 ?auto_22074 ) ) ( not ( = ?auto_22055 ?auto_22068 ) ) ( not ( = ?auto_22055 ?auto_22085 ) ) ( not ( = ?auto_22055 ?auto_22086 ) ) ( not ( = ?auto_22055 ?auto_22060 ) ) ( not ( = ?auto_22055 ?auto_22077 ) ) ( not ( = ?auto_22055 ?auto_22076 ) ) ( not ( = ?auto_22055 ?auto_22080 ) ) ( not ( = ?auto_22055 ?auto_22062 ) ) ( not ( = ?auto_22055 ?auto_22064 ) ) ( not ( = ?auto_22055 ?auto_22075 ) ) ( not ( = ?auto_22055 ?auto_22087 ) ) ( not ( = ?auto_22055 ?auto_22061 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_22038 ?auto_22039 ?auto_22040 ?auto_22041 ?auto_22042 ?auto_22043 ?auto_22044 ?auto_22047 ?auto_22046 ?auto_22045 ?auto_22048 ?auto_22049 ?auto_22050 ?auto_22051 )
      ( MAKE-1CRATE ?auto_22051 ?auto_22052 )
      ( MAKE-14CRATE-VERIFY ?auto_22038 ?auto_22039 ?auto_22040 ?auto_22041 ?auto_22042 ?auto_22043 ?auto_22044 ?auto_22047 ?auto_22046 ?auto_22045 ?auto_22048 ?auto_22049 ?auto_22050 ?auto_22051 ?auto_22052 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22090 - SURFACE
      ?auto_22091 - SURFACE
    )
    :vars
    (
      ?auto_22092 - HOIST
      ?auto_22093 - PLACE
      ?auto_22095 - PLACE
      ?auto_22096 - HOIST
      ?auto_22097 - SURFACE
      ?auto_22094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22092 ?auto_22093 ) ( SURFACE-AT ?auto_22090 ?auto_22093 ) ( CLEAR ?auto_22090 ) ( IS-CRATE ?auto_22091 ) ( AVAILABLE ?auto_22092 ) ( not ( = ?auto_22095 ?auto_22093 ) ) ( HOIST-AT ?auto_22096 ?auto_22095 ) ( AVAILABLE ?auto_22096 ) ( SURFACE-AT ?auto_22091 ?auto_22095 ) ( ON ?auto_22091 ?auto_22097 ) ( CLEAR ?auto_22091 ) ( TRUCK-AT ?auto_22094 ?auto_22093 ) ( not ( = ?auto_22090 ?auto_22091 ) ) ( not ( = ?auto_22090 ?auto_22097 ) ) ( not ( = ?auto_22091 ?auto_22097 ) ) ( not ( = ?auto_22092 ?auto_22096 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22094 ?auto_22093 ?auto_22095 )
      ( !LIFT ?auto_22096 ?auto_22091 ?auto_22097 ?auto_22095 )
      ( !LOAD ?auto_22096 ?auto_22091 ?auto_22094 ?auto_22095 )
      ( !DRIVE ?auto_22094 ?auto_22095 ?auto_22093 )
      ( !UNLOAD ?auto_22092 ?auto_22091 ?auto_22094 ?auto_22093 )
      ( !DROP ?auto_22092 ?auto_22091 ?auto_22090 ?auto_22093 )
      ( MAKE-1CRATE-VERIFY ?auto_22090 ?auto_22091 ) )
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
      ?auto_22123 - SURFACE
      ?auto_22122 - SURFACE
      ?auto_22121 - SURFACE
      ?auto_22124 - SURFACE
      ?auto_22125 - SURFACE
      ?auto_22126 - SURFACE
      ?auto_22127 - SURFACE
      ?auto_22129 - SURFACE
      ?auto_22128 - SURFACE
    )
    :vars
    (
      ?auto_22131 - HOIST
      ?auto_22134 - PLACE
      ?auto_22132 - PLACE
      ?auto_22135 - HOIST
      ?auto_22130 - SURFACE
      ?auto_22141 - PLACE
      ?auto_22161 - HOIST
      ?auto_22138 - SURFACE
      ?auto_22159 - PLACE
      ?auto_22137 - HOIST
      ?auto_22164 - SURFACE
      ?auto_22158 - PLACE
      ?auto_22150 - HOIST
      ?auto_22152 - SURFACE
      ?auto_22156 - PLACE
      ?auto_22154 - HOIST
      ?auto_22165 - SURFACE
      ?auto_22148 - PLACE
      ?auto_22151 - HOIST
      ?auto_22140 - SURFACE
      ?auto_22147 - SURFACE
      ?auto_22160 - PLACE
      ?auto_22146 - HOIST
      ?auto_22145 - SURFACE
      ?auto_22167 - PLACE
      ?auto_22139 - HOIST
      ?auto_22142 - SURFACE
      ?auto_22136 - PLACE
      ?auto_22153 - HOIST
      ?auto_22155 - SURFACE
      ?auto_22166 - SURFACE
      ?auto_22157 - SURFACE
      ?auto_22144 - SURFACE
      ?auto_22163 - PLACE
      ?auto_22143 - HOIST
      ?auto_22162 - SURFACE
      ?auto_22149 - SURFACE
      ?auto_22133 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22131 ?auto_22134 ) ( IS-CRATE ?auto_22128 ) ( not ( = ?auto_22132 ?auto_22134 ) ) ( HOIST-AT ?auto_22135 ?auto_22132 ) ( AVAILABLE ?auto_22135 ) ( SURFACE-AT ?auto_22128 ?auto_22132 ) ( ON ?auto_22128 ?auto_22130 ) ( CLEAR ?auto_22128 ) ( not ( = ?auto_22129 ?auto_22128 ) ) ( not ( = ?auto_22129 ?auto_22130 ) ) ( not ( = ?auto_22128 ?auto_22130 ) ) ( not ( = ?auto_22131 ?auto_22135 ) ) ( IS-CRATE ?auto_22129 ) ( not ( = ?auto_22141 ?auto_22134 ) ) ( HOIST-AT ?auto_22161 ?auto_22141 ) ( SURFACE-AT ?auto_22129 ?auto_22141 ) ( ON ?auto_22129 ?auto_22138 ) ( CLEAR ?auto_22129 ) ( not ( = ?auto_22127 ?auto_22129 ) ) ( not ( = ?auto_22127 ?auto_22138 ) ) ( not ( = ?auto_22129 ?auto_22138 ) ) ( not ( = ?auto_22131 ?auto_22161 ) ) ( IS-CRATE ?auto_22127 ) ( not ( = ?auto_22159 ?auto_22134 ) ) ( HOIST-AT ?auto_22137 ?auto_22159 ) ( SURFACE-AT ?auto_22127 ?auto_22159 ) ( ON ?auto_22127 ?auto_22164 ) ( CLEAR ?auto_22127 ) ( not ( = ?auto_22126 ?auto_22127 ) ) ( not ( = ?auto_22126 ?auto_22164 ) ) ( not ( = ?auto_22127 ?auto_22164 ) ) ( not ( = ?auto_22131 ?auto_22137 ) ) ( IS-CRATE ?auto_22126 ) ( not ( = ?auto_22158 ?auto_22134 ) ) ( HOIST-AT ?auto_22150 ?auto_22158 ) ( SURFACE-AT ?auto_22126 ?auto_22158 ) ( ON ?auto_22126 ?auto_22152 ) ( CLEAR ?auto_22126 ) ( not ( = ?auto_22125 ?auto_22126 ) ) ( not ( = ?auto_22125 ?auto_22152 ) ) ( not ( = ?auto_22126 ?auto_22152 ) ) ( not ( = ?auto_22131 ?auto_22150 ) ) ( IS-CRATE ?auto_22125 ) ( not ( = ?auto_22156 ?auto_22134 ) ) ( HOIST-AT ?auto_22154 ?auto_22156 ) ( SURFACE-AT ?auto_22125 ?auto_22156 ) ( ON ?auto_22125 ?auto_22165 ) ( CLEAR ?auto_22125 ) ( not ( = ?auto_22124 ?auto_22125 ) ) ( not ( = ?auto_22124 ?auto_22165 ) ) ( not ( = ?auto_22125 ?auto_22165 ) ) ( not ( = ?auto_22131 ?auto_22154 ) ) ( IS-CRATE ?auto_22124 ) ( not ( = ?auto_22148 ?auto_22134 ) ) ( HOIST-AT ?auto_22151 ?auto_22148 ) ( AVAILABLE ?auto_22151 ) ( SURFACE-AT ?auto_22124 ?auto_22148 ) ( ON ?auto_22124 ?auto_22140 ) ( CLEAR ?auto_22124 ) ( not ( = ?auto_22121 ?auto_22124 ) ) ( not ( = ?auto_22121 ?auto_22140 ) ) ( not ( = ?auto_22124 ?auto_22140 ) ) ( not ( = ?auto_22131 ?auto_22151 ) ) ( IS-CRATE ?auto_22121 ) ( SURFACE-AT ?auto_22121 ?auto_22156 ) ( ON ?auto_22121 ?auto_22147 ) ( CLEAR ?auto_22121 ) ( not ( = ?auto_22122 ?auto_22121 ) ) ( not ( = ?auto_22122 ?auto_22147 ) ) ( not ( = ?auto_22121 ?auto_22147 ) ) ( IS-CRATE ?auto_22122 ) ( not ( = ?auto_22160 ?auto_22134 ) ) ( HOIST-AT ?auto_22146 ?auto_22160 ) ( AVAILABLE ?auto_22146 ) ( SURFACE-AT ?auto_22122 ?auto_22160 ) ( ON ?auto_22122 ?auto_22145 ) ( CLEAR ?auto_22122 ) ( not ( = ?auto_22123 ?auto_22122 ) ) ( not ( = ?auto_22123 ?auto_22145 ) ) ( not ( = ?auto_22122 ?auto_22145 ) ) ( not ( = ?auto_22131 ?auto_22146 ) ) ( IS-CRATE ?auto_22123 ) ( not ( = ?auto_22167 ?auto_22134 ) ) ( HOIST-AT ?auto_22139 ?auto_22167 ) ( AVAILABLE ?auto_22139 ) ( SURFACE-AT ?auto_22123 ?auto_22167 ) ( ON ?auto_22123 ?auto_22142 ) ( CLEAR ?auto_22123 ) ( not ( = ?auto_22120 ?auto_22123 ) ) ( not ( = ?auto_22120 ?auto_22142 ) ) ( not ( = ?auto_22123 ?auto_22142 ) ) ( not ( = ?auto_22131 ?auto_22139 ) ) ( IS-CRATE ?auto_22120 ) ( not ( = ?auto_22136 ?auto_22134 ) ) ( HOIST-AT ?auto_22153 ?auto_22136 ) ( AVAILABLE ?auto_22153 ) ( SURFACE-AT ?auto_22120 ?auto_22136 ) ( ON ?auto_22120 ?auto_22155 ) ( CLEAR ?auto_22120 ) ( not ( = ?auto_22119 ?auto_22120 ) ) ( not ( = ?auto_22119 ?auto_22155 ) ) ( not ( = ?auto_22120 ?auto_22155 ) ) ( not ( = ?auto_22131 ?auto_22153 ) ) ( IS-CRATE ?auto_22119 ) ( AVAILABLE ?auto_22137 ) ( SURFACE-AT ?auto_22119 ?auto_22159 ) ( ON ?auto_22119 ?auto_22166 ) ( CLEAR ?auto_22119 ) ( not ( = ?auto_22118 ?auto_22119 ) ) ( not ( = ?auto_22118 ?auto_22166 ) ) ( not ( = ?auto_22119 ?auto_22166 ) ) ( IS-CRATE ?auto_22118 ) ( AVAILABLE ?auto_22161 ) ( SURFACE-AT ?auto_22118 ?auto_22141 ) ( ON ?auto_22118 ?auto_22157 ) ( CLEAR ?auto_22118 ) ( not ( = ?auto_22117 ?auto_22118 ) ) ( not ( = ?auto_22117 ?auto_22157 ) ) ( not ( = ?auto_22118 ?auto_22157 ) ) ( IS-CRATE ?auto_22117 ) ( AVAILABLE ?auto_22154 ) ( SURFACE-AT ?auto_22117 ?auto_22156 ) ( ON ?auto_22117 ?auto_22144 ) ( CLEAR ?auto_22117 ) ( not ( = ?auto_22116 ?auto_22117 ) ) ( not ( = ?auto_22116 ?auto_22144 ) ) ( not ( = ?auto_22117 ?auto_22144 ) ) ( IS-CRATE ?auto_22116 ) ( not ( = ?auto_22163 ?auto_22134 ) ) ( HOIST-AT ?auto_22143 ?auto_22163 ) ( AVAILABLE ?auto_22143 ) ( SURFACE-AT ?auto_22116 ?auto_22163 ) ( ON ?auto_22116 ?auto_22162 ) ( CLEAR ?auto_22116 ) ( not ( = ?auto_22115 ?auto_22116 ) ) ( not ( = ?auto_22115 ?auto_22162 ) ) ( not ( = ?auto_22116 ?auto_22162 ) ) ( not ( = ?auto_22131 ?auto_22143 ) ) ( SURFACE-AT ?auto_22114 ?auto_22134 ) ( CLEAR ?auto_22114 ) ( IS-CRATE ?auto_22115 ) ( AVAILABLE ?auto_22131 ) ( AVAILABLE ?auto_22150 ) ( SURFACE-AT ?auto_22115 ?auto_22158 ) ( ON ?auto_22115 ?auto_22149 ) ( CLEAR ?auto_22115 ) ( TRUCK-AT ?auto_22133 ?auto_22134 ) ( not ( = ?auto_22114 ?auto_22115 ) ) ( not ( = ?auto_22114 ?auto_22149 ) ) ( not ( = ?auto_22115 ?auto_22149 ) ) ( not ( = ?auto_22114 ?auto_22116 ) ) ( not ( = ?auto_22114 ?auto_22162 ) ) ( not ( = ?auto_22116 ?auto_22149 ) ) ( not ( = ?auto_22163 ?auto_22158 ) ) ( not ( = ?auto_22143 ?auto_22150 ) ) ( not ( = ?auto_22162 ?auto_22149 ) ) ( not ( = ?auto_22114 ?auto_22117 ) ) ( not ( = ?auto_22114 ?auto_22144 ) ) ( not ( = ?auto_22115 ?auto_22117 ) ) ( not ( = ?auto_22115 ?auto_22144 ) ) ( not ( = ?auto_22117 ?auto_22162 ) ) ( not ( = ?auto_22117 ?auto_22149 ) ) ( not ( = ?auto_22156 ?auto_22163 ) ) ( not ( = ?auto_22156 ?auto_22158 ) ) ( not ( = ?auto_22154 ?auto_22143 ) ) ( not ( = ?auto_22154 ?auto_22150 ) ) ( not ( = ?auto_22144 ?auto_22162 ) ) ( not ( = ?auto_22144 ?auto_22149 ) ) ( not ( = ?auto_22114 ?auto_22118 ) ) ( not ( = ?auto_22114 ?auto_22157 ) ) ( not ( = ?auto_22115 ?auto_22118 ) ) ( not ( = ?auto_22115 ?auto_22157 ) ) ( not ( = ?auto_22116 ?auto_22118 ) ) ( not ( = ?auto_22116 ?auto_22157 ) ) ( not ( = ?auto_22118 ?auto_22144 ) ) ( not ( = ?auto_22118 ?auto_22162 ) ) ( not ( = ?auto_22118 ?auto_22149 ) ) ( not ( = ?auto_22141 ?auto_22156 ) ) ( not ( = ?auto_22141 ?auto_22163 ) ) ( not ( = ?auto_22141 ?auto_22158 ) ) ( not ( = ?auto_22161 ?auto_22154 ) ) ( not ( = ?auto_22161 ?auto_22143 ) ) ( not ( = ?auto_22161 ?auto_22150 ) ) ( not ( = ?auto_22157 ?auto_22144 ) ) ( not ( = ?auto_22157 ?auto_22162 ) ) ( not ( = ?auto_22157 ?auto_22149 ) ) ( not ( = ?auto_22114 ?auto_22119 ) ) ( not ( = ?auto_22114 ?auto_22166 ) ) ( not ( = ?auto_22115 ?auto_22119 ) ) ( not ( = ?auto_22115 ?auto_22166 ) ) ( not ( = ?auto_22116 ?auto_22119 ) ) ( not ( = ?auto_22116 ?auto_22166 ) ) ( not ( = ?auto_22117 ?auto_22119 ) ) ( not ( = ?auto_22117 ?auto_22166 ) ) ( not ( = ?auto_22119 ?auto_22157 ) ) ( not ( = ?auto_22119 ?auto_22144 ) ) ( not ( = ?auto_22119 ?auto_22162 ) ) ( not ( = ?auto_22119 ?auto_22149 ) ) ( not ( = ?auto_22159 ?auto_22141 ) ) ( not ( = ?auto_22159 ?auto_22156 ) ) ( not ( = ?auto_22159 ?auto_22163 ) ) ( not ( = ?auto_22159 ?auto_22158 ) ) ( not ( = ?auto_22137 ?auto_22161 ) ) ( not ( = ?auto_22137 ?auto_22154 ) ) ( not ( = ?auto_22137 ?auto_22143 ) ) ( not ( = ?auto_22137 ?auto_22150 ) ) ( not ( = ?auto_22166 ?auto_22157 ) ) ( not ( = ?auto_22166 ?auto_22144 ) ) ( not ( = ?auto_22166 ?auto_22162 ) ) ( not ( = ?auto_22166 ?auto_22149 ) ) ( not ( = ?auto_22114 ?auto_22120 ) ) ( not ( = ?auto_22114 ?auto_22155 ) ) ( not ( = ?auto_22115 ?auto_22120 ) ) ( not ( = ?auto_22115 ?auto_22155 ) ) ( not ( = ?auto_22116 ?auto_22120 ) ) ( not ( = ?auto_22116 ?auto_22155 ) ) ( not ( = ?auto_22117 ?auto_22120 ) ) ( not ( = ?auto_22117 ?auto_22155 ) ) ( not ( = ?auto_22118 ?auto_22120 ) ) ( not ( = ?auto_22118 ?auto_22155 ) ) ( not ( = ?auto_22120 ?auto_22166 ) ) ( not ( = ?auto_22120 ?auto_22157 ) ) ( not ( = ?auto_22120 ?auto_22144 ) ) ( not ( = ?auto_22120 ?auto_22162 ) ) ( not ( = ?auto_22120 ?auto_22149 ) ) ( not ( = ?auto_22136 ?auto_22159 ) ) ( not ( = ?auto_22136 ?auto_22141 ) ) ( not ( = ?auto_22136 ?auto_22156 ) ) ( not ( = ?auto_22136 ?auto_22163 ) ) ( not ( = ?auto_22136 ?auto_22158 ) ) ( not ( = ?auto_22153 ?auto_22137 ) ) ( not ( = ?auto_22153 ?auto_22161 ) ) ( not ( = ?auto_22153 ?auto_22154 ) ) ( not ( = ?auto_22153 ?auto_22143 ) ) ( not ( = ?auto_22153 ?auto_22150 ) ) ( not ( = ?auto_22155 ?auto_22166 ) ) ( not ( = ?auto_22155 ?auto_22157 ) ) ( not ( = ?auto_22155 ?auto_22144 ) ) ( not ( = ?auto_22155 ?auto_22162 ) ) ( not ( = ?auto_22155 ?auto_22149 ) ) ( not ( = ?auto_22114 ?auto_22123 ) ) ( not ( = ?auto_22114 ?auto_22142 ) ) ( not ( = ?auto_22115 ?auto_22123 ) ) ( not ( = ?auto_22115 ?auto_22142 ) ) ( not ( = ?auto_22116 ?auto_22123 ) ) ( not ( = ?auto_22116 ?auto_22142 ) ) ( not ( = ?auto_22117 ?auto_22123 ) ) ( not ( = ?auto_22117 ?auto_22142 ) ) ( not ( = ?auto_22118 ?auto_22123 ) ) ( not ( = ?auto_22118 ?auto_22142 ) ) ( not ( = ?auto_22119 ?auto_22123 ) ) ( not ( = ?auto_22119 ?auto_22142 ) ) ( not ( = ?auto_22123 ?auto_22155 ) ) ( not ( = ?auto_22123 ?auto_22166 ) ) ( not ( = ?auto_22123 ?auto_22157 ) ) ( not ( = ?auto_22123 ?auto_22144 ) ) ( not ( = ?auto_22123 ?auto_22162 ) ) ( not ( = ?auto_22123 ?auto_22149 ) ) ( not ( = ?auto_22167 ?auto_22136 ) ) ( not ( = ?auto_22167 ?auto_22159 ) ) ( not ( = ?auto_22167 ?auto_22141 ) ) ( not ( = ?auto_22167 ?auto_22156 ) ) ( not ( = ?auto_22167 ?auto_22163 ) ) ( not ( = ?auto_22167 ?auto_22158 ) ) ( not ( = ?auto_22139 ?auto_22153 ) ) ( not ( = ?auto_22139 ?auto_22137 ) ) ( not ( = ?auto_22139 ?auto_22161 ) ) ( not ( = ?auto_22139 ?auto_22154 ) ) ( not ( = ?auto_22139 ?auto_22143 ) ) ( not ( = ?auto_22139 ?auto_22150 ) ) ( not ( = ?auto_22142 ?auto_22155 ) ) ( not ( = ?auto_22142 ?auto_22166 ) ) ( not ( = ?auto_22142 ?auto_22157 ) ) ( not ( = ?auto_22142 ?auto_22144 ) ) ( not ( = ?auto_22142 ?auto_22162 ) ) ( not ( = ?auto_22142 ?auto_22149 ) ) ( not ( = ?auto_22114 ?auto_22122 ) ) ( not ( = ?auto_22114 ?auto_22145 ) ) ( not ( = ?auto_22115 ?auto_22122 ) ) ( not ( = ?auto_22115 ?auto_22145 ) ) ( not ( = ?auto_22116 ?auto_22122 ) ) ( not ( = ?auto_22116 ?auto_22145 ) ) ( not ( = ?auto_22117 ?auto_22122 ) ) ( not ( = ?auto_22117 ?auto_22145 ) ) ( not ( = ?auto_22118 ?auto_22122 ) ) ( not ( = ?auto_22118 ?auto_22145 ) ) ( not ( = ?auto_22119 ?auto_22122 ) ) ( not ( = ?auto_22119 ?auto_22145 ) ) ( not ( = ?auto_22120 ?auto_22122 ) ) ( not ( = ?auto_22120 ?auto_22145 ) ) ( not ( = ?auto_22122 ?auto_22142 ) ) ( not ( = ?auto_22122 ?auto_22155 ) ) ( not ( = ?auto_22122 ?auto_22166 ) ) ( not ( = ?auto_22122 ?auto_22157 ) ) ( not ( = ?auto_22122 ?auto_22144 ) ) ( not ( = ?auto_22122 ?auto_22162 ) ) ( not ( = ?auto_22122 ?auto_22149 ) ) ( not ( = ?auto_22160 ?auto_22167 ) ) ( not ( = ?auto_22160 ?auto_22136 ) ) ( not ( = ?auto_22160 ?auto_22159 ) ) ( not ( = ?auto_22160 ?auto_22141 ) ) ( not ( = ?auto_22160 ?auto_22156 ) ) ( not ( = ?auto_22160 ?auto_22163 ) ) ( not ( = ?auto_22160 ?auto_22158 ) ) ( not ( = ?auto_22146 ?auto_22139 ) ) ( not ( = ?auto_22146 ?auto_22153 ) ) ( not ( = ?auto_22146 ?auto_22137 ) ) ( not ( = ?auto_22146 ?auto_22161 ) ) ( not ( = ?auto_22146 ?auto_22154 ) ) ( not ( = ?auto_22146 ?auto_22143 ) ) ( not ( = ?auto_22146 ?auto_22150 ) ) ( not ( = ?auto_22145 ?auto_22142 ) ) ( not ( = ?auto_22145 ?auto_22155 ) ) ( not ( = ?auto_22145 ?auto_22166 ) ) ( not ( = ?auto_22145 ?auto_22157 ) ) ( not ( = ?auto_22145 ?auto_22144 ) ) ( not ( = ?auto_22145 ?auto_22162 ) ) ( not ( = ?auto_22145 ?auto_22149 ) ) ( not ( = ?auto_22114 ?auto_22121 ) ) ( not ( = ?auto_22114 ?auto_22147 ) ) ( not ( = ?auto_22115 ?auto_22121 ) ) ( not ( = ?auto_22115 ?auto_22147 ) ) ( not ( = ?auto_22116 ?auto_22121 ) ) ( not ( = ?auto_22116 ?auto_22147 ) ) ( not ( = ?auto_22117 ?auto_22121 ) ) ( not ( = ?auto_22117 ?auto_22147 ) ) ( not ( = ?auto_22118 ?auto_22121 ) ) ( not ( = ?auto_22118 ?auto_22147 ) ) ( not ( = ?auto_22119 ?auto_22121 ) ) ( not ( = ?auto_22119 ?auto_22147 ) ) ( not ( = ?auto_22120 ?auto_22121 ) ) ( not ( = ?auto_22120 ?auto_22147 ) ) ( not ( = ?auto_22123 ?auto_22121 ) ) ( not ( = ?auto_22123 ?auto_22147 ) ) ( not ( = ?auto_22121 ?auto_22145 ) ) ( not ( = ?auto_22121 ?auto_22142 ) ) ( not ( = ?auto_22121 ?auto_22155 ) ) ( not ( = ?auto_22121 ?auto_22166 ) ) ( not ( = ?auto_22121 ?auto_22157 ) ) ( not ( = ?auto_22121 ?auto_22144 ) ) ( not ( = ?auto_22121 ?auto_22162 ) ) ( not ( = ?auto_22121 ?auto_22149 ) ) ( not ( = ?auto_22147 ?auto_22145 ) ) ( not ( = ?auto_22147 ?auto_22142 ) ) ( not ( = ?auto_22147 ?auto_22155 ) ) ( not ( = ?auto_22147 ?auto_22166 ) ) ( not ( = ?auto_22147 ?auto_22157 ) ) ( not ( = ?auto_22147 ?auto_22144 ) ) ( not ( = ?auto_22147 ?auto_22162 ) ) ( not ( = ?auto_22147 ?auto_22149 ) ) ( not ( = ?auto_22114 ?auto_22124 ) ) ( not ( = ?auto_22114 ?auto_22140 ) ) ( not ( = ?auto_22115 ?auto_22124 ) ) ( not ( = ?auto_22115 ?auto_22140 ) ) ( not ( = ?auto_22116 ?auto_22124 ) ) ( not ( = ?auto_22116 ?auto_22140 ) ) ( not ( = ?auto_22117 ?auto_22124 ) ) ( not ( = ?auto_22117 ?auto_22140 ) ) ( not ( = ?auto_22118 ?auto_22124 ) ) ( not ( = ?auto_22118 ?auto_22140 ) ) ( not ( = ?auto_22119 ?auto_22124 ) ) ( not ( = ?auto_22119 ?auto_22140 ) ) ( not ( = ?auto_22120 ?auto_22124 ) ) ( not ( = ?auto_22120 ?auto_22140 ) ) ( not ( = ?auto_22123 ?auto_22124 ) ) ( not ( = ?auto_22123 ?auto_22140 ) ) ( not ( = ?auto_22122 ?auto_22124 ) ) ( not ( = ?auto_22122 ?auto_22140 ) ) ( not ( = ?auto_22124 ?auto_22147 ) ) ( not ( = ?auto_22124 ?auto_22145 ) ) ( not ( = ?auto_22124 ?auto_22142 ) ) ( not ( = ?auto_22124 ?auto_22155 ) ) ( not ( = ?auto_22124 ?auto_22166 ) ) ( not ( = ?auto_22124 ?auto_22157 ) ) ( not ( = ?auto_22124 ?auto_22144 ) ) ( not ( = ?auto_22124 ?auto_22162 ) ) ( not ( = ?auto_22124 ?auto_22149 ) ) ( not ( = ?auto_22148 ?auto_22156 ) ) ( not ( = ?auto_22148 ?auto_22160 ) ) ( not ( = ?auto_22148 ?auto_22167 ) ) ( not ( = ?auto_22148 ?auto_22136 ) ) ( not ( = ?auto_22148 ?auto_22159 ) ) ( not ( = ?auto_22148 ?auto_22141 ) ) ( not ( = ?auto_22148 ?auto_22163 ) ) ( not ( = ?auto_22148 ?auto_22158 ) ) ( not ( = ?auto_22151 ?auto_22154 ) ) ( not ( = ?auto_22151 ?auto_22146 ) ) ( not ( = ?auto_22151 ?auto_22139 ) ) ( not ( = ?auto_22151 ?auto_22153 ) ) ( not ( = ?auto_22151 ?auto_22137 ) ) ( not ( = ?auto_22151 ?auto_22161 ) ) ( not ( = ?auto_22151 ?auto_22143 ) ) ( not ( = ?auto_22151 ?auto_22150 ) ) ( not ( = ?auto_22140 ?auto_22147 ) ) ( not ( = ?auto_22140 ?auto_22145 ) ) ( not ( = ?auto_22140 ?auto_22142 ) ) ( not ( = ?auto_22140 ?auto_22155 ) ) ( not ( = ?auto_22140 ?auto_22166 ) ) ( not ( = ?auto_22140 ?auto_22157 ) ) ( not ( = ?auto_22140 ?auto_22144 ) ) ( not ( = ?auto_22140 ?auto_22162 ) ) ( not ( = ?auto_22140 ?auto_22149 ) ) ( not ( = ?auto_22114 ?auto_22125 ) ) ( not ( = ?auto_22114 ?auto_22165 ) ) ( not ( = ?auto_22115 ?auto_22125 ) ) ( not ( = ?auto_22115 ?auto_22165 ) ) ( not ( = ?auto_22116 ?auto_22125 ) ) ( not ( = ?auto_22116 ?auto_22165 ) ) ( not ( = ?auto_22117 ?auto_22125 ) ) ( not ( = ?auto_22117 ?auto_22165 ) ) ( not ( = ?auto_22118 ?auto_22125 ) ) ( not ( = ?auto_22118 ?auto_22165 ) ) ( not ( = ?auto_22119 ?auto_22125 ) ) ( not ( = ?auto_22119 ?auto_22165 ) ) ( not ( = ?auto_22120 ?auto_22125 ) ) ( not ( = ?auto_22120 ?auto_22165 ) ) ( not ( = ?auto_22123 ?auto_22125 ) ) ( not ( = ?auto_22123 ?auto_22165 ) ) ( not ( = ?auto_22122 ?auto_22125 ) ) ( not ( = ?auto_22122 ?auto_22165 ) ) ( not ( = ?auto_22121 ?auto_22125 ) ) ( not ( = ?auto_22121 ?auto_22165 ) ) ( not ( = ?auto_22125 ?auto_22140 ) ) ( not ( = ?auto_22125 ?auto_22147 ) ) ( not ( = ?auto_22125 ?auto_22145 ) ) ( not ( = ?auto_22125 ?auto_22142 ) ) ( not ( = ?auto_22125 ?auto_22155 ) ) ( not ( = ?auto_22125 ?auto_22166 ) ) ( not ( = ?auto_22125 ?auto_22157 ) ) ( not ( = ?auto_22125 ?auto_22144 ) ) ( not ( = ?auto_22125 ?auto_22162 ) ) ( not ( = ?auto_22125 ?auto_22149 ) ) ( not ( = ?auto_22165 ?auto_22140 ) ) ( not ( = ?auto_22165 ?auto_22147 ) ) ( not ( = ?auto_22165 ?auto_22145 ) ) ( not ( = ?auto_22165 ?auto_22142 ) ) ( not ( = ?auto_22165 ?auto_22155 ) ) ( not ( = ?auto_22165 ?auto_22166 ) ) ( not ( = ?auto_22165 ?auto_22157 ) ) ( not ( = ?auto_22165 ?auto_22144 ) ) ( not ( = ?auto_22165 ?auto_22162 ) ) ( not ( = ?auto_22165 ?auto_22149 ) ) ( not ( = ?auto_22114 ?auto_22126 ) ) ( not ( = ?auto_22114 ?auto_22152 ) ) ( not ( = ?auto_22115 ?auto_22126 ) ) ( not ( = ?auto_22115 ?auto_22152 ) ) ( not ( = ?auto_22116 ?auto_22126 ) ) ( not ( = ?auto_22116 ?auto_22152 ) ) ( not ( = ?auto_22117 ?auto_22126 ) ) ( not ( = ?auto_22117 ?auto_22152 ) ) ( not ( = ?auto_22118 ?auto_22126 ) ) ( not ( = ?auto_22118 ?auto_22152 ) ) ( not ( = ?auto_22119 ?auto_22126 ) ) ( not ( = ?auto_22119 ?auto_22152 ) ) ( not ( = ?auto_22120 ?auto_22126 ) ) ( not ( = ?auto_22120 ?auto_22152 ) ) ( not ( = ?auto_22123 ?auto_22126 ) ) ( not ( = ?auto_22123 ?auto_22152 ) ) ( not ( = ?auto_22122 ?auto_22126 ) ) ( not ( = ?auto_22122 ?auto_22152 ) ) ( not ( = ?auto_22121 ?auto_22126 ) ) ( not ( = ?auto_22121 ?auto_22152 ) ) ( not ( = ?auto_22124 ?auto_22126 ) ) ( not ( = ?auto_22124 ?auto_22152 ) ) ( not ( = ?auto_22126 ?auto_22165 ) ) ( not ( = ?auto_22126 ?auto_22140 ) ) ( not ( = ?auto_22126 ?auto_22147 ) ) ( not ( = ?auto_22126 ?auto_22145 ) ) ( not ( = ?auto_22126 ?auto_22142 ) ) ( not ( = ?auto_22126 ?auto_22155 ) ) ( not ( = ?auto_22126 ?auto_22166 ) ) ( not ( = ?auto_22126 ?auto_22157 ) ) ( not ( = ?auto_22126 ?auto_22144 ) ) ( not ( = ?auto_22126 ?auto_22162 ) ) ( not ( = ?auto_22126 ?auto_22149 ) ) ( not ( = ?auto_22152 ?auto_22165 ) ) ( not ( = ?auto_22152 ?auto_22140 ) ) ( not ( = ?auto_22152 ?auto_22147 ) ) ( not ( = ?auto_22152 ?auto_22145 ) ) ( not ( = ?auto_22152 ?auto_22142 ) ) ( not ( = ?auto_22152 ?auto_22155 ) ) ( not ( = ?auto_22152 ?auto_22166 ) ) ( not ( = ?auto_22152 ?auto_22157 ) ) ( not ( = ?auto_22152 ?auto_22144 ) ) ( not ( = ?auto_22152 ?auto_22162 ) ) ( not ( = ?auto_22152 ?auto_22149 ) ) ( not ( = ?auto_22114 ?auto_22127 ) ) ( not ( = ?auto_22114 ?auto_22164 ) ) ( not ( = ?auto_22115 ?auto_22127 ) ) ( not ( = ?auto_22115 ?auto_22164 ) ) ( not ( = ?auto_22116 ?auto_22127 ) ) ( not ( = ?auto_22116 ?auto_22164 ) ) ( not ( = ?auto_22117 ?auto_22127 ) ) ( not ( = ?auto_22117 ?auto_22164 ) ) ( not ( = ?auto_22118 ?auto_22127 ) ) ( not ( = ?auto_22118 ?auto_22164 ) ) ( not ( = ?auto_22119 ?auto_22127 ) ) ( not ( = ?auto_22119 ?auto_22164 ) ) ( not ( = ?auto_22120 ?auto_22127 ) ) ( not ( = ?auto_22120 ?auto_22164 ) ) ( not ( = ?auto_22123 ?auto_22127 ) ) ( not ( = ?auto_22123 ?auto_22164 ) ) ( not ( = ?auto_22122 ?auto_22127 ) ) ( not ( = ?auto_22122 ?auto_22164 ) ) ( not ( = ?auto_22121 ?auto_22127 ) ) ( not ( = ?auto_22121 ?auto_22164 ) ) ( not ( = ?auto_22124 ?auto_22127 ) ) ( not ( = ?auto_22124 ?auto_22164 ) ) ( not ( = ?auto_22125 ?auto_22127 ) ) ( not ( = ?auto_22125 ?auto_22164 ) ) ( not ( = ?auto_22127 ?auto_22152 ) ) ( not ( = ?auto_22127 ?auto_22165 ) ) ( not ( = ?auto_22127 ?auto_22140 ) ) ( not ( = ?auto_22127 ?auto_22147 ) ) ( not ( = ?auto_22127 ?auto_22145 ) ) ( not ( = ?auto_22127 ?auto_22142 ) ) ( not ( = ?auto_22127 ?auto_22155 ) ) ( not ( = ?auto_22127 ?auto_22166 ) ) ( not ( = ?auto_22127 ?auto_22157 ) ) ( not ( = ?auto_22127 ?auto_22144 ) ) ( not ( = ?auto_22127 ?auto_22162 ) ) ( not ( = ?auto_22127 ?auto_22149 ) ) ( not ( = ?auto_22164 ?auto_22152 ) ) ( not ( = ?auto_22164 ?auto_22165 ) ) ( not ( = ?auto_22164 ?auto_22140 ) ) ( not ( = ?auto_22164 ?auto_22147 ) ) ( not ( = ?auto_22164 ?auto_22145 ) ) ( not ( = ?auto_22164 ?auto_22142 ) ) ( not ( = ?auto_22164 ?auto_22155 ) ) ( not ( = ?auto_22164 ?auto_22166 ) ) ( not ( = ?auto_22164 ?auto_22157 ) ) ( not ( = ?auto_22164 ?auto_22144 ) ) ( not ( = ?auto_22164 ?auto_22162 ) ) ( not ( = ?auto_22164 ?auto_22149 ) ) ( not ( = ?auto_22114 ?auto_22129 ) ) ( not ( = ?auto_22114 ?auto_22138 ) ) ( not ( = ?auto_22115 ?auto_22129 ) ) ( not ( = ?auto_22115 ?auto_22138 ) ) ( not ( = ?auto_22116 ?auto_22129 ) ) ( not ( = ?auto_22116 ?auto_22138 ) ) ( not ( = ?auto_22117 ?auto_22129 ) ) ( not ( = ?auto_22117 ?auto_22138 ) ) ( not ( = ?auto_22118 ?auto_22129 ) ) ( not ( = ?auto_22118 ?auto_22138 ) ) ( not ( = ?auto_22119 ?auto_22129 ) ) ( not ( = ?auto_22119 ?auto_22138 ) ) ( not ( = ?auto_22120 ?auto_22129 ) ) ( not ( = ?auto_22120 ?auto_22138 ) ) ( not ( = ?auto_22123 ?auto_22129 ) ) ( not ( = ?auto_22123 ?auto_22138 ) ) ( not ( = ?auto_22122 ?auto_22129 ) ) ( not ( = ?auto_22122 ?auto_22138 ) ) ( not ( = ?auto_22121 ?auto_22129 ) ) ( not ( = ?auto_22121 ?auto_22138 ) ) ( not ( = ?auto_22124 ?auto_22129 ) ) ( not ( = ?auto_22124 ?auto_22138 ) ) ( not ( = ?auto_22125 ?auto_22129 ) ) ( not ( = ?auto_22125 ?auto_22138 ) ) ( not ( = ?auto_22126 ?auto_22129 ) ) ( not ( = ?auto_22126 ?auto_22138 ) ) ( not ( = ?auto_22129 ?auto_22164 ) ) ( not ( = ?auto_22129 ?auto_22152 ) ) ( not ( = ?auto_22129 ?auto_22165 ) ) ( not ( = ?auto_22129 ?auto_22140 ) ) ( not ( = ?auto_22129 ?auto_22147 ) ) ( not ( = ?auto_22129 ?auto_22145 ) ) ( not ( = ?auto_22129 ?auto_22142 ) ) ( not ( = ?auto_22129 ?auto_22155 ) ) ( not ( = ?auto_22129 ?auto_22166 ) ) ( not ( = ?auto_22129 ?auto_22157 ) ) ( not ( = ?auto_22129 ?auto_22144 ) ) ( not ( = ?auto_22129 ?auto_22162 ) ) ( not ( = ?auto_22129 ?auto_22149 ) ) ( not ( = ?auto_22138 ?auto_22164 ) ) ( not ( = ?auto_22138 ?auto_22152 ) ) ( not ( = ?auto_22138 ?auto_22165 ) ) ( not ( = ?auto_22138 ?auto_22140 ) ) ( not ( = ?auto_22138 ?auto_22147 ) ) ( not ( = ?auto_22138 ?auto_22145 ) ) ( not ( = ?auto_22138 ?auto_22142 ) ) ( not ( = ?auto_22138 ?auto_22155 ) ) ( not ( = ?auto_22138 ?auto_22166 ) ) ( not ( = ?auto_22138 ?auto_22157 ) ) ( not ( = ?auto_22138 ?auto_22144 ) ) ( not ( = ?auto_22138 ?auto_22162 ) ) ( not ( = ?auto_22138 ?auto_22149 ) ) ( not ( = ?auto_22114 ?auto_22128 ) ) ( not ( = ?auto_22114 ?auto_22130 ) ) ( not ( = ?auto_22115 ?auto_22128 ) ) ( not ( = ?auto_22115 ?auto_22130 ) ) ( not ( = ?auto_22116 ?auto_22128 ) ) ( not ( = ?auto_22116 ?auto_22130 ) ) ( not ( = ?auto_22117 ?auto_22128 ) ) ( not ( = ?auto_22117 ?auto_22130 ) ) ( not ( = ?auto_22118 ?auto_22128 ) ) ( not ( = ?auto_22118 ?auto_22130 ) ) ( not ( = ?auto_22119 ?auto_22128 ) ) ( not ( = ?auto_22119 ?auto_22130 ) ) ( not ( = ?auto_22120 ?auto_22128 ) ) ( not ( = ?auto_22120 ?auto_22130 ) ) ( not ( = ?auto_22123 ?auto_22128 ) ) ( not ( = ?auto_22123 ?auto_22130 ) ) ( not ( = ?auto_22122 ?auto_22128 ) ) ( not ( = ?auto_22122 ?auto_22130 ) ) ( not ( = ?auto_22121 ?auto_22128 ) ) ( not ( = ?auto_22121 ?auto_22130 ) ) ( not ( = ?auto_22124 ?auto_22128 ) ) ( not ( = ?auto_22124 ?auto_22130 ) ) ( not ( = ?auto_22125 ?auto_22128 ) ) ( not ( = ?auto_22125 ?auto_22130 ) ) ( not ( = ?auto_22126 ?auto_22128 ) ) ( not ( = ?auto_22126 ?auto_22130 ) ) ( not ( = ?auto_22127 ?auto_22128 ) ) ( not ( = ?auto_22127 ?auto_22130 ) ) ( not ( = ?auto_22128 ?auto_22138 ) ) ( not ( = ?auto_22128 ?auto_22164 ) ) ( not ( = ?auto_22128 ?auto_22152 ) ) ( not ( = ?auto_22128 ?auto_22165 ) ) ( not ( = ?auto_22128 ?auto_22140 ) ) ( not ( = ?auto_22128 ?auto_22147 ) ) ( not ( = ?auto_22128 ?auto_22145 ) ) ( not ( = ?auto_22128 ?auto_22142 ) ) ( not ( = ?auto_22128 ?auto_22155 ) ) ( not ( = ?auto_22128 ?auto_22166 ) ) ( not ( = ?auto_22128 ?auto_22157 ) ) ( not ( = ?auto_22128 ?auto_22144 ) ) ( not ( = ?auto_22128 ?auto_22162 ) ) ( not ( = ?auto_22128 ?auto_22149 ) ) ( not ( = ?auto_22132 ?auto_22141 ) ) ( not ( = ?auto_22132 ?auto_22159 ) ) ( not ( = ?auto_22132 ?auto_22158 ) ) ( not ( = ?auto_22132 ?auto_22156 ) ) ( not ( = ?auto_22132 ?auto_22148 ) ) ( not ( = ?auto_22132 ?auto_22160 ) ) ( not ( = ?auto_22132 ?auto_22167 ) ) ( not ( = ?auto_22132 ?auto_22136 ) ) ( not ( = ?auto_22132 ?auto_22163 ) ) ( not ( = ?auto_22135 ?auto_22161 ) ) ( not ( = ?auto_22135 ?auto_22137 ) ) ( not ( = ?auto_22135 ?auto_22150 ) ) ( not ( = ?auto_22135 ?auto_22154 ) ) ( not ( = ?auto_22135 ?auto_22151 ) ) ( not ( = ?auto_22135 ?auto_22146 ) ) ( not ( = ?auto_22135 ?auto_22139 ) ) ( not ( = ?auto_22135 ?auto_22153 ) ) ( not ( = ?auto_22135 ?auto_22143 ) ) ( not ( = ?auto_22130 ?auto_22138 ) ) ( not ( = ?auto_22130 ?auto_22164 ) ) ( not ( = ?auto_22130 ?auto_22152 ) ) ( not ( = ?auto_22130 ?auto_22165 ) ) ( not ( = ?auto_22130 ?auto_22140 ) ) ( not ( = ?auto_22130 ?auto_22147 ) ) ( not ( = ?auto_22130 ?auto_22145 ) ) ( not ( = ?auto_22130 ?auto_22142 ) ) ( not ( = ?auto_22130 ?auto_22155 ) ) ( not ( = ?auto_22130 ?auto_22166 ) ) ( not ( = ?auto_22130 ?auto_22157 ) ) ( not ( = ?auto_22130 ?auto_22144 ) ) ( not ( = ?auto_22130 ?auto_22162 ) ) ( not ( = ?auto_22130 ?auto_22149 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_22114 ?auto_22115 ?auto_22116 ?auto_22117 ?auto_22118 ?auto_22119 ?auto_22120 ?auto_22123 ?auto_22122 ?auto_22121 ?auto_22124 ?auto_22125 ?auto_22126 ?auto_22127 ?auto_22129 )
      ( MAKE-1CRATE ?auto_22129 ?auto_22128 )
      ( MAKE-15CRATE-VERIFY ?auto_22114 ?auto_22115 ?auto_22116 ?auto_22117 ?auto_22118 ?auto_22119 ?auto_22120 ?auto_22123 ?auto_22122 ?auto_22121 ?auto_22124 ?auto_22125 ?auto_22126 ?auto_22127 ?auto_22129 ?auto_22128 ) )
  )

)

