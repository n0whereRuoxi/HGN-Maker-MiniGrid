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
      ?auto_21353 - SURFACE
      ?auto_21354 - SURFACE
    )
    :vars
    (
      ?auto_21355 - HOIST
      ?auto_21356 - PLACE
      ?auto_21358 - PLACE
      ?auto_21359 - HOIST
      ?auto_21360 - SURFACE
      ?auto_21357 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21355 ?auto_21356 ) ( SURFACE-AT ?auto_21353 ?auto_21356 ) ( CLEAR ?auto_21353 ) ( IS-CRATE ?auto_21354 ) ( AVAILABLE ?auto_21355 ) ( not ( = ?auto_21358 ?auto_21356 ) ) ( HOIST-AT ?auto_21359 ?auto_21358 ) ( AVAILABLE ?auto_21359 ) ( SURFACE-AT ?auto_21354 ?auto_21358 ) ( ON ?auto_21354 ?auto_21360 ) ( CLEAR ?auto_21354 ) ( TRUCK-AT ?auto_21357 ?auto_21356 ) ( not ( = ?auto_21353 ?auto_21354 ) ) ( not ( = ?auto_21353 ?auto_21360 ) ) ( not ( = ?auto_21354 ?auto_21360 ) ) ( not ( = ?auto_21355 ?auto_21359 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21357 ?auto_21356 ?auto_21358 )
      ( !LIFT ?auto_21359 ?auto_21354 ?auto_21360 ?auto_21358 )
      ( !LOAD ?auto_21359 ?auto_21354 ?auto_21357 ?auto_21358 )
      ( !DRIVE ?auto_21357 ?auto_21358 ?auto_21356 )
      ( !UNLOAD ?auto_21355 ?auto_21354 ?auto_21357 ?auto_21356 )
      ( !DROP ?auto_21355 ?auto_21354 ?auto_21353 ?auto_21356 )
      ( MAKE-1CRATE-VERIFY ?auto_21353 ?auto_21354 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21374 - SURFACE
      ?auto_21375 - SURFACE
      ?auto_21376 - SURFACE
    )
    :vars
    (
      ?auto_21380 - HOIST
      ?auto_21378 - PLACE
      ?auto_21382 - PLACE
      ?auto_21379 - HOIST
      ?auto_21377 - SURFACE
      ?auto_21383 - PLACE
      ?auto_21385 - HOIST
      ?auto_21384 - SURFACE
      ?auto_21381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21380 ?auto_21378 ) ( IS-CRATE ?auto_21376 ) ( not ( = ?auto_21382 ?auto_21378 ) ) ( HOIST-AT ?auto_21379 ?auto_21382 ) ( AVAILABLE ?auto_21379 ) ( SURFACE-AT ?auto_21376 ?auto_21382 ) ( ON ?auto_21376 ?auto_21377 ) ( CLEAR ?auto_21376 ) ( not ( = ?auto_21375 ?auto_21376 ) ) ( not ( = ?auto_21375 ?auto_21377 ) ) ( not ( = ?auto_21376 ?auto_21377 ) ) ( not ( = ?auto_21380 ?auto_21379 ) ) ( SURFACE-AT ?auto_21374 ?auto_21378 ) ( CLEAR ?auto_21374 ) ( IS-CRATE ?auto_21375 ) ( AVAILABLE ?auto_21380 ) ( not ( = ?auto_21383 ?auto_21378 ) ) ( HOIST-AT ?auto_21385 ?auto_21383 ) ( AVAILABLE ?auto_21385 ) ( SURFACE-AT ?auto_21375 ?auto_21383 ) ( ON ?auto_21375 ?auto_21384 ) ( CLEAR ?auto_21375 ) ( TRUCK-AT ?auto_21381 ?auto_21378 ) ( not ( = ?auto_21374 ?auto_21375 ) ) ( not ( = ?auto_21374 ?auto_21384 ) ) ( not ( = ?auto_21375 ?auto_21384 ) ) ( not ( = ?auto_21380 ?auto_21385 ) ) ( not ( = ?auto_21374 ?auto_21376 ) ) ( not ( = ?auto_21374 ?auto_21377 ) ) ( not ( = ?auto_21376 ?auto_21384 ) ) ( not ( = ?auto_21382 ?auto_21383 ) ) ( not ( = ?auto_21379 ?auto_21385 ) ) ( not ( = ?auto_21377 ?auto_21384 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21374 ?auto_21375 )
      ( MAKE-1CRATE ?auto_21375 ?auto_21376 )
      ( MAKE-2CRATE-VERIFY ?auto_21374 ?auto_21375 ?auto_21376 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21400 - SURFACE
      ?auto_21401 - SURFACE
      ?auto_21402 - SURFACE
      ?auto_21403 - SURFACE
    )
    :vars
    (
      ?auto_21406 - HOIST
      ?auto_21407 - PLACE
      ?auto_21408 - PLACE
      ?auto_21409 - HOIST
      ?auto_21404 - SURFACE
      ?auto_21412 - PLACE
      ?auto_21410 - HOIST
      ?auto_21415 - SURFACE
      ?auto_21414 - PLACE
      ?auto_21411 - HOIST
      ?auto_21413 - SURFACE
      ?auto_21405 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21406 ?auto_21407 ) ( IS-CRATE ?auto_21403 ) ( not ( = ?auto_21408 ?auto_21407 ) ) ( HOIST-AT ?auto_21409 ?auto_21408 ) ( AVAILABLE ?auto_21409 ) ( SURFACE-AT ?auto_21403 ?auto_21408 ) ( ON ?auto_21403 ?auto_21404 ) ( CLEAR ?auto_21403 ) ( not ( = ?auto_21402 ?auto_21403 ) ) ( not ( = ?auto_21402 ?auto_21404 ) ) ( not ( = ?auto_21403 ?auto_21404 ) ) ( not ( = ?auto_21406 ?auto_21409 ) ) ( IS-CRATE ?auto_21402 ) ( not ( = ?auto_21412 ?auto_21407 ) ) ( HOIST-AT ?auto_21410 ?auto_21412 ) ( AVAILABLE ?auto_21410 ) ( SURFACE-AT ?auto_21402 ?auto_21412 ) ( ON ?auto_21402 ?auto_21415 ) ( CLEAR ?auto_21402 ) ( not ( = ?auto_21401 ?auto_21402 ) ) ( not ( = ?auto_21401 ?auto_21415 ) ) ( not ( = ?auto_21402 ?auto_21415 ) ) ( not ( = ?auto_21406 ?auto_21410 ) ) ( SURFACE-AT ?auto_21400 ?auto_21407 ) ( CLEAR ?auto_21400 ) ( IS-CRATE ?auto_21401 ) ( AVAILABLE ?auto_21406 ) ( not ( = ?auto_21414 ?auto_21407 ) ) ( HOIST-AT ?auto_21411 ?auto_21414 ) ( AVAILABLE ?auto_21411 ) ( SURFACE-AT ?auto_21401 ?auto_21414 ) ( ON ?auto_21401 ?auto_21413 ) ( CLEAR ?auto_21401 ) ( TRUCK-AT ?auto_21405 ?auto_21407 ) ( not ( = ?auto_21400 ?auto_21401 ) ) ( not ( = ?auto_21400 ?auto_21413 ) ) ( not ( = ?auto_21401 ?auto_21413 ) ) ( not ( = ?auto_21406 ?auto_21411 ) ) ( not ( = ?auto_21400 ?auto_21402 ) ) ( not ( = ?auto_21400 ?auto_21415 ) ) ( not ( = ?auto_21402 ?auto_21413 ) ) ( not ( = ?auto_21412 ?auto_21414 ) ) ( not ( = ?auto_21410 ?auto_21411 ) ) ( not ( = ?auto_21415 ?auto_21413 ) ) ( not ( = ?auto_21400 ?auto_21403 ) ) ( not ( = ?auto_21400 ?auto_21404 ) ) ( not ( = ?auto_21401 ?auto_21403 ) ) ( not ( = ?auto_21401 ?auto_21404 ) ) ( not ( = ?auto_21403 ?auto_21415 ) ) ( not ( = ?auto_21403 ?auto_21413 ) ) ( not ( = ?auto_21408 ?auto_21412 ) ) ( not ( = ?auto_21408 ?auto_21414 ) ) ( not ( = ?auto_21409 ?auto_21410 ) ) ( not ( = ?auto_21409 ?auto_21411 ) ) ( not ( = ?auto_21404 ?auto_21415 ) ) ( not ( = ?auto_21404 ?auto_21413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21400 ?auto_21401 ?auto_21402 )
      ( MAKE-1CRATE ?auto_21402 ?auto_21403 )
      ( MAKE-3CRATE-VERIFY ?auto_21400 ?auto_21401 ?auto_21402 ?auto_21403 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21431 - SURFACE
      ?auto_21432 - SURFACE
      ?auto_21433 - SURFACE
      ?auto_21434 - SURFACE
      ?auto_21435 - SURFACE
    )
    :vars
    (
      ?auto_21441 - HOIST
      ?auto_21439 - PLACE
      ?auto_21436 - PLACE
      ?auto_21437 - HOIST
      ?auto_21438 - SURFACE
      ?auto_21449 - PLACE
      ?auto_21445 - HOIST
      ?auto_21448 - SURFACE
      ?auto_21442 - PLACE
      ?auto_21446 - HOIST
      ?auto_21447 - SURFACE
      ?auto_21450 - PLACE
      ?auto_21444 - HOIST
      ?auto_21443 - SURFACE
      ?auto_21440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21441 ?auto_21439 ) ( IS-CRATE ?auto_21435 ) ( not ( = ?auto_21436 ?auto_21439 ) ) ( HOIST-AT ?auto_21437 ?auto_21436 ) ( AVAILABLE ?auto_21437 ) ( SURFACE-AT ?auto_21435 ?auto_21436 ) ( ON ?auto_21435 ?auto_21438 ) ( CLEAR ?auto_21435 ) ( not ( = ?auto_21434 ?auto_21435 ) ) ( not ( = ?auto_21434 ?auto_21438 ) ) ( not ( = ?auto_21435 ?auto_21438 ) ) ( not ( = ?auto_21441 ?auto_21437 ) ) ( IS-CRATE ?auto_21434 ) ( not ( = ?auto_21449 ?auto_21439 ) ) ( HOIST-AT ?auto_21445 ?auto_21449 ) ( AVAILABLE ?auto_21445 ) ( SURFACE-AT ?auto_21434 ?auto_21449 ) ( ON ?auto_21434 ?auto_21448 ) ( CLEAR ?auto_21434 ) ( not ( = ?auto_21433 ?auto_21434 ) ) ( not ( = ?auto_21433 ?auto_21448 ) ) ( not ( = ?auto_21434 ?auto_21448 ) ) ( not ( = ?auto_21441 ?auto_21445 ) ) ( IS-CRATE ?auto_21433 ) ( not ( = ?auto_21442 ?auto_21439 ) ) ( HOIST-AT ?auto_21446 ?auto_21442 ) ( AVAILABLE ?auto_21446 ) ( SURFACE-AT ?auto_21433 ?auto_21442 ) ( ON ?auto_21433 ?auto_21447 ) ( CLEAR ?auto_21433 ) ( not ( = ?auto_21432 ?auto_21433 ) ) ( not ( = ?auto_21432 ?auto_21447 ) ) ( not ( = ?auto_21433 ?auto_21447 ) ) ( not ( = ?auto_21441 ?auto_21446 ) ) ( SURFACE-AT ?auto_21431 ?auto_21439 ) ( CLEAR ?auto_21431 ) ( IS-CRATE ?auto_21432 ) ( AVAILABLE ?auto_21441 ) ( not ( = ?auto_21450 ?auto_21439 ) ) ( HOIST-AT ?auto_21444 ?auto_21450 ) ( AVAILABLE ?auto_21444 ) ( SURFACE-AT ?auto_21432 ?auto_21450 ) ( ON ?auto_21432 ?auto_21443 ) ( CLEAR ?auto_21432 ) ( TRUCK-AT ?auto_21440 ?auto_21439 ) ( not ( = ?auto_21431 ?auto_21432 ) ) ( not ( = ?auto_21431 ?auto_21443 ) ) ( not ( = ?auto_21432 ?auto_21443 ) ) ( not ( = ?auto_21441 ?auto_21444 ) ) ( not ( = ?auto_21431 ?auto_21433 ) ) ( not ( = ?auto_21431 ?auto_21447 ) ) ( not ( = ?auto_21433 ?auto_21443 ) ) ( not ( = ?auto_21442 ?auto_21450 ) ) ( not ( = ?auto_21446 ?auto_21444 ) ) ( not ( = ?auto_21447 ?auto_21443 ) ) ( not ( = ?auto_21431 ?auto_21434 ) ) ( not ( = ?auto_21431 ?auto_21448 ) ) ( not ( = ?auto_21432 ?auto_21434 ) ) ( not ( = ?auto_21432 ?auto_21448 ) ) ( not ( = ?auto_21434 ?auto_21447 ) ) ( not ( = ?auto_21434 ?auto_21443 ) ) ( not ( = ?auto_21449 ?auto_21442 ) ) ( not ( = ?auto_21449 ?auto_21450 ) ) ( not ( = ?auto_21445 ?auto_21446 ) ) ( not ( = ?auto_21445 ?auto_21444 ) ) ( not ( = ?auto_21448 ?auto_21447 ) ) ( not ( = ?auto_21448 ?auto_21443 ) ) ( not ( = ?auto_21431 ?auto_21435 ) ) ( not ( = ?auto_21431 ?auto_21438 ) ) ( not ( = ?auto_21432 ?auto_21435 ) ) ( not ( = ?auto_21432 ?auto_21438 ) ) ( not ( = ?auto_21433 ?auto_21435 ) ) ( not ( = ?auto_21433 ?auto_21438 ) ) ( not ( = ?auto_21435 ?auto_21448 ) ) ( not ( = ?auto_21435 ?auto_21447 ) ) ( not ( = ?auto_21435 ?auto_21443 ) ) ( not ( = ?auto_21436 ?auto_21449 ) ) ( not ( = ?auto_21436 ?auto_21442 ) ) ( not ( = ?auto_21436 ?auto_21450 ) ) ( not ( = ?auto_21437 ?auto_21445 ) ) ( not ( = ?auto_21437 ?auto_21446 ) ) ( not ( = ?auto_21437 ?auto_21444 ) ) ( not ( = ?auto_21438 ?auto_21448 ) ) ( not ( = ?auto_21438 ?auto_21447 ) ) ( not ( = ?auto_21438 ?auto_21443 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_21431 ?auto_21432 ?auto_21433 ?auto_21434 )
      ( MAKE-1CRATE ?auto_21434 ?auto_21435 )
      ( MAKE-4CRATE-VERIFY ?auto_21431 ?auto_21432 ?auto_21433 ?auto_21434 ?auto_21435 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_21467 - SURFACE
      ?auto_21468 - SURFACE
      ?auto_21469 - SURFACE
      ?auto_21470 - SURFACE
      ?auto_21471 - SURFACE
      ?auto_21472 - SURFACE
    )
    :vars
    (
      ?auto_21476 - HOIST
      ?auto_21477 - PLACE
      ?auto_21473 - PLACE
      ?auto_21475 - HOIST
      ?auto_21474 - SURFACE
      ?auto_21485 - PLACE
      ?auto_21480 - HOIST
      ?auto_21479 - SURFACE
      ?auto_21486 - PLACE
      ?auto_21490 - HOIST
      ?auto_21487 - SURFACE
      ?auto_21482 - PLACE
      ?auto_21489 - HOIST
      ?auto_21488 - SURFACE
      ?auto_21481 - PLACE
      ?auto_21484 - HOIST
      ?auto_21483 - SURFACE
      ?auto_21478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21476 ?auto_21477 ) ( IS-CRATE ?auto_21472 ) ( not ( = ?auto_21473 ?auto_21477 ) ) ( HOIST-AT ?auto_21475 ?auto_21473 ) ( AVAILABLE ?auto_21475 ) ( SURFACE-AT ?auto_21472 ?auto_21473 ) ( ON ?auto_21472 ?auto_21474 ) ( CLEAR ?auto_21472 ) ( not ( = ?auto_21471 ?auto_21472 ) ) ( not ( = ?auto_21471 ?auto_21474 ) ) ( not ( = ?auto_21472 ?auto_21474 ) ) ( not ( = ?auto_21476 ?auto_21475 ) ) ( IS-CRATE ?auto_21471 ) ( not ( = ?auto_21485 ?auto_21477 ) ) ( HOIST-AT ?auto_21480 ?auto_21485 ) ( AVAILABLE ?auto_21480 ) ( SURFACE-AT ?auto_21471 ?auto_21485 ) ( ON ?auto_21471 ?auto_21479 ) ( CLEAR ?auto_21471 ) ( not ( = ?auto_21470 ?auto_21471 ) ) ( not ( = ?auto_21470 ?auto_21479 ) ) ( not ( = ?auto_21471 ?auto_21479 ) ) ( not ( = ?auto_21476 ?auto_21480 ) ) ( IS-CRATE ?auto_21470 ) ( not ( = ?auto_21486 ?auto_21477 ) ) ( HOIST-AT ?auto_21490 ?auto_21486 ) ( AVAILABLE ?auto_21490 ) ( SURFACE-AT ?auto_21470 ?auto_21486 ) ( ON ?auto_21470 ?auto_21487 ) ( CLEAR ?auto_21470 ) ( not ( = ?auto_21469 ?auto_21470 ) ) ( not ( = ?auto_21469 ?auto_21487 ) ) ( not ( = ?auto_21470 ?auto_21487 ) ) ( not ( = ?auto_21476 ?auto_21490 ) ) ( IS-CRATE ?auto_21469 ) ( not ( = ?auto_21482 ?auto_21477 ) ) ( HOIST-AT ?auto_21489 ?auto_21482 ) ( AVAILABLE ?auto_21489 ) ( SURFACE-AT ?auto_21469 ?auto_21482 ) ( ON ?auto_21469 ?auto_21488 ) ( CLEAR ?auto_21469 ) ( not ( = ?auto_21468 ?auto_21469 ) ) ( not ( = ?auto_21468 ?auto_21488 ) ) ( not ( = ?auto_21469 ?auto_21488 ) ) ( not ( = ?auto_21476 ?auto_21489 ) ) ( SURFACE-AT ?auto_21467 ?auto_21477 ) ( CLEAR ?auto_21467 ) ( IS-CRATE ?auto_21468 ) ( AVAILABLE ?auto_21476 ) ( not ( = ?auto_21481 ?auto_21477 ) ) ( HOIST-AT ?auto_21484 ?auto_21481 ) ( AVAILABLE ?auto_21484 ) ( SURFACE-AT ?auto_21468 ?auto_21481 ) ( ON ?auto_21468 ?auto_21483 ) ( CLEAR ?auto_21468 ) ( TRUCK-AT ?auto_21478 ?auto_21477 ) ( not ( = ?auto_21467 ?auto_21468 ) ) ( not ( = ?auto_21467 ?auto_21483 ) ) ( not ( = ?auto_21468 ?auto_21483 ) ) ( not ( = ?auto_21476 ?auto_21484 ) ) ( not ( = ?auto_21467 ?auto_21469 ) ) ( not ( = ?auto_21467 ?auto_21488 ) ) ( not ( = ?auto_21469 ?auto_21483 ) ) ( not ( = ?auto_21482 ?auto_21481 ) ) ( not ( = ?auto_21489 ?auto_21484 ) ) ( not ( = ?auto_21488 ?auto_21483 ) ) ( not ( = ?auto_21467 ?auto_21470 ) ) ( not ( = ?auto_21467 ?auto_21487 ) ) ( not ( = ?auto_21468 ?auto_21470 ) ) ( not ( = ?auto_21468 ?auto_21487 ) ) ( not ( = ?auto_21470 ?auto_21488 ) ) ( not ( = ?auto_21470 ?auto_21483 ) ) ( not ( = ?auto_21486 ?auto_21482 ) ) ( not ( = ?auto_21486 ?auto_21481 ) ) ( not ( = ?auto_21490 ?auto_21489 ) ) ( not ( = ?auto_21490 ?auto_21484 ) ) ( not ( = ?auto_21487 ?auto_21488 ) ) ( not ( = ?auto_21487 ?auto_21483 ) ) ( not ( = ?auto_21467 ?auto_21471 ) ) ( not ( = ?auto_21467 ?auto_21479 ) ) ( not ( = ?auto_21468 ?auto_21471 ) ) ( not ( = ?auto_21468 ?auto_21479 ) ) ( not ( = ?auto_21469 ?auto_21471 ) ) ( not ( = ?auto_21469 ?auto_21479 ) ) ( not ( = ?auto_21471 ?auto_21487 ) ) ( not ( = ?auto_21471 ?auto_21488 ) ) ( not ( = ?auto_21471 ?auto_21483 ) ) ( not ( = ?auto_21485 ?auto_21486 ) ) ( not ( = ?auto_21485 ?auto_21482 ) ) ( not ( = ?auto_21485 ?auto_21481 ) ) ( not ( = ?auto_21480 ?auto_21490 ) ) ( not ( = ?auto_21480 ?auto_21489 ) ) ( not ( = ?auto_21480 ?auto_21484 ) ) ( not ( = ?auto_21479 ?auto_21487 ) ) ( not ( = ?auto_21479 ?auto_21488 ) ) ( not ( = ?auto_21479 ?auto_21483 ) ) ( not ( = ?auto_21467 ?auto_21472 ) ) ( not ( = ?auto_21467 ?auto_21474 ) ) ( not ( = ?auto_21468 ?auto_21472 ) ) ( not ( = ?auto_21468 ?auto_21474 ) ) ( not ( = ?auto_21469 ?auto_21472 ) ) ( not ( = ?auto_21469 ?auto_21474 ) ) ( not ( = ?auto_21470 ?auto_21472 ) ) ( not ( = ?auto_21470 ?auto_21474 ) ) ( not ( = ?auto_21472 ?auto_21479 ) ) ( not ( = ?auto_21472 ?auto_21487 ) ) ( not ( = ?auto_21472 ?auto_21488 ) ) ( not ( = ?auto_21472 ?auto_21483 ) ) ( not ( = ?auto_21473 ?auto_21485 ) ) ( not ( = ?auto_21473 ?auto_21486 ) ) ( not ( = ?auto_21473 ?auto_21482 ) ) ( not ( = ?auto_21473 ?auto_21481 ) ) ( not ( = ?auto_21475 ?auto_21480 ) ) ( not ( = ?auto_21475 ?auto_21490 ) ) ( not ( = ?auto_21475 ?auto_21489 ) ) ( not ( = ?auto_21475 ?auto_21484 ) ) ( not ( = ?auto_21474 ?auto_21479 ) ) ( not ( = ?auto_21474 ?auto_21487 ) ) ( not ( = ?auto_21474 ?auto_21488 ) ) ( not ( = ?auto_21474 ?auto_21483 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_21467 ?auto_21468 ?auto_21469 ?auto_21470 ?auto_21471 )
      ( MAKE-1CRATE ?auto_21471 ?auto_21472 )
      ( MAKE-5CRATE-VERIFY ?auto_21467 ?auto_21468 ?auto_21469 ?auto_21470 ?auto_21471 ?auto_21472 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_21508 - SURFACE
      ?auto_21509 - SURFACE
      ?auto_21510 - SURFACE
      ?auto_21511 - SURFACE
      ?auto_21512 - SURFACE
      ?auto_21513 - SURFACE
      ?auto_21514 - SURFACE
    )
    :vars
    (
      ?auto_21516 - HOIST
      ?auto_21518 - PLACE
      ?auto_21515 - PLACE
      ?auto_21519 - HOIST
      ?auto_21517 - SURFACE
      ?auto_21534 - PLACE
      ?auto_21524 - HOIST
      ?auto_21523 - SURFACE
      ?auto_21531 - PLACE
      ?auto_21527 - HOIST
      ?auto_21525 - SURFACE
      ?auto_21530 - PLACE
      ?auto_21529 - HOIST
      ?auto_21521 - SURFACE
      ?auto_21528 - PLACE
      ?auto_21535 - HOIST
      ?auto_21522 - SURFACE
      ?auto_21526 - PLACE
      ?auto_21532 - HOIST
      ?auto_21533 - SURFACE
      ?auto_21520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21516 ?auto_21518 ) ( IS-CRATE ?auto_21514 ) ( not ( = ?auto_21515 ?auto_21518 ) ) ( HOIST-AT ?auto_21519 ?auto_21515 ) ( AVAILABLE ?auto_21519 ) ( SURFACE-AT ?auto_21514 ?auto_21515 ) ( ON ?auto_21514 ?auto_21517 ) ( CLEAR ?auto_21514 ) ( not ( = ?auto_21513 ?auto_21514 ) ) ( not ( = ?auto_21513 ?auto_21517 ) ) ( not ( = ?auto_21514 ?auto_21517 ) ) ( not ( = ?auto_21516 ?auto_21519 ) ) ( IS-CRATE ?auto_21513 ) ( not ( = ?auto_21534 ?auto_21518 ) ) ( HOIST-AT ?auto_21524 ?auto_21534 ) ( AVAILABLE ?auto_21524 ) ( SURFACE-AT ?auto_21513 ?auto_21534 ) ( ON ?auto_21513 ?auto_21523 ) ( CLEAR ?auto_21513 ) ( not ( = ?auto_21512 ?auto_21513 ) ) ( not ( = ?auto_21512 ?auto_21523 ) ) ( not ( = ?auto_21513 ?auto_21523 ) ) ( not ( = ?auto_21516 ?auto_21524 ) ) ( IS-CRATE ?auto_21512 ) ( not ( = ?auto_21531 ?auto_21518 ) ) ( HOIST-AT ?auto_21527 ?auto_21531 ) ( AVAILABLE ?auto_21527 ) ( SURFACE-AT ?auto_21512 ?auto_21531 ) ( ON ?auto_21512 ?auto_21525 ) ( CLEAR ?auto_21512 ) ( not ( = ?auto_21511 ?auto_21512 ) ) ( not ( = ?auto_21511 ?auto_21525 ) ) ( not ( = ?auto_21512 ?auto_21525 ) ) ( not ( = ?auto_21516 ?auto_21527 ) ) ( IS-CRATE ?auto_21511 ) ( not ( = ?auto_21530 ?auto_21518 ) ) ( HOIST-AT ?auto_21529 ?auto_21530 ) ( AVAILABLE ?auto_21529 ) ( SURFACE-AT ?auto_21511 ?auto_21530 ) ( ON ?auto_21511 ?auto_21521 ) ( CLEAR ?auto_21511 ) ( not ( = ?auto_21510 ?auto_21511 ) ) ( not ( = ?auto_21510 ?auto_21521 ) ) ( not ( = ?auto_21511 ?auto_21521 ) ) ( not ( = ?auto_21516 ?auto_21529 ) ) ( IS-CRATE ?auto_21510 ) ( not ( = ?auto_21528 ?auto_21518 ) ) ( HOIST-AT ?auto_21535 ?auto_21528 ) ( AVAILABLE ?auto_21535 ) ( SURFACE-AT ?auto_21510 ?auto_21528 ) ( ON ?auto_21510 ?auto_21522 ) ( CLEAR ?auto_21510 ) ( not ( = ?auto_21509 ?auto_21510 ) ) ( not ( = ?auto_21509 ?auto_21522 ) ) ( not ( = ?auto_21510 ?auto_21522 ) ) ( not ( = ?auto_21516 ?auto_21535 ) ) ( SURFACE-AT ?auto_21508 ?auto_21518 ) ( CLEAR ?auto_21508 ) ( IS-CRATE ?auto_21509 ) ( AVAILABLE ?auto_21516 ) ( not ( = ?auto_21526 ?auto_21518 ) ) ( HOIST-AT ?auto_21532 ?auto_21526 ) ( AVAILABLE ?auto_21532 ) ( SURFACE-AT ?auto_21509 ?auto_21526 ) ( ON ?auto_21509 ?auto_21533 ) ( CLEAR ?auto_21509 ) ( TRUCK-AT ?auto_21520 ?auto_21518 ) ( not ( = ?auto_21508 ?auto_21509 ) ) ( not ( = ?auto_21508 ?auto_21533 ) ) ( not ( = ?auto_21509 ?auto_21533 ) ) ( not ( = ?auto_21516 ?auto_21532 ) ) ( not ( = ?auto_21508 ?auto_21510 ) ) ( not ( = ?auto_21508 ?auto_21522 ) ) ( not ( = ?auto_21510 ?auto_21533 ) ) ( not ( = ?auto_21528 ?auto_21526 ) ) ( not ( = ?auto_21535 ?auto_21532 ) ) ( not ( = ?auto_21522 ?auto_21533 ) ) ( not ( = ?auto_21508 ?auto_21511 ) ) ( not ( = ?auto_21508 ?auto_21521 ) ) ( not ( = ?auto_21509 ?auto_21511 ) ) ( not ( = ?auto_21509 ?auto_21521 ) ) ( not ( = ?auto_21511 ?auto_21522 ) ) ( not ( = ?auto_21511 ?auto_21533 ) ) ( not ( = ?auto_21530 ?auto_21528 ) ) ( not ( = ?auto_21530 ?auto_21526 ) ) ( not ( = ?auto_21529 ?auto_21535 ) ) ( not ( = ?auto_21529 ?auto_21532 ) ) ( not ( = ?auto_21521 ?auto_21522 ) ) ( not ( = ?auto_21521 ?auto_21533 ) ) ( not ( = ?auto_21508 ?auto_21512 ) ) ( not ( = ?auto_21508 ?auto_21525 ) ) ( not ( = ?auto_21509 ?auto_21512 ) ) ( not ( = ?auto_21509 ?auto_21525 ) ) ( not ( = ?auto_21510 ?auto_21512 ) ) ( not ( = ?auto_21510 ?auto_21525 ) ) ( not ( = ?auto_21512 ?auto_21521 ) ) ( not ( = ?auto_21512 ?auto_21522 ) ) ( not ( = ?auto_21512 ?auto_21533 ) ) ( not ( = ?auto_21531 ?auto_21530 ) ) ( not ( = ?auto_21531 ?auto_21528 ) ) ( not ( = ?auto_21531 ?auto_21526 ) ) ( not ( = ?auto_21527 ?auto_21529 ) ) ( not ( = ?auto_21527 ?auto_21535 ) ) ( not ( = ?auto_21527 ?auto_21532 ) ) ( not ( = ?auto_21525 ?auto_21521 ) ) ( not ( = ?auto_21525 ?auto_21522 ) ) ( not ( = ?auto_21525 ?auto_21533 ) ) ( not ( = ?auto_21508 ?auto_21513 ) ) ( not ( = ?auto_21508 ?auto_21523 ) ) ( not ( = ?auto_21509 ?auto_21513 ) ) ( not ( = ?auto_21509 ?auto_21523 ) ) ( not ( = ?auto_21510 ?auto_21513 ) ) ( not ( = ?auto_21510 ?auto_21523 ) ) ( not ( = ?auto_21511 ?auto_21513 ) ) ( not ( = ?auto_21511 ?auto_21523 ) ) ( not ( = ?auto_21513 ?auto_21525 ) ) ( not ( = ?auto_21513 ?auto_21521 ) ) ( not ( = ?auto_21513 ?auto_21522 ) ) ( not ( = ?auto_21513 ?auto_21533 ) ) ( not ( = ?auto_21534 ?auto_21531 ) ) ( not ( = ?auto_21534 ?auto_21530 ) ) ( not ( = ?auto_21534 ?auto_21528 ) ) ( not ( = ?auto_21534 ?auto_21526 ) ) ( not ( = ?auto_21524 ?auto_21527 ) ) ( not ( = ?auto_21524 ?auto_21529 ) ) ( not ( = ?auto_21524 ?auto_21535 ) ) ( not ( = ?auto_21524 ?auto_21532 ) ) ( not ( = ?auto_21523 ?auto_21525 ) ) ( not ( = ?auto_21523 ?auto_21521 ) ) ( not ( = ?auto_21523 ?auto_21522 ) ) ( not ( = ?auto_21523 ?auto_21533 ) ) ( not ( = ?auto_21508 ?auto_21514 ) ) ( not ( = ?auto_21508 ?auto_21517 ) ) ( not ( = ?auto_21509 ?auto_21514 ) ) ( not ( = ?auto_21509 ?auto_21517 ) ) ( not ( = ?auto_21510 ?auto_21514 ) ) ( not ( = ?auto_21510 ?auto_21517 ) ) ( not ( = ?auto_21511 ?auto_21514 ) ) ( not ( = ?auto_21511 ?auto_21517 ) ) ( not ( = ?auto_21512 ?auto_21514 ) ) ( not ( = ?auto_21512 ?auto_21517 ) ) ( not ( = ?auto_21514 ?auto_21523 ) ) ( not ( = ?auto_21514 ?auto_21525 ) ) ( not ( = ?auto_21514 ?auto_21521 ) ) ( not ( = ?auto_21514 ?auto_21522 ) ) ( not ( = ?auto_21514 ?auto_21533 ) ) ( not ( = ?auto_21515 ?auto_21534 ) ) ( not ( = ?auto_21515 ?auto_21531 ) ) ( not ( = ?auto_21515 ?auto_21530 ) ) ( not ( = ?auto_21515 ?auto_21528 ) ) ( not ( = ?auto_21515 ?auto_21526 ) ) ( not ( = ?auto_21519 ?auto_21524 ) ) ( not ( = ?auto_21519 ?auto_21527 ) ) ( not ( = ?auto_21519 ?auto_21529 ) ) ( not ( = ?auto_21519 ?auto_21535 ) ) ( not ( = ?auto_21519 ?auto_21532 ) ) ( not ( = ?auto_21517 ?auto_21523 ) ) ( not ( = ?auto_21517 ?auto_21525 ) ) ( not ( = ?auto_21517 ?auto_21521 ) ) ( not ( = ?auto_21517 ?auto_21522 ) ) ( not ( = ?auto_21517 ?auto_21533 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_21508 ?auto_21509 ?auto_21510 ?auto_21511 ?auto_21512 ?auto_21513 )
      ( MAKE-1CRATE ?auto_21513 ?auto_21514 )
      ( MAKE-6CRATE-VERIFY ?auto_21508 ?auto_21509 ?auto_21510 ?auto_21511 ?auto_21512 ?auto_21513 ?auto_21514 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_21554 - SURFACE
      ?auto_21555 - SURFACE
      ?auto_21556 - SURFACE
      ?auto_21557 - SURFACE
      ?auto_21558 - SURFACE
      ?auto_21559 - SURFACE
      ?auto_21560 - SURFACE
      ?auto_21561 - SURFACE
    )
    :vars
    (
      ?auto_21563 - HOIST
      ?auto_21567 - PLACE
      ?auto_21562 - PLACE
      ?auto_21565 - HOIST
      ?auto_21566 - SURFACE
      ?auto_21584 - PLACE
      ?auto_21572 - HOIST
      ?auto_21585 - SURFACE
      ?auto_21576 - PLACE
      ?auto_21583 - HOIST
      ?auto_21582 - SURFACE
      ?auto_21574 - PLACE
      ?auto_21578 - HOIST
      ?auto_21580 - SURFACE
      ?auto_21571 - PLACE
      ?auto_21568 - HOIST
      ?auto_21570 - SURFACE
      ?auto_21581 - PLACE
      ?auto_21577 - HOIST
      ?auto_21569 - SURFACE
      ?auto_21579 - PLACE
      ?auto_21573 - HOIST
      ?auto_21575 - SURFACE
      ?auto_21564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21563 ?auto_21567 ) ( IS-CRATE ?auto_21561 ) ( not ( = ?auto_21562 ?auto_21567 ) ) ( HOIST-AT ?auto_21565 ?auto_21562 ) ( AVAILABLE ?auto_21565 ) ( SURFACE-AT ?auto_21561 ?auto_21562 ) ( ON ?auto_21561 ?auto_21566 ) ( CLEAR ?auto_21561 ) ( not ( = ?auto_21560 ?auto_21561 ) ) ( not ( = ?auto_21560 ?auto_21566 ) ) ( not ( = ?auto_21561 ?auto_21566 ) ) ( not ( = ?auto_21563 ?auto_21565 ) ) ( IS-CRATE ?auto_21560 ) ( not ( = ?auto_21584 ?auto_21567 ) ) ( HOIST-AT ?auto_21572 ?auto_21584 ) ( AVAILABLE ?auto_21572 ) ( SURFACE-AT ?auto_21560 ?auto_21584 ) ( ON ?auto_21560 ?auto_21585 ) ( CLEAR ?auto_21560 ) ( not ( = ?auto_21559 ?auto_21560 ) ) ( not ( = ?auto_21559 ?auto_21585 ) ) ( not ( = ?auto_21560 ?auto_21585 ) ) ( not ( = ?auto_21563 ?auto_21572 ) ) ( IS-CRATE ?auto_21559 ) ( not ( = ?auto_21576 ?auto_21567 ) ) ( HOIST-AT ?auto_21583 ?auto_21576 ) ( AVAILABLE ?auto_21583 ) ( SURFACE-AT ?auto_21559 ?auto_21576 ) ( ON ?auto_21559 ?auto_21582 ) ( CLEAR ?auto_21559 ) ( not ( = ?auto_21558 ?auto_21559 ) ) ( not ( = ?auto_21558 ?auto_21582 ) ) ( not ( = ?auto_21559 ?auto_21582 ) ) ( not ( = ?auto_21563 ?auto_21583 ) ) ( IS-CRATE ?auto_21558 ) ( not ( = ?auto_21574 ?auto_21567 ) ) ( HOIST-AT ?auto_21578 ?auto_21574 ) ( AVAILABLE ?auto_21578 ) ( SURFACE-AT ?auto_21558 ?auto_21574 ) ( ON ?auto_21558 ?auto_21580 ) ( CLEAR ?auto_21558 ) ( not ( = ?auto_21557 ?auto_21558 ) ) ( not ( = ?auto_21557 ?auto_21580 ) ) ( not ( = ?auto_21558 ?auto_21580 ) ) ( not ( = ?auto_21563 ?auto_21578 ) ) ( IS-CRATE ?auto_21557 ) ( not ( = ?auto_21571 ?auto_21567 ) ) ( HOIST-AT ?auto_21568 ?auto_21571 ) ( AVAILABLE ?auto_21568 ) ( SURFACE-AT ?auto_21557 ?auto_21571 ) ( ON ?auto_21557 ?auto_21570 ) ( CLEAR ?auto_21557 ) ( not ( = ?auto_21556 ?auto_21557 ) ) ( not ( = ?auto_21556 ?auto_21570 ) ) ( not ( = ?auto_21557 ?auto_21570 ) ) ( not ( = ?auto_21563 ?auto_21568 ) ) ( IS-CRATE ?auto_21556 ) ( not ( = ?auto_21581 ?auto_21567 ) ) ( HOIST-AT ?auto_21577 ?auto_21581 ) ( AVAILABLE ?auto_21577 ) ( SURFACE-AT ?auto_21556 ?auto_21581 ) ( ON ?auto_21556 ?auto_21569 ) ( CLEAR ?auto_21556 ) ( not ( = ?auto_21555 ?auto_21556 ) ) ( not ( = ?auto_21555 ?auto_21569 ) ) ( not ( = ?auto_21556 ?auto_21569 ) ) ( not ( = ?auto_21563 ?auto_21577 ) ) ( SURFACE-AT ?auto_21554 ?auto_21567 ) ( CLEAR ?auto_21554 ) ( IS-CRATE ?auto_21555 ) ( AVAILABLE ?auto_21563 ) ( not ( = ?auto_21579 ?auto_21567 ) ) ( HOIST-AT ?auto_21573 ?auto_21579 ) ( AVAILABLE ?auto_21573 ) ( SURFACE-AT ?auto_21555 ?auto_21579 ) ( ON ?auto_21555 ?auto_21575 ) ( CLEAR ?auto_21555 ) ( TRUCK-AT ?auto_21564 ?auto_21567 ) ( not ( = ?auto_21554 ?auto_21555 ) ) ( not ( = ?auto_21554 ?auto_21575 ) ) ( not ( = ?auto_21555 ?auto_21575 ) ) ( not ( = ?auto_21563 ?auto_21573 ) ) ( not ( = ?auto_21554 ?auto_21556 ) ) ( not ( = ?auto_21554 ?auto_21569 ) ) ( not ( = ?auto_21556 ?auto_21575 ) ) ( not ( = ?auto_21581 ?auto_21579 ) ) ( not ( = ?auto_21577 ?auto_21573 ) ) ( not ( = ?auto_21569 ?auto_21575 ) ) ( not ( = ?auto_21554 ?auto_21557 ) ) ( not ( = ?auto_21554 ?auto_21570 ) ) ( not ( = ?auto_21555 ?auto_21557 ) ) ( not ( = ?auto_21555 ?auto_21570 ) ) ( not ( = ?auto_21557 ?auto_21569 ) ) ( not ( = ?auto_21557 ?auto_21575 ) ) ( not ( = ?auto_21571 ?auto_21581 ) ) ( not ( = ?auto_21571 ?auto_21579 ) ) ( not ( = ?auto_21568 ?auto_21577 ) ) ( not ( = ?auto_21568 ?auto_21573 ) ) ( not ( = ?auto_21570 ?auto_21569 ) ) ( not ( = ?auto_21570 ?auto_21575 ) ) ( not ( = ?auto_21554 ?auto_21558 ) ) ( not ( = ?auto_21554 ?auto_21580 ) ) ( not ( = ?auto_21555 ?auto_21558 ) ) ( not ( = ?auto_21555 ?auto_21580 ) ) ( not ( = ?auto_21556 ?auto_21558 ) ) ( not ( = ?auto_21556 ?auto_21580 ) ) ( not ( = ?auto_21558 ?auto_21570 ) ) ( not ( = ?auto_21558 ?auto_21569 ) ) ( not ( = ?auto_21558 ?auto_21575 ) ) ( not ( = ?auto_21574 ?auto_21571 ) ) ( not ( = ?auto_21574 ?auto_21581 ) ) ( not ( = ?auto_21574 ?auto_21579 ) ) ( not ( = ?auto_21578 ?auto_21568 ) ) ( not ( = ?auto_21578 ?auto_21577 ) ) ( not ( = ?auto_21578 ?auto_21573 ) ) ( not ( = ?auto_21580 ?auto_21570 ) ) ( not ( = ?auto_21580 ?auto_21569 ) ) ( not ( = ?auto_21580 ?auto_21575 ) ) ( not ( = ?auto_21554 ?auto_21559 ) ) ( not ( = ?auto_21554 ?auto_21582 ) ) ( not ( = ?auto_21555 ?auto_21559 ) ) ( not ( = ?auto_21555 ?auto_21582 ) ) ( not ( = ?auto_21556 ?auto_21559 ) ) ( not ( = ?auto_21556 ?auto_21582 ) ) ( not ( = ?auto_21557 ?auto_21559 ) ) ( not ( = ?auto_21557 ?auto_21582 ) ) ( not ( = ?auto_21559 ?auto_21580 ) ) ( not ( = ?auto_21559 ?auto_21570 ) ) ( not ( = ?auto_21559 ?auto_21569 ) ) ( not ( = ?auto_21559 ?auto_21575 ) ) ( not ( = ?auto_21576 ?auto_21574 ) ) ( not ( = ?auto_21576 ?auto_21571 ) ) ( not ( = ?auto_21576 ?auto_21581 ) ) ( not ( = ?auto_21576 ?auto_21579 ) ) ( not ( = ?auto_21583 ?auto_21578 ) ) ( not ( = ?auto_21583 ?auto_21568 ) ) ( not ( = ?auto_21583 ?auto_21577 ) ) ( not ( = ?auto_21583 ?auto_21573 ) ) ( not ( = ?auto_21582 ?auto_21580 ) ) ( not ( = ?auto_21582 ?auto_21570 ) ) ( not ( = ?auto_21582 ?auto_21569 ) ) ( not ( = ?auto_21582 ?auto_21575 ) ) ( not ( = ?auto_21554 ?auto_21560 ) ) ( not ( = ?auto_21554 ?auto_21585 ) ) ( not ( = ?auto_21555 ?auto_21560 ) ) ( not ( = ?auto_21555 ?auto_21585 ) ) ( not ( = ?auto_21556 ?auto_21560 ) ) ( not ( = ?auto_21556 ?auto_21585 ) ) ( not ( = ?auto_21557 ?auto_21560 ) ) ( not ( = ?auto_21557 ?auto_21585 ) ) ( not ( = ?auto_21558 ?auto_21560 ) ) ( not ( = ?auto_21558 ?auto_21585 ) ) ( not ( = ?auto_21560 ?auto_21582 ) ) ( not ( = ?auto_21560 ?auto_21580 ) ) ( not ( = ?auto_21560 ?auto_21570 ) ) ( not ( = ?auto_21560 ?auto_21569 ) ) ( not ( = ?auto_21560 ?auto_21575 ) ) ( not ( = ?auto_21584 ?auto_21576 ) ) ( not ( = ?auto_21584 ?auto_21574 ) ) ( not ( = ?auto_21584 ?auto_21571 ) ) ( not ( = ?auto_21584 ?auto_21581 ) ) ( not ( = ?auto_21584 ?auto_21579 ) ) ( not ( = ?auto_21572 ?auto_21583 ) ) ( not ( = ?auto_21572 ?auto_21578 ) ) ( not ( = ?auto_21572 ?auto_21568 ) ) ( not ( = ?auto_21572 ?auto_21577 ) ) ( not ( = ?auto_21572 ?auto_21573 ) ) ( not ( = ?auto_21585 ?auto_21582 ) ) ( not ( = ?auto_21585 ?auto_21580 ) ) ( not ( = ?auto_21585 ?auto_21570 ) ) ( not ( = ?auto_21585 ?auto_21569 ) ) ( not ( = ?auto_21585 ?auto_21575 ) ) ( not ( = ?auto_21554 ?auto_21561 ) ) ( not ( = ?auto_21554 ?auto_21566 ) ) ( not ( = ?auto_21555 ?auto_21561 ) ) ( not ( = ?auto_21555 ?auto_21566 ) ) ( not ( = ?auto_21556 ?auto_21561 ) ) ( not ( = ?auto_21556 ?auto_21566 ) ) ( not ( = ?auto_21557 ?auto_21561 ) ) ( not ( = ?auto_21557 ?auto_21566 ) ) ( not ( = ?auto_21558 ?auto_21561 ) ) ( not ( = ?auto_21558 ?auto_21566 ) ) ( not ( = ?auto_21559 ?auto_21561 ) ) ( not ( = ?auto_21559 ?auto_21566 ) ) ( not ( = ?auto_21561 ?auto_21585 ) ) ( not ( = ?auto_21561 ?auto_21582 ) ) ( not ( = ?auto_21561 ?auto_21580 ) ) ( not ( = ?auto_21561 ?auto_21570 ) ) ( not ( = ?auto_21561 ?auto_21569 ) ) ( not ( = ?auto_21561 ?auto_21575 ) ) ( not ( = ?auto_21562 ?auto_21584 ) ) ( not ( = ?auto_21562 ?auto_21576 ) ) ( not ( = ?auto_21562 ?auto_21574 ) ) ( not ( = ?auto_21562 ?auto_21571 ) ) ( not ( = ?auto_21562 ?auto_21581 ) ) ( not ( = ?auto_21562 ?auto_21579 ) ) ( not ( = ?auto_21565 ?auto_21572 ) ) ( not ( = ?auto_21565 ?auto_21583 ) ) ( not ( = ?auto_21565 ?auto_21578 ) ) ( not ( = ?auto_21565 ?auto_21568 ) ) ( not ( = ?auto_21565 ?auto_21577 ) ) ( not ( = ?auto_21565 ?auto_21573 ) ) ( not ( = ?auto_21566 ?auto_21585 ) ) ( not ( = ?auto_21566 ?auto_21582 ) ) ( not ( = ?auto_21566 ?auto_21580 ) ) ( not ( = ?auto_21566 ?auto_21570 ) ) ( not ( = ?auto_21566 ?auto_21569 ) ) ( not ( = ?auto_21566 ?auto_21575 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_21554 ?auto_21555 ?auto_21556 ?auto_21557 ?auto_21558 ?auto_21559 ?auto_21560 )
      ( MAKE-1CRATE ?auto_21560 ?auto_21561 )
      ( MAKE-7CRATE-VERIFY ?auto_21554 ?auto_21555 ?auto_21556 ?auto_21557 ?auto_21558 ?auto_21559 ?auto_21560 ?auto_21561 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_21605 - SURFACE
      ?auto_21606 - SURFACE
      ?auto_21607 - SURFACE
      ?auto_21608 - SURFACE
      ?auto_21609 - SURFACE
      ?auto_21610 - SURFACE
      ?auto_21611 - SURFACE
      ?auto_21612 - SURFACE
      ?auto_21613 - SURFACE
    )
    :vars
    (
      ?auto_21616 - HOIST
      ?auto_21619 - PLACE
      ?auto_21614 - PLACE
      ?auto_21618 - HOIST
      ?auto_21617 - SURFACE
      ?auto_21623 - PLACE
      ?auto_21624 - HOIST
      ?auto_21640 - SURFACE
      ?auto_21630 - PLACE
      ?auto_21622 - HOIST
      ?auto_21629 - SURFACE
      ?auto_21633 - PLACE
      ?auto_21632 - HOIST
      ?auto_21628 - SURFACE
      ?auto_21639 - PLACE
      ?auto_21634 - HOIST
      ?auto_21620 - SURFACE
      ?auto_21625 - PLACE
      ?auto_21631 - HOIST
      ?auto_21627 - SURFACE
      ?auto_21635 - PLACE
      ?auto_21637 - HOIST
      ?auto_21626 - SURFACE
      ?auto_21636 - PLACE
      ?auto_21621 - HOIST
      ?auto_21638 - SURFACE
      ?auto_21615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21616 ?auto_21619 ) ( IS-CRATE ?auto_21613 ) ( not ( = ?auto_21614 ?auto_21619 ) ) ( HOIST-AT ?auto_21618 ?auto_21614 ) ( AVAILABLE ?auto_21618 ) ( SURFACE-AT ?auto_21613 ?auto_21614 ) ( ON ?auto_21613 ?auto_21617 ) ( CLEAR ?auto_21613 ) ( not ( = ?auto_21612 ?auto_21613 ) ) ( not ( = ?auto_21612 ?auto_21617 ) ) ( not ( = ?auto_21613 ?auto_21617 ) ) ( not ( = ?auto_21616 ?auto_21618 ) ) ( IS-CRATE ?auto_21612 ) ( not ( = ?auto_21623 ?auto_21619 ) ) ( HOIST-AT ?auto_21624 ?auto_21623 ) ( AVAILABLE ?auto_21624 ) ( SURFACE-AT ?auto_21612 ?auto_21623 ) ( ON ?auto_21612 ?auto_21640 ) ( CLEAR ?auto_21612 ) ( not ( = ?auto_21611 ?auto_21612 ) ) ( not ( = ?auto_21611 ?auto_21640 ) ) ( not ( = ?auto_21612 ?auto_21640 ) ) ( not ( = ?auto_21616 ?auto_21624 ) ) ( IS-CRATE ?auto_21611 ) ( not ( = ?auto_21630 ?auto_21619 ) ) ( HOIST-AT ?auto_21622 ?auto_21630 ) ( AVAILABLE ?auto_21622 ) ( SURFACE-AT ?auto_21611 ?auto_21630 ) ( ON ?auto_21611 ?auto_21629 ) ( CLEAR ?auto_21611 ) ( not ( = ?auto_21610 ?auto_21611 ) ) ( not ( = ?auto_21610 ?auto_21629 ) ) ( not ( = ?auto_21611 ?auto_21629 ) ) ( not ( = ?auto_21616 ?auto_21622 ) ) ( IS-CRATE ?auto_21610 ) ( not ( = ?auto_21633 ?auto_21619 ) ) ( HOIST-AT ?auto_21632 ?auto_21633 ) ( AVAILABLE ?auto_21632 ) ( SURFACE-AT ?auto_21610 ?auto_21633 ) ( ON ?auto_21610 ?auto_21628 ) ( CLEAR ?auto_21610 ) ( not ( = ?auto_21609 ?auto_21610 ) ) ( not ( = ?auto_21609 ?auto_21628 ) ) ( not ( = ?auto_21610 ?auto_21628 ) ) ( not ( = ?auto_21616 ?auto_21632 ) ) ( IS-CRATE ?auto_21609 ) ( not ( = ?auto_21639 ?auto_21619 ) ) ( HOIST-AT ?auto_21634 ?auto_21639 ) ( AVAILABLE ?auto_21634 ) ( SURFACE-AT ?auto_21609 ?auto_21639 ) ( ON ?auto_21609 ?auto_21620 ) ( CLEAR ?auto_21609 ) ( not ( = ?auto_21608 ?auto_21609 ) ) ( not ( = ?auto_21608 ?auto_21620 ) ) ( not ( = ?auto_21609 ?auto_21620 ) ) ( not ( = ?auto_21616 ?auto_21634 ) ) ( IS-CRATE ?auto_21608 ) ( not ( = ?auto_21625 ?auto_21619 ) ) ( HOIST-AT ?auto_21631 ?auto_21625 ) ( AVAILABLE ?auto_21631 ) ( SURFACE-AT ?auto_21608 ?auto_21625 ) ( ON ?auto_21608 ?auto_21627 ) ( CLEAR ?auto_21608 ) ( not ( = ?auto_21607 ?auto_21608 ) ) ( not ( = ?auto_21607 ?auto_21627 ) ) ( not ( = ?auto_21608 ?auto_21627 ) ) ( not ( = ?auto_21616 ?auto_21631 ) ) ( IS-CRATE ?auto_21607 ) ( not ( = ?auto_21635 ?auto_21619 ) ) ( HOIST-AT ?auto_21637 ?auto_21635 ) ( AVAILABLE ?auto_21637 ) ( SURFACE-AT ?auto_21607 ?auto_21635 ) ( ON ?auto_21607 ?auto_21626 ) ( CLEAR ?auto_21607 ) ( not ( = ?auto_21606 ?auto_21607 ) ) ( not ( = ?auto_21606 ?auto_21626 ) ) ( not ( = ?auto_21607 ?auto_21626 ) ) ( not ( = ?auto_21616 ?auto_21637 ) ) ( SURFACE-AT ?auto_21605 ?auto_21619 ) ( CLEAR ?auto_21605 ) ( IS-CRATE ?auto_21606 ) ( AVAILABLE ?auto_21616 ) ( not ( = ?auto_21636 ?auto_21619 ) ) ( HOIST-AT ?auto_21621 ?auto_21636 ) ( AVAILABLE ?auto_21621 ) ( SURFACE-AT ?auto_21606 ?auto_21636 ) ( ON ?auto_21606 ?auto_21638 ) ( CLEAR ?auto_21606 ) ( TRUCK-AT ?auto_21615 ?auto_21619 ) ( not ( = ?auto_21605 ?auto_21606 ) ) ( not ( = ?auto_21605 ?auto_21638 ) ) ( not ( = ?auto_21606 ?auto_21638 ) ) ( not ( = ?auto_21616 ?auto_21621 ) ) ( not ( = ?auto_21605 ?auto_21607 ) ) ( not ( = ?auto_21605 ?auto_21626 ) ) ( not ( = ?auto_21607 ?auto_21638 ) ) ( not ( = ?auto_21635 ?auto_21636 ) ) ( not ( = ?auto_21637 ?auto_21621 ) ) ( not ( = ?auto_21626 ?auto_21638 ) ) ( not ( = ?auto_21605 ?auto_21608 ) ) ( not ( = ?auto_21605 ?auto_21627 ) ) ( not ( = ?auto_21606 ?auto_21608 ) ) ( not ( = ?auto_21606 ?auto_21627 ) ) ( not ( = ?auto_21608 ?auto_21626 ) ) ( not ( = ?auto_21608 ?auto_21638 ) ) ( not ( = ?auto_21625 ?auto_21635 ) ) ( not ( = ?auto_21625 ?auto_21636 ) ) ( not ( = ?auto_21631 ?auto_21637 ) ) ( not ( = ?auto_21631 ?auto_21621 ) ) ( not ( = ?auto_21627 ?auto_21626 ) ) ( not ( = ?auto_21627 ?auto_21638 ) ) ( not ( = ?auto_21605 ?auto_21609 ) ) ( not ( = ?auto_21605 ?auto_21620 ) ) ( not ( = ?auto_21606 ?auto_21609 ) ) ( not ( = ?auto_21606 ?auto_21620 ) ) ( not ( = ?auto_21607 ?auto_21609 ) ) ( not ( = ?auto_21607 ?auto_21620 ) ) ( not ( = ?auto_21609 ?auto_21627 ) ) ( not ( = ?auto_21609 ?auto_21626 ) ) ( not ( = ?auto_21609 ?auto_21638 ) ) ( not ( = ?auto_21639 ?auto_21625 ) ) ( not ( = ?auto_21639 ?auto_21635 ) ) ( not ( = ?auto_21639 ?auto_21636 ) ) ( not ( = ?auto_21634 ?auto_21631 ) ) ( not ( = ?auto_21634 ?auto_21637 ) ) ( not ( = ?auto_21634 ?auto_21621 ) ) ( not ( = ?auto_21620 ?auto_21627 ) ) ( not ( = ?auto_21620 ?auto_21626 ) ) ( not ( = ?auto_21620 ?auto_21638 ) ) ( not ( = ?auto_21605 ?auto_21610 ) ) ( not ( = ?auto_21605 ?auto_21628 ) ) ( not ( = ?auto_21606 ?auto_21610 ) ) ( not ( = ?auto_21606 ?auto_21628 ) ) ( not ( = ?auto_21607 ?auto_21610 ) ) ( not ( = ?auto_21607 ?auto_21628 ) ) ( not ( = ?auto_21608 ?auto_21610 ) ) ( not ( = ?auto_21608 ?auto_21628 ) ) ( not ( = ?auto_21610 ?auto_21620 ) ) ( not ( = ?auto_21610 ?auto_21627 ) ) ( not ( = ?auto_21610 ?auto_21626 ) ) ( not ( = ?auto_21610 ?auto_21638 ) ) ( not ( = ?auto_21633 ?auto_21639 ) ) ( not ( = ?auto_21633 ?auto_21625 ) ) ( not ( = ?auto_21633 ?auto_21635 ) ) ( not ( = ?auto_21633 ?auto_21636 ) ) ( not ( = ?auto_21632 ?auto_21634 ) ) ( not ( = ?auto_21632 ?auto_21631 ) ) ( not ( = ?auto_21632 ?auto_21637 ) ) ( not ( = ?auto_21632 ?auto_21621 ) ) ( not ( = ?auto_21628 ?auto_21620 ) ) ( not ( = ?auto_21628 ?auto_21627 ) ) ( not ( = ?auto_21628 ?auto_21626 ) ) ( not ( = ?auto_21628 ?auto_21638 ) ) ( not ( = ?auto_21605 ?auto_21611 ) ) ( not ( = ?auto_21605 ?auto_21629 ) ) ( not ( = ?auto_21606 ?auto_21611 ) ) ( not ( = ?auto_21606 ?auto_21629 ) ) ( not ( = ?auto_21607 ?auto_21611 ) ) ( not ( = ?auto_21607 ?auto_21629 ) ) ( not ( = ?auto_21608 ?auto_21611 ) ) ( not ( = ?auto_21608 ?auto_21629 ) ) ( not ( = ?auto_21609 ?auto_21611 ) ) ( not ( = ?auto_21609 ?auto_21629 ) ) ( not ( = ?auto_21611 ?auto_21628 ) ) ( not ( = ?auto_21611 ?auto_21620 ) ) ( not ( = ?auto_21611 ?auto_21627 ) ) ( not ( = ?auto_21611 ?auto_21626 ) ) ( not ( = ?auto_21611 ?auto_21638 ) ) ( not ( = ?auto_21630 ?auto_21633 ) ) ( not ( = ?auto_21630 ?auto_21639 ) ) ( not ( = ?auto_21630 ?auto_21625 ) ) ( not ( = ?auto_21630 ?auto_21635 ) ) ( not ( = ?auto_21630 ?auto_21636 ) ) ( not ( = ?auto_21622 ?auto_21632 ) ) ( not ( = ?auto_21622 ?auto_21634 ) ) ( not ( = ?auto_21622 ?auto_21631 ) ) ( not ( = ?auto_21622 ?auto_21637 ) ) ( not ( = ?auto_21622 ?auto_21621 ) ) ( not ( = ?auto_21629 ?auto_21628 ) ) ( not ( = ?auto_21629 ?auto_21620 ) ) ( not ( = ?auto_21629 ?auto_21627 ) ) ( not ( = ?auto_21629 ?auto_21626 ) ) ( not ( = ?auto_21629 ?auto_21638 ) ) ( not ( = ?auto_21605 ?auto_21612 ) ) ( not ( = ?auto_21605 ?auto_21640 ) ) ( not ( = ?auto_21606 ?auto_21612 ) ) ( not ( = ?auto_21606 ?auto_21640 ) ) ( not ( = ?auto_21607 ?auto_21612 ) ) ( not ( = ?auto_21607 ?auto_21640 ) ) ( not ( = ?auto_21608 ?auto_21612 ) ) ( not ( = ?auto_21608 ?auto_21640 ) ) ( not ( = ?auto_21609 ?auto_21612 ) ) ( not ( = ?auto_21609 ?auto_21640 ) ) ( not ( = ?auto_21610 ?auto_21612 ) ) ( not ( = ?auto_21610 ?auto_21640 ) ) ( not ( = ?auto_21612 ?auto_21629 ) ) ( not ( = ?auto_21612 ?auto_21628 ) ) ( not ( = ?auto_21612 ?auto_21620 ) ) ( not ( = ?auto_21612 ?auto_21627 ) ) ( not ( = ?auto_21612 ?auto_21626 ) ) ( not ( = ?auto_21612 ?auto_21638 ) ) ( not ( = ?auto_21623 ?auto_21630 ) ) ( not ( = ?auto_21623 ?auto_21633 ) ) ( not ( = ?auto_21623 ?auto_21639 ) ) ( not ( = ?auto_21623 ?auto_21625 ) ) ( not ( = ?auto_21623 ?auto_21635 ) ) ( not ( = ?auto_21623 ?auto_21636 ) ) ( not ( = ?auto_21624 ?auto_21622 ) ) ( not ( = ?auto_21624 ?auto_21632 ) ) ( not ( = ?auto_21624 ?auto_21634 ) ) ( not ( = ?auto_21624 ?auto_21631 ) ) ( not ( = ?auto_21624 ?auto_21637 ) ) ( not ( = ?auto_21624 ?auto_21621 ) ) ( not ( = ?auto_21640 ?auto_21629 ) ) ( not ( = ?auto_21640 ?auto_21628 ) ) ( not ( = ?auto_21640 ?auto_21620 ) ) ( not ( = ?auto_21640 ?auto_21627 ) ) ( not ( = ?auto_21640 ?auto_21626 ) ) ( not ( = ?auto_21640 ?auto_21638 ) ) ( not ( = ?auto_21605 ?auto_21613 ) ) ( not ( = ?auto_21605 ?auto_21617 ) ) ( not ( = ?auto_21606 ?auto_21613 ) ) ( not ( = ?auto_21606 ?auto_21617 ) ) ( not ( = ?auto_21607 ?auto_21613 ) ) ( not ( = ?auto_21607 ?auto_21617 ) ) ( not ( = ?auto_21608 ?auto_21613 ) ) ( not ( = ?auto_21608 ?auto_21617 ) ) ( not ( = ?auto_21609 ?auto_21613 ) ) ( not ( = ?auto_21609 ?auto_21617 ) ) ( not ( = ?auto_21610 ?auto_21613 ) ) ( not ( = ?auto_21610 ?auto_21617 ) ) ( not ( = ?auto_21611 ?auto_21613 ) ) ( not ( = ?auto_21611 ?auto_21617 ) ) ( not ( = ?auto_21613 ?auto_21640 ) ) ( not ( = ?auto_21613 ?auto_21629 ) ) ( not ( = ?auto_21613 ?auto_21628 ) ) ( not ( = ?auto_21613 ?auto_21620 ) ) ( not ( = ?auto_21613 ?auto_21627 ) ) ( not ( = ?auto_21613 ?auto_21626 ) ) ( not ( = ?auto_21613 ?auto_21638 ) ) ( not ( = ?auto_21614 ?auto_21623 ) ) ( not ( = ?auto_21614 ?auto_21630 ) ) ( not ( = ?auto_21614 ?auto_21633 ) ) ( not ( = ?auto_21614 ?auto_21639 ) ) ( not ( = ?auto_21614 ?auto_21625 ) ) ( not ( = ?auto_21614 ?auto_21635 ) ) ( not ( = ?auto_21614 ?auto_21636 ) ) ( not ( = ?auto_21618 ?auto_21624 ) ) ( not ( = ?auto_21618 ?auto_21622 ) ) ( not ( = ?auto_21618 ?auto_21632 ) ) ( not ( = ?auto_21618 ?auto_21634 ) ) ( not ( = ?auto_21618 ?auto_21631 ) ) ( not ( = ?auto_21618 ?auto_21637 ) ) ( not ( = ?auto_21618 ?auto_21621 ) ) ( not ( = ?auto_21617 ?auto_21640 ) ) ( not ( = ?auto_21617 ?auto_21629 ) ) ( not ( = ?auto_21617 ?auto_21628 ) ) ( not ( = ?auto_21617 ?auto_21620 ) ) ( not ( = ?auto_21617 ?auto_21627 ) ) ( not ( = ?auto_21617 ?auto_21626 ) ) ( not ( = ?auto_21617 ?auto_21638 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_21605 ?auto_21606 ?auto_21607 ?auto_21608 ?auto_21609 ?auto_21610 ?auto_21611 ?auto_21612 )
      ( MAKE-1CRATE ?auto_21612 ?auto_21613 )
      ( MAKE-8CRATE-VERIFY ?auto_21605 ?auto_21606 ?auto_21607 ?auto_21608 ?auto_21609 ?auto_21610 ?auto_21611 ?auto_21612 ?auto_21613 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_21661 - SURFACE
      ?auto_21662 - SURFACE
      ?auto_21663 - SURFACE
      ?auto_21664 - SURFACE
      ?auto_21665 - SURFACE
      ?auto_21666 - SURFACE
      ?auto_21667 - SURFACE
      ?auto_21668 - SURFACE
      ?auto_21669 - SURFACE
      ?auto_21670 - SURFACE
    )
    :vars
    (
      ?auto_21673 - HOIST
      ?auto_21674 - PLACE
      ?auto_21672 - PLACE
      ?auto_21675 - HOIST
      ?auto_21671 - SURFACE
      ?auto_21685 - PLACE
      ?auto_21696 - HOIST
      ?auto_21697 - SURFACE
      ?auto_21678 - PLACE
      ?auto_21695 - HOIST
      ?auto_21682 - SURFACE
      ?auto_21687 - PLACE
      ?auto_21677 - HOIST
      ?auto_21688 - SURFACE
      ?auto_21691 - PLACE
      ?auto_21690 - HOIST
      ?auto_21686 - SURFACE
      ?auto_21683 - PLACE
      ?auto_21698 - HOIST
      ?auto_21680 - SURFACE
      ?auto_21694 - PLACE
      ?auto_21689 - HOIST
      ?auto_21692 - SURFACE
      ?auto_21684 - PLACE
      ?auto_21679 - HOIST
      ?auto_21693 - SURFACE
      ?auto_21681 - SURFACE
      ?auto_21676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21673 ?auto_21674 ) ( IS-CRATE ?auto_21670 ) ( not ( = ?auto_21672 ?auto_21674 ) ) ( HOIST-AT ?auto_21675 ?auto_21672 ) ( SURFACE-AT ?auto_21670 ?auto_21672 ) ( ON ?auto_21670 ?auto_21671 ) ( CLEAR ?auto_21670 ) ( not ( = ?auto_21669 ?auto_21670 ) ) ( not ( = ?auto_21669 ?auto_21671 ) ) ( not ( = ?auto_21670 ?auto_21671 ) ) ( not ( = ?auto_21673 ?auto_21675 ) ) ( IS-CRATE ?auto_21669 ) ( not ( = ?auto_21685 ?auto_21674 ) ) ( HOIST-AT ?auto_21696 ?auto_21685 ) ( AVAILABLE ?auto_21696 ) ( SURFACE-AT ?auto_21669 ?auto_21685 ) ( ON ?auto_21669 ?auto_21697 ) ( CLEAR ?auto_21669 ) ( not ( = ?auto_21668 ?auto_21669 ) ) ( not ( = ?auto_21668 ?auto_21697 ) ) ( not ( = ?auto_21669 ?auto_21697 ) ) ( not ( = ?auto_21673 ?auto_21696 ) ) ( IS-CRATE ?auto_21668 ) ( not ( = ?auto_21678 ?auto_21674 ) ) ( HOIST-AT ?auto_21695 ?auto_21678 ) ( AVAILABLE ?auto_21695 ) ( SURFACE-AT ?auto_21668 ?auto_21678 ) ( ON ?auto_21668 ?auto_21682 ) ( CLEAR ?auto_21668 ) ( not ( = ?auto_21667 ?auto_21668 ) ) ( not ( = ?auto_21667 ?auto_21682 ) ) ( not ( = ?auto_21668 ?auto_21682 ) ) ( not ( = ?auto_21673 ?auto_21695 ) ) ( IS-CRATE ?auto_21667 ) ( not ( = ?auto_21687 ?auto_21674 ) ) ( HOIST-AT ?auto_21677 ?auto_21687 ) ( AVAILABLE ?auto_21677 ) ( SURFACE-AT ?auto_21667 ?auto_21687 ) ( ON ?auto_21667 ?auto_21688 ) ( CLEAR ?auto_21667 ) ( not ( = ?auto_21666 ?auto_21667 ) ) ( not ( = ?auto_21666 ?auto_21688 ) ) ( not ( = ?auto_21667 ?auto_21688 ) ) ( not ( = ?auto_21673 ?auto_21677 ) ) ( IS-CRATE ?auto_21666 ) ( not ( = ?auto_21691 ?auto_21674 ) ) ( HOIST-AT ?auto_21690 ?auto_21691 ) ( AVAILABLE ?auto_21690 ) ( SURFACE-AT ?auto_21666 ?auto_21691 ) ( ON ?auto_21666 ?auto_21686 ) ( CLEAR ?auto_21666 ) ( not ( = ?auto_21665 ?auto_21666 ) ) ( not ( = ?auto_21665 ?auto_21686 ) ) ( not ( = ?auto_21666 ?auto_21686 ) ) ( not ( = ?auto_21673 ?auto_21690 ) ) ( IS-CRATE ?auto_21665 ) ( not ( = ?auto_21683 ?auto_21674 ) ) ( HOIST-AT ?auto_21698 ?auto_21683 ) ( AVAILABLE ?auto_21698 ) ( SURFACE-AT ?auto_21665 ?auto_21683 ) ( ON ?auto_21665 ?auto_21680 ) ( CLEAR ?auto_21665 ) ( not ( = ?auto_21664 ?auto_21665 ) ) ( not ( = ?auto_21664 ?auto_21680 ) ) ( not ( = ?auto_21665 ?auto_21680 ) ) ( not ( = ?auto_21673 ?auto_21698 ) ) ( IS-CRATE ?auto_21664 ) ( not ( = ?auto_21694 ?auto_21674 ) ) ( HOIST-AT ?auto_21689 ?auto_21694 ) ( AVAILABLE ?auto_21689 ) ( SURFACE-AT ?auto_21664 ?auto_21694 ) ( ON ?auto_21664 ?auto_21692 ) ( CLEAR ?auto_21664 ) ( not ( = ?auto_21663 ?auto_21664 ) ) ( not ( = ?auto_21663 ?auto_21692 ) ) ( not ( = ?auto_21664 ?auto_21692 ) ) ( not ( = ?auto_21673 ?auto_21689 ) ) ( IS-CRATE ?auto_21663 ) ( not ( = ?auto_21684 ?auto_21674 ) ) ( HOIST-AT ?auto_21679 ?auto_21684 ) ( AVAILABLE ?auto_21679 ) ( SURFACE-AT ?auto_21663 ?auto_21684 ) ( ON ?auto_21663 ?auto_21693 ) ( CLEAR ?auto_21663 ) ( not ( = ?auto_21662 ?auto_21663 ) ) ( not ( = ?auto_21662 ?auto_21693 ) ) ( not ( = ?auto_21663 ?auto_21693 ) ) ( not ( = ?auto_21673 ?auto_21679 ) ) ( SURFACE-AT ?auto_21661 ?auto_21674 ) ( CLEAR ?auto_21661 ) ( IS-CRATE ?auto_21662 ) ( AVAILABLE ?auto_21673 ) ( AVAILABLE ?auto_21675 ) ( SURFACE-AT ?auto_21662 ?auto_21672 ) ( ON ?auto_21662 ?auto_21681 ) ( CLEAR ?auto_21662 ) ( TRUCK-AT ?auto_21676 ?auto_21674 ) ( not ( = ?auto_21661 ?auto_21662 ) ) ( not ( = ?auto_21661 ?auto_21681 ) ) ( not ( = ?auto_21662 ?auto_21681 ) ) ( not ( = ?auto_21661 ?auto_21663 ) ) ( not ( = ?auto_21661 ?auto_21693 ) ) ( not ( = ?auto_21663 ?auto_21681 ) ) ( not ( = ?auto_21684 ?auto_21672 ) ) ( not ( = ?auto_21679 ?auto_21675 ) ) ( not ( = ?auto_21693 ?auto_21681 ) ) ( not ( = ?auto_21661 ?auto_21664 ) ) ( not ( = ?auto_21661 ?auto_21692 ) ) ( not ( = ?auto_21662 ?auto_21664 ) ) ( not ( = ?auto_21662 ?auto_21692 ) ) ( not ( = ?auto_21664 ?auto_21693 ) ) ( not ( = ?auto_21664 ?auto_21681 ) ) ( not ( = ?auto_21694 ?auto_21684 ) ) ( not ( = ?auto_21694 ?auto_21672 ) ) ( not ( = ?auto_21689 ?auto_21679 ) ) ( not ( = ?auto_21689 ?auto_21675 ) ) ( not ( = ?auto_21692 ?auto_21693 ) ) ( not ( = ?auto_21692 ?auto_21681 ) ) ( not ( = ?auto_21661 ?auto_21665 ) ) ( not ( = ?auto_21661 ?auto_21680 ) ) ( not ( = ?auto_21662 ?auto_21665 ) ) ( not ( = ?auto_21662 ?auto_21680 ) ) ( not ( = ?auto_21663 ?auto_21665 ) ) ( not ( = ?auto_21663 ?auto_21680 ) ) ( not ( = ?auto_21665 ?auto_21692 ) ) ( not ( = ?auto_21665 ?auto_21693 ) ) ( not ( = ?auto_21665 ?auto_21681 ) ) ( not ( = ?auto_21683 ?auto_21694 ) ) ( not ( = ?auto_21683 ?auto_21684 ) ) ( not ( = ?auto_21683 ?auto_21672 ) ) ( not ( = ?auto_21698 ?auto_21689 ) ) ( not ( = ?auto_21698 ?auto_21679 ) ) ( not ( = ?auto_21698 ?auto_21675 ) ) ( not ( = ?auto_21680 ?auto_21692 ) ) ( not ( = ?auto_21680 ?auto_21693 ) ) ( not ( = ?auto_21680 ?auto_21681 ) ) ( not ( = ?auto_21661 ?auto_21666 ) ) ( not ( = ?auto_21661 ?auto_21686 ) ) ( not ( = ?auto_21662 ?auto_21666 ) ) ( not ( = ?auto_21662 ?auto_21686 ) ) ( not ( = ?auto_21663 ?auto_21666 ) ) ( not ( = ?auto_21663 ?auto_21686 ) ) ( not ( = ?auto_21664 ?auto_21666 ) ) ( not ( = ?auto_21664 ?auto_21686 ) ) ( not ( = ?auto_21666 ?auto_21680 ) ) ( not ( = ?auto_21666 ?auto_21692 ) ) ( not ( = ?auto_21666 ?auto_21693 ) ) ( not ( = ?auto_21666 ?auto_21681 ) ) ( not ( = ?auto_21691 ?auto_21683 ) ) ( not ( = ?auto_21691 ?auto_21694 ) ) ( not ( = ?auto_21691 ?auto_21684 ) ) ( not ( = ?auto_21691 ?auto_21672 ) ) ( not ( = ?auto_21690 ?auto_21698 ) ) ( not ( = ?auto_21690 ?auto_21689 ) ) ( not ( = ?auto_21690 ?auto_21679 ) ) ( not ( = ?auto_21690 ?auto_21675 ) ) ( not ( = ?auto_21686 ?auto_21680 ) ) ( not ( = ?auto_21686 ?auto_21692 ) ) ( not ( = ?auto_21686 ?auto_21693 ) ) ( not ( = ?auto_21686 ?auto_21681 ) ) ( not ( = ?auto_21661 ?auto_21667 ) ) ( not ( = ?auto_21661 ?auto_21688 ) ) ( not ( = ?auto_21662 ?auto_21667 ) ) ( not ( = ?auto_21662 ?auto_21688 ) ) ( not ( = ?auto_21663 ?auto_21667 ) ) ( not ( = ?auto_21663 ?auto_21688 ) ) ( not ( = ?auto_21664 ?auto_21667 ) ) ( not ( = ?auto_21664 ?auto_21688 ) ) ( not ( = ?auto_21665 ?auto_21667 ) ) ( not ( = ?auto_21665 ?auto_21688 ) ) ( not ( = ?auto_21667 ?auto_21686 ) ) ( not ( = ?auto_21667 ?auto_21680 ) ) ( not ( = ?auto_21667 ?auto_21692 ) ) ( not ( = ?auto_21667 ?auto_21693 ) ) ( not ( = ?auto_21667 ?auto_21681 ) ) ( not ( = ?auto_21687 ?auto_21691 ) ) ( not ( = ?auto_21687 ?auto_21683 ) ) ( not ( = ?auto_21687 ?auto_21694 ) ) ( not ( = ?auto_21687 ?auto_21684 ) ) ( not ( = ?auto_21687 ?auto_21672 ) ) ( not ( = ?auto_21677 ?auto_21690 ) ) ( not ( = ?auto_21677 ?auto_21698 ) ) ( not ( = ?auto_21677 ?auto_21689 ) ) ( not ( = ?auto_21677 ?auto_21679 ) ) ( not ( = ?auto_21677 ?auto_21675 ) ) ( not ( = ?auto_21688 ?auto_21686 ) ) ( not ( = ?auto_21688 ?auto_21680 ) ) ( not ( = ?auto_21688 ?auto_21692 ) ) ( not ( = ?auto_21688 ?auto_21693 ) ) ( not ( = ?auto_21688 ?auto_21681 ) ) ( not ( = ?auto_21661 ?auto_21668 ) ) ( not ( = ?auto_21661 ?auto_21682 ) ) ( not ( = ?auto_21662 ?auto_21668 ) ) ( not ( = ?auto_21662 ?auto_21682 ) ) ( not ( = ?auto_21663 ?auto_21668 ) ) ( not ( = ?auto_21663 ?auto_21682 ) ) ( not ( = ?auto_21664 ?auto_21668 ) ) ( not ( = ?auto_21664 ?auto_21682 ) ) ( not ( = ?auto_21665 ?auto_21668 ) ) ( not ( = ?auto_21665 ?auto_21682 ) ) ( not ( = ?auto_21666 ?auto_21668 ) ) ( not ( = ?auto_21666 ?auto_21682 ) ) ( not ( = ?auto_21668 ?auto_21688 ) ) ( not ( = ?auto_21668 ?auto_21686 ) ) ( not ( = ?auto_21668 ?auto_21680 ) ) ( not ( = ?auto_21668 ?auto_21692 ) ) ( not ( = ?auto_21668 ?auto_21693 ) ) ( not ( = ?auto_21668 ?auto_21681 ) ) ( not ( = ?auto_21678 ?auto_21687 ) ) ( not ( = ?auto_21678 ?auto_21691 ) ) ( not ( = ?auto_21678 ?auto_21683 ) ) ( not ( = ?auto_21678 ?auto_21694 ) ) ( not ( = ?auto_21678 ?auto_21684 ) ) ( not ( = ?auto_21678 ?auto_21672 ) ) ( not ( = ?auto_21695 ?auto_21677 ) ) ( not ( = ?auto_21695 ?auto_21690 ) ) ( not ( = ?auto_21695 ?auto_21698 ) ) ( not ( = ?auto_21695 ?auto_21689 ) ) ( not ( = ?auto_21695 ?auto_21679 ) ) ( not ( = ?auto_21695 ?auto_21675 ) ) ( not ( = ?auto_21682 ?auto_21688 ) ) ( not ( = ?auto_21682 ?auto_21686 ) ) ( not ( = ?auto_21682 ?auto_21680 ) ) ( not ( = ?auto_21682 ?auto_21692 ) ) ( not ( = ?auto_21682 ?auto_21693 ) ) ( not ( = ?auto_21682 ?auto_21681 ) ) ( not ( = ?auto_21661 ?auto_21669 ) ) ( not ( = ?auto_21661 ?auto_21697 ) ) ( not ( = ?auto_21662 ?auto_21669 ) ) ( not ( = ?auto_21662 ?auto_21697 ) ) ( not ( = ?auto_21663 ?auto_21669 ) ) ( not ( = ?auto_21663 ?auto_21697 ) ) ( not ( = ?auto_21664 ?auto_21669 ) ) ( not ( = ?auto_21664 ?auto_21697 ) ) ( not ( = ?auto_21665 ?auto_21669 ) ) ( not ( = ?auto_21665 ?auto_21697 ) ) ( not ( = ?auto_21666 ?auto_21669 ) ) ( not ( = ?auto_21666 ?auto_21697 ) ) ( not ( = ?auto_21667 ?auto_21669 ) ) ( not ( = ?auto_21667 ?auto_21697 ) ) ( not ( = ?auto_21669 ?auto_21682 ) ) ( not ( = ?auto_21669 ?auto_21688 ) ) ( not ( = ?auto_21669 ?auto_21686 ) ) ( not ( = ?auto_21669 ?auto_21680 ) ) ( not ( = ?auto_21669 ?auto_21692 ) ) ( not ( = ?auto_21669 ?auto_21693 ) ) ( not ( = ?auto_21669 ?auto_21681 ) ) ( not ( = ?auto_21685 ?auto_21678 ) ) ( not ( = ?auto_21685 ?auto_21687 ) ) ( not ( = ?auto_21685 ?auto_21691 ) ) ( not ( = ?auto_21685 ?auto_21683 ) ) ( not ( = ?auto_21685 ?auto_21694 ) ) ( not ( = ?auto_21685 ?auto_21684 ) ) ( not ( = ?auto_21685 ?auto_21672 ) ) ( not ( = ?auto_21696 ?auto_21695 ) ) ( not ( = ?auto_21696 ?auto_21677 ) ) ( not ( = ?auto_21696 ?auto_21690 ) ) ( not ( = ?auto_21696 ?auto_21698 ) ) ( not ( = ?auto_21696 ?auto_21689 ) ) ( not ( = ?auto_21696 ?auto_21679 ) ) ( not ( = ?auto_21696 ?auto_21675 ) ) ( not ( = ?auto_21697 ?auto_21682 ) ) ( not ( = ?auto_21697 ?auto_21688 ) ) ( not ( = ?auto_21697 ?auto_21686 ) ) ( not ( = ?auto_21697 ?auto_21680 ) ) ( not ( = ?auto_21697 ?auto_21692 ) ) ( not ( = ?auto_21697 ?auto_21693 ) ) ( not ( = ?auto_21697 ?auto_21681 ) ) ( not ( = ?auto_21661 ?auto_21670 ) ) ( not ( = ?auto_21661 ?auto_21671 ) ) ( not ( = ?auto_21662 ?auto_21670 ) ) ( not ( = ?auto_21662 ?auto_21671 ) ) ( not ( = ?auto_21663 ?auto_21670 ) ) ( not ( = ?auto_21663 ?auto_21671 ) ) ( not ( = ?auto_21664 ?auto_21670 ) ) ( not ( = ?auto_21664 ?auto_21671 ) ) ( not ( = ?auto_21665 ?auto_21670 ) ) ( not ( = ?auto_21665 ?auto_21671 ) ) ( not ( = ?auto_21666 ?auto_21670 ) ) ( not ( = ?auto_21666 ?auto_21671 ) ) ( not ( = ?auto_21667 ?auto_21670 ) ) ( not ( = ?auto_21667 ?auto_21671 ) ) ( not ( = ?auto_21668 ?auto_21670 ) ) ( not ( = ?auto_21668 ?auto_21671 ) ) ( not ( = ?auto_21670 ?auto_21697 ) ) ( not ( = ?auto_21670 ?auto_21682 ) ) ( not ( = ?auto_21670 ?auto_21688 ) ) ( not ( = ?auto_21670 ?auto_21686 ) ) ( not ( = ?auto_21670 ?auto_21680 ) ) ( not ( = ?auto_21670 ?auto_21692 ) ) ( not ( = ?auto_21670 ?auto_21693 ) ) ( not ( = ?auto_21670 ?auto_21681 ) ) ( not ( = ?auto_21671 ?auto_21697 ) ) ( not ( = ?auto_21671 ?auto_21682 ) ) ( not ( = ?auto_21671 ?auto_21688 ) ) ( not ( = ?auto_21671 ?auto_21686 ) ) ( not ( = ?auto_21671 ?auto_21680 ) ) ( not ( = ?auto_21671 ?auto_21692 ) ) ( not ( = ?auto_21671 ?auto_21693 ) ) ( not ( = ?auto_21671 ?auto_21681 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_21661 ?auto_21662 ?auto_21663 ?auto_21664 ?auto_21665 ?auto_21666 ?auto_21667 ?auto_21668 ?auto_21669 )
      ( MAKE-1CRATE ?auto_21669 ?auto_21670 )
      ( MAKE-9CRATE-VERIFY ?auto_21661 ?auto_21662 ?auto_21663 ?auto_21664 ?auto_21665 ?auto_21666 ?auto_21667 ?auto_21668 ?auto_21669 ?auto_21670 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_21720 - SURFACE
      ?auto_21721 - SURFACE
      ?auto_21722 - SURFACE
      ?auto_21723 - SURFACE
      ?auto_21724 - SURFACE
      ?auto_21725 - SURFACE
      ?auto_21726 - SURFACE
      ?auto_21727 - SURFACE
      ?auto_21728 - SURFACE
      ?auto_21729 - SURFACE
      ?auto_21730 - SURFACE
    )
    :vars
    (
      ?auto_21736 - HOIST
      ?auto_21731 - PLACE
      ?auto_21734 - PLACE
      ?auto_21735 - HOIST
      ?auto_21732 - SURFACE
      ?auto_21737 - PLACE
      ?auto_21746 - HOIST
      ?auto_21757 - SURFACE
      ?auto_21750 - PLACE
      ?auto_21739 - HOIST
      ?auto_21738 - SURFACE
      ?auto_21751 - PLACE
      ?auto_21756 - HOIST
      ?auto_21743 - SURFACE
      ?auto_21754 - PLACE
      ?auto_21749 - HOIST
      ?auto_21745 - SURFACE
      ?auto_21752 - PLACE
      ?auto_21747 - HOIST
      ?auto_21759 - SURFACE
      ?auto_21742 - PLACE
      ?auto_21758 - HOIST
      ?auto_21740 - SURFACE
      ?auto_21748 - SURFACE
      ?auto_21741 - PLACE
      ?auto_21755 - HOIST
      ?auto_21753 - SURFACE
      ?auto_21744 - SURFACE
      ?auto_21733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21736 ?auto_21731 ) ( IS-CRATE ?auto_21730 ) ( not ( = ?auto_21734 ?auto_21731 ) ) ( HOIST-AT ?auto_21735 ?auto_21734 ) ( SURFACE-AT ?auto_21730 ?auto_21734 ) ( ON ?auto_21730 ?auto_21732 ) ( CLEAR ?auto_21730 ) ( not ( = ?auto_21729 ?auto_21730 ) ) ( not ( = ?auto_21729 ?auto_21732 ) ) ( not ( = ?auto_21730 ?auto_21732 ) ) ( not ( = ?auto_21736 ?auto_21735 ) ) ( IS-CRATE ?auto_21729 ) ( not ( = ?auto_21737 ?auto_21731 ) ) ( HOIST-AT ?auto_21746 ?auto_21737 ) ( SURFACE-AT ?auto_21729 ?auto_21737 ) ( ON ?auto_21729 ?auto_21757 ) ( CLEAR ?auto_21729 ) ( not ( = ?auto_21728 ?auto_21729 ) ) ( not ( = ?auto_21728 ?auto_21757 ) ) ( not ( = ?auto_21729 ?auto_21757 ) ) ( not ( = ?auto_21736 ?auto_21746 ) ) ( IS-CRATE ?auto_21728 ) ( not ( = ?auto_21750 ?auto_21731 ) ) ( HOIST-AT ?auto_21739 ?auto_21750 ) ( AVAILABLE ?auto_21739 ) ( SURFACE-AT ?auto_21728 ?auto_21750 ) ( ON ?auto_21728 ?auto_21738 ) ( CLEAR ?auto_21728 ) ( not ( = ?auto_21727 ?auto_21728 ) ) ( not ( = ?auto_21727 ?auto_21738 ) ) ( not ( = ?auto_21728 ?auto_21738 ) ) ( not ( = ?auto_21736 ?auto_21739 ) ) ( IS-CRATE ?auto_21727 ) ( not ( = ?auto_21751 ?auto_21731 ) ) ( HOIST-AT ?auto_21756 ?auto_21751 ) ( AVAILABLE ?auto_21756 ) ( SURFACE-AT ?auto_21727 ?auto_21751 ) ( ON ?auto_21727 ?auto_21743 ) ( CLEAR ?auto_21727 ) ( not ( = ?auto_21726 ?auto_21727 ) ) ( not ( = ?auto_21726 ?auto_21743 ) ) ( not ( = ?auto_21727 ?auto_21743 ) ) ( not ( = ?auto_21736 ?auto_21756 ) ) ( IS-CRATE ?auto_21726 ) ( not ( = ?auto_21754 ?auto_21731 ) ) ( HOIST-AT ?auto_21749 ?auto_21754 ) ( AVAILABLE ?auto_21749 ) ( SURFACE-AT ?auto_21726 ?auto_21754 ) ( ON ?auto_21726 ?auto_21745 ) ( CLEAR ?auto_21726 ) ( not ( = ?auto_21725 ?auto_21726 ) ) ( not ( = ?auto_21725 ?auto_21745 ) ) ( not ( = ?auto_21726 ?auto_21745 ) ) ( not ( = ?auto_21736 ?auto_21749 ) ) ( IS-CRATE ?auto_21725 ) ( not ( = ?auto_21752 ?auto_21731 ) ) ( HOIST-AT ?auto_21747 ?auto_21752 ) ( AVAILABLE ?auto_21747 ) ( SURFACE-AT ?auto_21725 ?auto_21752 ) ( ON ?auto_21725 ?auto_21759 ) ( CLEAR ?auto_21725 ) ( not ( = ?auto_21724 ?auto_21725 ) ) ( not ( = ?auto_21724 ?auto_21759 ) ) ( not ( = ?auto_21725 ?auto_21759 ) ) ( not ( = ?auto_21736 ?auto_21747 ) ) ( IS-CRATE ?auto_21724 ) ( not ( = ?auto_21742 ?auto_21731 ) ) ( HOIST-AT ?auto_21758 ?auto_21742 ) ( AVAILABLE ?auto_21758 ) ( SURFACE-AT ?auto_21724 ?auto_21742 ) ( ON ?auto_21724 ?auto_21740 ) ( CLEAR ?auto_21724 ) ( not ( = ?auto_21723 ?auto_21724 ) ) ( not ( = ?auto_21723 ?auto_21740 ) ) ( not ( = ?auto_21724 ?auto_21740 ) ) ( not ( = ?auto_21736 ?auto_21758 ) ) ( IS-CRATE ?auto_21723 ) ( AVAILABLE ?auto_21735 ) ( SURFACE-AT ?auto_21723 ?auto_21734 ) ( ON ?auto_21723 ?auto_21748 ) ( CLEAR ?auto_21723 ) ( not ( = ?auto_21722 ?auto_21723 ) ) ( not ( = ?auto_21722 ?auto_21748 ) ) ( not ( = ?auto_21723 ?auto_21748 ) ) ( IS-CRATE ?auto_21722 ) ( not ( = ?auto_21741 ?auto_21731 ) ) ( HOIST-AT ?auto_21755 ?auto_21741 ) ( AVAILABLE ?auto_21755 ) ( SURFACE-AT ?auto_21722 ?auto_21741 ) ( ON ?auto_21722 ?auto_21753 ) ( CLEAR ?auto_21722 ) ( not ( = ?auto_21721 ?auto_21722 ) ) ( not ( = ?auto_21721 ?auto_21753 ) ) ( not ( = ?auto_21722 ?auto_21753 ) ) ( not ( = ?auto_21736 ?auto_21755 ) ) ( SURFACE-AT ?auto_21720 ?auto_21731 ) ( CLEAR ?auto_21720 ) ( IS-CRATE ?auto_21721 ) ( AVAILABLE ?auto_21736 ) ( AVAILABLE ?auto_21746 ) ( SURFACE-AT ?auto_21721 ?auto_21737 ) ( ON ?auto_21721 ?auto_21744 ) ( CLEAR ?auto_21721 ) ( TRUCK-AT ?auto_21733 ?auto_21731 ) ( not ( = ?auto_21720 ?auto_21721 ) ) ( not ( = ?auto_21720 ?auto_21744 ) ) ( not ( = ?auto_21721 ?auto_21744 ) ) ( not ( = ?auto_21720 ?auto_21722 ) ) ( not ( = ?auto_21720 ?auto_21753 ) ) ( not ( = ?auto_21722 ?auto_21744 ) ) ( not ( = ?auto_21741 ?auto_21737 ) ) ( not ( = ?auto_21755 ?auto_21746 ) ) ( not ( = ?auto_21753 ?auto_21744 ) ) ( not ( = ?auto_21720 ?auto_21723 ) ) ( not ( = ?auto_21720 ?auto_21748 ) ) ( not ( = ?auto_21721 ?auto_21723 ) ) ( not ( = ?auto_21721 ?auto_21748 ) ) ( not ( = ?auto_21723 ?auto_21753 ) ) ( not ( = ?auto_21723 ?auto_21744 ) ) ( not ( = ?auto_21734 ?auto_21741 ) ) ( not ( = ?auto_21734 ?auto_21737 ) ) ( not ( = ?auto_21735 ?auto_21755 ) ) ( not ( = ?auto_21735 ?auto_21746 ) ) ( not ( = ?auto_21748 ?auto_21753 ) ) ( not ( = ?auto_21748 ?auto_21744 ) ) ( not ( = ?auto_21720 ?auto_21724 ) ) ( not ( = ?auto_21720 ?auto_21740 ) ) ( not ( = ?auto_21721 ?auto_21724 ) ) ( not ( = ?auto_21721 ?auto_21740 ) ) ( not ( = ?auto_21722 ?auto_21724 ) ) ( not ( = ?auto_21722 ?auto_21740 ) ) ( not ( = ?auto_21724 ?auto_21748 ) ) ( not ( = ?auto_21724 ?auto_21753 ) ) ( not ( = ?auto_21724 ?auto_21744 ) ) ( not ( = ?auto_21742 ?auto_21734 ) ) ( not ( = ?auto_21742 ?auto_21741 ) ) ( not ( = ?auto_21742 ?auto_21737 ) ) ( not ( = ?auto_21758 ?auto_21735 ) ) ( not ( = ?auto_21758 ?auto_21755 ) ) ( not ( = ?auto_21758 ?auto_21746 ) ) ( not ( = ?auto_21740 ?auto_21748 ) ) ( not ( = ?auto_21740 ?auto_21753 ) ) ( not ( = ?auto_21740 ?auto_21744 ) ) ( not ( = ?auto_21720 ?auto_21725 ) ) ( not ( = ?auto_21720 ?auto_21759 ) ) ( not ( = ?auto_21721 ?auto_21725 ) ) ( not ( = ?auto_21721 ?auto_21759 ) ) ( not ( = ?auto_21722 ?auto_21725 ) ) ( not ( = ?auto_21722 ?auto_21759 ) ) ( not ( = ?auto_21723 ?auto_21725 ) ) ( not ( = ?auto_21723 ?auto_21759 ) ) ( not ( = ?auto_21725 ?auto_21740 ) ) ( not ( = ?auto_21725 ?auto_21748 ) ) ( not ( = ?auto_21725 ?auto_21753 ) ) ( not ( = ?auto_21725 ?auto_21744 ) ) ( not ( = ?auto_21752 ?auto_21742 ) ) ( not ( = ?auto_21752 ?auto_21734 ) ) ( not ( = ?auto_21752 ?auto_21741 ) ) ( not ( = ?auto_21752 ?auto_21737 ) ) ( not ( = ?auto_21747 ?auto_21758 ) ) ( not ( = ?auto_21747 ?auto_21735 ) ) ( not ( = ?auto_21747 ?auto_21755 ) ) ( not ( = ?auto_21747 ?auto_21746 ) ) ( not ( = ?auto_21759 ?auto_21740 ) ) ( not ( = ?auto_21759 ?auto_21748 ) ) ( not ( = ?auto_21759 ?auto_21753 ) ) ( not ( = ?auto_21759 ?auto_21744 ) ) ( not ( = ?auto_21720 ?auto_21726 ) ) ( not ( = ?auto_21720 ?auto_21745 ) ) ( not ( = ?auto_21721 ?auto_21726 ) ) ( not ( = ?auto_21721 ?auto_21745 ) ) ( not ( = ?auto_21722 ?auto_21726 ) ) ( not ( = ?auto_21722 ?auto_21745 ) ) ( not ( = ?auto_21723 ?auto_21726 ) ) ( not ( = ?auto_21723 ?auto_21745 ) ) ( not ( = ?auto_21724 ?auto_21726 ) ) ( not ( = ?auto_21724 ?auto_21745 ) ) ( not ( = ?auto_21726 ?auto_21759 ) ) ( not ( = ?auto_21726 ?auto_21740 ) ) ( not ( = ?auto_21726 ?auto_21748 ) ) ( not ( = ?auto_21726 ?auto_21753 ) ) ( not ( = ?auto_21726 ?auto_21744 ) ) ( not ( = ?auto_21754 ?auto_21752 ) ) ( not ( = ?auto_21754 ?auto_21742 ) ) ( not ( = ?auto_21754 ?auto_21734 ) ) ( not ( = ?auto_21754 ?auto_21741 ) ) ( not ( = ?auto_21754 ?auto_21737 ) ) ( not ( = ?auto_21749 ?auto_21747 ) ) ( not ( = ?auto_21749 ?auto_21758 ) ) ( not ( = ?auto_21749 ?auto_21735 ) ) ( not ( = ?auto_21749 ?auto_21755 ) ) ( not ( = ?auto_21749 ?auto_21746 ) ) ( not ( = ?auto_21745 ?auto_21759 ) ) ( not ( = ?auto_21745 ?auto_21740 ) ) ( not ( = ?auto_21745 ?auto_21748 ) ) ( not ( = ?auto_21745 ?auto_21753 ) ) ( not ( = ?auto_21745 ?auto_21744 ) ) ( not ( = ?auto_21720 ?auto_21727 ) ) ( not ( = ?auto_21720 ?auto_21743 ) ) ( not ( = ?auto_21721 ?auto_21727 ) ) ( not ( = ?auto_21721 ?auto_21743 ) ) ( not ( = ?auto_21722 ?auto_21727 ) ) ( not ( = ?auto_21722 ?auto_21743 ) ) ( not ( = ?auto_21723 ?auto_21727 ) ) ( not ( = ?auto_21723 ?auto_21743 ) ) ( not ( = ?auto_21724 ?auto_21727 ) ) ( not ( = ?auto_21724 ?auto_21743 ) ) ( not ( = ?auto_21725 ?auto_21727 ) ) ( not ( = ?auto_21725 ?auto_21743 ) ) ( not ( = ?auto_21727 ?auto_21745 ) ) ( not ( = ?auto_21727 ?auto_21759 ) ) ( not ( = ?auto_21727 ?auto_21740 ) ) ( not ( = ?auto_21727 ?auto_21748 ) ) ( not ( = ?auto_21727 ?auto_21753 ) ) ( not ( = ?auto_21727 ?auto_21744 ) ) ( not ( = ?auto_21751 ?auto_21754 ) ) ( not ( = ?auto_21751 ?auto_21752 ) ) ( not ( = ?auto_21751 ?auto_21742 ) ) ( not ( = ?auto_21751 ?auto_21734 ) ) ( not ( = ?auto_21751 ?auto_21741 ) ) ( not ( = ?auto_21751 ?auto_21737 ) ) ( not ( = ?auto_21756 ?auto_21749 ) ) ( not ( = ?auto_21756 ?auto_21747 ) ) ( not ( = ?auto_21756 ?auto_21758 ) ) ( not ( = ?auto_21756 ?auto_21735 ) ) ( not ( = ?auto_21756 ?auto_21755 ) ) ( not ( = ?auto_21756 ?auto_21746 ) ) ( not ( = ?auto_21743 ?auto_21745 ) ) ( not ( = ?auto_21743 ?auto_21759 ) ) ( not ( = ?auto_21743 ?auto_21740 ) ) ( not ( = ?auto_21743 ?auto_21748 ) ) ( not ( = ?auto_21743 ?auto_21753 ) ) ( not ( = ?auto_21743 ?auto_21744 ) ) ( not ( = ?auto_21720 ?auto_21728 ) ) ( not ( = ?auto_21720 ?auto_21738 ) ) ( not ( = ?auto_21721 ?auto_21728 ) ) ( not ( = ?auto_21721 ?auto_21738 ) ) ( not ( = ?auto_21722 ?auto_21728 ) ) ( not ( = ?auto_21722 ?auto_21738 ) ) ( not ( = ?auto_21723 ?auto_21728 ) ) ( not ( = ?auto_21723 ?auto_21738 ) ) ( not ( = ?auto_21724 ?auto_21728 ) ) ( not ( = ?auto_21724 ?auto_21738 ) ) ( not ( = ?auto_21725 ?auto_21728 ) ) ( not ( = ?auto_21725 ?auto_21738 ) ) ( not ( = ?auto_21726 ?auto_21728 ) ) ( not ( = ?auto_21726 ?auto_21738 ) ) ( not ( = ?auto_21728 ?auto_21743 ) ) ( not ( = ?auto_21728 ?auto_21745 ) ) ( not ( = ?auto_21728 ?auto_21759 ) ) ( not ( = ?auto_21728 ?auto_21740 ) ) ( not ( = ?auto_21728 ?auto_21748 ) ) ( not ( = ?auto_21728 ?auto_21753 ) ) ( not ( = ?auto_21728 ?auto_21744 ) ) ( not ( = ?auto_21750 ?auto_21751 ) ) ( not ( = ?auto_21750 ?auto_21754 ) ) ( not ( = ?auto_21750 ?auto_21752 ) ) ( not ( = ?auto_21750 ?auto_21742 ) ) ( not ( = ?auto_21750 ?auto_21734 ) ) ( not ( = ?auto_21750 ?auto_21741 ) ) ( not ( = ?auto_21750 ?auto_21737 ) ) ( not ( = ?auto_21739 ?auto_21756 ) ) ( not ( = ?auto_21739 ?auto_21749 ) ) ( not ( = ?auto_21739 ?auto_21747 ) ) ( not ( = ?auto_21739 ?auto_21758 ) ) ( not ( = ?auto_21739 ?auto_21735 ) ) ( not ( = ?auto_21739 ?auto_21755 ) ) ( not ( = ?auto_21739 ?auto_21746 ) ) ( not ( = ?auto_21738 ?auto_21743 ) ) ( not ( = ?auto_21738 ?auto_21745 ) ) ( not ( = ?auto_21738 ?auto_21759 ) ) ( not ( = ?auto_21738 ?auto_21740 ) ) ( not ( = ?auto_21738 ?auto_21748 ) ) ( not ( = ?auto_21738 ?auto_21753 ) ) ( not ( = ?auto_21738 ?auto_21744 ) ) ( not ( = ?auto_21720 ?auto_21729 ) ) ( not ( = ?auto_21720 ?auto_21757 ) ) ( not ( = ?auto_21721 ?auto_21729 ) ) ( not ( = ?auto_21721 ?auto_21757 ) ) ( not ( = ?auto_21722 ?auto_21729 ) ) ( not ( = ?auto_21722 ?auto_21757 ) ) ( not ( = ?auto_21723 ?auto_21729 ) ) ( not ( = ?auto_21723 ?auto_21757 ) ) ( not ( = ?auto_21724 ?auto_21729 ) ) ( not ( = ?auto_21724 ?auto_21757 ) ) ( not ( = ?auto_21725 ?auto_21729 ) ) ( not ( = ?auto_21725 ?auto_21757 ) ) ( not ( = ?auto_21726 ?auto_21729 ) ) ( not ( = ?auto_21726 ?auto_21757 ) ) ( not ( = ?auto_21727 ?auto_21729 ) ) ( not ( = ?auto_21727 ?auto_21757 ) ) ( not ( = ?auto_21729 ?auto_21738 ) ) ( not ( = ?auto_21729 ?auto_21743 ) ) ( not ( = ?auto_21729 ?auto_21745 ) ) ( not ( = ?auto_21729 ?auto_21759 ) ) ( not ( = ?auto_21729 ?auto_21740 ) ) ( not ( = ?auto_21729 ?auto_21748 ) ) ( not ( = ?auto_21729 ?auto_21753 ) ) ( not ( = ?auto_21729 ?auto_21744 ) ) ( not ( = ?auto_21757 ?auto_21738 ) ) ( not ( = ?auto_21757 ?auto_21743 ) ) ( not ( = ?auto_21757 ?auto_21745 ) ) ( not ( = ?auto_21757 ?auto_21759 ) ) ( not ( = ?auto_21757 ?auto_21740 ) ) ( not ( = ?auto_21757 ?auto_21748 ) ) ( not ( = ?auto_21757 ?auto_21753 ) ) ( not ( = ?auto_21757 ?auto_21744 ) ) ( not ( = ?auto_21720 ?auto_21730 ) ) ( not ( = ?auto_21720 ?auto_21732 ) ) ( not ( = ?auto_21721 ?auto_21730 ) ) ( not ( = ?auto_21721 ?auto_21732 ) ) ( not ( = ?auto_21722 ?auto_21730 ) ) ( not ( = ?auto_21722 ?auto_21732 ) ) ( not ( = ?auto_21723 ?auto_21730 ) ) ( not ( = ?auto_21723 ?auto_21732 ) ) ( not ( = ?auto_21724 ?auto_21730 ) ) ( not ( = ?auto_21724 ?auto_21732 ) ) ( not ( = ?auto_21725 ?auto_21730 ) ) ( not ( = ?auto_21725 ?auto_21732 ) ) ( not ( = ?auto_21726 ?auto_21730 ) ) ( not ( = ?auto_21726 ?auto_21732 ) ) ( not ( = ?auto_21727 ?auto_21730 ) ) ( not ( = ?auto_21727 ?auto_21732 ) ) ( not ( = ?auto_21728 ?auto_21730 ) ) ( not ( = ?auto_21728 ?auto_21732 ) ) ( not ( = ?auto_21730 ?auto_21757 ) ) ( not ( = ?auto_21730 ?auto_21738 ) ) ( not ( = ?auto_21730 ?auto_21743 ) ) ( not ( = ?auto_21730 ?auto_21745 ) ) ( not ( = ?auto_21730 ?auto_21759 ) ) ( not ( = ?auto_21730 ?auto_21740 ) ) ( not ( = ?auto_21730 ?auto_21748 ) ) ( not ( = ?auto_21730 ?auto_21753 ) ) ( not ( = ?auto_21730 ?auto_21744 ) ) ( not ( = ?auto_21732 ?auto_21757 ) ) ( not ( = ?auto_21732 ?auto_21738 ) ) ( not ( = ?auto_21732 ?auto_21743 ) ) ( not ( = ?auto_21732 ?auto_21745 ) ) ( not ( = ?auto_21732 ?auto_21759 ) ) ( not ( = ?auto_21732 ?auto_21740 ) ) ( not ( = ?auto_21732 ?auto_21748 ) ) ( not ( = ?auto_21732 ?auto_21753 ) ) ( not ( = ?auto_21732 ?auto_21744 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_21720 ?auto_21721 ?auto_21722 ?auto_21723 ?auto_21724 ?auto_21725 ?auto_21726 ?auto_21727 ?auto_21728 ?auto_21729 )
      ( MAKE-1CRATE ?auto_21729 ?auto_21730 )
      ( MAKE-10CRATE-VERIFY ?auto_21720 ?auto_21721 ?auto_21722 ?auto_21723 ?auto_21724 ?auto_21725 ?auto_21726 ?auto_21727 ?auto_21728 ?auto_21729 ?auto_21730 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_21782 - SURFACE
      ?auto_21783 - SURFACE
      ?auto_21784 - SURFACE
      ?auto_21785 - SURFACE
      ?auto_21786 - SURFACE
      ?auto_21787 - SURFACE
      ?auto_21788 - SURFACE
      ?auto_21789 - SURFACE
      ?auto_21790 - SURFACE
      ?auto_21791 - SURFACE
      ?auto_21792 - SURFACE
      ?auto_21793 - SURFACE
    )
    :vars
    (
      ?auto_21799 - HOIST
      ?auto_21794 - PLACE
      ?auto_21795 - PLACE
      ?auto_21797 - HOIST
      ?auto_21798 - SURFACE
      ?auto_21822 - PLACE
      ?auto_21806 - HOIST
      ?auto_21817 - SURFACE
      ?auto_21812 - PLACE
      ?auto_21809 - HOIST
      ?auto_21803 - SURFACE
      ?auto_21810 - PLACE
      ?auto_21813 - HOIST
      ?auto_21804 - SURFACE
      ?auto_21823 - PLACE
      ?auto_21820 - HOIST
      ?auto_21818 - SURFACE
      ?auto_21800 - PLACE
      ?auto_21816 - HOIST
      ?auto_21821 - SURFACE
      ?auto_21805 - PLACE
      ?auto_21815 - HOIST
      ?auto_21801 - SURFACE
      ?auto_21811 - PLACE
      ?auto_21819 - HOIST
      ?auto_21807 - SURFACE
      ?auto_21814 - SURFACE
      ?auto_21808 - SURFACE
      ?auto_21802 - SURFACE
      ?auto_21796 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21799 ?auto_21794 ) ( IS-CRATE ?auto_21793 ) ( not ( = ?auto_21795 ?auto_21794 ) ) ( HOIST-AT ?auto_21797 ?auto_21795 ) ( SURFACE-AT ?auto_21793 ?auto_21795 ) ( ON ?auto_21793 ?auto_21798 ) ( CLEAR ?auto_21793 ) ( not ( = ?auto_21792 ?auto_21793 ) ) ( not ( = ?auto_21792 ?auto_21798 ) ) ( not ( = ?auto_21793 ?auto_21798 ) ) ( not ( = ?auto_21799 ?auto_21797 ) ) ( IS-CRATE ?auto_21792 ) ( not ( = ?auto_21822 ?auto_21794 ) ) ( HOIST-AT ?auto_21806 ?auto_21822 ) ( SURFACE-AT ?auto_21792 ?auto_21822 ) ( ON ?auto_21792 ?auto_21817 ) ( CLEAR ?auto_21792 ) ( not ( = ?auto_21791 ?auto_21792 ) ) ( not ( = ?auto_21791 ?auto_21817 ) ) ( not ( = ?auto_21792 ?auto_21817 ) ) ( not ( = ?auto_21799 ?auto_21806 ) ) ( IS-CRATE ?auto_21791 ) ( not ( = ?auto_21812 ?auto_21794 ) ) ( HOIST-AT ?auto_21809 ?auto_21812 ) ( SURFACE-AT ?auto_21791 ?auto_21812 ) ( ON ?auto_21791 ?auto_21803 ) ( CLEAR ?auto_21791 ) ( not ( = ?auto_21790 ?auto_21791 ) ) ( not ( = ?auto_21790 ?auto_21803 ) ) ( not ( = ?auto_21791 ?auto_21803 ) ) ( not ( = ?auto_21799 ?auto_21809 ) ) ( IS-CRATE ?auto_21790 ) ( not ( = ?auto_21810 ?auto_21794 ) ) ( HOIST-AT ?auto_21813 ?auto_21810 ) ( AVAILABLE ?auto_21813 ) ( SURFACE-AT ?auto_21790 ?auto_21810 ) ( ON ?auto_21790 ?auto_21804 ) ( CLEAR ?auto_21790 ) ( not ( = ?auto_21789 ?auto_21790 ) ) ( not ( = ?auto_21789 ?auto_21804 ) ) ( not ( = ?auto_21790 ?auto_21804 ) ) ( not ( = ?auto_21799 ?auto_21813 ) ) ( IS-CRATE ?auto_21789 ) ( not ( = ?auto_21823 ?auto_21794 ) ) ( HOIST-AT ?auto_21820 ?auto_21823 ) ( AVAILABLE ?auto_21820 ) ( SURFACE-AT ?auto_21789 ?auto_21823 ) ( ON ?auto_21789 ?auto_21818 ) ( CLEAR ?auto_21789 ) ( not ( = ?auto_21788 ?auto_21789 ) ) ( not ( = ?auto_21788 ?auto_21818 ) ) ( not ( = ?auto_21789 ?auto_21818 ) ) ( not ( = ?auto_21799 ?auto_21820 ) ) ( IS-CRATE ?auto_21788 ) ( not ( = ?auto_21800 ?auto_21794 ) ) ( HOIST-AT ?auto_21816 ?auto_21800 ) ( AVAILABLE ?auto_21816 ) ( SURFACE-AT ?auto_21788 ?auto_21800 ) ( ON ?auto_21788 ?auto_21821 ) ( CLEAR ?auto_21788 ) ( not ( = ?auto_21787 ?auto_21788 ) ) ( not ( = ?auto_21787 ?auto_21821 ) ) ( not ( = ?auto_21788 ?auto_21821 ) ) ( not ( = ?auto_21799 ?auto_21816 ) ) ( IS-CRATE ?auto_21787 ) ( not ( = ?auto_21805 ?auto_21794 ) ) ( HOIST-AT ?auto_21815 ?auto_21805 ) ( AVAILABLE ?auto_21815 ) ( SURFACE-AT ?auto_21787 ?auto_21805 ) ( ON ?auto_21787 ?auto_21801 ) ( CLEAR ?auto_21787 ) ( not ( = ?auto_21786 ?auto_21787 ) ) ( not ( = ?auto_21786 ?auto_21801 ) ) ( not ( = ?auto_21787 ?auto_21801 ) ) ( not ( = ?auto_21799 ?auto_21815 ) ) ( IS-CRATE ?auto_21786 ) ( not ( = ?auto_21811 ?auto_21794 ) ) ( HOIST-AT ?auto_21819 ?auto_21811 ) ( AVAILABLE ?auto_21819 ) ( SURFACE-AT ?auto_21786 ?auto_21811 ) ( ON ?auto_21786 ?auto_21807 ) ( CLEAR ?auto_21786 ) ( not ( = ?auto_21785 ?auto_21786 ) ) ( not ( = ?auto_21785 ?auto_21807 ) ) ( not ( = ?auto_21786 ?auto_21807 ) ) ( not ( = ?auto_21799 ?auto_21819 ) ) ( IS-CRATE ?auto_21785 ) ( AVAILABLE ?auto_21806 ) ( SURFACE-AT ?auto_21785 ?auto_21822 ) ( ON ?auto_21785 ?auto_21814 ) ( CLEAR ?auto_21785 ) ( not ( = ?auto_21784 ?auto_21785 ) ) ( not ( = ?auto_21784 ?auto_21814 ) ) ( not ( = ?auto_21785 ?auto_21814 ) ) ( IS-CRATE ?auto_21784 ) ( AVAILABLE ?auto_21797 ) ( SURFACE-AT ?auto_21784 ?auto_21795 ) ( ON ?auto_21784 ?auto_21808 ) ( CLEAR ?auto_21784 ) ( not ( = ?auto_21783 ?auto_21784 ) ) ( not ( = ?auto_21783 ?auto_21808 ) ) ( not ( = ?auto_21784 ?auto_21808 ) ) ( SURFACE-AT ?auto_21782 ?auto_21794 ) ( CLEAR ?auto_21782 ) ( IS-CRATE ?auto_21783 ) ( AVAILABLE ?auto_21799 ) ( AVAILABLE ?auto_21809 ) ( SURFACE-AT ?auto_21783 ?auto_21812 ) ( ON ?auto_21783 ?auto_21802 ) ( CLEAR ?auto_21783 ) ( TRUCK-AT ?auto_21796 ?auto_21794 ) ( not ( = ?auto_21782 ?auto_21783 ) ) ( not ( = ?auto_21782 ?auto_21802 ) ) ( not ( = ?auto_21783 ?auto_21802 ) ) ( not ( = ?auto_21782 ?auto_21784 ) ) ( not ( = ?auto_21782 ?auto_21808 ) ) ( not ( = ?auto_21784 ?auto_21802 ) ) ( not ( = ?auto_21795 ?auto_21812 ) ) ( not ( = ?auto_21797 ?auto_21809 ) ) ( not ( = ?auto_21808 ?auto_21802 ) ) ( not ( = ?auto_21782 ?auto_21785 ) ) ( not ( = ?auto_21782 ?auto_21814 ) ) ( not ( = ?auto_21783 ?auto_21785 ) ) ( not ( = ?auto_21783 ?auto_21814 ) ) ( not ( = ?auto_21785 ?auto_21808 ) ) ( not ( = ?auto_21785 ?auto_21802 ) ) ( not ( = ?auto_21822 ?auto_21795 ) ) ( not ( = ?auto_21822 ?auto_21812 ) ) ( not ( = ?auto_21806 ?auto_21797 ) ) ( not ( = ?auto_21806 ?auto_21809 ) ) ( not ( = ?auto_21814 ?auto_21808 ) ) ( not ( = ?auto_21814 ?auto_21802 ) ) ( not ( = ?auto_21782 ?auto_21786 ) ) ( not ( = ?auto_21782 ?auto_21807 ) ) ( not ( = ?auto_21783 ?auto_21786 ) ) ( not ( = ?auto_21783 ?auto_21807 ) ) ( not ( = ?auto_21784 ?auto_21786 ) ) ( not ( = ?auto_21784 ?auto_21807 ) ) ( not ( = ?auto_21786 ?auto_21814 ) ) ( not ( = ?auto_21786 ?auto_21808 ) ) ( not ( = ?auto_21786 ?auto_21802 ) ) ( not ( = ?auto_21811 ?auto_21822 ) ) ( not ( = ?auto_21811 ?auto_21795 ) ) ( not ( = ?auto_21811 ?auto_21812 ) ) ( not ( = ?auto_21819 ?auto_21806 ) ) ( not ( = ?auto_21819 ?auto_21797 ) ) ( not ( = ?auto_21819 ?auto_21809 ) ) ( not ( = ?auto_21807 ?auto_21814 ) ) ( not ( = ?auto_21807 ?auto_21808 ) ) ( not ( = ?auto_21807 ?auto_21802 ) ) ( not ( = ?auto_21782 ?auto_21787 ) ) ( not ( = ?auto_21782 ?auto_21801 ) ) ( not ( = ?auto_21783 ?auto_21787 ) ) ( not ( = ?auto_21783 ?auto_21801 ) ) ( not ( = ?auto_21784 ?auto_21787 ) ) ( not ( = ?auto_21784 ?auto_21801 ) ) ( not ( = ?auto_21785 ?auto_21787 ) ) ( not ( = ?auto_21785 ?auto_21801 ) ) ( not ( = ?auto_21787 ?auto_21807 ) ) ( not ( = ?auto_21787 ?auto_21814 ) ) ( not ( = ?auto_21787 ?auto_21808 ) ) ( not ( = ?auto_21787 ?auto_21802 ) ) ( not ( = ?auto_21805 ?auto_21811 ) ) ( not ( = ?auto_21805 ?auto_21822 ) ) ( not ( = ?auto_21805 ?auto_21795 ) ) ( not ( = ?auto_21805 ?auto_21812 ) ) ( not ( = ?auto_21815 ?auto_21819 ) ) ( not ( = ?auto_21815 ?auto_21806 ) ) ( not ( = ?auto_21815 ?auto_21797 ) ) ( not ( = ?auto_21815 ?auto_21809 ) ) ( not ( = ?auto_21801 ?auto_21807 ) ) ( not ( = ?auto_21801 ?auto_21814 ) ) ( not ( = ?auto_21801 ?auto_21808 ) ) ( not ( = ?auto_21801 ?auto_21802 ) ) ( not ( = ?auto_21782 ?auto_21788 ) ) ( not ( = ?auto_21782 ?auto_21821 ) ) ( not ( = ?auto_21783 ?auto_21788 ) ) ( not ( = ?auto_21783 ?auto_21821 ) ) ( not ( = ?auto_21784 ?auto_21788 ) ) ( not ( = ?auto_21784 ?auto_21821 ) ) ( not ( = ?auto_21785 ?auto_21788 ) ) ( not ( = ?auto_21785 ?auto_21821 ) ) ( not ( = ?auto_21786 ?auto_21788 ) ) ( not ( = ?auto_21786 ?auto_21821 ) ) ( not ( = ?auto_21788 ?auto_21801 ) ) ( not ( = ?auto_21788 ?auto_21807 ) ) ( not ( = ?auto_21788 ?auto_21814 ) ) ( not ( = ?auto_21788 ?auto_21808 ) ) ( not ( = ?auto_21788 ?auto_21802 ) ) ( not ( = ?auto_21800 ?auto_21805 ) ) ( not ( = ?auto_21800 ?auto_21811 ) ) ( not ( = ?auto_21800 ?auto_21822 ) ) ( not ( = ?auto_21800 ?auto_21795 ) ) ( not ( = ?auto_21800 ?auto_21812 ) ) ( not ( = ?auto_21816 ?auto_21815 ) ) ( not ( = ?auto_21816 ?auto_21819 ) ) ( not ( = ?auto_21816 ?auto_21806 ) ) ( not ( = ?auto_21816 ?auto_21797 ) ) ( not ( = ?auto_21816 ?auto_21809 ) ) ( not ( = ?auto_21821 ?auto_21801 ) ) ( not ( = ?auto_21821 ?auto_21807 ) ) ( not ( = ?auto_21821 ?auto_21814 ) ) ( not ( = ?auto_21821 ?auto_21808 ) ) ( not ( = ?auto_21821 ?auto_21802 ) ) ( not ( = ?auto_21782 ?auto_21789 ) ) ( not ( = ?auto_21782 ?auto_21818 ) ) ( not ( = ?auto_21783 ?auto_21789 ) ) ( not ( = ?auto_21783 ?auto_21818 ) ) ( not ( = ?auto_21784 ?auto_21789 ) ) ( not ( = ?auto_21784 ?auto_21818 ) ) ( not ( = ?auto_21785 ?auto_21789 ) ) ( not ( = ?auto_21785 ?auto_21818 ) ) ( not ( = ?auto_21786 ?auto_21789 ) ) ( not ( = ?auto_21786 ?auto_21818 ) ) ( not ( = ?auto_21787 ?auto_21789 ) ) ( not ( = ?auto_21787 ?auto_21818 ) ) ( not ( = ?auto_21789 ?auto_21821 ) ) ( not ( = ?auto_21789 ?auto_21801 ) ) ( not ( = ?auto_21789 ?auto_21807 ) ) ( not ( = ?auto_21789 ?auto_21814 ) ) ( not ( = ?auto_21789 ?auto_21808 ) ) ( not ( = ?auto_21789 ?auto_21802 ) ) ( not ( = ?auto_21823 ?auto_21800 ) ) ( not ( = ?auto_21823 ?auto_21805 ) ) ( not ( = ?auto_21823 ?auto_21811 ) ) ( not ( = ?auto_21823 ?auto_21822 ) ) ( not ( = ?auto_21823 ?auto_21795 ) ) ( not ( = ?auto_21823 ?auto_21812 ) ) ( not ( = ?auto_21820 ?auto_21816 ) ) ( not ( = ?auto_21820 ?auto_21815 ) ) ( not ( = ?auto_21820 ?auto_21819 ) ) ( not ( = ?auto_21820 ?auto_21806 ) ) ( not ( = ?auto_21820 ?auto_21797 ) ) ( not ( = ?auto_21820 ?auto_21809 ) ) ( not ( = ?auto_21818 ?auto_21821 ) ) ( not ( = ?auto_21818 ?auto_21801 ) ) ( not ( = ?auto_21818 ?auto_21807 ) ) ( not ( = ?auto_21818 ?auto_21814 ) ) ( not ( = ?auto_21818 ?auto_21808 ) ) ( not ( = ?auto_21818 ?auto_21802 ) ) ( not ( = ?auto_21782 ?auto_21790 ) ) ( not ( = ?auto_21782 ?auto_21804 ) ) ( not ( = ?auto_21783 ?auto_21790 ) ) ( not ( = ?auto_21783 ?auto_21804 ) ) ( not ( = ?auto_21784 ?auto_21790 ) ) ( not ( = ?auto_21784 ?auto_21804 ) ) ( not ( = ?auto_21785 ?auto_21790 ) ) ( not ( = ?auto_21785 ?auto_21804 ) ) ( not ( = ?auto_21786 ?auto_21790 ) ) ( not ( = ?auto_21786 ?auto_21804 ) ) ( not ( = ?auto_21787 ?auto_21790 ) ) ( not ( = ?auto_21787 ?auto_21804 ) ) ( not ( = ?auto_21788 ?auto_21790 ) ) ( not ( = ?auto_21788 ?auto_21804 ) ) ( not ( = ?auto_21790 ?auto_21818 ) ) ( not ( = ?auto_21790 ?auto_21821 ) ) ( not ( = ?auto_21790 ?auto_21801 ) ) ( not ( = ?auto_21790 ?auto_21807 ) ) ( not ( = ?auto_21790 ?auto_21814 ) ) ( not ( = ?auto_21790 ?auto_21808 ) ) ( not ( = ?auto_21790 ?auto_21802 ) ) ( not ( = ?auto_21810 ?auto_21823 ) ) ( not ( = ?auto_21810 ?auto_21800 ) ) ( not ( = ?auto_21810 ?auto_21805 ) ) ( not ( = ?auto_21810 ?auto_21811 ) ) ( not ( = ?auto_21810 ?auto_21822 ) ) ( not ( = ?auto_21810 ?auto_21795 ) ) ( not ( = ?auto_21810 ?auto_21812 ) ) ( not ( = ?auto_21813 ?auto_21820 ) ) ( not ( = ?auto_21813 ?auto_21816 ) ) ( not ( = ?auto_21813 ?auto_21815 ) ) ( not ( = ?auto_21813 ?auto_21819 ) ) ( not ( = ?auto_21813 ?auto_21806 ) ) ( not ( = ?auto_21813 ?auto_21797 ) ) ( not ( = ?auto_21813 ?auto_21809 ) ) ( not ( = ?auto_21804 ?auto_21818 ) ) ( not ( = ?auto_21804 ?auto_21821 ) ) ( not ( = ?auto_21804 ?auto_21801 ) ) ( not ( = ?auto_21804 ?auto_21807 ) ) ( not ( = ?auto_21804 ?auto_21814 ) ) ( not ( = ?auto_21804 ?auto_21808 ) ) ( not ( = ?auto_21804 ?auto_21802 ) ) ( not ( = ?auto_21782 ?auto_21791 ) ) ( not ( = ?auto_21782 ?auto_21803 ) ) ( not ( = ?auto_21783 ?auto_21791 ) ) ( not ( = ?auto_21783 ?auto_21803 ) ) ( not ( = ?auto_21784 ?auto_21791 ) ) ( not ( = ?auto_21784 ?auto_21803 ) ) ( not ( = ?auto_21785 ?auto_21791 ) ) ( not ( = ?auto_21785 ?auto_21803 ) ) ( not ( = ?auto_21786 ?auto_21791 ) ) ( not ( = ?auto_21786 ?auto_21803 ) ) ( not ( = ?auto_21787 ?auto_21791 ) ) ( not ( = ?auto_21787 ?auto_21803 ) ) ( not ( = ?auto_21788 ?auto_21791 ) ) ( not ( = ?auto_21788 ?auto_21803 ) ) ( not ( = ?auto_21789 ?auto_21791 ) ) ( not ( = ?auto_21789 ?auto_21803 ) ) ( not ( = ?auto_21791 ?auto_21804 ) ) ( not ( = ?auto_21791 ?auto_21818 ) ) ( not ( = ?auto_21791 ?auto_21821 ) ) ( not ( = ?auto_21791 ?auto_21801 ) ) ( not ( = ?auto_21791 ?auto_21807 ) ) ( not ( = ?auto_21791 ?auto_21814 ) ) ( not ( = ?auto_21791 ?auto_21808 ) ) ( not ( = ?auto_21791 ?auto_21802 ) ) ( not ( = ?auto_21803 ?auto_21804 ) ) ( not ( = ?auto_21803 ?auto_21818 ) ) ( not ( = ?auto_21803 ?auto_21821 ) ) ( not ( = ?auto_21803 ?auto_21801 ) ) ( not ( = ?auto_21803 ?auto_21807 ) ) ( not ( = ?auto_21803 ?auto_21814 ) ) ( not ( = ?auto_21803 ?auto_21808 ) ) ( not ( = ?auto_21803 ?auto_21802 ) ) ( not ( = ?auto_21782 ?auto_21792 ) ) ( not ( = ?auto_21782 ?auto_21817 ) ) ( not ( = ?auto_21783 ?auto_21792 ) ) ( not ( = ?auto_21783 ?auto_21817 ) ) ( not ( = ?auto_21784 ?auto_21792 ) ) ( not ( = ?auto_21784 ?auto_21817 ) ) ( not ( = ?auto_21785 ?auto_21792 ) ) ( not ( = ?auto_21785 ?auto_21817 ) ) ( not ( = ?auto_21786 ?auto_21792 ) ) ( not ( = ?auto_21786 ?auto_21817 ) ) ( not ( = ?auto_21787 ?auto_21792 ) ) ( not ( = ?auto_21787 ?auto_21817 ) ) ( not ( = ?auto_21788 ?auto_21792 ) ) ( not ( = ?auto_21788 ?auto_21817 ) ) ( not ( = ?auto_21789 ?auto_21792 ) ) ( not ( = ?auto_21789 ?auto_21817 ) ) ( not ( = ?auto_21790 ?auto_21792 ) ) ( not ( = ?auto_21790 ?auto_21817 ) ) ( not ( = ?auto_21792 ?auto_21803 ) ) ( not ( = ?auto_21792 ?auto_21804 ) ) ( not ( = ?auto_21792 ?auto_21818 ) ) ( not ( = ?auto_21792 ?auto_21821 ) ) ( not ( = ?auto_21792 ?auto_21801 ) ) ( not ( = ?auto_21792 ?auto_21807 ) ) ( not ( = ?auto_21792 ?auto_21814 ) ) ( not ( = ?auto_21792 ?auto_21808 ) ) ( not ( = ?auto_21792 ?auto_21802 ) ) ( not ( = ?auto_21817 ?auto_21803 ) ) ( not ( = ?auto_21817 ?auto_21804 ) ) ( not ( = ?auto_21817 ?auto_21818 ) ) ( not ( = ?auto_21817 ?auto_21821 ) ) ( not ( = ?auto_21817 ?auto_21801 ) ) ( not ( = ?auto_21817 ?auto_21807 ) ) ( not ( = ?auto_21817 ?auto_21814 ) ) ( not ( = ?auto_21817 ?auto_21808 ) ) ( not ( = ?auto_21817 ?auto_21802 ) ) ( not ( = ?auto_21782 ?auto_21793 ) ) ( not ( = ?auto_21782 ?auto_21798 ) ) ( not ( = ?auto_21783 ?auto_21793 ) ) ( not ( = ?auto_21783 ?auto_21798 ) ) ( not ( = ?auto_21784 ?auto_21793 ) ) ( not ( = ?auto_21784 ?auto_21798 ) ) ( not ( = ?auto_21785 ?auto_21793 ) ) ( not ( = ?auto_21785 ?auto_21798 ) ) ( not ( = ?auto_21786 ?auto_21793 ) ) ( not ( = ?auto_21786 ?auto_21798 ) ) ( not ( = ?auto_21787 ?auto_21793 ) ) ( not ( = ?auto_21787 ?auto_21798 ) ) ( not ( = ?auto_21788 ?auto_21793 ) ) ( not ( = ?auto_21788 ?auto_21798 ) ) ( not ( = ?auto_21789 ?auto_21793 ) ) ( not ( = ?auto_21789 ?auto_21798 ) ) ( not ( = ?auto_21790 ?auto_21793 ) ) ( not ( = ?auto_21790 ?auto_21798 ) ) ( not ( = ?auto_21791 ?auto_21793 ) ) ( not ( = ?auto_21791 ?auto_21798 ) ) ( not ( = ?auto_21793 ?auto_21817 ) ) ( not ( = ?auto_21793 ?auto_21803 ) ) ( not ( = ?auto_21793 ?auto_21804 ) ) ( not ( = ?auto_21793 ?auto_21818 ) ) ( not ( = ?auto_21793 ?auto_21821 ) ) ( not ( = ?auto_21793 ?auto_21801 ) ) ( not ( = ?auto_21793 ?auto_21807 ) ) ( not ( = ?auto_21793 ?auto_21814 ) ) ( not ( = ?auto_21793 ?auto_21808 ) ) ( not ( = ?auto_21793 ?auto_21802 ) ) ( not ( = ?auto_21798 ?auto_21817 ) ) ( not ( = ?auto_21798 ?auto_21803 ) ) ( not ( = ?auto_21798 ?auto_21804 ) ) ( not ( = ?auto_21798 ?auto_21818 ) ) ( not ( = ?auto_21798 ?auto_21821 ) ) ( not ( = ?auto_21798 ?auto_21801 ) ) ( not ( = ?auto_21798 ?auto_21807 ) ) ( not ( = ?auto_21798 ?auto_21814 ) ) ( not ( = ?auto_21798 ?auto_21808 ) ) ( not ( = ?auto_21798 ?auto_21802 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_21782 ?auto_21783 ?auto_21784 ?auto_21785 ?auto_21786 ?auto_21787 ?auto_21788 ?auto_21789 ?auto_21790 ?auto_21791 ?auto_21792 )
      ( MAKE-1CRATE ?auto_21792 ?auto_21793 )
      ( MAKE-11CRATE-VERIFY ?auto_21782 ?auto_21783 ?auto_21784 ?auto_21785 ?auto_21786 ?auto_21787 ?auto_21788 ?auto_21789 ?auto_21790 ?auto_21791 ?auto_21792 ?auto_21793 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_21847 - SURFACE
      ?auto_21848 - SURFACE
      ?auto_21849 - SURFACE
      ?auto_21850 - SURFACE
      ?auto_21851 - SURFACE
      ?auto_21852 - SURFACE
      ?auto_21853 - SURFACE
      ?auto_21854 - SURFACE
      ?auto_21855 - SURFACE
      ?auto_21856 - SURFACE
      ?auto_21857 - SURFACE
      ?auto_21858 - SURFACE
      ?auto_21859 - SURFACE
    )
    :vars
    (
      ?auto_21861 - HOIST
      ?auto_21860 - PLACE
      ?auto_21865 - PLACE
      ?auto_21862 - HOIST
      ?auto_21864 - SURFACE
      ?auto_21883 - PLACE
      ?auto_21866 - HOIST
      ?auto_21878 - SURFACE
      ?auto_21873 - PLACE
      ?auto_21868 - HOIST
      ?auto_21879 - SURFACE
      ?auto_21889 - PLACE
      ?auto_21881 - HOIST
      ?auto_21887 - SURFACE
      ?auto_21874 - PLACE
      ?auto_21877 - HOIST
      ?auto_21871 - SURFACE
      ?auto_21876 - PLACE
      ?auto_21884 - HOIST
      ?auto_21872 - SURFACE
      ?auto_21888 - PLACE
      ?auto_21869 - HOIST
      ?auto_21867 - SURFACE
      ?auto_21885 - SURFACE
      ?auto_21886 - PLACE
      ?auto_21882 - HOIST
      ?auto_21880 - SURFACE
      ?auto_21890 - SURFACE
      ?auto_21875 - SURFACE
      ?auto_21870 - SURFACE
      ?auto_21863 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21861 ?auto_21860 ) ( IS-CRATE ?auto_21859 ) ( not ( = ?auto_21865 ?auto_21860 ) ) ( HOIST-AT ?auto_21862 ?auto_21865 ) ( SURFACE-AT ?auto_21859 ?auto_21865 ) ( ON ?auto_21859 ?auto_21864 ) ( CLEAR ?auto_21859 ) ( not ( = ?auto_21858 ?auto_21859 ) ) ( not ( = ?auto_21858 ?auto_21864 ) ) ( not ( = ?auto_21859 ?auto_21864 ) ) ( not ( = ?auto_21861 ?auto_21862 ) ) ( IS-CRATE ?auto_21858 ) ( not ( = ?auto_21883 ?auto_21860 ) ) ( HOIST-AT ?auto_21866 ?auto_21883 ) ( SURFACE-AT ?auto_21858 ?auto_21883 ) ( ON ?auto_21858 ?auto_21878 ) ( CLEAR ?auto_21858 ) ( not ( = ?auto_21857 ?auto_21858 ) ) ( not ( = ?auto_21857 ?auto_21878 ) ) ( not ( = ?auto_21858 ?auto_21878 ) ) ( not ( = ?auto_21861 ?auto_21866 ) ) ( IS-CRATE ?auto_21857 ) ( not ( = ?auto_21873 ?auto_21860 ) ) ( HOIST-AT ?auto_21868 ?auto_21873 ) ( SURFACE-AT ?auto_21857 ?auto_21873 ) ( ON ?auto_21857 ?auto_21879 ) ( CLEAR ?auto_21857 ) ( not ( = ?auto_21856 ?auto_21857 ) ) ( not ( = ?auto_21856 ?auto_21879 ) ) ( not ( = ?auto_21857 ?auto_21879 ) ) ( not ( = ?auto_21861 ?auto_21868 ) ) ( IS-CRATE ?auto_21856 ) ( not ( = ?auto_21889 ?auto_21860 ) ) ( HOIST-AT ?auto_21881 ?auto_21889 ) ( SURFACE-AT ?auto_21856 ?auto_21889 ) ( ON ?auto_21856 ?auto_21887 ) ( CLEAR ?auto_21856 ) ( not ( = ?auto_21855 ?auto_21856 ) ) ( not ( = ?auto_21855 ?auto_21887 ) ) ( not ( = ?auto_21856 ?auto_21887 ) ) ( not ( = ?auto_21861 ?auto_21881 ) ) ( IS-CRATE ?auto_21855 ) ( not ( = ?auto_21874 ?auto_21860 ) ) ( HOIST-AT ?auto_21877 ?auto_21874 ) ( AVAILABLE ?auto_21877 ) ( SURFACE-AT ?auto_21855 ?auto_21874 ) ( ON ?auto_21855 ?auto_21871 ) ( CLEAR ?auto_21855 ) ( not ( = ?auto_21854 ?auto_21855 ) ) ( not ( = ?auto_21854 ?auto_21871 ) ) ( not ( = ?auto_21855 ?auto_21871 ) ) ( not ( = ?auto_21861 ?auto_21877 ) ) ( IS-CRATE ?auto_21854 ) ( not ( = ?auto_21876 ?auto_21860 ) ) ( HOIST-AT ?auto_21884 ?auto_21876 ) ( AVAILABLE ?auto_21884 ) ( SURFACE-AT ?auto_21854 ?auto_21876 ) ( ON ?auto_21854 ?auto_21872 ) ( CLEAR ?auto_21854 ) ( not ( = ?auto_21853 ?auto_21854 ) ) ( not ( = ?auto_21853 ?auto_21872 ) ) ( not ( = ?auto_21854 ?auto_21872 ) ) ( not ( = ?auto_21861 ?auto_21884 ) ) ( IS-CRATE ?auto_21853 ) ( not ( = ?auto_21888 ?auto_21860 ) ) ( HOIST-AT ?auto_21869 ?auto_21888 ) ( AVAILABLE ?auto_21869 ) ( SURFACE-AT ?auto_21853 ?auto_21888 ) ( ON ?auto_21853 ?auto_21867 ) ( CLEAR ?auto_21853 ) ( not ( = ?auto_21852 ?auto_21853 ) ) ( not ( = ?auto_21852 ?auto_21867 ) ) ( not ( = ?auto_21853 ?auto_21867 ) ) ( not ( = ?auto_21861 ?auto_21869 ) ) ( IS-CRATE ?auto_21852 ) ( AVAILABLE ?auto_21862 ) ( SURFACE-AT ?auto_21852 ?auto_21865 ) ( ON ?auto_21852 ?auto_21885 ) ( CLEAR ?auto_21852 ) ( not ( = ?auto_21851 ?auto_21852 ) ) ( not ( = ?auto_21851 ?auto_21885 ) ) ( not ( = ?auto_21852 ?auto_21885 ) ) ( IS-CRATE ?auto_21851 ) ( not ( = ?auto_21886 ?auto_21860 ) ) ( HOIST-AT ?auto_21882 ?auto_21886 ) ( AVAILABLE ?auto_21882 ) ( SURFACE-AT ?auto_21851 ?auto_21886 ) ( ON ?auto_21851 ?auto_21880 ) ( CLEAR ?auto_21851 ) ( not ( = ?auto_21850 ?auto_21851 ) ) ( not ( = ?auto_21850 ?auto_21880 ) ) ( not ( = ?auto_21851 ?auto_21880 ) ) ( not ( = ?auto_21861 ?auto_21882 ) ) ( IS-CRATE ?auto_21850 ) ( AVAILABLE ?auto_21868 ) ( SURFACE-AT ?auto_21850 ?auto_21873 ) ( ON ?auto_21850 ?auto_21890 ) ( CLEAR ?auto_21850 ) ( not ( = ?auto_21849 ?auto_21850 ) ) ( not ( = ?auto_21849 ?auto_21890 ) ) ( not ( = ?auto_21850 ?auto_21890 ) ) ( IS-CRATE ?auto_21849 ) ( AVAILABLE ?auto_21866 ) ( SURFACE-AT ?auto_21849 ?auto_21883 ) ( ON ?auto_21849 ?auto_21875 ) ( CLEAR ?auto_21849 ) ( not ( = ?auto_21848 ?auto_21849 ) ) ( not ( = ?auto_21848 ?auto_21875 ) ) ( not ( = ?auto_21849 ?auto_21875 ) ) ( SURFACE-AT ?auto_21847 ?auto_21860 ) ( CLEAR ?auto_21847 ) ( IS-CRATE ?auto_21848 ) ( AVAILABLE ?auto_21861 ) ( AVAILABLE ?auto_21881 ) ( SURFACE-AT ?auto_21848 ?auto_21889 ) ( ON ?auto_21848 ?auto_21870 ) ( CLEAR ?auto_21848 ) ( TRUCK-AT ?auto_21863 ?auto_21860 ) ( not ( = ?auto_21847 ?auto_21848 ) ) ( not ( = ?auto_21847 ?auto_21870 ) ) ( not ( = ?auto_21848 ?auto_21870 ) ) ( not ( = ?auto_21847 ?auto_21849 ) ) ( not ( = ?auto_21847 ?auto_21875 ) ) ( not ( = ?auto_21849 ?auto_21870 ) ) ( not ( = ?auto_21883 ?auto_21889 ) ) ( not ( = ?auto_21866 ?auto_21881 ) ) ( not ( = ?auto_21875 ?auto_21870 ) ) ( not ( = ?auto_21847 ?auto_21850 ) ) ( not ( = ?auto_21847 ?auto_21890 ) ) ( not ( = ?auto_21848 ?auto_21850 ) ) ( not ( = ?auto_21848 ?auto_21890 ) ) ( not ( = ?auto_21850 ?auto_21875 ) ) ( not ( = ?auto_21850 ?auto_21870 ) ) ( not ( = ?auto_21873 ?auto_21883 ) ) ( not ( = ?auto_21873 ?auto_21889 ) ) ( not ( = ?auto_21868 ?auto_21866 ) ) ( not ( = ?auto_21868 ?auto_21881 ) ) ( not ( = ?auto_21890 ?auto_21875 ) ) ( not ( = ?auto_21890 ?auto_21870 ) ) ( not ( = ?auto_21847 ?auto_21851 ) ) ( not ( = ?auto_21847 ?auto_21880 ) ) ( not ( = ?auto_21848 ?auto_21851 ) ) ( not ( = ?auto_21848 ?auto_21880 ) ) ( not ( = ?auto_21849 ?auto_21851 ) ) ( not ( = ?auto_21849 ?auto_21880 ) ) ( not ( = ?auto_21851 ?auto_21890 ) ) ( not ( = ?auto_21851 ?auto_21875 ) ) ( not ( = ?auto_21851 ?auto_21870 ) ) ( not ( = ?auto_21886 ?auto_21873 ) ) ( not ( = ?auto_21886 ?auto_21883 ) ) ( not ( = ?auto_21886 ?auto_21889 ) ) ( not ( = ?auto_21882 ?auto_21868 ) ) ( not ( = ?auto_21882 ?auto_21866 ) ) ( not ( = ?auto_21882 ?auto_21881 ) ) ( not ( = ?auto_21880 ?auto_21890 ) ) ( not ( = ?auto_21880 ?auto_21875 ) ) ( not ( = ?auto_21880 ?auto_21870 ) ) ( not ( = ?auto_21847 ?auto_21852 ) ) ( not ( = ?auto_21847 ?auto_21885 ) ) ( not ( = ?auto_21848 ?auto_21852 ) ) ( not ( = ?auto_21848 ?auto_21885 ) ) ( not ( = ?auto_21849 ?auto_21852 ) ) ( not ( = ?auto_21849 ?auto_21885 ) ) ( not ( = ?auto_21850 ?auto_21852 ) ) ( not ( = ?auto_21850 ?auto_21885 ) ) ( not ( = ?auto_21852 ?auto_21880 ) ) ( not ( = ?auto_21852 ?auto_21890 ) ) ( not ( = ?auto_21852 ?auto_21875 ) ) ( not ( = ?auto_21852 ?auto_21870 ) ) ( not ( = ?auto_21865 ?auto_21886 ) ) ( not ( = ?auto_21865 ?auto_21873 ) ) ( not ( = ?auto_21865 ?auto_21883 ) ) ( not ( = ?auto_21865 ?auto_21889 ) ) ( not ( = ?auto_21862 ?auto_21882 ) ) ( not ( = ?auto_21862 ?auto_21868 ) ) ( not ( = ?auto_21862 ?auto_21866 ) ) ( not ( = ?auto_21862 ?auto_21881 ) ) ( not ( = ?auto_21885 ?auto_21880 ) ) ( not ( = ?auto_21885 ?auto_21890 ) ) ( not ( = ?auto_21885 ?auto_21875 ) ) ( not ( = ?auto_21885 ?auto_21870 ) ) ( not ( = ?auto_21847 ?auto_21853 ) ) ( not ( = ?auto_21847 ?auto_21867 ) ) ( not ( = ?auto_21848 ?auto_21853 ) ) ( not ( = ?auto_21848 ?auto_21867 ) ) ( not ( = ?auto_21849 ?auto_21853 ) ) ( not ( = ?auto_21849 ?auto_21867 ) ) ( not ( = ?auto_21850 ?auto_21853 ) ) ( not ( = ?auto_21850 ?auto_21867 ) ) ( not ( = ?auto_21851 ?auto_21853 ) ) ( not ( = ?auto_21851 ?auto_21867 ) ) ( not ( = ?auto_21853 ?auto_21885 ) ) ( not ( = ?auto_21853 ?auto_21880 ) ) ( not ( = ?auto_21853 ?auto_21890 ) ) ( not ( = ?auto_21853 ?auto_21875 ) ) ( not ( = ?auto_21853 ?auto_21870 ) ) ( not ( = ?auto_21888 ?auto_21865 ) ) ( not ( = ?auto_21888 ?auto_21886 ) ) ( not ( = ?auto_21888 ?auto_21873 ) ) ( not ( = ?auto_21888 ?auto_21883 ) ) ( not ( = ?auto_21888 ?auto_21889 ) ) ( not ( = ?auto_21869 ?auto_21862 ) ) ( not ( = ?auto_21869 ?auto_21882 ) ) ( not ( = ?auto_21869 ?auto_21868 ) ) ( not ( = ?auto_21869 ?auto_21866 ) ) ( not ( = ?auto_21869 ?auto_21881 ) ) ( not ( = ?auto_21867 ?auto_21885 ) ) ( not ( = ?auto_21867 ?auto_21880 ) ) ( not ( = ?auto_21867 ?auto_21890 ) ) ( not ( = ?auto_21867 ?auto_21875 ) ) ( not ( = ?auto_21867 ?auto_21870 ) ) ( not ( = ?auto_21847 ?auto_21854 ) ) ( not ( = ?auto_21847 ?auto_21872 ) ) ( not ( = ?auto_21848 ?auto_21854 ) ) ( not ( = ?auto_21848 ?auto_21872 ) ) ( not ( = ?auto_21849 ?auto_21854 ) ) ( not ( = ?auto_21849 ?auto_21872 ) ) ( not ( = ?auto_21850 ?auto_21854 ) ) ( not ( = ?auto_21850 ?auto_21872 ) ) ( not ( = ?auto_21851 ?auto_21854 ) ) ( not ( = ?auto_21851 ?auto_21872 ) ) ( not ( = ?auto_21852 ?auto_21854 ) ) ( not ( = ?auto_21852 ?auto_21872 ) ) ( not ( = ?auto_21854 ?auto_21867 ) ) ( not ( = ?auto_21854 ?auto_21885 ) ) ( not ( = ?auto_21854 ?auto_21880 ) ) ( not ( = ?auto_21854 ?auto_21890 ) ) ( not ( = ?auto_21854 ?auto_21875 ) ) ( not ( = ?auto_21854 ?auto_21870 ) ) ( not ( = ?auto_21876 ?auto_21888 ) ) ( not ( = ?auto_21876 ?auto_21865 ) ) ( not ( = ?auto_21876 ?auto_21886 ) ) ( not ( = ?auto_21876 ?auto_21873 ) ) ( not ( = ?auto_21876 ?auto_21883 ) ) ( not ( = ?auto_21876 ?auto_21889 ) ) ( not ( = ?auto_21884 ?auto_21869 ) ) ( not ( = ?auto_21884 ?auto_21862 ) ) ( not ( = ?auto_21884 ?auto_21882 ) ) ( not ( = ?auto_21884 ?auto_21868 ) ) ( not ( = ?auto_21884 ?auto_21866 ) ) ( not ( = ?auto_21884 ?auto_21881 ) ) ( not ( = ?auto_21872 ?auto_21867 ) ) ( not ( = ?auto_21872 ?auto_21885 ) ) ( not ( = ?auto_21872 ?auto_21880 ) ) ( not ( = ?auto_21872 ?auto_21890 ) ) ( not ( = ?auto_21872 ?auto_21875 ) ) ( not ( = ?auto_21872 ?auto_21870 ) ) ( not ( = ?auto_21847 ?auto_21855 ) ) ( not ( = ?auto_21847 ?auto_21871 ) ) ( not ( = ?auto_21848 ?auto_21855 ) ) ( not ( = ?auto_21848 ?auto_21871 ) ) ( not ( = ?auto_21849 ?auto_21855 ) ) ( not ( = ?auto_21849 ?auto_21871 ) ) ( not ( = ?auto_21850 ?auto_21855 ) ) ( not ( = ?auto_21850 ?auto_21871 ) ) ( not ( = ?auto_21851 ?auto_21855 ) ) ( not ( = ?auto_21851 ?auto_21871 ) ) ( not ( = ?auto_21852 ?auto_21855 ) ) ( not ( = ?auto_21852 ?auto_21871 ) ) ( not ( = ?auto_21853 ?auto_21855 ) ) ( not ( = ?auto_21853 ?auto_21871 ) ) ( not ( = ?auto_21855 ?auto_21872 ) ) ( not ( = ?auto_21855 ?auto_21867 ) ) ( not ( = ?auto_21855 ?auto_21885 ) ) ( not ( = ?auto_21855 ?auto_21880 ) ) ( not ( = ?auto_21855 ?auto_21890 ) ) ( not ( = ?auto_21855 ?auto_21875 ) ) ( not ( = ?auto_21855 ?auto_21870 ) ) ( not ( = ?auto_21874 ?auto_21876 ) ) ( not ( = ?auto_21874 ?auto_21888 ) ) ( not ( = ?auto_21874 ?auto_21865 ) ) ( not ( = ?auto_21874 ?auto_21886 ) ) ( not ( = ?auto_21874 ?auto_21873 ) ) ( not ( = ?auto_21874 ?auto_21883 ) ) ( not ( = ?auto_21874 ?auto_21889 ) ) ( not ( = ?auto_21877 ?auto_21884 ) ) ( not ( = ?auto_21877 ?auto_21869 ) ) ( not ( = ?auto_21877 ?auto_21862 ) ) ( not ( = ?auto_21877 ?auto_21882 ) ) ( not ( = ?auto_21877 ?auto_21868 ) ) ( not ( = ?auto_21877 ?auto_21866 ) ) ( not ( = ?auto_21877 ?auto_21881 ) ) ( not ( = ?auto_21871 ?auto_21872 ) ) ( not ( = ?auto_21871 ?auto_21867 ) ) ( not ( = ?auto_21871 ?auto_21885 ) ) ( not ( = ?auto_21871 ?auto_21880 ) ) ( not ( = ?auto_21871 ?auto_21890 ) ) ( not ( = ?auto_21871 ?auto_21875 ) ) ( not ( = ?auto_21871 ?auto_21870 ) ) ( not ( = ?auto_21847 ?auto_21856 ) ) ( not ( = ?auto_21847 ?auto_21887 ) ) ( not ( = ?auto_21848 ?auto_21856 ) ) ( not ( = ?auto_21848 ?auto_21887 ) ) ( not ( = ?auto_21849 ?auto_21856 ) ) ( not ( = ?auto_21849 ?auto_21887 ) ) ( not ( = ?auto_21850 ?auto_21856 ) ) ( not ( = ?auto_21850 ?auto_21887 ) ) ( not ( = ?auto_21851 ?auto_21856 ) ) ( not ( = ?auto_21851 ?auto_21887 ) ) ( not ( = ?auto_21852 ?auto_21856 ) ) ( not ( = ?auto_21852 ?auto_21887 ) ) ( not ( = ?auto_21853 ?auto_21856 ) ) ( not ( = ?auto_21853 ?auto_21887 ) ) ( not ( = ?auto_21854 ?auto_21856 ) ) ( not ( = ?auto_21854 ?auto_21887 ) ) ( not ( = ?auto_21856 ?auto_21871 ) ) ( not ( = ?auto_21856 ?auto_21872 ) ) ( not ( = ?auto_21856 ?auto_21867 ) ) ( not ( = ?auto_21856 ?auto_21885 ) ) ( not ( = ?auto_21856 ?auto_21880 ) ) ( not ( = ?auto_21856 ?auto_21890 ) ) ( not ( = ?auto_21856 ?auto_21875 ) ) ( not ( = ?auto_21856 ?auto_21870 ) ) ( not ( = ?auto_21887 ?auto_21871 ) ) ( not ( = ?auto_21887 ?auto_21872 ) ) ( not ( = ?auto_21887 ?auto_21867 ) ) ( not ( = ?auto_21887 ?auto_21885 ) ) ( not ( = ?auto_21887 ?auto_21880 ) ) ( not ( = ?auto_21887 ?auto_21890 ) ) ( not ( = ?auto_21887 ?auto_21875 ) ) ( not ( = ?auto_21887 ?auto_21870 ) ) ( not ( = ?auto_21847 ?auto_21857 ) ) ( not ( = ?auto_21847 ?auto_21879 ) ) ( not ( = ?auto_21848 ?auto_21857 ) ) ( not ( = ?auto_21848 ?auto_21879 ) ) ( not ( = ?auto_21849 ?auto_21857 ) ) ( not ( = ?auto_21849 ?auto_21879 ) ) ( not ( = ?auto_21850 ?auto_21857 ) ) ( not ( = ?auto_21850 ?auto_21879 ) ) ( not ( = ?auto_21851 ?auto_21857 ) ) ( not ( = ?auto_21851 ?auto_21879 ) ) ( not ( = ?auto_21852 ?auto_21857 ) ) ( not ( = ?auto_21852 ?auto_21879 ) ) ( not ( = ?auto_21853 ?auto_21857 ) ) ( not ( = ?auto_21853 ?auto_21879 ) ) ( not ( = ?auto_21854 ?auto_21857 ) ) ( not ( = ?auto_21854 ?auto_21879 ) ) ( not ( = ?auto_21855 ?auto_21857 ) ) ( not ( = ?auto_21855 ?auto_21879 ) ) ( not ( = ?auto_21857 ?auto_21887 ) ) ( not ( = ?auto_21857 ?auto_21871 ) ) ( not ( = ?auto_21857 ?auto_21872 ) ) ( not ( = ?auto_21857 ?auto_21867 ) ) ( not ( = ?auto_21857 ?auto_21885 ) ) ( not ( = ?auto_21857 ?auto_21880 ) ) ( not ( = ?auto_21857 ?auto_21890 ) ) ( not ( = ?auto_21857 ?auto_21875 ) ) ( not ( = ?auto_21857 ?auto_21870 ) ) ( not ( = ?auto_21879 ?auto_21887 ) ) ( not ( = ?auto_21879 ?auto_21871 ) ) ( not ( = ?auto_21879 ?auto_21872 ) ) ( not ( = ?auto_21879 ?auto_21867 ) ) ( not ( = ?auto_21879 ?auto_21885 ) ) ( not ( = ?auto_21879 ?auto_21880 ) ) ( not ( = ?auto_21879 ?auto_21890 ) ) ( not ( = ?auto_21879 ?auto_21875 ) ) ( not ( = ?auto_21879 ?auto_21870 ) ) ( not ( = ?auto_21847 ?auto_21858 ) ) ( not ( = ?auto_21847 ?auto_21878 ) ) ( not ( = ?auto_21848 ?auto_21858 ) ) ( not ( = ?auto_21848 ?auto_21878 ) ) ( not ( = ?auto_21849 ?auto_21858 ) ) ( not ( = ?auto_21849 ?auto_21878 ) ) ( not ( = ?auto_21850 ?auto_21858 ) ) ( not ( = ?auto_21850 ?auto_21878 ) ) ( not ( = ?auto_21851 ?auto_21858 ) ) ( not ( = ?auto_21851 ?auto_21878 ) ) ( not ( = ?auto_21852 ?auto_21858 ) ) ( not ( = ?auto_21852 ?auto_21878 ) ) ( not ( = ?auto_21853 ?auto_21858 ) ) ( not ( = ?auto_21853 ?auto_21878 ) ) ( not ( = ?auto_21854 ?auto_21858 ) ) ( not ( = ?auto_21854 ?auto_21878 ) ) ( not ( = ?auto_21855 ?auto_21858 ) ) ( not ( = ?auto_21855 ?auto_21878 ) ) ( not ( = ?auto_21856 ?auto_21858 ) ) ( not ( = ?auto_21856 ?auto_21878 ) ) ( not ( = ?auto_21858 ?auto_21879 ) ) ( not ( = ?auto_21858 ?auto_21887 ) ) ( not ( = ?auto_21858 ?auto_21871 ) ) ( not ( = ?auto_21858 ?auto_21872 ) ) ( not ( = ?auto_21858 ?auto_21867 ) ) ( not ( = ?auto_21858 ?auto_21885 ) ) ( not ( = ?auto_21858 ?auto_21880 ) ) ( not ( = ?auto_21858 ?auto_21890 ) ) ( not ( = ?auto_21858 ?auto_21875 ) ) ( not ( = ?auto_21858 ?auto_21870 ) ) ( not ( = ?auto_21878 ?auto_21879 ) ) ( not ( = ?auto_21878 ?auto_21887 ) ) ( not ( = ?auto_21878 ?auto_21871 ) ) ( not ( = ?auto_21878 ?auto_21872 ) ) ( not ( = ?auto_21878 ?auto_21867 ) ) ( not ( = ?auto_21878 ?auto_21885 ) ) ( not ( = ?auto_21878 ?auto_21880 ) ) ( not ( = ?auto_21878 ?auto_21890 ) ) ( not ( = ?auto_21878 ?auto_21875 ) ) ( not ( = ?auto_21878 ?auto_21870 ) ) ( not ( = ?auto_21847 ?auto_21859 ) ) ( not ( = ?auto_21847 ?auto_21864 ) ) ( not ( = ?auto_21848 ?auto_21859 ) ) ( not ( = ?auto_21848 ?auto_21864 ) ) ( not ( = ?auto_21849 ?auto_21859 ) ) ( not ( = ?auto_21849 ?auto_21864 ) ) ( not ( = ?auto_21850 ?auto_21859 ) ) ( not ( = ?auto_21850 ?auto_21864 ) ) ( not ( = ?auto_21851 ?auto_21859 ) ) ( not ( = ?auto_21851 ?auto_21864 ) ) ( not ( = ?auto_21852 ?auto_21859 ) ) ( not ( = ?auto_21852 ?auto_21864 ) ) ( not ( = ?auto_21853 ?auto_21859 ) ) ( not ( = ?auto_21853 ?auto_21864 ) ) ( not ( = ?auto_21854 ?auto_21859 ) ) ( not ( = ?auto_21854 ?auto_21864 ) ) ( not ( = ?auto_21855 ?auto_21859 ) ) ( not ( = ?auto_21855 ?auto_21864 ) ) ( not ( = ?auto_21856 ?auto_21859 ) ) ( not ( = ?auto_21856 ?auto_21864 ) ) ( not ( = ?auto_21857 ?auto_21859 ) ) ( not ( = ?auto_21857 ?auto_21864 ) ) ( not ( = ?auto_21859 ?auto_21878 ) ) ( not ( = ?auto_21859 ?auto_21879 ) ) ( not ( = ?auto_21859 ?auto_21887 ) ) ( not ( = ?auto_21859 ?auto_21871 ) ) ( not ( = ?auto_21859 ?auto_21872 ) ) ( not ( = ?auto_21859 ?auto_21867 ) ) ( not ( = ?auto_21859 ?auto_21885 ) ) ( not ( = ?auto_21859 ?auto_21880 ) ) ( not ( = ?auto_21859 ?auto_21890 ) ) ( not ( = ?auto_21859 ?auto_21875 ) ) ( not ( = ?auto_21859 ?auto_21870 ) ) ( not ( = ?auto_21864 ?auto_21878 ) ) ( not ( = ?auto_21864 ?auto_21879 ) ) ( not ( = ?auto_21864 ?auto_21887 ) ) ( not ( = ?auto_21864 ?auto_21871 ) ) ( not ( = ?auto_21864 ?auto_21872 ) ) ( not ( = ?auto_21864 ?auto_21867 ) ) ( not ( = ?auto_21864 ?auto_21885 ) ) ( not ( = ?auto_21864 ?auto_21880 ) ) ( not ( = ?auto_21864 ?auto_21890 ) ) ( not ( = ?auto_21864 ?auto_21875 ) ) ( not ( = ?auto_21864 ?auto_21870 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_21847 ?auto_21848 ?auto_21849 ?auto_21850 ?auto_21851 ?auto_21852 ?auto_21853 ?auto_21854 ?auto_21855 ?auto_21856 ?auto_21857 ?auto_21858 )
      ( MAKE-1CRATE ?auto_21858 ?auto_21859 )
      ( MAKE-12CRATE-VERIFY ?auto_21847 ?auto_21848 ?auto_21849 ?auto_21850 ?auto_21851 ?auto_21852 ?auto_21853 ?auto_21854 ?auto_21855 ?auto_21856 ?auto_21857 ?auto_21858 ?auto_21859 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_21915 - SURFACE
      ?auto_21916 - SURFACE
      ?auto_21917 - SURFACE
      ?auto_21918 - SURFACE
      ?auto_21919 - SURFACE
      ?auto_21920 - SURFACE
      ?auto_21921 - SURFACE
      ?auto_21922 - SURFACE
      ?auto_21923 - SURFACE
      ?auto_21924 - SURFACE
      ?auto_21925 - SURFACE
      ?auto_21926 - SURFACE
      ?auto_21927 - SURFACE
      ?auto_21928 - SURFACE
    )
    :vars
    (
      ?auto_21934 - HOIST
      ?auto_21933 - PLACE
      ?auto_21930 - PLACE
      ?auto_21932 - HOIST
      ?auto_21929 - SURFACE
      ?auto_21948 - PLACE
      ?auto_21940 - HOIST
      ?auto_21939 - SURFACE
      ?auto_21962 - PLACE
      ?auto_21950 - HOIST
      ?auto_21946 - SURFACE
      ?auto_21958 - PLACE
      ?auto_21944 - HOIST
      ?auto_21951 - SURFACE
      ?auto_21952 - PLACE
      ?auto_21955 - HOIST
      ?auto_21937 - SURFACE
      ?auto_21942 - PLACE
      ?auto_21954 - HOIST
      ?auto_21935 - SURFACE
      ?auto_21949 - PLACE
      ?auto_21947 - HOIST
      ?auto_21943 - SURFACE
      ?auto_21961 - PLACE
      ?auto_21945 - HOIST
      ?auto_21956 - SURFACE
      ?auto_21957 - SURFACE
      ?auto_21953 - PLACE
      ?auto_21938 - HOIST
      ?auto_21959 - SURFACE
      ?auto_21941 - SURFACE
      ?auto_21936 - SURFACE
      ?auto_21960 - SURFACE
      ?auto_21931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21934 ?auto_21933 ) ( IS-CRATE ?auto_21928 ) ( not ( = ?auto_21930 ?auto_21933 ) ) ( HOIST-AT ?auto_21932 ?auto_21930 ) ( AVAILABLE ?auto_21932 ) ( SURFACE-AT ?auto_21928 ?auto_21930 ) ( ON ?auto_21928 ?auto_21929 ) ( CLEAR ?auto_21928 ) ( not ( = ?auto_21927 ?auto_21928 ) ) ( not ( = ?auto_21927 ?auto_21929 ) ) ( not ( = ?auto_21928 ?auto_21929 ) ) ( not ( = ?auto_21934 ?auto_21932 ) ) ( IS-CRATE ?auto_21927 ) ( not ( = ?auto_21948 ?auto_21933 ) ) ( HOIST-AT ?auto_21940 ?auto_21948 ) ( SURFACE-AT ?auto_21927 ?auto_21948 ) ( ON ?auto_21927 ?auto_21939 ) ( CLEAR ?auto_21927 ) ( not ( = ?auto_21926 ?auto_21927 ) ) ( not ( = ?auto_21926 ?auto_21939 ) ) ( not ( = ?auto_21927 ?auto_21939 ) ) ( not ( = ?auto_21934 ?auto_21940 ) ) ( IS-CRATE ?auto_21926 ) ( not ( = ?auto_21962 ?auto_21933 ) ) ( HOIST-AT ?auto_21950 ?auto_21962 ) ( SURFACE-AT ?auto_21926 ?auto_21962 ) ( ON ?auto_21926 ?auto_21946 ) ( CLEAR ?auto_21926 ) ( not ( = ?auto_21925 ?auto_21926 ) ) ( not ( = ?auto_21925 ?auto_21946 ) ) ( not ( = ?auto_21926 ?auto_21946 ) ) ( not ( = ?auto_21934 ?auto_21950 ) ) ( IS-CRATE ?auto_21925 ) ( not ( = ?auto_21958 ?auto_21933 ) ) ( HOIST-AT ?auto_21944 ?auto_21958 ) ( SURFACE-AT ?auto_21925 ?auto_21958 ) ( ON ?auto_21925 ?auto_21951 ) ( CLEAR ?auto_21925 ) ( not ( = ?auto_21924 ?auto_21925 ) ) ( not ( = ?auto_21924 ?auto_21951 ) ) ( not ( = ?auto_21925 ?auto_21951 ) ) ( not ( = ?auto_21934 ?auto_21944 ) ) ( IS-CRATE ?auto_21924 ) ( not ( = ?auto_21952 ?auto_21933 ) ) ( HOIST-AT ?auto_21955 ?auto_21952 ) ( SURFACE-AT ?auto_21924 ?auto_21952 ) ( ON ?auto_21924 ?auto_21937 ) ( CLEAR ?auto_21924 ) ( not ( = ?auto_21923 ?auto_21924 ) ) ( not ( = ?auto_21923 ?auto_21937 ) ) ( not ( = ?auto_21924 ?auto_21937 ) ) ( not ( = ?auto_21934 ?auto_21955 ) ) ( IS-CRATE ?auto_21923 ) ( not ( = ?auto_21942 ?auto_21933 ) ) ( HOIST-AT ?auto_21954 ?auto_21942 ) ( AVAILABLE ?auto_21954 ) ( SURFACE-AT ?auto_21923 ?auto_21942 ) ( ON ?auto_21923 ?auto_21935 ) ( CLEAR ?auto_21923 ) ( not ( = ?auto_21922 ?auto_21923 ) ) ( not ( = ?auto_21922 ?auto_21935 ) ) ( not ( = ?auto_21923 ?auto_21935 ) ) ( not ( = ?auto_21934 ?auto_21954 ) ) ( IS-CRATE ?auto_21922 ) ( not ( = ?auto_21949 ?auto_21933 ) ) ( HOIST-AT ?auto_21947 ?auto_21949 ) ( AVAILABLE ?auto_21947 ) ( SURFACE-AT ?auto_21922 ?auto_21949 ) ( ON ?auto_21922 ?auto_21943 ) ( CLEAR ?auto_21922 ) ( not ( = ?auto_21921 ?auto_21922 ) ) ( not ( = ?auto_21921 ?auto_21943 ) ) ( not ( = ?auto_21922 ?auto_21943 ) ) ( not ( = ?auto_21934 ?auto_21947 ) ) ( IS-CRATE ?auto_21921 ) ( not ( = ?auto_21961 ?auto_21933 ) ) ( HOIST-AT ?auto_21945 ?auto_21961 ) ( AVAILABLE ?auto_21945 ) ( SURFACE-AT ?auto_21921 ?auto_21961 ) ( ON ?auto_21921 ?auto_21956 ) ( CLEAR ?auto_21921 ) ( not ( = ?auto_21920 ?auto_21921 ) ) ( not ( = ?auto_21920 ?auto_21956 ) ) ( not ( = ?auto_21921 ?auto_21956 ) ) ( not ( = ?auto_21934 ?auto_21945 ) ) ( IS-CRATE ?auto_21920 ) ( AVAILABLE ?auto_21940 ) ( SURFACE-AT ?auto_21920 ?auto_21948 ) ( ON ?auto_21920 ?auto_21957 ) ( CLEAR ?auto_21920 ) ( not ( = ?auto_21919 ?auto_21920 ) ) ( not ( = ?auto_21919 ?auto_21957 ) ) ( not ( = ?auto_21920 ?auto_21957 ) ) ( IS-CRATE ?auto_21919 ) ( not ( = ?auto_21953 ?auto_21933 ) ) ( HOIST-AT ?auto_21938 ?auto_21953 ) ( AVAILABLE ?auto_21938 ) ( SURFACE-AT ?auto_21919 ?auto_21953 ) ( ON ?auto_21919 ?auto_21959 ) ( CLEAR ?auto_21919 ) ( not ( = ?auto_21918 ?auto_21919 ) ) ( not ( = ?auto_21918 ?auto_21959 ) ) ( not ( = ?auto_21919 ?auto_21959 ) ) ( not ( = ?auto_21934 ?auto_21938 ) ) ( IS-CRATE ?auto_21918 ) ( AVAILABLE ?auto_21944 ) ( SURFACE-AT ?auto_21918 ?auto_21958 ) ( ON ?auto_21918 ?auto_21941 ) ( CLEAR ?auto_21918 ) ( not ( = ?auto_21917 ?auto_21918 ) ) ( not ( = ?auto_21917 ?auto_21941 ) ) ( not ( = ?auto_21918 ?auto_21941 ) ) ( IS-CRATE ?auto_21917 ) ( AVAILABLE ?auto_21950 ) ( SURFACE-AT ?auto_21917 ?auto_21962 ) ( ON ?auto_21917 ?auto_21936 ) ( CLEAR ?auto_21917 ) ( not ( = ?auto_21916 ?auto_21917 ) ) ( not ( = ?auto_21916 ?auto_21936 ) ) ( not ( = ?auto_21917 ?auto_21936 ) ) ( SURFACE-AT ?auto_21915 ?auto_21933 ) ( CLEAR ?auto_21915 ) ( IS-CRATE ?auto_21916 ) ( AVAILABLE ?auto_21934 ) ( AVAILABLE ?auto_21955 ) ( SURFACE-AT ?auto_21916 ?auto_21952 ) ( ON ?auto_21916 ?auto_21960 ) ( CLEAR ?auto_21916 ) ( TRUCK-AT ?auto_21931 ?auto_21933 ) ( not ( = ?auto_21915 ?auto_21916 ) ) ( not ( = ?auto_21915 ?auto_21960 ) ) ( not ( = ?auto_21916 ?auto_21960 ) ) ( not ( = ?auto_21915 ?auto_21917 ) ) ( not ( = ?auto_21915 ?auto_21936 ) ) ( not ( = ?auto_21917 ?auto_21960 ) ) ( not ( = ?auto_21962 ?auto_21952 ) ) ( not ( = ?auto_21950 ?auto_21955 ) ) ( not ( = ?auto_21936 ?auto_21960 ) ) ( not ( = ?auto_21915 ?auto_21918 ) ) ( not ( = ?auto_21915 ?auto_21941 ) ) ( not ( = ?auto_21916 ?auto_21918 ) ) ( not ( = ?auto_21916 ?auto_21941 ) ) ( not ( = ?auto_21918 ?auto_21936 ) ) ( not ( = ?auto_21918 ?auto_21960 ) ) ( not ( = ?auto_21958 ?auto_21962 ) ) ( not ( = ?auto_21958 ?auto_21952 ) ) ( not ( = ?auto_21944 ?auto_21950 ) ) ( not ( = ?auto_21944 ?auto_21955 ) ) ( not ( = ?auto_21941 ?auto_21936 ) ) ( not ( = ?auto_21941 ?auto_21960 ) ) ( not ( = ?auto_21915 ?auto_21919 ) ) ( not ( = ?auto_21915 ?auto_21959 ) ) ( not ( = ?auto_21916 ?auto_21919 ) ) ( not ( = ?auto_21916 ?auto_21959 ) ) ( not ( = ?auto_21917 ?auto_21919 ) ) ( not ( = ?auto_21917 ?auto_21959 ) ) ( not ( = ?auto_21919 ?auto_21941 ) ) ( not ( = ?auto_21919 ?auto_21936 ) ) ( not ( = ?auto_21919 ?auto_21960 ) ) ( not ( = ?auto_21953 ?auto_21958 ) ) ( not ( = ?auto_21953 ?auto_21962 ) ) ( not ( = ?auto_21953 ?auto_21952 ) ) ( not ( = ?auto_21938 ?auto_21944 ) ) ( not ( = ?auto_21938 ?auto_21950 ) ) ( not ( = ?auto_21938 ?auto_21955 ) ) ( not ( = ?auto_21959 ?auto_21941 ) ) ( not ( = ?auto_21959 ?auto_21936 ) ) ( not ( = ?auto_21959 ?auto_21960 ) ) ( not ( = ?auto_21915 ?auto_21920 ) ) ( not ( = ?auto_21915 ?auto_21957 ) ) ( not ( = ?auto_21916 ?auto_21920 ) ) ( not ( = ?auto_21916 ?auto_21957 ) ) ( not ( = ?auto_21917 ?auto_21920 ) ) ( not ( = ?auto_21917 ?auto_21957 ) ) ( not ( = ?auto_21918 ?auto_21920 ) ) ( not ( = ?auto_21918 ?auto_21957 ) ) ( not ( = ?auto_21920 ?auto_21959 ) ) ( not ( = ?auto_21920 ?auto_21941 ) ) ( not ( = ?auto_21920 ?auto_21936 ) ) ( not ( = ?auto_21920 ?auto_21960 ) ) ( not ( = ?auto_21948 ?auto_21953 ) ) ( not ( = ?auto_21948 ?auto_21958 ) ) ( not ( = ?auto_21948 ?auto_21962 ) ) ( not ( = ?auto_21948 ?auto_21952 ) ) ( not ( = ?auto_21940 ?auto_21938 ) ) ( not ( = ?auto_21940 ?auto_21944 ) ) ( not ( = ?auto_21940 ?auto_21950 ) ) ( not ( = ?auto_21940 ?auto_21955 ) ) ( not ( = ?auto_21957 ?auto_21959 ) ) ( not ( = ?auto_21957 ?auto_21941 ) ) ( not ( = ?auto_21957 ?auto_21936 ) ) ( not ( = ?auto_21957 ?auto_21960 ) ) ( not ( = ?auto_21915 ?auto_21921 ) ) ( not ( = ?auto_21915 ?auto_21956 ) ) ( not ( = ?auto_21916 ?auto_21921 ) ) ( not ( = ?auto_21916 ?auto_21956 ) ) ( not ( = ?auto_21917 ?auto_21921 ) ) ( not ( = ?auto_21917 ?auto_21956 ) ) ( not ( = ?auto_21918 ?auto_21921 ) ) ( not ( = ?auto_21918 ?auto_21956 ) ) ( not ( = ?auto_21919 ?auto_21921 ) ) ( not ( = ?auto_21919 ?auto_21956 ) ) ( not ( = ?auto_21921 ?auto_21957 ) ) ( not ( = ?auto_21921 ?auto_21959 ) ) ( not ( = ?auto_21921 ?auto_21941 ) ) ( not ( = ?auto_21921 ?auto_21936 ) ) ( not ( = ?auto_21921 ?auto_21960 ) ) ( not ( = ?auto_21961 ?auto_21948 ) ) ( not ( = ?auto_21961 ?auto_21953 ) ) ( not ( = ?auto_21961 ?auto_21958 ) ) ( not ( = ?auto_21961 ?auto_21962 ) ) ( not ( = ?auto_21961 ?auto_21952 ) ) ( not ( = ?auto_21945 ?auto_21940 ) ) ( not ( = ?auto_21945 ?auto_21938 ) ) ( not ( = ?auto_21945 ?auto_21944 ) ) ( not ( = ?auto_21945 ?auto_21950 ) ) ( not ( = ?auto_21945 ?auto_21955 ) ) ( not ( = ?auto_21956 ?auto_21957 ) ) ( not ( = ?auto_21956 ?auto_21959 ) ) ( not ( = ?auto_21956 ?auto_21941 ) ) ( not ( = ?auto_21956 ?auto_21936 ) ) ( not ( = ?auto_21956 ?auto_21960 ) ) ( not ( = ?auto_21915 ?auto_21922 ) ) ( not ( = ?auto_21915 ?auto_21943 ) ) ( not ( = ?auto_21916 ?auto_21922 ) ) ( not ( = ?auto_21916 ?auto_21943 ) ) ( not ( = ?auto_21917 ?auto_21922 ) ) ( not ( = ?auto_21917 ?auto_21943 ) ) ( not ( = ?auto_21918 ?auto_21922 ) ) ( not ( = ?auto_21918 ?auto_21943 ) ) ( not ( = ?auto_21919 ?auto_21922 ) ) ( not ( = ?auto_21919 ?auto_21943 ) ) ( not ( = ?auto_21920 ?auto_21922 ) ) ( not ( = ?auto_21920 ?auto_21943 ) ) ( not ( = ?auto_21922 ?auto_21956 ) ) ( not ( = ?auto_21922 ?auto_21957 ) ) ( not ( = ?auto_21922 ?auto_21959 ) ) ( not ( = ?auto_21922 ?auto_21941 ) ) ( not ( = ?auto_21922 ?auto_21936 ) ) ( not ( = ?auto_21922 ?auto_21960 ) ) ( not ( = ?auto_21949 ?auto_21961 ) ) ( not ( = ?auto_21949 ?auto_21948 ) ) ( not ( = ?auto_21949 ?auto_21953 ) ) ( not ( = ?auto_21949 ?auto_21958 ) ) ( not ( = ?auto_21949 ?auto_21962 ) ) ( not ( = ?auto_21949 ?auto_21952 ) ) ( not ( = ?auto_21947 ?auto_21945 ) ) ( not ( = ?auto_21947 ?auto_21940 ) ) ( not ( = ?auto_21947 ?auto_21938 ) ) ( not ( = ?auto_21947 ?auto_21944 ) ) ( not ( = ?auto_21947 ?auto_21950 ) ) ( not ( = ?auto_21947 ?auto_21955 ) ) ( not ( = ?auto_21943 ?auto_21956 ) ) ( not ( = ?auto_21943 ?auto_21957 ) ) ( not ( = ?auto_21943 ?auto_21959 ) ) ( not ( = ?auto_21943 ?auto_21941 ) ) ( not ( = ?auto_21943 ?auto_21936 ) ) ( not ( = ?auto_21943 ?auto_21960 ) ) ( not ( = ?auto_21915 ?auto_21923 ) ) ( not ( = ?auto_21915 ?auto_21935 ) ) ( not ( = ?auto_21916 ?auto_21923 ) ) ( not ( = ?auto_21916 ?auto_21935 ) ) ( not ( = ?auto_21917 ?auto_21923 ) ) ( not ( = ?auto_21917 ?auto_21935 ) ) ( not ( = ?auto_21918 ?auto_21923 ) ) ( not ( = ?auto_21918 ?auto_21935 ) ) ( not ( = ?auto_21919 ?auto_21923 ) ) ( not ( = ?auto_21919 ?auto_21935 ) ) ( not ( = ?auto_21920 ?auto_21923 ) ) ( not ( = ?auto_21920 ?auto_21935 ) ) ( not ( = ?auto_21921 ?auto_21923 ) ) ( not ( = ?auto_21921 ?auto_21935 ) ) ( not ( = ?auto_21923 ?auto_21943 ) ) ( not ( = ?auto_21923 ?auto_21956 ) ) ( not ( = ?auto_21923 ?auto_21957 ) ) ( not ( = ?auto_21923 ?auto_21959 ) ) ( not ( = ?auto_21923 ?auto_21941 ) ) ( not ( = ?auto_21923 ?auto_21936 ) ) ( not ( = ?auto_21923 ?auto_21960 ) ) ( not ( = ?auto_21942 ?auto_21949 ) ) ( not ( = ?auto_21942 ?auto_21961 ) ) ( not ( = ?auto_21942 ?auto_21948 ) ) ( not ( = ?auto_21942 ?auto_21953 ) ) ( not ( = ?auto_21942 ?auto_21958 ) ) ( not ( = ?auto_21942 ?auto_21962 ) ) ( not ( = ?auto_21942 ?auto_21952 ) ) ( not ( = ?auto_21954 ?auto_21947 ) ) ( not ( = ?auto_21954 ?auto_21945 ) ) ( not ( = ?auto_21954 ?auto_21940 ) ) ( not ( = ?auto_21954 ?auto_21938 ) ) ( not ( = ?auto_21954 ?auto_21944 ) ) ( not ( = ?auto_21954 ?auto_21950 ) ) ( not ( = ?auto_21954 ?auto_21955 ) ) ( not ( = ?auto_21935 ?auto_21943 ) ) ( not ( = ?auto_21935 ?auto_21956 ) ) ( not ( = ?auto_21935 ?auto_21957 ) ) ( not ( = ?auto_21935 ?auto_21959 ) ) ( not ( = ?auto_21935 ?auto_21941 ) ) ( not ( = ?auto_21935 ?auto_21936 ) ) ( not ( = ?auto_21935 ?auto_21960 ) ) ( not ( = ?auto_21915 ?auto_21924 ) ) ( not ( = ?auto_21915 ?auto_21937 ) ) ( not ( = ?auto_21916 ?auto_21924 ) ) ( not ( = ?auto_21916 ?auto_21937 ) ) ( not ( = ?auto_21917 ?auto_21924 ) ) ( not ( = ?auto_21917 ?auto_21937 ) ) ( not ( = ?auto_21918 ?auto_21924 ) ) ( not ( = ?auto_21918 ?auto_21937 ) ) ( not ( = ?auto_21919 ?auto_21924 ) ) ( not ( = ?auto_21919 ?auto_21937 ) ) ( not ( = ?auto_21920 ?auto_21924 ) ) ( not ( = ?auto_21920 ?auto_21937 ) ) ( not ( = ?auto_21921 ?auto_21924 ) ) ( not ( = ?auto_21921 ?auto_21937 ) ) ( not ( = ?auto_21922 ?auto_21924 ) ) ( not ( = ?auto_21922 ?auto_21937 ) ) ( not ( = ?auto_21924 ?auto_21935 ) ) ( not ( = ?auto_21924 ?auto_21943 ) ) ( not ( = ?auto_21924 ?auto_21956 ) ) ( not ( = ?auto_21924 ?auto_21957 ) ) ( not ( = ?auto_21924 ?auto_21959 ) ) ( not ( = ?auto_21924 ?auto_21941 ) ) ( not ( = ?auto_21924 ?auto_21936 ) ) ( not ( = ?auto_21924 ?auto_21960 ) ) ( not ( = ?auto_21937 ?auto_21935 ) ) ( not ( = ?auto_21937 ?auto_21943 ) ) ( not ( = ?auto_21937 ?auto_21956 ) ) ( not ( = ?auto_21937 ?auto_21957 ) ) ( not ( = ?auto_21937 ?auto_21959 ) ) ( not ( = ?auto_21937 ?auto_21941 ) ) ( not ( = ?auto_21937 ?auto_21936 ) ) ( not ( = ?auto_21937 ?auto_21960 ) ) ( not ( = ?auto_21915 ?auto_21925 ) ) ( not ( = ?auto_21915 ?auto_21951 ) ) ( not ( = ?auto_21916 ?auto_21925 ) ) ( not ( = ?auto_21916 ?auto_21951 ) ) ( not ( = ?auto_21917 ?auto_21925 ) ) ( not ( = ?auto_21917 ?auto_21951 ) ) ( not ( = ?auto_21918 ?auto_21925 ) ) ( not ( = ?auto_21918 ?auto_21951 ) ) ( not ( = ?auto_21919 ?auto_21925 ) ) ( not ( = ?auto_21919 ?auto_21951 ) ) ( not ( = ?auto_21920 ?auto_21925 ) ) ( not ( = ?auto_21920 ?auto_21951 ) ) ( not ( = ?auto_21921 ?auto_21925 ) ) ( not ( = ?auto_21921 ?auto_21951 ) ) ( not ( = ?auto_21922 ?auto_21925 ) ) ( not ( = ?auto_21922 ?auto_21951 ) ) ( not ( = ?auto_21923 ?auto_21925 ) ) ( not ( = ?auto_21923 ?auto_21951 ) ) ( not ( = ?auto_21925 ?auto_21937 ) ) ( not ( = ?auto_21925 ?auto_21935 ) ) ( not ( = ?auto_21925 ?auto_21943 ) ) ( not ( = ?auto_21925 ?auto_21956 ) ) ( not ( = ?auto_21925 ?auto_21957 ) ) ( not ( = ?auto_21925 ?auto_21959 ) ) ( not ( = ?auto_21925 ?auto_21941 ) ) ( not ( = ?auto_21925 ?auto_21936 ) ) ( not ( = ?auto_21925 ?auto_21960 ) ) ( not ( = ?auto_21951 ?auto_21937 ) ) ( not ( = ?auto_21951 ?auto_21935 ) ) ( not ( = ?auto_21951 ?auto_21943 ) ) ( not ( = ?auto_21951 ?auto_21956 ) ) ( not ( = ?auto_21951 ?auto_21957 ) ) ( not ( = ?auto_21951 ?auto_21959 ) ) ( not ( = ?auto_21951 ?auto_21941 ) ) ( not ( = ?auto_21951 ?auto_21936 ) ) ( not ( = ?auto_21951 ?auto_21960 ) ) ( not ( = ?auto_21915 ?auto_21926 ) ) ( not ( = ?auto_21915 ?auto_21946 ) ) ( not ( = ?auto_21916 ?auto_21926 ) ) ( not ( = ?auto_21916 ?auto_21946 ) ) ( not ( = ?auto_21917 ?auto_21926 ) ) ( not ( = ?auto_21917 ?auto_21946 ) ) ( not ( = ?auto_21918 ?auto_21926 ) ) ( not ( = ?auto_21918 ?auto_21946 ) ) ( not ( = ?auto_21919 ?auto_21926 ) ) ( not ( = ?auto_21919 ?auto_21946 ) ) ( not ( = ?auto_21920 ?auto_21926 ) ) ( not ( = ?auto_21920 ?auto_21946 ) ) ( not ( = ?auto_21921 ?auto_21926 ) ) ( not ( = ?auto_21921 ?auto_21946 ) ) ( not ( = ?auto_21922 ?auto_21926 ) ) ( not ( = ?auto_21922 ?auto_21946 ) ) ( not ( = ?auto_21923 ?auto_21926 ) ) ( not ( = ?auto_21923 ?auto_21946 ) ) ( not ( = ?auto_21924 ?auto_21926 ) ) ( not ( = ?auto_21924 ?auto_21946 ) ) ( not ( = ?auto_21926 ?auto_21951 ) ) ( not ( = ?auto_21926 ?auto_21937 ) ) ( not ( = ?auto_21926 ?auto_21935 ) ) ( not ( = ?auto_21926 ?auto_21943 ) ) ( not ( = ?auto_21926 ?auto_21956 ) ) ( not ( = ?auto_21926 ?auto_21957 ) ) ( not ( = ?auto_21926 ?auto_21959 ) ) ( not ( = ?auto_21926 ?auto_21941 ) ) ( not ( = ?auto_21926 ?auto_21936 ) ) ( not ( = ?auto_21926 ?auto_21960 ) ) ( not ( = ?auto_21946 ?auto_21951 ) ) ( not ( = ?auto_21946 ?auto_21937 ) ) ( not ( = ?auto_21946 ?auto_21935 ) ) ( not ( = ?auto_21946 ?auto_21943 ) ) ( not ( = ?auto_21946 ?auto_21956 ) ) ( not ( = ?auto_21946 ?auto_21957 ) ) ( not ( = ?auto_21946 ?auto_21959 ) ) ( not ( = ?auto_21946 ?auto_21941 ) ) ( not ( = ?auto_21946 ?auto_21936 ) ) ( not ( = ?auto_21946 ?auto_21960 ) ) ( not ( = ?auto_21915 ?auto_21927 ) ) ( not ( = ?auto_21915 ?auto_21939 ) ) ( not ( = ?auto_21916 ?auto_21927 ) ) ( not ( = ?auto_21916 ?auto_21939 ) ) ( not ( = ?auto_21917 ?auto_21927 ) ) ( not ( = ?auto_21917 ?auto_21939 ) ) ( not ( = ?auto_21918 ?auto_21927 ) ) ( not ( = ?auto_21918 ?auto_21939 ) ) ( not ( = ?auto_21919 ?auto_21927 ) ) ( not ( = ?auto_21919 ?auto_21939 ) ) ( not ( = ?auto_21920 ?auto_21927 ) ) ( not ( = ?auto_21920 ?auto_21939 ) ) ( not ( = ?auto_21921 ?auto_21927 ) ) ( not ( = ?auto_21921 ?auto_21939 ) ) ( not ( = ?auto_21922 ?auto_21927 ) ) ( not ( = ?auto_21922 ?auto_21939 ) ) ( not ( = ?auto_21923 ?auto_21927 ) ) ( not ( = ?auto_21923 ?auto_21939 ) ) ( not ( = ?auto_21924 ?auto_21927 ) ) ( not ( = ?auto_21924 ?auto_21939 ) ) ( not ( = ?auto_21925 ?auto_21927 ) ) ( not ( = ?auto_21925 ?auto_21939 ) ) ( not ( = ?auto_21927 ?auto_21946 ) ) ( not ( = ?auto_21927 ?auto_21951 ) ) ( not ( = ?auto_21927 ?auto_21937 ) ) ( not ( = ?auto_21927 ?auto_21935 ) ) ( not ( = ?auto_21927 ?auto_21943 ) ) ( not ( = ?auto_21927 ?auto_21956 ) ) ( not ( = ?auto_21927 ?auto_21957 ) ) ( not ( = ?auto_21927 ?auto_21959 ) ) ( not ( = ?auto_21927 ?auto_21941 ) ) ( not ( = ?auto_21927 ?auto_21936 ) ) ( not ( = ?auto_21927 ?auto_21960 ) ) ( not ( = ?auto_21939 ?auto_21946 ) ) ( not ( = ?auto_21939 ?auto_21951 ) ) ( not ( = ?auto_21939 ?auto_21937 ) ) ( not ( = ?auto_21939 ?auto_21935 ) ) ( not ( = ?auto_21939 ?auto_21943 ) ) ( not ( = ?auto_21939 ?auto_21956 ) ) ( not ( = ?auto_21939 ?auto_21957 ) ) ( not ( = ?auto_21939 ?auto_21959 ) ) ( not ( = ?auto_21939 ?auto_21941 ) ) ( not ( = ?auto_21939 ?auto_21936 ) ) ( not ( = ?auto_21939 ?auto_21960 ) ) ( not ( = ?auto_21915 ?auto_21928 ) ) ( not ( = ?auto_21915 ?auto_21929 ) ) ( not ( = ?auto_21916 ?auto_21928 ) ) ( not ( = ?auto_21916 ?auto_21929 ) ) ( not ( = ?auto_21917 ?auto_21928 ) ) ( not ( = ?auto_21917 ?auto_21929 ) ) ( not ( = ?auto_21918 ?auto_21928 ) ) ( not ( = ?auto_21918 ?auto_21929 ) ) ( not ( = ?auto_21919 ?auto_21928 ) ) ( not ( = ?auto_21919 ?auto_21929 ) ) ( not ( = ?auto_21920 ?auto_21928 ) ) ( not ( = ?auto_21920 ?auto_21929 ) ) ( not ( = ?auto_21921 ?auto_21928 ) ) ( not ( = ?auto_21921 ?auto_21929 ) ) ( not ( = ?auto_21922 ?auto_21928 ) ) ( not ( = ?auto_21922 ?auto_21929 ) ) ( not ( = ?auto_21923 ?auto_21928 ) ) ( not ( = ?auto_21923 ?auto_21929 ) ) ( not ( = ?auto_21924 ?auto_21928 ) ) ( not ( = ?auto_21924 ?auto_21929 ) ) ( not ( = ?auto_21925 ?auto_21928 ) ) ( not ( = ?auto_21925 ?auto_21929 ) ) ( not ( = ?auto_21926 ?auto_21928 ) ) ( not ( = ?auto_21926 ?auto_21929 ) ) ( not ( = ?auto_21928 ?auto_21939 ) ) ( not ( = ?auto_21928 ?auto_21946 ) ) ( not ( = ?auto_21928 ?auto_21951 ) ) ( not ( = ?auto_21928 ?auto_21937 ) ) ( not ( = ?auto_21928 ?auto_21935 ) ) ( not ( = ?auto_21928 ?auto_21943 ) ) ( not ( = ?auto_21928 ?auto_21956 ) ) ( not ( = ?auto_21928 ?auto_21957 ) ) ( not ( = ?auto_21928 ?auto_21959 ) ) ( not ( = ?auto_21928 ?auto_21941 ) ) ( not ( = ?auto_21928 ?auto_21936 ) ) ( not ( = ?auto_21928 ?auto_21960 ) ) ( not ( = ?auto_21930 ?auto_21948 ) ) ( not ( = ?auto_21930 ?auto_21962 ) ) ( not ( = ?auto_21930 ?auto_21958 ) ) ( not ( = ?auto_21930 ?auto_21952 ) ) ( not ( = ?auto_21930 ?auto_21942 ) ) ( not ( = ?auto_21930 ?auto_21949 ) ) ( not ( = ?auto_21930 ?auto_21961 ) ) ( not ( = ?auto_21930 ?auto_21953 ) ) ( not ( = ?auto_21932 ?auto_21940 ) ) ( not ( = ?auto_21932 ?auto_21950 ) ) ( not ( = ?auto_21932 ?auto_21944 ) ) ( not ( = ?auto_21932 ?auto_21955 ) ) ( not ( = ?auto_21932 ?auto_21954 ) ) ( not ( = ?auto_21932 ?auto_21947 ) ) ( not ( = ?auto_21932 ?auto_21945 ) ) ( not ( = ?auto_21932 ?auto_21938 ) ) ( not ( = ?auto_21929 ?auto_21939 ) ) ( not ( = ?auto_21929 ?auto_21946 ) ) ( not ( = ?auto_21929 ?auto_21951 ) ) ( not ( = ?auto_21929 ?auto_21937 ) ) ( not ( = ?auto_21929 ?auto_21935 ) ) ( not ( = ?auto_21929 ?auto_21943 ) ) ( not ( = ?auto_21929 ?auto_21956 ) ) ( not ( = ?auto_21929 ?auto_21957 ) ) ( not ( = ?auto_21929 ?auto_21959 ) ) ( not ( = ?auto_21929 ?auto_21941 ) ) ( not ( = ?auto_21929 ?auto_21936 ) ) ( not ( = ?auto_21929 ?auto_21960 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_21915 ?auto_21916 ?auto_21917 ?auto_21918 ?auto_21919 ?auto_21920 ?auto_21921 ?auto_21922 ?auto_21923 ?auto_21924 ?auto_21925 ?auto_21926 ?auto_21927 )
      ( MAKE-1CRATE ?auto_21927 ?auto_21928 )
      ( MAKE-13CRATE-VERIFY ?auto_21915 ?auto_21916 ?auto_21917 ?auto_21918 ?auto_21919 ?auto_21920 ?auto_21921 ?auto_21922 ?auto_21923 ?auto_21924 ?auto_21925 ?auto_21926 ?auto_21927 ?auto_21928 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_21988 - SURFACE
      ?auto_21989 - SURFACE
      ?auto_21990 - SURFACE
      ?auto_21991 - SURFACE
      ?auto_21992 - SURFACE
      ?auto_21993 - SURFACE
      ?auto_21994 - SURFACE
      ?auto_21995 - SURFACE
      ?auto_21996 - SURFACE
      ?auto_21997 - SURFACE
      ?auto_21998 - SURFACE
      ?auto_21999 - SURFACE
      ?auto_22000 - SURFACE
      ?auto_22001 - SURFACE
      ?auto_22002 - SURFACE
    )
    :vars
    (
      ?auto_22006 - HOIST
      ?auto_22007 - PLACE
      ?auto_22005 - PLACE
      ?auto_22003 - HOIST
      ?auto_22008 - SURFACE
      ?auto_22015 - PLACE
      ?auto_22024 - HOIST
      ?auto_22017 - SURFACE
      ?auto_22035 - PLACE
      ?auto_22023 - HOIST
      ?auto_22031 - SURFACE
      ?auto_22025 - PLACE
      ?auto_22021 - HOIST
      ?auto_22034 - SURFACE
      ?auto_22027 - PLACE
      ?auto_22016 - HOIST
      ?auto_22020 - SURFACE
      ?auto_22026 - PLACE
      ?auto_22038 - HOIST
      ?auto_22036 - SURFACE
      ?auto_22018 - PLACE
      ?auto_22012 - HOIST
      ?auto_22029 - SURFACE
      ?auto_22032 - PLACE
      ?auto_22010 - HOIST
      ?auto_22028 - SURFACE
      ?auto_22009 - PLACE
      ?auto_22011 - HOIST
      ?auto_22033 - SURFACE
      ?auto_22030 - SURFACE
      ?auto_22022 - PLACE
      ?auto_22013 - HOIST
      ?auto_22037 - SURFACE
      ?auto_22019 - SURFACE
      ?auto_22014 - SURFACE
      ?auto_22039 - SURFACE
      ?auto_22004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22006 ?auto_22007 ) ( IS-CRATE ?auto_22002 ) ( not ( = ?auto_22005 ?auto_22007 ) ) ( HOIST-AT ?auto_22003 ?auto_22005 ) ( AVAILABLE ?auto_22003 ) ( SURFACE-AT ?auto_22002 ?auto_22005 ) ( ON ?auto_22002 ?auto_22008 ) ( CLEAR ?auto_22002 ) ( not ( = ?auto_22001 ?auto_22002 ) ) ( not ( = ?auto_22001 ?auto_22008 ) ) ( not ( = ?auto_22002 ?auto_22008 ) ) ( not ( = ?auto_22006 ?auto_22003 ) ) ( IS-CRATE ?auto_22001 ) ( not ( = ?auto_22015 ?auto_22007 ) ) ( HOIST-AT ?auto_22024 ?auto_22015 ) ( AVAILABLE ?auto_22024 ) ( SURFACE-AT ?auto_22001 ?auto_22015 ) ( ON ?auto_22001 ?auto_22017 ) ( CLEAR ?auto_22001 ) ( not ( = ?auto_22000 ?auto_22001 ) ) ( not ( = ?auto_22000 ?auto_22017 ) ) ( not ( = ?auto_22001 ?auto_22017 ) ) ( not ( = ?auto_22006 ?auto_22024 ) ) ( IS-CRATE ?auto_22000 ) ( not ( = ?auto_22035 ?auto_22007 ) ) ( HOIST-AT ?auto_22023 ?auto_22035 ) ( SURFACE-AT ?auto_22000 ?auto_22035 ) ( ON ?auto_22000 ?auto_22031 ) ( CLEAR ?auto_22000 ) ( not ( = ?auto_21999 ?auto_22000 ) ) ( not ( = ?auto_21999 ?auto_22031 ) ) ( not ( = ?auto_22000 ?auto_22031 ) ) ( not ( = ?auto_22006 ?auto_22023 ) ) ( IS-CRATE ?auto_21999 ) ( not ( = ?auto_22025 ?auto_22007 ) ) ( HOIST-AT ?auto_22021 ?auto_22025 ) ( SURFACE-AT ?auto_21999 ?auto_22025 ) ( ON ?auto_21999 ?auto_22034 ) ( CLEAR ?auto_21999 ) ( not ( = ?auto_21998 ?auto_21999 ) ) ( not ( = ?auto_21998 ?auto_22034 ) ) ( not ( = ?auto_21999 ?auto_22034 ) ) ( not ( = ?auto_22006 ?auto_22021 ) ) ( IS-CRATE ?auto_21998 ) ( not ( = ?auto_22027 ?auto_22007 ) ) ( HOIST-AT ?auto_22016 ?auto_22027 ) ( SURFACE-AT ?auto_21998 ?auto_22027 ) ( ON ?auto_21998 ?auto_22020 ) ( CLEAR ?auto_21998 ) ( not ( = ?auto_21997 ?auto_21998 ) ) ( not ( = ?auto_21997 ?auto_22020 ) ) ( not ( = ?auto_21998 ?auto_22020 ) ) ( not ( = ?auto_22006 ?auto_22016 ) ) ( IS-CRATE ?auto_21997 ) ( not ( = ?auto_22026 ?auto_22007 ) ) ( HOIST-AT ?auto_22038 ?auto_22026 ) ( SURFACE-AT ?auto_21997 ?auto_22026 ) ( ON ?auto_21997 ?auto_22036 ) ( CLEAR ?auto_21997 ) ( not ( = ?auto_21996 ?auto_21997 ) ) ( not ( = ?auto_21996 ?auto_22036 ) ) ( not ( = ?auto_21997 ?auto_22036 ) ) ( not ( = ?auto_22006 ?auto_22038 ) ) ( IS-CRATE ?auto_21996 ) ( not ( = ?auto_22018 ?auto_22007 ) ) ( HOIST-AT ?auto_22012 ?auto_22018 ) ( AVAILABLE ?auto_22012 ) ( SURFACE-AT ?auto_21996 ?auto_22018 ) ( ON ?auto_21996 ?auto_22029 ) ( CLEAR ?auto_21996 ) ( not ( = ?auto_21995 ?auto_21996 ) ) ( not ( = ?auto_21995 ?auto_22029 ) ) ( not ( = ?auto_21996 ?auto_22029 ) ) ( not ( = ?auto_22006 ?auto_22012 ) ) ( IS-CRATE ?auto_21995 ) ( not ( = ?auto_22032 ?auto_22007 ) ) ( HOIST-AT ?auto_22010 ?auto_22032 ) ( AVAILABLE ?auto_22010 ) ( SURFACE-AT ?auto_21995 ?auto_22032 ) ( ON ?auto_21995 ?auto_22028 ) ( CLEAR ?auto_21995 ) ( not ( = ?auto_21994 ?auto_21995 ) ) ( not ( = ?auto_21994 ?auto_22028 ) ) ( not ( = ?auto_21995 ?auto_22028 ) ) ( not ( = ?auto_22006 ?auto_22010 ) ) ( IS-CRATE ?auto_21994 ) ( not ( = ?auto_22009 ?auto_22007 ) ) ( HOIST-AT ?auto_22011 ?auto_22009 ) ( AVAILABLE ?auto_22011 ) ( SURFACE-AT ?auto_21994 ?auto_22009 ) ( ON ?auto_21994 ?auto_22033 ) ( CLEAR ?auto_21994 ) ( not ( = ?auto_21993 ?auto_21994 ) ) ( not ( = ?auto_21993 ?auto_22033 ) ) ( not ( = ?auto_21994 ?auto_22033 ) ) ( not ( = ?auto_22006 ?auto_22011 ) ) ( IS-CRATE ?auto_21993 ) ( AVAILABLE ?auto_22023 ) ( SURFACE-AT ?auto_21993 ?auto_22035 ) ( ON ?auto_21993 ?auto_22030 ) ( CLEAR ?auto_21993 ) ( not ( = ?auto_21992 ?auto_21993 ) ) ( not ( = ?auto_21992 ?auto_22030 ) ) ( not ( = ?auto_21993 ?auto_22030 ) ) ( IS-CRATE ?auto_21992 ) ( not ( = ?auto_22022 ?auto_22007 ) ) ( HOIST-AT ?auto_22013 ?auto_22022 ) ( AVAILABLE ?auto_22013 ) ( SURFACE-AT ?auto_21992 ?auto_22022 ) ( ON ?auto_21992 ?auto_22037 ) ( CLEAR ?auto_21992 ) ( not ( = ?auto_21991 ?auto_21992 ) ) ( not ( = ?auto_21991 ?auto_22037 ) ) ( not ( = ?auto_21992 ?auto_22037 ) ) ( not ( = ?auto_22006 ?auto_22013 ) ) ( IS-CRATE ?auto_21991 ) ( AVAILABLE ?auto_22016 ) ( SURFACE-AT ?auto_21991 ?auto_22027 ) ( ON ?auto_21991 ?auto_22019 ) ( CLEAR ?auto_21991 ) ( not ( = ?auto_21990 ?auto_21991 ) ) ( not ( = ?auto_21990 ?auto_22019 ) ) ( not ( = ?auto_21991 ?auto_22019 ) ) ( IS-CRATE ?auto_21990 ) ( AVAILABLE ?auto_22021 ) ( SURFACE-AT ?auto_21990 ?auto_22025 ) ( ON ?auto_21990 ?auto_22014 ) ( CLEAR ?auto_21990 ) ( not ( = ?auto_21989 ?auto_21990 ) ) ( not ( = ?auto_21989 ?auto_22014 ) ) ( not ( = ?auto_21990 ?auto_22014 ) ) ( SURFACE-AT ?auto_21988 ?auto_22007 ) ( CLEAR ?auto_21988 ) ( IS-CRATE ?auto_21989 ) ( AVAILABLE ?auto_22006 ) ( AVAILABLE ?auto_22038 ) ( SURFACE-AT ?auto_21989 ?auto_22026 ) ( ON ?auto_21989 ?auto_22039 ) ( CLEAR ?auto_21989 ) ( TRUCK-AT ?auto_22004 ?auto_22007 ) ( not ( = ?auto_21988 ?auto_21989 ) ) ( not ( = ?auto_21988 ?auto_22039 ) ) ( not ( = ?auto_21989 ?auto_22039 ) ) ( not ( = ?auto_21988 ?auto_21990 ) ) ( not ( = ?auto_21988 ?auto_22014 ) ) ( not ( = ?auto_21990 ?auto_22039 ) ) ( not ( = ?auto_22025 ?auto_22026 ) ) ( not ( = ?auto_22021 ?auto_22038 ) ) ( not ( = ?auto_22014 ?auto_22039 ) ) ( not ( = ?auto_21988 ?auto_21991 ) ) ( not ( = ?auto_21988 ?auto_22019 ) ) ( not ( = ?auto_21989 ?auto_21991 ) ) ( not ( = ?auto_21989 ?auto_22019 ) ) ( not ( = ?auto_21991 ?auto_22014 ) ) ( not ( = ?auto_21991 ?auto_22039 ) ) ( not ( = ?auto_22027 ?auto_22025 ) ) ( not ( = ?auto_22027 ?auto_22026 ) ) ( not ( = ?auto_22016 ?auto_22021 ) ) ( not ( = ?auto_22016 ?auto_22038 ) ) ( not ( = ?auto_22019 ?auto_22014 ) ) ( not ( = ?auto_22019 ?auto_22039 ) ) ( not ( = ?auto_21988 ?auto_21992 ) ) ( not ( = ?auto_21988 ?auto_22037 ) ) ( not ( = ?auto_21989 ?auto_21992 ) ) ( not ( = ?auto_21989 ?auto_22037 ) ) ( not ( = ?auto_21990 ?auto_21992 ) ) ( not ( = ?auto_21990 ?auto_22037 ) ) ( not ( = ?auto_21992 ?auto_22019 ) ) ( not ( = ?auto_21992 ?auto_22014 ) ) ( not ( = ?auto_21992 ?auto_22039 ) ) ( not ( = ?auto_22022 ?auto_22027 ) ) ( not ( = ?auto_22022 ?auto_22025 ) ) ( not ( = ?auto_22022 ?auto_22026 ) ) ( not ( = ?auto_22013 ?auto_22016 ) ) ( not ( = ?auto_22013 ?auto_22021 ) ) ( not ( = ?auto_22013 ?auto_22038 ) ) ( not ( = ?auto_22037 ?auto_22019 ) ) ( not ( = ?auto_22037 ?auto_22014 ) ) ( not ( = ?auto_22037 ?auto_22039 ) ) ( not ( = ?auto_21988 ?auto_21993 ) ) ( not ( = ?auto_21988 ?auto_22030 ) ) ( not ( = ?auto_21989 ?auto_21993 ) ) ( not ( = ?auto_21989 ?auto_22030 ) ) ( not ( = ?auto_21990 ?auto_21993 ) ) ( not ( = ?auto_21990 ?auto_22030 ) ) ( not ( = ?auto_21991 ?auto_21993 ) ) ( not ( = ?auto_21991 ?auto_22030 ) ) ( not ( = ?auto_21993 ?auto_22037 ) ) ( not ( = ?auto_21993 ?auto_22019 ) ) ( not ( = ?auto_21993 ?auto_22014 ) ) ( not ( = ?auto_21993 ?auto_22039 ) ) ( not ( = ?auto_22035 ?auto_22022 ) ) ( not ( = ?auto_22035 ?auto_22027 ) ) ( not ( = ?auto_22035 ?auto_22025 ) ) ( not ( = ?auto_22035 ?auto_22026 ) ) ( not ( = ?auto_22023 ?auto_22013 ) ) ( not ( = ?auto_22023 ?auto_22016 ) ) ( not ( = ?auto_22023 ?auto_22021 ) ) ( not ( = ?auto_22023 ?auto_22038 ) ) ( not ( = ?auto_22030 ?auto_22037 ) ) ( not ( = ?auto_22030 ?auto_22019 ) ) ( not ( = ?auto_22030 ?auto_22014 ) ) ( not ( = ?auto_22030 ?auto_22039 ) ) ( not ( = ?auto_21988 ?auto_21994 ) ) ( not ( = ?auto_21988 ?auto_22033 ) ) ( not ( = ?auto_21989 ?auto_21994 ) ) ( not ( = ?auto_21989 ?auto_22033 ) ) ( not ( = ?auto_21990 ?auto_21994 ) ) ( not ( = ?auto_21990 ?auto_22033 ) ) ( not ( = ?auto_21991 ?auto_21994 ) ) ( not ( = ?auto_21991 ?auto_22033 ) ) ( not ( = ?auto_21992 ?auto_21994 ) ) ( not ( = ?auto_21992 ?auto_22033 ) ) ( not ( = ?auto_21994 ?auto_22030 ) ) ( not ( = ?auto_21994 ?auto_22037 ) ) ( not ( = ?auto_21994 ?auto_22019 ) ) ( not ( = ?auto_21994 ?auto_22014 ) ) ( not ( = ?auto_21994 ?auto_22039 ) ) ( not ( = ?auto_22009 ?auto_22035 ) ) ( not ( = ?auto_22009 ?auto_22022 ) ) ( not ( = ?auto_22009 ?auto_22027 ) ) ( not ( = ?auto_22009 ?auto_22025 ) ) ( not ( = ?auto_22009 ?auto_22026 ) ) ( not ( = ?auto_22011 ?auto_22023 ) ) ( not ( = ?auto_22011 ?auto_22013 ) ) ( not ( = ?auto_22011 ?auto_22016 ) ) ( not ( = ?auto_22011 ?auto_22021 ) ) ( not ( = ?auto_22011 ?auto_22038 ) ) ( not ( = ?auto_22033 ?auto_22030 ) ) ( not ( = ?auto_22033 ?auto_22037 ) ) ( not ( = ?auto_22033 ?auto_22019 ) ) ( not ( = ?auto_22033 ?auto_22014 ) ) ( not ( = ?auto_22033 ?auto_22039 ) ) ( not ( = ?auto_21988 ?auto_21995 ) ) ( not ( = ?auto_21988 ?auto_22028 ) ) ( not ( = ?auto_21989 ?auto_21995 ) ) ( not ( = ?auto_21989 ?auto_22028 ) ) ( not ( = ?auto_21990 ?auto_21995 ) ) ( not ( = ?auto_21990 ?auto_22028 ) ) ( not ( = ?auto_21991 ?auto_21995 ) ) ( not ( = ?auto_21991 ?auto_22028 ) ) ( not ( = ?auto_21992 ?auto_21995 ) ) ( not ( = ?auto_21992 ?auto_22028 ) ) ( not ( = ?auto_21993 ?auto_21995 ) ) ( not ( = ?auto_21993 ?auto_22028 ) ) ( not ( = ?auto_21995 ?auto_22033 ) ) ( not ( = ?auto_21995 ?auto_22030 ) ) ( not ( = ?auto_21995 ?auto_22037 ) ) ( not ( = ?auto_21995 ?auto_22019 ) ) ( not ( = ?auto_21995 ?auto_22014 ) ) ( not ( = ?auto_21995 ?auto_22039 ) ) ( not ( = ?auto_22032 ?auto_22009 ) ) ( not ( = ?auto_22032 ?auto_22035 ) ) ( not ( = ?auto_22032 ?auto_22022 ) ) ( not ( = ?auto_22032 ?auto_22027 ) ) ( not ( = ?auto_22032 ?auto_22025 ) ) ( not ( = ?auto_22032 ?auto_22026 ) ) ( not ( = ?auto_22010 ?auto_22011 ) ) ( not ( = ?auto_22010 ?auto_22023 ) ) ( not ( = ?auto_22010 ?auto_22013 ) ) ( not ( = ?auto_22010 ?auto_22016 ) ) ( not ( = ?auto_22010 ?auto_22021 ) ) ( not ( = ?auto_22010 ?auto_22038 ) ) ( not ( = ?auto_22028 ?auto_22033 ) ) ( not ( = ?auto_22028 ?auto_22030 ) ) ( not ( = ?auto_22028 ?auto_22037 ) ) ( not ( = ?auto_22028 ?auto_22019 ) ) ( not ( = ?auto_22028 ?auto_22014 ) ) ( not ( = ?auto_22028 ?auto_22039 ) ) ( not ( = ?auto_21988 ?auto_21996 ) ) ( not ( = ?auto_21988 ?auto_22029 ) ) ( not ( = ?auto_21989 ?auto_21996 ) ) ( not ( = ?auto_21989 ?auto_22029 ) ) ( not ( = ?auto_21990 ?auto_21996 ) ) ( not ( = ?auto_21990 ?auto_22029 ) ) ( not ( = ?auto_21991 ?auto_21996 ) ) ( not ( = ?auto_21991 ?auto_22029 ) ) ( not ( = ?auto_21992 ?auto_21996 ) ) ( not ( = ?auto_21992 ?auto_22029 ) ) ( not ( = ?auto_21993 ?auto_21996 ) ) ( not ( = ?auto_21993 ?auto_22029 ) ) ( not ( = ?auto_21994 ?auto_21996 ) ) ( not ( = ?auto_21994 ?auto_22029 ) ) ( not ( = ?auto_21996 ?auto_22028 ) ) ( not ( = ?auto_21996 ?auto_22033 ) ) ( not ( = ?auto_21996 ?auto_22030 ) ) ( not ( = ?auto_21996 ?auto_22037 ) ) ( not ( = ?auto_21996 ?auto_22019 ) ) ( not ( = ?auto_21996 ?auto_22014 ) ) ( not ( = ?auto_21996 ?auto_22039 ) ) ( not ( = ?auto_22018 ?auto_22032 ) ) ( not ( = ?auto_22018 ?auto_22009 ) ) ( not ( = ?auto_22018 ?auto_22035 ) ) ( not ( = ?auto_22018 ?auto_22022 ) ) ( not ( = ?auto_22018 ?auto_22027 ) ) ( not ( = ?auto_22018 ?auto_22025 ) ) ( not ( = ?auto_22018 ?auto_22026 ) ) ( not ( = ?auto_22012 ?auto_22010 ) ) ( not ( = ?auto_22012 ?auto_22011 ) ) ( not ( = ?auto_22012 ?auto_22023 ) ) ( not ( = ?auto_22012 ?auto_22013 ) ) ( not ( = ?auto_22012 ?auto_22016 ) ) ( not ( = ?auto_22012 ?auto_22021 ) ) ( not ( = ?auto_22012 ?auto_22038 ) ) ( not ( = ?auto_22029 ?auto_22028 ) ) ( not ( = ?auto_22029 ?auto_22033 ) ) ( not ( = ?auto_22029 ?auto_22030 ) ) ( not ( = ?auto_22029 ?auto_22037 ) ) ( not ( = ?auto_22029 ?auto_22019 ) ) ( not ( = ?auto_22029 ?auto_22014 ) ) ( not ( = ?auto_22029 ?auto_22039 ) ) ( not ( = ?auto_21988 ?auto_21997 ) ) ( not ( = ?auto_21988 ?auto_22036 ) ) ( not ( = ?auto_21989 ?auto_21997 ) ) ( not ( = ?auto_21989 ?auto_22036 ) ) ( not ( = ?auto_21990 ?auto_21997 ) ) ( not ( = ?auto_21990 ?auto_22036 ) ) ( not ( = ?auto_21991 ?auto_21997 ) ) ( not ( = ?auto_21991 ?auto_22036 ) ) ( not ( = ?auto_21992 ?auto_21997 ) ) ( not ( = ?auto_21992 ?auto_22036 ) ) ( not ( = ?auto_21993 ?auto_21997 ) ) ( not ( = ?auto_21993 ?auto_22036 ) ) ( not ( = ?auto_21994 ?auto_21997 ) ) ( not ( = ?auto_21994 ?auto_22036 ) ) ( not ( = ?auto_21995 ?auto_21997 ) ) ( not ( = ?auto_21995 ?auto_22036 ) ) ( not ( = ?auto_21997 ?auto_22029 ) ) ( not ( = ?auto_21997 ?auto_22028 ) ) ( not ( = ?auto_21997 ?auto_22033 ) ) ( not ( = ?auto_21997 ?auto_22030 ) ) ( not ( = ?auto_21997 ?auto_22037 ) ) ( not ( = ?auto_21997 ?auto_22019 ) ) ( not ( = ?auto_21997 ?auto_22014 ) ) ( not ( = ?auto_21997 ?auto_22039 ) ) ( not ( = ?auto_22036 ?auto_22029 ) ) ( not ( = ?auto_22036 ?auto_22028 ) ) ( not ( = ?auto_22036 ?auto_22033 ) ) ( not ( = ?auto_22036 ?auto_22030 ) ) ( not ( = ?auto_22036 ?auto_22037 ) ) ( not ( = ?auto_22036 ?auto_22019 ) ) ( not ( = ?auto_22036 ?auto_22014 ) ) ( not ( = ?auto_22036 ?auto_22039 ) ) ( not ( = ?auto_21988 ?auto_21998 ) ) ( not ( = ?auto_21988 ?auto_22020 ) ) ( not ( = ?auto_21989 ?auto_21998 ) ) ( not ( = ?auto_21989 ?auto_22020 ) ) ( not ( = ?auto_21990 ?auto_21998 ) ) ( not ( = ?auto_21990 ?auto_22020 ) ) ( not ( = ?auto_21991 ?auto_21998 ) ) ( not ( = ?auto_21991 ?auto_22020 ) ) ( not ( = ?auto_21992 ?auto_21998 ) ) ( not ( = ?auto_21992 ?auto_22020 ) ) ( not ( = ?auto_21993 ?auto_21998 ) ) ( not ( = ?auto_21993 ?auto_22020 ) ) ( not ( = ?auto_21994 ?auto_21998 ) ) ( not ( = ?auto_21994 ?auto_22020 ) ) ( not ( = ?auto_21995 ?auto_21998 ) ) ( not ( = ?auto_21995 ?auto_22020 ) ) ( not ( = ?auto_21996 ?auto_21998 ) ) ( not ( = ?auto_21996 ?auto_22020 ) ) ( not ( = ?auto_21998 ?auto_22036 ) ) ( not ( = ?auto_21998 ?auto_22029 ) ) ( not ( = ?auto_21998 ?auto_22028 ) ) ( not ( = ?auto_21998 ?auto_22033 ) ) ( not ( = ?auto_21998 ?auto_22030 ) ) ( not ( = ?auto_21998 ?auto_22037 ) ) ( not ( = ?auto_21998 ?auto_22019 ) ) ( not ( = ?auto_21998 ?auto_22014 ) ) ( not ( = ?auto_21998 ?auto_22039 ) ) ( not ( = ?auto_22020 ?auto_22036 ) ) ( not ( = ?auto_22020 ?auto_22029 ) ) ( not ( = ?auto_22020 ?auto_22028 ) ) ( not ( = ?auto_22020 ?auto_22033 ) ) ( not ( = ?auto_22020 ?auto_22030 ) ) ( not ( = ?auto_22020 ?auto_22037 ) ) ( not ( = ?auto_22020 ?auto_22019 ) ) ( not ( = ?auto_22020 ?auto_22014 ) ) ( not ( = ?auto_22020 ?auto_22039 ) ) ( not ( = ?auto_21988 ?auto_21999 ) ) ( not ( = ?auto_21988 ?auto_22034 ) ) ( not ( = ?auto_21989 ?auto_21999 ) ) ( not ( = ?auto_21989 ?auto_22034 ) ) ( not ( = ?auto_21990 ?auto_21999 ) ) ( not ( = ?auto_21990 ?auto_22034 ) ) ( not ( = ?auto_21991 ?auto_21999 ) ) ( not ( = ?auto_21991 ?auto_22034 ) ) ( not ( = ?auto_21992 ?auto_21999 ) ) ( not ( = ?auto_21992 ?auto_22034 ) ) ( not ( = ?auto_21993 ?auto_21999 ) ) ( not ( = ?auto_21993 ?auto_22034 ) ) ( not ( = ?auto_21994 ?auto_21999 ) ) ( not ( = ?auto_21994 ?auto_22034 ) ) ( not ( = ?auto_21995 ?auto_21999 ) ) ( not ( = ?auto_21995 ?auto_22034 ) ) ( not ( = ?auto_21996 ?auto_21999 ) ) ( not ( = ?auto_21996 ?auto_22034 ) ) ( not ( = ?auto_21997 ?auto_21999 ) ) ( not ( = ?auto_21997 ?auto_22034 ) ) ( not ( = ?auto_21999 ?auto_22020 ) ) ( not ( = ?auto_21999 ?auto_22036 ) ) ( not ( = ?auto_21999 ?auto_22029 ) ) ( not ( = ?auto_21999 ?auto_22028 ) ) ( not ( = ?auto_21999 ?auto_22033 ) ) ( not ( = ?auto_21999 ?auto_22030 ) ) ( not ( = ?auto_21999 ?auto_22037 ) ) ( not ( = ?auto_21999 ?auto_22019 ) ) ( not ( = ?auto_21999 ?auto_22014 ) ) ( not ( = ?auto_21999 ?auto_22039 ) ) ( not ( = ?auto_22034 ?auto_22020 ) ) ( not ( = ?auto_22034 ?auto_22036 ) ) ( not ( = ?auto_22034 ?auto_22029 ) ) ( not ( = ?auto_22034 ?auto_22028 ) ) ( not ( = ?auto_22034 ?auto_22033 ) ) ( not ( = ?auto_22034 ?auto_22030 ) ) ( not ( = ?auto_22034 ?auto_22037 ) ) ( not ( = ?auto_22034 ?auto_22019 ) ) ( not ( = ?auto_22034 ?auto_22014 ) ) ( not ( = ?auto_22034 ?auto_22039 ) ) ( not ( = ?auto_21988 ?auto_22000 ) ) ( not ( = ?auto_21988 ?auto_22031 ) ) ( not ( = ?auto_21989 ?auto_22000 ) ) ( not ( = ?auto_21989 ?auto_22031 ) ) ( not ( = ?auto_21990 ?auto_22000 ) ) ( not ( = ?auto_21990 ?auto_22031 ) ) ( not ( = ?auto_21991 ?auto_22000 ) ) ( not ( = ?auto_21991 ?auto_22031 ) ) ( not ( = ?auto_21992 ?auto_22000 ) ) ( not ( = ?auto_21992 ?auto_22031 ) ) ( not ( = ?auto_21993 ?auto_22000 ) ) ( not ( = ?auto_21993 ?auto_22031 ) ) ( not ( = ?auto_21994 ?auto_22000 ) ) ( not ( = ?auto_21994 ?auto_22031 ) ) ( not ( = ?auto_21995 ?auto_22000 ) ) ( not ( = ?auto_21995 ?auto_22031 ) ) ( not ( = ?auto_21996 ?auto_22000 ) ) ( not ( = ?auto_21996 ?auto_22031 ) ) ( not ( = ?auto_21997 ?auto_22000 ) ) ( not ( = ?auto_21997 ?auto_22031 ) ) ( not ( = ?auto_21998 ?auto_22000 ) ) ( not ( = ?auto_21998 ?auto_22031 ) ) ( not ( = ?auto_22000 ?auto_22034 ) ) ( not ( = ?auto_22000 ?auto_22020 ) ) ( not ( = ?auto_22000 ?auto_22036 ) ) ( not ( = ?auto_22000 ?auto_22029 ) ) ( not ( = ?auto_22000 ?auto_22028 ) ) ( not ( = ?auto_22000 ?auto_22033 ) ) ( not ( = ?auto_22000 ?auto_22030 ) ) ( not ( = ?auto_22000 ?auto_22037 ) ) ( not ( = ?auto_22000 ?auto_22019 ) ) ( not ( = ?auto_22000 ?auto_22014 ) ) ( not ( = ?auto_22000 ?auto_22039 ) ) ( not ( = ?auto_22031 ?auto_22034 ) ) ( not ( = ?auto_22031 ?auto_22020 ) ) ( not ( = ?auto_22031 ?auto_22036 ) ) ( not ( = ?auto_22031 ?auto_22029 ) ) ( not ( = ?auto_22031 ?auto_22028 ) ) ( not ( = ?auto_22031 ?auto_22033 ) ) ( not ( = ?auto_22031 ?auto_22030 ) ) ( not ( = ?auto_22031 ?auto_22037 ) ) ( not ( = ?auto_22031 ?auto_22019 ) ) ( not ( = ?auto_22031 ?auto_22014 ) ) ( not ( = ?auto_22031 ?auto_22039 ) ) ( not ( = ?auto_21988 ?auto_22001 ) ) ( not ( = ?auto_21988 ?auto_22017 ) ) ( not ( = ?auto_21989 ?auto_22001 ) ) ( not ( = ?auto_21989 ?auto_22017 ) ) ( not ( = ?auto_21990 ?auto_22001 ) ) ( not ( = ?auto_21990 ?auto_22017 ) ) ( not ( = ?auto_21991 ?auto_22001 ) ) ( not ( = ?auto_21991 ?auto_22017 ) ) ( not ( = ?auto_21992 ?auto_22001 ) ) ( not ( = ?auto_21992 ?auto_22017 ) ) ( not ( = ?auto_21993 ?auto_22001 ) ) ( not ( = ?auto_21993 ?auto_22017 ) ) ( not ( = ?auto_21994 ?auto_22001 ) ) ( not ( = ?auto_21994 ?auto_22017 ) ) ( not ( = ?auto_21995 ?auto_22001 ) ) ( not ( = ?auto_21995 ?auto_22017 ) ) ( not ( = ?auto_21996 ?auto_22001 ) ) ( not ( = ?auto_21996 ?auto_22017 ) ) ( not ( = ?auto_21997 ?auto_22001 ) ) ( not ( = ?auto_21997 ?auto_22017 ) ) ( not ( = ?auto_21998 ?auto_22001 ) ) ( not ( = ?auto_21998 ?auto_22017 ) ) ( not ( = ?auto_21999 ?auto_22001 ) ) ( not ( = ?auto_21999 ?auto_22017 ) ) ( not ( = ?auto_22001 ?auto_22031 ) ) ( not ( = ?auto_22001 ?auto_22034 ) ) ( not ( = ?auto_22001 ?auto_22020 ) ) ( not ( = ?auto_22001 ?auto_22036 ) ) ( not ( = ?auto_22001 ?auto_22029 ) ) ( not ( = ?auto_22001 ?auto_22028 ) ) ( not ( = ?auto_22001 ?auto_22033 ) ) ( not ( = ?auto_22001 ?auto_22030 ) ) ( not ( = ?auto_22001 ?auto_22037 ) ) ( not ( = ?auto_22001 ?auto_22019 ) ) ( not ( = ?auto_22001 ?auto_22014 ) ) ( not ( = ?auto_22001 ?auto_22039 ) ) ( not ( = ?auto_22015 ?auto_22035 ) ) ( not ( = ?auto_22015 ?auto_22025 ) ) ( not ( = ?auto_22015 ?auto_22027 ) ) ( not ( = ?auto_22015 ?auto_22026 ) ) ( not ( = ?auto_22015 ?auto_22018 ) ) ( not ( = ?auto_22015 ?auto_22032 ) ) ( not ( = ?auto_22015 ?auto_22009 ) ) ( not ( = ?auto_22015 ?auto_22022 ) ) ( not ( = ?auto_22024 ?auto_22023 ) ) ( not ( = ?auto_22024 ?auto_22021 ) ) ( not ( = ?auto_22024 ?auto_22016 ) ) ( not ( = ?auto_22024 ?auto_22038 ) ) ( not ( = ?auto_22024 ?auto_22012 ) ) ( not ( = ?auto_22024 ?auto_22010 ) ) ( not ( = ?auto_22024 ?auto_22011 ) ) ( not ( = ?auto_22024 ?auto_22013 ) ) ( not ( = ?auto_22017 ?auto_22031 ) ) ( not ( = ?auto_22017 ?auto_22034 ) ) ( not ( = ?auto_22017 ?auto_22020 ) ) ( not ( = ?auto_22017 ?auto_22036 ) ) ( not ( = ?auto_22017 ?auto_22029 ) ) ( not ( = ?auto_22017 ?auto_22028 ) ) ( not ( = ?auto_22017 ?auto_22033 ) ) ( not ( = ?auto_22017 ?auto_22030 ) ) ( not ( = ?auto_22017 ?auto_22037 ) ) ( not ( = ?auto_22017 ?auto_22019 ) ) ( not ( = ?auto_22017 ?auto_22014 ) ) ( not ( = ?auto_22017 ?auto_22039 ) ) ( not ( = ?auto_21988 ?auto_22002 ) ) ( not ( = ?auto_21988 ?auto_22008 ) ) ( not ( = ?auto_21989 ?auto_22002 ) ) ( not ( = ?auto_21989 ?auto_22008 ) ) ( not ( = ?auto_21990 ?auto_22002 ) ) ( not ( = ?auto_21990 ?auto_22008 ) ) ( not ( = ?auto_21991 ?auto_22002 ) ) ( not ( = ?auto_21991 ?auto_22008 ) ) ( not ( = ?auto_21992 ?auto_22002 ) ) ( not ( = ?auto_21992 ?auto_22008 ) ) ( not ( = ?auto_21993 ?auto_22002 ) ) ( not ( = ?auto_21993 ?auto_22008 ) ) ( not ( = ?auto_21994 ?auto_22002 ) ) ( not ( = ?auto_21994 ?auto_22008 ) ) ( not ( = ?auto_21995 ?auto_22002 ) ) ( not ( = ?auto_21995 ?auto_22008 ) ) ( not ( = ?auto_21996 ?auto_22002 ) ) ( not ( = ?auto_21996 ?auto_22008 ) ) ( not ( = ?auto_21997 ?auto_22002 ) ) ( not ( = ?auto_21997 ?auto_22008 ) ) ( not ( = ?auto_21998 ?auto_22002 ) ) ( not ( = ?auto_21998 ?auto_22008 ) ) ( not ( = ?auto_21999 ?auto_22002 ) ) ( not ( = ?auto_21999 ?auto_22008 ) ) ( not ( = ?auto_22000 ?auto_22002 ) ) ( not ( = ?auto_22000 ?auto_22008 ) ) ( not ( = ?auto_22002 ?auto_22017 ) ) ( not ( = ?auto_22002 ?auto_22031 ) ) ( not ( = ?auto_22002 ?auto_22034 ) ) ( not ( = ?auto_22002 ?auto_22020 ) ) ( not ( = ?auto_22002 ?auto_22036 ) ) ( not ( = ?auto_22002 ?auto_22029 ) ) ( not ( = ?auto_22002 ?auto_22028 ) ) ( not ( = ?auto_22002 ?auto_22033 ) ) ( not ( = ?auto_22002 ?auto_22030 ) ) ( not ( = ?auto_22002 ?auto_22037 ) ) ( not ( = ?auto_22002 ?auto_22019 ) ) ( not ( = ?auto_22002 ?auto_22014 ) ) ( not ( = ?auto_22002 ?auto_22039 ) ) ( not ( = ?auto_22005 ?auto_22015 ) ) ( not ( = ?auto_22005 ?auto_22035 ) ) ( not ( = ?auto_22005 ?auto_22025 ) ) ( not ( = ?auto_22005 ?auto_22027 ) ) ( not ( = ?auto_22005 ?auto_22026 ) ) ( not ( = ?auto_22005 ?auto_22018 ) ) ( not ( = ?auto_22005 ?auto_22032 ) ) ( not ( = ?auto_22005 ?auto_22009 ) ) ( not ( = ?auto_22005 ?auto_22022 ) ) ( not ( = ?auto_22003 ?auto_22024 ) ) ( not ( = ?auto_22003 ?auto_22023 ) ) ( not ( = ?auto_22003 ?auto_22021 ) ) ( not ( = ?auto_22003 ?auto_22016 ) ) ( not ( = ?auto_22003 ?auto_22038 ) ) ( not ( = ?auto_22003 ?auto_22012 ) ) ( not ( = ?auto_22003 ?auto_22010 ) ) ( not ( = ?auto_22003 ?auto_22011 ) ) ( not ( = ?auto_22003 ?auto_22013 ) ) ( not ( = ?auto_22008 ?auto_22017 ) ) ( not ( = ?auto_22008 ?auto_22031 ) ) ( not ( = ?auto_22008 ?auto_22034 ) ) ( not ( = ?auto_22008 ?auto_22020 ) ) ( not ( = ?auto_22008 ?auto_22036 ) ) ( not ( = ?auto_22008 ?auto_22029 ) ) ( not ( = ?auto_22008 ?auto_22028 ) ) ( not ( = ?auto_22008 ?auto_22033 ) ) ( not ( = ?auto_22008 ?auto_22030 ) ) ( not ( = ?auto_22008 ?auto_22037 ) ) ( not ( = ?auto_22008 ?auto_22019 ) ) ( not ( = ?auto_22008 ?auto_22014 ) ) ( not ( = ?auto_22008 ?auto_22039 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_21988 ?auto_21989 ?auto_21990 ?auto_21991 ?auto_21992 ?auto_21993 ?auto_21994 ?auto_21995 ?auto_21996 ?auto_21997 ?auto_21998 ?auto_21999 ?auto_22000 ?auto_22001 )
      ( MAKE-1CRATE ?auto_22001 ?auto_22002 )
      ( MAKE-14CRATE-VERIFY ?auto_21988 ?auto_21989 ?auto_21990 ?auto_21991 ?auto_21992 ?auto_21993 ?auto_21994 ?auto_21995 ?auto_21996 ?auto_21997 ?auto_21998 ?auto_21999 ?auto_22000 ?auto_22001 ?auto_22002 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_22066 - SURFACE
      ?auto_22067 - SURFACE
      ?auto_22068 - SURFACE
      ?auto_22069 - SURFACE
      ?auto_22070 - SURFACE
      ?auto_22071 - SURFACE
      ?auto_22072 - SURFACE
      ?auto_22073 - SURFACE
      ?auto_22074 - SURFACE
      ?auto_22075 - SURFACE
      ?auto_22076 - SURFACE
      ?auto_22077 - SURFACE
      ?auto_22078 - SURFACE
      ?auto_22079 - SURFACE
      ?auto_22081 - SURFACE
      ?auto_22080 - SURFACE
    )
    :vars
    (
      ?auto_22082 - HOIST
      ?auto_22086 - PLACE
      ?auto_22084 - PLACE
      ?auto_22087 - HOIST
      ?auto_22083 - SURFACE
      ?auto_22092 - PLACE
      ?auto_22114 - HOIST
      ?auto_22120 - SURFACE
      ?auto_22117 - PLACE
      ?auto_22098 - HOIST
      ?auto_22118 - SURFACE
      ?auto_22097 - PLACE
      ?auto_22107 - HOIST
      ?auto_22110 - SURFACE
      ?auto_22091 - PLACE
      ?auto_22101 - HOIST
      ?auto_22121 - SURFACE
      ?auto_22096 - PLACE
      ?auto_22099 - HOIST
      ?auto_22116 - SURFACE
      ?auto_22089 - PLACE
      ?auto_22111 - HOIST
      ?auto_22088 - SURFACE
      ?auto_22102 - PLACE
      ?auto_22106 - HOIST
      ?auto_22109 - SURFACE
      ?auto_22113 - PLACE
      ?auto_22095 - HOIST
      ?auto_22100 - SURFACE
      ?auto_22093 - PLACE
      ?auto_22119 - HOIST
      ?auto_22094 - SURFACE
      ?auto_22103 - SURFACE
      ?auto_22090 - PLACE
      ?auto_22104 - HOIST
      ?auto_22115 - SURFACE
      ?auto_22112 - SURFACE
      ?auto_22108 - SURFACE
      ?auto_22105 - SURFACE
      ?auto_22085 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22082 ?auto_22086 ) ( IS-CRATE ?auto_22080 ) ( not ( = ?auto_22084 ?auto_22086 ) ) ( HOIST-AT ?auto_22087 ?auto_22084 ) ( AVAILABLE ?auto_22087 ) ( SURFACE-AT ?auto_22080 ?auto_22084 ) ( ON ?auto_22080 ?auto_22083 ) ( CLEAR ?auto_22080 ) ( not ( = ?auto_22081 ?auto_22080 ) ) ( not ( = ?auto_22081 ?auto_22083 ) ) ( not ( = ?auto_22080 ?auto_22083 ) ) ( not ( = ?auto_22082 ?auto_22087 ) ) ( IS-CRATE ?auto_22081 ) ( not ( = ?auto_22092 ?auto_22086 ) ) ( HOIST-AT ?auto_22114 ?auto_22092 ) ( AVAILABLE ?auto_22114 ) ( SURFACE-AT ?auto_22081 ?auto_22092 ) ( ON ?auto_22081 ?auto_22120 ) ( CLEAR ?auto_22081 ) ( not ( = ?auto_22079 ?auto_22081 ) ) ( not ( = ?auto_22079 ?auto_22120 ) ) ( not ( = ?auto_22081 ?auto_22120 ) ) ( not ( = ?auto_22082 ?auto_22114 ) ) ( IS-CRATE ?auto_22079 ) ( not ( = ?auto_22117 ?auto_22086 ) ) ( HOIST-AT ?auto_22098 ?auto_22117 ) ( AVAILABLE ?auto_22098 ) ( SURFACE-AT ?auto_22079 ?auto_22117 ) ( ON ?auto_22079 ?auto_22118 ) ( CLEAR ?auto_22079 ) ( not ( = ?auto_22078 ?auto_22079 ) ) ( not ( = ?auto_22078 ?auto_22118 ) ) ( not ( = ?auto_22079 ?auto_22118 ) ) ( not ( = ?auto_22082 ?auto_22098 ) ) ( IS-CRATE ?auto_22078 ) ( not ( = ?auto_22097 ?auto_22086 ) ) ( HOIST-AT ?auto_22107 ?auto_22097 ) ( SURFACE-AT ?auto_22078 ?auto_22097 ) ( ON ?auto_22078 ?auto_22110 ) ( CLEAR ?auto_22078 ) ( not ( = ?auto_22077 ?auto_22078 ) ) ( not ( = ?auto_22077 ?auto_22110 ) ) ( not ( = ?auto_22078 ?auto_22110 ) ) ( not ( = ?auto_22082 ?auto_22107 ) ) ( IS-CRATE ?auto_22077 ) ( not ( = ?auto_22091 ?auto_22086 ) ) ( HOIST-AT ?auto_22101 ?auto_22091 ) ( SURFACE-AT ?auto_22077 ?auto_22091 ) ( ON ?auto_22077 ?auto_22121 ) ( CLEAR ?auto_22077 ) ( not ( = ?auto_22076 ?auto_22077 ) ) ( not ( = ?auto_22076 ?auto_22121 ) ) ( not ( = ?auto_22077 ?auto_22121 ) ) ( not ( = ?auto_22082 ?auto_22101 ) ) ( IS-CRATE ?auto_22076 ) ( not ( = ?auto_22096 ?auto_22086 ) ) ( HOIST-AT ?auto_22099 ?auto_22096 ) ( SURFACE-AT ?auto_22076 ?auto_22096 ) ( ON ?auto_22076 ?auto_22116 ) ( CLEAR ?auto_22076 ) ( not ( = ?auto_22075 ?auto_22076 ) ) ( not ( = ?auto_22075 ?auto_22116 ) ) ( not ( = ?auto_22076 ?auto_22116 ) ) ( not ( = ?auto_22082 ?auto_22099 ) ) ( IS-CRATE ?auto_22075 ) ( not ( = ?auto_22089 ?auto_22086 ) ) ( HOIST-AT ?auto_22111 ?auto_22089 ) ( SURFACE-AT ?auto_22075 ?auto_22089 ) ( ON ?auto_22075 ?auto_22088 ) ( CLEAR ?auto_22075 ) ( not ( = ?auto_22074 ?auto_22075 ) ) ( not ( = ?auto_22074 ?auto_22088 ) ) ( not ( = ?auto_22075 ?auto_22088 ) ) ( not ( = ?auto_22082 ?auto_22111 ) ) ( IS-CRATE ?auto_22074 ) ( not ( = ?auto_22102 ?auto_22086 ) ) ( HOIST-AT ?auto_22106 ?auto_22102 ) ( AVAILABLE ?auto_22106 ) ( SURFACE-AT ?auto_22074 ?auto_22102 ) ( ON ?auto_22074 ?auto_22109 ) ( CLEAR ?auto_22074 ) ( not ( = ?auto_22073 ?auto_22074 ) ) ( not ( = ?auto_22073 ?auto_22109 ) ) ( not ( = ?auto_22074 ?auto_22109 ) ) ( not ( = ?auto_22082 ?auto_22106 ) ) ( IS-CRATE ?auto_22073 ) ( not ( = ?auto_22113 ?auto_22086 ) ) ( HOIST-AT ?auto_22095 ?auto_22113 ) ( AVAILABLE ?auto_22095 ) ( SURFACE-AT ?auto_22073 ?auto_22113 ) ( ON ?auto_22073 ?auto_22100 ) ( CLEAR ?auto_22073 ) ( not ( = ?auto_22072 ?auto_22073 ) ) ( not ( = ?auto_22072 ?auto_22100 ) ) ( not ( = ?auto_22073 ?auto_22100 ) ) ( not ( = ?auto_22082 ?auto_22095 ) ) ( IS-CRATE ?auto_22072 ) ( not ( = ?auto_22093 ?auto_22086 ) ) ( HOIST-AT ?auto_22119 ?auto_22093 ) ( AVAILABLE ?auto_22119 ) ( SURFACE-AT ?auto_22072 ?auto_22093 ) ( ON ?auto_22072 ?auto_22094 ) ( CLEAR ?auto_22072 ) ( not ( = ?auto_22071 ?auto_22072 ) ) ( not ( = ?auto_22071 ?auto_22094 ) ) ( not ( = ?auto_22072 ?auto_22094 ) ) ( not ( = ?auto_22082 ?auto_22119 ) ) ( IS-CRATE ?auto_22071 ) ( AVAILABLE ?auto_22107 ) ( SURFACE-AT ?auto_22071 ?auto_22097 ) ( ON ?auto_22071 ?auto_22103 ) ( CLEAR ?auto_22071 ) ( not ( = ?auto_22070 ?auto_22071 ) ) ( not ( = ?auto_22070 ?auto_22103 ) ) ( not ( = ?auto_22071 ?auto_22103 ) ) ( IS-CRATE ?auto_22070 ) ( not ( = ?auto_22090 ?auto_22086 ) ) ( HOIST-AT ?auto_22104 ?auto_22090 ) ( AVAILABLE ?auto_22104 ) ( SURFACE-AT ?auto_22070 ?auto_22090 ) ( ON ?auto_22070 ?auto_22115 ) ( CLEAR ?auto_22070 ) ( not ( = ?auto_22069 ?auto_22070 ) ) ( not ( = ?auto_22069 ?auto_22115 ) ) ( not ( = ?auto_22070 ?auto_22115 ) ) ( not ( = ?auto_22082 ?auto_22104 ) ) ( IS-CRATE ?auto_22069 ) ( AVAILABLE ?auto_22099 ) ( SURFACE-AT ?auto_22069 ?auto_22096 ) ( ON ?auto_22069 ?auto_22112 ) ( CLEAR ?auto_22069 ) ( not ( = ?auto_22068 ?auto_22069 ) ) ( not ( = ?auto_22068 ?auto_22112 ) ) ( not ( = ?auto_22069 ?auto_22112 ) ) ( IS-CRATE ?auto_22068 ) ( AVAILABLE ?auto_22101 ) ( SURFACE-AT ?auto_22068 ?auto_22091 ) ( ON ?auto_22068 ?auto_22108 ) ( CLEAR ?auto_22068 ) ( not ( = ?auto_22067 ?auto_22068 ) ) ( not ( = ?auto_22067 ?auto_22108 ) ) ( not ( = ?auto_22068 ?auto_22108 ) ) ( SURFACE-AT ?auto_22066 ?auto_22086 ) ( CLEAR ?auto_22066 ) ( IS-CRATE ?auto_22067 ) ( AVAILABLE ?auto_22082 ) ( AVAILABLE ?auto_22111 ) ( SURFACE-AT ?auto_22067 ?auto_22089 ) ( ON ?auto_22067 ?auto_22105 ) ( CLEAR ?auto_22067 ) ( TRUCK-AT ?auto_22085 ?auto_22086 ) ( not ( = ?auto_22066 ?auto_22067 ) ) ( not ( = ?auto_22066 ?auto_22105 ) ) ( not ( = ?auto_22067 ?auto_22105 ) ) ( not ( = ?auto_22066 ?auto_22068 ) ) ( not ( = ?auto_22066 ?auto_22108 ) ) ( not ( = ?auto_22068 ?auto_22105 ) ) ( not ( = ?auto_22091 ?auto_22089 ) ) ( not ( = ?auto_22101 ?auto_22111 ) ) ( not ( = ?auto_22108 ?auto_22105 ) ) ( not ( = ?auto_22066 ?auto_22069 ) ) ( not ( = ?auto_22066 ?auto_22112 ) ) ( not ( = ?auto_22067 ?auto_22069 ) ) ( not ( = ?auto_22067 ?auto_22112 ) ) ( not ( = ?auto_22069 ?auto_22108 ) ) ( not ( = ?auto_22069 ?auto_22105 ) ) ( not ( = ?auto_22096 ?auto_22091 ) ) ( not ( = ?auto_22096 ?auto_22089 ) ) ( not ( = ?auto_22099 ?auto_22101 ) ) ( not ( = ?auto_22099 ?auto_22111 ) ) ( not ( = ?auto_22112 ?auto_22108 ) ) ( not ( = ?auto_22112 ?auto_22105 ) ) ( not ( = ?auto_22066 ?auto_22070 ) ) ( not ( = ?auto_22066 ?auto_22115 ) ) ( not ( = ?auto_22067 ?auto_22070 ) ) ( not ( = ?auto_22067 ?auto_22115 ) ) ( not ( = ?auto_22068 ?auto_22070 ) ) ( not ( = ?auto_22068 ?auto_22115 ) ) ( not ( = ?auto_22070 ?auto_22112 ) ) ( not ( = ?auto_22070 ?auto_22108 ) ) ( not ( = ?auto_22070 ?auto_22105 ) ) ( not ( = ?auto_22090 ?auto_22096 ) ) ( not ( = ?auto_22090 ?auto_22091 ) ) ( not ( = ?auto_22090 ?auto_22089 ) ) ( not ( = ?auto_22104 ?auto_22099 ) ) ( not ( = ?auto_22104 ?auto_22101 ) ) ( not ( = ?auto_22104 ?auto_22111 ) ) ( not ( = ?auto_22115 ?auto_22112 ) ) ( not ( = ?auto_22115 ?auto_22108 ) ) ( not ( = ?auto_22115 ?auto_22105 ) ) ( not ( = ?auto_22066 ?auto_22071 ) ) ( not ( = ?auto_22066 ?auto_22103 ) ) ( not ( = ?auto_22067 ?auto_22071 ) ) ( not ( = ?auto_22067 ?auto_22103 ) ) ( not ( = ?auto_22068 ?auto_22071 ) ) ( not ( = ?auto_22068 ?auto_22103 ) ) ( not ( = ?auto_22069 ?auto_22071 ) ) ( not ( = ?auto_22069 ?auto_22103 ) ) ( not ( = ?auto_22071 ?auto_22115 ) ) ( not ( = ?auto_22071 ?auto_22112 ) ) ( not ( = ?auto_22071 ?auto_22108 ) ) ( not ( = ?auto_22071 ?auto_22105 ) ) ( not ( = ?auto_22097 ?auto_22090 ) ) ( not ( = ?auto_22097 ?auto_22096 ) ) ( not ( = ?auto_22097 ?auto_22091 ) ) ( not ( = ?auto_22097 ?auto_22089 ) ) ( not ( = ?auto_22107 ?auto_22104 ) ) ( not ( = ?auto_22107 ?auto_22099 ) ) ( not ( = ?auto_22107 ?auto_22101 ) ) ( not ( = ?auto_22107 ?auto_22111 ) ) ( not ( = ?auto_22103 ?auto_22115 ) ) ( not ( = ?auto_22103 ?auto_22112 ) ) ( not ( = ?auto_22103 ?auto_22108 ) ) ( not ( = ?auto_22103 ?auto_22105 ) ) ( not ( = ?auto_22066 ?auto_22072 ) ) ( not ( = ?auto_22066 ?auto_22094 ) ) ( not ( = ?auto_22067 ?auto_22072 ) ) ( not ( = ?auto_22067 ?auto_22094 ) ) ( not ( = ?auto_22068 ?auto_22072 ) ) ( not ( = ?auto_22068 ?auto_22094 ) ) ( not ( = ?auto_22069 ?auto_22072 ) ) ( not ( = ?auto_22069 ?auto_22094 ) ) ( not ( = ?auto_22070 ?auto_22072 ) ) ( not ( = ?auto_22070 ?auto_22094 ) ) ( not ( = ?auto_22072 ?auto_22103 ) ) ( not ( = ?auto_22072 ?auto_22115 ) ) ( not ( = ?auto_22072 ?auto_22112 ) ) ( not ( = ?auto_22072 ?auto_22108 ) ) ( not ( = ?auto_22072 ?auto_22105 ) ) ( not ( = ?auto_22093 ?auto_22097 ) ) ( not ( = ?auto_22093 ?auto_22090 ) ) ( not ( = ?auto_22093 ?auto_22096 ) ) ( not ( = ?auto_22093 ?auto_22091 ) ) ( not ( = ?auto_22093 ?auto_22089 ) ) ( not ( = ?auto_22119 ?auto_22107 ) ) ( not ( = ?auto_22119 ?auto_22104 ) ) ( not ( = ?auto_22119 ?auto_22099 ) ) ( not ( = ?auto_22119 ?auto_22101 ) ) ( not ( = ?auto_22119 ?auto_22111 ) ) ( not ( = ?auto_22094 ?auto_22103 ) ) ( not ( = ?auto_22094 ?auto_22115 ) ) ( not ( = ?auto_22094 ?auto_22112 ) ) ( not ( = ?auto_22094 ?auto_22108 ) ) ( not ( = ?auto_22094 ?auto_22105 ) ) ( not ( = ?auto_22066 ?auto_22073 ) ) ( not ( = ?auto_22066 ?auto_22100 ) ) ( not ( = ?auto_22067 ?auto_22073 ) ) ( not ( = ?auto_22067 ?auto_22100 ) ) ( not ( = ?auto_22068 ?auto_22073 ) ) ( not ( = ?auto_22068 ?auto_22100 ) ) ( not ( = ?auto_22069 ?auto_22073 ) ) ( not ( = ?auto_22069 ?auto_22100 ) ) ( not ( = ?auto_22070 ?auto_22073 ) ) ( not ( = ?auto_22070 ?auto_22100 ) ) ( not ( = ?auto_22071 ?auto_22073 ) ) ( not ( = ?auto_22071 ?auto_22100 ) ) ( not ( = ?auto_22073 ?auto_22094 ) ) ( not ( = ?auto_22073 ?auto_22103 ) ) ( not ( = ?auto_22073 ?auto_22115 ) ) ( not ( = ?auto_22073 ?auto_22112 ) ) ( not ( = ?auto_22073 ?auto_22108 ) ) ( not ( = ?auto_22073 ?auto_22105 ) ) ( not ( = ?auto_22113 ?auto_22093 ) ) ( not ( = ?auto_22113 ?auto_22097 ) ) ( not ( = ?auto_22113 ?auto_22090 ) ) ( not ( = ?auto_22113 ?auto_22096 ) ) ( not ( = ?auto_22113 ?auto_22091 ) ) ( not ( = ?auto_22113 ?auto_22089 ) ) ( not ( = ?auto_22095 ?auto_22119 ) ) ( not ( = ?auto_22095 ?auto_22107 ) ) ( not ( = ?auto_22095 ?auto_22104 ) ) ( not ( = ?auto_22095 ?auto_22099 ) ) ( not ( = ?auto_22095 ?auto_22101 ) ) ( not ( = ?auto_22095 ?auto_22111 ) ) ( not ( = ?auto_22100 ?auto_22094 ) ) ( not ( = ?auto_22100 ?auto_22103 ) ) ( not ( = ?auto_22100 ?auto_22115 ) ) ( not ( = ?auto_22100 ?auto_22112 ) ) ( not ( = ?auto_22100 ?auto_22108 ) ) ( not ( = ?auto_22100 ?auto_22105 ) ) ( not ( = ?auto_22066 ?auto_22074 ) ) ( not ( = ?auto_22066 ?auto_22109 ) ) ( not ( = ?auto_22067 ?auto_22074 ) ) ( not ( = ?auto_22067 ?auto_22109 ) ) ( not ( = ?auto_22068 ?auto_22074 ) ) ( not ( = ?auto_22068 ?auto_22109 ) ) ( not ( = ?auto_22069 ?auto_22074 ) ) ( not ( = ?auto_22069 ?auto_22109 ) ) ( not ( = ?auto_22070 ?auto_22074 ) ) ( not ( = ?auto_22070 ?auto_22109 ) ) ( not ( = ?auto_22071 ?auto_22074 ) ) ( not ( = ?auto_22071 ?auto_22109 ) ) ( not ( = ?auto_22072 ?auto_22074 ) ) ( not ( = ?auto_22072 ?auto_22109 ) ) ( not ( = ?auto_22074 ?auto_22100 ) ) ( not ( = ?auto_22074 ?auto_22094 ) ) ( not ( = ?auto_22074 ?auto_22103 ) ) ( not ( = ?auto_22074 ?auto_22115 ) ) ( not ( = ?auto_22074 ?auto_22112 ) ) ( not ( = ?auto_22074 ?auto_22108 ) ) ( not ( = ?auto_22074 ?auto_22105 ) ) ( not ( = ?auto_22102 ?auto_22113 ) ) ( not ( = ?auto_22102 ?auto_22093 ) ) ( not ( = ?auto_22102 ?auto_22097 ) ) ( not ( = ?auto_22102 ?auto_22090 ) ) ( not ( = ?auto_22102 ?auto_22096 ) ) ( not ( = ?auto_22102 ?auto_22091 ) ) ( not ( = ?auto_22102 ?auto_22089 ) ) ( not ( = ?auto_22106 ?auto_22095 ) ) ( not ( = ?auto_22106 ?auto_22119 ) ) ( not ( = ?auto_22106 ?auto_22107 ) ) ( not ( = ?auto_22106 ?auto_22104 ) ) ( not ( = ?auto_22106 ?auto_22099 ) ) ( not ( = ?auto_22106 ?auto_22101 ) ) ( not ( = ?auto_22106 ?auto_22111 ) ) ( not ( = ?auto_22109 ?auto_22100 ) ) ( not ( = ?auto_22109 ?auto_22094 ) ) ( not ( = ?auto_22109 ?auto_22103 ) ) ( not ( = ?auto_22109 ?auto_22115 ) ) ( not ( = ?auto_22109 ?auto_22112 ) ) ( not ( = ?auto_22109 ?auto_22108 ) ) ( not ( = ?auto_22109 ?auto_22105 ) ) ( not ( = ?auto_22066 ?auto_22075 ) ) ( not ( = ?auto_22066 ?auto_22088 ) ) ( not ( = ?auto_22067 ?auto_22075 ) ) ( not ( = ?auto_22067 ?auto_22088 ) ) ( not ( = ?auto_22068 ?auto_22075 ) ) ( not ( = ?auto_22068 ?auto_22088 ) ) ( not ( = ?auto_22069 ?auto_22075 ) ) ( not ( = ?auto_22069 ?auto_22088 ) ) ( not ( = ?auto_22070 ?auto_22075 ) ) ( not ( = ?auto_22070 ?auto_22088 ) ) ( not ( = ?auto_22071 ?auto_22075 ) ) ( not ( = ?auto_22071 ?auto_22088 ) ) ( not ( = ?auto_22072 ?auto_22075 ) ) ( not ( = ?auto_22072 ?auto_22088 ) ) ( not ( = ?auto_22073 ?auto_22075 ) ) ( not ( = ?auto_22073 ?auto_22088 ) ) ( not ( = ?auto_22075 ?auto_22109 ) ) ( not ( = ?auto_22075 ?auto_22100 ) ) ( not ( = ?auto_22075 ?auto_22094 ) ) ( not ( = ?auto_22075 ?auto_22103 ) ) ( not ( = ?auto_22075 ?auto_22115 ) ) ( not ( = ?auto_22075 ?auto_22112 ) ) ( not ( = ?auto_22075 ?auto_22108 ) ) ( not ( = ?auto_22075 ?auto_22105 ) ) ( not ( = ?auto_22088 ?auto_22109 ) ) ( not ( = ?auto_22088 ?auto_22100 ) ) ( not ( = ?auto_22088 ?auto_22094 ) ) ( not ( = ?auto_22088 ?auto_22103 ) ) ( not ( = ?auto_22088 ?auto_22115 ) ) ( not ( = ?auto_22088 ?auto_22112 ) ) ( not ( = ?auto_22088 ?auto_22108 ) ) ( not ( = ?auto_22088 ?auto_22105 ) ) ( not ( = ?auto_22066 ?auto_22076 ) ) ( not ( = ?auto_22066 ?auto_22116 ) ) ( not ( = ?auto_22067 ?auto_22076 ) ) ( not ( = ?auto_22067 ?auto_22116 ) ) ( not ( = ?auto_22068 ?auto_22076 ) ) ( not ( = ?auto_22068 ?auto_22116 ) ) ( not ( = ?auto_22069 ?auto_22076 ) ) ( not ( = ?auto_22069 ?auto_22116 ) ) ( not ( = ?auto_22070 ?auto_22076 ) ) ( not ( = ?auto_22070 ?auto_22116 ) ) ( not ( = ?auto_22071 ?auto_22076 ) ) ( not ( = ?auto_22071 ?auto_22116 ) ) ( not ( = ?auto_22072 ?auto_22076 ) ) ( not ( = ?auto_22072 ?auto_22116 ) ) ( not ( = ?auto_22073 ?auto_22076 ) ) ( not ( = ?auto_22073 ?auto_22116 ) ) ( not ( = ?auto_22074 ?auto_22076 ) ) ( not ( = ?auto_22074 ?auto_22116 ) ) ( not ( = ?auto_22076 ?auto_22088 ) ) ( not ( = ?auto_22076 ?auto_22109 ) ) ( not ( = ?auto_22076 ?auto_22100 ) ) ( not ( = ?auto_22076 ?auto_22094 ) ) ( not ( = ?auto_22076 ?auto_22103 ) ) ( not ( = ?auto_22076 ?auto_22115 ) ) ( not ( = ?auto_22076 ?auto_22112 ) ) ( not ( = ?auto_22076 ?auto_22108 ) ) ( not ( = ?auto_22076 ?auto_22105 ) ) ( not ( = ?auto_22116 ?auto_22088 ) ) ( not ( = ?auto_22116 ?auto_22109 ) ) ( not ( = ?auto_22116 ?auto_22100 ) ) ( not ( = ?auto_22116 ?auto_22094 ) ) ( not ( = ?auto_22116 ?auto_22103 ) ) ( not ( = ?auto_22116 ?auto_22115 ) ) ( not ( = ?auto_22116 ?auto_22112 ) ) ( not ( = ?auto_22116 ?auto_22108 ) ) ( not ( = ?auto_22116 ?auto_22105 ) ) ( not ( = ?auto_22066 ?auto_22077 ) ) ( not ( = ?auto_22066 ?auto_22121 ) ) ( not ( = ?auto_22067 ?auto_22077 ) ) ( not ( = ?auto_22067 ?auto_22121 ) ) ( not ( = ?auto_22068 ?auto_22077 ) ) ( not ( = ?auto_22068 ?auto_22121 ) ) ( not ( = ?auto_22069 ?auto_22077 ) ) ( not ( = ?auto_22069 ?auto_22121 ) ) ( not ( = ?auto_22070 ?auto_22077 ) ) ( not ( = ?auto_22070 ?auto_22121 ) ) ( not ( = ?auto_22071 ?auto_22077 ) ) ( not ( = ?auto_22071 ?auto_22121 ) ) ( not ( = ?auto_22072 ?auto_22077 ) ) ( not ( = ?auto_22072 ?auto_22121 ) ) ( not ( = ?auto_22073 ?auto_22077 ) ) ( not ( = ?auto_22073 ?auto_22121 ) ) ( not ( = ?auto_22074 ?auto_22077 ) ) ( not ( = ?auto_22074 ?auto_22121 ) ) ( not ( = ?auto_22075 ?auto_22077 ) ) ( not ( = ?auto_22075 ?auto_22121 ) ) ( not ( = ?auto_22077 ?auto_22116 ) ) ( not ( = ?auto_22077 ?auto_22088 ) ) ( not ( = ?auto_22077 ?auto_22109 ) ) ( not ( = ?auto_22077 ?auto_22100 ) ) ( not ( = ?auto_22077 ?auto_22094 ) ) ( not ( = ?auto_22077 ?auto_22103 ) ) ( not ( = ?auto_22077 ?auto_22115 ) ) ( not ( = ?auto_22077 ?auto_22112 ) ) ( not ( = ?auto_22077 ?auto_22108 ) ) ( not ( = ?auto_22077 ?auto_22105 ) ) ( not ( = ?auto_22121 ?auto_22116 ) ) ( not ( = ?auto_22121 ?auto_22088 ) ) ( not ( = ?auto_22121 ?auto_22109 ) ) ( not ( = ?auto_22121 ?auto_22100 ) ) ( not ( = ?auto_22121 ?auto_22094 ) ) ( not ( = ?auto_22121 ?auto_22103 ) ) ( not ( = ?auto_22121 ?auto_22115 ) ) ( not ( = ?auto_22121 ?auto_22112 ) ) ( not ( = ?auto_22121 ?auto_22108 ) ) ( not ( = ?auto_22121 ?auto_22105 ) ) ( not ( = ?auto_22066 ?auto_22078 ) ) ( not ( = ?auto_22066 ?auto_22110 ) ) ( not ( = ?auto_22067 ?auto_22078 ) ) ( not ( = ?auto_22067 ?auto_22110 ) ) ( not ( = ?auto_22068 ?auto_22078 ) ) ( not ( = ?auto_22068 ?auto_22110 ) ) ( not ( = ?auto_22069 ?auto_22078 ) ) ( not ( = ?auto_22069 ?auto_22110 ) ) ( not ( = ?auto_22070 ?auto_22078 ) ) ( not ( = ?auto_22070 ?auto_22110 ) ) ( not ( = ?auto_22071 ?auto_22078 ) ) ( not ( = ?auto_22071 ?auto_22110 ) ) ( not ( = ?auto_22072 ?auto_22078 ) ) ( not ( = ?auto_22072 ?auto_22110 ) ) ( not ( = ?auto_22073 ?auto_22078 ) ) ( not ( = ?auto_22073 ?auto_22110 ) ) ( not ( = ?auto_22074 ?auto_22078 ) ) ( not ( = ?auto_22074 ?auto_22110 ) ) ( not ( = ?auto_22075 ?auto_22078 ) ) ( not ( = ?auto_22075 ?auto_22110 ) ) ( not ( = ?auto_22076 ?auto_22078 ) ) ( not ( = ?auto_22076 ?auto_22110 ) ) ( not ( = ?auto_22078 ?auto_22121 ) ) ( not ( = ?auto_22078 ?auto_22116 ) ) ( not ( = ?auto_22078 ?auto_22088 ) ) ( not ( = ?auto_22078 ?auto_22109 ) ) ( not ( = ?auto_22078 ?auto_22100 ) ) ( not ( = ?auto_22078 ?auto_22094 ) ) ( not ( = ?auto_22078 ?auto_22103 ) ) ( not ( = ?auto_22078 ?auto_22115 ) ) ( not ( = ?auto_22078 ?auto_22112 ) ) ( not ( = ?auto_22078 ?auto_22108 ) ) ( not ( = ?auto_22078 ?auto_22105 ) ) ( not ( = ?auto_22110 ?auto_22121 ) ) ( not ( = ?auto_22110 ?auto_22116 ) ) ( not ( = ?auto_22110 ?auto_22088 ) ) ( not ( = ?auto_22110 ?auto_22109 ) ) ( not ( = ?auto_22110 ?auto_22100 ) ) ( not ( = ?auto_22110 ?auto_22094 ) ) ( not ( = ?auto_22110 ?auto_22103 ) ) ( not ( = ?auto_22110 ?auto_22115 ) ) ( not ( = ?auto_22110 ?auto_22112 ) ) ( not ( = ?auto_22110 ?auto_22108 ) ) ( not ( = ?auto_22110 ?auto_22105 ) ) ( not ( = ?auto_22066 ?auto_22079 ) ) ( not ( = ?auto_22066 ?auto_22118 ) ) ( not ( = ?auto_22067 ?auto_22079 ) ) ( not ( = ?auto_22067 ?auto_22118 ) ) ( not ( = ?auto_22068 ?auto_22079 ) ) ( not ( = ?auto_22068 ?auto_22118 ) ) ( not ( = ?auto_22069 ?auto_22079 ) ) ( not ( = ?auto_22069 ?auto_22118 ) ) ( not ( = ?auto_22070 ?auto_22079 ) ) ( not ( = ?auto_22070 ?auto_22118 ) ) ( not ( = ?auto_22071 ?auto_22079 ) ) ( not ( = ?auto_22071 ?auto_22118 ) ) ( not ( = ?auto_22072 ?auto_22079 ) ) ( not ( = ?auto_22072 ?auto_22118 ) ) ( not ( = ?auto_22073 ?auto_22079 ) ) ( not ( = ?auto_22073 ?auto_22118 ) ) ( not ( = ?auto_22074 ?auto_22079 ) ) ( not ( = ?auto_22074 ?auto_22118 ) ) ( not ( = ?auto_22075 ?auto_22079 ) ) ( not ( = ?auto_22075 ?auto_22118 ) ) ( not ( = ?auto_22076 ?auto_22079 ) ) ( not ( = ?auto_22076 ?auto_22118 ) ) ( not ( = ?auto_22077 ?auto_22079 ) ) ( not ( = ?auto_22077 ?auto_22118 ) ) ( not ( = ?auto_22079 ?auto_22110 ) ) ( not ( = ?auto_22079 ?auto_22121 ) ) ( not ( = ?auto_22079 ?auto_22116 ) ) ( not ( = ?auto_22079 ?auto_22088 ) ) ( not ( = ?auto_22079 ?auto_22109 ) ) ( not ( = ?auto_22079 ?auto_22100 ) ) ( not ( = ?auto_22079 ?auto_22094 ) ) ( not ( = ?auto_22079 ?auto_22103 ) ) ( not ( = ?auto_22079 ?auto_22115 ) ) ( not ( = ?auto_22079 ?auto_22112 ) ) ( not ( = ?auto_22079 ?auto_22108 ) ) ( not ( = ?auto_22079 ?auto_22105 ) ) ( not ( = ?auto_22117 ?auto_22097 ) ) ( not ( = ?auto_22117 ?auto_22091 ) ) ( not ( = ?auto_22117 ?auto_22096 ) ) ( not ( = ?auto_22117 ?auto_22089 ) ) ( not ( = ?auto_22117 ?auto_22102 ) ) ( not ( = ?auto_22117 ?auto_22113 ) ) ( not ( = ?auto_22117 ?auto_22093 ) ) ( not ( = ?auto_22117 ?auto_22090 ) ) ( not ( = ?auto_22098 ?auto_22107 ) ) ( not ( = ?auto_22098 ?auto_22101 ) ) ( not ( = ?auto_22098 ?auto_22099 ) ) ( not ( = ?auto_22098 ?auto_22111 ) ) ( not ( = ?auto_22098 ?auto_22106 ) ) ( not ( = ?auto_22098 ?auto_22095 ) ) ( not ( = ?auto_22098 ?auto_22119 ) ) ( not ( = ?auto_22098 ?auto_22104 ) ) ( not ( = ?auto_22118 ?auto_22110 ) ) ( not ( = ?auto_22118 ?auto_22121 ) ) ( not ( = ?auto_22118 ?auto_22116 ) ) ( not ( = ?auto_22118 ?auto_22088 ) ) ( not ( = ?auto_22118 ?auto_22109 ) ) ( not ( = ?auto_22118 ?auto_22100 ) ) ( not ( = ?auto_22118 ?auto_22094 ) ) ( not ( = ?auto_22118 ?auto_22103 ) ) ( not ( = ?auto_22118 ?auto_22115 ) ) ( not ( = ?auto_22118 ?auto_22112 ) ) ( not ( = ?auto_22118 ?auto_22108 ) ) ( not ( = ?auto_22118 ?auto_22105 ) ) ( not ( = ?auto_22066 ?auto_22081 ) ) ( not ( = ?auto_22066 ?auto_22120 ) ) ( not ( = ?auto_22067 ?auto_22081 ) ) ( not ( = ?auto_22067 ?auto_22120 ) ) ( not ( = ?auto_22068 ?auto_22081 ) ) ( not ( = ?auto_22068 ?auto_22120 ) ) ( not ( = ?auto_22069 ?auto_22081 ) ) ( not ( = ?auto_22069 ?auto_22120 ) ) ( not ( = ?auto_22070 ?auto_22081 ) ) ( not ( = ?auto_22070 ?auto_22120 ) ) ( not ( = ?auto_22071 ?auto_22081 ) ) ( not ( = ?auto_22071 ?auto_22120 ) ) ( not ( = ?auto_22072 ?auto_22081 ) ) ( not ( = ?auto_22072 ?auto_22120 ) ) ( not ( = ?auto_22073 ?auto_22081 ) ) ( not ( = ?auto_22073 ?auto_22120 ) ) ( not ( = ?auto_22074 ?auto_22081 ) ) ( not ( = ?auto_22074 ?auto_22120 ) ) ( not ( = ?auto_22075 ?auto_22081 ) ) ( not ( = ?auto_22075 ?auto_22120 ) ) ( not ( = ?auto_22076 ?auto_22081 ) ) ( not ( = ?auto_22076 ?auto_22120 ) ) ( not ( = ?auto_22077 ?auto_22081 ) ) ( not ( = ?auto_22077 ?auto_22120 ) ) ( not ( = ?auto_22078 ?auto_22081 ) ) ( not ( = ?auto_22078 ?auto_22120 ) ) ( not ( = ?auto_22081 ?auto_22118 ) ) ( not ( = ?auto_22081 ?auto_22110 ) ) ( not ( = ?auto_22081 ?auto_22121 ) ) ( not ( = ?auto_22081 ?auto_22116 ) ) ( not ( = ?auto_22081 ?auto_22088 ) ) ( not ( = ?auto_22081 ?auto_22109 ) ) ( not ( = ?auto_22081 ?auto_22100 ) ) ( not ( = ?auto_22081 ?auto_22094 ) ) ( not ( = ?auto_22081 ?auto_22103 ) ) ( not ( = ?auto_22081 ?auto_22115 ) ) ( not ( = ?auto_22081 ?auto_22112 ) ) ( not ( = ?auto_22081 ?auto_22108 ) ) ( not ( = ?auto_22081 ?auto_22105 ) ) ( not ( = ?auto_22092 ?auto_22117 ) ) ( not ( = ?auto_22092 ?auto_22097 ) ) ( not ( = ?auto_22092 ?auto_22091 ) ) ( not ( = ?auto_22092 ?auto_22096 ) ) ( not ( = ?auto_22092 ?auto_22089 ) ) ( not ( = ?auto_22092 ?auto_22102 ) ) ( not ( = ?auto_22092 ?auto_22113 ) ) ( not ( = ?auto_22092 ?auto_22093 ) ) ( not ( = ?auto_22092 ?auto_22090 ) ) ( not ( = ?auto_22114 ?auto_22098 ) ) ( not ( = ?auto_22114 ?auto_22107 ) ) ( not ( = ?auto_22114 ?auto_22101 ) ) ( not ( = ?auto_22114 ?auto_22099 ) ) ( not ( = ?auto_22114 ?auto_22111 ) ) ( not ( = ?auto_22114 ?auto_22106 ) ) ( not ( = ?auto_22114 ?auto_22095 ) ) ( not ( = ?auto_22114 ?auto_22119 ) ) ( not ( = ?auto_22114 ?auto_22104 ) ) ( not ( = ?auto_22120 ?auto_22118 ) ) ( not ( = ?auto_22120 ?auto_22110 ) ) ( not ( = ?auto_22120 ?auto_22121 ) ) ( not ( = ?auto_22120 ?auto_22116 ) ) ( not ( = ?auto_22120 ?auto_22088 ) ) ( not ( = ?auto_22120 ?auto_22109 ) ) ( not ( = ?auto_22120 ?auto_22100 ) ) ( not ( = ?auto_22120 ?auto_22094 ) ) ( not ( = ?auto_22120 ?auto_22103 ) ) ( not ( = ?auto_22120 ?auto_22115 ) ) ( not ( = ?auto_22120 ?auto_22112 ) ) ( not ( = ?auto_22120 ?auto_22108 ) ) ( not ( = ?auto_22120 ?auto_22105 ) ) ( not ( = ?auto_22066 ?auto_22080 ) ) ( not ( = ?auto_22066 ?auto_22083 ) ) ( not ( = ?auto_22067 ?auto_22080 ) ) ( not ( = ?auto_22067 ?auto_22083 ) ) ( not ( = ?auto_22068 ?auto_22080 ) ) ( not ( = ?auto_22068 ?auto_22083 ) ) ( not ( = ?auto_22069 ?auto_22080 ) ) ( not ( = ?auto_22069 ?auto_22083 ) ) ( not ( = ?auto_22070 ?auto_22080 ) ) ( not ( = ?auto_22070 ?auto_22083 ) ) ( not ( = ?auto_22071 ?auto_22080 ) ) ( not ( = ?auto_22071 ?auto_22083 ) ) ( not ( = ?auto_22072 ?auto_22080 ) ) ( not ( = ?auto_22072 ?auto_22083 ) ) ( not ( = ?auto_22073 ?auto_22080 ) ) ( not ( = ?auto_22073 ?auto_22083 ) ) ( not ( = ?auto_22074 ?auto_22080 ) ) ( not ( = ?auto_22074 ?auto_22083 ) ) ( not ( = ?auto_22075 ?auto_22080 ) ) ( not ( = ?auto_22075 ?auto_22083 ) ) ( not ( = ?auto_22076 ?auto_22080 ) ) ( not ( = ?auto_22076 ?auto_22083 ) ) ( not ( = ?auto_22077 ?auto_22080 ) ) ( not ( = ?auto_22077 ?auto_22083 ) ) ( not ( = ?auto_22078 ?auto_22080 ) ) ( not ( = ?auto_22078 ?auto_22083 ) ) ( not ( = ?auto_22079 ?auto_22080 ) ) ( not ( = ?auto_22079 ?auto_22083 ) ) ( not ( = ?auto_22080 ?auto_22120 ) ) ( not ( = ?auto_22080 ?auto_22118 ) ) ( not ( = ?auto_22080 ?auto_22110 ) ) ( not ( = ?auto_22080 ?auto_22121 ) ) ( not ( = ?auto_22080 ?auto_22116 ) ) ( not ( = ?auto_22080 ?auto_22088 ) ) ( not ( = ?auto_22080 ?auto_22109 ) ) ( not ( = ?auto_22080 ?auto_22100 ) ) ( not ( = ?auto_22080 ?auto_22094 ) ) ( not ( = ?auto_22080 ?auto_22103 ) ) ( not ( = ?auto_22080 ?auto_22115 ) ) ( not ( = ?auto_22080 ?auto_22112 ) ) ( not ( = ?auto_22080 ?auto_22108 ) ) ( not ( = ?auto_22080 ?auto_22105 ) ) ( not ( = ?auto_22084 ?auto_22092 ) ) ( not ( = ?auto_22084 ?auto_22117 ) ) ( not ( = ?auto_22084 ?auto_22097 ) ) ( not ( = ?auto_22084 ?auto_22091 ) ) ( not ( = ?auto_22084 ?auto_22096 ) ) ( not ( = ?auto_22084 ?auto_22089 ) ) ( not ( = ?auto_22084 ?auto_22102 ) ) ( not ( = ?auto_22084 ?auto_22113 ) ) ( not ( = ?auto_22084 ?auto_22093 ) ) ( not ( = ?auto_22084 ?auto_22090 ) ) ( not ( = ?auto_22087 ?auto_22114 ) ) ( not ( = ?auto_22087 ?auto_22098 ) ) ( not ( = ?auto_22087 ?auto_22107 ) ) ( not ( = ?auto_22087 ?auto_22101 ) ) ( not ( = ?auto_22087 ?auto_22099 ) ) ( not ( = ?auto_22087 ?auto_22111 ) ) ( not ( = ?auto_22087 ?auto_22106 ) ) ( not ( = ?auto_22087 ?auto_22095 ) ) ( not ( = ?auto_22087 ?auto_22119 ) ) ( not ( = ?auto_22087 ?auto_22104 ) ) ( not ( = ?auto_22083 ?auto_22120 ) ) ( not ( = ?auto_22083 ?auto_22118 ) ) ( not ( = ?auto_22083 ?auto_22110 ) ) ( not ( = ?auto_22083 ?auto_22121 ) ) ( not ( = ?auto_22083 ?auto_22116 ) ) ( not ( = ?auto_22083 ?auto_22088 ) ) ( not ( = ?auto_22083 ?auto_22109 ) ) ( not ( = ?auto_22083 ?auto_22100 ) ) ( not ( = ?auto_22083 ?auto_22094 ) ) ( not ( = ?auto_22083 ?auto_22103 ) ) ( not ( = ?auto_22083 ?auto_22115 ) ) ( not ( = ?auto_22083 ?auto_22112 ) ) ( not ( = ?auto_22083 ?auto_22108 ) ) ( not ( = ?auto_22083 ?auto_22105 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_22066 ?auto_22067 ?auto_22068 ?auto_22069 ?auto_22070 ?auto_22071 ?auto_22072 ?auto_22073 ?auto_22074 ?auto_22075 ?auto_22076 ?auto_22077 ?auto_22078 ?auto_22079 ?auto_22081 )
      ( MAKE-1CRATE ?auto_22081 ?auto_22080 )
      ( MAKE-15CRATE-VERIFY ?auto_22066 ?auto_22067 ?auto_22068 ?auto_22069 ?auto_22070 ?auto_22071 ?auto_22072 ?auto_22073 ?auto_22074 ?auto_22075 ?auto_22076 ?auto_22077 ?auto_22078 ?auto_22079 ?auto_22081 ?auto_22080 ) )
  )

)

