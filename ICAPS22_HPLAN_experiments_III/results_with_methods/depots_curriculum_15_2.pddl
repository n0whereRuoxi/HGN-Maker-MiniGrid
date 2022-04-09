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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21363 - SURFACE
      ?auto_21364 - SURFACE
    )
    :vars
    (
      ?auto_21365 - HOIST
      ?auto_21366 - PLACE
      ?auto_21368 - PLACE
      ?auto_21369 - HOIST
      ?auto_21370 - SURFACE
      ?auto_21367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21365 ?auto_21366 ) ( SURFACE-AT ?auto_21363 ?auto_21366 ) ( CLEAR ?auto_21363 ) ( IS-CRATE ?auto_21364 ) ( AVAILABLE ?auto_21365 ) ( not ( = ?auto_21368 ?auto_21366 ) ) ( HOIST-AT ?auto_21369 ?auto_21368 ) ( AVAILABLE ?auto_21369 ) ( SURFACE-AT ?auto_21364 ?auto_21368 ) ( ON ?auto_21364 ?auto_21370 ) ( CLEAR ?auto_21364 ) ( TRUCK-AT ?auto_21367 ?auto_21366 ) ( not ( = ?auto_21363 ?auto_21364 ) ) ( not ( = ?auto_21363 ?auto_21370 ) ) ( not ( = ?auto_21364 ?auto_21370 ) ) ( not ( = ?auto_21365 ?auto_21369 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21367 ?auto_21366 ?auto_21368 )
      ( !LIFT ?auto_21369 ?auto_21364 ?auto_21370 ?auto_21368 )
      ( !LOAD ?auto_21369 ?auto_21364 ?auto_21367 ?auto_21368 )
      ( !DRIVE ?auto_21367 ?auto_21368 ?auto_21366 )
      ( !UNLOAD ?auto_21365 ?auto_21364 ?auto_21367 ?auto_21366 )
      ( !DROP ?auto_21365 ?auto_21364 ?auto_21363 ?auto_21366 )
      ( MAKE-1CRATE-VERIFY ?auto_21363 ?auto_21364 ) )
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
      ?auto_21377 - HOIST
      ?auto_21378 - PLACE
      ?auto_21380 - PLACE
      ?auto_21379 - HOIST
      ?auto_21382 - SURFACE
      ?auto_21383 - PLACE
      ?auto_21384 - HOIST
      ?auto_21385 - SURFACE
      ?auto_21381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21377 ?auto_21378 ) ( IS-CRATE ?auto_21376 ) ( not ( = ?auto_21380 ?auto_21378 ) ) ( HOIST-AT ?auto_21379 ?auto_21380 ) ( AVAILABLE ?auto_21379 ) ( SURFACE-AT ?auto_21376 ?auto_21380 ) ( ON ?auto_21376 ?auto_21382 ) ( CLEAR ?auto_21376 ) ( not ( = ?auto_21375 ?auto_21376 ) ) ( not ( = ?auto_21375 ?auto_21382 ) ) ( not ( = ?auto_21376 ?auto_21382 ) ) ( not ( = ?auto_21377 ?auto_21379 ) ) ( SURFACE-AT ?auto_21374 ?auto_21378 ) ( CLEAR ?auto_21374 ) ( IS-CRATE ?auto_21375 ) ( AVAILABLE ?auto_21377 ) ( not ( = ?auto_21383 ?auto_21378 ) ) ( HOIST-AT ?auto_21384 ?auto_21383 ) ( AVAILABLE ?auto_21384 ) ( SURFACE-AT ?auto_21375 ?auto_21383 ) ( ON ?auto_21375 ?auto_21385 ) ( CLEAR ?auto_21375 ) ( TRUCK-AT ?auto_21381 ?auto_21378 ) ( not ( = ?auto_21374 ?auto_21375 ) ) ( not ( = ?auto_21374 ?auto_21385 ) ) ( not ( = ?auto_21375 ?auto_21385 ) ) ( not ( = ?auto_21377 ?auto_21384 ) ) ( not ( = ?auto_21374 ?auto_21376 ) ) ( not ( = ?auto_21374 ?auto_21382 ) ) ( not ( = ?auto_21376 ?auto_21385 ) ) ( not ( = ?auto_21380 ?auto_21383 ) ) ( not ( = ?auto_21379 ?auto_21384 ) ) ( not ( = ?auto_21382 ?auto_21385 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21374 ?auto_21375 )
      ( MAKE-1CRATE ?auto_21375 ?auto_21376 )
      ( MAKE-2CRATE-VERIFY ?auto_21374 ?auto_21375 ?auto_21376 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21388 - SURFACE
      ?auto_21389 - SURFACE
    )
    :vars
    (
      ?auto_21390 - HOIST
      ?auto_21391 - PLACE
      ?auto_21393 - PLACE
      ?auto_21394 - HOIST
      ?auto_21395 - SURFACE
      ?auto_21392 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21390 ?auto_21391 ) ( SURFACE-AT ?auto_21388 ?auto_21391 ) ( CLEAR ?auto_21388 ) ( IS-CRATE ?auto_21389 ) ( AVAILABLE ?auto_21390 ) ( not ( = ?auto_21393 ?auto_21391 ) ) ( HOIST-AT ?auto_21394 ?auto_21393 ) ( AVAILABLE ?auto_21394 ) ( SURFACE-AT ?auto_21389 ?auto_21393 ) ( ON ?auto_21389 ?auto_21395 ) ( CLEAR ?auto_21389 ) ( TRUCK-AT ?auto_21392 ?auto_21391 ) ( not ( = ?auto_21388 ?auto_21389 ) ) ( not ( = ?auto_21388 ?auto_21395 ) ) ( not ( = ?auto_21389 ?auto_21395 ) ) ( not ( = ?auto_21390 ?auto_21394 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21392 ?auto_21391 ?auto_21393 )
      ( !LIFT ?auto_21394 ?auto_21389 ?auto_21395 ?auto_21393 )
      ( !LOAD ?auto_21394 ?auto_21389 ?auto_21392 ?auto_21393 )
      ( !DRIVE ?auto_21392 ?auto_21393 ?auto_21391 )
      ( !UNLOAD ?auto_21390 ?auto_21389 ?auto_21392 ?auto_21391 )
      ( !DROP ?auto_21390 ?auto_21389 ?auto_21388 ?auto_21391 )
      ( MAKE-1CRATE-VERIFY ?auto_21388 ?auto_21389 ) )
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
      ?auto_21404 - HOIST
      ?auto_21405 - PLACE
      ?auto_21406 - PLACE
      ?auto_21408 - HOIST
      ?auto_21409 - SURFACE
      ?auto_21414 - PLACE
      ?auto_21412 - HOIST
      ?auto_21413 - SURFACE
      ?auto_21410 - PLACE
      ?auto_21411 - HOIST
      ?auto_21415 - SURFACE
      ?auto_21407 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21404 ?auto_21405 ) ( IS-CRATE ?auto_21403 ) ( not ( = ?auto_21406 ?auto_21405 ) ) ( HOIST-AT ?auto_21408 ?auto_21406 ) ( AVAILABLE ?auto_21408 ) ( SURFACE-AT ?auto_21403 ?auto_21406 ) ( ON ?auto_21403 ?auto_21409 ) ( CLEAR ?auto_21403 ) ( not ( = ?auto_21402 ?auto_21403 ) ) ( not ( = ?auto_21402 ?auto_21409 ) ) ( not ( = ?auto_21403 ?auto_21409 ) ) ( not ( = ?auto_21404 ?auto_21408 ) ) ( IS-CRATE ?auto_21402 ) ( not ( = ?auto_21414 ?auto_21405 ) ) ( HOIST-AT ?auto_21412 ?auto_21414 ) ( AVAILABLE ?auto_21412 ) ( SURFACE-AT ?auto_21402 ?auto_21414 ) ( ON ?auto_21402 ?auto_21413 ) ( CLEAR ?auto_21402 ) ( not ( = ?auto_21401 ?auto_21402 ) ) ( not ( = ?auto_21401 ?auto_21413 ) ) ( not ( = ?auto_21402 ?auto_21413 ) ) ( not ( = ?auto_21404 ?auto_21412 ) ) ( SURFACE-AT ?auto_21400 ?auto_21405 ) ( CLEAR ?auto_21400 ) ( IS-CRATE ?auto_21401 ) ( AVAILABLE ?auto_21404 ) ( not ( = ?auto_21410 ?auto_21405 ) ) ( HOIST-AT ?auto_21411 ?auto_21410 ) ( AVAILABLE ?auto_21411 ) ( SURFACE-AT ?auto_21401 ?auto_21410 ) ( ON ?auto_21401 ?auto_21415 ) ( CLEAR ?auto_21401 ) ( TRUCK-AT ?auto_21407 ?auto_21405 ) ( not ( = ?auto_21400 ?auto_21401 ) ) ( not ( = ?auto_21400 ?auto_21415 ) ) ( not ( = ?auto_21401 ?auto_21415 ) ) ( not ( = ?auto_21404 ?auto_21411 ) ) ( not ( = ?auto_21400 ?auto_21402 ) ) ( not ( = ?auto_21400 ?auto_21413 ) ) ( not ( = ?auto_21402 ?auto_21415 ) ) ( not ( = ?auto_21414 ?auto_21410 ) ) ( not ( = ?auto_21412 ?auto_21411 ) ) ( not ( = ?auto_21413 ?auto_21415 ) ) ( not ( = ?auto_21400 ?auto_21403 ) ) ( not ( = ?auto_21400 ?auto_21409 ) ) ( not ( = ?auto_21401 ?auto_21403 ) ) ( not ( = ?auto_21401 ?auto_21409 ) ) ( not ( = ?auto_21403 ?auto_21413 ) ) ( not ( = ?auto_21403 ?auto_21415 ) ) ( not ( = ?auto_21406 ?auto_21414 ) ) ( not ( = ?auto_21406 ?auto_21410 ) ) ( not ( = ?auto_21408 ?auto_21412 ) ) ( not ( = ?auto_21408 ?auto_21411 ) ) ( not ( = ?auto_21409 ?auto_21413 ) ) ( not ( = ?auto_21409 ?auto_21415 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21400 ?auto_21401 ?auto_21402 )
      ( MAKE-1CRATE ?auto_21402 ?auto_21403 )
      ( MAKE-3CRATE-VERIFY ?auto_21400 ?auto_21401 ?auto_21402 ?auto_21403 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21418 - SURFACE
      ?auto_21419 - SURFACE
    )
    :vars
    (
      ?auto_21420 - HOIST
      ?auto_21421 - PLACE
      ?auto_21423 - PLACE
      ?auto_21424 - HOIST
      ?auto_21425 - SURFACE
      ?auto_21422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21420 ?auto_21421 ) ( SURFACE-AT ?auto_21418 ?auto_21421 ) ( CLEAR ?auto_21418 ) ( IS-CRATE ?auto_21419 ) ( AVAILABLE ?auto_21420 ) ( not ( = ?auto_21423 ?auto_21421 ) ) ( HOIST-AT ?auto_21424 ?auto_21423 ) ( AVAILABLE ?auto_21424 ) ( SURFACE-AT ?auto_21419 ?auto_21423 ) ( ON ?auto_21419 ?auto_21425 ) ( CLEAR ?auto_21419 ) ( TRUCK-AT ?auto_21422 ?auto_21421 ) ( not ( = ?auto_21418 ?auto_21419 ) ) ( not ( = ?auto_21418 ?auto_21425 ) ) ( not ( = ?auto_21419 ?auto_21425 ) ) ( not ( = ?auto_21420 ?auto_21424 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21422 ?auto_21421 ?auto_21423 )
      ( !LIFT ?auto_21424 ?auto_21419 ?auto_21425 ?auto_21423 )
      ( !LOAD ?auto_21424 ?auto_21419 ?auto_21422 ?auto_21423 )
      ( !DRIVE ?auto_21422 ?auto_21423 ?auto_21421 )
      ( !UNLOAD ?auto_21420 ?auto_21419 ?auto_21422 ?auto_21421 )
      ( !DROP ?auto_21420 ?auto_21419 ?auto_21418 ?auto_21421 )
      ( MAKE-1CRATE-VERIFY ?auto_21418 ?auto_21419 ) )
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
      ?auto_21437 - HOIST
      ?auto_21438 - PLACE
      ?auto_21440 - PLACE
      ?auto_21441 - HOIST
      ?auto_21439 - SURFACE
      ?auto_21442 - PLACE
      ?auto_21450 - HOIST
      ?auto_21444 - SURFACE
      ?auto_21443 - PLACE
      ?auto_21446 - HOIST
      ?auto_21445 - SURFACE
      ?auto_21447 - PLACE
      ?auto_21449 - HOIST
      ?auto_21448 - SURFACE
      ?auto_21436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21437 ?auto_21438 ) ( IS-CRATE ?auto_21435 ) ( not ( = ?auto_21440 ?auto_21438 ) ) ( HOIST-AT ?auto_21441 ?auto_21440 ) ( AVAILABLE ?auto_21441 ) ( SURFACE-AT ?auto_21435 ?auto_21440 ) ( ON ?auto_21435 ?auto_21439 ) ( CLEAR ?auto_21435 ) ( not ( = ?auto_21434 ?auto_21435 ) ) ( not ( = ?auto_21434 ?auto_21439 ) ) ( not ( = ?auto_21435 ?auto_21439 ) ) ( not ( = ?auto_21437 ?auto_21441 ) ) ( IS-CRATE ?auto_21434 ) ( not ( = ?auto_21442 ?auto_21438 ) ) ( HOIST-AT ?auto_21450 ?auto_21442 ) ( AVAILABLE ?auto_21450 ) ( SURFACE-AT ?auto_21434 ?auto_21442 ) ( ON ?auto_21434 ?auto_21444 ) ( CLEAR ?auto_21434 ) ( not ( = ?auto_21433 ?auto_21434 ) ) ( not ( = ?auto_21433 ?auto_21444 ) ) ( not ( = ?auto_21434 ?auto_21444 ) ) ( not ( = ?auto_21437 ?auto_21450 ) ) ( IS-CRATE ?auto_21433 ) ( not ( = ?auto_21443 ?auto_21438 ) ) ( HOIST-AT ?auto_21446 ?auto_21443 ) ( AVAILABLE ?auto_21446 ) ( SURFACE-AT ?auto_21433 ?auto_21443 ) ( ON ?auto_21433 ?auto_21445 ) ( CLEAR ?auto_21433 ) ( not ( = ?auto_21432 ?auto_21433 ) ) ( not ( = ?auto_21432 ?auto_21445 ) ) ( not ( = ?auto_21433 ?auto_21445 ) ) ( not ( = ?auto_21437 ?auto_21446 ) ) ( SURFACE-AT ?auto_21431 ?auto_21438 ) ( CLEAR ?auto_21431 ) ( IS-CRATE ?auto_21432 ) ( AVAILABLE ?auto_21437 ) ( not ( = ?auto_21447 ?auto_21438 ) ) ( HOIST-AT ?auto_21449 ?auto_21447 ) ( AVAILABLE ?auto_21449 ) ( SURFACE-AT ?auto_21432 ?auto_21447 ) ( ON ?auto_21432 ?auto_21448 ) ( CLEAR ?auto_21432 ) ( TRUCK-AT ?auto_21436 ?auto_21438 ) ( not ( = ?auto_21431 ?auto_21432 ) ) ( not ( = ?auto_21431 ?auto_21448 ) ) ( not ( = ?auto_21432 ?auto_21448 ) ) ( not ( = ?auto_21437 ?auto_21449 ) ) ( not ( = ?auto_21431 ?auto_21433 ) ) ( not ( = ?auto_21431 ?auto_21445 ) ) ( not ( = ?auto_21433 ?auto_21448 ) ) ( not ( = ?auto_21443 ?auto_21447 ) ) ( not ( = ?auto_21446 ?auto_21449 ) ) ( not ( = ?auto_21445 ?auto_21448 ) ) ( not ( = ?auto_21431 ?auto_21434 ) ) ( not ( = ?auto_21431 ?auto_21444 ) ) ( not ( = ?auto_21432 ?auto_21434 ) ) ( not ( = ?auto_21432 ?auto_21444 ) ) ( not ( = ?auto_21434 ?auto_21445 ) ) ( not ( = ?auto_21434 ?auto_21448 ) ) ( not ( = ?auto_21442 ?auto_21443 ) ) ( not ( = ?auto_21442 ?auto_21447 ) ) ( not ( = ?auto_21450 ?auto_21446 ) ) ( not ( = ?auto_21450 ?auto_21449 ) ) ( not ( = ?auto_21444 ?auto_21445 ) ) ( not ( = ?auto_21444 ?auto_21448 ) ) ( not ( = ?auto_21431 ?auto_21435 ) ) ( not ( = ?auto_21431 ?auto_21439 ) ) ( not ( = ?auto_21432 ?auto_21435 ) ) ( not ( = ?auto_21432 ?auto_21439 ) ) ( not ( = ?auto_21433 ?auto_21435 ) ) ( not ( = ?auto_21433 ?auto_21439 ) ) ( not ( = ?auto_21435 ?auto_21444 ) ) ( not ( = ?auto_21435 ?auto_21445 ) ) ( not ( = ?auto_21435 ?auto_21448 ) ) ( not ( = ?auto_21440 ?auto_21442 ) ) ( not ( = ?auto_21440 ?auto_21443 ) ) ( not ( = ?auto_21440 ?auto_21447 ) ) ( not ( = ?auto_21441 ?auto_21450 ) ) ( not ( = ?auto_21441 ?auto_21446 ) ) ( not ( = ?auto_21441 ?auto_21449 ) ) ( not ( = ?auto_21439 ?auto_21444 ) ) ( not ( = ?auto_21439 ?auto_21445 ) ) ( not ( = ?auto_21439 ?auto_21448 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_21431 ?auto_21432 ?auto_21433 ?auto_21434 )
      ( MAKE-1CRATE ?auto_21434 ?auto_21435 )
      ( MAKE-4CRATE-VERIFY ?auto_21431 ?auto_21432 ?auto_21433 ?auto_21434 ?auto_21435 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21453 - SURFACE
      ?auto_21454 - SURFACE
    )
    :vars
    (
      ?auto_21455 - HOIST
      ?auto_21456 - PLACE
      ?auto_21458 - PLACE
      ?auto_21459 - HOIST
      ?auto_21460 - SURFACE
      ?auto_21457 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21455 ?auto_21456 ) ( SURFACE-AT ?auto_21453 ?auto_21456 ) ( CLEAR ?auto_21453 ) ( IS-CRATE ?auto_21454 ) ( AVAILABLE ?auto_21455 ) ( not ( = ?auto_21458 ?auto_21456 ) ) ( HOIST-AT ?auto_21459 ?auto_21458 ) ( AVAILABLE ?auto_21459 ) ( SURFACE-AT ?auto_21454 ?auto_21458 ) ( ON ?auto_21454 ?auto_21460 ) ( CLEAR ?auto_21454 ) ( TRUCK-AT ?auto_21457 ?auto_21456 ) ( not ( = ?auto_21453 ?auto_21454 ) ) ( not ( = ?auto_21453 ?auto_21460 ) ) ( not ( = ?auto_21454 ?auto_21460 ) ) ( not ( = ?auto_21455 ?auto_21459 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21457 ?auto_21456 ?auto_21458 )
      ( !LIFT ?auto_21459 ?auto_21454 ?auto_21460 ?auto_21458 )
      ( !LOAD ?auto_21459 ?auto_21454 ?auto_21457 ?auto_21458 )
      ( !DRIVE ?auto_21457 ?auto_21458 ?auto_21456 )
      ( !UNLOAD ?auto_21455 ?auto_21454 ?auto_21457 ?auto_21456 )
      ( !DROP ?auto_21455 ?auto_21454 ?auto_21453 ?auto_21456 )
      ( MAKE-1CRATE-VERIFY ?auto_21453 ?auto_21454 ) )
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
      ?auto_21478 - HOIST
      ?auto_21475 - PLACE
      ?auto_21473 - PLACE
      ?auto_21474 - HOIST
      ?auto_21476 - SURFACE
      ?auto_21479 - PLACE
      ?auto_21480 - HOIST
      ?auto_21488 - SURFACE
      ?auto_21482 - PLACE
      ?auto_21481 - HOIST
      ?auto_21483 - SURFACE
      ?auto_21484 - PLACE
      ?auto_21490 - HOIST
      ?auto_21489 - SURFACE
      ?auto_21487 - PLACE
      ?auto_21485 - HOIST
      ?auto_21486 - SURFACE
      ?auto_21477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21478 ?auto_21475 ) ( IS-CRATE ?auto_21472 ) ( not ( = ?auto_21473 ?auto_21475 ) ) ( HOIST-AT ?auto_21474 ?auto_21473 ) ( AVAILABLE ?auto_21474 ) ( SURFACE-AT ?auto_21472 ?auto_21473 ) ( ON ?auto_21472 ?auto_21476 ) ( CLEAR ?auto_21472 ) ( not ( = ?auto_21471 ?auto_21472 ) ) ( not ( = ?auto_21471 ?auto_21476 ) ) ( not ( = ?auto_21472 ?auto_21476 ) ) ( not ( = ?auto_21478 ?auto_21474 ) ) ( IS-CRATE ?auto_21471 ) ( not ( = ?auto_21479 ?auto_21475 ) ) ( HOIST-AT ?auto_21480 ?auto_21479 ) ( AVAILABLE ?auto_21480 ) ( SURFACE-AT ?auto_21471 ?auto_21479 ) ( ON ?auto_21471 ?auto_21488 ) ( CLEAR ?auto_21471 ) ( not ( = ?auto_21470 ?auto_21471 ) ) ( not ( = ?auto_21470 ?auto_21488 ) ) ( not ( = ?auto_21471 ?auto_21488 ) ) ( not ( = ?auto_21478 ?auto_21480 ) ) ( IS-CRATE ?auto_21470 ) ( not ( = ?auto_21482 ?auto_21475 ) ) ( HOIST-AT ?auto_21481 ?auto_21482 ) ( AVAILABLE ?auto_21481 ) ( SURFACE-AT ?auto_21470 ?auto_21482 ) ( ON ?auto_21470 ?auto_21483 ) ( CLEAR ?auto_21470 ) ( not ( = ?auto_21469 ?auto_21470 ) ) ( not ( = ?auto_21469 ?auto_21483 ) ) ( not ( = ?auto_21470 ?auto_21483 ) ) ( not ( = ?auto_21478 ?auto_21481 ) ) ( IS-CRATE ?auto_21469 ) ( not ( = ?auto_21484 ?auto_21475 ) ) ( HOIST-AT ?auto_21490 ?auto_21484 ) ( AVAILABLE ?auto_21490 ) ( SURFACE-AT ?auto_21469 ?auto_21484 ) ( ON ?auto_21469 ?auto_21489 ) ( CLEAR ?auto_21469 ) ( not ( = ?auto_21468 ?auto_21469 ) ) ( not ( = ?auto_21468 ?auto_21489 ) ) ( not ( = ?auto_21469 ?auto_21489 ) ) ( not ( = ?auto_21478 ?auto_21490 ) ) ( SURFACE-AT ?auto_21467 ?auto_21475 ) ( CLEAR ?auto_21467 ) ( IS-CRATE ?auto_21468 ) ( AVAILABLE ?auto_21478 ) ( not ( = ?auto_21487 ?auto_21475 ) ) ( HOIST-AT ?auto_21485 ?auto_21487 ) ( AVAILABLE ?auto_21485 ) ( SURFACE-AT ?auto_21468 ?auto_21487 ) ( ON ?auto_21468 ?auto_21486 ) ( CLEAR ?auto_21468 ) ( TRUCK-AT ?auto_21477 ?auto_21475 ) ( not ( = ?auto_21467 ?auto_21468 ) ) ( not ( = ?auto_21467 ?auto_21486 ) ) ( not ( = ?auto_21468 ?auto_21486 ) ) ( not ( = ?auto_21478 ?auto_21485 ) ) ( not ( = ?auto_21467 ?auto_21469 ) ) ( not ( = ?auto_21467 ?auto_21489 ) ) ( not ( = ?auto_21469 ?auto_21486 ) ) ( not ( = ?auto_21484 ?auto_21487 ) ) ( not ( = ?auto_21490 ?auto_21485 ) ) ( not ( = ?auto_21489 ?auto_21486 ) ) ( not ( = ?auto_21467 ?auto_21470 ) ) ( not ( = ?auto_21467 ?auto_21483 ) ) ( not ( = ?auto_21468 ?auto_21470 ) ) ( not ( = ?auto_21468 ?auto_21483 ) ) ( not ( = ?auto_21470 ?auto_21489 ) ) ( not ( = ?auto_21470 ?auto_21486 ) ) ( not ( = ?auto_21482 ?auto_21484 ) ) ( not ( = ?auto_21482 ?auto_21487 ) ) ( not ( = ?auto_21481 ?auto_21490 ) ) ( not ( = ?auto_21481 ?auto_21485 ) ) ( not ( = ?auto_21483 ?auto_21489 ) ) ( not ( = ?auto_21483 ?auto_21486 ) ) ( not ( = ?auto_21467 ?auto_21471 ) ) ( not ( = ?auto_21467 ?auto_21488 ) ) ( not ( = ?auto_21468 ?auto_21471 ) ) ( not ( = ?auto_21468 ?auto_21488 ) ) ( not ( = ?auto_21469 ?auto_21471 ) ) ( not ( = ?auto_21469 ?auto_21488 ) ) ( not ( = ?auto_21471 ?auto_21483 ) ) ( not ( = ?auto_21471 ?auto_21489 ) ) ( not ( = ?auto_21471 ?auto_21486 ) ) ( not ( = ?auto_21479 ?auto_21482 ) ) ( not ( = ?auto_21479 ?auto_21484 ) ) ( not ( = ?auto_21479 ?auto_21487 ) ) ( not ( = ?auto_21480 ?auto_21481 ) ) ( not ( = ?auto_21480 ?auto_21490 ) ) ( not ( = ?auto_21480 ?auto_21485 ) ) ( not ( = ?auto_21488 ?auto_21483 ) ) ( not ( = ?auto_21488 ?auto_21489 ) ) ( not ( = ?auto_21488 ?auto_21486 ) ) ( not ( = ?auto_21467 ?auto_21472 ) ) ( not ( = ?auto_21467 ?auto_21476 ) ) ( not ( = ?auto_21468 ?auto_21472 ) ) ( not ( = ?auto_21468 ?auto_21476 ) ) ( not ( = ?auto_21469 ?auto_21472 ) ) ( not ( = ?auto_21469 ?auto_21476 ) ) ( not ( = ?auto_21470 ?auto_21472 ) ) ( not ( = ?auto_21470 ?auto_21476 ) ) ( not ( = ?auto_21472 ?auto_21488 ) ) ( not ( = ?auto_21472 ?auto_21483 ) ) ( not ( = ?auto_21472 ?auto_21489 ) ) ( not ( = ?auto_21472 ?auto_21486 ) ) ( not ( = ?auto_21473 ?auto_21479 ) ) ( not ( = ?auto_21473 ?auto_21482 ) ) ( not ( = ?auto_21473 ?auto_21484 ) ) ( not ( = ?auto_21473 ?auto_21487 ) ) ( not ( = ?auto_21474 ?auto_21480 ) ) ( not ( = ?auto_21474 ?auto_21481 ) ) ( not ( = ?auto_21474 ?auto_21490 ) ) ( not ( = ?auto_21474 ?auto_21485 ) ) ( not ( = ?auto_21476 ?auto_21488 ) ) ( not ( = ?auto_21476 ?auto_21483 ) ) ( not ( = ?auto_21476 ?auto_21489 ) ) ( not ( = ?auto_21476 ?auto_21486 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_21467 ?auto_21468 ?auto_21469 ?auto_21470 ?auto_21471 )
      ( MAKE-1CRATE ?auto_21471 ?auto_21472 )
      ( MAKE-5CRATE-VERIFY ?auto_21467 ?auto_21468 ?auto_21469 ?auto_21470 ?auto_21471 ?auto_21472 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21493 - SURFACE
      ?auto_21494 - SURFACE
    )
    :vars
    (
      ?auto_21495 - HOIST
      ?auto_21496 - PLACE
      ?auto_21498 - PLACE
      ?auto_21499 - HOIST
      ?auto_21500 - SURFACE
      ?auto_21497 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21495 ?auto_21496 ) ( SURFACE-AT ?auto_21493 ?auto_21496 ) ( CLEAR ?auto_21493 ) ( IS-CRATE ?auto_21494 ) ( AVAILABLE ?auto_21495 ) ( not ( = ?auto_21498 ?auto_21496 ) ) ( HOIST-AT ?auto_21499 ?auto_21498 ) ( AVAILABLE ?auto_21499 ) ( SURFACE-AT ?auto_21494 ?auto_21498 ) ( ON ?auto_21494 ?auto_21500 ) ( CLEAR ?auto_21494 ) ( TRUCK-AT ?auto_21497 ?auto_21496 ) ( not ( = ?auto_21493 ?auto_21494 ) ) ( not ( = ?auto_21493 ?auto_21500 ) ) ( not ( = ?auto_21494 ?auto_21500 ) ) ( not ( = ?auto_21495 ?auto_21499 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21497 ?auto_21496 ?auto_21498 )
      ( !LIFT ?auto_21499 ?auto_21494 ?auto_21500 ?auto_21498 )
      ( !LOAD ?auto_21499 ?auto_21494 ?auto_21497 ?auto_21498 )
      ( !DRIVE ?auto_21497 ?auto_21498 ?auto_21496 )
      ( !UNLOAD ?auto_21495 ?auto_21494 ?auto_21497 ?auto_21496 )
      ( !DROP ?auto_21495 ?auto_21494 ?auto_21493 ?auto_21496 )
      ( MAKE-1CRATE-VERIFY ?auto_21493 ?auto_21494 ) )
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
      ?auto_21519 - HOIST
      ?auto_21515 - PLACE
      ?auto_21520 - PLACE
      ?auto_21517 - HOIST
      ?auto_21516 - SURFACE
      ?auto_21522 - PLACE
      ?auto_21521 - HOIST
      ?auto_21534 - SURFACE
      ?auto_21529 - PLACE
      ?auto_21535 - HOIST
      ?auto_21531 - SURFACE
      ?auto_21526 - PLACE
      ?auto_21527 - HOIST
      ?auto_21525 - SURFACE
      ?auto_21524 - PLACE
      ?auto_21532 - HOIST
      ?auto_21528 - SURFACE
      ?auto_21530 - PLACE
      ?auto_21523 - HOIST
      ?auto_21533 - SURFACE
      ?auto_21518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21519 ?auto_21515 ) ( IS-CRATE ?auto_21514 ) ( not ( = ?auto_21520 ?auto_21515 ) ) ( HOIST-AT ?auto_21517 ?auto_21520 ) ( AVAILABLE ?auto_21517 ) ( SURFACE-AT ?auto_21514 ?auto_21520 ) ( ON ?auto_21514 ?auto_21516 ) ( CLEAR ?auto_21514 ) ( not ( = ?auto_21513 ?auto_21514 ) ) ( not ( = ?auto_21513 ?auto_21516 ) ) ( not ( = ?auto_21514 ?auto_21516 ) ) ( not ( = ?auto_21519 ?auto_21517 ) ) ( IS-CRATE ?auto_21513 ) ( not ( = ?auto_21522 ?auto_21515 ) ) ( HOIST-AT ?auto_21521 ?auto_21522 ) ( AVAILABLE ?auto_21521 ) ( SURFACE-AT ?auto_21513 ?auto_21522 ) ( ON ?auto_21513 ?auto_21534 ) ( CLEAR ?auto_21513 ) ( not ( = ?auto_21512 ?auto_21513 ) ) ( not ( = ?auto_21512 ?auto_21534 ) ) ( not ( = ?auto_21513 ?auto_21534 ) ) ( not ( = ?auto_21519 ?auto_21521 ) ) ( IS-CRATE ?auto_21512 ) ( not ( = ?auto_21529 ?auto_21515 ) ) ( HOIST-AT ?auto_21535 ?auto_21529 ) ( AVAILABLE ?auto_21535 ) ( SURFACE-AT ?auto_21512 ?auto_21529 ) ( ON ?auto_21512 ?auto_21531 ) ( CLEAR ?auto_21512 ) ( not ( = ?auto_21511 ?auto_21512 ) ) ( not ( = ?auto_21511 ?auto_21531 ) ) ( not ( = ?auto_21512 ?auto_21531 ) ) ( not ( = ?auto_21519 ?auto_21535 ) ) ( IS-CRATE ?auto_21511 ) ( not ( = ?auto_21526 ?auto_21515 ) ) ( HOIST-AT ?auto_21527 ?auto_21526 ) ( AVAILABLE ?auto_21527 ) ( SURFACE-AT ?auto_21511 ?auto_21526 ) ( ON ?auto_21511 ?auto_21525 ) ( CLEAR ?auto_21511 ) ( not ( = ?auto_21510 ?auto_21511 ) ) ( not ( = ?auto_21510 ?auto_21525 ) ) ( not ( = ?auto_21511 ?auto_21525 ) ) ( not ( = ?auto_21519 ?auto_21527 ) ) ( IS-CRATE ?auto_21510 ) ( not ( = ?auto_21524 ?auto_21515 ) ) ( HOIST-AT ?auto_21532 ?auto_21524 ) ( AVAILABLE ?auto_21532 ) ( SURFACE-AT ?auto_21510 ?auto_21524 ) ( ON ?auto_21510 ?auto_21528 ) ( CLEAR ?auto_21510 ) ( not ( = ?auto_21509 ?auto_21510 ) ) ( not ( = ?auto_21509 ?auto_21528 ) ) ( not ( = ?auto_21510 ?auto_21528 ) ) ( not ( = ?auto_21519 ?auto_21532 ) ) ( SURFACE-AT ?auto_21508 ?auto_21515 ) ( CLEAR ?auto_21508 ) ( IS-CRATE ?auto_21509 ) ( AVAILABLE ?auto_21519 ) ( not ( = ?auto_21530 ?auto_21515 ) ) ( HOIST-AT ?auto_21523 ?auto_21530 ) ( AVAILABLE ?auto_21523 ) ( SURFACE-AT ?auto_21509 ?auto_21530 ) ( ON ?auto_21509 ?auto_21533 ) ( CLEAR ?auto_21509 ) ( TRUCK-AT ?auto_21518 ?auto_21515 ) ( not ( = ?auto_21508 ?auto_21509 ) ) ( not ( = ?auto_21508 ?auto_21533 ) ) ( not ( = ?auto_21509 ?auto_21533 ) ) ( not ( = ?auto_21519 ?auto_21523 ) ) ( not ( = ?auto_21508 ?auto_21510 ) ) ( not ( = ?auto_21508 ?auto_21528 ) ) ( not ( = ?auto_21510 ?auto_21533 ) ) ( not ( = ?auto_21524 ?auto_21530 ) ) ( not ( = ?auto_21532 ?auto_21523 ) ) ( not ( = ?auto_21528 ?auto_21533 ) ) ( not ( = ?auto_21508 ?auto_21511 ) ) ( not ( = ?auto_21508 ?auto_21525 ) ) ( not ( = ?auto_21509 ?auto_21511 ) ) ( not ( = ?auto_21509 ?auto_21525 ) ) ( not ( = ?auto_21511 ?auto_21528 ) ) ( not ( = ?auto_21511 ?auto_21533 ) ) ( not ( = ?auto_21526 ?auto_21524 ) ) ( not ( = ?auto_21526 ?auto_21530 ) ) ( not ( = ?auto_21527 ?auto_21532 ) ) ( not ( = ?auto_21527 ?auto_21523 ) ) ( not ( = ?auto_21525 ?auto_21528 ) ) ( not ( = ?auto_21525 ?auto_21533 ) ) ( not ( = ?auto_21508 ?auto_21512 ) ) ( not ( = ?auto_21508 ?auto_21531 ) ) ( not ( = ?auto_21509 ?auto_21512 ) ) ( not ( = ?auto_21509 ?auto_21531 ) ) ( not ( = ?auto_21510 ?auto_21512 ) ) ( not ( = ?auto_21510 ?auto_21531 ) ) ( not ( = ?auto_21512 ?auto_21525 ) ) ( not ( = ?auto_21512 ?auto_21528 ) ) ( not ( = ?auto_21512 ?auto_21533 ) ) ( not ( = ?auto_21529 ?auto_21526 ) ) ( not ( = ?auto_21529 ?auto_21524 ) ) ( not ( = ?auto_21529 ?auto_21530 ) ) ( not ( = ?auto_21535 ?auto_21527 ) ) ( not ( = ?auto_21535 ?auto_21532 ) ) ( not ( = ?auto_21535 ?auto_21523 ) ) ( not ( = ?auto_21531 ?auto_21525 ) ) ( not ( = ?auto_21531 ?auto_21528 ) ) ( not ( = ?auto_21531 ?auto_21533 ) ) ( not ( = ?auto_21508 ?auto_21513 ) ) ( not ( = ?auto_21508 ?auto_21534 ) ) ( not ( = ?auto_21509 ?auto_21513 ) ) ( not ( = ?auto_21509 ?auto_21534 ) ) ( not ( = ?auto_21510 ?auto_21513 ) ) ( not ( = ?auto_21510 ?auto_21534 ) ) ( not ( = ?auto_21511 ?auto_21513 ) ) ( not ( = ?auto_21511 ?auto_21534 ) ) ( not ( = ?auto_21513 ?auto_21531 ) ) ( not ( = ?auto_21513 ?auto_21525 ) ) ( not ( = ?auto_21513 ?auto_21528 ) ) ( not ( = ?auto_21513 ?auto_21533 ) ) ( not ( = ?auto_21522 ?auto_21529 ) ) ( not ( = ?auto_21522 ?auto_21526 ) ) ( not ( = ?auto_21522 ?auto_21524 ) ) ( not ( = ?auto_21522 ?auto_21530 ) ) ( not ( = ?auto_21521 ?auto_21535 ) ) ( not ( = ?auto_21521 ?auto_21527 ) ) ( not ( = ?auto_21521 ?auto_21532 ) ) ( not ( = ?auto_21521 ?auto_21523 ) ) ( not ( = ?auto_21534 ?auto_21531 ) ) ( not ( = ?auto_21534 ?auto_21525 ) ) ( not ( = ?auto_21534 ?auto_21528 ) ) ( not ( = ?auto_21534 ?auto_21533 ) ) ( not ( = ?auto_21508 ?auto_21514 ) ) ( not ( = ?auto_21508 ?auto_21516 ) ) ( not ( = ?auto_21509 ?auto_21514 ) ) ( not ( = ?auto_21509 ?auto_21516 ) ) ( not ( = ?auto_21510 ?auto_21514 ) ) ( not ( = ?auto_21510 ?auto_21516 ) ) ( not ( = ?auto_21511 ?auto_21514 ) ) ( not ( = ?auto_21511 ?auto_21516 ) ) ( not ( = ?auto_21512 ?auto_21514 ) ) ( not ( = ?auto_21512 ?auto_21516 ) ) ( not ( = ?auto_21514 ?auto_21534 ) ) ( not ( = ?auto_21514 ?auto_21531 ) ) ( not ( = ?auto_21514 ?auto_21525 ) ) ( not ( = ?auto_21514 ?auto_21528 ) ) ( not ( = ?auto_21514 ?auto_21533 ) ) ( not ( = ?auto_21520 ?auto_21522 ) ) ( not ( = ?auto_21520 ?auto_21529 ) ) ( not ( = ?auto_21520 ?auto_21526 ) ) ( not ( = ?auto_21520 ?auto_21524 ) ) ( not ( = ?auto_21520 ?auto_21530 ) ) ( not ( = ?auto_21517 ?auto_21521 ) ) ( not ( = ?auto_21517 ?auto_21535 ) ) ( not ( = ?auto_21517 ?auto_21527 ) ) ( not ( = ?auto_21517 ?auto_21532 ) ) ( not ( = ?auto_21517 ?auto_21523 ) ) ( not ( = ?auto_21516 ?auto_21534 ) ) ( not ( = ?auto_21516 ?auto_21531 ) ) ( not ( = ?auto_21516 ?auto_21525 ) ) ( not ( = ?auto_21516 ?auto_21528 ) ) ( not ( = ?auto_21516 ?auto_21533 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_21508 ?auto_21509 ?auto_21510 ?auto_21511 ?auto_21512 ?auto_21513 )
      ( MAKE-1CRATE ?auto_21513 ?auto_21514 )
      ( MAKE-6CRATE-VERIFY ?auto_21508 ?auto_21509 ?auto_21510 ?auto_21511 ?auto_21512 ?auto_21513 ?auto_21514 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21538 - SURFACE
      ?auto_21539 - SURFACE
    )
    :vars
    (
      ?auto_21540 - HOIST
      ?auto_21541 - PLACE
      ?auto_21543 - PLACE
      ?auto_21544 - HOIST
      ?auto_21545 - SURFACE
      ?auto_21542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21540 ?auto_21541 ) ( SURFACE-AT ?auto_21538 ?auto_21541 ) ( CLEAR ?auto_21538 ) ( IS-CRATE ?auto_21539 ) ( AVAILABLE ?auto_21540 ) ( not ( = ?auto_21543 ?auto_21541 ) ) ( HOIST-AT ?auto_21544 ?auto_21543 ) ( AVAILABLE ?auto_21544 ) ( SURFACE-AT ?auto_21539 ?auto_21543 ) ( ON ?auto_21539 ?auto_21545 ) ( CLEAR ?auto_21539 ) ( TRUCK-AT ?auto_21542 ?auto_21541 ) ( not ( = ?auto_21538 ?auto_21539 ) ) ( not ( = ?auto_21538 ?auto_21545 ) ) ( not ( = ?auto_21539 ?auto_21545 ) ) ( not ( = ?auto_21540 ?auto_21544 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21542 ?auto_21541 ?auto_21543 )
      ( !LIFT ?auto_21544 ?auto_21539 ?auto_21545 ?auto_21543 )
      ( !LOAD ?auto_21544 ?auto_21539 ?auto_21542 ?auto_21543 )
      ( !DRIVE ?auto_21542 ?auto_21543 ?auto_21541 )
      ( !UNLOAD ?auto_21540 ?auto_21539 ?auto_21542 ?auto_21541 )
      ( !DROP ?auto_21540 ?auto_21539 ?auto_21538 ?auto_21541 )
      ( MAKE-1CRATE-VERIFY ?auto_21538 ?auto_21539 ) )
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
      ?auto_21561 - SURFACE
      ?auto_21560 - SURFACE
    )
    :vars
    (
      ?auto_21567 - HOIST
      ?auto_21564 - PLACE
      ?auto_21562 - PLACE
      ?auto_21566 - HOIST
      ?auto_21565 - SURFACE
      ?auto_21572 - PLACE
      ?auto_21578 - HOIST
      ?auto_21577 - SURFACE
      ?auto_21580 - PLACE
      ?auto_21571 - HOIST
      ?auto_21582 - SURFACE
      ?auto_21570 - PLACE
      ?auto_21569 - HOIST
      ?auto_21574 - SURFACE
      ?auto_21575 - PLACE
      ?auto_21584 - HOIST
      ?auto_21576 - SURFACE
      ?auto_21579 - PLACE
      ?auto_21573 - HOIST
      ?auto_21583 - SURFACE
      ?auto_21585 - PLACE
      ?auto_21581 - HOIST
      ?auto_21568 - SURFACE
      ?auto_21563 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21567 ?auto_21564 ) ( IS-CRATE ?auto_21560 ) ( not ( = ?auto_21562 ?auto_21564 ) ) ( HOIST-AT ?auto_21566 ?auto_21562 ) ( AVAILABLE ?auto_21566 ) ( SURFACE-AT ?auto_21560 ?auto_21562 ) ( ON ?auto_21560 ?auto_21565 ) ( CLEAR ?auto_21560 ) ( not ( = ?auto_21561 ?auto_21560 ) ) ( not ( = ?auto_21561 ?auto_21565 ) ) ( not ( = ?auto_21560 ?auto_21565 ) ) ( not ( = ?auto_21567 ?auto_21566 ) ) ( IS-CRATE ?auto_21561 ) ( not ( = ?auto_21572 ?auto_21564 ) ) ( HOIST-AT ?auto_21578 ?auto_21572 ) ( AVAILABLE ?auto_21578 ) ( SURFACE-AT ?auto_21561 ?auto_21572 ) ( ON ?auto_21561 ?auto_21577 ) ( CLEAR ?auto_21561 ) ( not ( = ?auto_21559 ?auto_21561 ) ) ( not ( = ?auto_21559 ?auto_21577 ) ) ( not ( = ?auto_21561 ?auto_21577 ) ) ( not ( = ?auto_21567 ?auto_21578 ) ) ( IS-CRATE ?auto_21559 ) ( not ( = ?auto_21580 ?auto_21564 ) ) ( HOIST-AT ?auto_21571 ?auto_21580 ) ( AVAILABLE ?auto_21571 ) ( SURFACE-AT ?auto_21559 ?auto_21580 ) ( ON ?auto_21559 ?auto_21582 ) ( CLEAR ?auto_21559 ) ( not ( = ?auto_21558 ?auto_21559 ) ) ( not ( = ?auto_21558 ?auto_21582 ) ) ( not ( = ?auto_21559 ?auto_21582 ) ) ( not ( = ?auto_21567 ?auto_21571 ) ) ( IS-CRATE ?auto_21558 ) ( not ( = ?auto_21570 ?auto_21564 ) ) ( HOIST-AT ?auto_21569 ?auto_21570 ) ( AVAILABLE ?auto_21569 ) ( SURFACE-AT ?auto_21558 ?auto_21570 ) ( ON ?auto_21558 ?auto_21574 ) ( CLEAR ?auto_21558 ) ( not ( = ?auto_21557 ?auto_21558 ) ) ( not ( = ?auto_21557 ?auto_21574 ) ) ( not ( = ?auto_21558 ?auto_21574 ) ) ( not ( = ?auto_21567 ?auto_21569 ) ) ( IS-CRATE ?auto_21557 ) ( not ( = ?auto_21575 ?auto_21564 ) ) ( HOIST-AT ?auto_21584 ?auto_21575 ) ( AVAILABLE ?auto_21584 ) ( SURFACE-AT ?auto_21557 ?auto_21575 ) ( ON ?auto_21557 ?auto_21576 ) ( CLEAR ?auto_21557 ) ( not ( = ?auto_21556 ?auto_21557 ) ) ( not ( = ?auto_21556 ?auto_21576 ) ) ( not ( = ?auto_21557 ?auto_21576 ) ) ( not ( = ?auto_21567 ?auto_21584 ) ) ( IS-CRATE ?auto_21556 ) ( not ( = ?auto_21579 ?auto_21564 ) ) ( HOIST-AT ?auto_21573 ?auto_21579 ) ( AVAILABLE ?auto_21573 ) ( SURFACE-AT ?auto_21556 ?auto_21579 ) ( ON ?auto_21556 ?auto_21583 ) ( CLEAR ?auto_21556 ) ( not ( = ?auto_21555 ?auto_21556 ) ) ( not ( = ?auto_21555 ?auto_21583 ) ) ( not ( = ?auto_21556 ?auto_21583 ) ) ( not ( = ?auto_21567 ?auto_21573 ) ) ( SURFACE-AT ?auto_21554 ?auto_21564 ) ( CLEAR ?auto_21554 ) ( IS-CRATE ?auto_21555 ) ( AVAILABLE ?auto_21567 ) ( not ( = ?auto_21585 ?auto_21564 ) ) ( HOIST-AT ?auto_21581 ?auto_21585 ) ( AVAILABLE ?auto_21581 ) ( SURFACE-AT ?auto_21555 ?auto_21585 ) ( ON ?auto_21555 ?auto_21568 ) ( CLEAR ?auto_21555 ) ( TRUCK-AT ?auto_21563 ?auto_21564 ) ( not ( = ?auto_21554 ?auto_21555 ) ) ( not ( = ?auto_21554 ?auto_21568 ) ) ( not ( = ?auto_21555 ?auto_21568 ) ) ( not ( = ?auto_21567 ?auto_21581 ) ) ( not ( = ?auto_21554 ?auto_21556 ) ) ( not ( = ?auto_21554 ?auto_21583 ) ) ( not ( = ?auto_21556 ?auto_21568 ) ) ( not ( = ?auto_21579 ?auto_21585 ) ) ( not ( = ?auto_21573 ?auto_21581 ) ) ( not ( = ?auto_21583 ?auto_21568 ) ) ( not ( = ?auto_21554 ?auto_21557 ) ) ( not ( = ?auto_21554 ?auto_21576 ) ) ( not ( = ?auto_21555 ?auto_21557 ) ) ( not ( = ?auto_21555 ?auto_21576 ) ) ( not ( = ?auto_21557 ?auto_21583 ) ) ( not ( = ?auto_21557 ?auto_21568 ) ) ( not ( = ?auto_21575 ?auto_21579 ) ) ( not ( = ?auto_21575 ?auto_21585 ) ) ( not ( = ?auto_21584 ?auto_21573 ) ) ( not ( = ?auto_21584 ?auto_21581 ) ) ( not ( = ?auto_21576 ?auto_21583 ) ) ( not ( = ?auto_21576 ?auto_21568 ) ) ( not ( = ?auto_21554 ?auto_21558 ) ) ( not ( = ?auto_21554 ?auto_21574 ) ) ( not ( = ?auto_21555 ?auto_21558 ) ) ( not ( = ?auto_21555 ?auto_21574 ) ) ( not ( = ?auto_21556 ?auto_21558 ) ) ( not ( = ?auto_21556 ?auto_21574 ) ) ( not ( = ?auto_21558 ?auto_21576 ) ) ( not ( = ?auto_21558 ?auto_21583 ) ) ( not ( = ?auto_21558 ?auto_21568 ) ) ( not ( = ?auto_21570 ?auto_21575 ) ) ( not ( = ?auto_21570 ?auto_21579 ) ) ( not ( = ?auto_21570 ?auto_21585 ) ) ( not ( = ?auto_21569 ?auto_21584 ) ) ( not ( = ?auto_21569 ?auto_21573 ) ) ( not ( = ?auto_21569 ?auto_21581 ) ) ( not ( = ?auto_21574 ?auto_21576 ) ) ( not ( = ?auto_21574 ?auto_21583 ) ) ( not ( = ?auto_21574 ?auto_21568 ) ) ( not ( = ?auto_21554 ?auto_21559 ) ) ( not ( = ?auto_21554 ?auto_21582 ) ) ( not ( = ?auto_21555 ?auto_21559 ) ) ( not ( = ?auto_21555 ?auto_21582 ) ) ( not ( = ?auto_21556 ?auto_21559 ) ) ( not ( = ?auto_21556 ?auto_21582 ) ) ( not ( = ?auto_21557 ?auto_21559 ) ) ( not ( = ?auto_21557 ?auto_21582 ) ) ( not ( = ?auto_21559 ?auto_21574 ) ) ( not ( = ?auto_21559 ?auto_21576 ) ) ( not ( = ?auto_21559 ?auto_21583 ) ) ( not ( = ?auto_21559 ?auto_21568 ) ) ( not ( = ?auto_21580 ?auto_21570 ) ) ( not ( = ?auto_21580 ?auto_21575 ) ) ( not ( = ?auto_21580 ?auto_21579 ) ) ( not ( = ?auto_21580 ?auto_21585 ) ) ( not ( = ?auto_21571 ?auto_21569 ) ) ( not ( = ?auto_21571 ?auto_21584 ) ) ( not ( = ?auto_21571 ?auto_21573 ) ) ( not ( = ?auto_21571 ?auto_21581 ) ) ( not ( = ?auto_21582 ?auto_21574 ) ) ( not ( = ?auto_21582 ?auto_21576 ) ) ( not ( = ?auto_21582 ?auto_21583 ) ) ( not ( = ?auto_21582 ?auto_21568 ) ) ( not ( = ?auto_21554 ?auto_21561 ) ) ( not ( = ?auto_21554 ?auto_21577 ) ) ( not ( = ?auto_21555 ?auto_21561 ) ) ( not ( = ?auto_21555 ?auto_21577 ) ) ( not ( = ?auto_21556 ?auto_21561 ) ) ( not ( = ?auto_21556 ?auto_21577 ) ) ( not ( = ?auto_21557 ?auto_21561 ) ) ( not ( = ?auto_21557 ?auto_21577 ) ) ( not ( = ?auto_21558 ?auto_21561 ) ) ( not ( = ?auto_21558 ?auto_21577 ) ) ( not ( = ?auto_21561 ?auto_21582 ) ) ( not ( = ?auto_21561 ?auto_21574 ) ) ( not ( = ?auto_21561 ?auto_21576 ) ) ( not ( = ?auto_21561 ?auto_21583 ) ) ( not ( = ?auto_21561 ?auto_21568 ) ) ( not ( = ?auto_21572 ?auto_21580 ) ) ( not ( = ?auto_21572 ?auto_21570 ) ) ( not ( = ?auto_21572 ?auto_21575 ) ) ( not ( = ?auto_21572 ?auto_21579 ) ) ( not ( = ?auto_21572 ?auto_21585 ) ) ( not ( = ?auto_21578 ?auto_21571 ) ) ( not ( = ?auto_21578 ?auto_21569 ) ) ( not ( = ?auto_21578 ?auto_21584 ) ) ( not ( = ?auto_21578 ?auto_21573 ) ) ( not ( = ?auto_21578 ?auto_21581 ) ) ( not ( = ?auto_21577 ?auto_21582 ) ) ( not ( = ?auto_21577 ?auto_21574 ) ) ( not ( = ?auto_21577 ?auto_21576 ) ) ( not ( = ?auto_21577 ?auto_21583 ) ) ( not ( = ?auto_21577 ?auto_21568 ) ) ( not ( = ?auto_21554 ?auto_21560 ) ) ( not ( = ?auto_21554 ?auto_21565 ) ) ( not ( = ?auto_21555 ?auto_21560 ) ) ( not ( = ?auto_21555 ?auto_21565 ) ) ( not ( = ?auto_21556 ?auto_21560 ) ) ( not ( = ?auto_21556 ?auto_21565 ) ) ( not ( = ?auto_21557 ?auto_21560 ) ) ( not ( = ?auto_21557 ?auto_21565 ) ) ( not ( = ?auto_21558 ?auto_21560 ) ) ( not ( = ?auto_21558 ?auto_21565 ) ) ( not ( = ?auto_21559 ?auto_21560 ) ) ( not ( = ?auto_21559 ?auto_21565 ) ) ( not ( = ?auto_21560 ?auto_21577 ) ) ( not ( = ?auto_21560 ?auto_21582 ) ) ( not ( = ?auto_21560 ?auto_21574 ) ) ( not ( = ?auto_21560 ?auto_21576 ) ) ( not ( = ?auto_21560 ?auto_21583 ) ) ( not ( = ?auto_21560 ?auto_21568 ) ) ( not ( = ?auto_21562 ?auto_21572 ) ) ( not ( = ?auto_21562 ?auto_21580 ) ) ( not ( = ?auto_21562 ?auto_21570 ) ) ( not ( = ?auto_21562 ?auto_21575 ) ) ( not ( = ?auto_21562 ?auto_21579 ) ) ( not ( = ?auto_21562 ?auto_21585 ) ) ( not ( = ?auto_21566 ?auto_21578 ) ) ( not ( = ?auto_21566 ?auto_21571 ) ) ( not ( = ?auto_21566 ?auto_21569 ) ) ( not ( = ?auto_21566 ?auto_21584 ) ) ( not ( = ?auto_21566 ?auto_21573 ) ) ( not ( = ?auto_21566 ?auto_21581 ) ) ( not ( = ?auto_21565 ?auto_21577 ) ) ( not ( = ?auto_21565 ?auto_21582 ) ) ( not ( = ?auto_21565 ?auto_21574 ) ) ( not ( = ?auto_21565 ?auto_21576 ) ) ( not ( = ?auto_21565 ?auto_21583 ) ) ( not ( = ?auto_21565 ?auto_21568 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_21554 ?auto_21555 ?auto_21556 ?auto_21557 ?auto_21558 ?auto_21559 ?auto_21561 )
      ( MAKE-1CRATE ?auto_21561 ?auto_21560 )
      ( MAKE-7CRATE-VERIFY ?auto_21554 ?auto_21555 ?auto_21556 ?auto_21557 ?auto_21558 ?auto_21559 ?auto_21561 ?auto_21560 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21588 - SURFACE
      ?auto_21589 - SURFACE
    )
    :vars
    (
      ?auto_21590 - HOIST
      ?auto_21591 - PLACE
      ?auto_21593 - PLACE
      ?auto_21594 - HOIST
      ?auto_21595 - SURFACE
      ?auto_21592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21590 ?auto_21591 ) ( SURFACE-AT ?auto_21588 ?auto_21591 ) ( CLEAR ?auto_21588 ) ( IS-CRATE ?auto_21589 ) ( AVAILABLE ?auto_21590 ) ( not ( = ?auto_21593 ?auto_21591 ) ) ( HOIST-AT ?auto_21594 ?auto_21593 ) ( AVAILABLE ?auto_21594 ) ( SURFACE-AT ?auto_21589 ?auto_21593 ) ( ON ?auto_21589 ?auto_21595 ) ( CLEAR ?auto_21589 ) ( TRUCK-AT ?auto_21592 ?auto_21591 ) ( not ( = ?auto_21588 ?auto_21589 ) ) ( not ( = ?auto_21588 ?auto_21595 ) ) ( not ( = ?auto_21589 ?auto_21595 ) ) ( not ( = ?auto_21590 ?auto_21594 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21592 ?auto_21591 ?auto_21593 )
      ( !LIFT ?auto_21594 ?auto_21589 ?auto_21595 ?auto_21593 )
      ( !LOAD ?auto_21594 ?auto_21589 ?auto_21592 ?auto_21593 )
      ( !DRIVE ?auto_21592 ?auto_21593 ?auto_21591 )
      ( !UNLOAD ?auto_21590 ?auto_21589 ?auto_21592 ?auto_21591 )
      ( !DROP ?auto_21590 ?auto_21589 ?auto_21588 ?auto_21591 )
      ( MAKE-1CRATE-VERIFY ?auto_21588 ?auto_21589 ) )
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
      ?auto_21613 - SURFACE
      ?auto_21612 - SURFACE
      ?auto_21611 - SURFACE
    )
    :vars
    (
      ?auto_21615 - HOIST
      ?auto_21619 - PLACE
      ?auto_21616 - PLACE
      ?auto_21614 - HOIST
      ?auto_21618 - SURFACE
      ?auto_21620 - PLACE
      ?auto_21638 - HOIST
      ?auto_21639 - SURFACE
      ?auto_21637 - PLACE
      ?auto_21629 - HOIST
      ?auto_21630 - SURFACE
      ?auto_21632 - PLACE
      ?auto_21621 - HOIST
      ?auto_21624 - SURFACE
      ?auto_21623 - PLACE
      ?auto_21622 - HOIST
      ?auto_21635 - SURFACE
      ?auto_21634 - PLACE
      ?auto_21626 - HOIST
      ?auto_21628 - SURFACE
      ?auto_21631 - PLACE
      ?auto_21636 - HOIST
      ?auto_21640 - SURFACE
      ?auto_21625 - PLACE
      ?auto_21633 - HOIST
      ?auto_21627 - SURFACE
      ?auto_21617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21615 ?auto_21619 ) ( IS-CRATE ?auto_21611 ) ( not ( = ?auto_21616 ?auto_21619 ) ) ( HOIST-AT ?auto_21614 ?auto_21616 ) ( AVAILABLE ?auto_21614 ) ( SURFACE-AT ?auto_21611 ?auto_21616 ) ( ON ?auto_21611 ?auto_21618 ) ( CLEAR ?auto_21611 ) ( not ( = ?auto_21612 ?auto_21611 ) ) ( not ( = ?auto_21612 ?auto_21618 ) ) ( not ( = ?auto_21611 ?auto_21618 ) ) ( not ( = ?auto_21615 ?auto_21614 ) ) ( IS-CRATE ?auto_21612 ) ( not ( = ?auto_21620 ?auto_21619 ) ) ( HOIST-AT ?auto_21638 ?auto_21620 ) ( AVAILABLE ?auto_21638 ) ( SURFACE-AT ?auto_21612 ?auto_21620 ) ( ON ?auto_21612 ?auto_21639 ) ( CLEAR ?auto_21612 ) ( not ( = ?auto_21613 ?auto_21612 ) ) ( not ( = ?auto_21613 ?auto_21639 ) ) ( not ( = ?auto_21612 ?auto_21639 ) ) ( not ( = ?auto_21615 ?auto_21638 ) ) ( IS-CRATE ?auto_21613 ) ( not ( = ?auto_21637 ?auto_21619 ) ) ( HOIST-AT ?auto_21629 ?auto_21637 ) ( AVAILABLE ?auto_21629 ) ( SURFACE-AT ?auto_21613 ?auto_21637 ) ( ON ?auto_21613 ?auto_21630 ) ( CLEAR ?auto_21613 ) ( not ( = ?auto_21610 ?auto_21613 ) ) ( not ( = ?auto_21610 ?auto_21630 ) ) ( not ( = ?auto_21613 ?auto_21630 ) ) ( not ( = ?auto_21615 ?auto_21629 ) ) ( IS-CRATE ?auto_21610 ) ( not ( = ?auto_21632 ?auto_21619 ) ) ( HOIST-AT ?auto_21621 ?auto_21632 ) ( AVAILABLE ?auto_21621 ) ( SURFACE-AT ?auto_21610 ?auto_21632 ) ( ON ?auto_21610 ?auto_21624 ) ( CLEAR ?auto_21610 ) ( not ( = ?auto_21609 ?auto_21610 ) ) ( not ( = ?auto_21609 ?auto_21624 ) ) ( not ( = ?auto_21610 ?auto_21624 ) ) ( not ( = ?auto_21615 ?auto_21621 ) ) ( IS-CRATE ?auto_21609 ) ( not ( = ?auto_21623 ?auto_21619 ) ) ( HOIST-AT ?auto_21622 ?auto_21623 ) ( AVAILABLE ?auto_21622 ) ( SURFACE-AT ?auto_21609 ?auto_21623 ) ( ON ?auto_21609 ?auto_21635 ) ( CLEAR ?auto_21609 ) ( not ( = ?auto_21608 ?auto_21609 ) ) ( not ( = ?auto_21608 ?auto_21635 ) ) ( not ( = ?auto_21609 ?auto_21635 ) ) ( not ( = ?auto_21615 ?auto_21622 ) ) ( IS-CRATE ?auto_21608 ) ( not ( = ?auto_21634 ?auto_21619 ) ) ( HOIST-AT ?auto_21626 ?auto_21634 ) ( AVAILABLE ?auto_21626 ) ( SURFACE-AT ?auto_21608 ?auto_21634 ) ( ON ?auto_21608 ?auto_21628 ) ( CLEAR ?auto_21608 ) ( not ( = ?auto_21607 ?auto_21608 ) ) ( not ( = ?auto_21607 ?auto_21628 ) ) ( not ( = ?auto_21608 ?auto_21628 ) ) ( not ( = ?auto_21615 ?auto_21626 ) ) ( IS-CRATE ?auto_21607 ) ( not ( = ?auto_21631 ?auto_21619 ) ) ( HOIST-AT ?auto_21636 ?auto_21631 ) ( AVAILABLE ?auto_21636 ) ( SURFACE-AT ?auto_21607 ?auto_21631 ) ( ON ?auto_21607 ?auto_21640 ) ( CLEAR ?auto_21607 ) ( not ( = ?auto_21606 ?auto_21607 ) ) ( not ( = ?auto_21606 ?auto_21640 ) ) ( not ( = ?auto_21607 ?auto_21640 ) ) ( not ( = ?auto_21615 ?auto_21636 ) ) ( SURFACE-AT ?auto_21605 ?auto_21619 ) ( CLEAR ?auto_21605 ) ( IS-CRATE ?auto_21606 ) ( AVAILABLE ?auto_21615 ) ( not ( = ?auto_21625 ?auto_21619 ) ) ( HOIST-AT ?auto_21633 ?auto_21625 ) ( AVAILABLE ?auto_21633 ) ( SURFACE-AT ?auto_21606 ?auto_21625 ) ( ON ?auto_21606 ?auto_21627 ) ( CLEAR ?auto_21606 ) ( TRUCK-AT ?auto_21617 ?auto_21619 ) ( not ( = ?auto_21605 ?auto_21606 ) ) ( not ( = ?auto_21605 ?auto_21627 ) ) ( not ( = ?auto_21606 ?auto_21627 ) ) ( not ( = ?auto_21615 ?auto_21633 ) ) ( not ( = ?auto_21605 ?auto_21607 ) ) ( not ( = ?auto_21605 ?auto_21640 ) ) ( not ( = ?auto_21607 ?auto_21627 ) ) ( not ( = ?auto_21631 ?auto_21625 ) ) ( not ( = ?auto_21636 ?auto_21633 ) ) ( not ( = ?auto_21640 ?auto_21627 ) ) ( not ( = ?auto_21605 ?auto_21608 ) ) ( not ( = ?auto_21605 ?auto_21628 ) ) ( not ( = ?auto_21606 ?auto_21608 ) ) ( not ( = ?auto_21606 ?auto_21628 ) ) ( not ( = ?auto_21608 ?auto_21640 ) ) ( not ( = ?auto_21608 ?auto_21627 ) ) ( not ( = ?auto_21634 ?auto_21631 ) ) ( not ( = ?auto_21634 ?auto_21625 ) ) ( not ( = ?auto_21626 ?auto_21636 ) ) ( not ( = ?auto_21626 ?auto_21633 ) ) ( not ( = ?auto_21628 ?auto_21640 ) ) ( not ( = ?auto_21628 ?auto_21627 ) ) ( not ( = ?auto_21605 ?auto_21609 ) ) ( not ( = ?auto_21605 ?auto_21635 ) ) ( not ( = ?auto_21606 ?auto_21609 ) ) ( not ( = ?auto_21606 ?auto_21635 ) ) ( not ( = ?auto_21607 ?auto_21609 ) ) ( not ( = ?auto_21607 ?auto_21635 ) ) ( not ( = ?auto_21609 ?auto_21628 ) ) ( not ( = ?auto_21609 ?auto_21640 ) ) ( not ( = ?auto_21609 ?auto_21627 ) ) ( not ( = ?auto_21623 ?auto_21634 ) ) ( not ( = ?auto_21623 ?auto_21631 ) ) ( not ( = ?auto_21623 ?auto_21625 ) ) ( not ( = ?auto_21622 ?auto_21626 ) ) ( not ( = ?auto_21622 ?auto_21636 ) ) ( not ( = ?auto_21622 ?auto_21633 ) ) ( not ( = ?auto_21635 ?auto_21628 ) ) ( not ( = ?auto_21635 ?auto_21640 ) ) ( not ( = ?auto_21635 ?auto_21627 ) ) ( not ( = ?auto_21605 ?auto_21610 ) ) ( not ( = ?auto_21605 ?auto_21624 ) ) ( not ( = ?auto_21606 ?auto_21610 ) ) ( not ( = ?auto_21606 ?auto_21624 ) ) ( not ( = ?auto_21607 ?auto_21610 ) ) ( not ( = ?auto_21607 ?auto_21624 ) ) ( not ( = ?auto_21608 ?auto_21610 ) ) ( not ( = ?auto_21608 ?auto_21624 ) ) ( not ( = ?auto_21610 ?auto_21635 ) ) ( not ( = ?auto_21610 ?auto_21628 ) ) ( not ( = ?auto_21610 ?auto_21640 ) ) ( not ( = ?auto_21610 ?auto_21627 ) ) ( not ( = ?auto_21632 ?auto_21623 ) ) ( not ( = ?auto_21632 ?auto_21634 ) ) ( not ( = ?auto_21632 ?auto_21631 ) ) ( not ( = ?auto_21632 ?auto_21625 ) ) ( not ( = ?auto_21621 ?auto_21622 ) ) ( not ( = ?auto_21621 ?auto_21626 ) ) ( not ( = ?auto_21621 ?auto_21636 ) ) ( not ( = ?auto_21621 ?auto_21633 ) ) ( not ( = ?auto_21624 ?auto_21635 ) ) ( not ( = ?auto_21624 ?auto_21628 ) ) ( not ( = ?auto_21624 ?auto_21640 ) ) ( not ( = ?auto_21624 ?auto_21627 ) ) ( not ( = ?auto_21605 ?auto_21613 ) ) ( not ( = ?auto_21605 ?auto_21630 ) ) ( not ( = ?auto_21606 ?auto_21613 ) ) ( not ( = ?auto_21606 ?auto_21630 ) ) ( not ( = ?auto_21607 ?auto_21613 ) ) ( not ( = ?auto_21607 ?auto_21630 ) ) ( not ( = ?auto_21608 ?auto_21613 ) ) ( not ( = ?auto_21608 ?auto_21630 ) ) ( not ( = ?auto_21609 ?auto_21613 ) ) ( not ( = ?auto_21609 ?auto_21630 ) ) ( not ( = ?auto_21613 ?auto_21624 ) ) ( not ( = ?auto_21613 ?auto_21635 ) ) ( not ( = ?auto_21613 ?auto_21628 ) ) ( not ( = ?auto_21613 ?auto_21640 ) ) ( not ( = ?auto_21613 ?auto_21627 ) ) ( not ( = ?auto_21637 ?auto_21632 ) ) ( not ( = ?auto_21637 ?auto_21623 ) ) ( not ( = ?auto_21637 ?auto_21634 ) ) ( not ( = ?auto_21637 ?auto_21631 ) ) ( not ( = ?auto_21637 ?auto_21625 ) ) ( not ( = ?auto_21629 ?auto_21621 ) ) ( not ( = ?auto_21629 ?auto_21622 ) ) ( not ( = ?auto_21629 ?auto_21626 ) ) ( not ( = ?auto_21629 ?auto_21636 ) ) ( not ( = ?auto_21629 ?auto_21633 ) ) ( not ( = ?auto_21630 ?auto_21624 ) ) ( not ( = ?auto_21630 ?auto_21635 ) ) ( not ( = ?auto_21630 ?auto_21628 ) ) ( not ( = ?auto_21630 ?auto_21640 ) ) ( not ( = ?auto_21630 ?auto_21627 ) ) ( not ( = ?auto_21605 ?auto_21612 ) ) ( not ( = ?auto_21605 ?auto_21639 ) ) ( not ( = ?auto_21606 ?auto_21612 ) ) ( not ( = ?auto_21606 ?auto_21639 ) ) ( not ( = ?auto_21607 ?auto_21612 ) ) ( not ( = ?auto_21607 ?auto_21639 ) ) ( not ( = ?auto_21608 ?auto_21612 ) ) ( not ( = ?auto_21608 ?auto_21639 ) ) ( not ( = ?auto_21609 ?auto_21612 ) ) ( not ( = ?auto_21609 ?auto_21639 ) ) ( not ( = ?auto_21610 ?auto_21612 ) ) ( not ( = ?auto_21610 ?auto_21639 ) ) ( not ( = ?auto_21612 ?auto_21630 ) ) ( not ( = ?auto_21612 ?auto_21624 ) ) ( not ( = ?auto_21612 ?auto_21635 ) ) ( not ( = ?auto_21612 ?auto_21628 ) ) ( not ( = ?auto_21612 ?auto_21640 ) ) ( not ( = ?auto_21612 ?auto_21627 ) ) ( not ( = ?auto_21620 ?auto_21637 ) ) ( not ( = ?auto_21620 ?auto_21632 ) ) ( not ( = ?auto_21620 ?auto_21623 ) ) ( not ( = ?auto_21620 ?auto_21634 ) ) ( not ( = ?auto_21620 ?auto_21631 ) ) ( not ( = ?auto_21620 ?auto_21625 ) ) ( not ( = ?auto_21638 ?auto_21629 ) ) ( not ( = ?auto_21638 ?auto_21621 ) ) ( not ( = ?auto_21638 ?auto_21622 ) ) ( not ( = ?auto_21638 ?auto_21626 ) ) ( not ( = ?auto_21638 ?auto_21636 ) ) ( not ( = ?auto_21638 ?auto_21633 ) ) ( not ( = ?auto_21639 ?auto_21630 ) ) ( not ( = ?auto_21639 ?auto_21624 ) ) ( not ( = ?auto_21639 ?auto_21635 ) ) ( not ( = ?auto_21639 ?auto_21628 ) ) ( not ( = ?auto_21639 ?auto_21640 ) ) ( not ( = ?auto_21639 ?auto_21627 ) ) ( not ( = ?auto_21605 ?auto_21611 ) ) ( not ( = ?auto_21605 ?auto_21618 ) ) ( not ( = ?auto_21606 ?auto_21611 ) ) ( not ( = ?auto_21606 ?auto_21618 ) ) ( not ( = ?auto_21607 ?auto_21611 ) ) ( not ( = ?auto_21607 ?auto_21618 ) ) ( not ( = ?auto_21608 ?auto_21611 ) ) ( not ( = ?auto_21608 ?auto_21618 ) ) ( not ( = ?auto_21609 ?auto_21611 ) ) ( not ( = ?auto_21609 ?auto_21618 ) ) ( not ( = ?auto_21610 ?auto_21611 ) ) ( not ( = ?auto_21610 ?auto_21618 ) ) ( not ( = ?auto_21613 ?auto_21611 ) ) ( not ( = ?auto_21613 ?auto_21618 ) ) ( not ( = ?auto_21611 ?auto_21639 ) ) ( not ( = ?auto_21611 ?auto_21630 ) ) ( not ( = ?auto_21611 ?auto_21624 ) ) ( not ( = ?auto_21611 ?auto_21635 ) ) ( not ( = ?auto_21611 ?auto_21628 ) ) ( not ( = ?auto_21611 ?auto_21640 ) ) ( not ( = ?auto_21611 ?auto_21627 ) ) ( not ( = ?auto_21616 ?auto_21620 ) ) ( not ( = ?auto_21616 ?auto_21637 ) ) ( not ( = ?auto_21616 ?auto_21632 ) ) ( not ( = ?auto_21616 ?auto_21623 ) ) ( not ( = ?auto_21616 ?auto_21634 ) ) ( not ( = ?auto_21616 ?auto_21631 ) ) ( not ( = ?auto_21616 ?auto_21625 ) ) ( not ( = ?auto_21614 ?auto_21638 ) ) ( not ( = ?auto_21614 ?auto_21629 ) ) ( not ( = ?auto_21614 ?auto_21621 ) ) ( not ( = ?auto_21614 ?auto_21622 ) ) ( not ( = ?auto_21614 ?auto_21626 ) ) ( not ( = ?auto_21614 ?auto_21636 ) ) ( not ( = ?auto_21614 ?auto_21633 ) ) ( not ( = ?auto_21618 ?auto_21639 ) ) ( not ( = ?auto_21618 ?auto_21630 ) ) ( not ( = ?auto_21618 ?auto_21624 ) ) ( not ( = ?auto_21618 ?auto_21635 ) ) ( not ( = ?auto_21618 ?auto_21628 ) ) ( not ( = ?auto_21618 ?auto_21640 ) ) ( not ( = ?auto_21618 ?auto_21627 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_21605 ?auto_21606 ?auto_21607 ?auto_21608 ?auto_21609 ?auto_21610 ?auto_21613 ?auto_21612 )
      ( MAKE-1CRATE ?auto_21612 ?auto_21611 )
      ( MAKE-8CRATE-VERIFY ?auto_21605 ?auto_21606 ?auto_21607 ?auto_21608 ?auto_21609 ?auto_21610 ?auto_21613 ?auto_21612 ?auto_21611 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21643 - SURFACE
      ?auto_21644 - SURFACE
    )
    :vars
    (
      ?auto_21645 - HOIST
      ?auto_21646 - PLACE
      ?auto_21648 - PLACE
      ?auto_21649 - HOIST
      ?auto_21650 - SURFACE
      ?auto_21647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21645 ?auto_21646 ) ( SURFACE-AT ?auto_21643 ?auto_21646 ) ( CLEAR ?auto_21643 ) ( IS-CRATE ?auto_21644 ) ( AVAILABLE ?auto_21645 ) ( not ( = ?auto_21648 ?auto_21646 ) ) ( HOIST-AT ?auto_21649 ?auto_21648 ) ( AVAILABLE ?auto_21649 ) ( SURFACE-AT ?auto_21644 ?auto_21648 ) ( ON ?auto_21644 ?auto_21650 ) ( CLEAR ?auto_21644 ) ( TRUCK-AT ?auto_21647 ?auto_21646 ) ( not ( = ?auto_21643 ?auto_21644 ) ) ( not ( = ?auto_21643 ?auto_21650 ) ) ( not ( = ?auto_21644 ?auto_21650 ) ) ( not ( = ?auto_21645 ?auto_21649 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21647 ?auto_21646 ?auto_21648 )
      ( !LIFT ?auto_21649 ?auto_21644 ?auto_21650 ?auto_21648 )
      ( !LOAD ?auto_21649 ?auto_21644 ?auto_21647 ?auto_21648 )
      ( !DRIVE ?auto_21647 ?auto_21648 ?auto_21646 )
      ( !UNLOAD ?auto_21645 ?auto_21644 ?auto_21647 ?auto_21646 )
      ( !DROP ?auto_21645 ?auto_21644 ?auto_21643 ?auto_21646 )
      ( MAKE-1CRATE-VERIFY ?auto_21643 ?auto_21644 ) )
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
      ?auto_21669 - SURFACE
      ?auto_21668 - SURFACE
      ?auto_21667 - SURFACE
      ?auto_21670 - SURFACE
    )
    :vars
    (
      ?auto_21671 - HOIST
      ?auto_21673 - PLACE
      ?auto_21672 - PLACE
      ?auto_21675 - HOIST
      ?auto_21674 - SURFACE
      ?auto_21684 - PLACE
      ?auto_21680 - HOIST
      ?auto_21681 - SURFACE
      ?auto_21683 - PLACE
      ?auto_21678 - HOIST
      ?auto_21687 - SURFACE
      ?auto_21688 - PLACE
      ?auto_21693 - HOIST
      ?auto_21692 - SURFACE
      ?auto_21695 - PLACE
      ?auto_21689 - HOIST
      ?auto_21698 - SURFACE
      ?auto_21682 - PLACE
      ?auto_21679 - HOIST
      ?auto_21690 - SURFACE
      ?auto_21685 - PLACE
      ?auto_21697 - HOIST
      ?auto_21691 - SURFACE
      ?auto_21694 - PLACE
      ?auto_21677 - HOIST
      ?auto_21686 - SURFACE
      ?auto_21696 - SURFACE
      ?auto_21676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21671 ?auto_21673 ) ( IS-CRATE ?auto_21670 ) ( not ( = ?auto_21672 ?auto_21673 ) ) ( HOIST-AT ?auto_21675 ?auto_21672 ) ( SURFACE-AT ?auto_21670 ?auto_21672 ) ( ON ?auto_21670 ?auto_21674 ) ( CLEAR ?auto_21670 ) ( not ( = ?auto_21667 ?auto_21670 ) ) ( not ( = ?auto_21667 ?auto_21674 ) ) ( not ( = ?auto_21670 ?auto_21674 ) ) ( not ( = ?auto_21671 ?auto_21675 ) ) ( IS-CRATE ?auto_21667 ) ( not ( = ?auto_21684 ?auto_21673 ) ) ( HOIST-AT ?auto_21680 ?auto_21684 ) ( AVAILABLE ?auto_21680 ) ( SURFACE-AT ?auto_21667 ?auto_21684 ) ( ON ?auto_21667 ?auto_21681 ) ( CLEAR ?auto_21667 ) ( not ( = ?auto_21668 ?auto_21667 ) ) ( not ( = ?auto_21668 ?auto_21681 ) ) ( not ( = ?auto_21667 ?auto_21681 ) ) ( not ( = ?auto_21671 ?auto_21680 ) ) ( IS-CRATE ?auto_21668 ) ( not ( = ?auto_21683 ?auto_21673 ) ) ( HOIST-AT ?auto_21678 ?auto_21683 ) ( AVAILABLE ?auto_21678 ) ( SURFACE-AT ?auto_21668 ?auto_21683 ) ( ON ?auto_21668 ?auto_21687 ) ( CLEAR ?auto_21668 ) ( not ( = ?auto_21669 ?auto_21668 ) ) ( not ( = ?auto_21669 ?auto_21687 ) ) ( not ( = ?auto_21668 ?auto_21687 ) ) ( not ( = ?auto_21671 ?auto_21678 ) ) ( IS-CRATE ?auto_21669 ) ( not ( = ?auto_21688 ?auto_21673 ) ) ( HOIST-AT ?auto_21693 ?auto_21688 ) ( AVAILABLE ?auto_21693 ) ( SURFACE-AT ?auto_21669 ?auto_21688 ) ( ON ?auto_21669 ?auto_21692 ) ( CLEAR ?auto_21669 ) ( not ( = ?auto_21666 ?auto_21669 ) ) ( not ( = ?auto_21666 ?auto_21692 ) ) ( not ( = ?auto_21669 ?auto_21692 ) ) ( not ( = ?auto_21671 ?auto_21693 ) ) ( IS-CRATE ?auto_21666 ) ( not ( = ?auto_21695 ?auto_21673 ) ) ( HOIST-AT ?auto_21689 ?auto_21695 ) ( AVAILABLE ?auto_21689 ) ( SURFACE-AT ?auto_21666 ?auto_21695 ) ( ON ?auto_21666 ?auto_21698 ) ( CLEAR ?auto_21666 ) ( not ( = ?auto_21665 ?auto_21666 ) ) ( not ( = ?auto_21665 ?auto_21698 ) ) ( not ( = ?auto_21666 ?auto_21698 ) ) ( not ( = ?auto_21671 ?auto_21689 ) ) ( IS-CRATE ?auto_21665 ) ( not ( = ?auto_21682 ?auto_21673 ) ) ( HOIST-AT ?auto_21679 ?auto_21682 ) ( AVAILABLE ?auto_21679 ) ( SURFACE-AT ?auto_21665 ?auto_21682 ) ( ON ?auto_21665 ?auto_21690 ) ( CLEAR ?auto_21665 ) ( not ( = ?auto_21664 ?auto_21665 ) ) ( not ( = ?auto_21664 ?auto_21690 ) ) ( not ( = ?auto_21665 ?auto_21690 ) ) ( not ( = ?auto_21671 ?auto_21679 ) ) ( IS-CRATE ?auto_21664 ) ( not ( = ?auto_21685 ?auto_21673 ) ) ( HOIST-AT ?auto_21697 ?auto_21685 ) ( AVAILABLE ?auto_21697 ) ( SURFACE-AT ?auto_21664 ?auto_21685 ) ( ON ?auto_21664 ?auto_21691 ) ( CLEAR ?auto_21664 ) ( not ( = ?auto_21663 ?auto_21664 ) ) ( not ( = ?auto_21663 ?auto_21691 ) ) ( not ( = ?auto_21664 ?auto_21691 ) ) ( not ( = ?auto_21671 ?auto_21697 ) ) ( IS-CRATE ?auto_21663 ) ( not ( = ?auto_21694 ?auto_21673 ) ) ( HOIST-AT ?auto_21677 ?auto_21694 ) ( AVAILABLE ?auto_21677 ) ( SURFACE-AT ?auto_21663 ?auto_21694 ) ( ON ?auto_21663 ?auto_21686 ) ( CLEAR ?auto_21663 ) ( not ( = ?auto_21662 ?auto_21663 ) ) ( not ( = ?auto_21662 ?auto_21686 ) ) ( not ( = ?auto_21663 ?auto_21686 ) ) ( not ( = ?auto_21671 ?auto_21677 ) ) ( SURFACE-AT ?auto_21661 ?auto_21673 ) ( CLEAR ?auto_21661 ) ( IS-CRATE ?auto_21662 ) ( AVAILABLE ?auto_21671 ) ( AVAILABLE ?auto_21675 ) ( SURFACE-AT ?auto_21662 ?auto_21672 ) ( ON ?auto_21662 ?auto_21696 ) ( CLEAR ?auto_21662 ) ( TRUCK-AT ?auto_21676 ?auto_21673 ) ( not ( = ?auto_21661 ?auto_21662 ) ) ( not ( = ?auto_21661 ?auto_21696 ) ) ( not ( = ?auto_21662 ?auto_21696 ) ) ( not ( = ?auto_21661 ?auto_21663 ) ) ( not ( = ?auto_21661 ?auto_21686 ) ) ( not ( = ?auto_21663 ?auto_21696 ) ) ( not ( = ?auto_21694 ?auto_21672 ) ) ( not ( = ?auto_21677 ?auto_21675 ) ) ( not ( = ?auto_21686 ?auto_21696 ) ) ( not ( = ?auto_21661 ?auto_21664 ) ) ( not ( = ?auto_21661 ?auto_21691 ) ) ( not ( = ?auto_21662 ?auto_21664 ) ) ( not ( = ?auto_21662 ?auto_21691 ) ) ( not ( = ?auto_21664 ?auto_21686 ) ) ( not ( = ?auto_21664 ?auto_21696 ) ) ( not ( = ?auto_21685 ?auto_21694 ) ) ( not ( = ?auto_21685 ?auto_21672 ) ) ( not ( = ?auto_21697 ?auto_21677 ) ) ( not ( = ?auto_21697 ?auto_21675 ) ) ( not ( = ?auto_21691 ?auto_21686 ) ) ( not ( = ?auto_21691 ?auto_21696 ) ) ( not ( = ?auto_21661 ?auto_21665 ) ) ( not ( = ?auto_21661 ?auto_21690 ) ) ( not ( = ?auto_21662 ?auto_21665 ) ) ( not ( = ?auto_21662 ?auto_21690 ) ) ( not ( = ?auto_21663 ?auto_21665 ) ) ( not ( = ?auto_21663 ?auto_21690 ) ) ( not ( = ?auto_21665 ?auto_21691 ) ) ( not ( = ?auto_21665 ?auto_21686 ) ) ( not ( = ?auto_21665 ?auto_21696 ) ) ( not ( = ?auto_21682 ?auto_21685 ) ) ( not ( = ?auto_21682 ?auto_21694 ) ) ( not ( = ?auto_21682 ?auto_21672 ) ) ( not ( = ?auto_21679 ?auto_21697 ) ) ( not ( = ?auto_21679 ?auto_21677 ) ) ( not ( = ?auto_21679 ?auto_21675 ) ) ( not ( = ?auto_21690 ?auto_21691 ) ) ( not ( = ?auto_21690 ?auto_21686 ) ) ( not ( = ?auto_21690 ?auto_21696 ) ) ( not ( = ?auto_21661 ?auto_21666 ) ) ( not ( = ?auto_21661 ?auto_21698 ) ) ( not ( = ?auto_21662 ?auto_21666 ) ) ( not ( = ?auto_21662 ?auto_21698 ) ) ( not ( = ?auto_21663 ?auto_21666 ) ) ( not ( = ?auto_21663 ?auto_21698 ) ) ( not ( = ?auto_21664 ?auto_21666 ) ) ( not ( = ?auto_21664 ?auto_21698 ) ) ( not ( = ?auto_21666 ?auto_21690 ) ) ( not ( = ?auto_21666 ?auto_21691 ) ) ( not ( = ?auto_21666 ?auto_21686 ) ) ( not ( = ?auto_21666 ?auto_21696 ) ) ( not ( = ?auto_21695 ?auto_21682 ) ) ( not ( = ?auto_21695 ?auto_21685 ) ) ( not ( = ?auto_21695 ?auto_21694 ) ) ( not ( = ?auto_21695 ?auto_21672 ) ) ( not ( = ?auto_21689 ?auto_21679 ) ) ( not ( = ?auto_21689 ?auto_21697 ) ) ( not ( = ?auto_21689 ?auto_21677 ) ) ( not ( = ?auto_21689 ?auto_21675 ) ) ( not ( = ?auto_21698 ?auto_21690 ) ) ( not ( = ?auto_21698 ?auto_21691 ) ) ( not ( = ?auto_21698 ?auto_21686 ) ) ( not ( = ?auto_21698 ?auto_21696 ) ) ( not ( = ?auto_21661 ?auto_21669 ) ) ( not ( = ?auto_21661 ?auto_21692 ) ) ( not ( = ?auto_21662 ?auto_21669 ) ) ( not ( = ?auto_21662 ?auto_21692 ) ) ( not ( = ?auto_21663 ?auto_21669 ) ) ( not ( = ?auto_21663 ?auto_21692 ) ) ( not ( = ?auto_21664 ?auto_21669 ) ) ( not ( = ?auto_21664 ?auto_21692 ) ) ( not ( = ?auto_21665 ?auto_21669 ) ) ( not ( = ?auto_21665 ?auto_21692 ) ) ( not ( = ?auto_21669 ?auto_21698 ) ) ( not ( = ?auto_21669 ?auto_21690 ) ) ( not ( = ?auto_21669 ?auto_21691 ) ) ( not ( = ?auto_21669 ?auto_21686 ) ) ( not ( = ?auto_21669 ?auto_21696 ) ) ( not ( = ?auto_21688 ?auto_21695 ) ) ( not ( = ?auto_21688 ?auto_21682 ) ) ( not ( = ?auto_21688 ?auto_21685 ) ) ( not ( = ?auto_21688 ?auto_21694 ) ) ( not ( = ?auto_21688 ?auto_21672 ) ) ( not ( = ?auto_21693 ?auto_21689 ) ) ( not ( = ?auto_21693 ?auto_21679 ) ) ( not ( = ?auto_21693 ?auto_21697 ) ) ( not ( = ?auto_21693 ?auto_21677 ) ) ( not ( = ?auto_21693 ?auto_21675 ) ) ( not ( = ?auto_21692 ?auto_21698 ) ) ( not ( = ?auto_21692 ?auto_21690 ) ) ( not ( = ?auto_21692 ?auto_21691 ) ) ( not ( = ?auto_21692 ?auto_21686 ) ) ( not ( = ?auto_21692 ?auto_21696 ) ) ( not ( = ?auto_21661 ?auto_21668 ) ) ( not ( = ?auto_21661 ?auto_21687 ) ) ( not ( = ?auto_21662 ?auto_21668 ) ) ( not ( = ?auto_21662 ?auto_21687 ) ) ( not ( = ?auto_21663 ?auto_21668 ) ) ( not ( = ?auto_21663 ?auto_21687 ) ) ( not ( = ?auto_21664 ?auto_21668 ) ) ( not ( = ?auto_21664 ?auto_21687 ) ) ( not ( = ?auto_21665 ?auto_21668 ) ) ( not ( = ?auto_21665 ?auto_21687 ) ) ( not ( = ?auto_21666 ?auto_21668 ) ) ( not ( = ?auto_21666 ?auto_21687 ) ) ( not ( = ?auto_21668 ?auto_21692 ) ) ( not ( = ?auto_21668 ?auto_21698 ) ) ( not ( = ?auto_21668 ?auto_21690 ) ) ( not ( = ?auto_21668 ?auto_21691 ) ) ( not ( = ?auto_21668 ?auto_21686 ) ) ( not ( = ?auto_21668 ?auto_21696 ) ) ( not ( = ?auto_21683 ?auto_21688 ) ) ( not ( = ?auto_21683 ?auto_21695 ) ) ( not ( = ?auto_21683 ?auto_21682 ) ) ( not ( = ?auto_21683 ?auto_21685 ) ) ( not ( = ?auto_21683 ?auto_21694 ) ) ( not ( = ?auto_21683 ?auto_21672 ) ) ( not ( = ?auto_21678 ?auto_21693 ) ) ( not ( = ?auto_21678 ?auto_21689 ) ) ( not ( = ?auto_21678 ?auto_21679 ) ) ( not ( = ?auto_21678 ?auto_21697 ) ) ( not ( = ?auto_21678 ?auto_21677 ) ) ( not ( = ?auto_21678 ?auto_21675 ) ) ( not ( = ?auto_21687 ?auto_21692 ) ) ( not ( = ?auto_21687 ?auto_21698 ) ) ( not ( = ?auto_21687 ?auto_21690 ) ) ( not ( = ?auto_21687 ?auto_21691 ) ) ( not ( = ?auto_21687 ?auto_21686 ) ) ( not ( = ?auto_21687 ?auto_21696 ) ) ( not ( = ?auto_21661 ?auto_21667 ) ) ( not ( = ?auto_21661 ?auto_21681 ) ) ( not ( = ?auto_21662 ?auto_21667 ) ) ( not ( = ?auto_21662 ?auto_21681 ) ) ( not ( = ?auto_21663 ?auto_21667 ) ) ( not ( = ?auto_21663 ?auto_21681 ) ) ( not ( = ?auto_21664 ?auto_21667 ) ) ( not ( = ?auto_21664 ?auto_21681 ) ) ( not ( = ?auto_21665 ?auto_21667 ) ) ( not ( = ?auto_21665 ?auto_21681 ) ) ( not ( = ?auto_21666 ?auto_21667 ) ) ( not ( = ?auto_21666 ?auto_21681 ) ) ( not ( = ?auto_21669 ?auto_21667 ) ) ( not ( = ?auto_21669 ?auto_21681 ) ) ( not ( = ?auto_21667 ?auto_21687 ) ) ( not ( = ?auto_21667 ?auto_21692 ) ) ( not ( = ?auto_21667 ?auto_21698 ) ) ( not ( = ?auto_21667 ?auto_21690 ) ) ( not ( = ?auto_21667 ?auto_21691 ) ) ( not ( = ?auto_21667 ?auto_21686 ) ) ( not ( = ?auto_21667 ?auto_21696 ) ) ( not ( = ?auto_21684 ?auto_21683 ) ) ( not ( = ?auto_21684 ?auto_21688 ) ) ( not ( = ?auto_21684 ?auto_21695 ) ) ( not ( = ?auto_21684 ?auto_21682 ) ) ( not ( = ?auto_21684 ?auto_21685 ) ) ( not ( = ?auto_21684 ?auto_21694 ) ) ( not ( = ?auto_21684 ?auto_21672 ) ) ( not ( = ?auto_21680 ?auto_21678 ) ) ( not ( = ?auto_21680 ?auto_21693 ) ) ( not ( = ?auto_21680 ?auto_21689 ) ) ( not ( = ?auto_21680 ?auto_21679 ) ) ( not ( = ?auto_21680 ?auto_21697 ) ) ( not ( = ?auto_21680 ?auto_21677 ) ) ( not ( = ?auto_21680 ?auto_21675 ) ) ( not ( = ?auto_21681 ?auto_21687 ) ) ( not ( = ?auto_21681 ?auto_21692 ) ) ( not ( = ?auto_21681 ?auto_21698 ) ) ( not ( = ?auto_21681 ?auto_21690 ) ) ( not ( = ?auto_21681 ?auto_21691 ) ) ( not ( = ?auto_21681 ?auto_21686 ) ) ( not ( = ?auto_21681 ?auto_21696 ) ) ( not ( = ?auto_21661 ?auto_21670 ) ) ( not ( = ?auto_21661 ?auto_21674 ) ) ( not ( = ?auto_21662 ?auto_21670 ) ) ( not ( = ?auto_21662 ?auto_21674 ) ) ( not ( = ?auto_21663 ?auto_21670 ) ) ( not ( = ?auto_21663 ?auto_21674 ) ) ( not ( = ?auto_21664 ?auto_21670 ) ) ( not ( = ?auto_21664 ?auto_21674 ) ) ( not ( = ?auto_21665 ?auto_21670 ) ) ( not ( = ?auto_21665 ?auto_21674 ) ) ( not ( = ?auto_21666 ?auto_21670 ) ) ( not ( = ?auto_21666 ?auto_21674 ) ) ( not ( = ?auto_21669 ?auto_21670 ) ) ( not ( = ?auto_21669 ?auto_21674 ) ) ( not ( = ?auto_21668 ?auto_21670 ) ) ( not ( = ?auto_21668 ?auto_21674 ) ) ( not ( = ?auto_21670 ?auto_21681 ) ) ( not ( = ?auto_21670 ?auto_21687 ) ) ( not ( = ?auto_21670 ?auto_21692 ) ) ( not ( = ?auto_21670 ?auto_21698 ) ) ( not ( = ?auto_21670 ?auto_21690 ) ) ( not ( = ?auto_21670 ?auto_21691 ) ) ( not ( = ?auto_21670 ?auto_21686 ) ) ( not ( = ?auto_21670 ?auto_21696 ) ) ( not ( = ?auto_21674 ?auto_21681 ) ) ( not ( = ?auto_21674 ?auto_21687 ) ) ( not ( = ?auto_21674 ?auto_21692 ) ) ( not ( = ?auto_21674 ?auto_21698 ) ) ( not ( = ?auto_21674 ?auto_21690 ) ) ( not ( = ?auto_21674 ?auto_21691 ) ) ( not ( = ?auto_21674 ?auto_21686 ) ) ( not ( = ?auto_21674 ?auto_21696 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_21661 ?auto_21662 ?auto_21663 ?auto_21664 ?auto_21665 ?auto_21666 ?auto_21669 ?auto_21668 ?auto_21667 )
      ( MAKE-1CRATE ?auto_21667 ?auto_21670 )
      ( MAKE-9CRATE-VERIFY ?auto_21661 ?auto_21662 ?auto_21663 ?auto_21664 ?auto_21665 ?auto_21666 ?auto_21669 ?auto_21668 ?auto_21667 ?auto_21670 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21701 - SURFACE
      ?auto_21702 - SURFACE
    )
    :vars
    (
      ?auto_21703 - HOIST
      ?auto_21704 - PLACE
      ?auto_21706 - PLACE
      ?auto_21707 - HOIST
      ?auto_21708 - SURFACE
      ?auto_21705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21703 ?auto_21704 ) ( SURFACE-AT ?auto_21701 ?auto_21704 ) ( CLEAR ?auto_21701 ) ( IS-CRATE ?auto_21702 ) ( AVAILABLE ?auto_21703 ) ( not ( = ?auto_21706 ?auto_21704 ) ) ( HOIST-AT ?auto_21707 ?auto_21706 ) ( AVAILABLE ?auto_21707 ) ( SURFACE-AT ?auto_21702 ?auto_21706 ) ( ON ?auto_21702 ?auto_21708 ) ( CLEAR ?auto_21702 ) ( TRUCK-AT ?auto_21705 ?auto_21704 ) ( not ( = ?auto_21701 ?auto_21702 ) ) ( not ( = ?auto_21701 ?auto_21708 ) ) ( not ( = ?auto_21702 ?auto_21708 ) ) ( not ( = ?auto_21703 ?auto_21707 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21705 ?auto_21704 ?auto_21706 )
      ( !LIFT ?auto_21707 ?auto_21702 ?auto_21708 ?auto_21706 )
      ( !LOAD ?auto_21707 ?auto_21702 ?auto_21705 ?auto_21706 )
      ( !DRIVE ?auto_21705 ?auto_21706 ?auto_21704 )
      ( !UNLOAD ?auto_21703 ?auto_21702 ?auto_21705 ?auto_21704 )
      ( !DROP ?auto_21703 ?auto_21702 ?auto_21701 ?auto_21704 )
      ( MAKE-1CRATE-VERIFY ?auto_21701 ?auto_21702 ) )
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
      ?auto_21728 - SURFACE
      ?auto_21727 - SURFACE
      ?auto_21726 - SURFACE
      ?auto_21729 - SURFACE
      ?auto_21730 - SURFACE
    )
    :vars
    (
      ?auto_21736 - HOIST
      ?auto_21732 - PLACE
      ?auto_21734 - PLACE
      ?auto_21731 - HOIST
      ?auto_21733 - SURFACE
      ?auto_21758 - PLACE
      ?auto_21742 - HOIST
      ?auto_21754 - SURFACE
      ?auto_21748 - PLACE
      ?auto_21737 - HOIST
      ?auto_21751 - SURFACE
      ?auto_21749 - PLACE
      ?auto_21757 - HOIST
      ?auto_21755 - SURFACE
      ?auto_21740 - PLACE
      ?auto_21756 - HOIST
      ?auto_21741 - SURFACE
      ?auto_21743 - PLACE
      ?auto_21746 - HOIST
      ?auto_21759 - SURFACE
      ?auto_21750 - PLACE
      ?auto_21745 - HOIST
      ?auto_21747 - SURFACE
      ?auto_21753 - SURFACE
      ?auto_21738 - PLACE
      ?auto_21752 - HOIST
      ?auto_21739 - SURFACE
      ?auto_21744 - SURFACE
      ?auto_21735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21736 ?auto_21732 ) ( IS-CRATE ?auto_21730 ) ( not ( = ?auto_21734 ?auto_21732 ) ) ( HOIST-AT ?auto_21731 ?auto_21734 ) ( SURFACE-AT ?auto_21730 ?auto_21734 ) ( ON ?auto_21730 ?auto_21733 ) ( CLEAR ?auto_21730 ) ( not ( = ?auto_21729 ?auto_21730 ) ) ( not ( = ?auto_21729 ?auto_21733 ) ) ( not ( = ?auto_21730 ?auto_21733 ) ) ( not ( = ?auto_21736 ?auto_21731 ) ) ( IS-CRATE ?auto_21729 ) ( not ( = ?auto_21758 ?auto_21732 ) ) ( HOIST-AT ?auto_21742 ?auto_21758 ) ( SURFACE-AT ?auto_21729 ?auto_21758 ) ( ON ?auto_21729 ?auto_21754 ) ( CLEAR ?auto_21729 ) ( not ( = ?auto_21726 ?auto_21729 ) ) ( not ( = ?auto_21726 ?auto_21754 ) ) ( not ( = ?auto_21729 ?auto_21754 ) ) ( not ( = ?auto_21736 ?auto_21742 ) ) ( IS-CRATE ?auto_21726 ) ( not ( = ?auto_21748 ?auto_21732 ) ) ( HOIST-AT ?auto_21737 ?auto_21748 ) ( AVAILABLE ?auto_21737 ) ( SURFACE-AT ?auto_21726 ?auto_21748 ) ( ON ?auto_21726 ?auto_21751 ) ( CLEAR ?auto_21726 ) ( not ( = ?auto_21727 ?auto_21726 ) ) ( not ( = ?auto_21727 ?auto_21751 ) ) ( not ( = ?auto_21726 ?auto_21751 ) ) ( not ( = ?auto_21736 ?auto_21737 ) ) ( IS-CRATE ?auto_21727 ) ( not ( = ?auto_21749 ?auto_21732 ) ) ( HOIST-AT ?auto_21757 ?auto_21749 ) ( AVAILABLE ?auto_21757 ) ( SURFACE-AT ?auto_21727 ?auto_21749 ) ( ON ?auto_21727 ?auto_21755 ) ( CLEAR ?auto_21727 ) ( not ( = ?auto_21728 ?auto_21727 ) ) ( not ( = ?auto_21728 ?auto_21755 ) ) ( not ( = ?auto_21727 ?auto_21755 ) ) ( not ( = ?auto_21736 ?auto_21757 ) ) ( IS-CRATE ?auto_21728 ) ( not ( = ?auto_21740 ?auto_21732 ) ) ( HOIST-AT ?auto_21756 ?auto_21740 ) ( AVAILABLE ?auto_21756 ) ( SURFACE-AT ?auto_21728 ?auto_21740 ) ( ON ?auto_21728 ?auto_21741 ) ( CLEAR ?auto_21728 ) ( not ( = ?auto_21725 ?auto_21728 ) ) ( not ( = ?auto_21725 ?auto_21741 ) ) ( not ( = ?auto_21728 ?auto_21741 ) ) ( not ( = ?auto_21736 ?auto_21756 ) ) ( IS-CRATE ?auto_21725 ) ( not ( = ?auto_21743 ?auto_21732 ) ) ( HOIST-AT ?auto_21746 ?auto_21743 ) ( AVAILABLE ?auto_21746 ) ( SURFACE-AT ?auto_21725 ?auto_21743 ) ( ON ?auto_21725 ?auto_21759 ) ( CLEAR ?auto_21725 ) ( not ( = ?auto_21724 ?auto_21725 ) ) ( not ( = ?auto_21724 ?auto_21759 ) ) ( not ( = ?auto_21725 ?auto_21759 ) ) ( not ( = ?auto_21736 ?auto_21746 ) ) ( IS-CRATE ?auto_21724 ) ( not ( = ?auto_21750 ?auto_21732 ) ) ( HOIST-AT ?auto_21745 ?auto_21750 ) ( AVAILABLE ?auto_21745 ) ( SURFACE-AT ?auto_21724 ?auto_21750 ) ( ON ?auto_21724 ?auto_21747 ) ( CLEAR ?auto_21724 ) ( not ( = ?auto_21723 ?auto_21724 ) ) ( not ( = ?auto_21723 ?auto_21747 ) ) ( not ( = ?auto_21724 ?auto_21747 ) ) ( not ( = ?auto_21736 ?auto_21745 ) ) ( IS-CRATE ?auto_21723 ) ( AVAILABLE ?auto_21731 ) ( SURFACE-AT ?auto_21723 ?auto_21734 ) ( ON ?auto_21723 ?auto_21753 ) ( CLEAR ?auto_21723 ) ( not ( = ?auto_21722 ?auto_21723 ) ) ( not ( = ?auto_21722 ?auto_21753 ) ) ( not ( = ?auto_21723 ?auto_21753 ) ) ( IS-CRATE ?auto_21722 ) ( not ( = ?auto_21738 ?auto_21732 ) ) ( HOIST-AT ?auto_21752 ?auto_21738 ) ( AVAILABLE ?auto_21752 ) ( SURFACE-AT ?auto_21722 ?auto_21738 ) ( ON ?auto_21722 ?auto_21739 ) ( CLEAR ?auto_21722 ) ( not ( = ?auto_21721 ?auto_21722 ) ) ( not ( = ?auto_21721 ?auto_21739 ) ) ( not ( = ?auto_21722 ?auto_21739 ) ) ( not ( = ?auto_21736 ?auto_21752 ) ) ( SURFACE-AT ?auto_21720 ?auto_21732 ) ( CLEAR ?auto_21720 ) ( IS-CRATE ?auto_21721 ) ( AVAILABLE ?auto_21736 ) ( AVAILABLE ?auto_21742 ) ( SURFACE-AT ?auto_21721 ?auto_21758 ) ( ON ?auto_21721 ?auto_21744 ) ( CLEAR ?auto_21721 ) ( TRUCK-AT ?auto_21735 ?auto_21732 ) ( not ( = ?auto_21720 ?auto_21721 ) ) ( not ( = ?auto_21720 ?auto_21744 ) ) ( not ( = ?auto_21721 ?auto_21744 ) ) ( not ( = ?auto_21720 ?auto_21722 ) ) ( not ( = ?auto_21720 ?auto_21739 ) ) ( not ( = ?auto_21722 ?auto_21744 ) ) ( not ( = ?auto_21738 ?auto_21758 ) ) ( not ( = ?auto_21752 ?auto_21742 ) ) ( not ( = ?auto_21739 ?auto_21744 ) ) ( not ( = ?auto_21720 ?auto_21723 ) ) ( not ( = ?auto_21720 ?auto_21753 ) ) ( not ( = ?auto_21721 ?auto_21723 ) ) ( not ( = ?auto_21721 ?auto_21753 ) ) ( not ( = ?auto_21723 ?auto_21739 ) ) ( not ( = ?auto_21723 ?auto_21744 ) ) ( not ( = ?auto_21734 ?auto_21738 ) ) ( not ( = ?auto_21734 ?auto_21758 ) ) ( not ( = ?auto_21731 ?auto_21752 ) ) ( not ( = ?auto_21731 ?auto_21742 ) ) ( not ( = ?auto_21753 ?auto_21739 ) ) ( not ( = ?auto_21753 ?auto_21744 ) ) ( not ( = ?auto_21720 ?auto_21724 ) ) ( not ( = ?auto_21720 ?auto_21747 ) ) ( not ( = ?auto_21721 ?auto_21724 ) ) ( not ( = ?auto_21721 ?auto_21747 ) ) ( not ( = ?auto_21722 ?auto_21724 ) ) ( not ( = ?auto_21722 ?auto_21747 ) ) ( not ( = ?auto_21724 ?auto_21753 ) ) ( not ( = ?auto_21724 ?auto_21739 ) ) ( not ( = ?auto_21724 ?auto_21744 ) ) ( not ( = ?auto_21750 ?auto_21734 ) ) ( not ( = ?auto_21750 ?auto_21738 ) ) ( not ( = ?auto_21750 ?auto_21758 ) ) ( not ( = ?auto_21745 ?auto_21731 ) ) ( not ( = ?auto_21745 ?auto_21752 ) ) ( not ( = ?auto_21745 ?auto_21742 ) ) ( not ( = ?auto_21747 ?auto_21753 ) ) ( not ( = ?auto_21747 ?auto_21739 ) ) ( not ( = ?auto_21747 ?auto_21744 ) ) ( not ( = ?auto_21720 ?auto_21725 ) ) ( not ( = ?auto_21720 ?auto_21759 ) ) ( not ( = ?auto_21721 ?auto_21725 ) ) ( not ( = ?auto_21721 ?auto_21759 ) ) ( not ( = ?auto_21722 ?auto_21725 ) ) ( not ( = ?auto_21722 ?auto_21759 ) ) ( not ( = ?auto_21723 ?auto_21725 ) ) ( not ( = ?auto_21723 ?auto_21759 ) ) ( not ( = ?auto_21725 ?auto_21747 ) ) ( not ( = ?auto_21725 ?auto_21753 ) ) ( not ( = ?auto_21725 ?auto_21739 ) ) ( not ( = ?auto_21725 ?auto_21744 ) ) ( not ( = ?auto_21743 ?auto_21750 ) ) ( not ( = ?auto_21743 ?auto_21734 ) ) ( not ( = ?auto_21743 ?auto_21738 ) ) ( not ( = ?auto_21743 ?auto_21758 ) ) ( not ( = ?auto_21746 ?auto_21745 ) ) ( not ( = ?auto_21746 ?auto_21731 ) ) ( not ( = ?auto_21746 ?auto_21752 ) ) ( not ( = ?auto_21746 ?auto_21742 ) ) ( not ( = ?auto_21759 ?auto_21747 ) ) ( not ( = ?auto_21759 ?auto_21753 ) ) ( not ( = ?auto_21759 ?auto_21739 ) ) ( not ( = ?auto_21759 ?auto_21744 ) ) ( not ( = ?auto_21720 ?auto_21728 ) ) ( not ( = ?auto_21720 ?auto_21741 ) ) ( not ( = ?auto_21721 ?auto_21728 ) ) ( not ( = ?auto_21721 ?auto_21741 ) ) ( not ( = ?auto_21722 ?auto_21728 ) ) ( not ( = ?auto_21722 ?auto_21741 ) ) ( not ( = ?auto_21723 ?auto_21728 ) ) ( not ( = ?auto_21723 ?auto_21741 ) ) ( not ( = ?auto_21724 ?auto_21728 ) ) ( not ( = ?auto_21724 ?auto_21741 ) ) ( not ( = ?auto_21728 ?auto_21759 ) ) ( not ( = ?auto_21728 ?auto_21747 ) ) ( not ( = ?auto_21728 ?auto_21753 ) ) ( not ( = ?auto_21728 ?auto_21739 ) ) ( not ( = ?auto_21728 ?auto_21744 ) ) ( not ( = ?auto_21740 ?auto_21743 ) ) ( not ( = ?auto_21740 ?auto_21750 ) ) ( not ( = ?auto_21740 ?auto_21734 ) ) ( not ( = ?auto_21740 ?auto_21738 ) ) ( not ( = ?auto_21740 ?auto_21758 ) ) ( not ( = ?auto_21756 ?auto_21746 ) ) ( not ( = ?auto_21756 ?auto_21745 ) ) ( not ( = ?auto_21756 ?auto_21731 ) ) ( not ( = ?auto_21756 ?auto_21752 ) ) ( not ( = ?auto_21756 ?auto_21742 ) ) ( not ( = ?auto_21741 ?auto_21759 ) ) ( not ( = ?auto_21741 ?auto_21747 ) ) ( not ( = ?auto_21741 ?auto_21753 ) ) ( not ( = ?auto_21741 ?auto_21739 ) ) ( not ( = ?auto_21741 ?auto_21744 ) ) ( not ( = ?auto_21720 ?auto_21727 ) ) ( not ( = ?auto_21720 ?auto_21755 ) ) ( not ( = ?auto_21721 ?auto_21727 ) ) ( not ( = ?auto_21721 ?auto_21755 ) ) ( not ( = ?auto_21722 ?auto_21727 ) ) ( not ( = ?auto_21722 ?auto_21755 ) ) ( not ( = ?auto_21723 ?auto_21727 ) ) ( not ( = ?auto_21723 ?auto_21755 ) ) ( not ( = ?auto_21724 ?auto_21727 ) ) ( not ( = ?auto_21724 ?auto_21755 ) ) ( not ( = ?auto_21725 ?auto_21727 ) ) ( not ( = ?auto_21725 ?auto_21755 ) ) ( not ( = ?auto_21727 ?auto_21741 ) ) ( not ( = ?auto_21727 ?auto_21759 ) ) ( not ( = ?auto_21727 ?auto_21747 ) ) ( not ( = ?auto_21727 ?auto_21753 ) ) ( not ( = ?auto_21727 ?auto_21739 ) ) ( not ( = ?auto_21727 ?auto_21744 ) ) ( not ( = ?auto_21749 ?auto_21740 ) ) ( not ( = ?auto_21749 ?auto_21743 ) ) ( not ( = ?auto_21749 ?auto_21750 ) ) ( not ( = ?auto_21749 ?auto_21734 ) ) ( not ( = ?auto_21749 ?auto_21738 ) ) ( not ( = ?auto_21749 ?auto_21758 ) ) ( not ( = ?auto_21757 ?auto_21756 ) ) ( not ( = ?auto_21757 ?auto_21746 ) ) ( not ( = ?auto_21757 ?auto_21745 ) ) ( not ( = ?auto_21757 ?auto_21731 ) ) ( not ( = ?auto_21757 ?auto_21752 ) ) ( not ( = ?auto_21757 ?auto_21742 ) ) ( not ( = ?auto_21755 ?auto_21741 ) ) ( not ( = ?auto_21755 ?auto_21759 ) ) ( not ( = ?auto_21755 ?auto_21747 ) ) ( not ( = ?auto_21755 ?auto_21753 ) ) ( not ( = ?auto_21755 ?auto_21739 ) ) ( not ( = ?auto_21755 ?auto_21744 ) ) ( not ( = ?auto_21720 ?auto_21726 ) ) ( not ( = ?auto_21720 ?auto_21751 ) ) ( not ( = ?auto_21721 ?auto_21726 ) ) ( not ( = ?auto_21721 ?auto_21751 ) ) ( not ( = ?auto_21722 ?auto_21726 ) ) ( not ( = ?auto_21722 ?auto_21751 ) ) ( not ( = ?auto_21723 ?auto_21726 ) ) ( not ( = ?auto_21723 ?auto_21751 ) ) ( not ( = ?auto_21724 ?auto_21726 ) ) ( not ( = ?auto_21724 ?auto_21751 ) ) ( not ( = ?auto_21725 ?auto_21726 ) ) ( not ( = ?auto_21725 ?auto_21751 ) ) ( not ( = ?auto_21728 ?auto_21726 ) ) ( not ( = ?auto_21728 ?auto_21751 ) ) ( not ( = ?auto_21726 ?auto_21755 ) ) ( not ( = ?auto_21726 ?auto_21741 ) ) ( not ( = ?auto_21726 ?auto_21759 ) ) ( not ( = ?auto_21726 ?auto_21747 ) ) ( not ( = ?auto_21726 ?auto_21753 ) ) ( not ( = ?auto_21726 ?auto_21739 ) ) ( not ( = ?auto_21726 ?auto_21744 ) ) ( not ( = ?auto_21748 ?auto_21749 ) ) ( not ( = ?auto_21748 ?auto_21740 ) ) ( not ( = ?auto_21748 ?auto_21743 ) ) ( not ( = ?auto_21748 ?auto_21750 ) ) ( not ( = ?auto_21748 ?auto_21734 ) ) ( not ( = ?auto_21748 ?auto_21738 ) ) ( not ( = ?auto_21748 ?auto_21758 ) ) ( not ( = ?auto_21737 ?auto_21757 ) ) ( not ( = ?auto_21737 ?auto_21756 ) ) ( not ( = ?auto_21737 ?auto_21746 ) ) ( not ( = ?auto_21737 ?auto_21745 ) ) ( not ( = ?auto_21737 ?auto_21731 ) ) ( not ( = ?auto_21737 ?auto_21752 ) ) ( not ( = ?auto_21737 ?auto_21742 ) ) ( not ( = ?auto_21751 ?auto_21755 ) ) ( not ( = ?auto_21751 ?auto_21741 ) ) ( not ( = ?auto_21751 ?auto_21759 ) ) ( not ( = ?auto_21751 ?auto_21747 ) ) ( not ( = ?auto_21751 ?auto_21753 ) ) ( not ( = ?auto_21751 ?auto_21739 ) ) ( not ( = ?auto_21751 ?auto_21744 ) ) ( not ( = ?auto_21720 ?auto_21729 ) ) ( not ( = ?auto_21720 ?auto_21754 ) ) ( not ( = ?auto_21721 ?auto_21729 ) ) ( not ( = ?auto_21721 ?auto_21754 ) ) ( not ( = ?auto_21722 ?auto_21729 ) ) ( not ( = ?auto_21722 ?auto_21754 ) ) ( not ( = ?auto_21723 ?auto_21729 ) ) ( not ( = ?auto_21723 ?auto_21754 ) ) ( not ( = ?auto_21724 ?auto_21729 ) ) ( not ( = ?auto_21724 ?auto_21754 ) ) ( not ( = ?auto_21725 ?auto_21729 ) ) ( not ( = ?auto_21725 ?auto_21754 ) ) ( not ( = ?auto_21728 ?auto_21729 ) ) ( not ( = ?auto_21728 ?auto_21754 ) ) ( not ( = ?auto_21727 ?auto_21729 ) ) ( not ( = ?auto_21727 ?auto_21754 ) ) ( not ( = ?auto_21729 ?auto_21751 ) ) ( not ( = ?auto_21729 ?auto_21755 ) ) ( not ( = ?auto_21729 ?auto_21741 ) ) ( not ( = ?auto_21729 ?auto_21759 ) ) ( not ( = ?auto_21729 ?auto_21747 ) ) ( not ( = ?auto_21729 ?auto_21753 ) ) ( not ( = ?auto_21729 ?auto_21739 ) ) ( not ( = ?auto_21729 ?auto_21744 ) ) ( not ( = ?auto_21754 ?auto_21751 ) ) ( not ( = ?auto_21754 ?auto_21755 ) ) ( not ( = ?auto_21754 ?auto_21741 ) ) ( not ( = ?auto_21754 ?auto_21759 ) ) ( not ( = ?auto_21754 ?auto_21747 ) ) ( not ( = ?auto_21754 ?auto_21753 ) ) ( not ( = ?auto_21754 ?auto_21739 ) ) ( not ( = ?auto_21754 ?auto_21744 ) ) ( not ( = ?auto_21720 ?auto_21730 ) ) ( not ( = ?auto_21720 ?auto_21733 ) ) ( not ( = ?auto_21721 ?auto_21730 ) ) ( not ( = ?auto_21721 ?auto_21733 ) ) ( not ( = ?auto_21722 ?auto_21730 ) ) ( not ( = ?auto_21722 ?auto_21733 ) ) ( not ( = ?auto_21723 ?auto_21730 ) ) ( not ( = ?auto_21723 ?auto_21733 ) ) ( not ( = ?auto_21724 ?auto_21730 ) ) ( not ( = ?auto_21724 ?auto_21733 ) ) ( not ( = ?auto_21725 ?auto_21730 ) ) ( not ( = ?auto_21725 ?auto_21733 ) ) ( not ( = ?auto_21728 ?auto_21730 ) ) ( not ( = ?auto_21728 ?auto_21733 ) ) ( not ( = ?auto_21727 ?auto_21730 ) ) ( not ( = ?auto_21727 ?auto_21733 ) ) ( not ( = ?auto_21726 ?auto_21730 ) ) ( not ( = ?auto_21726 ?auto_21733 ) ) ( not ( = ?auto_21730 ?auto_21754 ) ) ( not ( = ?auto_21730 ?auto_21751 ) ) ( not ( = ?auto_21730 ?auto_21755 ) ) ( not ( = ?auto_21730 ?auto_21741 ) ) ( not ( = ?auto_21730 ?auto_21759 ) ) ( not ( = ?auto_21730 ?auto_21747 ) ) ( not ( = ?auto_21730 ?auto_21753 ) ) ( not ( = ?auto_21730 ?auto_21739 ) ) ( not ( = ?auto_21730 ?auto_21744 ) ) ( not ( = ?auto_21733 ?auto_21754 ) ) ( not ( = ?auto_21733 ?auto_21751 ) ) ( not ( = ?auto_21733 ?auto_21755 ) ) ( not ( = ?auto_21733 ?auto_21741 ) ) ( not ( = ?auto_21733 ?auto_21759 ) ) ( not ( = ?auto_21733 ?auto_21747 ) ) ( not ( = ?auto_21733 ?auto_21753 ) ) ( not ( = ?auto_21733 ?auto_21739 ) ) ( not ( = ?auto_21733 ?auto_21744 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_21720 ?auto_21721 ?auto_21722 ?auto_21723 ?auto_21724 ?auto_21725 ?auto_21728 ?auto_21727 ?auto_21726 ?auto_21729 )
      ( MAKE-1CRATE ?auto_21729 ?auto_21730 )
      ( MAKE-10CRATE-VERIFY ?auto_21720 ?auto_21721 ?auto_21722 ?auto_21723 ?auto_21724 ?auto_21725 ?auto_21728 ?auto_21727 ?auto_21726 ?auto_21729 ?auto_21730 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21762 - SURFACE
      ?auto_21763 - SURFACE
    )
    :vars
    (
      ?auto_21764 - HOIST
      ?auto_21765 - PLACE
      ?auto_21767 - PLACE
      ?auto_21768 - HOIST
      ?auto_21769 - SURFACE
      ?auto_21766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21764 ?auto_21765 ) ( SURFACE-AT ?auto_21762 ?auto_21765 ) ( CLEAR ?auto_21762 ) ( IS-CRATE ?auto_21763 ) ( AVAILABLE ?auto_21764 ) ( not ( = ?auto_21767 ?auto_21765 ) ) ( HOIST-AT ?auto_21768 ?auto_21767 ) ( AVAILABLE ?auto_21768 ) ( SURFACE-AT ?auto_21763 ?auto_21767 ) ( ON ?auto_21763 ?auto_21769 ) ( CLEAR ?auto_21763 ) ( TRUCK-AT ?auto_21766 ?auto_21765 ) ( not ( = ?auto_21762 ?auto_21763 ) ) ( not ( = ?auto_21762 ?auto_21769 ) ) ( not ( = ?auto_21763 ?auto_21769 ) ) ( not ( = ?auto_21764 ?auto_21768 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21766 ?auto_21765 ?auto_21767 )
      ( !LIFT ?auto_21768 ?auto_21763 ?auto_21769 ?auto_21767 )
      ( !LOAD ?auto_21768 ?auto_21763 ?auto_21766 ?auto_21767 )
      ( !DRIVE ?auto_21766 ?auto_21767 ?auto_21765 )
      ( !UNLOAD ?auto_21764 ?auto_21763 ?auto_21766 ?auto_21765 )
      ( !DROP ?auto_21764 ?auto_21763 ?auto_21762 ?auto_21765 )
      ( MAKE-1CRATE-VERIFY ?auto_21762 ?auto_21763 ) )
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
      ?auto_21790 - SURFACE
      ?auto_21789 - SURFACE
      ?auto_21788 - SURFACE
      ?auto_21791 - SURFACE
      ?auto_21793 - SURFACE
      ?auto_21792 - SURFACE
    )
    :vars
    (
      ?auto_21795 - HOIST
      ?auto_21797 - PLACE
      ?auto_21796 - PLACE
      ?auto_21798 - HOIST
      ?auto_21794 - SURFACE
      ?auto_21821 - PLACE
      ?auto_21818 - HOIST
      ?auto_21800 - SURFACE
      ?auto_21813 - PLACE
      ?auto_21815 - HOIST
      ?auto_21807 - SURFACE
      ?auto_21806 - PLACE
      ?auto_21816 - HOIST
      ?auto_21802 - SURFACE
      ?auto_21819 - PLACE
      ?auto_21811 - HOIST
      ?auto_21817 - SURFACE
      ?auto_21803 - PLACE
      ?auto_21812 - HOIST
      ?auto_21808 - SURFACE
      ?auto_21801 - PLACE
      ?auto_21823 - HOIST
      ?auto_21810 - SURFACE
      ?auto_21820 - PLACE
      ?auto_21814 - HOIST
      ?auto_21822 - SURFACE
      ?auto_21804 - SURFACE
      ?auto_21805 - SURFACE
      ?auto_21809 - SURFACE
      ?auto_21799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21795 ?auto_21797 ) ( IS-CRATE ?auto_21792 ) ( not ( = ?auto_21796 ?auto_21797 ) ) ( HOIST-AT ?auto_21798 ?auto_21796 ) ( SURFACE-AT ?auto_21792 ?auto_21796 ) ( ON ?auto_21792 ?auto_21794 ) ( CLEAR ?auto_21792 ) ( not ( = ?auto_21793 ?auto_21792 ) ) ( not ( = ?auto_21793 ?auto_21794 ) ) ( not ( = ?auto_21792 ?auto_21794 ) ) ( not ( = ?auto_21795 ?auto_21798 ) ) ( IS-CRATE ?auto_21793 ) ( not ( = ?auto_21821 ?auto_21797 ) ) ( HOIST-AT ?auto_21818 ?auto_21821 ) ( SURFACE-AT ?auto_21793 ?auto_21821 ) ( ON ?auto_21793 ?auto_21800 ) ( CLEAR ?auto_21793 ) ( not ( = ?auto_21791 ?auto_21793 ) ) ( not ( = ?auto_21791 ?auto_21800 ) ) ( not ( = ?auto_21793 ?auto_21800 ) ) ( not ( = ?auto_21795 ?auto_21818 ) ) ( IS-CRATE ?auto_21791 ) ( not ( = ?auto_21813 ?auto_21797 ) ) ( HOIST-AT ?auto_21815 ?auto_21813 ) ( SURFACE-AT ?auto_21791 ?auto_21813 ) ( ON ?auto_21791 ?auto_21807 ) ( CLEAR ?auto_21791 ) ( not ( = ?auto_21788 ?auto_21791 ) ) ( not ( = ?auto_21788 ?auto_21807 ) ) ( not ( = ?auto_21791 ?auto_21807 ) ) ( not ( = ?auto_21795 ?auto_21815 ) ) ( IS-CRATE ?auto_21788 ) ( not ( = ?auto_21806 ?auto_21797 ) ) ( HOIST-AT ?auto_21816 ?auto_21806 ) ( AVAILABLE ?auto_21816 ) ( SURFACE-AT ?auto_21788 ?auto_21806 ) ( ON ?auto_21788 ?auto_21802 ) ( CLEAR ?auto_21788 ) ( not ( = ?auto_21789 ?auto_21788 ) ) ( not ( = ?auto_21789 ?auto_21802 ) ) ( not ( = ?auto_21788 ?auto_21802 ) ) ( not ( = ?auto_21795 ?auto_21816 ) ) ( IS-CRATE ?auto_21789 ) ( not ( = ?auto_21819 ?auto_21797 ) ) ( HOIST-AT ?auto_21811 ?auto_21819 ) ( AVAILABLE ?auto_21811 ) ( SURFACE-AT ?auto_21789 ?auto_21819 ) ( ON ?auto_21789 ?auto_21817 ) ( CLEAR ?auto_21789 ) ( not ( = ?auto_21790 ?auto_21789 ) ) ( not ( = ?auto_21790 ?auto_21817 ) ) ( not ( = ?auto_21789 ?auto_21817 ) ) ( not ( = ?auto_21795 ?auto_21811 ) ) ( IS-CRATE ?auto_21790 ) ( not ( = ?auto_21803 ?auto_21797 ) ) ( HOIST-AT ?auto_21812 ?auto_21803 ) ( AVAILABLE ?auto_21812 ) ( SURFACE-AT ?auto_21790 ?auto_21803 ) ( ON ?auto_21790 ?auto_21808 ) ( CLEAR ?auto_21790 ) ( not ( = ?auto_21787 ?auto_21790 ) ) ( not ( = ?auto_21787 ?auto_21808 ) ) ( not ( = ?auto_21790 ?auto_21808 ) ) ( not ( = ?auto_21795 ?auto_21812 ) ) ( IS-CRATE ?auto_21787 ) ( not ( = ?auto_21801 ?auto_21797 ) ) ( HOIST-AT ?auto_21823 ?auto_21801 ) ( AVAILABLE ?auto_21823 ) ( SURFACE-AT ?auto_21787 ?auto_21801 ) ( ON ?auto_21787 ?auto_21810 ) ( CLEAR ?auto_21787 ) ( not ( = ?auto_21786 ?auto_21787 ) ) ( not ( = ?auto_21786 ?auto_21810 ) ) ( not ( = ?auto_21787 ?auto_21810 ) ) ( not ( = ?auto_21795 ?auto_21823 ) ) ( IS-CRATE ?auto_21786 ) ( not ( = ?auto_21820 ?auto_21797 ) ) ( HOIST-AT ?auto_21814 ?auto_21820 ) ( AVAILABLE ?auto_21814 ) ( SURFACE-AT ?auto_21786 ?auto_21820 ) ( ON ?auto_21786 ?auto_21822 ) ( CLEAR ?auto_21786 ) ( not ( = ?auto_21785 ?auto_21786 ) ) ( not ( = ?auto_21785 ?auto_21822 ) ) ( not ( = ?auto_21786 ?auto_21822 ) ) ( not ( = ?auto_21795 ?auto_21814 ) ) ( IS-CRATE ?auto_21785 ) ( AVAILABLE ?auto_21818 ) ( SURFACE-AT ?auto_21785 ?auto_21821 ) ( ON ?auto_21785 ?auto_21804 ) ( CLEAR ?auto_21785 ) ( not ( = ?auto_21784 ?auto_21785 ) ) ( not ( = ?auto_21784 ?auto_21804 ) ) ( not ( = ?auto_21785 ?auto_21804 ) ) ( IS-CRATE ?auto_21784 ) ( AVAILABLE ?auto_21798 ) ( SURFACE-AT ?auto_21784 ?auto_21796 ) ( ON ?auto_21784 ?auto_21805 ) ( CLEAR ?auto_21784 ) ( not ( = ?auto_21783 ?auto_21784 ) ) ( not ( = ?auto_21783 ?auto_21805 ) ) ( not ( = ?auto_21784 ?auto_21805 ) ) ( SURFACE-AT ?auto_21782 ?auto_21797 ) ( CLEAR ?auto_21782 ) ( IS-CRATE ?auto_21783 ) ( AVAILABLE ?auto_21795 ) ( AVAILABLE ?auto_21815 ) ( SURFACE-AT ?auto_21783 ?auto_21813 ) ( ON ?auto_21783 ?auto_21809 ) ( CLEAR ?auto_21783 ) ( TRUCK-AT ?auto_21799 ?auto_21797 ) ( not ( = ?auto_21782 ?auto_21783 ) ) ( not ( = ?auto_21782 ?auto_21809 ) ) ( not ( = ?auto_21783 ?auto_21809 ) ) ( not ( = ?auto_21782 ?auto_21784 ) ) ( not ( = ?auto_21782 ?auto_21805 ) ) ( not ( = ?auto_21784 ?auto_21809 ) ) ( not ( = ?auto_21796 ?auto_21813 ) ) ( not ( = ?auto_21798 ?auto_21815 ) ) ( not ( = ?auto_21805 ?auto_21809 ) ) ( not ( = ?auto_21782 ?auto_21785 ) ) ( not ( = ?auto_21782 ?auto_21804 ) ) ( not ( = ?auto_21783 ?auto_21785 ) ) ( not ( = ?auto_21783 ?auto_21804 ) ) ( not ( = ?auto_21785 ?auto_21805 ) ) ( not ( = ?auto_21785 ?auto_21809 ) ) ( not ( = ?auto_21821 ?auto_21796 ) ) ( not ( = ?auto_21821 ?auto_21813 ) ) ( not ( = ?auto_21818 ?auto_21798 ) ) ( not ( = ?auto_21818 ?auto_21815 ) ) ( not ( = ?auto_21804 ?auto_21805 ) ) ( not ( = ?auto_21804 ?auto_21809 ) ) ( not ( = ?auto_21782 ?auto_21786 ) ) ( not ( = ?auto_21782 ?auto_21822 ) ) ( not ( = ?auto_21783 ?auto_21786 ) ) ( not ( = ?auto_21783 ?auto_21822 ) ) ( not ( = ?auto_21784 ?auto_21786 ) ) ( not ( = ?auto_21784 ?auto_21822 ) ) ( not ( = ?auto_21786 ?auto_21804 ) ) ( not ( = ?auto_21786 ?auto_21805 ) ) ( not ( = ?auto_21786 ?auto_21809 ) ) ( not ( = ?auto_21820 ?auto_21821 ) ) ( not ( = ?auto_21820 ?auto_21796 ) ) ( not ( = ?auto_21820 ?auto_21813 ) ) ( not ( = ?auto_21814 ?auto_21818 ) ) ( not ( = ?auto_21814 ?auto_21798 ) ) ( not ( = ?auto_21814 ?auto_21815 ) ) ( not ( = ?auto_21822 ?auto_21804 ) ) ( not ( = ?auto_21822 ?auto_21805 ) ) ( not ( = ?auto_21822 ?auto_21809 ) ) ( not ( = ?auto_21782 ?auto_21787 ) ) ( not ( = ?auto_21782 ?auto_21810 ) ) ( not ( = ?auto_21783 ?auto_21787 ) ) ( not ( = ?auto_21783 ?auto_21810 ) ) ( not ( = ?auto_21784 ?auto_21787 ) ) ( not ( = ?auto_21784 ?auto_21810 ) ) ( not ( = ?auto_21785 ?auto_21787 ) ) ( not ( = ?auto_21785 ?auto_21810 ) ) ( not ( = ?auto_21787 ?auto_21822 ) ) ( not ( = ?auto_21787 ?auto_21804 ) ) ( not ( = ?auto_21787 ?auto_21805 ) ) ( not ( = ?auto_21787 ?auto_21809 ) ) ( not ( = ?auto_21801 ?auto_21820 ) ) ( not ( = ?auto_21801 ?auto_21821 ) ) ( not ( = ?auto_21801 ?auto_21796 ) ) ( not ( = ?auto_21801 ?auto_21813 ) ) ( not ( = ?auto_21823 ?auto_21814 ) ) ( not ( = ?auto_21823 ?auto_21818 ) ) ( not ( = ?auto_21823 ?auto_21798 ) ) ( not ( = ?auto_21823 ?auto_21815 ) ) ( not ( = ?auto_21810 ?auto_21822 ) ) ( not ( = ?auto_21810 ?auto_21804 ) ) ( not ( = ?auto_21810 ?auto_21805 ) ) ( not ( = ?auto_21810 ?auto_21809 ) ) ( not ( = ?auto_21782 ?auto_21790 ) ) ( not ( = ?auto_21782 ?auto_21808 ) ) ( not ( = ?auto_21783 ?auto_21790 ) ) ( not ( = ?auto_21783 ?auto_21808 ) ) ( not ( = ?auto_21784 ?auto_21790 ) ) ( not ( = ?auto_21784 ?auto_21808 ) ) ( not ( = ?auto_21785 ?auto_21790 ) ) ( not ( = ?auto_21785 ?auto_21808 ) ) ( not ( = ?auto_21786 ?auto_21790 ) ) ( not ( = ?auto_21786 ?auto_21808 ) ) ( not ( = ?auto_21790 ?auto_21810 ) ) ( not ( = ?auto_21790 ?auto_21822 ) ) ( not ( = ?auto_21790 ?auto_21804 ) ) ( not ( = ?auto_21790 ?auto_21805 ) ) ( not ( = ?auto_21790 ?auto_21809 ) ) ( not ( = ?auto_21803 ?auto_21801 ) ) ( not ( = ?auto_21803 ?auto_21820 ) ) ( not ( = ?auto_21803 ?auto_21821 ) ) ( not ( = ?auto_21803 ?auto_21796 ) ) ( not ( = ?auto_21803 ?auto_21813 ) ) ( not ( = ?auto_21812 ?auto_21823 ) ) ( not ( = ?auto_21812 ?auto_21814 ) ) ( not ( = ?auto_21812 ?auto_21818 ) ) ( not ( = ?auto_21812 ?auto_21798 ) ) ( not ( = ?auto_21812 ?auto_21815 ) ) ( not ( = ?auto_21808 ?auto_21810 ) ) ( not ( = ?auto_21808 ?auto_21822 ) ) ( not ( = ?auto_21808 ?auto_21804 ) ) ( not ( = ?auto_21808 ?auto_21805 ) ) ( not ( = ?auto_21808 ?auto_21809 ) ) ( not ( = ?auto_21782 ?auto_21789 ) ) ( not ( = ?auto_21782 ?auto_21817 ) ) ( not ( = ?auto_21783 ?auto_21789 ) ) ( not ( = ?auto_21783 ?auto_21817 ) ) ( not ( = ?auto_21784 ?auto_21789 ) ) ( not ( = ?auto_21784 ?auto_21817 ) ) ( not ( = ?auto_21785 ?auto_21789 ) ) ( not ( = ?auto_21785 ?auto_21817 ) ) ( not ( = ?auto_21786 ?auto_21789 ) ) ( not ( = ?auto_21786 ?auto_21817 ) ) ( not ( = ?auto_21787 ?auto_21789 ) ) ( not ( = ?auto_21787 ?auto_21817 ) ) ( not ( = ?auto_21789 ?auto_21808 ) ) ( not ( = ?auto_21789 ?auto_21810 ) ) ( not ( = ?auto_21789 ?auto_21822 ) ) ( not ( = ?auto_21789 ?auto_21804 ) ) ( not ( = ?auto_21789 ?auto_21805 ) ) ( not ( = ?auto_21789 ?auto_21809 ) ) ( not ( = ?auto_21819 ?auto_21803 ) ) ( not ( = ?auto_21819 ?auto_21801 ) ) ( not ( = ?auto_21819 ?auto_21820 ) ) ( not ( = ?auto_21819 ?auto_21821 ) ) ( not ( = ?auto_21819 ?auto_21796 ) ) ( not ( = ?auto_21819 ?auto_21813 ) ) ( not ( = ?auto_21811 ?auto_21812 ) ) ( not ( = ?auto_21811 ?auto_21823 ) ) ( not ( = ?auto_21811 ?auto_21814 ) ) ( not ( = ?auto_21811 ?auto_21818 ) ) ( not ( = ?auto_21811 ?auto_21798 ) ) ( not ( = ?auto_21811 ?auto_21815 ) ) ( not ( = ?auto_21817 ?auto_21808 ) ) ( not ( = ?auto_21817 ?auto_21810 ) ) ( not ( = ?auto_21817 ?auto_21822 ) ) ( not ( = ?auto_21817 ?auto_21804 ) ) ( not ( = ?auto_21817 ?auto_21805 ) ) ( not ( = ?auto_21817 ?auto_21809 ) ) ( not ( = ?auto_21782 ?auto_21788 ) ) ( not ( = ?auto_21782 ?auto_21802 ) ) ( not ( = ?auto_21783 ?auto_21788 ) ) ( not ( = ?auto_21783 ?auto_21802 ) ) ( not ( = ?auto_21784 ?auto_21788 ) ) ( not ( = ?auto_21784 ?auto_21802 ) ) ( not ( = ?auto_21785 ?auto_21788 ) ) ( not ( = ?auto_21785 ?auto_21802 ) ) ( not ( = ?auto_21786 ?auto_21788 ) ) ( not ( = ?auto_21786 ?auto_21802 ) ) ( not ( = ?auto_21787 ?auto_21788 ) ) ( not ( = ?auto_21787 ?auto_21802 ) ) ( not ( = ?auto_21790 ?auto_21788 ) ) ( not ( = ?auto_21790 ?auto_21802 ) ) ( not ( = ?auto_21788 ?auto_21817 ) ) ( not ( = ?auto_21788 ?auto_21808 ) ) ( not ( = ?auto_21788 ?auto_21810 ) ) ( not ( = ?auto_21788 ?auto_21822 ) ) ( not ( = ?auto_21788 ?auto_21804 ) ) ( not ( = ?auto_21788 ?auto_21805 ) ) ( not ( = ?auto_21788 ?auto_21809 ) ) ( not ( = ?auto_21806 ?auto_21819 ) ) ( not ( = ?auto_21806 ?auto_21803 ) ) ( not ( = ?auto_21806 ?auto_21801 ) ) ( not ( = ?auto_21806 ?auto_21820 ) ) ( not ( = ?auto_21806 ?auto_21821 ) ) ( not ( = ?auto_21806 ?auto_21796 ) ) ( not ( = ?auto_21806 ?auto_21813 ) ) ( not ( = ?auto_21816 ?auto_21811 ) ) ( not ( = ?auto_21816 ?auto_21812 ) ) ( not ( = ?auto_21816 ?auto_21823 ) ) ( not ( = ?auto_21816 ?auto_21814 ) ) ( not ( = ?auto_21816 ?auto_21818 ) ) ( not ( = ?auto_21816 ?auto_21798 ) ) ( not ( = ?auto_21816 ?auto_21815 ) ) ( not ( = ?auto_21802 ?auto_21817 ) ) ( not ( = ?auto_21802 ?auto_21808 ) ) ( not ( = ?auto_21802 ?auto_21810 ) ) ( not ( = ?auto_21802 ?auto_21822 ) ) ( not ( = ?auto_21802 ?auto_21804 ) ) ( not ( = ?auto_21802 ?auto_21805 ) ) ( not ( = ?auto_21802 ?auto_21809 ) ) ( not ( = ?auto_21782 ?auto_21791 ) ) ( not ( = ?auto_21782 ?auto_21807 ) ) ( not ( = ?auto_21783 ?auto_21791 ) ) ( not ( = ?auto_21783 ?auto_21807 ) ) ( not ( = ?auto_21784 ?auto_21791 ) ) ( not ( = ?auto_21784 ?auto_21807 ) ) ( not ( = ?auto_21785 ?auto_21791 ) ) ( not ( = ?auto_21785 ?auto_21807 ) ) ( not ( = ?auto_21786 ?auto_21791 ) ) ( not ( = ?auto_21786 ?auto_21807 ) ) ( not ( = ?auto_21787 ?auto_21791 ) ) ( not ( = ?auto_21787 ?auto_21807 ) ) ( not ( = ?auto_21790 ?auto_21791 ) ) ( not ( = ?auto_21790 ?auto_21807 ) ) ( not ( = ?auto_21789 ?auto_21791 ) ) ( not ( = ?auto_21789 ?auto_21807 ) ) ( not ( = ?auto_21791 ?auto_21802 ) ) ( not ( = ?auto_21791 ?auto_21817 ) ) ( not ( = ?auto_21791 ?auto_21808 ) ) ( not ( = ?auto_21791 ?auto_21810 ) ) ( not ( = ?auto_21791 ?auto_21822 ) ) ( not ( = ?auto_21791 ?auto_21804 ) ) ( not ( = ?auto_21791 ?auto_21805 ) ) ( not ( = ?auto_21791 ?auto_21809 ) ) ( not ( = ?auto_21807 ?auto_21802 ) ) ( not ( = ?auto_21807 ?auto_21817 ) ) ( not ( = ?auto_21807 ?auto_21808 ) ) ( not ( = ?auto_21807 ?auto_21810 ) ) ( not ( = ?auto_21807 ?auto_21822 ) ) ( not ( = ?auto_21807 ?auto_21804 ) ) ( not ( = ?auto_21807 ?auto_21805 ) ) ( not ( = ?auto_21807 ?auto_21809 ) ) ( not ( = ?auto_21782 ?auto_21793 ) ) ( not ( = ?auto_21782 ?auto_21800 ) ) ( not ( = ?auto_21783 ?auto_21793 ) ) ( not ( = ?auto_21783 ?auto_21800 ) ) ( not ( = ?auto_21784 ?auto_21793 ) ) ( not ( = ?auto_21784 ?auto_21800 ) ) ( not ( = ?auto_21785 ?auto_21793 ) ) ( not ( = ?auto_21785 ?auto_21800 ) ) ( not ( = ?auto_21786 ?auto_21793 ) ) ( not ( = ?auto_21786 ?auto_21800 ) ) ( not ( = ?auto_21787 ?auto_21793 ) ) ( not ( = ?auto_21787 ?auto_21800 ) ) ( not ( = ?auto_21790 ?auto_21793 ) ) ( not ( = ?auto_21790 ?auto_21800 ) ) ( not ( = ?auto_21789 ?auto_21793 ) ) ( not ( = ?auto_21789 ?auto_21800 ) ) ( not ( = ?auto_21788 ?auto_21793 ) ) ( not ( = ?auto_21788 ?auto_21800 ) ) ( not ( = ?auto_21793 ?auto_21807 ) ) ( not ( = ?auto_21793 ?auto_21802 ) ) ( not ( = ?auto_21793 ?auto_21817 ) ) ( not ( = ?auto_21793 ?auto_21808 ) ) ( not ( = ?auto_21793 ?auto_21810 ) ) ( not ( = ?auto_21793 ?auto_21822 ) ) ( not ( = ?auto_21793 ?auto_21804 ) ) ( not ( = ?auto_21793 ?auto_21805 ) ) ( not ( = ?auto_21793 ?auto_21809 ) ) ( not ( = ?auto_21800 ?auto_21807 ) ) ( not ( = ?auto_21800 ?auto_21802 ) ) ( not ( = ?auto_21800 ?auto_21817 ) ) ( not ( = ?auto_21800 ?auto_21808 ) ) ( not ( = ?auto_21800 ?auto_21810 ) ) ( not ( = ?auto_21800 ?auto_21822 ) ) ( not ( = ?auto_21800 ?auto_21804 ) ) ( not ( = ?auto_21800 ?auto_21805 ) ) ( not ( = ?auto_21800 ?auto_21809 ) ) ( not ( = ?auto_21782 ?auto_21792 ) ) ( not ( = ?auto_21782 ?auto_21794 ) ) ( not ( = ?auto_21783 ?auto_21792 ) ) ( not ( = ?auto_21783 ?auto_21794 ) ) ( not ( = ?auto_21784 ?auto_21792 ) ) ( not ( = ?auto_21784 ?auto_21794 ) ) ( not ( = ?auto_21785 ?auto_21792 ) ) ( not ( = ?auto_21785 ?auto_21794 ) ) ( not ( = ?auto_21786 ?auto_21792 ) ) ( not ( = ?auto_21786 ?auto_21794 ) ) ( not ( = ?auto_21787 ?auto_21792 ) ) ( not ( = ?auto_21787 ?auto_21794 ) ) ( not ( = ?auto_21790 ?auto_21792 ) ) ( not ( = ?auto_21790 ?auto_21794 ) ) ( not ( = ?auto_21789 ?auto_21792 ) ) ( not ( = ?auto_21789 ?auto_21794 ) ) ( not ( = ?auto_21788 ?auto_21792 ) ) ( not ( = ?auto_21788 ?auto_21794 ) ) ( not ( = ?auto_21791 ?auto_21792 ) ) ( not ( = ?auto_21791 ?auto_21794 ) ) ( not ( = ?auto_21792 ?auto_21800 ) ) ( not ( = ?auto_21792 ?auto_21807 ) ) ( not ( = ?auto_21792 ?auto_21802 ) ) ( not ( = ?auto_21792 ?auto_21817 ) ) ( not ( = ?auto_21792 ?auto_21808 ) ) ( not ( = ?auto_21792 ?auto_21810 ) ) ( not ( = ?auto_21792 ?auto_21822 ) ) ( not ( = ?auto_21792 ?auto_21804 ) ) ( not ( = ?auto_21792 ?auto_21805 ) ) ( not ( = ?auto_21792 ?auto_21809 ) ) ( not ( = ?auto_21794 ?auto_21800 ) ) ( not ( = ?auto_21794 ?auto_21807 ) ) ( not ( = ?auto_21794 ?auto_21802 ) ) ( not ( = ?auto_21794 ?auto_21817 ) ) ( not ( = ?auto_21794 ?auto_21808 ) ) ( not ( = ?auto_21794 ?auto_21810 ) ) ( not ( = ?auto_21794 ?auto_21822 ) ) ( not ( = ?auto_21794 ?auto_21804 ) ) ( not ( = ?auto_21794 ?auto_21805 ) ) ( not ( = ?auto_21794 ?auto_21809 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_21782 ?auto_21783 ?auto_21784 ?auto_21785 ?auto_21786 ?auto_21787 ?auto_21790 ?auto_21789 ?auto_21788 ?auto_21791 ?auto_21793 )
      ( MAKE-1CRATE ?auto_21793 ?auto_21792 )
      ( MAKE-11CRATE-VERIFY ?auto_21782 ?auto_21783 ?auto_21784 ?auto_21785 ?auto_21786 ?auto_21787 ?auto_21790 ?auto_21789 ?auto_21788 ?auto_21791 ?auto_21793 ?auto_21792 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21826 - SURFACE
      ?auto_21827 - SURFACE
    )
    :vars
    (
      ?auto_21828 - HOIST
      ?auto_21829 - PLACE
      ?auto_21831 - PLACE
      ?auto_21832 - HOIST
      ?auto_21833 - SURFACE
      ?auto_21830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21828 ?auto_21829 ) ( SURFACE-AT ?auto_21826 ?auto_21829 ) ( CLEAR ?auto_21826 ) ( IS-CRATE ?auto_21827 ) ( AVAILABLE ?auto_21828 ) ( not ( = ?auto_21831 ?auto_21829 ) ) ( HOIST-AT ?auto_21832 ?auto_21831 ) ( AVAILABLE ?auto_21832 ) ( SURFACE-AT ?auto_21827 ?auto_21831 ) ( ON ?auto_21827 ?auto_21833 ) ( CLEAR ?auto_21827 ) ( TRUCK-AT ?auto_21830 ?auto_21829 ) ( not ( = ?auto_21826 ?auto_21827 ) ) ( not ( = ?auto_21826 ?auto_21833 ) ) ( not ( = ?auto_21827 ?auto_21833 ) ) ( not ( = ?auto_21828 ?auto_21832 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21830 ?auto_21829 ?auto_21831 )
      ( !LIFT ?auto_21832 ?auto_21827 ?auto_21833 ?auto_21831 )
      ( !LOAD ?auto_21832 ?auto_21827 ?auto_21830 ?auto_21831 )
      ( !DRIVE ?auto_21830 ?auto_21831 ?auto_21829 )
      ( !UNLOAD ?auto_21828 ?auto_21827 ?auto_21830 ?auto_21829 )
      ( !DROP ?auto_21828 ?auto_21827 ?auto_21826 ?auto_21829 )
      ( MAKE-1CRATE-VERIFY ?auto_21826 ?auto_21827 ) )
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
      ?auto_21855 - SURFACE
      ?auto_21854 - SURFACE
      ?auto_21853 - SURFACE
      ?auto_21856 - SURFACE
      ?auto_21858 - SURFACE
      ?auto_21857 - SURFACE
      ?auto_21859 - SURFACE
    )
    :vars
    (
      ?auto_21861 - HOIST
      ?auto_21865 - PLACE
      ?auto_21863 - PLACE
      ?auto_21864 - HOIST
      ?auto_21862 - SURFACE
      ?auto_21889 - PLACE
      ?auto_21883 - HOIST
      ?auto_21878 - SURFACE
      ?auto_21884 - PLACE
      ?auto_21881 - HOIST
      ?auto_21886 - SURFACE
      ?auto_21871 - PLACE
      ?auto_21882 - HOIST
      ?auto_21873 - SURFACE
      ?auto_21867 - PLACE
      ?auto_21866 - HOIST
      ?auto_21877 - SURFACE
      ?auto_21888 - PLACE
      ?auto_21876 - HOIST
      ?auto_21875 - SURFACE
      ?auto_21885 - PLACE
      ?auto_21872 - HOIST
      ?auto_21887 - SURFACE
      ?auto_21890 - SURFACE
      ?auto_21880 - PLACE
      ?auto_21874 - HOIST
      ?auto_21869 - SURFACE
      ?auto_21870 - SURFACE
      ?auto_21868 - SURFACE
      ?auto_21879 - SURFACE
      ?auto_21860 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21861 ?auto_21865 ) ( IS-CRATE ?auto_21859 ) ( not ( = ?auto_21863 ?auto_21865 ) ) ( HOIST-AT ?auto_21864 ?auto_21863 ) ( SURFACE-AT ?auto_21859 ?auto_21863 ) ( ON ?auto_21859 ?auto_21862 ) ( CLEAR ?auto_21859 ) ( not ( = ?auto_21857 ?auto_21859 ) ) ( not ( = ?auto_21857 ?auto_21862 ) ) ( not ( = ?auto_21859 ?auto_21862 ) ) ( not ( = ?auto_21861 ?auto_21864 ) ) ( IS-CRATE ?auto_21857 ) ( not ( = ?auto_21889 ?auto_21865 ) ) ( HOIST-AT ?auto_21883 ?auto_21889 ) ( SURFACE-AT ?auto_21857 ?auto_21889 ) ( ON ?auto_21857 ?auto_21878 ) ( CLEAR ?auto_21857 ) ( not ( = ?auto_21858 ?auto_21857 ) ) ( not ( = ?auto_21858 ?auto_21878 ) ) ( not ( = ?auto_21857 ?auto_21878 ) ) ( not ( = ?auto_21861 ?auto_21883 ) ) ( IS-CRATE ?auto_21858 ) ( not ( = ?auto_21884 ?auto_21865 ) ) ( HOIST-AT ?auto_21881 ?auto_21884 ) ( SURFACE-AT ?auto_21858 ?auto_21884 ) ( ON ?auto_21858 ?auto_21886 ) ( CLEAR ?auto_21858 ) ( not ( = ?auto_21856 ?auto_21858 ) ) ( not ( = ?auto_21856 ?auto_21886 ) ) ( not ( = ?auto_21858 ?auto_21886 ) ) ( not ( = ?auto_21861 ?auto_21881 ) ) ( IS-CRATE ?auto_21856 ) ( not ( = ?auto_21871 ?auto_21865 ) ) ( HOIST-AT ?auto_21882 ?auto_21871 ) ( SURFACE-AT ?auto_21856 ?auto_21871 ) ( ON ?auto_21856 ?auto_21873 ) ( CLEAR ?auto_21856 ) ( not ( = ?auto_21853 ?auto_21856 ) ) ( not ( = ?auto_21853 ?auto_21873 ) ) ( not ( = ?auto_21856 ?auto_21873 ) ) ( not ( = ?auto_21861 ?auto_21882 ) ) ( IS-CRATE ?auto_21853 ) ( not ( = ?auto_21867 ?auto_21865 ) ) ( HOIST-AT ?auto_21866 ?auto_21867 ) ( AVAILABLE ?auto_21866 ) ( SURFACE-AT ?auto_21853 ?auto_21867 ) ( ON ?auto_21853 ?auto_21877 ) ( CLEAR ?auto_21853 ) ( not ( = ?auto_21854 ?auto_21853 ) ) ( not ( = ?auto_21854 ?auto_21877 ) ) ( not ( = ?auto_21853 ?auto_21877 ) ) ( not ( = ?auto_21861 ?auto_21866 ) ) ( IS-CRATE ?auto_21854 ) ( not ( = ?auto_21888 ?auto_21865 ) ) ( HOIST-AT ?auto_21876 ?auto_21888 ) ( AVAILABLE ?auto_21876 ) ( SURFACE-AT ?auto_21854 ?auto_21888 ) ( ON ?auto_21854 ?auto_21875 ) ( CLEAR ?auto_21854 ) ( not ( = ?auto_21855 ?auto_21854 ) ) ( not ( = ?auto_21855 ?auto_21875 ) ) ( not ( = ?auto_21854 ?auto_21875 ) ) ( not ( = ?auto_21861 ?auto_21876 ) ) ( IS-CRATE ?auto_21855 ) ( not ( = ?auto_21885 ?auto_21865 ) ) ( HOIST-AT ?auto_21872 ?auto_21885 ) ( AVAILABLE ?auto_21872 ) ( SURFACE-AT ?auto_21855 ?auto_21885 ) ( ON ?auto_21855 ?auto_21887 ) ( CLEAR ?auto_21855 ) ( not ( = ?auto_21852 ?auto_21855 ) ) ( not ( = ?auto_21852 ?auto_21887 ) ) ( not ( = ?auto_21855 ?auto_21887 ) ) ( not ( = ?auto_21861 ?auto_21872 ) ) ( IS-CRATE ?auto_21852 ) ( AVAILABLE ?auto_21864 ) ( SURFACE-AT ?auto_21852 ?auto_21863 ) ( ON ?auto_21852 ?auto_21890 ) ( CLEAR ?auto_21852 ) ( not ( = ?auto_21851 ?auto_21852 ) ) ( not ( = ?auto_21851 ?auto_21890 ) ) ( not ( = ?auto_21852 ?auto_21890 ) ) ( IS-CRATE ?auto_21851 ) ( not ( = ?auto_21880 ?auto_21865 ) ) ( HOIST-AT ?auto_21874 ?auto_21880 ) ( AVAILABLE ?auto_21874 ) ( SURFACE-AT ?auto_21851 ?auto_21880 ) ( ON ?auto_21851 ?auto_21869 ) ( CLEAR ?auto_21851 ) ( not ( = ?auto_21850 ?auto_21851 ) ) ( not ( = ?auto_21850 ?auto_21869 ) ) ( not ( = ?auto_21851 ?auto_21869 ) ) ( not ( = ?auto_21861 ?auto_21874 ) ) ( IS-CRATE ?auto_21850 ) ( AVAILABLE ?auto_21881 ) ( SURFACE-AT ?auto_21850 ?auto_21884 ) ( ON ?auto_21850 ?auto_21870 ) ( CLEAR ?auto_21850 ) ( not ( = ?auto_21849 ?auto_21850 ) ) ( not ( = ?auto_21849 ?auto_21870 ) ) ( not ( = ?auto_21850 ?auto_21870 ) ) ( IS-CRATE ?auto_21849 ) ( AVAILABLE ?auto_21883 ) ( SURFACE-AT ?auto_21849 ?auto_21889 ) ( ON ?auto_21849 ?auto_21868 ) ( CLEAR ?auto_21849 ) ( not ( = ?auto_21848 ?auto_21849 ) ) ( not ( = ?auto_21848 ?auto_21868 ) ) ( not ( = ?auto_21849 ?auto_21868 ) ) ( SURFACE-AT ?auto_21847 ?auto_21865 ) ( CLEAR ?auto_21847 ) ( IS-CRATE ?auto_21848 ) ( AVAILABLE ?auto_21861 ) ( AVAILABLE ?auto_21882 ) ( SURFACE-AT ?auto_21848 ?auto_21871 ) ( ON ?auto_21848 ?auto_21879 ) ( CLEAR ?auto_21848 ) ( TRUCK-AT ?auto_21860 ?auto_21865 ) ( not ( = ?auto_21847 ?auto_21848 ) ) ( not ( = ?auto_21847 ?auto_21879 ) ) ( not ( = ?auto_21848 ?auto_21879 ) ) ( not ( = ?auto_21847 ?auto_21849 ) ) ( not ( = ?auto_21847 ?auto_21868 ) ) ( not ( = ?auto_21849 ?auto_21879 ) ) ( not ( = ?auto_21889 ?auto_21871 ) ) ( not ( = ?auto_21883 ?auto_21882 ) ) ( not ( = ?auto_21868 ?auto_21879 ) ) ( not ( = ?auto_21847 ?auto_21850 ) ) ( not ( = ?auto_21847 ?auto_21870 ) ) ( not ( = ?auto_21848 ?auto_21850 ) ) ( not ( = ?auto_21848 ?auto_21870 ) ) ( not ( = ?auto_21850 ?auto_21868 ) ) ( not ( = ?auto_21850 ?auto_21879 ) ) ( not ( = ?auto_21884 ?auto_21889 ) ) ( not ( = ?auto_21884 ?auto_21871 ) ) ( not ( = ?auto_21881 ?auto_21883 ) ) ( not ( = ?auto_21881 ?auto_21882 ) ) ( not ( = ?auto_21870 ?auto_21868 ) ) ( not ( = ?auto_21870 ?auto_21879 ) ) ( not ( = ?auto_21847 ?auto_21851 ) ) ( not ( = ?auto_21847 ?auto_21869 ) ) ( not ( = ?auto_21848 ?auto_21851 ) ) ( not ( = ?auto_21848 ?auto_21869 ) ) ( not ( = ?auto_21849 ?auto_21851 ) ) ( not ( = ?auto_21849 ?auto_21869 ) ) ( not ( = ?auto_21851 ?auto_21870 ) ) ( not ( = ?auto_21851 ?auto_21868 ) ) ( not ( = ?auto_21851 ?auto_21879 ) ) ( not ( = ?auto_21880 ?auto_21884 ) ) ( not ( = ?auto_21880 ?auto_21889 ) ) ( not ( = ?auto_21880 ?auto_21871 ) ) ( not ( = ?auto_21874 ?auto_21881 ) ) ( not ( = ?auto_21874 ?auto_21883 ) ) ( not ( = ?auto_21874 ?auto_21882 ) ) ( not ( = ?auto_21869 ?auto_21870 ) ) ( not ( = ?auto_21869 ?auto_21868 ) ) ( not ( = ?auto_21869 ?auto_21879 ) ) ( not ( = ?auto_21847 ?auto_21852 ) ) ( not ( = ?auto_21847 ?auto_21890 ) ) ( not ( = ?auto_21848 ?auto_21852 ) ) ( not ( = ?auto_21848 ?auto_21890 ) ) ( not ( = ?auto_21849 ?auto_21852 ) ) ( not ( = ?auto_21849 ?auto_21890 ) ) ( not ( = ?auto_21850 ?auto_21852 ) ) ( not ( = ?auto_21850 ?auto_21890 ) ) ( not ( = ?auto_21852 ?auto_21869 ) ) ( not ( = ?auto_21852 ?auto_21870 ) ) ( not ( = ?auto_21852 ?auto_21868 ) ) ( not ( = ?auto_21852 ?auto_21879 ) ) ( not ( = ?auto_21863 ?auto_21880 ) ) ( not ( = ?auto_21863 ?auto_21884 ) ) ( not ( = ?auto_21863 ?auto_21889 ) ) ( not ( = ?auto_21863 ?auto_21871 ) ) ( not ( = ?auto_21864 ?auto_21874 ) ) ( not ( = ?auto_21864 ?auto_21881 ) ) ( not ( = ?auto_21864 ?auto_21883 ) ) ( not ( = ?auto_21864 ?auto_21882 ) ) ( not ( = ?auto_21890 ?auto_21869 ) ) ( not ( = ?auto_21890 ?auto_21870 ) ) ( not ( = ?auto_21890 ?auto_21868 ) ) ( not ( = ?auto_21890 ?auto_21879 ) ) ( not ( = ?auto_21847 ?auto_21855 ) ) ( not ( = ?auto_21847 ?auto_21887 ) ) ( not ( = ?auto_21848 ?auto_21855 ) ) ( not ( = ?auto_21848 ?auto_21887 ) ) ( not ( = ?auto_21849 ?auto_21855 ) ) ( not ( = ?auto_21849 ?auto_21887 ) ) ( not ( = ?auto_21850 ?auto_21855 ) ) ( not ( = ?auto_21850 ?auto_21887 ) ) ( not ( = ?auto_21851 ?auto_21855 ) ) ( not ( = ?auto_21851 ?auto_21887 ) ) ( not ( = ?auto_21855 ?auto_21890 ) ) ( not ( = ?auto_21855 ?auto_21869 ) ) ( not ( = ?auto_21855 ?auto_21870 ) ) ( not ( = ?auto_21855 ?auto_21868 ) ) ( not ( = ?auto_21855 ?auto_21879 ) ) ( not ( = ?auto_21885 ?auto_21863 ) ) ( not ( = ?auto_21885 ?auto_21880 ) ) ( not ( = ?auto_21885 ?auto_21884 ) ) ( not ( = ?auto_21885 ?auto_21889 ) ) ( not ( = ?auto_21885 ?auto_21871 ) ) ( not ( = ?auto_21872 ?auto_21864 ) ) ( not ( = ?auto_21872 ?auto_21874 ) ) ( not ( = ?auto_21872 ?auto_21881 ) ) ( not ( = ?auto_21872 ?auto_21883 ) ) ( not ( = ?auto_21872 ?auto_21882 ) ) ( not ( = ?auto_21887 ?auto_21890 ) ) ( not ( = ?auto_21887 ?auto_21869 ) ) ( not ( = ?auto_21887 ?auto_21870 ) ) ( not ( = ?auto_21887 ?auto_21868 ) ) ( not ( = ?auto_21887 ?auto_21879 ) ) ( not ( = ?auto_21847 ?auto_21854 ) ) ( not ( = ?auto_21847 ?auto_21875 ) ) ( not ( = ?auto_21848 ?auto_21854 ) ) ( not ( = ?auto_21848 ?auto_21875 ) ) ( not ( = ?auto_21849 ?auto_21854 ) ) ( not ( = ?auto_21849 ?auto_21875 ) ) ( not ( = ?auto_21850 ?auto_21854 ) ) ( not ( = ?auto_21850 ?auto_21875 ) ) ( not ( = ?auto_21851 ?auto_21854 ) ) ( not ( = ?auto_21851 ?auto_21875 ) ) ( not ( = ?auto_21852 ?auto_21854 ) ) ( not ( = ?auto_21852 ?auto_21875 ) ) ( not ( = ?auto_21854 ?auto_21887 ) ) ( not ( = ?auto_21854 ?auto_21890 ) ) ( not ( = ?auto_21854 ?auto_21869 ) ) ( not ( = ?auto_21854 ?auto_21870 ) ) ( not ( = ?auto_21854 ?auto_21868 ) ) ( not ( = ?auto_21854 ?auto_21879 ) ) ( not ( = ?auto_21888 ?auto_21885 ) ) ( not ( = ?auto_21888 ?auto_21863 ) ) ( not ( = ?auto_21888 ?auto_21880 ) ) ( not ( = ?auto_21888 ?auto_21884 ) ) ( not ( = ?auto_21888 ?auto_21889 ) ) ( not ( = ?auto_21888 ?auto_21871 ) ) ( not ( = ?auto_21876 ?auto_21872 ) ) ( not ( = ?auto_21876 ?auto_21864 ) ) ( not ( = ?auto_21876 ?auto_21874 ) ) ( not ( = ?auto_21876 ?auto_21881 ) ) ( not ( = ?auto_21876 ?auto_21883 ) ) ( not ( = ?auto_21876 ?auto_21882 ) ) ( not ( = ?auto_21875 ?auto_21887 ) ) ( not ( = ?auto_21875 ?auto_21890 ) ) ( not ( = ?auto_21875 ?auto_21869 ) ) ( not ( = ?auto_21875 ?auto_21870 ) ) ( not ( = ?auto_21875 ?auto_21868 ) ) ( not ( = ?auto_21875 ?auto_21879 ) ) ( not ( = ?auto_21847 ?auto_21853 ) ) ( not ( = ?auto_21847 ?auto_21877 ) ) ( not ( = ?auto_21848 ?auto_21853 ) ) ( not ( = ?auto_21848 ?auto_21877 ) ) ( not ( = ?auto_21849 ?auto_21853 ) ) ( not ( = ?auto_21849 ?auto_21877 ) ) ( not ( = ?auto_21850 ?auto_21853 ) ) ( not ( = ?auto_21850 ?auto_21877 ) ) ( not ( = ?auto_21851 ?auto_21853 ) ) ( not ( = ?auto_21851 ?auto_21877 ) ) ( not ( = ?auto_21852 ?auto_21853 ) ) ( not ( = ?auto_21852 ?auto_21877 ) ) ( not ( = ?auto_21855 ?auto_21853 ) ) ( not ( = ?auto_21855 ?auto_21877 ) ) ( not ( = ?auto_21853 ?auto_21875 ) ) ( not ( = ?auto_21853 ?auto_21887 ) ) ( not ( = ?auto_21853 ?auto_21890 ) ) ( not ( = ?auto_21853 ?auto_21869 ) ) ( not ( = ?auto_21853 ?auto_21870 ) ) ( not ( = ?auto_21853 ?auto_21868 ) ) ( not ( = ?auto_21853 ?auto_21879 ) ) ( not ( = ?auto_21867 ?auto_21888 ) ) ( not ( = ?auto_21867 ?auto_21885 ) ) ( not ( = ?auto_21867 ?auto_21863 ) ) ( not ( = ?auto_21867 ?auto_21880 ) ) ( not ( = ?auto_21867 ?auto_21884 ) ) ( not ( = ?auto_21867 ?auto_21889 ) ) ( not ( = ?auto_21867 ?auto_21871 ) ) ( not ( = ?auto_21866 ?auto_21876 ) ) ( not ( = ?auto_21866 ?auto_21872 ) ) ( not ( = ?auto_21866 ?auto_21864 ) ) ( not ( = ?auto_21866 ?auto_21874 ) ) ( not ( = ?auto_21866 ?auto_21881 ) ) ( not ( = ?auto_21866 ?auto_21883 ) ) ( not ( = ?auto_21866 ?auto_21882 ) ) ( not ( = ?auto_21877 ?auto_21875 ) ) ( not ( = ?auto_21877 ?auto_21887 ) ) ( not ( = ?auto_21877 ?auto_21890 ) ) ( not ( = ?auto_21877 ?auto_21869 ) ) ( not ( = ?auto_21877 ?auto_21870 ) ) ( not ( = ?auto_21877 ?auto_21868 ) ) ( not ( = ?auto_21877 ?auto_21879 ) ) ( not ( = ?auto_21847 ?auto_21856 ) ) ( not ( = ?auto_21847 ?auto_21873 ) ) ( not ( = ?auto_21848 ?auto_21856 ) ) ( not ( = ?auto_21848 ?auto_21873 ) ) ( not ( = ?auto_21849 ?auto_21856 ) ) ( not ( = ?auto_21849 ?auto_21873 ) ) ( not ( = ?auto_21850 ?auto_21856 ) ) ( not ( = ?auto_21850 ?auto_21873 ) ) ( not ( = ?auto_21851 ?auto_21856 ) ) ( not ( = ?auto_21851 ?auto_21873 ) ) ( not ( = ?auto_21852 ?auto_21856 ) ) ( not ( = ?auto_21852 ?auto_21873 ) ) ( not ( = ?auto_21855 ?auto_21856 ) ) ( not ( = ?auto_21855 ?auto_21873 ) ) ( not ( = ?auto_21854 ?auto_21856 ) ) ( not ( = ?auto_21854 ?auto_21873 ) ) ( not ( = ?auto_21856 ?auto_21877 ) ) ( not ( = ?auto_21856 ?auto_21875 ) ) ( not ( = ?auto_21856 ?auto_21887 ) ) ( not ( = ?auto_21856 ?auto_21890 ) ) ( not ( = ?auto_21856 ?auto_21869 ) ) ( not ( = ?auto_21856 ?auto_21870 ) ) ( not ( = ?auto_21856 ?auto_21868 ) ) ( not ( = ?auto_21856 ?auto_21879 ) ) ( not ( = ?auto_21873 ?auto_21877 ) ) ( not ( = ?auto_21873 ?auto_21875 ) ) ( not ( = ?auto_21873 ?auto_21887 ) ) ( not ( = ?auto_21873 ?auto_21890 ) ) ( not ( = ?auto_21873 ?auto_21869 ) ) ( not ( = ?auto_21873 ?auto_21870 ) ) ( not ( = ?auto_21873 ?auto_21868 ) ) ( not ( = ?auto_21873 ?auto_21879 ) ) ( not ( = ?auto_21847 ?auto_21858 ) ) ( not ( = ?auto_21847 ?auto_21886 ) ) ( not ( = ?auto_21848 ?auto_21858 ) ) ( not ( = ?auto_21848 ?auto_21886 ) ) ( not ( = ?auto_21849 ?auto_21858 ) ) ( not ( = ?auto_21849 ?auto_21886 ) ) ( not ( = ?auto_21850 ?auto_21858 ) ) ( not ( = ?auto_21850 ?auto_21886 ) ) ( not ( = ?auto_21851 ?auto_21858 ) ) ( not ( = ?auto_21851 ?auto_21886 ) ) ( not ( = ?auto_21852 ?auto_21858 ) ) ( not ( = ?auto_21852 ?auto_21886 ) ) ( not ( = ?auto_21855 ?auto_21858 ) ) ( not ( = ?auto_21855 ?auto_21886 ) ) ( not ( = ?auto_21854 ?auto_21858 ) ) ( not ( = ?auto_21854 ?auto_21886 ) ) ( not ( = ?auto_21853 ?auto_21858 ) ) ( not ( = ?auto_21853 ?auto_21886 ) ) ( not ( = ?auto_21858 ?auto_21873 ) ) ( not ( = ?auto_21858 ?auto_21877 ) ) ( not ( = ?auto_21858 ?auto_21875 ) ) ( not ( = ?auto_21858 ?auto_21887 ) ) ( not ( = ?auto_21858 ?auto_21890 ) ) ( not ( = ?auto_21858 ?auto_21869 ) ) ( not ( = ?auto_21858 ?auto_21870 ) ) ( not ( = ?auto_21858 ?auto_21868 ) ) ( not ( = ?auto_21858 ?auto_21879 ) ) ( not ( = ?auto_21886 ?auto_21873 ) ) ( not ( = ?auto_21886 ?auto_21877 ) ) ( not ( = ?auto_21886 ?auto_21875 ) ) ( not ( = ?auto_21886 ?auto_21887 ) ) ( not ( = ?auto_21886 ?auto_21890 ) ) ( not ( = ?auto_21886 ?auto_21869 ) ) ( not ( = ?auto_21886 ?auto_21870 ) ) ( not ( = ?auto_21886 ?auto_21868 ) ) ( not ( = ?auto_21886 ?auto_21879 ) ) ( not ( = ?auto_21847 ?auto_21857 ) ) ( not ( = ?auto_21847 ?auto_21878 ) ) ( not ( = ?auto_21848 ?auto_21857 ) ) ( not ( = ?auto_21848 ?auto_21878 ) ) ( not ( = ?auto_21849 ?auto_21857 ) ) ( not ( = ?auto_21849 ?auto_21878 ) ) ( not ( = ?auto_21850 ?auto_21857 ) ) ( not ( = ?auto_21850 ?auto_21878 ) ) ( not ( = ?auto_21851 ?auto_21857 ) ) ( not ( = ?auto_21851 ?auto_21878 ) ) ( not ( = ?auto_21852 ?auto_21857 ) ) ( not ( = ?auto_21852 ?auto_21878 ) ) ( not ( = ?auto_21855 ?auto_21857 ) ) ( not ( = ?auto_21855 ?auto_21878 ) ) ( not ( = ?auto_21854 ?auto_21857 ) ) ( not ( = ?auto_21854 ?auto_21878 ) ) ( not ( = ?auto_21853 ?auto_21857 ) ) ( not ( = ?auto_21853 ?auto_21878 ) ) ( not ( = ?auto_21856 ?auto_21857 ) ) ( not ( = ?auto_21856 ?auto_21878 ) ) ( not ( = ?auto_21857 ?auto_21886 ) ) ( not ( = ?auto_21857 ?auto_21873 ) ) ( not ( = ?auto_21857 ?auto_21877 ) ) ( not ( = ?auto_21857 ?auto_21875 ) ) ( not ( = ?auto_21857 ?auto_21887 ) ) ( not ( = ?auto_21857 ?auto_21890 ) ) ( not ( = ?auto_21857 ?auto_21869 ) ) ( not ( = ?auto_21857 ?auto_21870 ) ) ( not ( = ?auto_21857 ?auto_21868 ) ) ( not ( = ?auto_21857 ?auto_21879 ) ) ( not ( = ?auto_21878 ?auto_21886 ) ) ( not ( = ?auto_21878 ?auto_21873 ) ) ( not ( = ?auto_21878 ?auto_21877 ) ) ( not ( = ?auto_21878 ?auto_21875 ) ) ( not ( = ?auto_21878 ?auto_21887 ) ) ( not ( = ?auto_21878 ?auto_21890 ) ) ( not ( = ?auto_21878 ?auto_21869 ) ) ( not ( = ?auto_21878 ?auto_21870 ) ) ( not ( = ?auto_21878 ?auto_21868 ) ) ( not ( = ?auto_21878 ?auto_21879 ) ) ( not ( = ?auto_21847 ?auto_21859 ) ) ( not ( = ?auto_21847 ?auto_21862 ) ) ( not ( = ?auto_21848 ?auto_21859 ) ) ( not ( = ?auto_21848 ?auto_21862 ) ) ( not ( = ?auto_21849 ?auto_21859 ) ) ( not ( = ?auto_21849 ?auto_21862 ) ) ( not ( = ?auto_21850 ?auto_21859 ) ) ( not ( = ?auto_21850 ?auto_21862 ) ) ( not ( = ?auto_21851 ?auto_21859 ) ) ( not ( = ?auto_21851 ?auto_21862 ) ) ( not ( = ?auto_21852 ?auto_21859 ) ) ( not ( = ?auto_21852 ?auto_21862 ) ) ( not ( = ?auto_21855 ?auto_21859 ) ) ( not ( = ?auto_21855 ?auto_21862 ) ) ( not ( = ?auto_21854 ?auto_21859 ) ) ( not ( = ?auto_21854 ?auto_21862 ) ) ( not ( = ?auto_21853 ?auto_21859 ) ) ( not ( = ?auto_21853 ?auto_21862 ) ) ( not ( = ?auto_21856 ?auto_21859 ) ) ( not ( = ?auto_21856 ?auto_21862 ) ) ( not ( = ?auto_21858 ?auto_21859 ) ) ( not ( = ?auto_21858 ?auto_21862 ) ) ( not ( = ?auto_21859 ?auto_21878 ) ) ( not ( = ?auto_21859 ?auto_21886 ) ) ( not ( = ?auto_21859 ?auto_21873 ) ) ( not ( = ?auto_21859 ?auto_21877 ) ) ( not ( = ?auto_21859 ?auto_21875 ) ) ( not ( = ?auto_21859 ?auto_21887 ) ) ( not ( = ?auto_21859 ?auto_21890 ) ) ( not ( = ?auto_21859 ?auto_21869 ) ) ( not ( = ?auto_21859 ?auto_21870 ) ) ( not ( = ?auto_21859 ?auto_21868 ) ) ( not ( = ?auto_21859 ?auto_21879 ) ) ( not ( = ?auto_21862 ?auto_21878 ) ) ( not ( = ?auto_21862 ?auto_21886 ) ) ( not ( = ?auto_21862 ?auto_21873 ) ) ( not ( = ?auto_21862 ?auto_21877 ) ) ( not ( = ?auto_21862 ?auto_21875 ) ) ( not ( = ?auto_21862 ?auto_21887 ) ) ( not ( = ?auto_21862 ?auto_21890 ) ) ( not ( = ?auto_21862 ?auto_21869 ) ) ( not ( = ?auto_21862 ?auto_21870 ) ) ( not ( = ?auto_21862 ?auto_21868 ) ) ( not ( = ?auto_21862 ?auto_21879 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_21847 ?auto_21848 ?auto_21849 ?auto_21850 ?auto_21851 ?auto_21852 ?auto_21855 ?auto_21854 ?auto_21853 ?auto_21856 ?auto_21858 ?auto_21857 )
      ( MAKE-1CRATE ?auto_21857 ?auto_21859 )
      ( MAKE-12CRATE-VERIFY ?auto_21847 ?auto_21848 ?auto_21849 ?auto_21850 ?auto_21851 ?auto_21852 ?auto_21855 ?auto_21854 ?auto_21853 ?auto_21856 ?auto_21858 ?auto_21857 ?auto_21859 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21893 - SURFACE
      ?auto_21894 - SURFACE
    )
    :vars
    (
      ?auto_21895 - HOIST
      ?auto_21896 - PLACE
      ?auto_21898 - PLACE
      ?auto_21899 - HOIST
      ?auto_21900 - SURFACE
      ?auto_21897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21895 ?auto_21896 ) ( SURFACE-AT ?auto_21893 ?auto_21896 ) ( CLEAR ?auto_21893 ) ( IS-CRATE ?auto_21894 ) ( AVAILABLE ?auto_21895 ) ( not ( = ?auto_21898 ?auto_21896 ) ) ( HOIST-AT ?auto_21899 ?auto_21898 ) ( AVAILABLE ?auto_21899 ) ( SURFACE-AT ?auto_21894 ?auto_21898 ) ( ON ?auto_21894 ?auto_21900 ) ( CLEAR ?auto_21894 ) ( TRUCK-AT ?auto_21897 ?auto_21896 ) ( not ( = ?auto_21893 ?auto_21894 ) ) ( not ( = ?auto_21893 ?auto_21900 ) ) ( not ( = ?auto_21894 ?auto_21900 ) ) ( not ( = ?auto_21895 ?auto_21899 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21897 ?auto_21896 ?auto_21898 )
      ( !LIFT ?auto_21899 ?auto_21894 ?auto_21900 ?auto_21898 )
      ( !LOAD ?auto_21899 ?auto_21894 ?auto_21897 ?auto_21898 )
      ( !DRIVE ?auto_21897 ?auto_21898 ?auto_21896 )
      ( !UNLOAD ?auto_21895 ?auto_21894 ?auto_21897 ?auto_21896 )
      ( !DROP ?auto_21895 ?auto_21894 ?auto_21893 ?auto_21896 )
      ( MAKE-1CRATE-VERIFY ?auto_21893 ?auto_21894 ) )
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
      ?auto_21923 - SURFACE
      ?auto_21922 - SURFACE
      ?auto_21921 - SURFACE
      ?auto_21924 - SURFACE
      ?auto_21926 - SURFACE
      ?auto_21925 - SURFACE
      ?auto_21927 - SURFACE
      ?auto_21928 - SURFACE
    )
    :vars
    (
      ?auto_21930 - HOIST
      ?auto_21933 - PLACE
      ?auto_21929 - PLACE
      ?auto_21932 - HOIST
      ?auto_21934 - SURFACE
      ?auto_21937 - PLACE
      ?auto_21938 - HOIST
      ?auto_21954 - SURFACE
      ?auto_21957 - PLACE
      ?auto_21944 - HOIST
      ?auto_21951 - SURFACE
      ?auto_21955 - PLACE
      ?auto_21959 - HOIST
      ?auto_21946 - SURFACE
      ?auto_21962 - PLACE
      ?auto_21953 - HOIST
      ?auto_21952 - SURFACE
      ?auto_21948 - PLACE
      ?auto_21956 - HOIST
      ?auto_21942 - SURFACE
      ?auto_21936 - PLACE
      ?auto_21950 - HOIST
      ?auto_21939 - SURFACE
      ?auto_21935 - PLACE
      ?auto_21949 - HOIST
      ?auto_21940 - SURFACE
      ?auto_21941 - SURFACE
      ?auto_21943 - PLACE
      ?auto_21947 - HOIST
      ?auto_21960 - SURFACE
      ?auto_21958 - SURFACE
      ?auto_21961 - SURFACE
      ?auto_21945 - SURFACE
      ?auto_21931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21930 ?auto_21933 ) ( IS-CRATE ?auto_21928 ) ( not ( = ?auto_21929 ?auto_21933 ) ) ( HOIST-AT ?auto_21932 ?auto_21929 ) ( AVAILABLE ?auto_21932 ) ( SURFACE-AT ?auto_21928 ?auto_21929 ) ( ON ?auto_21928 ?auto_21934 ) ( CLEAR ?auto_21928 ) ( not ( = ?auto_21927 ?auto_21928 ) ) ( not ( = ?auto_21927 ?auto_21934 ) ) ( not ( = ?auto_21928 ?auto_21934 ) ) ( not ( = ?auto_21930 ?auto_21932 ) ) ( IS-CRATE ?auto_21927 ) ( not ( = ?auto_21937 ?auto_21933 ) ) ( HOIST-AT ?auto_21938 ?auto_21937 ) ( SURFACE-AT ?auto_21927 ?auto_21937 ) ( ON ?auto_21927 ?auto_21954 ) ( CLEAR ?auto_21927 ) ( not ( = ?auto_21925 ?auto_21927 ) ) ( not ( = ?auto_21925 ?auto_21954 ) ) ( not ( = ?auto_21927 ?auto_21954 ) ) ( not ( = ?auto_21930 ?auto_21938 ) ) ( IS-CRATE ?auto_21925 ) ( not ( = ?auto_21957 ?auto_21933 ) ) ( HOIST-AT ?auto_21944 ?auto_21957 ) ( SURFACE-AT ?auto_21925 ?auto_21957 ) ( ON ?auto_21925 ?auto_21951 ) ( CLEAR ?auto_21925 ) ( not ( = ?auto_21926 ?auto_21925 ) ) ( not ( = ?auto_21926 ?auto_21951 ) ) ( not ( = ?auto_21925 ?auto_21951 ) ) ( not ( = ?auto_21930 ?auto_21944 ) ) ( IS-CRATE ?auto_21926 ) ( not ( = ?auto_21955 ?auto_21933 ) ) ( HOIST-AT ?auto_21959 ?auto_21955 ) ( SURFACE-AT ?auto_21926 ?auto_21955 ) ( ON ?auto_21926 ?auto_21946 ) ( CLEAR ?auto_21926 ) ( not ( = ?auto_21924 ?auto_21926 ) ) ( not ( = ?auto_21924 ?auto_21946 ) ) ( not ( = ?auto_21926 ?auto_21946 ) ) ( not ( = ?auto_21930 ?auto_21959 ) ) ( IS-CRATE ?auto_21924 ) ( not ( = ?auto_21962 ?auto_21933 ) ) ( HOIST-AT ?auto_21953 ?auto_21962 ) ( SURFACE-AT ?auto_21924 ?auto_21962 ) ( ON ?auto_21924 ?auto_21952 ) ( CLEAR ?auto_21924 ) ( not ( = ?auto_21921 ?auto_21924 ) ) ( not ( = ?auto_21921 ?auto_21952 ) ) ( not ( = ?auto_21924 ?auto_21952 ) ) ( not ( = ?auto_21930 ?auto_21953 ) ) ( IS-CRATE ?auto_21921 ) ( not ( = ?auto_21948 ?auto_21933 ) ) ( HOIST-AT ?auto_21956 ?auto_21948 ) ( AVAILABLE ?auto_21956 ) ( SURFACE-AT ?auto_21921 ?auto_21948 ) ( ON ?auto_21921 ?auto_21942 ) ( CLEAR ?auto_21921 ) ( not ( = ?auto_21922 ?auto_21921 ) ) ( not ( = ?auto_21922 ?auto_21942 ) ) ( not ( = ?auto_21921 ?auto_21942 ) ) ( not ( = ?auto_21930 ?auto_21956 ) ) ( IS-CRATE ?auto_21922 ) ( not ( = ?auto_21936 ?auto_21933 ) ) ( HOIST-AT ?auto_21950 ?auto_21936 ) ( AVAILABLE ?auto_21950 ) ( SURFACE-AT ?auto_21922 ?auto_21936 ) ( ON ?auto_21922 ?auto_21939 ) ( CLEAR ?auto_21922 ) ( not ( = ?auto_21923 ?auto_21922 ) ) ( not ( = ?auto_21923 ?auto_21939 ) ) ( not ( = ?auto_21922 ?auto_21939 ) ) ( not ( = ?auto_21930 ?auto_21950 ) ) ( IS-CRATE ?auto_21923 ) ( not ( = ?auto_21935 ?auto_21933 ) ) ( HOIST-AT ?auto_21949 ?auto_21935 ) ( AVAILABLE ?auto_21949 ) ( SURFACE-AT ?auto_21923 ?auto_21935 ) ( ON ?auto_21923 ?auto_21940 ) ( CLEAR ?auto_21923 ) ( not ( = ?auto_21920 ?auto_21923 ) ) ( not ( = ?auto_21920 ?auto_21940 ) ) ( not ( = ?auto_21923 ?auto_21940 ) ) ( not ( = ?auto_21930 ?auto_21949 ) ) ( IS-CRATE ?auto_21920 ) ( AVAILABLE ?auto_21938 ) ( SURFACE-AT ?auto_21920 ?auto_21937 ) ( ON ?auto_21920 ?auto_21941 ) ( CLEAR ?auto_21920 ) ( not ( = ?auto_21919 ?auto_21920 ) ) ( not ( = ?auto_21919 ?auto_21941 ) ) ( not ( = ?auto_21920 ?auto_21941 ) ) ( IS-CRATE ?auto_21919 ) ( not ( = ?auto_21943 ?auto_21933 ) ) ( HOIST-AT ?auto_21947 ?auto_21943 ) ( AVAILABLE ?auto_21947 ) ( SURFACE-AT ?auto_21919 ?auto_21943 ) ( ON ?auto_21919 ?auto_21960 ) ( CLEAR ?auto_21919 ) ( not ( = ?auto_21918 ?auto_21919 ) ) ( not ( = ?auto_21918 ?auto_21960 ) ) ( not ( = ?auto_21919 ?auto_21960 ) ) ( not ( = ?auto_21930 ?auto_21947 ) ) ( IS-CRATE ?auto_21918 ) ( AVAILABLE ?auto_21959 ) ( SURFACE-AT ?auto_21918 ?auto_21955 ) ( ON ?auto_21918 ?auto_21958 ) ( CLEAR ?auto_21918 ) ( not ( = ?auto_21917 ?auto_21918 ) ) ( not ( = ?auto_21917 ?auto_21958 ) ) ( not ( = ?auto_21918 ?auto_21958 ) ) ( IS-CRATE ?auto_21917 ) ( AVAILABLE ?auto_21944 ) ( SURFACE-AT ?auto_21917 ?auto_21957 ) ( ON ?auto_21917 ?auto_21961 ) ( CLEAR ?auto_21917 ) ( not ( = ?auto_21916 ?auto_21917 ) ) ( not ( = ?auto_21916 ?auto_21961 ) ) ( not ( = ?auto_21917 ?auto_21961 ) ) ( SURFACE-AT ?auto_21915 ?auto_21933 ) ( CLEAR ?auto_21915 ) ( IS-CRATE ?auto_21916 ) ( AVAILABLE ?auto_21930 ) ( AVAILABLE ?auto_21953 ) ( SURFACE-AT ?auto_21916 ?auto_21962 ) ( ON ?auto_21916 ?auto_21945 ) ( CLEAR ?auto_21916 ) ( TRUCK-AT ?auto_21931 ?auto_21933 ) ( not ( = ?auto_21915 ?auto_21916 ) ) ( not ( = ?auto_21915 ?auto_21945 ) ) ( not ( = ?auto_21916 ?auto_21945 ) ) ( not ( = ?auto_21915 ?auto_21917 ) ) ( not ( = ?auto_21915 ?auto_21961 ) ) ( not ( = ?auto_21917 ?auto_21945 ) ) ( not ( = ?auto_21957 ?auto_21962 ) ) ( not ( = ?auto_21944 ?auto_21953 ) ) ( not ( = ?auto_21961 ?auto_21945 ) ) ( not ( = ?auto_21915 ?auto_21918 ) ) ( not ( = ?auto_21915 ?auto_21958 ) ) ( not ( = ?auto_21916 ?auto_21918 ) ) ( not ( = ?auto_21916 ?auto_21958 ) ) ( not ( = ?auto_21918 ?auto_21961 ) ) ( not ( = ?auto_21918 ?auto_21945 ) ) ( not ( = ?auto_21955 ?auto_21957 ) ) ( not ( = ?auto_21955 ?auto_21962 ) ) ( not ( = ?auto_21959 ?auto_21944 ) ) ( not ( = ?auto_21959 ?auto_21953 ) ) ( not ( = ?auto_21958 ?auto_21961 ) ) ( not ( = ?auto_21958 ?auto_21945 ) ) ( not ( = ?auto_21915 ?auto_21919 ) ) ( not ( = ?auto_21915 ?auto_21960 ) ) ( not ( = ?auto_21916 ?auto_21919 ) ) ( not ( = ?auto_21916 ?auto_21960 ) ) ( not ( = ?auto_21917 ?auto_21919 ) ) ( not ( = ?auto_21917 ?auto_21960 ) ) ( not ( = ?auto_21919 ?auto_21958 ) ) ( not ( = ?auto_21919 ?auto_21961 ) ) ( not ( = ?auto_21919 ?auto_21945 ) ) ( not ( = ?auto_21943 ?auto_21955 ) ) ( not ( = ?auto_21943 ?auto_21957 ) ) ( not ( = ?auto_21943 ?auto_21962 ) ) ( not ( = ?auto_21947 ?auto_21959 ) ) ( not ( = ?auto_21947 ?auto_21944 ) ) ( not ( = ?auto_21947 ?auto_21953 ) ) ( not ( = ?auto_21960 ?auto_21958 ) ) ( not ( = ?auto_21960 ?auto_21961 ) ) ( not ( = ?auto_21960 ?auto_21945 ) ) ( not ( = ?auto_21915 ?auto_21920 ) ) ( not ( = ?auto_21915 ?auto_21941 ) ) ( not ( = ?auto_21916 ?auto_21920 ) ) ( not ( = ?auto_21916 ?auto_21941 ) ) ( not ( = ?auto_21917 ?auto_21920 ) ) ( not ( = ?auto_21917 ?auto_21941 ) ) ( not ( = ?auto_21918 ?auto_21920 ) ) ( not ( = ?auto_21918 ?auto_21941 ) ) ( not ( = ?auto_21920 ?auto_21960 ) ) ( not ( = ?auto_21920 ?auto_21958 ) ) ( not ( = ?auto_21920 ?auto_21961 ) ) ( not ( = ?auto_21920 ?auto_21945 ) ) ( not ( = ?auto_21937 ?auto_21943 ) ) ( not ( = ?auto_21937 ?auto_21955 ) ) ( not ( = ?auto_21937 ?auto_21957 ) ) ( not ( = ?auto_21937 ?auto_21962 ) ) ( not ( = ?auto_21938 ?auto_21947 ) ) ( not ( = ?auto_21938 ?auto_21959 ) ) ( not ( = ?auto_21938 ?auto_21944 ) ) ( not ( = ?auto_21938 ?auto_21953 ) ) ( not ( = ?auto_21941 ?auto_21960 ) ) ( not ( = ?auto_21941 ?auto_21958 ) ) ( not ( = ?auto_21941 ?auto_21961 ) ) ( not ( = ?auto_21941 ?auto_21945 ) ) ( not ( = ?auto_21915 ?auto_21923 ) ) ( not ( = ?auto_21915 ?auto_21940 ) ) ( not ( = ?auto_21916 ?auto_21923 ) ) ( not ( = ?auto_21916 ?auto_21940 ) ) ( not ( = ?auto_21917 ?auto_21923 ) ) ( not ( = ?auto_21917 ?auto_21940 ) ) ( not ( = ?auto_21918 ?auto_21923 ) ) ( not ( = ?auto_21918 ?auto_21940 ) ) ( not ( = ?auto_21919 ?auto_21923 ) ) ( not ( = ?auto_21919 ?auto_21940 ) ) ( not ( = ?auto_21923 ?auto_21941 ) ) ( not ( = ?auto_21923 ?auto_21960 ) ) ( not ( = ?auto_21923 ?auto_21958 ) ) ( not ( = ?auto_21923 ?auto_21961 ) ) ( not ( = ?auto_21923 ?auto_21945 ) ) ( not ( = ?auto_21935 ?auto_21937 ) ) ( not ( = ?auto_21935 ?auto_21943 ) ) ( not ( = ?auto_21935 ?auto_21955 ) ) ( not ( = ?auto_21935 ?auto_21957 ) ) ( not ( = ?auto_21935 ?auto_21962 ) ) ( not ( = ?auto_21949 ?auto_21938 ) ) ( not ( = ?auto_21949 ?auto_21947 ) ) ( not ( = ?auto_21949 ?auto_21959 ) ) ( not ( = ?auto_21949 ?auto_21944 ) ) ( not ( = ?auto_21949 ?auto_21953 ) ) ( not ( = ?auto_21940 ?auto_21941 ) ) ( not ( = ?auto_21940 ?auto_21960 ) ) ( not ( = ?auto_21940 ?auto_21958 ) ) ( not ( = ?auto_21940 ?auto_21961 ) ) ( not ( = ?auto_21940 ?auto_21945 ) ) ( not ( = ?auto_21915 ?auto_21922 ) ) ( not ( = ?auto_21915 ?auto_21939 ) ) ( not ( = ?auto_21916 ?auto_21922 ) ) ( not ( = ?auto_21916 ?auto_21939 ) ) ( not ( = ?auto_21917 ?auto_21922 ) ) ( not ( = ?auto_21917 ?auto_21939 ) ) ( not ( = ?auto_21918 ?auto_21922 ) ) ( not ( = ?auto_21918 ?auto_21939 ) ) ( not ( = ?auto_21919 ?auto_21922 ) ) ( not ( = ?auto_21919 ?auto_21939 ) ) ( not ( = ?auto_21920 ?auto_21922 ) ) ( not ( = ?auto_21920 ?auto_21939 ) ) ( not ( = ?auto_21922 ?auto_21940 ) ) ( not ( = ?auto_21922 ?auto_21941 ) ) ( not ( = ?auto_21922 ?auto_21960 ) ) ( not ( = ?auto_21922 ?auto_21958 ) ) ( not ( = ?auto_21922 ?auto_21961 ) ) ( not ( = ?auto_21922 ?auto_21945 ) ) ( not ( = ?auto_21936 ?auto_21935 ) ) ( not ( = ?auto_21936 ?auto_21937 ) ) ( not ( = ?auto_21936 ?auto_21943 ) ) ( not ( = ?auto_21936 ?auto_21955 ) ) ( not ( = ?auto_21936 ?auto_21957 ) ) ( not ( = ?auto_21936 ?auto_21962 ) ) ( not ( = ?auto_21950 ?auto_21949 ) ) ( not ( = ?auto_21950 ?auto_21938 ) ) ( not ( = ?auto_21950 ?auto_21947 ) ) ( not ( = ?auto_21950 ?auto_21959 ) ) ( not ( = ?auto_21950 ?auto_21944 ) ) ( not ( = ?auto_21950 ?auto_21953 ) ) ( not ( = ?auto_21939 ?auto_21940 ) ) ( not ( = ?auto_21939 ?auto_21941 ) ) ( not ( = ?auto_21939 ?auto_21960 ) ) ( not ( = ?auto_21939 ?auto_21958 ) ) ( not ( = ?auto_21939 ?auto_21961 ) ) ( not ( = ?auto_21939 ?auto_21945 ) ) ( not ( = ?auto_21915 ?auto_21921 ) ) ( not ( = ?auto_21915 ?auto_21942 ) ) ( not ( = ?auto_21916 ?auto_21921 ) ) ( not ( = ?auto_21916 ?auto_21942 ) ) ( not ( = ?auto_21917 ?auto_21921 ) ) ( not ( = ?auto_21917 ?auto_21942 ) ) ( not ( = ?auto_21918 ?auto_21921 ) ) ( not ( = ?auto_21918 ?auto_21942 ) ) ( not ( = ?auto_21919 ?auto_21921 ) ) ( not ( = ?auto_21919 ?auto_21942 ) ) ( not ( = ?auto_21920 ?auto_21921 ) ) ( not ( = ?auto_21920 ?auto_21942 ) ) ( not ( = ?auto_21923 ?auto_21921 ) ) ( not ( = ?auto_21923 ?auto_21942 ) ) ( not ( = ?auto_21921 ?auto_21939 ) ) ( not ( = ?auto_21921 ?auto_21940 ) ) ( not ( = ?auto_21921 ?auto_21941 ) ) ( not ( = ?auto_21921 ?auto_21960 ) ) ( not ( = ?auto_21921 ?auto_21958 ) ) ( not ( = ?auto_21921 ?auto_21961 ) ) ( not ( = ?auto_21921 ?auto_21945 ) ) ( not ( = ?auto_21948 ?auto_21936 ) ) ( not ( = ?auto_21948 ?auto_21935 ) ) ( not ( = ?auto_21948 ?auto_21937 ) ) ( not ( = ?auto_21948 ?auto_21943 ) ) ( not ( = ?auto_21948 ?auto_21955 ) ) ( not ( = ?auto_21948 ?auto_21957 ) ) ( not ( = ?auto_21948 ?auto_21962 ) ) ( not ( = ?auto_21956 ?auto_21950 ) ) ( not ( = ?auto_21956 ?auto_21949 ) ) ( not ( = ?auto_21956 ?auto_21938 ) ) ( not ( = ?auto_21956 ?auto_21947 ) ) ( not ( = ?auto_21956 ?auto_21959 ) ) ( not ( = ?auto_21956 ?auto_21944 ) ) ( not ( = ?auto_21956 ?auto_21953 ) ) ( not ( = ?auto_21942 ?auto_21939 ) ) ( not ( = ?auto_21942 ?auto_21940 ) ) ( not ( = ?auto_21942 ?auto_21941 ) ) ( not ( = ?auto_21942 ?auto_21960 ) ) ( not ( = ?auto_21942 ?auto_21958 ) ) ( not ( = ?auto_21942 ?auto_21961 ) ) ( not ( = ?auto_21942 ?auto_21945 ) ) ( not ( = ?auto_21915 ?auto_21924 ) ) ( not ( = ?auto_21915 ?auto_21952 ) ) ( not ( = ?auto_21916 ?auto_21924 ) ) ( not ( = ?auto_21916 ?auto_21952 ) ) ( not ( = ?auto_21917 ?auto_21924 ) ) ( not ( = ?auto_21917 ?auto_21952 ) ) ( not ( = ?auto_21918 ?auto_21924 ) ) ( not ( = ?auto_21918 ?auto_21952 ) ) ( not ( = ?auto_21919 ?auto_21924 ) ) ( not ( = ?auto_21919 ?auto_21952 ) ) ( not ( = ?auto_21920 ?auto_21924 ) ) ( not ( = ?auto_21920 ?auto_21952 ) ) ( not ( = ?auto_21923 ?auto_21924 ) ) ( not ( = ?auto_21923 ?auto_21952 ) ) ( not ( = ?auto_21922 ?auto_21924 ) ) ( not ( = ?auto_21922 ?auto_21952 ) ) ( not ( = ?auto_21924 ?auto_21942 ) ) ( not ( = ?auto_21924 ?auto_21939 ) ) ( not ( = ?auto_21924 ?auto_21940 ) ) ( not ( = ?auto_21924 ?auto_21941 ) ) ( not ( = ?auto_21924 ?auto_21960 ) ) ( not ( = ?auto_21924 ?auto_21958 ) ) ( not ( = ?auto_21924 ?auto_21961 ) ) ( not ( = ?auto_21924 ?auto_21945 ) ) ( not ( = ?auto_21952 ?auto_21942 ) ) ( not ( = ?auto_21952 ?auto_21939 ) ) ( not ( = ?auto_21952 ?auto_21940 ) ) ( not ( = ?auto_21952 ?auto_21941 ) ) ( not ( = ?auto_21952 ?auto_21960 ) ) ( not ( = ?auto_21952 ?auto_21958 ) ) ( not ( = ?auto_21952 ?auto_21961 ) ) ( not ( = ?auto_21952 ?auto_21945 ) ) ( not ( = ?auto_21915 ?auto_21926 ) ) ( not ( = ?auto_21915 ?auto_21946 ) ) ( not ( = ?auto_21916 ?auto_21926 ) ) ( not ( = ?auto_21916 ?auto_21946 ) ) ( not ( = ?auto_21917 ?auto_21926 ) ) ( not ( = ?auto_21917 ?auto_21946 ) ) ( not ( = ?auto_21918 ?auto_21926 ) ) ( not ( = ?auto_21918 ?auto_21946 ) ) ( not ( = ?auto_21919 ?auto_21926 ) ) ( not ( = ?auto_21919 ?auto_21946 ) ) ( not ( = ?auto_21920 ?auto_21926 ) ) ( not ( = ?auto_21920 ?auto_21946 ) ) ( not ( = ?auto_21923 ?auto_21926 ) ) ( not ( = ?auto_21923 ?auto_21946 ) ) ( not ( = ?auto_21922 ?auto_21926 ) ) ( not ( = ?auto_21922 ?auto_21946 ) ) ( not ( = ?auto_21921 ?auto_21926 ) ) ( not ( = ?auto_21921 ?auto_21946 ) ) ( not ( = ?auto_21926 ?auto_21952 ) ) ( not ( = ?auto_21926 ?auto_21942 ) ) ( not ( = ?auto_21926 ?auto_21939 ) ) ( not ( = ?auto_21926 ?auto_21940 ) ) ( not ( = ?auto_21926 ?auto_21941 ) ) ( not ( = ?auto_21926 ?auto_21960 ) ) ( not ( = ?auto_21926 ?auto_21958 ) ) ( not ( = ?auto_21926 ?auto_21961 ) ) ( not ( = ?auto_21926 ?auto_21945 ) ) ( not ( = ?auto_21946 ?auto_21952 ) ) ( not ( = ?auto_21946 ?auto_21942 ) ) ( not ( = ?auto_21946 ?auto_21939 ) ) ( not ( = ?auto_21946 ?auto_21940 ) ) ( not ( = ?auto_21946 ?auto_21941 ) ) ( not ( = ?auto_21946 ?auto_21960 ) ) ( not ( = ?auto_21946 ?auto_21958 ) ) ( not ( = ?auto_21946 ?auto_21961 ) ) ( not ( = ?auto_21946 ?auto_21945 ) ) ( not ( = ?auto_21915 ?auto_21925 ) ) ( not ( = ?auto_21915 ?auto_21951 ) ) ( not ( = ?auto_21916 ?auto_21925 ) ) ( not ( = ?auto_21916 ?auto_21951 ) ) ( not ( = ?auto_21917 ?auto_21925 ) ) ( not ( = ?auto_21917 ?auto_21951 ) ) ( not ( = ?auto_21918 ?auto_21925 ) ) ( not ( = ?auto_21918 ?auto_21951 ) ) ( not ( = ?auto_21919 ?auto_21925 ) ) ( not ( = ?auto_21919 ?auto_21951 ) ) ( not ( = ?auto_21920 ?auto_21925 ) ) ( not ( = ?auto_21920 ?auto_21951 ) ) ( not ( = ?auto_21923 ?auto_21925 ) ) ( not ( = ?auto_21923 ?auto_21951 ) ) ( not ( = ?auto_21922 ?auto_21925 ) ) ( not ( = ?auto_21922 ?auto_21951 ) ) ( not ( = ?auto_21921 ?auto_21925 ) ) ( not ( = ?auto_21921 ?auto_21951 ) ) ( not ( = ?auto_21924 ?auto_21925 ) ) ( not ( = ?auto_21924 ?auto_21951 ) ) ( not ( = ?auto_21925 ?auto_21946 ) ) ( not ( = ?auto_21925 ?auto_21952 ) ) ( not ( = ?auto_21925 ?auto_21942 ) ) ( not ( = ?auto_21925 ?auto_21939 ) ) ( not ( = ?auto_21925 ?auto_21940 ) ) ( not ( = ?auto_21925 ?auto_21941 ) ) ( not ( = ?auto_21925 ?auto_21960 ) ) ( not ( = ?auto_21925 ?auto_21958 ) ) ( not ( = ?auto_21925 ?auto_21961 ) ) ( not ( = ?auto_21925 ?auto_21945 ) ) ( not ( = ?auto_21951 ?auto_21946 ) ) ( not ( = ?auto_21951 ?auto_21952 ) ) ( not ( = ?auto_21951 ?auto_21942 ) ) ( not ( = ?auto_21951 ?auto_21939 ) ) ( not ( = ?auto_21951 ?auto_21940 ) ) ( not ( = ?auto_21951 ?auto_21941 ) ) ( not ( = ?auto_21951 ?auto_21960 ) ) ( not ( = ?auto_21951 ?auto_21958 ) ) ( not ( = ?auto_21951 ?auto_21961 ) ) ( not ( = ?auto_21951 ?auto_21945 ) ) ( not ( = ?auto_21915 ?auto_21927 ) ) ( not ( = ?auto_21915 ?auto_21954 ) ) ( not ( = ?auto_21916 ?auto_21927 ) ) ( not ( = ?auto_21916 ?auto_21954 ) ) ( not ( = ?auto_21917 ?auto_21927 ) ) ( not ( = ?auto_21917 ?auto_21954 ) ) ( not ( = ?auto_21918 ?auto_21927 ) ) ( not ( = ?auto_21918 ?auto_21954 ) ) ( not ( = ?auto_21919 ?auto_21927 ) ) ( not ( = ?auto_21919 ?auto_21954 ) ) ( not ( = ?auto_21920 ?auto_21927 ) ) ( not ( = ?auto_21920 ?auto_21954 ) ) ( not ( = ?auto_21923 ?auto_21927 ) ) ( not ( = ?auto_21923 ?auto_21954 ) ) ( not ( = ?auto_21922 ?auto_21927 ) ) ( not ( = ?auto_21922 ?auto_21954 ) ) ( not ( = ?auto_21921 ?auto_21927 ) ) ( not ( = ?auto_21921 ?auto_21954 ) ) ( not ( = ?auto_21924 ?auto_21927 ) ) ( not ( = ?auto_21924 ?auto_21954 ) ) ( not ( = ?auto_21926 ?auto_21927 ) ) ( not ( = ?auto_21926 ?auto_21954 ) ) ( not ( = ?auto_21927 ?auto_21951 ) ) ( not ( = ?auto_21927 ?auto_21946 ) ) ( not ( = ?auto_21927 ?auto_21952 ) ) ( not ( = ?auto_21927 ?auto_21942 ) ) ( not ( = ?auto_21927 ?auto_21939 ) ) ( not ( = ?auto_21927 ?auto_21940 ) ) ( not ( = ?auto_21927 ?auto_21941 ) ) ( not ( = ?auto_21927 ?auto_21960 ) ) ( not ( = ?auto_21927 ?auto_21958 ) ) ( not ( = ?auto_21927 ?auto_21961 ) ) ( not ( = ?auto_21927 ?auto_21945 ) ) ( not ( = ?auto_21954 ?auto_21951 ) ) ( not ( = ?auto_21954 ?auto_21946 ) ) ( not ( = ?auto_21954 ?auto_21952 ) ) ( not ( = ?auto_21954 ?auto_21942 ) ) ( not ( = ?auto_21954 ?auto_21939 ) ) ( not ( = ?auto_21954 ?auto_21940 ) ) ( not ( = ?auto_21954 ?auto_21941 ) ) ( not ( = ?auto_21954 ?auto_21960 ) ) ( not ( = ?auto_21954 ?auto_21958 ) ) ( not ( = ?auto_21954 ?auto_21961 ) ) ( not ( = ?auto_21954 ?auto_21945 ) ) ( not ( = ?auto_21915 ?auto_21928 ) ) ( not ( = ?auto_21915 ?auto_21934 ) ) ( not ( = ?auto_21916 ?auto_21928 ) ) ( not ( = ?auto_21916 ?auto_21934 ) ) ( not ( = ?auto_21917 ?auto_21928 ) ) ( not ( = ?auto_21917 ?auto_21934 ) ) ( not ( = ?auto_21918 ?auto_21928 ) ) ( not ( = ?auto_21918 ?auto_21934 ) ) ( not ( = ?auto_21919 ?auto_21928 ) ) ( not ( = ?auto_21919 ?auto_21934 ) ) ( not ( = ?auto_21920 ?auto_21928 ) ) ( not ( = ?auto_21920 ?auto_21934 ) ) ( not ( = ?auto_21923 ?auto_21928 ) ) ( not ( = ?auto_21923 ?auto_21934 ) ) ( not ( = ?auto_21922 ?auto_21928 ) ) ( not ( = ?auto_21922 ?auto_21934 ) ) ( not ( = ?auto_21921 ?auto_21928 ) ) ( not ( = ?auto_21921 ?auto_21934 ) ) ( not ( = ?auto_21924 ?auto_21928 ) ) ( not ( = ?auto_21924 ?auto_21934 ) ) ( not ( = ?auto_21926 ?auto_21928 ) ) ( not ( = ?auto_21926 ?auto_21934 ) ) ( not ( = ?auto_21925 ?auto_21928 ) ) ( not ( = ?auto_21925 ?auto_21934 ) ) ( not ( = ?auto_21928 ?auto_21954 ) ) ( not ( = ?auto_21928 ?auto_21951 ) ) ( not ( = ?auto_21928 ?auto_21946 ) ) ( not ( = ?auto_21928 ?auto_21952 ) ) ( not ( = ?auto_21928 ?auto_21942 ) ) ( not ( = ?auto_21928 ?auto_21939 ) ) ( not ( = ?auto_21928 ?auto_21940 ) ) ( not ( = ?auto_21928 ?auto_21941 ) ) ( not ( = ?auto_21928 ?auto_21960 ) ) ( not ( = ?auto_21928 ?auto_21958 ) ) ( not ( = ?auto_21928 ?auto_21961 ) ) ( not ( = ?auto_21928 ?auto_21945 ) ) ( not ( = ?auto_21929 ?auto_21937 ) ) ( not ( = ?auto_21929 ?auto_21957 ) ) ( not ( = ?auto_21929 ?auto_21955 ) ) ( not ( = ?auto_21929 ?auto_21962 ) ) ( not ( = ?auto_21929 ?auto_21948 ) ) ( not ( = ?auto_21929 ?auto_21936 ) ) ( not ( = ?auto_21929 ?auto_21935 ) ) ( not ( = ?auto_21929 ?auto_21943 ) ) ( not ( = ?auto_21932 ?auto_21938 ) ) ( not ( = ?auto_21932 ?auto_21944 ) ) ( not ( = ?auto_21932 ?auto_21959 ) ) ( not ( = ?auto_21932 ?auto_21953 ) ) ( not ( = ?auto_21932 ?auto_21956 ) ) ( not ( = ?auto_21932 ?auto_21950 ) ) ( not ( = ?auto_21932 ?auto_21949 ) ) ( not ( = ?auto_21932 ?auto_21947 ) ) ( not ( = ?auto_21934 ?auto_21954 ) ) ( not ( = ?auto_21934 ?auto_21951 ) ) ( not ( = ?auto_21934 ?auto_21946 ) ) ( not ( = ?auto_21934 ?auto_21952 ) ) ( not ( = ?auto_21934 ?auto_21942 ) ) ( not ( = ?auto_21934 ?auto_21939 ) ) ( not ( = ?auto_21934 ?auto_21940 ) ) ( not ( = ?auto_21934 ?auto_21941 ) ) ( not ( = ?auto_21934 ?auto_21960 ) ) ( not ( = ?auto_21934 ?auto_21958 ) ) ( not ( = ?auto_21934 ?auto_21961 ) ) ( not ( = ?auto_21934 ?auto_21945 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_21915 ?auto_21916 ?auto_21917 ?auto_21918 ?auto_21919 ?auto_21920 ?auto_21923 ?auto_21922 ?auto_21921 ?auto_21924 ?auto_21926 ?auto_21925 ?auto_21927 )
      ( MAKE-1CRATE ?auto_21927 ?auto_21928 )
      ( MAKE-13CRATE-VERIFY ?auto_21915 ?auto_21916 ?auto_21917 ?auto_21918 ?auto_21919 ?auto_21920 ?auto_21923 ?auto_21922 ?auto_21921 ?auto_21924 ?auto_21926 ?auto_21925 ?auto_21927 ?auto_21928 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21965 - SURFACE
      ?auto_21966 - SURFACE
    )
    :vars
    (
      ?auto_21967 - HOIST
      ?auto_21968 - PLACE
      ?auto_21970 - PLACE
      ?auto_21971 - HOIST
      ?auto_21972 - SURFACE
      ?auto_21969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21967 ?auto_21968 ) ( SURFACE-AT ?auto_21965 ?auto_21968 ) ( CLEAR ?auto_21965 ) ( IS-CRATE ?auto_21966 ) ( AVAILABLE ?auto_21967 ) ( not ( = ?auto_21970 ?auto_21968 ) ) ( HOIST-AT ?auto_21971 ?auto_21970 ) ( AVAILABLE ?auto_21971 ) ( SURFACE-AT ?auto_21966 ?auto_21970 ) ( ON ?auto_21966 ?auto_21972 ) ( CLEAR ?auto_21966 ) ( TRUCK-AT ?auto_21969 ?auto_21968 ) ( not ( = ?auto_21965 ?auto_21966 ) ) ( not ( = ?auto_21965 ?auto_21972 ) ) ( not ( = ?auto_21966 ?auto_21972 ) ) ( not ( = ?auto_21967 ?auto_21971 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21969 ?auto_21968 ?auto_21970 )
      ( !LIFT ?auto_21971 ?auto_21966 ?auto_21972 ?auto_21970 )
      ( !LOAD ?auto_21971 ?auto_21966 ?auto_21969 ?auto_21970 )
      ( !DRIVE ?auto_21969 ?auto_21970 ?auto_21968 )
      ( !UNLOAD ?auto_21967 ?auto_21966 ?auto_21969 ?auto_21968 )
      ( !DROP ?auto_21967 ?auto_21966 ?auto_21965 ?auto_21968 )
      ( MAKE-1CRATE-VERIFY ?auto_21965 ?auto_21966 ) )
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
      ?auto_21996 - SURFACE
      ?auto_21995 - SURFACE
      ?auto_21994 - SURFACE
      ?auto_21997 - SURFACE
      ?auto_21999 - SURFACE
      ?auto_21998 - SURFACE
      ?auto_22000 - SURFACE
      ?auto_22002 - SURFACE
      ?auto_22001 - SURFACE
    )
    :vars
    (
      ?auto_22005 - HOIST
      ?auto_22006 - PLACE
      ?auto_22004 - PLACE
      ?auto_22003 - HOIST
      ?auto_22007 - SURFACE
      ?auto_22020 - PLACE
      ?auto_22023 - HOIST
      ?auto_22017 - SURFACE
      ?auto_22038 - PLACE
      ?auto_22010 - HOIST
      ?auto_22015 - SURFACE
      ?auto_22016 - PLACE
      ?auto_22031 - HOIST
      ?auto_22033 - SURFACE
      ?auto_22018 - PLACE
      ?auto_22029 - HOIST
      ?auto_22021 - SURFACE
      ?auto_22024 - PLACE
      ?auto_22035 - HOIST
      ?auto_22014 - SURFACE
      ?auto_22022 - PLACE
      ?auto_22032 - HOIST
      ?auto_22037 - SURFACE
      ?auto_22011 - PLACE
      ?auto_22034 - HOIST
      ?auto_22012 - SURFACE
      ?auto_22019 - PLACE
      ?auto_22028 - HOIST
      ?auto_22036 - SURFACE
      ?auto_22039 - SURFACE
      ?auto_22030 - PLACE
      ?auto_22026 - HOIST
      ?auto_22025 - SURFACE
      ?auto_22013 - SURFACE
      ?auto_22009 - SURFACE
      ?auto_22027 - SURFACE
      ?auto_22008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22005 ?auto_22006 ) ( IS-CRATE ?auto_22001 ) ( not ( = ?auto_22004 ?auto_22006 ) ) ( HOIST-AT ?auto_22003 ?auto_22004 ) ( AVAILABLE ?auto_22003 ) ( SURFACE-AT ?auto_22001 ?auto_22004 ) ( ON ?auto_22001 ?auto_22007 ) ( CLEAR ?auto_22001 ) ( not ( = ?auto_22002 ?auto_22001 ) ) ( not ( = ?auto_22002 ?auto_22007 ) ) ( not ( = ?auto_22001 ?auto_22007 ) ) ( not ( = ?auto_22005 ?auto_22003 ) ) ( IS-CRATE ?auto_22002 ) ( not ( = ?auto_22020 ?auto_22006 ) ) ( HOIST-AT ?auto_22023 ?auto_22020 ) ( AVAILABLE ?auto_22023 ) ( SURFACE-AT ?auto_22002 ?auto_22020 ) ( ON ?auto_22002 ?auto_22017 ) ( CLEAR ?auto_22002 ) ( not ( = ?auto_22000 ?auto_22002 ) ) ( not ( = ?auto_22000 ?auto_22017 ) ) ( not ( = ?auto_22002 ?auto_22017 ) ) ( not ( = ?auto_22005 ?auto_22023 ) ) ( IS-CRATE ?auto_22000 ) ( not ( = ?auto_22038 ?auto_22006 ) ) ( HOIST-AT ?auto_22010 ?auto_22038 ) ( SURFACE-AT ?auto_22000 ?auto_22038 ) ( ON ?auto_22000 ?auto_22015 ) ( CLEAR ?auto_22000 ) ( not ( = ?auto_21998 ?auto_22000 ) ) ( not ( = ?auto_21998 ?auto_22015 ) ) ( not ( = ?auto_22000 ?auto_22015 ) ) ( not ( = ?auto_22005 ?auto_22010 ) ) ( IS-CRATE ?auto_21998 ) ( not ( = ?auto_22016 ?auto_22006 ) ) ( HOIST-AT ?auto_22031 ?auto_22016 ) ( SURFACE-AT ?auto_21998 ?auto_22016 ) ( ON ?auto_21998 ?auto_22033 ) ( CLEAR ?auto_21998 ) ( not ( = ?auto_21999 ?auto_21998 ) ) ( not ( = ?auto_21999 ?auto_22033 ) ) ( not ( = ?auto_21998 ?auto_22033 ) ) ( not ( = ?auto_22005 ?auto_22031 ) ) ( IS-CRATE ?auto_21999 ) ( not ( = ?auto_22018 ?auto_22006 ) ) ( HOIST-AT ?auto_22029 ?auto_22018 ) ( SURFACE-AT ?auto_21999 ?auto_22018 ) ( ON ?auto_21999 ?auto_22021 ) ( CLEAR ?auto_21999 ) ( not ( = ?auto_21997 ?auto_21999 ) ) ( not ( = ?auto_21997 ?auto_22021 ) ) ( not ( = ?auto_21999 ?auto_22021 ) ) ( not ( = ?auto_22005 ?auto_22029 ) ) ( IS-CRATE ?auto_21997 ) ( not ( = ?auto_22024 ?auto_22006 ) ) ( HOIST-AT ?auto_22035 ?auto_22024 ) ( SURFACE-AT ?auto_21997 ?auto_22024 ) ( ON ?auto_21997 ?auto_22014 ) ( CLEAR ?auto_21997 ) ( not ( = ?auto_21994 ?auto_21997 ) ) ( not ( = ?auto_21994 ?auto_22014 ) ) ( not ( = ?auto_21997 ?auto_22014 ) ) ( not ( = ?auto_22005 ?auto_22035 ) ) ( IS-CRATE ?auto_21994 ) ( not ( = ?auto_22022 ?auto_22006 ) ) ( HOIST-AT ?auto_22032 ?auto_22022 ) ( AVAILABLE ?auto_22032 ) ( SURFACE-AT ?auto_21994 ?auto_22022 ) ( ON ?auto_21994 ?auto_22037 ) ( CLEAR ?auto_21994 ) ( not ( = ?auto_21995 ?auto_21994 ) ) ( not ( = ?auto_21995 ?auto_22037 ) ) ( not ( = ?auto_21994 ?auto_22037 ) ) ( not ( = ?auto_22005 ?auto_22032 ) ) ( IS-CRATE ?auto_21995 ) ( not ( = ?auto_22011 ?auto_22006 ) ) ( HOIST-AT ?auto_22034 ?auto_22011 ) ( AVAILABLE ?auto_22034 ) ( SURFACE-AT ?auto_21995 ?auto_22011 ) ( ON ?auto_21995 ?auto_22012 ) ( CLEAR ?auto_21995 ) ( not ( = ?auto_21996 ?auto_21995 ) ) ( not ( = ?auto_21996 ?auto_22012 ) ) ( not ( = ?auto_21995 ?auto_22012 ) ) ( not ( = ?auto_22005 ?auto_22034 ) ) ( IS-CRATE ?auto_21996 ) ( not ( = ?auto_22019 ?auto_22006 ) ) ( HOIST-AT ?auto_22028 ?auto_22019 ) ( AVAILABLE ?auto_22028 ) ( SURFACE-AT ?auto_21996 ?auto_22019 ) ( ON ?auto_21996 ?auto_22036 ) ( CLEAR ?auto_21996 ) ( not ( = ?auto_21993 ?auto_21996 ) ) ( not ( = ?auto_21993 ?auto_22036 ) ) ( not ( = ?auto_21996 ?auto_22036 ) ) ( not ( = ?auto_22005 ?auto_22028 ) ) ( IS-CRATE ?auto_21993 ) ( AVAILABLE ?auto_22010 ) ( SURFACE-AT ?auto_21993 ?auto_22038 ) ( ON ?auto_21993 ?auto_22039 ) ( CLEAR ?auto_21993 ) ( not ( = ?auto_21992 ?auto_21993 ) ) ( not ( = ?auto_21992 ?auto_22039 ) ) ( not ( = ?auto_21993 ?auto_22039 ) ) ( IS-CRATE ?auto_21992 ) ( not ( = ?auto_22030 ?auto_22006 ) ) ( HOIST-AT ?auto_22026 ?auto_22030 ) ( AVAILABLE ?auto_22026 ) ( SURFACE-AT ?auto_21992 ?auto_22030 ) ( ON ?auto_21992 ?auto_22025 ) ( CLEAR ?auto_21992 ) ( not ( = ?auto_21991 ?auto_21992 ) ) ( not ( = ?auto_21991 ?auto_22025 ) ) ( not ( = ?auto_21992 ?auto_22025 ) ) ( not ( = ?auto_22005 ?auto_22026 ) ) ( IS-CRATE ?auto_21991 ) ( AVAILABLE ?auto_22029 ) ( SURFACE-AT ?auto_21991 ?auto_22018 ) ( ON ?auto_21991 ?auto_22013 ) ( CLEAR ?auto_21991 ) ( not ( = ?auto_21990 ?auto_21991 ) ) ( not ( = ?auto_21990 ?auto_22013 ) ) ( not ( = ?auto_21991 ?auto_22013 ) ) ( IS-CRATE ?auto_21990 ) ( AVAILABLE ?auto_22031 ) ( SURFACE-AT ?auto_21990 ?auto_22016 ) ( ON ?auto_21990 ?auto_22009 ) ( CLEAR ?auto_21990 ) ( not ( = ?auto_21989 ?auto_21990 ) ) ( not ( = ?auto_21989 ?auto_22009 ) ) ( not ( = ?auto_21990 ?auto_22009 ) ) ( SURFACE-AT ?auto_21988 ?auto_22006 ) ( CLEAR ?auto_21988 ) ( IS-CRATE ?auto_21989 ) ( AVAILABLE ?auto_22005 ) ( AVAILABLE ?auto_22035 ) ( SURFACE-AT ?auto_21989 ?auto_22024 ) ( ON ?auto_21989 ?auto_22027 ) ( CLEAR ?auto_21989 ) ( TRUCK-AT ?auto_22008 ?auto_22006 ) ( not ( = ?auto_21988 ?auto_21989 ) ) ( not ( = ?auto_21988 ?auto_22027 ) ) ( not ( = ?auto_21989 ?auto_22027 ) ) ( not ( = ?auto_21988 ?auto_21990 ) ) ( not ( = ?auto_21988 ?auto_22009 ) ) ( not ( = ?auto_21990 ?auto_22027 ) ) ( not ( = ?auto_22016 ?auto_22024 ) ) ( not ( = ?auto_22031 ?auto_22035 ) ) ( not ( = ?auto_22009 ?auto_22027 ) ) ( not ( = ?auto_21988 ?auto_21991 ) ) ( not ( = ?auto_21988 ?auto_22013 ) ) ( not ( = ?auto_21989 ?auto_21991 ) ) ( not ( = ?auto_21989 ?auto_22013 ) ) ( not ( = ?auto_21991 ?auto_22009 ) ) ( not ( = ?auto_21991 ?auto_22027 ) ) ( not ( = ?auto_22018 ?auto_22016 ) ) ( not ( = ?auto_22018 ?auto_22024 ) ) ( not ( = ?auto_22029 ?auto_22031 ) ) ( not ( = ?auto_22029 ?auto_22035 ) ) ( not ( = ?auto_22013 ?auto_22009 ) ) ( not ( = ?auto_22013 ?auto_22027 ) ) ( not ( = ?auto_21988 ?auto_21992 ) ) ( not ( = ?auto_21988 ?auto_22025 ) ) ( not ( = ?auto_21989 ?auto_21992 ) ) ( not ( = ?auto_21989 ?auto_22025 ) ) ( not ( = ?auto_21990 ?auto_21992 ) ) ( not ( = ?auto_21990 ?auto_22025 ) ) ( not ( = ?auto_21992 ?auto_22013 ) ) ( not ( = ?auto_21992 ?auto_22009 ) ) ( not ( = ?auto_21992 ?auto_22027 ) ) ( not ( = ?auto_22030 ?auto_22018 ) ) ( not ( = ?auto_22030 ?auto_22016 ) ) ( not ( = ?auto_22030 ?auto_22024 ) ) ( not ( = ?auto_22026 ?auto_22029 ) ) ( not ( = ?auto_22026 ?auto_22031 ) ) ( not ( = ?auto_22026 ?auto_22035 ) ) ( not ( = ?auto_22025 ?auto_22013 ) ) ( not ( = ?auto_22025 ?auto_22009 ) ) ( not ( = ?auto_22025 ?auto_22027 ) ) ( not ( = ?auto_21988 ?auto_21993 ) ) ( not ( = ?auto_21988 ?auto_22039 ) ) ( not ( = ?auto_21989 ?auto_21993 ) ) ( not ( = ?auto_21989 ?auto_22039 ) ) ( not ( = ?auto_21990 ?auto_21993 ) ) ( not ( = ?auto_21990 ?auto_22039 ) ) ( not ( = ?auto_21991 ?auto_21993 ) ) ( not ( = ?auto_21991 ?auto_22039 ) ) ( not ( = ?auto_21993 ?auto_22025 ) ) ( not ( = ?auto_21993 ?auto_22013 ) ) ( not ( = ?auto_21993 ?auto_22009 ) ) ( not ( = ?auto_21993 ?auto_22027 ) ) ( not ( = ?auto_22038 ?auto_22030 ) ) ( not ( = ?auto_22038 ?auto_22018 ) ) ( not ( = ?auto_22038 ?auto_22016 ) ) ( not ( = ?auto_22038 ?auto_22024 ) ) ( not ( = ?auto_22010 ?auto_22026 ) ) ( not ( = ?auto_22010 ?auto_22029 ) ) ( not ( = ?auto_22010 ?auto_22031 ) ) ( not ( = ?auto_22010 ?auto_22035 ) ) ( not ( = ?auto_22039 ?auto_22025 ) ) ( not ( = ?auto_22039 ?auto_22013 ) ) ( not ( = ?auto_22039 ?auto_22009 ) ) ( not ( = ?auto_22039 ?auto_22027 ) ) ( not ( = ?auto_21988 ?auto_21996 ) ) ( not ( = ?auto_21988 ?auto_22036 ) ) ( not ( = ?auto_21989 ?auto_21996 ) ) ( not ( = ?auto_21989 ?auto_22036 ) ) ( not ( = ?auto_21990 ?auto_21996 ) ) ( not ( = ?auto_21990 ?auto_22036 ) ) ( not ( = ?auto_21991 ?auto_21996 ) ) ( not ( = ?auto_21991 ?auto_22036 ) ) ( not ( = ?auto_21992 ?auto_21996 ) ) ( not ( = ?auto_21992 ?auto_22036 ) ) ( not ( = ?auto_21996 ?auto_22039 ) ) ( not ( = ?auto_21996 ?auto_22025 ) ) ( not ( = ?auto_21996 ?auto_22013 ) ) ( not ( = ?auto_21996 ?auto_22009 ) ) ( not ( = ?auto_21996 ?auto_22027 ) ) ( not ( = ?auto_22019 ?auto_22038 ) ) ( not ( = ?auto_22019 ?auto_22030 ) ) ( not ( = ?auto_22019 ?auto_22018 ) ) ( not ( = ?auto_22019 ?auto_22016 ) ) ( not ( = ?auto_22019 ?auto_22024 ) ) ( not ( = ?auto_22028 ?auto_22010 ) ) ( not ( = ?auto_22028 ?auto_22026 ) ) ( not ( = ?auto_22028 ?auto_22029 ) ) ( not ( = ?auto_22028 ?auto_22031 ) ) ( not ( = ?auto_22028 ?auto_22035 ) ) ( not ( = ?auto_22036 ?auto_22039 ) ) ( not ( = ?auto_22036 ?auto_22025 ) ) ( not ( = ?auto_22036 ?auto_22013 ) ) ( not ( = ?auto_22036 ?auto_22009 ) ) ( not ( = ?auto_22036 ?auto_22027 ) ) ( not ( = ?auto_21988 ?auto_21995 ) ) ( not ( = ?auto_21988 ?auto_22012 ) ) ( not ( = ?auto_21989 ?auto_21995 ) ) ( not ( = ?auto_21989 ?auto_22012 ) ) ( not ( = ?auto_21990 ?auto_21995 ) ) ( not ( = ?auto_21990 ?auto_22012 ) ) ( not ( = ?auto_21991 ?auto_21995 ) ) ( not ( = ?auto_21991 ?auto_22012 ) ) ( not ( = ?auto_21992 ?auto_21995 ) ) ( not ( = ?auto_21992 ?auto_22012 ) ) ( not ( = ?auto_21993 ?auto_21995 ) ) ( not ( = ?auto_21993 ?auto_22012 ) ) ( not ( = ?auto_21995 ?auto_22036 ) ) ( not ( = ?auto_21995 ?auto_22039 ) ) ( not ( = ?auto_21995 ?auto_22025 ) ) ( not ( = ?auto_21995 ?auto_22013 ) ) ( not ( = ?auto_21995 ?auto_22009 ) ) ( not ( = ?auto_21995 ?auto_22027 ) ) ( not ( = ?auto_22011 ?auto_22019 ) ) ( not ( = ?auto_22011 ?auto_22038 ) ) ( not ( = ?auto_22011 ?auto_22030 ) ) ( not ( = ?auto_22011 ?auto_22018 ) ) ( not ( = ?auto_22011 ?auto_22016 ) ) ( not ( = ?auto_22011 ?auto_22024 ) ) ( not ( = ?auto_22034 ?auto_22028 ) ) ( not ( = ?auto_22034 ?auto_22010 ) ) ( not ( = ?auto_22034 ?auto_22026 ) ) ( not ( = ?auto_22034 ?auto_22029 ) ) ( not ( = ?auto_22034 ?auto_22031 ) ) ( not ( = ?auto_22034 ?auto_22035 ) ) ( not ( = ?auto_22012 ?auto_22036 ) ) ( not ( = ?auto_22012 ?auto_22039 ) ) ( not ( = ?auto_22012 ?auto_22025 ) ) ( not ( = ?auto_22012 ?auto_22013 ) ) ( not ( = ?auto_22012 ?auto_22009 ) ) ( not ( = ?auto_22012 ?auto_22027 ) ) ( not ( = ?auto_21988 ?auto_21994 ) ) ( not ( = ?auto_21988 ?auto_22037 ) ) ( not ( = ?auto_21989 ?auto_21994 ) ) ( not ( = ?auto_21989 ?auto_22037 ) ) ( not ( = ?auto_21990 ?auto_21994 ) ) ( not ( = ?auto_21990 ?auto_22037 ) ) ( not ( = ?auto_21991 ?auto_21994 ) ) ( not ( = ?auto_21991 ?auto_22037 ) ) ( not ( = ?auto_21992 ?auto_21994 ) ) ( not ( = ?auto_21992 ?auto_22037 ) ) ( not ( = ?auto_21993 ?auto_21994 ) ) ( not ( = ?auto_21993 ?auto_22037 ) ) ( not ( = ?auto_21996 ?auto_21994 ) ) ( not ( = ?auto_21996 ?auto_22037 ) ) ( not ( = ?auto_21994 ?auto_22012 ) ) ( not ( = ?auto_21994 ?auto_22036 ) ) ( not ( = ?auto_21994 ?auto_22039 ) ) ( not ( = ?auto_21994 ?auto_22025 ) ) ( not ( = ?auto_21994 ?auto_22013 ) ) ( not ( = ?auto_21994 ?auto_22009 ) ) ( not ( = ?auto_21994 ?auto_22027 ) ) ( not ( = ?auto_22022 ?auto_22011 ) ) ( not ( = ?auto_22022 ?auto_22019 ) ) ( not ( = ?auto_22022 ?auto_22038 ) ) ( not ( = ?auto_22022 ?auto_22030 ) ) ( not ( = ?auto_22022 ?auto_22018 ) ) ( not ( = ?auto_22022 ?auto_22016 ) ) ( not ( = ?auto_22022 ?auto_22024 ) ) ( not ( = ?auto_22032 ?auto_22034 ) ) ( not ( = ?auto_22032 ?auto_22028 ) ) ( not ( = ?auto_22032 ?auto_22010 ) ) ( not ( = ?auto_22032 ?auto_22026 ) ) ( not ( = ?auto_22032 ?auto_22029 ) ) ( not ( = ?auto_22032 ?auto_22031 ) ) ( not ( = ?auto_22032 ?auto_22035 ) ) ( not ( = ?auto_22037 ?auto_22012 ) ) ( not ( = ?auto_22037 ?auto_22036 ) ) ( not ( = ?auto_22037 ?auto_22039 ) ) ( not ( = ?auto_22037 ?auto_22025 ) ) ( not ( = ?auto_22037 ?auto_22013 ) ) ( not ( = ?auto_22037 ?auto_22009 ) ) ( not ( = ?auto_22037 ?auto_22027 ) ) ( not ( = ?auto_21988 ?auto_21997 ) ) ( not ( = ?auto_21988 ?auto_22014 ) ) ( not ( = ?auto_21989 ?auto_21997 ) ) ( not ( = ?auto_21989 ?auto_22014 ) ) ( not ( = ?auto_21990 ?auto_21997 ) ) ( not ( = ?auto_21990 ?auto_22014 ) ) ( not ( = ?auto_21991 ?auto_21997 ) ) ( not ( = ?auto_21991 ?auto_22014 ) ) ( not ( = ?auto_21992 ?auto_21997 ) ) ( not ( = ?auto_21992 ?auto_22014 ) ) ( not ( = ?auto_21993 ?auto_21997 ) ) ( not ( = ?auto_21993 ?auto_22014 ) ) ( not ( = ?auto_21996 ?auto_21997 ) ) ( not ( = ?auto_21996 ?auto_22014 ) ) ( not ( = ?auto_21995 ?auto_21997 ) ) ( not ( = ?auto_21995 ?auto_22014 ) ) ( not ( = ?auto_21997 ?auto_22037 ) ) ( not ( = ?auto_21997 ?auto_22012 ) ) ( not ( = ?auto_21997 ?auto_22036 ) ) ( not ( = ?auto_21997 ?auto_22039 ) ) ( not ( = ?auto_21997 ?auto_22025 ) ) ( not ( = ?auto_21997 ?auto_22013 ) ) ( not ( = ?auto_21997 ?auto_22009 ) ) ( not ( = ?auto_21997 ?auto_22027 ) ) ( not ( = ?auto_22014 ?auto_22037 ) ) ( not ( = ?auto_22014 ?auto_22012 ) ) ( not ( = ?auto_22014 ?auto_22036 ) ) ( not ( = ?auto_22014 ?auto_22039 ) ) ( not ( = ?auto_22014 ?auto_22025 ) ) ( not ( = ?auto_22014 ?auto_22013 ) ) ( not ( = ?auto_22014 ?auto_22009 ) ) ( not ( = ?auto_22014 ?auto_22027 ) ) ( not ( = ?auto_21988 ?auto_21999 ) ) ( not ( = ?auto_21988 ?auto_22021 ) ) ( not ( = ?auto_21989 ?auto_21999 ) ) ( not ( = ?auto_21989 ?auto_22021 ) ) ( not ( = ?auto_21990 ?auto_21999 ) ) ( not ( = ?auto_21990 ?auto_22021 ) ) ( not ( = ?auto_21991 ?auto_21999 ) ) ( not ( = ?auto_21991 ?auto_22021 ) ) ( not ( = ?auto_21992 ?auto_21999 ) ) ( not ( = ?auto_21992 ?auto_22021 ) ) ( not ( = ?auto_21993 ?auto_21999 ) ) ( not ( = ?auto_21993 ?auto_22021 ) ) ( not ( = ?auto_21996 ?auto_21999 ) ) ( not ( = ?auto_21996 ?auto_22021 ) ) ( not ( = ?auto_21995 ?auto_21999 ) ) ( not ( = ?auto_21995 ?auto_22021 ) ) ( not ( = ?auto_21994 ?auto_21999 ) ) ( not ( = ?auto_21994 ?auto_22021 ) ) ( not ( = ?auto_21999 ?auto_22014 ) ) ( not ( = ?auto_21999 ?auto_22037 ) ) ( not ( = ?auto_21999 ?auto_22012 ) ) ( not ( = ?auto_21999 ?auto_22036 ) ) ( not ( = ?auto_21999 ?auto_22039 ) ) ( not ( = ?auto_21999 ?auto_22025 ) ) ( not ( = ?auto_21999 ?auto_22013 ) ) ( not ( = ?auto_21999 ?auto_22009 ) ) ( not ( = ?auto_21999 ?auto_22027 ) ) ( not ( = ?auto_22021 ?auto_22014 ) ) ( not ( = ?auto_22021 ?auto_22037 ) ) ( not ( = ?auto_22021 ?auto_22012 ) ) ( not ( = ?auto_22021 ?auto_22036 ) ) ( not ( = ?auto_22021 ?auto_22039 ) ) ( not ( = ?auto_22021 ?auto_22025 ) ) ( not ( = ?auto_22021 ?auto_22013 ) ) ( not ( = ?auto_22021 ?auto_22009 ) ) ( not ( = ?auto_22021 ?auto_22027 ) ) ( not ( = ?auto_21988 ?auto_21998 ) ) ( not ( = ?auto_21988 ?auto_22033 ) ) ( not ( = ?auto_21989 ?auto_21998 ) ) ( not ( = ?auto_21989 ?auto_22033 ) ) ( not ( = ?auto_21990 ?auto_21998 ) ) ( not ( = ?auto_21990 ?auto_22033 ) ) ( not ( = ?auto_21991 ?auto_21998 ) ) ( not ( = ?auto_21991 ?auto_22033 ) ) ( not ( = ?auto_21992 ?auto_21998 ) ) ( not ( = ?auto_21992 ?auto_22033 ) ) ( not ( = ?auto_21993 ?auto_21998 ) ) ( not ( = ?auto_21993 ?auto_22033 ) ) ( not ( = ?auto_21996 ?auto_21998 ) ) ( not ( = ?auto_21996 ?auto_22033 ) ) ( not ( = ?auto_21995 ?auto_21998 ) ) ( not ( = ?auto_21995 ?auto_22033 ) ) ( not ( = ?auto_21994 ?auto_21998 ) ) ( not ( = ?auto_21994 ?auto_22033 ) ) ( not ( = ?auto_21997 ?auto_21998 ) ) ( not ( = ?auto_21997 ?auto_22033 ) ) ( not ( = ?auto_21998 ?auto_22021 ) ) ( not ( = ?auto_21998 ?auto_22014 ) ) ( not ( = ?auto_21998 ?auto_22037 ) ) ( not ( = ?auto_21998 ?auto_22012 ) ) ( not ( = ?auto_21998 ?auto_22036 ) ) ( not ( = ?auto_21998 ?auto_22039 ) ) ( not ( = ?auto_21998 ?auto_22025 ) ) ( not ( = ?auto_21998 ?auto_22013 ) ) ( not ( = ?auto_21998 ?auto_22009 ) ) ( not ( = ?auto_21998 ?auto_22027 ) ) ( not ( = ?auto_22033 ?auto_22021 ) ) ( not ( = ?auto_22033 ?auto_22014 ) ) ( not ( = ?auto_22033 ?auto_22037 ) ) ( not ( = ?auto_22033 ?auto_22012 ) ) ( not ( = ?auto_22033 ?auto_22036 ) ) ( not ( = ?auto_22033 ?auto_22039 ) ) ( not ( = ?auto_22033 ?auto_22025 ) ) ( not ( = ?auto_22033 ?auto_22013 ) ) ( not ( = ?auto_22033 ?auto_22009 ) ) ( not ( = ?auto_22033 ?auto_22027 ) ) ( not ( = ?auto_21988 ?auto_22000 ) ) ( not ( = ?auto_21988 ?auto_22015 ) ) ( not ( = ?auto_21989 ?auto_22000 ) ) ( not ( = ?auto_21989 ?auto_22015 ) ) ( not ( = ?auto_21990 ?auto_22000 ) ) ( not ( = ?auto_21990 ?auto_22015 ) ) ( not ( = ?auto_21991 ?auto_22000 ) ) ( not ( = ?auto_21991 ?auto_22015 ) ) ( not ( = ?auto_21992 ?auto_22000 ) ) ( not ( = ?auto_21992 ?auto_22015 ) ) ( not ( = ?auto_21993 ?auto_22000 ) ) ( not ( = ?auto_21993 ?auto_22015 ) ) ( not ( = ?auto_21996 ?auto_22000 ) ) ( not ( = ?auto_21996 ?auto_22015 ) ) ( not ( = ?auto_21995 ?auto_22000 ) ) ( not ( = ?auto_21995 ?auto_22015 ) ) ( not ( = ?auto_21994 ?auto_22000 ) ) ( not ( = ?auto_21994 ?auto_22015 ) ) ( not ( = ?auto_21997 ?auto_22000 ) ) ( not ( = ?auto_21997 ?auto_22015 ) ) ( not ( = ?auto_21999 ?auto_22000 ) ) ( not ( = ?auto_21999 ?auto_22015 ) ) ( not ( = ?auto_22000 ?auto_22033 ) ) ( not ( = ?auto_22000 ?auto_22021 ) ) ( not ( = ?auto_22000 ?auto_22014 ) ) ( not ( = ?auto_22000 ?auto_22037 ) ) ( not ( = ?auto_22000 ?auto_22012 ) ) ( not ( = ?auto_22000 ?auto_22036 ) ) ( not ( = ?auto_22000 ?auto_22039 ) ) ( not ( = ?auto_22000 ?auto_22025 ) ) ( not ( = ?auto_22000 ?auto_22013 ) ) ( not ( = ?auto_22000 ?auto_22009 ) ) ( not ( = ?auto_22000 ?auto_22027 ) ) ( not ( = ?auto_22015 ?auto_22033 ) ) ( not ( = ?auto_22015 ?auto_22021 ) ) ( not ( = ?auto_22015 ?auto_22014 ) ) ( not ( = ?auto_22015 ?auto_22037 ) ) ( not ( = ?auto_22015 ?auto_22012 ) ) ( not ( = ?auto_22015 ?auto_22036 ) ) ( not ( = ?auto_22015 ?auto_22039 ) ) ( not ( = ?auto_22015 ?auto_22025 ) ) ( not ( = ?auto_22015 ?auto_22013 ) ) ( not ( = ?auto_22015 ?auto_22009 ) ) ( not ( = ?auto_22015 ?auto_22027 ) ) ( not ( = ?auto_21988 ?auto_22002 ) ) ( not ( = ?auto_21988 ?auto_22017 ) ) ( not ( = ?auto_21989 ?auto_22002 ) ) ( not ( = ?auto_21989 ?auto_22017 ) ) ( not ( = ?auto_21990 ?auto_22002 ) ) ( not ( = ?auto_21990 ?auto_22017 ) ) ( not ( = ?auto_21991 ?auto_22002 ) ) ( not ( = ?auto_21991 ?auto_22017 ) ) ( not ( = ?auto_21992 ?auto_22002 ) ) ( not ( = ?auto_21992 ?auto_22017 ) ) ( not ( = ?auto_21993 ?auto_22002 ) ) ( not ( = ?auto_21993 ?auto_22017 ) ) ( not ( = ?auto_21996 ?auto_22002 ) ) ( not ( = ?auto_21996 ?auto_22017 ) ) ( not ( = ?auto_21995 ?auto_22002 ) ) ( not ( = ?auto_21995 ?auto_22017 ) ) ( not ( = ?auto_21994 ?auto_22002 ) ) ( not ( = ?auto_21994 ?auto_22017 ) ) ( not ( = ?auto_21997 ?auto_22002 ) ) ( not ( = ?auto_21997 ?auto_22017 ) ) ( not ( = ?auto_21999 ?auto_22002 ) ) ( not ( = ?auto_21999 ?auto_22017 ) ) ( not ( = ?auto_21998 ?auto_22002 ) ) ( not ( = ?auto_21998 ?auto_22017 ) ) ( not ( = ?auto_22002 ?auto_22015 ) ) ( not ( = ?auto_22002 ?auto_22033 ) ) ( not ( = ?auto_22002 ?auto_22021 ) ) ( not ( = ?auto_22002 ?auto_22014 ) ) ( not ( = ?auto_22002 ?auto_22037 ) ) ( not ( = ?auto_22002 ?auto_22012 ) ) ( not ( = ?auto_22002 ?auto_22036 ) ) ( not ( = ?auto_22002 ?auto_22039 ) ) ( not ( = ?auto_22002 ?auto_22025 ) ) ( not ( = ?auto_22002 ?auto_22013 ) ) ( not ( = ?auto_22002 ?auto_22009 ) ) ( not ( = ?auto_22002 ?auto_22027 ) ) ( not ( = ?auto_22020 ?auto_22038 ) ) ( not ( = ?auto_22020 ?auto_22016 ) ) ( not ( = ?auto_22020 ?auto_22018 ) ) ( not ( = ?auto_22020 ?auto_22024 ) ) ( not ( = ?auto_22020 ?auto_22022 ) ) ( not ( = ?auto_22020 ?auto_22011 ) ) ( not ( = ?auto_22020 ?auto_22019 ) ) ( not ( = ?auto_22020 ?auto_22030 ) ) ( not ( = ?auto_22023 ?auto_22010 ) ) ( not ( = ?auto_22023 ?auto_22031 ) ) ( not ( = ?auto_22023 ?auto_22029 ) ) ( not ( = ?auto_22023 ?auto_22035 ) ) ( not ( = ?auto_22023 ?auto_22032 ) ) ( not ( = ?auto_22023 ?auto_22034 ) ) ( not ( = ?auto_22023 ?auto_22028 ) ) ( not ( = ?auto_22023 ?auto_22026 ) ) ( not ( = ?auto_22017 ?auto_22015 ) ) ( not ( = ?auto_22017 ?auto_22033 ) ) ( not ( = ?auto_22017 ?auto_22021 ) ) ( not ( = ?auto_22017 ?auto_22014 ) ) ( not ( = ?auto_22017 ?auto_22037 ) ) ( not ( = ?auto_22017 ?auto_22012 ) ) ( not ( = ?auto_22017 ?auto_22036 ) ) ( not ( = ?auto_22017 ?auto_22039 ) ) ( not ( = ?auto_22017 ?auto_22025 ) ) ( not ( = ?auto_22017 ?auto_22013 ) ) ( not ( = ?auto_22017 ?auto_22009 ) ) ( not ( = ?auto_22017 ?auto_22027 ) ) ( not ( = ?auto_21988 ?auto_22001 ) ) ( not ( = ?auto_21988 ?auto_22007 ) ) ( not ( = ?auto_21989 ?auto_22001 ) ) ( not ( = ?auto_21989 ?auto_22007 ) ) ( not ( = ?auto_21990 ?auto_22001 ) ) ( not ( = ?auto_21990 ?auto_22007 ) ) ( not ( = ?auto_21991 ?auto_22001 ) ) ( not ( = ?auto_21991 ?auto_22007 ) ) ( not ( = ?auto_21992 ?auto_22001 ) ) ( not ( = ?auto_21992 ?auto_22007 ) ) ( not ( = ?auto_21993 ?auto_22001 ) ) ( not ( = ?auto_21993 ?auto_22007 ) ) ( not ( = ?auto_21996 ?auto_22001 ) ) ( not ( = ?auto_21996 ?auto_22007 ) ) ( not ( = ?auto_21995 ?auto_22001 ) ) ( not ( = ?auto_21995 ?auto_22007 ) ) ( not ( = ?auto_21994 ?auto_22001 ) ) ( not ( = ?auto_21994 ?auto_22007 ) ) ( not ( = ?auto_21997 ?auto_22001 ) ) ( not ( = ?auto_21997 ?auto_22007 ) ) ( not ( = ?auto_21999 ?auto_22001 ) ) ( not ( = ?auto_21999 ?auto_22007 ) ) ( not ( = ?auto_21998 ?auto_22001 ) ) ( not ( = ?auto_21998 ?auto_22007 ) ) ( not ( = ?auto_22000 ?auto_22001 ) ) ( not ( = ?auto_22000 ?auto_22007 ) ) ( not ( = ?auto_22001 ?auto_22017 ) ) ( not ( = ?auto_22001 ?auto_22015 ) ) ( not ( = ?auto_22001 ?auto_22033 ) ) ( not ( = ?auto_22001 ?auto_22021 ) ) ( not ( = ?auto_22001 ?auto_22014 ) ) ( not ( = ?auto_22001 ?auto_22037 ) ) ( not ( = ?auto_22001 ?auto_22012 ) ) ( not ( = ?auto_22001 ?auto_22036 ) ) ( not ( = ?auto_22001 ?auto_22039 ) ) ( not ( = ?auto_22001 ?auto_22025 ) ) ( not ( = ?auto_22001 ?auto_22013 ) ) ( not ( = ?auto_22001 ?auto_22009 ) ) ( not ( = ?auto_22001 ?auto_22027 ) ) ( not ( = ?auto_22004 ?auto_22020 ) ) ( not ( = ?auto_22004 ?auto_22038 ) ) ( not ( = ?auto_22004 ?auto_22016 ) ) ( not ( = ?auto_22004 ?auto_22018 ) ) ( not ( = ?auto_22004 ?auto_22024 ) ) ( not ( = ?auto_22004 ?auto_22022 ) ) ( not ( = ?auto_22004 ?auto_22011 ) ) ( not ( = ?auto_22004 ?auto_22019 ) ) ( not ( = ?auto_22004 ?auto_22030 ) ) ( not ( = ?auto_22003 ?auto_22023 ) ) ( not ( = ?auto_22003 ?auto_22010 ) ) ( not ( = ?auto_22003 ?auto_22031 ) ) ( not ( = ?auto_22003 ?auto_22029 ) ) ( not ( = ?auto_22003 ?auto_22035 ) ) ( not ( = ?auto_22003 ?auto_22032 ) ) ( not ( = ?auto_22003 ?auto_22034 ) ) ( not ( = ?auto_22003 ?auto_22028 ) ) ( not ( = ?auto_22003 ?auto_22026 ) ) ( not ( = ?auto_22007 ?auto_22017 ) ) ( not ( = ?auto_22007 ?auto_22015 ) ) ( not ( = ?auto_22007 ?auto_22033 ) ) ( not ( = ?auto_22007 ?auto_22021 ) ) ( not ( = ?auto_22007 ?auto_22014 ) ) ( not ( = ?auto_22007 ?auto_22037 ) ) ( not ( = ?auto_22007 ?auto_22012 ) ) ( not ( = ?auto_22007 ?auto_22036 ) ) ( not ( = ?auto_22007 ?auto_22039 ) ) ( not ( = ?auto_22007 ?auto_22025 ) ) ( not ( = ?auto_22007 ?auto_22013 ) ) ( not ( = ?auto_22007 ?auto_22009 ) ) ( not ( = ?auto_22007 ?auto_22027 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_21988 ?auto_21989 ?auto_21990 ?auto_21991 ?auto_21992 ?auto_21993 ?auto_21996 ?auto_21995 ?auto_21994 ?auto_21997 ?auto_21999 ?auto_21998 ?auto_22000 ?auto_22002 )
      ( MAKE-1CRATE ?auto_22002 ?auto_22001 )
      ( MAKE-14CRATE-VERIFY ?auto_21988 ?auto_21989 ?auto_21990 ?auto_21991 ?auto_21992 ?auto_21993 ?auto_21996 ?auto_21995 ?auto_21994 ?auto_21997 ?auto_21999 ?auto_21998 ?auto_22000 ?auto_22002 ?auto_22001 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22042 - SURFACE
      ?auto_22043 - SURFACE
    )
    :vars
    (
      ?auto_22044 - HOIST
      ?auto_22045 - PLACE
      ?auto_22047 - PLACE
      ?auto_22048 - HOIST
      ?auto_22049 - SURFACE
      ?auto_22046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22044 ?auto_22045 ) ( SURFACE-AT ?auto_22042 ?auto_22045 ) ( CLEAR ?auto_22042 ) ( IS-CRATE ?auto_22043 ) ( AVAILABLE ?auto_22044 ) ( not ( = ?auto_22047 ?auto_22045 ) ) ( HOIST-AT ?auto_22048 ?auto_22047 ) ( AVAILABLE ?auto_22048 ) ( SURFACE-AT ?auto_22043 ?auto_22047 ) ( ON ?auto_22043 ?auto_22049 ) ( CLEAR ?auto_22043 ) ( TRUCK-AT ?auto_22046 ?auto_22045 ) ( not ( = ?auto_22042 ?auto_22043 ) ) ( not ( = ?auto_22042 ?auto_22049 ) ) ( not ( = ?auto_22043 ?auto_22049 ) ) ( not ( = ?auto_22044 ?auto_22048 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22046 ?auto_22045 ?auto_22047 )
      ( !LIFT ?auto_22048 ?auto_22043 ?auto_22049 ?auto_22047 )
      ( !LOAD ?auto_22048 ?auto_22043 ?auto_22046 ?auto_22047 )
      ( !DRIVE ?auto_22046 ?auto_22047 ?auto_22045 )
      ( !UNLOAD ?auto_22044 ?auto_22043 ?auto_22046 ?auto_22045 )
      ( !DROP ?auto_22044 ?auto_22043 ?auto_22042 ?auto_22045 )
      ( MAKE-1CRATE-VERIFY ?auto_22042 ?auto_22043 ) )
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
      ?auto_22074 - SURFACE
      ?auto_22073 - SURFACE
      ?auto_22072 - SURFACE
      ?auto_22075 - SURFACE
      ?auto_22077 - SURFACE
      ?auto_22076 - SURFACE
      ?auto_22078 - SURFACE
      ?auto_22080 - SURFACE
      ?auto_22079 - SURFACE
      ?auto_22081 - SURFACE
    )
    :vars
    (
      ?auto_22085 - HOIST
      ?auto_22083 - PLACE
      ?auto_22087 - PLACE
      ?auto_22084 - HOIST
      ?auto_22086 - SURFACE
      ?auto_22113 - PLACE
      ?auto_22119 - HOIST
      ?auto_22093 - SURFACE
      ?auto_22089 - PLACE
      ?auto_22095 - HOIST
      ?auto_22109 - SURFACE
      ?auto_22121 - PLACE
      ?auto_22098 - HOIST
      ?auto_22114 - SURFACE
      ?auto_22091 - PLACE
      ?auto_22120 - HOIST
      ?auto_22097 - SURFACE
      ?auto_22110 - PLACE
      ?auto_22111 - HOIST
      ?auto_22118 - SURFACE
      ?auto_22105 - PLACE
      ?auto_22106 - HOIST
      ?auto_22108 - SURFACE
      ?auto_22103 - PLACE
      ?auto_22100 - HOIST
      ?auto_22088 - SURFACE
      ?auto_22107 - PLACE
      ?auto_22090 - HOIST
      ?auto_22094 - SURFACE
      ?auto_22102 - PLACE
      ?auto_22092 - HOIST
      ?auto_22115 - SURFACE
      ?auto_22101 - SURFACE
      ?auto_22096 - PLACE
      ?auto_22116 - HOIST
      ?auto_22104 - SURFACE
      ?auto_22099 - SURFACE
      ?auto_22117 - SURFACE
      ?auto_22112 - SURFACE
      ?auto_22082 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22085 ?auto_22083 ) ( IS-CRATE ?auto_22081 ) ( not ( = ?auto_22087 ?auto_22083 ) ) ( HOIST-AT ?auto_22084 ?auto_22087 ) ( AVAILABLE ?auto_22084 ) ( SURFACE-AT ?auto_22081 ?auto_22087 ) ( ON ?auto_22081 ?auto_22086 ) ( CLEAR ?auto_22081 ) ( not ( = ?auto_22079 ?auto_22081 ) ) ( not ( = ?auto_22079 ?auto_22086 ) ) ( not ( = ?auto_22081 ?auto_22086 ) ) ( not ( = ?auto_22085 ?auto_22084 ) ) ( IS-CRATE ?auto_22079 ) ( not ( = ?auto_22113 ?auto_22083 ) ) ( HOIST-AT ?auto_22119 ?auto_22113 ) ( AVAILABLE ?auto_22119 ) ( SURFACE-AT ?auto_22079 ?auto_22113 ) ( ON ?auto_22079 ?auto_22093 ) ( CLEAR ?auto_22079 ) ( not ( = ?auto_22080 ?auto_22079 ) ) ( not ( = ?auto_22080 ?auto_22093 ) ) ( not ( = ?auto_22079 ?auto_22093 ) ) ( not ( = ?auto_22085 ?auto_22119 ) ) ( IS-CRATE ?auto_22080 ) ( not ( = ?auto_22089 ?auto_22083 ) ) ( HOIST-AT ?auto_22095 ?auto_22089 ) ( AVAILABLE ?auto_22095 ) ( SURFACE-AT ?auto_22080 ?auto_22089 ) ( ON ?auto_22080 ?auto_22109 ) ( CLEAR ?auto_22080 ) ( not ( = ?auto_22078 ?auto_22080 ) ) ( not ( = ?auto_22078 ?auto_22109 ) ) ( not ( = ?auto_22080 ?auto_22109 ) ) ( not ( = ?auto_22085 ?auto_22095 ) ) ( IS-CRATE ?auto_22078 ) ( not ( = ?auto_22121 ?auto_22083 ) ) ( HOIST-AT ?auto_22098 ?auto_22121 ) ( SURFACE-AT ?auto_22078 ?auto_22121 ) ( ON ?auto_22078 ?auto_22114 ) ( CLEAR ?auto_22078 ) ( not ( = ?auto_22076 ?auto_22078 ) ) ( not ( = ?auto_22076 ?auto_22114 ) ) ( not ( = ?auto_22078 ?auto_22114 ) ) ( not ( = ?auto_22085 ?auto_22098 ) ) ( IS-CRATE ?auto_22076 ) ( not ( = ?auto_22091 ?auto_22083 ) ) ( HOIST-AT ?auto_22120 ?auto_22091 ) ( SURFACE-AT ?auto_22076 ?auto_22091 ) ( ON ?auto_22076 ?auto_22097 ) ( CLEAR ?auto_22076 ) ( not ( = ?auto_22077 ?auto_22076 ) ) ( not ( = ?auto_22077 ?auto_22097 ) ) ( not ( = ?auto_22076 ?auto_22097 ) ) ( not ( = ?auto_22085 ?auto_22120 ) ) ( IS-CRATE ?auto_22077 ) ( not ( = ?auto_22110 ?auto_22083 ) ) ( HOIST-AT ?auto_22111 ?auto_22110 ) ( SURFACE-AT ?auto_22077 ?auto_22110 ) ( ON ?auto_22077 ?auto_22118 ) ( CLEAR ?auto_22077 ) ( not ( = ?auto_22075 ?auto_22077 ) ) ( not ( = ?auto_22075 ?auto_22118 ) ) ( not ( = ?auto_22077 ?auto_22118 ) ) ( not ( = ?auto_22085 ?auto_22111 ) ) ( IS-CRATE ?auto_22075 ) ( not ( = ?auto_22105 ?auto_22083 ) ) ( HOIST-AT ?auto_22106 ?auto_22105 ) ( SURFACE-AT ?auto_22075 ?auto_22105 ) ( ON ?auto_22075 ?auto_22108 ) ( CLEAR ?auto_22075 ) ( not ( = ?auto_22072 ?auto_22075 ) ) ( not ( = ?auto_22072 ?auto_22108 ) ) ( not ( = ?auto_22075 ?auto_22108 ) ) ( not ( = ?auto_22085 ?auto_22106 ) ) ( IS-CRATE ?auto_22072 ) ( not ( = ?auto_22103 ?auto_22083 ) ) ( HOIST-AT ?auto_22100 ?auto_22103 ) ( AVAILABLE ?auto_22100 ) ( SURFACE-AT ?auto_22072 ?auto_22103 ) ( ON ?auto_22072 ?auto_22088 ) ( CLEAR ?auto_22072 ) ( not ( = ?auto_22073 ?auto_22072 ) ) ( not ( = ?auto_22073 ?auto_22088 ) ) ( not ( = ?auto_22072 ?auto_22088 ) ) ( not ( = ?auto_22085 ?auto_22100 ) ) ( IS-CRATE ?auto_22073 ) ( not ( = ?auto_22107 ?auto_22083 ) ) ( HOIST-AT ?auto_22090 ?auto_22107 ) ( AVAILABLE ?auto_22090 ) ( SURFACE-AT ?auto_22073 ?auto_22107 ) ( ON ?auto_22073 ?auto_22094 ) ( CLEAR ?auto_22073 ) ( not ( = ?auto_22074 ?auto_22073 ) ) ( not ( = ?auto_22074 ?auto_22094 ) ) ( not ( = ?auto_22073 ?auto_22094 ) ) ( not ( = ?auto_22085 ?auto_22090 ) ) ( IS-CRATE ?auto_22074 ) ( not ( = ?auto_22102 ?auto_22083 ) ) ( HOIST-AT ?auto_22092 ?auto_22102 ) ( AVAILABLE ?auto_22092 ) ( SURFACE-AT ?auto_22074 ?auto_22102 ) ( ON ?auto_22074 ?auto_22115 ) ( CLEAR ?auto_22074 ) ( not ( = ?auto_22071 ?auto_22074 ) ) ( not ( = ?auto_22071 ?auto_22115 ) ) ( not ( = ?auto_22074 ?auto_22115 ) ) ( not ( = ?auto_22085 ?auto_22092 ) ) ( IS-CRATE ?auto_22071 ) ( AVAILABLE ?auto_22098 ) ( SURFACE-AT ?auto_22071 ?auto_22121 ) ( ON ?auto_22071 ?auto_22101 ) ( CLEAR ?auto_22071 ) ( not ( = ?auto_22070 ?auto_22071 ) ) ( not ( = ?auto_22070 ?auto_22101 ) ) ( not ( = ?auto_22071 ?auto_22101 ) ) ( IS-CRATE ?auto_22070 ) ( not ( = ?auto_22096 ?auto_22083 ) ) ( HOIST-AT ?auto_22116 ?auto_22096 ) ( AVAILABLE ?auto_22116 ) ( SURFACE-AT ?auto_22070 ?auto_22096 ) ( ON ?auto_22070 ?auto_22104 ) ( CLEAR ?auto_22070 ) ( not ( = ?auto_22069 ?auto_22070 ) ) ( not ( = ?auto_22069 ?auto_22104 ) ) ( not ( = ?auto_22070 ?auto_22104 ) ) ( not ( = ?auto_22085 ?auto_22116 ) ) ( IS-CRATE ?auto_22069 ) ( AVAILABLE ?auto_22111 ) ( SURFACE-AT ?auto_22069 ?auto_22110 ) ( ON ?auto_22069 ?auto_22099 ) ( CLEAR ?auto_22069 ) ( not ( = ?auto_22068 ?auto_22069 ) ) ( not ( = ?auto_22068 ?auto_22099 ) ) ( not ( = ?auto_22069 ?auto_22099 ) ) ( IS-CRATE ?auto_22068 ) ( AVAILABLE ?auto_22120 ) ( SURFACE-AT ?auto_22068 ?auto_22091 ) ( ON ?auto_22068 ?auto_22117 ) ( CLEAR ?auto_22068 ) ( not ( = ?auto_22067 ?auto_22068 ) ) ( not ( = ?auto_22067 ?auto_22117 ) ) ( not ( = ?auto_22068 ?auto_22117 ) ) ( SURFACE-AT ?auto_22066 ?auto_22083 ) ( CLEAR ?auto_22066 ) ( IS-CRATE ?auto_22067 ) ( AVAILABLE ?auto_22085 ) ( AVAILABLE ?auto_22106 ) ( SURFACE-AT ?auto_22067 ?auto_22105 ) ( ON ?auto_22067 ?auto_22112 ) ( CLEAR ?auto_22067 ) ( TRUCK-AT ?auto_22082 ?auto_22083 ) ( not ( = ?auto_22066 ?auto_22067 ) ) ( not ( = ?auto_22066 ?auto_22112 ) ) ( not ( = ?auto_22067 ?auto_22112 ) ) ( not ( = ?auto_22066 ?auto_22068 ) ) ( not ( = ?auto_22066 ?auto_22117 ) ) ( not ( = ?auto_22068 ?auto_22112 ) ) ( not ( = ?auto_22091 ?auto_22105 ) ) ( not ( = ?auto_22120 ?auto_22106 ) ) ( not ( = ?auto_22117 ?auto_22112 ) ) ( not ( = ?auto_22066 ?auto_22069 ) ) ( not ( = ?auto_22066 ?auto_22099 ) ) ( not ( = ?auto_22067 ?auto_22069 ) ) ( not ( = ?auto_22067 ?auto_22099 ) ) ( not ( = ?auto_22069 ?auto_22117 ) ) ( not ( = ?auto_22069 ?auto_22112 ) ) ( not ( = ?auto_22110 ?auto_22091 ) ) ( not ( = ?auto_22110 ?auto_22105 ) ) ( not ( = ?auto_22111 ?auto_22120 ) ) ( not ( = ?auto_22111 ?auto_22106 ) ) ( not ( = ?auto_22099 ?auto_22117 ) ) ( not ( = ?auto_22099 ?auto_22112 ) ) ( not ( = ?auto_22066 ?auto_22070 ) ) ( not ( = ?auto_22066 ?auto_22104 ) ) ( not ( = ?auto_22067 ?auto_22070 ) ) ( not ( = ?auto_22067 ?auto_22104 ) ) ( not ( = ?auto_22068 ?auto_22070 ) ) ( not ( = ?auto_22068 ?auto_22104 ) ) ( not ( = ?auto_22070 ?auto_22099 ) ) ( not ( = ?auto_22070 ?auto_22117 ) ) ( not ( = ?auto_22070 ?auto_22112 ) ) ( not ( = ?auto_22096 ?auto_22110 ) ) ( not ( = ?auto_22096 ?auto_22091 ) ) ( not ( = ?auto_22096 ?auto_22105 ) ) ( not ( = ?auto_22116 ?auto_22111 ) ) ( not ( = ?auto_22116 ?auto_22120 ) ) ( not ( = ?auto_22116 ?auto_22106 ) ) ( not ( = ?auto_22104 ?auto_22099 ) ) ( not ( = ?auto_22104 ?auto_22117 ) ) ( not ( = ?auto_22104 ?auto_22112 ) ) ( not ( = ?auto_22066 ?auto_22071 ) ) ( not ( = ?auto_22066 ?auto_22101 ) ) ( not ( = ?auto_22067 ?auto_22071 ) ) ( not ( = ?auto_22067 ?auto_22101 ) ) ( not ( = ?auto_22068 ?auto_22071 ) ) ( not ( = ?auto_22068 ?auto_22101 ) ) ( not ( = ?auto_22069 ?auto_22071 ) ) ( not ( = ?auto_22069 ?auto_22101 ) ) ( not ( = ?auto_22071 ?auto_22104 ) ) ( not ( = ?auto_22071 ?auto_22099 ) ) ( not ( = ?auto_22071 ?auto_22117 ) ) ( not ( = ?auto_22071 ?auto_22112 ) ) ( not ( = ?auto_22121 ?auto_22096 ) ) ( not ( = ?auto_22121 ?auto_22110 ) ) ( not ( = ?auto_22121 ?auto_22091 ) ) ( not ( = ?auto_22121 ?auto_22105 ) ) ( not ( = ?auto_22098 ?auto_22116 ) ) ( not ( = ?auto_22098 ?auto_22111 ) ) ( not ( = ?auto_22098 ?auto_22120 ) ) ( not ( = ?auto_22098 ?auto_22106 ) ) ( not ( = ?auto_22101 ?auto_22104 ) ) ( not ( = ?auto_22101 ?auto_22099 ) ) ( not ( = ?auto_22101 ?auto_22117 ) ) ( not ( = ?auto_22101 ?auto_22112 ) ) ( not ( = ?auto_22066 ?auto_22074 ) ) ( not ( = ?auto_22066 ?auto_22115 ) ) ( not ( = ?auto_22067 ?auto_22074 ) ) ( not ( = ?auto_22067 ?auto_22115 ) ) ( not ( = ?auto_22068 ?auto_22074 ) ) ( not ( = ?auto_22068 ?auto_22115 ) ) ( not ( = ?auto_22069 ?auto_22074 ) ) ( not ( = ?auto_22069 ?auto_22115 ) ) ( not ( = ?auto_22070 ?auto_22074 ) ) ( not ( = ?auto_22070 ?auto_22115 ) ) ( not ( = ?auto_22074 ?auto_22101 ) ) ( not ( = ?auto_22074 ?auto_22104 ) ) ( not ( = ?auto_22074 ?auto_22099 ) ) ( not ( = ?auto_22074 ?auto_22117 ) ) ( not ( = ?auto_22074 ?auto_22112 ) ) ( not ( = ?auto_22102 ?auto_22121 ) ) ( not ( = ?auto_22102 ?auto_22096 ) ) ( not ( = ?auto_22102 ?auto_22110 ) ) ( not ( = ?auto_22102 ?auto_22091 ) ) ( not ( = ?auto_22102 ?auto_22105 ) ) ( not ( = ?auto_22092 ?auto_22098 ) ) ( not ( = ?auto_22092 ?auto_22116 ) ) ( not ( = ?auto_22092 ?auto_22111 ) ) ( not ( = ?auto_22092 ?auto_22120 ) ) ( not ( = ?auto_22092 ?auto_22106 ) ) ( not ( = ?auto_22115 ?auto_22101 ) ) ( not ( = ?auto_22115 ?auto_22104 ) ) ( not ( = ?auto_22115 ?auto_22099 ) ) ( not ( = ?auto_22115 ?auto_22117 ) ) ( not ( = ?auto_22115 ?auto_22112 ) ) ( not ( = ?auto_22066 ?auto_22073 ) ) ( not ( = ?auto_22066 ?auto_22094 ) ) ( not ( = ?auto_22067 ?auto_22073 ) ) ( not ( = ?auto_22067 ?auto_22094 ) ) ( not ( = ?auto_22068 ?auto_22073 ) ) ( not ( = ?auto_22068 ?auto_22094 ) ) ( not ( = ?auto_22069 ?auto_22073 ) ) ( not ( = ?auto_22069 ?auto_22094 ) ) ( not ( = ?auto_22070 ?auto_22073 ) ) ( not ( = ?auto_22070 ?auto_22094 ) ) ( not ( = ?auto_22071 ?auto_22073 ) ) ( not ( = ?auto_22071 ?auto_22094 ) ) ( not ( = ?auto_22073 ?auto_22115 ) ) ( not ( = ?auto_22073 ?auto_22101 ) ) ( not ( = ?auto_22073 ?auto_22104 ) ) ( not ( = ?auto_22073 ?auto_22099 ) ) ( not ( = ?auto_22073 ?auto_22117 ) ) ( not ( = ?auto_22073 ?auto_22112 ) ) ( not ( = ?auto_22107 ?auto_22102 ) ) ( not ( = ?auto_22107 ?auto_22121 ) ) ( not ( = ?auto_22107 ?auto_22096 ) ) ( not ( = ?auto_22107 ?auto_22110 ) ) ( not ( = ?auto_22107 ?auto_22091 ) ) ( not ( = ?auto_22107 ?auto_22105 ) ) ( not ( = ?auto_22090 ?auto_22092 ) ) ( not ( = ?auto_22090 ?auto_22098 ) ) ( not ( = ?auto_22090 ?auto_22116 ) ) ( not ( = ?auto_22090 ?auto_22111 ) ) ( not ( = ?auto_22090 ?auto_22120 ) ) ( not ( = ?auto_22090 ?auto_22106 ) ) ( not ( = ?auto_22094 ?auto_22115 ) ) ( not ( = ?auto_22094 ?auto_22101 ) ) ( not ( = ?auto_22094 ?auto_22104 ) ) ( not ( = ?auto_22094 ?auto_22099 ) ) ( not ( = ?auto_22094 ?auto_22117 ) ) ( not ( = ?auto_22094 ?auto_22112 ) ) ( not ( = ?auto_22066 ?auto_22072 ) ) ( not ( = ?auto_22066 ?auto_22088 ) ) ( not ( = ?auto_22067 ?auto_22072 ) ) ( not ( = ?auto_22067 ?auto_22088 ) ) ( not ( = ?auto_22068 ?auto_22072 ) ) ( not ( = ?auto_22068 ?auto_22088 ) ) ( not ( = ?auto_22069 ?auto_22072 ) ) ( not ( = ?auto_22069 ?auto_22088 ) ) ( not ( = ?auto_22070 ?auto_22072 ) ) ( not ( = ?auto_22070 ?auto_22088 ) ) ( not ( = ?auto_22071 ?auto_22072 ) ) ( not ( = ?auto_22071 ?auto_22088 ) ) ( not ( = ?auto_22074 ?auto_22072 ) ) ( not ( = ?auto_22074 ?auto_22088 ) ) ( not ( = ?auto_22072 ?auto_22094 ) ) ( not ( = ?auto_22072 ?auto_22115 ) ) ( not ( = ?auto_22072 ?auto_22101 ) ) ( not ( = ?auto_22072 ?auto_22104 ) ) ( not ( = ?auto_22072 ?auto_22099 ) ) ( not ( = ?auto_22072 ?auto_22117 ) ) ( not ( = ?auto_22072 ?auto_22112 ) ) ( not ( = ?auto_22103 ?auto_22107 ) ) ( not ( = ?auto_22103 ?auto_22102 ) ) ( not ( = ?auto_22103 ?auto_22121 ) ) ( not ( = ?auto_22103 ?auto_22096 ) ) ( not ( = ?auto_22103 ?auto_22110 ) ) ( not ( = ?auto_22103 ?auto_22091 ) ) ( not ( = ?auto_22103 ?auto_22105 ) ) ( not ( = ?auto_22100 ?auto_22090 ) ) ( not ( = ?auto_22100 ?auto_22092 ) ) ( not ( = ?auto_22100 ?auto_22098 ) ) ( not ( = ?auto_22100 ?auto_22116 ) ) ( not ( = ?auto_22100 ?auto_22111 ) ) ( not ( = ?auto_22100 ?auto_22120 ) ) ( not ( = ?auto_22100 ?auto_22106 ) ) ( not ( = ?auto_22088 ?auto_22094 ) ) ( not ( = ?auto_22088 ?auto_22115 ) ) ( not ( = ?auto_22088 ?auto_22101 ) ) ( not ( = ?auto_22088 ?auto_22104 ) ) ( not ( = ?auto_22088 ?auto_22099 ) ) ( not ( = ?auto_22088 ?auto_22117 ) ) ( not ( = ?auto_22088 ?auto_22112 ) ) ( not ( = ?auto_22066 ?auto_22075 ) ) ( not ( = ?auto_22066 ?auto_22108 ) ) ( not ( = ?auto_22067 ?auto_22075 ) ) ( not ( = ?auto_22067 ?auto_22108 ) ) ( not ( = ?auto_22068 ?auto_22075 ) ) ( not ( = ?auto_22068 ?auto_22108 ) ) ( not ( = ?auto_22069 ?auto_22075 ) ) ( not ( = ?auto_22069 ?auto_22108 ) ) ( not ( = ?auto_22070 ?auto_22075 ) ) ( not ( = ?auto_22070 ?auto_22108 ) ) ( not ( = ?auto_22071 ?auto_22075 ) ) ( not ( = ?auto_22071 ?auto_22108 ) ) ( not ( = ?auto_22074 ?auto_22075 ) ) ( not ( = ?auto_22074 ?auto_22108 ) ) ( not ( = ?auto_22073 ?auto_22075 ) ) ( not ( = ?auto_22073 ?auto_22108 ) ) ( not ( = ?auto_22075 ?auto_22088 ) ) ( not ( = ?auto_22075 ?auto_22094 ) ) ( not ( = ?auto_22075 ?auto_22115 ) ) ( not ( = ?auto_22075 ?auto_22101 ) ) ( not ( = ?auto_22075 ?auto_22104 ) ) ( not ( = ?auto_22075 ?auto_22099 ) ) ( not ( = ?auto_22075 ?auto_22117 ) ) ( not ( = ?auto_22075 ?auto_22112 ) ) ( not ( = ?auto_22108 ?auto_22088 ) ) ( not ( = ?auto_22108 ?auto_22094 ) ) ( not ( = ?auto_22108 ?auto_22115 ) ) ( not ( = ?auto_22108 ?auto_22101 ) ) ( not ( = ?auto_22108 ?auto_22104 ) ) ( not ( = ?auto_22108 ?auto_22099 ) ) ( not ( = ?auto_22108 ?auto_22117 ) ) ( not ( = ?auto_22108 ?auto_22112 ) ) ( not ( = ?auto_22066 ?auto_22077 ) ) ( not ( = ?auto_22066 ?auto_22118 ) ) ( not ( = ?auto_22067 ?auto_22077 ) ) ( not ( = ?auto_22067 ?auto_22118 ) ) ( not ( = ?auto_22068 ?auto_22077 ) ) ( not ( = ?auto_22068 ?auto_22118 ) ) ( not ( = ?auto_22069 ?auto_22077 ) ) ( not ( = ?auto_22069 ?auto_22118 ) ) ( not ( = ?auto_22070 ?auto_22077 ) ) ( not ( = ?auto_22070 ?auto_22118 ) ) ( not ( = ?auto_22071 ?auto_22077 ) ) ( not ( = ?auto_22071 ?auto_22118 ) ) ( not ( = ?auto_22074 ?auto_22077 ) ) ( not ( = ?auto_22074 ?auto_22118 ) ) ( not ( = ?auto_22073 ?auto_22077 ) ) ( not ( = ?auto_22073 ?auto_22118 ) ) ( not ( = ?auto_22072 ?auto_22077 ) ) ( not ( = ?auto_22072 ?auto_22118 ) ) ( not ( = ?auto_22077 ?auto_22108 ) ) ( not ( = ?auto_22077 ?auto_22088 ) ) ( not ( = ?auto_22077 ?auto_22094 ) ) ( not ( = ?auto_22077 ?auto_22115 ) ) ( not ( = ?auto_22077 ?auto_22101 ) ) ( not ( = ?auto_22077 ?auto_22104 ) ) ( not ( = ?auto_22077 ?auto_22099 ) ) ( not ( = ?auto_22077 ?auto_22117 ) ) ( not ( = ?auto_22077 ?auto_22112 ) ) ( not ( = ?auto_22118 ?auto_22108 ) ) ( not ( = ?auto_22118 ?auto_22088 ) ) ( not ( = ?auto_22118 ?auto_22094 ) ) ( not ( = ?auto_22118 ?auto_22115 ) ) ( not ( = ?auto_22118 ?auto_22101 ) ) ( not ( = ?auto_22118 ?auto_22104 ) ) ( not ( = ?auto_22118 ?auto_22099 ) ) ( not ( = ?auto_22118 ?auto_22117 ) ) ( not ( = ?auto_22118 ?auto_22112 ) ) ( not ( = ?auto_22066 ?auto_22076 ) ) ( not ( = ?auto_22066 ?auto_22097 ) ) ( not ( = ?auto_22067 ?auto_22076 ) ) ( not ( = ?auto_22067 ?auto_22097 ) ) ( not ( = ?auto_22068 ?auto_22076 ) ) ( not ( = ?auto_22068 ?auto_22097 ) ) ( not ( = ?auto_22069 ?auto_22076 ) ) ( not ( = ?auto_22069 ?auto_22097 ) ) ( not ( = ?auto_22070 ?auto_22076 ) ) ( not ( = ?auto_22070 ?auto_22097 ) ) ( not ( = ?auto_22071 ?auto_22076 ) ) ( not ( = ?auto_22071 ?auto_22097 ) ) ( not ( = ?auto_22074 ?auto_22076 ) ) ( not ( = ?auto_22074 ?auto_22097 ) ) ( not ( = ?auto_22073 ?auto_22076 ) ) ( not ( = ?auto_22073 ?auto_22097 ) ) ( not ( = ?auto_22072 ?auto_22076 ) ) ( not ( = ?auto_22072 ?auto_22097 ) ) ( not ( = ?auto_22075 ?auto_22076 ) ) ( not ( = ?auto_22075 ?auto_22097 ) ) ( not ( = ?auto_22076 ?auto_22118 ) ) ( not ( = ?auto_22076 ?auto_22108 ) ) ( not ( = ?auto_22076 ?auto_22088 ) ) ( not ( = ?auto_22076 ?auto_22094 ) ) ( not ( = ?auto_22076 ?auto_22115 ) ) ( not ( = ?auto_22076 ?auto_22101 ) ) ( not ( = ?auto_22076 ?auto_22104 ) ) ( not ( = ?auto_22076 ?auto_22099 ) ) ( not ( = ?auto_22076 ?auto_22117 ) ) ( not ( = ?auto_22076 ?auto_22112 ) ) ( not ( = ?auto_22097 ?auto_22118 ) ) ( not ( = ?auto_22097 ?auto_22108 ) ) ( not ( = ?auto_22097 ?auto_22088 ) ) ( not ( = ?auto_22097 ?auto_22094 ) ) ( not ( = ?auto_22097 ?auto_22115 ) ) ( not ( = ?auto_22097 ?auto_22101 ) ) ( not ( = ?auto_22097 ?auto_22104 ) ) ( not ( = ?auto_22097 ?auto_22099 ) ) ( not ( = ?auto_22097 ?auto_22117 ) ) ( not ( = ?auto_22097 ?auto_22112 ) ) ( not ( = ?auto_22066 ?auto_22078 ) ) ( not ( = ?auto_22066 ?auto_22114 ) ) ( not ( = ?auto_22067 ?auto_22078 ) ) ( not ( = ?auto_22067 ?auto_22114 ) ) ( not ( = ?auto_22068 ?auto_22078 ) ) ( not ( = ?auto_22068 ?auto_22114 ) ) ( not ( = ?auto_22069 ?auto_22078 ) ) ( not ( = ?auto_22069 ?auto_22114 ) ) ( not ( = ?auto_22070 ?auto_22078 ) ) ( not ( = ?auto_22070 ?auto_22114 ) ) ( not ( = ?auto_22071 ?auto_22078 ) ) ( not ( = ?auto_22071 ?auto_22114 ) ) ( not ( = ?auto_22074 ?auto_22078 ) ) ( not ( = ?auto_22074 ?auto_22114 ) ) ( not ( = ?auto_22073 ?auto_22078 ) ) ( not ( = ?auto_22073 ?auto_22114 ) ) ( not ( = ?auto_22072 ?auto_22078 ) ) ( not ( = ?auto_22072 ?auto_22114 ) ) ( not ( = ?auto_22075 ?auto_22078 ) ) ( not ( = ?auto_22075 ?auto_22114 ) ) ( not ( = ?auto_22077 ?auto_22078 ) ) ( not ( = ?auto_22077 ?auto_22114 ) ) ( not ( = ?auto_22078 ?auto_22097 ) ) ( not ( = ?auto_22078 ?auto_22118 ) ) ( not ( = ?auto_22078 ?auto_22108 ) ) ( not ( = ?auto_22078 ?auto_22088 ) ) ( not ( = ?auto_22078 ?auto_22094 ) ) ( not ( = ?auto_22078 ?auto_22115 ) ) ( not ( = ?auto_22078 ?auto_22101 ) ) ( not ( = ?auto_22078 ?auto_22104 ) ) ( not ( = ?auto_22078 ?auto_22099 ) ) ( not ( = ?auto_22078 ?auto_22117 ) ) ( not ( = ?auto_22078 ?auto_22112 ) ) ( not ( = ?auto_22114 ?auto_22097 ) ) ( not ( = ?auto_22114 ?auto_22118 ) ) ( not ( = ?auto_22114 ?auto_22108 ) ) ( not ( = ?auto_22114 ?auto_22088 ) ) ( not ( = ?auto_22114 ?auto_22094 ) ) ( not ( = ?auto_22114 ?auto_22115 ) ) ( not ( = ?auto_22114 ?auto_22101 ) ) ( not ( = ?auto_22114 ?auto_22104 ) ) ( not ( = ?auto_22114 ?auto_22099 ) ) ( not ( = ?auto_22114 ?auto_22117 ) ) ( not ( = ?auto_22114 ?auto_22112 ) ) ( not ( = ?auto_22066 ?auto_22080 ) ) ( not ( = ?auto_22066 ?auto_22109 ) ) ( not ( = ?auto_22067 ?auto_22080 ) ) ( not ( = ?auto_22067 ?auto_22109 ) ) ( not ( = ?auto_22068 ?auto_22080 ) ) ( not ( = ?auto_22068 ?auto_22109 ) ) ( not ( = ?auto_22069 ?auto_22080 ) ) ( not ( = ?auto_22069 ?auto_22109 ) ) ( not ( = ?auto_22070 ?auto_22080 ) ) ( not ( = ?auto_22070 ?auto_22109 ) ) ( not ( = ?auto_22071 ?auto_22080 ) ) ( not ( = ?auto_22071 ?auto_22109 ) ) ( not ( = ?auto_22074 ?auto_22080 ) ) ( not ( = ?auto_22074 ?auto_22109 ) ) ( not ( = ?auto_22073 ?auto_22080 ) ) ( not ( = ?auto_22073 ?auto_22109 ) ) ( not ( = ?auto_22072 ?auto_22080 ) ) ( not ( = ?auto_22072 ?auto_22109 ) ) ( not ( = ?auto_22075 ?auto_22080 ) ) ( not ( = ?auto_22075 ?auto_22109 ) ) ( not ( = ?auto_22077 ?auto_22080 ) ) ( not ( = ?auto_22077 ?auto_22109 ) ) ( not ( = ?auto_22076 ?auto_22080 ) ) ( not ( = ?auto_22076 ?auto_22109 ) ) ( not ( = ?auto_22080 ?auto_22114 ) ) ( not ( = ?auto_22080 ?auto_22097 ) ) ( not ( = ?auto_22080 ?auto_22118 ) ) ( not ( = ?auto_22080 ?auto_22108 ) ) ( not ( = ?auto_22080 ?auto_22088 ) ) ( not ( = ?auto_22080 ?auto_22094 ) ) ( not ( = ?auto_22080 ?auto_22115 ) ) ( not ( = ?auto_22080 ?auto_22101 ) ) ( not ( = ?auto_22080 ?auto_22104 ) ) ( not ( = ?auto_22080 ?auto_22099 ) ) ( not ( = ?auto_22080 ?auto_22117 ) ) ( not ( = ?auto_22080 ?auto_22112 ) ) ( not ( = ?auto_22089 ?auto_22121 ) ) ( not ( = ?auto_22089 ?auto_22091 ) ) ( not ( = ?auto_22089 ?auto_22110 ) ) ( not ( = ?auto_22089 ?auto_22105 ) ) ( not ( = ?auto_22089 ?auto_22103 ) ) ( not ( = ?auto_22089 ?auto_22107 ) ) ( not ( = ?auto_22089 ?auto_22102 ) ) ( not ( = ?auto_22089 ?auto_22096 ) ) ( not ( = ?auto_22095 ?auto_22098 ) ) ( not ( = ?auto_22095 ?auto_22120 ) ) ( not ( = ?auto_22095 ?auto_22111 ) ) ( not ( = ?auto_22095 ?auto_22106 ) ) ( not ( = ?auto_22095 ?auto_22100 ) ) ( not ( = ?auto_22095 ?auto_22090 ) ) ( not ( = ?auto_22095 ?auto_22092 ) ) ( not ( = ?auto_22095 ?auto_22116 ) ) ( not ( = ?auto_22109 ?auto_22114 ) ) ( not ( = ?auto_22109 ?auto_22097 ) ) ( not ( = ?auto_22109 ?auto_22118 ) ) ( not ( = ?auto_22109 ?auto_22108 ) ) ( not ( = ?auto_22109 ?auto_22088 ) ) ( not ( = ?auto_22109 ?auto_22094 ) ) ( not ( = ?auto_22109 ?auto_22115 ) ) ( not ( = ?auto_22109 ?auto_22101 ) ) ( not ( = ?auto_22109 ?auto_22104 ) ) ( not ( = ?auto_22109 ?auto_22099 ) ) ( not ( = ?auto_22109 ?auto_22117 ) ) ( not ( = ?auto_22109 ?auto_22112 ) ) ( not ( = ?auto_22066 ?auto_22079 ) ) ( not ( = ?auto_22066 ?auto_22093 ) ) ( not ( = ?auto_22067 ?auto_22079 ) ) ( not ( = ?auto_22067 ?auto_22093 ) ) ( not ( = ?auto_22068 ?auto_22079 ) ) ( not ( = ?auto_22068 ?auto_22093 ) ) ( not ( = ?auto_22069 ?auto_22079 ) ) ( not ( = ?auto_22069 ?auto_22093 ) ) ( not ( = ?auto_22070 ?auto_22079 ) ) ( not ( = ?auto_22070 ?auto_22093 ) ) ( not ( = ?auto_22071 ?auto_22079 ) ) ( not ( = ?auto_22071 ?auto_22093 ) ) ( not ( = ?auto_22074 ?auto_22079 ) ) ( not ( = ?auto_22074 ?auto_22093 ) ) ( not ( = ?auto_22073 ?auto_22079 ) ) ( not ( = ?auto_22073 ?auto_22093 ) ) ( not ( = ?auto_22072 ?auto_22079 ) ) ( not ( = ?auto_22072 ?auto_22093 ) ) ( not ( = ?auto_22075 ?auto_22079 ) ) ( not ( = ?auto_22075 ?auto_22093 ) ) ( not ( = ?auto_22077 ?auto_22079 ) ) ( not ( = ?auto_22077 ?auto_22093 ) ) ( not ( = ?auto_22076 ?auto_22079 ) ) ( not ( = ?auto_22076 ?auto_22093 ) ) ( not ( = ?auto_22078 ?auto_22079 ) ) ( not ( = ?auto_22078 ?auto_22093 ) ) ( not ( = ?auto_22079 ?auto_22109 ) ) ( not ( = ?auto_22079 ?auto_22114 ) ) ( not ( = ?auto_22079 ?auto_22097 ) ) ( not ( = ?auto_22079 ?auto_22118 ) ) ( not ( = ?auto_22079 ?auto_22108 ) ) ( not ( = ?auto_22079 ?auto_22088 ) ) ( not ( = ?auto_22079 ?auto_22094 ) ) ( not ( = ?auto_22079 ?auto_22115 ) ) ( not ( = ?auto_22079 ?auto_22101 ) ) ( not ( = ?auto_22079 ?auto_22104 ) ) ( not ( = ?auto_22079 ?auto_22099 ) ) ( not ( = ?auto_22079 ?auto_22117 ) ) ( not ( = ?auto_22079 ?auto_22112 ) ) ( not ( = ?auto_22113 ?auto_22089 ) ) ( not ( = ?auto_22113 ?auto_22121 ) ) ( not ( = ?auto_22113 ?auto_22091 ) ) ( not ( = ?auto_22113 ?auto_22110 ) ) ( not ( = ?auto_22113 ?auto_22105 ) ) ( not ( = ?auto_22113 ?auto_22103 ) ) ( not ( = ?auto_22113 ?auto_22107 ) ) ( not ( = ?auto_22113 ?auto_22102 ) ) ( not ( = ?auto_22113 ?auto_22096 ) ) ( not ( = ?auto_22119 ?auto_22095 ) ) ( not ( = ?auto_22119 ?auto_22098 ) ) ( not ( = ?auto_22119 ?auto_22120 ) ) ( not ( = ?auto_22119 ?auto_22111 ) ) ( not ( = ?auto_22119 ?auto_22106 ) ) ( not ( = ?auto_22119 ?auto_22100 ) ) ( not ( = ?auto_22119 ?auto_22090 ) ) ( not ( = ?auto_22119 ?auto_22092 ) ) ( not ( = ?auto_22119 ?auto_22116 ) ) ( not ( = ?auto_22093 ?auto_22109 ) ) ( not ( = ?auto_22093 ?auto_22114 ) ) ( not ( = ?auto_22093 ?auto_22097 ) ) ( not ( = ?auto_22093 ?auto_22118 ) ) ( not ( = ?auto_22093 ?auto_22108 ) ) ( not ( = ?auto_22093 ?auto_22088 ) ) ( not ( = ?auto_22093 ?auto_22094 ) ) ( not ( = ?auto_22093 ?auto_22115 ) ) ( not ( = ?auto_22093 ?auto_22101 ) ) ( not ( = ?auto_22093 ?auto_22104 ) ) ( not ( = ?auto_22093 ?auto_22099 ) ) ( not ( = ?auto_22093 ?auto_22117 ) ) ( not ( = ?auto_22093 ?auto_22112 ) ) ( not ( = ?auto_22066 ?auto_22081 ) ) ( not ( = ?auto_22066 ?auto_22086 ) ) ( not ( = ?auto_22067 ?auto_22081 ) ) ( not ( = ?auto_22067 ?auto_22086 ) ) ( not ( = ?auto_22068 ?auto_22081 ) ) ( not ( = ?auto_22068 ?auto_22086 ) ) ( not ( = ?auto_22069 ?auto_22081 ) ) ( not ( = ?auto_22069 ?auto_22086 ) ) ( not ( = ?auto_22070 ?auto_22081 ) ) ( not ( = ?auto_22070 ?auto_22086 ) ) ( not ( = ?auto_22071 ?auto_22081 ) ) ( not ( = ?auto_22071 ?auto_22086 ) ) ( not ( = ?auto_22074 ?auto_22081 ) ) ( not ( = ?auto_22074 ?auto_22086 ) ) ( not ( = ?auto_22073 ?auto_22081 ) ) ( not ( = ?auto_22073 ?auto_22086 ) ) ( not ( = ?auto_22072 ?auto_22081 ) ) ( not ( = ?auto_22072 ?auto_22086 ) ) ( not ( = ?auto_22075 ?auto_22081 ) ) ( not ( = ?auto_22075 ?auto_22086 ) ) ( not ( = ?auto_22077 ?auto_22081 ) ) ( not ( = ?auto_22077 ?auto_22086 ) ) ( not ( = ?auto_22076 ?auto_22081 ) ) ( not ( = ?auto_22076 ?auto_22086 ) ) ( not ( = ?auto_22078 ?auto_22081 ) ) ( not ( = ?auto_22078 ?auto_22086 ) ) ( not ( = ?auto_22080 ?auto_22081 ) ) ( not ( = ?auto_22080 ?auto_22086 ) ) ( not ( = ?auto_22081 ?auto_22093 ) ) ( not ( = ?auto_22081 ?auto_22109 ) ) ( not ( = ?auto_22081 ?auto_22114 ) ) ( not ( = ?auto_22081 ?auto_22097 ) ) ( not ( = ?auto_22081 ?auto_22118 ) ) ( not ( = ?auto_22081 ?auto_22108 ) ) ( not ( = ?auto_22081 ?auto_22088 ) ) ( not ( = ?auto_22081 ?auto_22094 ) ) ( not ( = ?auto_22081 ?auto_22115 ) ) ( not ( = ?auto_22081 ?auto_22101 ) ) ( not ( = ?auto_22081 ?auto_22104 ) ) ( not ( = ?auto_22081 ?auto_22099 ) ) ( not ( = ?auto_22081 ?auto_22117 ) ) ( not ( = ?auto_22081 ?auto_22112 ) ) ( not ( = ?auto_22087 ?auto_22113 ) ) ( not ( = ?auto_22087 ?auto_22089 ) ) ( not ( = ?auto_22087 ?auto_22121 ) ) ( not ( = ?auto_22087 ?auto_22091 ) ) ( not ( = ?auto_22087 ?auto_22110 ) ) ( not ( = ?auto_22087 ?auto_22105 ) ) ( not ( = ?auto_22087 ?auto_22103 ) ) ( not ( = ?auto_22087 ?auto_22107 ) ) ( not ( = ?auto_22087 ?auto_22102 ) ) ( not ( = ?auto_22087 ?auto_22096 ) ) ( not ( = ?auto_22084 ?auto_22119 ) ) ( not ( = ?auto_22084 ?auto_22095 ) ) ( not ( = ?auto_22084 ?auto_22098 ) ) ( not ( = ?auto_22084 ?auto_22120 ) ) ( not ( = ?auto_22084 ?auto_22111 ) ) ( not ( = ?auto_22084 ?auto_22106 ) ) ( not ( = ?auto_22084 ?auto_22100 ) ) ( not ( = ?auto_22084 ?auto_22090 ) ) ( not ( = ?auto_22084 ?auto_22092 ) ) ( not ( = ?auto_22084 ?auto_22116 ) ) ( not ( = ?auto_22086 ?auto_22093 ) ) ( not ( = ?auto_22086 ?auto_22109 ) ) ( not ( = ?auto_22086 ?auto_22114 ) ) ( not ( = ?auto_22086 ?auto_22097 ) ) ( not ( = ?auto_22086 ?auto_22118 ) ) ( not ( = ?auto_22086 ?auto_22108 ) ) ( not ( = ?auto_22086 ?auto_22088 ) ) ( not ( = ?auto_22086 ?auto_22094 ) ) ( not ( = ?auto_22086 ?auto_22115 ) ) ( not ( = ?auto_22086 ?auto_22101 ) ) ( not ( = ?auto_22086 ?auto_22104 ) ) ( not ( = ?auto_22086 ?auto_22099 ) ) ( not ( = ?auto_22086 ?auto_22117 ) ) ( not ( = ?auto_22086 ?auto_22112 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_22066 ?auto_22067 ?auto_22068 ?auto_22069 ?auto_22070 ?auto_22071 ?auto_22074 ?auto_22073 ?auto_22072 ?auto_22075 ?auto_22077 ?auto_22076 ?auto_22078 ?auto_22080 ?auto_22079 )
      ( MAKE-1CRATE ?auto_22079 ?auto_22081 )
      ( MAKE-15CRATE-VERIFY ?auto_22066 ?auto_22067 ?auto_22068 ?auto_22069 ?auto_22070 ?auto_22071 ?auto_22074 ?auto_22073 ?auto_22072 ?auto_22075 ?auto_22077 ?auto_22076 ?auto_22078 ?auto_22080 ?auto_22079 ?auto_22081 ) )
  )

)

