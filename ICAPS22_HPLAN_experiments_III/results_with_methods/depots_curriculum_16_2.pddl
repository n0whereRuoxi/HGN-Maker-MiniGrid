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

  ( :method MAKE-16CRATE-VERIFY
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
      ?c16 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( ON ?c16 ?c15 ) ( CLEAR ?c16 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25352 - SURFACE
      ?auto_25353 - SURFACE
    )
    :vars
    (
      ?auto_25354 - HOIST
      ?auto_25355 - PLACE
      ?auto_25357 - PLACE
      ?auto_25358 - HOIST
      ?auto_25359 - SURFACE
      ?auto_25356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25354 ?auto_25355 ) ( SURFACE-AT ?auto_25352 ?auto_25355 ) ( CLEAR ?auto_25352 ) ( IS-CRATE ?auto_25353 ) ( AVAILABLE ?auto_25354 ) ( not ( = ?auto_25357 ?auto_25355 ) ) ( HOIST-AT ?auto_25358 ?auto_25357 ) ( AVAILABLE ?auto_25358 ) ( SURFACE-AT ?auto_25353 ?auto_25357 ) ( ON ?auto_25353 ?auto_25359 ) ( CLEAR ?auto_25353 ) ( TRUCK-AT ?auto_25356 ?auto_25355 ) ( not ( = ?auto_25352 ?auto_25353 ) ) ( not ( = ?auto_25352 ?auto_25359 ) ) ( not ( = ?auto_25353 ?auto_25359 ) ) ( not ( = ?auto_25354 ?auto_25358 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25356 ?auto_25355 ?auto_25357 )
      ( !LIFT ?auto_25358 ?auto_25353 ?auto_25359 ?auto_25357 )
      ( !LOAD ?auto_25358 ?auto_25353 ?auto_25356 ?auto_25357 )
      ( !DRIVE ?auto_25356 ?auto_25357 ?auto_25355 )
      ( !UNLOAD ?auto_25354 ?auto_25353 ?auto_25356 ?auto_25355 )
      ( !DROP ?auto_25354 ?auto_25353 ?auto_25352 ?auto_25355 )
      ( MAKE-1CRATE-VERIFY ?auto_25352 ?auto_25353 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25362 - SURFACE
      ?auto_25363 - SURFACE
    )
    :vars
    (
      ?auto_25364 - HOIST
      ?auto_25365 - PLACE
      ?auto_25367 - PLACE
      ?auto_25368 - HOIST
      ?auto_25369 - SURFACE
      ?auto_25366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25364 ?auto_25365 ) ( SURFACE-AT ?auto_25362 ?auto_25365 ) ( CLEAR ?auto_25362 ) ( IS-CRATE ?auto_25363 ) ( AVAILABLE ?auto_25364 ) ( not ( = ?auto_25367 ?auto_25365 ) ) ( HOIST-AT ?auto_25368 ?auto_25367 ) ( AVAILABLE ?auto_25368 ) ( SURFACE-AT ?auto_25363 ?auto_25367 ) ( ON ?auto_25363 ?auto_25369 ) ( CLEAR ?auto_25363 ) ( TRUCK-AT ?auto_25366 ?auto_25365 ) ( not ( = ?auto_25362 ?auto_25363 ) ) ( not ( = ?auto_25362 ?auto_25369 ) ) ( not ( = ?auto_25363 ?auto_25369 ) ) ( not ( = ?auto_25364 ?auto_25368 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25366 ?auto_25365 ?auto_25367 )
      ( !LIFT ?auto_25368 ?auto_25363 ?auto_25369 ?auto_25367 )
      ( !LOAD ?auto_25368 ?auto_25363 ?auto_25366 ?auto_25367 )
      ( !DRIVE ?auto_25366 ?auto_25367 ?auto_25365 )
      ( !UNLOAD ?auto_25364 ?auto_25363 ?auto_25366 ?auto_25365 )
      ( !DROP ?auto_25364 ?auto_25363 ?auto_25362 ?auto_25365 )
      ( MAKE-1CRATE-VERIFY ?auto_25362 ?auto_25363 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25373 - SURFACE
      ?auto_25374 - SURFACE
      ?auto_25375 - SURFACE
    )
    :vars
    (
      ?auto_25376 - HOIST
      ?auto_25380 - PLACE
      ?auto_25377 - PLACE
      ?auto_25378 - HOIST
      ?auto_25379 - SURFACE
      ?auto_25382 - PLACE
      ?auto_25384 - HOIST
      ?auto_25383 - SURFACE
      ?auto_25381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25376 ?auto_25380 ) ( IS-CRATE ?auto_25375 ) ( not ( = ?auto_25377 ?auto_25380 ) ) ( HOIST-AT ?auto_25378 ?auto_25377 ) ( AVAILABLE ?auto_25378 ) ( SURFACE-AT ?auto_25375 ?auto_25377 ) ( ON ?auto_25375 ?auto_25379 ) ( CLEAR ?auto_25375 ) ( not ( = ?auto_25374 ?auto_25375 ) ) ( not ( = ?auto_25374 ?auto_25379 ) ) ( not ( = ?auto_25375 ?auto_25379 ) ) ( not ( = ?auto_25376 ?auto_25378 ) ) ( SURFACE-AT ?auto_25373 ?auto_25380 ) ( CLEAR ?auto_25373 ) ( IS-CRATE ?auto_25374 ) ( AVAILABLE ?auto_25376 ) ( not ( = ?auto_25382 ?auto_25380 ) ) ( HOIST-AT ?auto_25384 ?auto_25382 ) ( AVAILABLE ?auto_25384 ) ( SURFACE-AT ?auto_25374 ?auto_25382 ) ( ON ?auto_25374 ?auto_25383 ) ( CLEAR ?auto_25374 ) ( TRUCK-AT ?auto_25381 ?auto_25380 ) ( not ( = ?auto_25373 ?auto_25374 ) ) ( not ( = ?auto_25373 ?auto_25383 ) ) ( not ( = ?auto_25374 ?auto_25383 ) ) ( not ( = ?auto_25376 ?auto_25384 ) ) ( not ( = ?auto_25373 ?auto_25375 ) ) ( not ( = ?auto_25373 ?auto_25379 ) ) ( not ( = ?auto_25375 ?auto_25383 ) ) ( not ( = ?auto_25377 ?auto_25382 ) ) ( not ( = ?auto_25378 ?auto_25384 ) ) ( not ( = ?auto_25379 ?auto_25383 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25373 ?auto_25374 )
      ( MAKE-1CRATE ?auto_25374 ?auto_25375 )
      ( MAKE-2CRATE-VERIFY ?auto_25373 ?auto_25374 ?auto_25375 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25387 - SURFACE
      ?auto_25388 - SURFACE
    )
    :vars
    (
      ?auto_25389 - HOIST
      ?auto_25390 - PLACE
      ?auto_25392 - PLACE
      ?auto_25393 - HOIST
      ?auto_25394 - SURFACE
      ?auto_25391 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25389 ?auto_25390 ) ( SURFACE-AT ?auto_25387 ?auto_25390 ) ( CLEAR ?auto_25387 ) ( IS-CRATE ?auto_25388 ) ( AVAILABLE ?auto_25389 ) ( not ( = ?auto_25392 ?auto_25390 ) ) ( HOIST-AT ?auto_25393 ?auto_25392 ) ( AVAILABLE ?auto_25393 ) ( SURFACE-AT ?auto_25388 ?auto_25392 ) ( ON ?auto_25388 ?auto_25394 ) ( CLEAR ?auto_25388 ) ( TRUCK-AT ?auto_25391 ?auto_25390 ) ( not ( = ?auto_25387 ?auto_25388 ) ) ( not ( = ?auto_25387 ?auto_25394 ) ) ( not ( = ?auto_25388 ?auto_25394 ) ) ( not ( = ?auto_25389 ?auto_25393 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25391 ?auto_25390 ?auto_25392 )
      ( !LIFT ?auto_25393 ?auto_25388 ?auto_25394 ?auto_25392 )
      ( !LOAD ?auto_25393 ?auto_25388 ?auto_25391 ?auto_25392 )
      ( !DRIVE ?auto_25391 ?auto_25392 ?auto_25390 )
      ( !UNLOAD ?auto_25389 ?auto_25388 ?auto_25391 ?auto_25390 )
      ( !DROP ?auto_25389 ?auto_25388 ?auto_25387 ?auto_25390 )
      ( MAKE-1CRATE-VERIFY ?auto_25387 ?auto_25388 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25399 - SURFACE
      ?auto_25400 - SURFACE
      ?auto_25401 - SURFACE
      ?auto_25402 - SURFACE
    )
    :vars
    (
      ?auto_25403 - HOIST
      ?auto_25406 - PLACE
      ?auto_25407 - PLACE
      ?auto_25405 - HOIST
      ?auto_25404 - SURFACE
      ?auto_25409 - PLACE
      ?auto_25411 - HOIST
      ?auto_25410 - SURFACE
      ?auto_25414 - PLACE
      ?auto_25412 - HOIST
      ?auto_25413 - SURFACE
      ?auto_25408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25403 ?auto_25406 ) ( IS-CRATE ?auto_25402 ) ( not ( = ?auto_25407 ?auto_25406 ) ) ( HOIST-AT ?auto_25405 ?auto_25407 ) ( AVAILABLE ?auto_25405 ) ( SURFACE-AT ?auto_25402 ?auto_25407 ) ( ON ?auto_25402 ?auto_25404 ) ( CLEAR ?auto_25402 ) ( not ( = ?auto_25401 ?auto_25402 ) ) ( not ( = ?auto_25401 ?auto_25404 ) ) ( not ( = ?auto_25402 ?auto_25404 ) ) ( not ( = ?auto_25403 ?auto_25405 ) ) ( IS-CRATE ?auto_25401 ) ( not ( = ?auto_25409 ?auto_25406 ) ) ( HOIST-AT ?auto_25411 ?auto_25409 ) ( AVAILABLE ?auto_25411 ) ( SURFACE-AT ?auto_25401 ?auto_25409 ) ( ON ?auto_25401 ?auto_25410 ) ( CLEAR ?auto_25401 ) ( not ( = ?auto_25400 ?auto_25401 ) ) ( not ( = ?auto_25400 ?auto_25410 ) ) ( not ( = ?auto_25401 ?auto_25410 ) ) ( not ( = ?auto_25403 ?auto_25411 ) ) ( SURFACE-AT ?auto_25399 ?auto_25406 ) ( CLEAR ?auto_25399 ) ( IS-CRATE ?auto_25400 ) ( AVAILABLE ?auto_25403 ) ( not ( = ?auto_25414 ?auto_25406 ) ) ( HOIST-AT ?auto_25412 ?auto_25414 ) ( AVAILABLE ?auto_25412 ) ( SURFACE-AT ?auto_25400 ?auto_25414 ) ( ON ?auto_25400 ?auto_25413 ) ( CLEAR ?auto_25400 ) ( TRUCK-AT ?auto_25408 ?auto_25406 ) ( not ( = ?auto_25399 ?auto_25400 ) ) ( not ( = ?auto_25399 ?auto_25413 ) ) ( not ( = ?auto_25400 ?auto_25413 ) ) ( not ( = ?auto_25403 ?auto_25412 ) ) ( not ( = ?auto_25399 ?auto_25401 ) ) ( not ( = ?auto_25399 ?auto_25410 ) ) ( not ( = ?auto_25401 ?auto_25413 ) ) ( not ( = ?auto_25409 ?auto_25414 ) ) ( not ( = ?auto_25411 ?auto_25412 ) ) ( not ( = ?auto_25410 ?auto_25413 ) ) ( not ( = ?auto_25399 ?auto_25402 ) ) ( not ( = ?auto_25399 ?auto_25404 ) ) ( not ( = ?auto_25400 ?auto_25402 ) ) ( not ( = ?auto_25400 ?auto_25404 ) ) ( not ( = ?auto_25402 ?auto_25410 ) ) ( not ( = ?auto_25402 ?auto_25413 ) ) ( not ( = ?auto_25407 ?auto_25409 ) ) ( not ( = ?auto_25407 ?auto_25414 ) ) ( not ( = ?auto_25405 ?auto_25411 ) ) ( not ( = ?auto_25405 ?auto_25412 ) ) ( not ( = ?auto_25404 ?auto_25410 ) ) ( not ( = ?auto_25404 ?auto_25413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25399 ?auto_25400 ?auto_25401 )
      ( MAKE-1CRATE ?auto_25401 ?auto_25402 )
      ( MAKE-3CRATE-VERIFY ?auto_25399 ?auto_25400 ?auto_25401 ?auto_25402 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25417 - SURFACE
      ?auto_25418 - SURFACE
    )
    :vars
    (
      ?auto_25419 - HOIST
      ?auto_25420 - PLACE
      ?auto_25422 - PLACE
      ?auto_25423 - HOIST
      ?auto_25424 - SURFACE
      ?auto_25421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25419 ?auto_25420 ) ( SURFACE-AT ?auto_25417 ?auto_25420 ) ( CLEAR ?auto_25417 ) ( IS-CRATE ?auto_25418 ) ( AVAILABLE ?auto_25419 ) ( not ( = ?auto_25422 ?auto_25420 ) ) ( HOIST-AT ?auto_25423 ?auto_25422 ) ( AVAILABLE ?auto_25423 ) ( SURFACE-AT ?auto_25418 ?auto_25422 ) ( ON ?auto_25418 ?auto_25424 ) ( CLEAR ?auto_25418 ) ( TRUCK-AT ?auto_25421 ?auto_25420 ) ( not ( = ?auto_25417 ?auto_25418 ) ) ( not ( = ?auto_25417 ?auto_25424 ) ) ( not ( = ?auto_25418 ?auto_25424 ) ) ( not ( = ?auto_25419 ?auto_25423 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25421 ?auto_25420 ?auto_25422 )
      ( !LIFT ?auto_25423 ?auto_25418 ?auto_25424 ?auto_25422 )
      ( !LOAD ?auto_25423 ?auto_25418 ?auto_25421 ?auto_25422 )
      ( !DRIVE ?auto_25421 ?auto_25422 ?auto_25420 )
      ( !UNLOAD ?auto_25419 ?auto_25418 ?auto_25421 ?auto_25420 )
      ( !DROP ?auto_25419 ?auto_25418 ?auto_25417 ?auto_25420 )
      ( MAKE-1CRATE-VERIFY ?auto_25417 ?auto_25418 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25430 - SURFACE
      ?auto_25431 - SURFACE
      ?auto_25432 - SURFACE
      ?auto_25433 - SURFACE
      ?auto_25434 - SURFACE
    )
    :vars
    (
      ?auto_25439 - HOIST
      ?auto_25435 - PLACE
      ?auto_25438 - PLACE
      ?auto_25436 - HOIST
      ?auto_25440 - SURFACE
      ?auto_25449 - PLACE
      ?auto_25448 - HOIST
      ?auto_25446 - SURFACE
      ?auto_25447 - PLACE
      ?auto_25442 - HOIST
      ?auto_25445 - SURFACE
      ?auto_25444 - PLACE
      ?auto_25443 - HOIST
      ?auto_25441 - SURFACE
      ?auto_25437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25439 ?auto_25435 ) ( IS-CRATE ?auto_25434 ) ( not ( = ?auto_25438 ?auto_25435 ) ) ( HOIST-AT ?auto_25436 ?auto_25438 ) ( AVAILABLE ?auto_25436 ) ( SURFACE-AT ?auto_25434 ?auto_25438 ) ( ON ?auto_25434 ?auto_25440 ) ( CLEAR ?auto_25434 ) ( not ( = ?auto_25433 ?auto_25434 ) ) ( not ( = ?auto_25433 ?auto_25440 ) ) ( not ( = ?auto_25434 ?auto_25440 ) ) ( not ( = ?auto_25439 ?auto_25436 ) ) ( IS-CRATE ?auto_25433 ) ( not ( = ?auto_25449 ?auto_25435 ) ) ( HOIST-AT ?auto_25448 ?auto_25449 ) ( AVAILABLE ?auto_25448 ) ( SURFACE-AT ?auto_25433 ?auto_25449 ) ( ON ?auto_25433 ?auto_25446 ) ( CLEAR ?auto_25433 ) ( not ( = ?auto_25432 ?auto_25433 ) ) ( not ( = ?auto_25432 ?auto_25446 ) ) ( not ( = ?auto_25433 ?auto_25446 ) ) ( not ( = ?auto_25439 ?auto_25448 ) ) ( IS-CRATE ?auto_25432 ) ( not ( = ?auto_25447 ?auto_25435 ) ) ( HOIST-AT ?auto_25442 ?auto_25447 ) ( AVAILABLE ?auto_25442 ) ( SURFACE-AT ?auto_25432 ?auto_25447 ) ( ON ?auto_25432 ?auto_25445 ) ( CLEAR ?auto_25432 ) ( not ( = ?auto_25431 ?auto_25432 ) ) ( not ( = ?auto_25431 ?auto_25445 ) ) ( not ( = ?auto_25432 ?auto_25445 ) ) ( not ( = ?auto_25439 ?auto_25442 ) ) ( SURFACE-AT ?auto_25430 ?auto_25435 ) ( CLEAR ?auto_25430 ) ( IS-CRATE ?auto_25431 ) ( AVAILABLE ?auto_25439 ) ( not ( = ?auto_25444 ?auto_25435 ) ) ( HOIST-AT ?auto_25443 ?auto_25444 ) ( AVAILABLE ?auto_25443 ) ( SURFACE-AT ?auto_25431 ?auto_25444 ) ( ON ?auto_25431 ?auto_25441 ) ( CLEAR ?auto_25431 ) ( TRUCK-AT ?auto_25437 ?auto_25435 ) ( not ( = ?auto_25430 ?auto_25431 ) ) ( not ( = ?auto_25430 ?auto_25441 ) ) ( not ( = ?auto_25431 ?auto_25441 ) ) ( not ( = ?auto_25439 ?auto_25443 ) ) ( not ( = ?auto_25430 ?auto_25432 ) ) ( not ( = ?auto_25430 ?auto_25445 ) ) ( not ( = ?auto_25432 ?auto_25441 ) ) ( not ( = ?auto_25447 ?auto_25444 ) ) ( not ( = ?auto_25442 ?auto_25443 ) ) ( not ( = ?auto_25445 ?auto_25441 ) ) ( not ( = ?auto_25430 ?auto_25433 ) ) ( not ( = ?auto_25430 ?auto_25446 ) ) ( not ( = ?auto_25431 ?auto_25433 ) ) ( not ( = ?auto_25431 ?auto_25446 ) ) ( not ( = ?auto_25433 ?auto_25445 ) ) ( not ( = ?auto_25433 ?auto_25441 ) ) ( not ( = ?auto_25449 ?auto_25447 ) ) ( not ( = ?auto_25449 ?auto_25444 ) ) ( not ( = ?auto_25448 ?auto_25442 ) ) ( not ( = ?auto_25448 ?auto_25443 ) ) ( not ( = ?auto_25446 ?auto_25445 ) ) ( not ( = ?auto_25446 ?auto_25441 ) ) ( not ( = ?auto_25430 ?auto_25434 ) ) ( not ( = ?auto_25430 ?auto_25440 ) ) ( not ( = ?auto_25431 ?auto_25434 ) ) ( not ( = ?auto_25431 ?auto_25440 ) ) ( not ( = ?auto_25432 ?auto_25434 ) ) ( not ( = ?auto_25432 ?auto_25440 ) ) ( not ( = ?auto_25434 ?auto_25446 ) ) ( not ( = ?auto_25434 ?auto_25445 ) ) ( not ( = ?auto_25434 ?auto_25441 ) ) ( not ( = ?auto_25438 ?auto_25449 ) ) ( not ( = ?auto_25438 ?auto_25447 ) ) ( not ( = ?auto_25438 ?auto_25444 ) ) ( not ( = ?auto_25436 ?auto_25448 ) ) ( not ( = ?auto_25436 ?auto_25442 ) ) ( not ( = ?auto_25436 ?auto_25443 ) ) ( not ( = ?auto_25440 ?auto_25446 ) ) ( not ( = ?auto_25440 ?auto_25445 ) ) ( not ( = ?auto_25440 ?auto_25441 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_25430 ?auto_25431 ?auto_25432 ?auto_25433 )
      ( MAKE-1CRATE ?auto_25433 ?auto_25434 )
      ( MAKE-4CRATE-VERIFY ?auto_25430 ?auto_25431 ?auto_25432 ?auto_25433 ?auto_25434 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25452 - SURFACE
      ?auto_25453 - SURFACE
    )
    :vars
    (
      ?auto_25454 - HOIST
      ?auto_25455 - PLACE
      ?auto_25457 - PLACE
      ?auto_25458 - HOIST
      ?auto_25459 - SURFACE
      ?auto_25456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25454 ?auto_25455 ) ( SURFACE-AT ?auto_25452 ?auto_25455 ) ( CLEAR ?auto_25452 ) ( IS-CRATE ?auto_25453 ) ( AVAILABLE ?auto_25454 ) ( not ( = ?auto_25457 ?auto_25455 ) ) ( HOIST-AT ?auto_25458 ?auto_25457 ) ( AVAILABLE ?auto_25458 ) ( SURFACE-AT ?auto_25453 ?auto_25457 ) ( ON ?auto_25453 ?auto_25459 ) ( CLEAR ?auto_25453 ) ( TRUCK-AT ?auto_25456 ?auto_25455 ) ( not ( = ?auto_25452 ?auto_25453 ) ) ( not ( = ?auto_25452 ?auto_25459 ) ) ( not ( = ?auto_25453 ?auto_25459 ) ) ( not ( = ?auto_25454 ?auto_25458 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25456 ?auto_25455 ?auto_25457 )
      ( !LIFT ?auto_25458 ?auto_25453 ?auto_25459 ?auto_25457 )
      ( !LOAD ?auto_25458 ?auto_25453 ?auto_25456 ?auto_25457 )
      ( !DRIVE ?auto_25456 ?auto_25457 ?auto_25455 )
      ( !UNLOAD ?auto_25454 ?auto_25453 ?auto_25456 ?auto_25455 )
      ( !DROP ?auto_25454 ?auto_25453 ?auto_25452 ?auto_25455 )
      ( MAKE-1CRATE-VERIFY ?auto_25452 ?auto_25453 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_25466 - SURFACE
      ?auto_25467 - SURFACE
      ?auto_25468 - SURFACE
      ?auto_25469 - SURFACE
      ?auto_25470 - SURFACE
      ?auto_25471 - SURFACE
    )
    :vars
    (
      ?auto_25472 - HOIST
      ?auto_25477 - PLACE
      ?auto_25474 - PLACE
      ?auto_25475 - HOIST
      ?auto_25476 - SURFACE
      ?auto_25486 - PLACE
      ?auto_25484 - HOIST
      ?auto_25485 - SURFACE
      ?auto_25480 - PLACE
      ?auto_25482 - HOIST
      ?auto_25483 - SURFACE
      ?auto_25489 - PLACE
      ?auto_25479 - HOIST
      ?auto_25488 - SURFACE
      ?auto_25487 - PLACE
      ?auto_25481 - HOIST
      ?auto_25478 - SURFACE
      ?auto_25473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25472 ?auto_25477 ) ( IS-CRATE ?auto_25471 ) ( not ( = ?auto_25474 ?auto_25477 ) ) ( HOIST-AT ?auto_25475 ?auto_25474 ) ( AVAILABLE ?auto_25475 ) ( SURFACE-AT ?auto_25471 ?auto_25474 ) ( ON ?auto_25471 ?auto_25476 ) ( CLEAR ?auto_25471 ) ( not ( = ?auto_25470 ?auto_25471 ) ) ( not ( = ?auto_25470 ?auto_25476 ) ) ( not ( = ?auto_25471 ?auto_25476 ) ) ( not ( = ?auto_25472 ?auto_25475 ) ) ( IS-CRATE ?auto_25470 ) ( not ( = ?auto_25486 ?auto_25477 ) ) ( HOIST-AT ?auto_25484 ?auto_25486 ) ( AVAILABLE ?auto_25484 ) ( SURFACE-AT ?auto_25470 ?auto_25486 ) ( ON ?auto_25470 ?auto_25485 ) ( CLEAR ?auto_25470 ) ( not ( = ?auto_25469 ?auto_25470 ) ) ( not ( = ?auto_25469 ?auto_25485 ) ) ( not ( = ?auto_25470 ?auto_25485 ) ) ( not ( = ?auto_25472 ?auto_25484 ) ) ( IS-CRATE ?auto_25469 ) ( not ( = ?auto_25480 ?auto_25477 ) ) ( HOIST-AT ?auto_25482 ?auto_25480 ) ( AVAILABLE ?auto_25482 ) ( SURFACE-AT ?auto_25469 ?auto_25480 ) ( ON ?auto_25469 ?auto_25483 ) ( CLEAR ?auto_25469 ) ( not ( = ?auto_25468 ?auto_25469 ) ) ( not ( = ?auto_25468 ?auto_25483 ) ) ( not ( = ?auto_25469 ?auto_25483 ) ) ( not ( = ?auto_25472 ?auto_25482 ) ) ( IS-CRATE ?auto_25468 ) ( not ( = ?auto_25489 ?auto_25477 ) ) ( HOIST-AT ?auto_25479 ?auto_25489 ) ( AVAILABLE ?auto_25479 ) ( SURFACE-AT ?auto_25468 ?auto_25489 ) ( ON ?auto_25468 ?auto_25488 ) ( CLEAR ?auto_25468 ) ( not ( = ?auto_25467 ?auto_25468 ) ) ( not ( = ?auto_25467 ?auto_25488 ) ) ( not ( = ?auto_25468 ?auto_25488 ) ) ( not ( = ?auto_25472 ?auto_25479 ) ) ( SURFACE-AT ?auto_25466 ?auto_25477 ) ( CLEAR ?auto_25466 ) ( IS-CRATE ?auto_25467 ) ( AVAILABLE ?auto_25472 ) ( not ( = ?auto_25487 ?auto_25477 ) ) ( HOIST-AT ?auto_25481 ?auto_25487 ) ( AVAILABLE ?auto_25481 ) ( SURFACE-AT ?auto_25467 ?auto_25487 ) ( ON ?auto_25467 ?auto_25478 ) ( CLEAR ?auto_25467 ) ( TRUCK-AT ?auto_25473 ?auto_25477 ) ( not ( = ?auto_25466 ?auto_25467 ) ) ( not ( = ?auto_25466 ?auto_25478 ) ) ( not ( = ?auto_25467 ?auto_25478 ) ) ( not ( = ?auto_25472 ?auto_25481 ) ) ( not ( = ?auto_25466 ?auto_25468 ) ) ( not ( = ?auto_25466 ?auto_25488 ) ) ( not ( = ?auto_25468 ?auto_25478 ) ) ( not ( = ?auto_25489 ?auto_25487 ) ) ( not ( = ?auto_25479 ?auto_25481 ) ) ( not ( = ?auto_25488 ?auto_25478 ) ) ( not ( = ?auto_25466 ?auto_25469 ) ) ( not ( = ?auto_25466 ?auto_25483 ) ) ( not ( = ?auto_25467 ?auto_25469 ) ) ( not ( = ?auto_25467 ?auto_25483 ) ) ( not ( = ?auto_25469 ?auto_25488 ) ) ( not ( = ?auto_25469 ?auto_25478 ) ) ( not ( = ?auto_25480 ?auto_25489 ) ) ( not ( = ?auto_25480 ?auto_25487 ) ) ( not ( = ?auto_25482 ?auto_25479 ) ) ( not ( = ?auto_25482 ?auto_25481 ) ) ( not ( = ?auto_25483 ?auto_25488 ) ) ( not ( = ?auto_25483 ?auto_25478 ) ) ( not ( = ?auto_25466 ?auto_25470 ) ) ( not ( = ?auto_25466 ?auto_25485 ) ) ( not ( = ?auto_25467 ?auto_25470 ) ) ( not ( = ?auto_25467 ?auto_25485 ) ) ( not ( = ?auto_25468 ?auto_25470 ) ) ( not ( = ?auto_25468 ?auto_25485 ) ) ( not ( = ?auto_25470 ?auto_25483 ) ) ( not ( = ?auto_25470 ?auto_25488 ) ) ( not ( = ?auto_25470 ?auto_25478 ) ) ( not ( = ?auto_25486 ?auto_25480 ) ) ( not ( = ?auto_25486 ?auto_25489 ) ) ( not ( = ?auto_25486 ?auto_25487 ) ) ( not ( = ?auto_25484 ?auto_25482 ) ) ( not ( = ?auto_25484 ?auto_25479 ) ) ( not ( = ?auto_25484 ?auto_25481 ) ) ( not ( = ?auto_25485 ?auto_25483 ) ) ( not ( = ?auto_25485 ?auto_25488 ) ) ( not ( = ?auto_25485 ?auto_25478 ) ) ( not ( = ?auto_25466 ?auto_25471 ) ) ( not ( = ?auto_25466 ?auto_25476 ) ) ( not ( = ?auto_25467 ?auto_25471 ) ) ( not ( = ?auto_25467 ?auto_25476 ) ) ( not ( = ?auto_25468 ?auto_25471 ) ) ( not ( = ?auto_25468 ?auto_25476 ) ) ( not ( = ?auto_25469 ?auto_25471 ) ) ( not ( = ?auto_25469 ?auto_25476 ) ) ( not ( = ?auto_25471 ?auto_25485 ) ) ( not ( = ?auto_25471 ?auto_25483 ) ) ( not ( = ?auto_25471 ?auto_25488 ) ) ( not ( = ?auto_25471 ?auto_25478 ) ) ( not ( = ?auto_25474 ?auto_25486 ) ) ( not ( = ?auto_25474 ?auto_25480 ) ) ( not ( = ?auto_25474 ?auto_25489 ) ) ( not ( = ?auto_25474 ?auto_25487 ) ) ( not ( = ?auto_25475 ?auto_25484 ) ) ( not ( = ?auto_25475 ?auto_25482 ) ) ( not ( = ?auto_25475 ?auto_25479 ) ) ( not ( = ?auto_25475 ?auto_25481 ) ) ( not ( = ?auto_25476 ?auto_25485 ) ) ( not ( = ?auto_25476 ?auto_25483 ) ) ( not ( = ?auto_25476 ?auto_25488 ) ) ( not ( = ?auto_25476 ?auto_25478 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_25466 ?auto_25467 ?auto_25468 ?auto_25469 ?auto_25470 )
      ( MAKE-1CRATE ?auto_25470 ?auto_25471 )
      ( MAKE-5CRATE-VERIFY ?auto_25466 ?auto_25467 ?auto_25468 ?auto_25469 ?auto_25470 ?auto_25471 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25492 - SURFACE
      ?auto_25493 - SURFACE
    )
    :vars
    (
      ?auto_25494 - HOIST
      ?auto_25495 - PLACE
      ?auto_25497 - PLACE
      ?auto_25498 - HOIST
      ?auto_25499 - SURFACE
      ?auto_25496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25494 ?auto_25495 ) ( SURFACE-AT ?auto_25492 ?auto_25495 ) ( CLEAR ?auto_25492 ) ( IS-CRATE ?auto_25493 ) ( AVAILABLE ?auto_25494 ) ( not ( = ?auto_25497 ?auto_25495 ) ) ( HOIST-AT ?auto_25498 ?auto_25497 ) ( AVAILABLE ?auto_25498 ) ( SURFACE-AT ?auto_25493 ?auto_25497 ) ( ON ?auto_25493 ?auto_25499 ) ( CLEAR ?auto_25493 ) ( TRUCK-AT ?auto_25496 ?auto_25495 ) ( not ( = ?auto_25492 ?auto_25493 ) ) ( not ( = ?auto_25492 ?auto_25499 ) ) ( not ( = ?auto_25493 ?auto_25499 ) ) ( not ( = ?auto_25494 ?auto_25498 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25496 ?auto_25495 ?auto_25497 )
      ( !LIFT ?auto_25498 ?auto_25493 ?auto_25499 ?auto_25497 )
      ( !LOAD ?auto_25498 ?auto_25493 ?auto_25496 ?auto_25497 )
      ( !DRIVE ?auto_25496 ?auto_25497 ?auto_25495 )
      ( !UNLOAD ?auto_25494 ?auto_25493 ?auto_25496 ?auto_25495 )
      ( !DROP ?auto_25494 ?auto_25493 ?auto_25492 ?auto_25495 )
      ( MAKE-1CRATE-VERIFY ?auto_25492 ?auto_25493 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_25507 - SURFACE
      ?auto_25508 - SURFACE
      ?auto_25509 - SURFACE
      ?auto_25510 - SURFACE
      ?auto_25511 - SURFACE
      ?auto_25512 - SURFACE
      ?auto_25513 - SURFACE
    )
    :vars
    (
      ?auto_25514 - HOIST
      ?auto_25515 - PLACE
      ?auto_25519 - PLACE
      ?auto_25516 - HOIST
      ?auto_25518 - SURFACE
      ?auto_25529 - PLACE
      ?auto_25523 - HOIST
      ?auto_25533 - SURFACE
      ?auto_25530 - PLACE
      ?auto_25527 - HOIST
      ?auto_25526 - SURFACE
      ?auto_25522 - PLACE
      ?auto_25534 - HOIST
      ?auto_25528 - SURFACE
      ?auto_25525 - PLACE
      ?auto_25521 - HOIST
      ?auto_25531 - SURFACE
      ?auto_25524 - PLACE
      ?auto_25520 - HOIST
      ?auto_25532 - SURFACE
      ?auto_25517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25514 ?auto_25515 ) ( IS-CRATE ?auto_25513 ) ( not ( = ?auto_25519 ?auto_25515 ) ) ( HOIST-AT ?auto_25516 ?auto_25519 ) ( AVAILABLE ?auto_25516 ) ( SURFACE-AT ?auto_25513 ?auto_25519 ) ( ON ?auto_25513 ?auto_25518 ) ( CLEAR ?auto_25513 ) ( not ( = ?auto_25512 ?auto_25513 ) ) ( not ( = ?auto_25512 ?auto_25518 ) ) ( not ( = ?auto_25513 ?auto_25518 ) ) ( not ( = ?auto_25514 ?auto_25516 ) ) ( IS-CRATE ?auto_25512 ) ( not ( = ?auto_25529 ?auto_25515 ) ) ( HOIST-AT ?auto_25523 ?auto_25529 ) ( AVAILABLE ?auto_25523 ) ( SURFACE-AT ?auto_25512 ?auto_25529 ) ( ON ?auto_25512 ?auto_25533 ) ( CLEAR ?auto_25512 ) ( not ( = ?auto_25511 ?auto_25512 ) ) ( not ( = ?auto_25511 ?auto_25533 ) ) ( not ( = ?auto_25512 ?auto_25533 ) ) ( not ( = ?auto_25514 ?auto_25523 ) ) ( IS-CRATE ?auto_25511 ) ( not ( = ?auto_25530 ?auto_25515 ) ) ( HOIST-AT ?auto_25527 ?auto_25530 ) ( AVAILABLE ?auto_25527 ) ( SURFACE-AT ?auto_25511 ?auto_25530 ) ( ON ?auto_25511 ?auto_25526 ) ( CLEAR ?auto_25511 ) ( not ( = ?auto_25510 ?auto_25511 ) ) ( not ( = ?auto_25510 ?auto_25526 ) ) ( not ( = ?auto_25511 ?auto_25526 ) ) ( not ( = ?auto_25514 ?auto_25527 ) ) ( IS-CRATE ?auto_25510 ) ( not ( = ?auto_25522 ?auto_25515 ) ) ( HOIST-AT ?auto_25534 ?auto_25522 ) ( AVAILABLE ?auto_25534 ) ( SURFACE-AT ?auto_25510 ?auto_25522 ) ( ON ?auto_25510 ?auto_25528 ) ( CLEAR ?auto_25510 ) ( not ( = ?auto_25509 ?auto_25510 ) ) ( not ( = ?auto_25509 ?auto_25528 ) ) ( not ( = ?auto_25510 ?auto_25528 ) ) ( not ( = ?auto_25514 ?auto_25534 ) ) ( IS-CRATE ?auto_25509 ) ( not ( = ?auto_25525 ?auto_25515 ) ) ( HOIST-AT ?auto_25521 ?auto_25525 ) ( AVAILABLE ?auto_25521 ) ( SURFACE-AT ?auto_25509 ?auto_25525 ) ( ON ?auto_25509 ?auto_25531 ) ( CLEAR ?auto_25509 ) ( not ( = ?auto_25508 ?auto_25509 ) ) ( not ( = ?auto_25508 ?auto_25531 ) ) ( not ( = ?auto_25509 ?auto_25531 ) ) ( not ( = ?auto_25514 ?auto_25521 ) ) ( SURFACE-AT ?auto_25507 ?auto_25515 ) ( CLEAR ?auto_25507 ) ( IS-CRATE ?auto_25508 ) ( AVAILABLE ?auto_25514 ) ( not ( = ?auto_25524 ?auto_25515 ) ) ( HOIST-AT ?auto_25520 ?auto_25524 ) ( AVAILABLE ?auto_25520 ) ( SURFACE-AT ?auto_25508 ?auto_25524 ) ( ON ?auto_25508 ?auto_25532 ) ( CLEAR ?auto_25508 ) ( TRUCK-AT ?auto_25517 ?auto_25515 ) ( not ( = ?auto_25507 ?auto_25508 ) ) ( not ( = ?auto_25507 ?auto_25532 ) ) ( not ( = ?auto_25508 ?auto_25532 ) ) ( not ( = ?auto_25514 ?auto_25520 ) ) ( not ( = ?auto_25507 ?auto_25509 ) ) ( not ( = ?auto_25507 ?auto_25531 ) ) ( not ( = ?auto_25509 ?auto_25532 ) ) ( not ( = ?auto_25525 ?auto_25524 ) ) ( not ( = ?auto_25521 ?auto_25520 ) ) ( not ( = ?auto_25531 ?auto_25532 ) ) ( not ( = ?auto_25507 ?auto_25510 ) ) ( not ( = ?auto_25507 ?auto_25528 ) ) ( not ( = ?auto_25508 ?auto_25510 ) ) ( not ( = ?auto_25508 ?auto_25528 ) ) ( not ( = ?auto_25510 ?auto_25531 ) ) ( not ( = ?auto_25510 ?auto_25532 ) ) ( not ( = ?auto_25522 ?auto_25525 ) ) ( not ( = ?auto_25522 ?auto_25524 ) ) ( not ( = ?auto_25534 ?auto_25521 ) ) ( not ( = ?auto_25534 ?auto_25520 ) ) ( not ( = ?auto_25528 ?auto_25531 ) ) ( not ( = ?auto_25528 ?auto_25532 ) ) ( not ( = ?auto_25507 ?auto_25511 ) ) ( not ( = ?auto_25507 ?auto_25526 ) ) ( not ( = ?auto_25508 ?auto_25511 ) ) ( not ( = ?auto_25508 ?auto_25526 ) ) ( not ( = ?auto_25509 ?auto_25511 ) ) ( not ( = ?auto_25509 ?auto_25526 ) ) ( not ( = ?auto_25511 ?auto_25528 ) ) ( not ( = ?auto_25511 ?auto_25531 ) ) ( not ( = ?auto_25511 ?auto_25532 ) ) ( not ( = ?auto_25530 ?auto_25522 ) ) ( not ( = ?auto_25530 ?auto_25525 ) ) ( not ( = ?auto_25530 ?auto_25524 ) ) ( not ( = ?auto_25527 ?auto_25534 ) ) ( not ( = ?auto_25527 ?auto_25521 ) ) ( not ( = ?auto_25527 ?auto_25520 ) ) ( not ( = ?auto_25526 ?auto_25528 ) ) ( not ( = ?auto_25526 ?auto_25531 ) ) ( not ( = ?auto_25526 ?auto_25532 ) ) ( not ( = ?auto_25507 ?auto_25512 ) ) ( not ( = ?auto_25507 ?auto_25533 ) ) ( not ( = ?auto_25508 ?auto_25512 ) ) ( not ( = ?auto_25508 ?auto_25533 ) ) ( not ( = ?auto_25509 ?auto_25512 ) ) ( not ( = ?auto_25509 ?auto_25533 ) ) ( not ( = ?auto_25510 ?auto_25512 ) ) ( not ( = ?auto_25510 ?auto_25533 ) ) ( not ( = ?auto_25512 ?auto_25526 ) ) ( not ( = ?auto_25512 ?auto_25528 ) ) ( not ( = ?auto_25512 ?auto_25531 ) ) ( not ( = ?auto_25512 ?auto_25532 ) ) ( not ( = ?auto_25529 ?auto_25530 ) ) ( not ( = ?auto_25529 ?auto_25522 ) ) ( not ( = ?auto_25529 ?auto_25525 ) ) ( not ( = ?auto_25529 ?auto_25524 ) ) ( not ( = ?auto_25523 ?auto_25527 ) ) ( not ( = ?auto_25523 ?auto_25534 ) ) ( not ( = ?auto_25523 ?auto_25521 ) ) ( not ( = ?auto_25523 ?auto_25520 ) ) ( not ( = ?auto_25533 ?auto_25526 ) ) ( not ( = ?auto_25533 ?auto_25528 ) ) ( not ( = ?auto_25533 ?auto_25531 ) ) ( not ( = ?auto_25533 ?auto_25532 ) ) ( not ( = ?auto_25507 ?auto_25513 ) ) ( not ( = ?auto_25507 ?auto_25518 ) ) ( not ( = ?auto_25508 ?auto_25513 ) ) ( not ( = ?auto_25508 ?auto_25518 ) ) ( not ( = ?auto_25509 ?auto_25513 ) ) ( not ( = ?auto_25509 ?auto_25518 ) ) ( not ( = ?auto_25510 ?auto_25513 ) ) ( not ( = ?auto_25510 ?auto_25518 ) ) ( not ( = ?auto_25511 ?auto_25513 ) ) ( not ( = ?auto_25511 ?auto_25518 ) ) ( not ( = ?auto_25513 ?auto_25533 ) ) ( not ( = ?auto_25513 ?auto_25526 ) ) ( not ( = ?auto_25513 ?auto_25528 ) ) ( not ( = ?auto_25513 ?auto_25531 ) ) ( not ( = ?auto_25513 ?auto_25532 ) ) ( not ( = ?auto_25519 ?auto_25529 ) ) ( not ( = ?auto_25519 ?auto_25530 ) ) ( not ( = ?auto_25519 ?auto_25522 ) ) ( not ( = ?auto_25519 ?auto_25525 ) ) ( not ( = ?auto_25519 ?auto_25524 ) ) ( not ( = ?auto_25516 ?auto_25523 ) ) ( not ( = ?auto_25516 ?auto_25527 ) ) ( not ( = ?auto_25516 ?auto_25534 ) ) ( not ( = ?auto_25516 ?auto_25521 ) ) ( not ( = ?auto_25516 ?auto_25520 ) ) ( not ( = ?auto_25518 ?auto_25533 ) ) ( not ( = ?auto_25518 ?auto_25526 ) ) ( not ( = ?auto_25518 ?auto_25528 ) ) ( not ( = ?auto_25518 ?auto_25531 ) ) ( not ( = ?auto_25518 ?auto_25532 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_25507 ?auto_25508 ?auto_25509 ?auto_25510 ?auto_25511 ?auto_25512 )
      ( MAKE-1CRATE ?auto_25512 ?auto_25513 )
      ( MAKE-6CRATE-VERIFY ?auto_25507 ?auto_25508 ?auto_25509 ?auto_25510 ?auto_25511 ?auto_25512 ?auto_25513 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25537 - SURFACE
      ?auto_25538 - SURFACE
    )
    :vars
    (
      ?auto_25539 - HOIST
      ?auto_25540 - PLACE
      ?auto_25542 - PLACE
      ?auto_25543 - HOIST
      ?auto_25544 - SURFACE
      ?auto_25541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25539 ?auto_25540 ) ( SURFACE-AT ?auto_25537 ?auto_25540 ) ( CLEAR ?auto_25537 ) ( IS-CRATE ?auto_25538 ) ( AVAILABLE ?auto_25539 ) ( not ( = ?auto_25542 ?auto_25540 ) ) ( HOIST-AT ?auto_25543 ?auto_25542 ) ( AVAILABLE ?auto_25543 ) ( SURFACE-AT ?auto_25538 ?auto_25542 ) ( ON ?auto_25538 ?auto_25544 ) ( CLEAR ?auto_25538 ) ( TRUCK-AT ?auto_25541 ?auto_25540 ) ( not ( = ?auto_25537 ?auto_25538 ) ) ( not ( = ?auto_25537 ?auto_25544 ) ) ( not ( = ?auto_25538 ?auto_25544 ) ) ( not ( = ?auto_25539 ?auto_25543 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25541 ?auto_25540 ?auto_25542 )
      ( !LIFT ?auto_25543 ?auto_25538 ?auto_25544 ?auto_25542 )
      ( !LOAD ?auto_25543 ?auto_25538 ?auto_25541 ?auto_25542 )
      ( !DRIVE ?auto_25541 ?auto_25542 ?auto_25540 )
      ( !UNLOAD ?auto_25539 ?auto_25538 ?auto_25541 ?auto_25540 )
      ( !DROP ?auto_25539 ?auto_25538 ?auto_25537 ?auto_25540 )
      ( MAKE-1CRATE-VERIFY ?auto_25537 ?auto_25538 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_25553 - SURFACE
      ?auto_25554 - SURFACE
      ?auto_25555 - SURFACE
      ?auto_25556 - SURFACE
      ?auto_25557 - SURFACE
      ?auto_25558 - SURFACE
      ?auto_25559 - SURFACE
      ?auto_25560 - SURFACE
    )
    :vars
    (
      ?auto_25563 - HOIST
      ?auto_25561 - PLACE
      ?auto_25566 - PLACE
      ?auto_25565 - HOIST
      ?auto_25562 - SURFACE
      ?auto_25584 - PLACE
      ?auto_25583 - HOIST
      ?auto_25580 - SURFACE
      ?auto_25575 - PLACE
      ?auto_25567 - HOIST
      ?auto_25569 - SURFACE
      ?auto_25582 - PLACE
      ?auto_25570 - HOIST
      ?auto_25571 - SURFACE
      ?auto_25577 - PLACE
      ?auto_25578 - HOIST
      ?auto_25579 - SURFACE
      ?auto_25572 - PLACE
      ?auto_25576 - HOIST
      ?auto_25581 - SURFACE
      ?auto_25573 - PLACE
      ?auto_25574 - HOIST
      ?auto_25568 - SURFACE
      ?auto_25564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25563 ?auto_25561 ) ( IS-CRATE ?auto_25560 ) ( not ( = ?auto_25566 ?auto_25561 ) ) ( HOIST-AT ?auto_25565 ?auto_25566 ) ( AVAILABLE ?auto_25565 ) ( SURFACE-AT ?auto_25560 ?auto_25566 ) ( ON ?auto_25560 ?auto_25562 ) ( CLEAR ?auto_25560 ) ( not ( = ?auto_25559 ?auto_25560 ) ) ( not ( = ?auto_25559 ?auto_25562 ) ) ( not ( = ?auto_25560 ?auto_25562 ) ) ( not ( = ?auto_25563 ?auto_25565 ) ) ( IS-CRATE ?auto_25559 ) ( not ( = ?auto_25584 ?auto_25561 ) ) ( HOIST-AT ?auto_25583 ?auto_25584 ) ( AVAILABLE ?auto_25583 ) ( SURFACE-AT ?auto_25559 ?auto_25584 ) ( ON ?auto_25559 ?auto_25580 ) ( CLEAR ?auto_25559 ) ( not ( = ?auto_25558 ?auto_25559 ) ) ( not ( = ?auto_25558 ?auto_25580 ) ) ( not ( = ?auto_25559 ?auto_25580 ) ) ( not ( = ?auto_25563 ?auto_25583 ) ) ( IS-CRATE ?auto_25558 ) ( not ( = ?auto_25575 ?auto_25561 ) ) ( HOIST-AT ?auto_25567 ?auto_25575 ) ( AVAILABLE ?auto_25567 ) ( SURFACE-AT ?auto_25558 ?auto_25575 ) ( ON ?auto_25558 ?auto_25569 ) ( CLEAR ?auto_25558 ) ( not ( = ?auto_25557 ?auto_25558 ) ) ( not ( = ?auto_25557 ?auto_25569 ) ) ( not ( = ?auto_25558 ?auto_25569 ) ) ( not ( = ?auto_25563 ?auto_25567 ) ) ( IS-CRATE ?auto_25557 ) ( not ( = ?auto_25582 ?auto_25561 ) ) ( HOIST-AT ?auto_25570 ?auto_25582 ) ( AVAILABLE ?auto_25570 ) ( SURFACE-AT ?auto_25557 ?auto_25582 ) ( ON ?auto_25557 ?auto_25571 ) ( CLEAR ?auto_25557 ) ( not ( = ?auto_25556 ?auto_25557 ) ) ( not ( = ?auto_25556 ?auto_25571 ) ) ( not ( = ?auto_25557 ?auto_25571 ) ) ( not ( = ?auto_25563 ?auto_25570 ) ) ( IS-CRATE ?auto_25556 ) ( not ( = ?auto_25577 ?auto_25561 ) ) ( HOIST-AT ?auto_25578 ?auto_25577 ) ( AVAILABLE ?auto_25578 ) ( SURFACE-AT ?auto_25556 ?auto_25577 ) ( ON ?auto_25556 ?auto_25579 ) ( CLEAR ?auto_25556 ) ( not ( = ?auto_25555 ?auto_25556 ) ) ( not ( = ?auto_25555 ?auto_25579 ) ) ( not ( = ?auto_25556 ?auto_25579 ) ) ( not ( = ?auto_25563 ?auto_25578 ) ) ( IS-CRATE ?auto_25555 ) ( not ( = ?auto_25572 ?auto_25561 ) ) ( HOIST-AT ?auto_25576 ?auto_25572 ) ( AVAILABLE ?auto_25576 ) ( SURFACE-AT ?auto_25555 ?auto_25572 ) ( ON ?auto_25555 ?auto_25581 ) ( CLEAR ?auto_25555 ) ( not ( = ?auto_25554 ?auto_25555 ) ) ( not ( = ?auto_25554 ?auto_25581 ) ) ( not ( = ?auto_25555 ?auto_25581 ) ) ( not ( = ?auto_25563 ?auto_25576 ) ) ( SURFACE-AT ?auto_25553 ?auto_25561 ) ( CLEAR ?auto_25553 ) ( IS-CRATE ?auto_25554 ) ( AVAILABLE ?auto_25563 ) ( not ( = ?auto_25573 ?auto_25561 ) ) ( HOIST-AT ?auto_25574 ?auto_25573 ) ( AVAILABLE ?auto_25574 ) ( SURFACE-AT ?auto_25554 ?auto_25573 ) ( ON ?auto_25554 ?auto_25568 ) ( CLEAR ?auto_25554 ) ( TRUCK-AT ?auto_25564 ?auto_25561 ) ( not ( = ?auto_25553 ?auto_25554 ) ) ( not ( = ?auto_25553 ?auto_25568 ) ) ( not ( = ?auto_25554 ?auto_25568 ) ) ( not ( = ?auto_25563 ?auto_25574 ) ) ( not ( = ?auto_25553 ?auto_25555 ) ) ( not ( = ?auto_25553 ?auto_25581 ) ) ( not ( = ?auto_25555 ?auto_25568 ) ) ( not ( = ?auto_25572 ?auto_25573 ) ) ( not ( = ?auto_25576 ?auto_25574 ) ) ( not ( = ?auto_25581 ?auto_25568 ) ) ( not ( = ?auto_25553 ?auto_25556 ) ) ( not ( = ?auto_25553 ?auto_25579 ) ) ( not ( = ?auto_25554 ?auto_25556 ) ) ( not ( = ?auto_25554 ?auto_25579 ) ) ( not ( = ?auto_25556 ?auto_25581 ) ) ( not ( = ?auto_25556 ?auto_25568 ) ) ( not ( = ?auto_25577 ?auto_25572 ) ) ( not ( = ?auto_25577 ?auto_25573 ) ) ( not ( = ?auto_25578 ?auto_25576 ) ) ( not ( = ?auto_25578 ?auto_25574 ) ) ( not ( = ?auto_25579 ?auto_25581 ) ) ( not ( = ?auto_25579 ?auto_25568 ) ) ( not ( = ?auto_25553 ?auto_25557 ) ) ( not ( = ?auto_25553 ?auto_25571 ) ) ( not ( = ?auto_25554 ?auto_25557 ) ) ( not ( = ?auto_25554 ?auto_25571 ) ) ( not ( = ?auto_25555 ?auto_25557 ) ) ( not ( = ?auto_25555 ?auto_25571 ) ) ( not ( = ?auto_25557 ?auto_25579 ) ) ( not ( = ?auto_25557 ?auto_25581 ) ) ( not ( = ?auto_25557 ?auto_25568 ) ) ( not ( = ?auto_25582 ?auto_25577 ) ) ( not ( = ?auto_25582 ?auto_25572 ) ) ( not ( = ?auto_25582 ?auto_25573 ) ) ( not ( = ?auto_25570 ?auto_25578 ) ) ( not ( = ?auto_25570 ?auto_25576 ) ) ( not ( = ?auto_25570 ?auto_25574 ) ) ( not ( = ?auto_25571 ?auto_25579 ) ) ( not ( = ?auto_25571 ?auto_25581 ) ) ( not ( = ?auto_25571 ?auto_25568 ) ) ( not ( = ?auto_25553 ?auto_25558 ) ) ( not ( = ?auto_25553 ?auto_25569 ) ) ( not ( = ?auto_25554 ?auto_25558 ) ) ( not ( = ?auto_25554 ?auto_25569 ) ) ( not ( = ?auto_25555 ?auto_25558 ) ) ( not ( = ?auto_25555 ?auto_25569 ) ) ( not ( = ?auto_25556 ?auto_25558 ) ) ( not ( = ?auto_25556 ?auto_25569 ) ) ( not ( = ?auto_25558 ?auto_25571 ) ) ( not ( = ?auto_25558 ?auto_25579 ) ) ( not ( = ?auto_25558 ?auto_25581 ) ) ( not ( = ?auto_25558 ?auto_25568 ) ) ( not ( = ?auto_25575 ?auto_25582 ) ) ( not ( = ?auto_25575 ?auto_25577 ) ) ( not ( = ?auto_25575 ?auto_25572 ) ) ( not ( = ?auto_25575 ?auto_25573 ) ) ( not ( = ?auto_25567 ?auto_25570 ) ) ( not ( = ?auto_25567 ?auto_25578 ) ) ( not ( = ?auto_25567 ?auto_25576 ) ) ( not ( = ?auto_25567 ?auto_25574 ) ) ( not ( = ?auto_25569 ?auto_25571 ) ) ( not ( = ?auto_25569 ?auto_25579 ) ) ( not ( = ?auto_25569 ?auto_25581 ) ) ( not ( = ?auto_25569 ?auto_25568 ) ) ( not ( = ?auto_25553 ?auto_25559 ) ) ( not ( = ?auto_25553 ?auto_25580 ) ) ( not ( = ?auto_25554 ?auto_25559 ) ) ( not ( = ?auto_25554 ?auto_25580 ) ) ( not ( = ?auto_25555 ?auto_25559 ) ) ( not ( = ?auto_25555 ?auto_25580 ) ) ( not ( = ?auto_25556 ?auto_25559 ) ) ( not ( = ?auto_25556 ?auto_25580 ) ) ( not ( = ?auto_25557 ?auto_25559 ) ) ( not ( = ?auto_25557 ?auto_25580 ) ) ( not ( = ?auto_25559 ?auto_25569 ) ) ( not ( = ?auto_25559 ?auto_25571 ) ) ( not ( = ?auto_25559 ?auto_25579 ) ) ( not ( = ?auto_25559 ?auto_25581 ) ) ( not ( = ?auto_25559 ?auto_25568 ) ) ( not ( = ?auto_25584 ?auto_25575 ) ) ( not ( = ?auto_25584 ?auto_25582 ) ) ( not ( = ?auto_25584 ?auto_25577 ) ) ( not ( = ?auto_25584 ?auto_25572 ) ) ( not ( = ?auto_25584 ?auto_25573 ) ) ( not ( = ?auto_25583 ?auto_25567 ) ) ( not ( = ?auto_25583 ?auto_25570 ) ) ( not ( = ?auto_25583 ?auto_25578 ) ) ( not ( = ?auto_25583 ?auto_25576 ) ) ( not ( = ?auto_25583 ?auto_25574 ) ) ( not ( = ?auto_25580 ?auto_25569 ) ) ( not ( = ?auto_25580 ?auto_25571 ) ) ( not ( = ?auto_25580 ?auto_25579 ) ) ( not ( = ?auto_25580 ?auto_25581 ) ) ( not ( = ?auto_25580 ?auto_25568 ) ) ( not ( = ?auto_25553 ?auto_25560 ) ) ( not ( = ?auto_25553 ?auto_25562 ) ) ( not ( = ?auto_25554 ?auto_25560 ) ) ( not ( = ?auto_25554 ?auto_25562 ) ) ( not ( = ?auto_25555 ?auto_25560 ) ) ( not ( = ?auto_25555 ?auto_25562 ) ) ( not ( = ?auto_25556 ?auto_25560 ) ) ( not ( = ?auto_25556 ?auto_25562 ) ) ( not ( = ?auto_25557 ?auto_25560 ) ) ( not ( = ?auto_25557 ?auto_25562 ) ) ( not ( = ?auto_25558 ?auto_25560 ) ) ( not ( = ?auto_25558 ?auto_25562 ) ) ( not ( = ?auto_25560 ?auto_25580 ) ) ( not ( = ?auto_25560 ?auto_25569 ) ) ( not ( = ?auto_25560 ?auto_25571 ) ) ( not ( = ?auto_25560 ?auto_25579 ) ) ( not ( = ?auto_25560 ?auto_25581 ) ) ( not ( = ?auto_25560 ?auto_25568 ) ) ( not ( = ?auto_25566 ?auto_25584 ) ) ( not ( = ?auto_25566 ?auto_25575 ) ) ( not ( = ?auto_25566 ?auto_25582 ) ) ( not ( = ?auto_25566 ?auto_25577 ) ) ( not ( = ?auto_25566 ?auto_25572 ) ) ( not ( = ?auto_25566 ?auto_25573 ) ) ( not ( = ?auto_25565 ?auto_25583 ) ) ( not ( = ?auto_25565 ?auto_25567 ) ) ( not ( = ?auto_25565 ?auto_25570 ) ) ( not ( = ?auto_25565 ?auto_25578 ) ) ( not ( = ?auto_25565 ?auto_25576 ) ) ( not ( = ?auto_25565 ?auto_25574 ) ) ( not ( = ?auto_25562 ?auto_25580 ) ) ( not ( = ?auto_25562 ?auto_25569 ) ) ( not ( = ?auto_25562 ?auto_25571 ) ) ( not ( = ?auto_25562 ?auto_25579 ) ) ( not ( = ?auto_25562 ?auto_25581 ) ) ( not ( = ?auto_25562 ?auto_25568 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_25553 ?auto_25554 ?auto_25555 ?auto_25556 ?auto_25557 ?auto_25558 ?auto_25559 )
      ( MAKE-1CRATE ?auto_25559 ?auto_25560 )
      ( MAKE-7CRATE-VERIFY ?auto_25553 ?auto_25554 ?auto_25555 ?auto_25556 ?auto_25557 ?auto_25558 ?auto_25559 ?auto_25560 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25587 - SURFACE
      ?auto_25588 - SURFACE
    )
    :vars
    (
      ?auto_25589 - HOIST
      ?auto_25590 - PLACE
      ?auto_25592 - PLACE
      ?auto_25593 - HOIST
      ?auto_25594 - SURFACE
      ?auto_25591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25589 ?auto_25590 ) ( SURFACE-AT ?auto_25587 ?auto_25590 ) ( CLEAR ?auto_25587 ) ( IS-CRATE ?auto_25588 ) ( AVAILABLE ?auto_25589 ) ( not ( = ?auto_25592 ?auto_25590 ) ) ( HOIST-AT ?auto_25593 ?auto_25592 ) ( AVAILABLE ?auto_25593 ) ( SURFACE-AT ?auto_25588 ?auto_25592 ) ( ON ?auto_25588 ?auto_25594 ) ( CLEAR ?auto_25588 ) ( TRUCK-AT ?auto_25591 ?auto_25590 ) ( not ( = ?auto_25587 ?auto_25588 ) ) ( not ( = ?auto_25587 ?auto_25594 ) ) ( not ( = ?auto_25588 ?auto_25594 ) ) ( not ( = ?auto_25589 ?auto_25593 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25591 ?auto_25590 ?auto_25592 )
      ( !LIFT ?auto_25593 ?auto_25588 ?auto_25594 ?auto_25592 )
      ( !LOAD ?auto_25593 ?auto_25588 ?auto_25591 ?auto_25592 )
      ( !DRIVE ?auto_25591 ?auto_25592 ?auto_25590 )
      ( !UNLOAD ?auto_25589 ?auto_25588 ?auto_25591 ?auto_25590 )
      ( !DROP ?auto_25589 ?auto_25588 ?auto_25587 ?auto_25590 )
      ( MAKE-1CRATE-VERIFY ?auto_25587 ?auto_25588 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_25604 - SURFACE
      ?auto_25605 - SURFACE
      ?auto_25606 - SURFACE
      ?auto_25607 - SURFACE
      ?auto_25608 - SURFACE
      ?auto_25609 - SURFACE
      ?auto_25610 - SURFACE
      ?auto_25612 - SURFACE
      ?auto_25611 - SURFACE
    )
    :vars
    (
      ?auto_25618 - HOIST
      ?auto_25616 - PLACE
      ?auto_25613 - PLACE
      ?auto_25615 - HOIST
      ?auto_25614 - SURFACE
      ?auto_25637 - PLACE
      ?auto_25631 - HOIST
      ?auto_25619 - SURFACE
      ?auto_25627 - PLACE
      ?auto_25621 - HOIST
      ?auto_25636 - SURFACE
      ?auto_25623 - PLACE
      ?auto_25622 - HOIST
      ?auto_25628 - SURFACE
      ?auto_25624 - PLACE
      ?auto_25630 - HOIST
      ?auto_25632 - SURFACE
      ?auto_25634 - PLACE
      ?auto_25633 - HOIST
      ?auto_25635 - SURFACE
      ?auto_25620 - PLACE
      ?auto_25625 - HOIST
      ?auto_25626 - SURFACE
      ?auto_25639 - PLACE
      ?auto_25638 - HOIST
      ?auto_25629 - SURFACE
      ?auto_25617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25618 ?auto_25616 ) ( IS-CRATE ?auto_25611 ) ( not ( = ?auto_25613 ?auto_25616 ) ) ( HOIST-AT ?auto_25615 ?auto_25613 ) ( AVAILABLE ?auto_25615 ) ( SURFACE-AT ?auto_25611 ?auto_25613 ) ( ON ?auto_25611 ?auto_25614 ) ( CLEAR ?auto_25611 ) ( not ( = ?auto_25612 ?auto_25611 ) ) ( not ( = ?auto_25612 ?auto_25614 ) ) ( not ( = ?auto_25611 ?auto_25614 ) ) ( not ( = ?auto_25618 ?auto_25615 ) ) ( IS-CRATE ?auto_25612 ) ( not ( = ?auto_25637 ?auto_25616 ) ) ( HOIST-AT ?auto_25631 ?auto_25637 ) ( AVAILABLE ?auto_25631 ) ( SURFACE-AT ?auto_25612 ?auto_25637 ) ( ON ?auto_25612 ?auto_25619 ) ( CLEAR ?auto_25612 ) ( not ( = ?auto_25610 ?auto_25612 ) ) ( not ( = ?auto_25610 ?auto_25619 ) ) ( not ( = ?auto_25612 ?auto_25619 ) ) ( not ( = ?auto_25618 ?auto_25631 ) ) ( IS-CRATE ?auto_25610 ) ( not ( = ?auto_25627 ?auto_25616 ) ) ( HOIST-AT ?auto_25621 ?auto_25627 ) ( AVAILABLE ?auto_25621 ) ( SURFACE-AT ?auto_25610 ?auto_25627 ) ( ON ?auto_25610 ?auto_25636 ) ( CLEAR ?auto_25610 ) ( not ( = ?auto_25609 ?auto_25610 ) ) ( not ( = ?auto_25609 ?auto_25636 ) ) ( not ( = ?auto_25610 ?auto_25636 ) ) ( not ( = ?auto_25618 ?auto_25621 ) ) ( IS-CRATE ?auto_25609 ) ( not ( = ?auto_25623 ?auto_25616 ) ) ( HOIST-AT ?auto_25622 ?auto_25623 ) ( AVAILABLE ?auto_25622 ) ( SURFACE-AT ?auto_25609 ?auto_25623 ) ( ON ?auto_25609 ?auto_25628 ) ( CLEAR ?auto_25609 ) ( not ( = ?auto_25608 ?auto_25609 ) ) ( not ( = ?auto_25608 ?auto_25628 ) ) ( not ( = ?auto_25609 ?auto_25628 ) ) ( not ( = ?auto_25618 ?auto_25622 ) ) ( IS-CRATE ?auto_25608 ) ( not ( = ?auto_25624 ?auto_25616 ) ) ( HOIST-AT ?auto_25630 ?auto_25624 ) ( AVAILABLE ?auto_25630 ) ( SURFACE-AT ?auto_25608 ?auto_25624 ) ( ON ?auto_25608 ?auto_25632 ) ( CLEAR ?auto_25608 ) ( not ( = ?auto_25607 ?auto_25608 ) ) ( not ( = ?auto_25607 ?auto_25632 ) ) ( not ( = ?auto_25608 ?auto_25632 ) ) ( not ( = ?auto_25618 ?auto_25630 ) ) ( IS-CRATE ?auto_25607 ) ( not ( = ?auto_25634 ?auto_25616 ) ) ( HOIST-AT ?auto_25633 ?auto_25634 ) ( AVAILABLE ?auto_25633 ) ( SURFACE-AT ?auto_25607 ?auto_25634 ) ( ON ?auto_25607 ?auto_25635 ) ( CLEAR ?auto_25607 ) ( not ( = ?auto_25606 ?auto_25607 ) ) ( not ( = ?auto_25606 ?auto_25635 ) ) ( not ( = ?auto_25607 ?auto_25635 ) ) ( not ( = ?auto_25618 ?auto_25633 ) ) ( IS-CRATE ?auto_25606 ) ( not ( = ?auto_25620 ?auto_25616 ) ) ( HOIST-AT ?auto_25625 ?auto_25620 ) ( AVAILABLE ?auto_25625 ) ( SURFACE-AT ?auto_25606 ?auto_25620 ) ( ON ?auto_25606 ?auto_25626 ) ( CLEAR ?auto_25606 ) ( not ( = ?auto_25605 ?auto_25606 ) ) ( not ( = ?auto_25605 ?auto_25626 ) ) ( not ( = ?auto_25606 ?auto_25626 ) ) ( not ( = ?auto_25618 ?auto_25625 ) ) ( SURFACE-AT ?auto_25604 ?auto_25616 ) ( CLEAR ?auto_25604 ) ( IS-CRATE ?auto_25605 ) ( AVAILABLE ?auto_25618 ) ( not ( = ?auto_25639 ?auto_25616 ) ) ( HOIST-AT ?auto_25638 ?auto_25639 ) ( AVAILABLE ?auto_25638 ) ( SURFACE-AT ?auto_25605 ?auto_25639 ) ( ON ?auto_25605 ?auto_25629 ) ( CLEAR ?auto_25605 ) ( TRUCK-AT ?auto_25617 ?auto_25616 ) ( not ( = ?auto_25604 ?auto_25605 ) ) ( not ( = ?auto_25604 ?auto_25629 ) ) ( not ( = ?auto_25605 ?auto_25629 ) ) ( not ( = ?auto_25618 ?auto_25638 ) ) ( not ( = ?auto_25604 ?auto_25606 ) ) ( not ( = ?auto_25604 ?auto_25626 ) ) ( not ( = ?auto_25606 ?auto_25629 ) ) ( not ( = ?auto_25620 ?auto_25639 ) ) ( not ( = ?auto_25625 ?auto_25638 ) ) ( not ( = ?auto_25626 ?auto_25629 ) ) ( not ( = ?auto_25604 ?auto_25607 ) ) ( not ( = ?auto_25604 ?auto_25635 ) ) ( not ( = ?auto_25605 ?auto_25607 ) ) ( not ( = ?auto_25605 ?auto_25635 ) ) ( not ( = ?auto_25607 ?auto_25626 ) ) ( not ( = ?auto_25607 ?auto_25629 ) ) ( not ( = ?auto_25634 ?auto_25620 ) ) ( not ( = ?auto_25634 ?auto_25639 ) ) ( not ( = ?auto_25633 ?auto_25625 ) ) ( not ( = ?auto_25633 ?auto_25638 ) ) ( not ( = ?auto_25635 ?auto_25626 ) ) ( not ( = ?auto_25635 ?auto_25629 ) ) ( not ( = ?auto_25604 ?auto_25608 ) ) ( not ( = ?auto_25604 ?auto_25632 ) ) ( not ( = ?auto_25605 ?auto_25608 ) ) ( not ( = ?auto_25605 ?auto_25632 ) ) ( not ( = ?auto_25606 ?auto_25608 ) ) ( not ( = ?auto_25606 ?auto_25632 ) ) ( not ( = ?auto_25608 ?auto_25635 ) ) ( not ( = ?auto_25608 ?auto_25626 ) ) ( not ( = ?auto_25608 ?auto_25629 ) ) ( not ( = ?auto_25624 ?auto_25634 ) ) ( not ( = ?auto_25624 ?auto_25620 ) ) ( not ( = ?auto_25624 ?auto_25639 ) ) ( not ( = ?auto_25630 ?auto_25633 ) ) ( not ( = ?auto_25630 ?auto_25625 ) ) ( not ( = ?auto_25630 ?auto_25638 ) ) ( not ( = ?auto_25632 ?auto_25635 ) ) ( not ( = ?auto_25632 ?auto_25626 ) ) ( not ( = ?auto_25632 ?auto_25629 ) ) ( not ( = ?auto_25604 ?auto_25609 ) ) ( not ( = ?auto_25604 ?auto_25628 ) ) ( not ( = ?auto_25605 ?auto_25609 ) ) ( not ( = ?auto_25605 ?auto_25628 ) ) ( not ( = ?auto_25606 ?auto_25609 ) ) ( not ( = ?auto_25606 ?auto_25628 ) ) ( not ( = ?auto_25607 ?auto_25609 ) ) ( not ( = ?auto_25607 ?auto_25628 ) ) ( not ( = ?auto_25609 ?auto_25632 ) ) ( not ( = ?auto_25609 ?auto_25635 ) ) ( not ( = ?auto_25609 ?auto_25626 ) ) ( not ( = ?auto_25609 ?auto_25629 ) ) ( not ( = ?auto_25623 ?auto_25624 ) ) ( not ( = ?auto_25623 ?auto_25634 ) ) ( not ( = ?auto_25623 ?auto_25620 ) ) ( not ( = ?auto_25623 ?auto_25639 ) ) ( not ( = ?auto_25622 ?auto_25630 ) ) ( not ( = ?auto_25622 ?auto_25633 ) ) ( not ( = ?auto_25622 ?auto_25625 ) ) ( not ( = ?auto_25622 ?auto_25638 ) ) ( not ( = ?auto_25628 ?auto_25632 ) ) ( not ( = ?auto_25628 ?auto_25635 ) ) ( not ( = ?auto_25628 ?auto_25626 ) ) ( not ( = ?auto_25628 ?auto_25629 ) ) ( not ( = ?auto_25604 ?auto_25610 ) ) ( not ( = ?auto_25604 ?auto_25636 ) ) ( not ( = ?auto_25605 ?auto_25610 ) ) ( not ( = ?auto_25605 ?auto_25636 ) ) ( not ( = ?auto_25606 ?auto_25610 ) ) ( not ( = ?auto_25606 ?auto_25636 ) ) ( not ( = ?auto_25607 ?auto_25610 ) ) ( not ( = ?auto_25607 ?auto_25636 ) ) ( not ( = ?auto_25608 ?auto_25610 ) ) ( not ( = ?auto_25608 ?auto_25636 ) ) ( not ( = ?auto_25610 ?auto_25628 ) ) ( not ( = ?auto_25610 ?auto_25632 ) ) ( not ( = ?auto_25610 ?auto_25635 ) ) ( not ( = ?auto_25610 ?auto_25626 ) ) ( not ( = ?auto_25610 ?auto_25629 ) ) ( not ( = ?auto_25627 ?auto_25623 ) ) ( not ( = ?auto_25627 ?auto_25624 ) ) ( not ( = ?auto_25627 ?auto_25634 ) ) ( not ( = ?auto_25627 ?auto_25620 ) ) ( not ( = ?auto_25627 ?auto_25639 ) ) ( not ( = ?auto_25621 ?auto_25622 ) ) ( not ( = ?auto_25621 ?auto_25630 ) ) ( not ( = ?auto_25621 ?auto_25633 ) ) ( not ( = ?auto_25621 ?auto_25625 ) ) ( not ( = ?auto_25621 ?auto_25638 ) ) ( not ( = ?auto_25636 ?auto_25628 ) ) ( not ( = ?auto_25636 ?auto_25632 ) ) ( not ( = ?auto_25636 ?auto_25635 ) ) ( not ( = ?auto_25636 ?auto_25626 ) ) ( not ( = ?auto_25636 ?auto_25629 ) ) ( not ( = ?auto_25604 ?auto_25612 ) ) ( not ( = ?auto_25604 ?auto_25619 ) ) ( not ( = ?auto_25605 ?auto_25612 ) ) ( not ( = ?auto_25605 ?auto_25619 ) ) ( not ( = ?auto_25606 ?auto_25612 ) ) ( not ( = ?auto_25606 ?auto_25619 ) ) ( not ( = ?auto_25607 ?auto_25612 ) ) ( not ( = ?auto_25607 ?auto_25619 ) ) ( not ( = ?auto_25608 ?auto_25612 ) ) ( not ( = ?auto_25608 ?auto_25619 ) ) ( not ( = ?auto_25609 ?auto_25612 ) ) ( not ( = ?auto_25609 ?auto_25619 ) ) ( not ( = ?auto_25612 ?auto_25636 ) ) ( not ( = ?auto_25612 ?auto_25628 ) ) ( not ( = ?auto_25612 ?auto_25632 ) ) ( not ( = ?auto_25612 ?auto_25635 ) ) ( not ( = ?auto_25612 ?auto_25626 ) ) ( not ( = ?auto_25612 ?auto_25629 ) ) ( not ( = ?auto_25637 ?auto_25627 ) ) ( not ( = ?auto_25637 ?auto_25623 ) ) ( not ( = ?auto_25637 ?auto_25624 ) ) ( not ( = ?auto_25637 ?auto_25634 ) ) ( not ( = ?auto_25637 ?auto_25620 ) ) ( not ( = ?auto_25637 ?auto_25639 ) ) ( not ( = ?auto_25631 ?auto_25621 ) ) ( not ( = ?auto_25631 ?auto_25622 ) ) ( not ( = ?auto_25631 ?auto_25630 ) ) ( not ( = ?auto_25631 ?auto_25633 ) ) ( not ( = ?auto_25631 ?auto_25625 ) ) ( not ( = ?auto_25631 ?auto_25638 ) ) ( not ( = ?auto_25619 ?auto_25636 ) ) ( not ( = ?auto_25619 ?auto_25628 ) ) ( not ( = ?auto_25619 ?auto_25632 ) ) ( not ( = ?auto_25619 ?auto_25635 ) ) ( not ( = ?auto_25619 ?auto_25626 ) ) ( not ( = ?auto_25619 ?auto_25629 ) ) ( not ( = ?auto_25604 ?auto_25611 ) ) ( not ( = ?auto_25604 ?auto_25614 ) ) ( not ( = ?auto_25605 ?auto_25611 ) ) ( not ( = ?auto_25605 ?auto_25614 ) ) ( not ( = ?auto_25606 ?auto_25611 ) ) ( not ( = ?auto_25606 ?auto_25614 ) ) ( not ( = ?auto_25607 ?auto_25611 ) ) ( not ( = ?auto_25607 ?auto_25614 ) ) ( not ( = ?auto_25608 ?auto_25611 ) ) ( not ( = ?auto_25608 ?auto_25614 ) ) ( not ( = ?auto_25609 ?auto_25611 ) ) ( not ( = ?auto_25609 ?auto_25614 ) ) ( not ( = ?auto_25610 ?auto_25611 ) ) ( not ( = ?auto_25610 ?auto_25614 ) ) ( not ( = ?auto_25611 ?auto_25619 ) ) ( not ( = ?auto_25611 ?auto_25636 ) ) ( not ( = ?auto_25611 ?auto_25628 ) ) ( not ( = ?auto_25611 ?auto_25632 ) ) ( not ( = ?auto_25611 ?auto_25635 ) ) ( not ( = ?auto_25611 ?auto_25626 ) ) ( not ( = ?auto_25611 ?auto_25629 ) ) ( not ( = ?auto_25613 ?auto_25637 ) ) ( not ( = ?auto_25613 ?auto_25627 ) ) ( not ( = ?auto_25613 ?auto_25623 ) ) ( not ( = ?auto_25613 ?auto_25624 ) ) ( not ( = ?auto_25613 ?auto_25634 ) ) ( not ( = ?auto_25613 ?auto_25620 ) ) ( not ( = ?auto_25613 ?auto_25639 ) ) ( not ( = ?auto_25615 ?auto_25631 ) ) ( not ( = ?auto_25615 ?auto_25621 ) ) ( not ( = ?auto_25615 ?auto_25622 ) ) ( not ( = ?auto_25615 ?auto_25630 ) ) ( not ( = ?auto_25615 ?auto_25633 ) ) ( not ( = ?auto_25615 ?auto_25625 ) ) ( not ( = ?auto_25615 ?auto_25638 ) ) ( not ( = ?auto_25614 ?auto_25619 ) ) ( not ( = ?auto_25614 ?auto_25636 ) ) ( not ( = ?auto_25614 ?auto_25628 ) ) ( not ( = ?auto_25614 ?auto_25632 ) ) ( not ( = ?auto_25614 ?auto_25635 ) ) ( not ( = ?auto_25614 ?auto_25626 ) ) ( not ( = ?auto_25614 ?auto_25629 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_25604 ?auto_25605 ?auto_25606 ?auto_25607 ?auto_25608 ?auto_25609 ?auto_25610 ?auto_25612 )
      ( MAKE-1CRATE ?auto_25612 ?auto_25611 )
      ( MAKE-8CRATE-VERIFY ?auto_25604 ?auto_25605 ?auto_25606 ?auto_25607 ?auto_25608 ?auto_25609 ?auto_25610 ?auto_25612 ?auto_25611 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25642 - SURFACE
      ?auto_25643 - SURFACE
    )
    :vars
    (
      ?auto_25644 - HOIST
      ?auto_25645 - PLACE
      ?auto_25647 - PLACE
      ?auto_25648 - HOIST
      ?auto_25649 - SURFACE
      ?auto_25646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25644 ?auto_25645 ) ( SURFACE-AT ?auto_25642 ?auto_25645 ) ( CLEAR ?auto_25642 ) ( IS-CRATE ?auto_25643 ) ( AVAILABLE ?auto_25644 ) ( not ( = ?auto_25647 ?auto_25645 ) ) ( HOIST-AT ?auto_25648 ?auto_25647 ) ( AVAILABLE ?auto_25648 ) ( SURFACE-AT ?auto_25643 ?auto_25647 ) ( ON ?auto_25643 ?auto_25649 ) ( CLEAR ?auto_25643 ) ( TRUCK-AT ?auto_25646 ?auto_25645 ) ( not ( = ?auto_25642 ?auto_25643 ) ) ( not ( = ?auto_25642 ?auto_25649 ) ) ( not ( = ?auto_25643 ?auto_25649 ) ) ( not ( = ?auto_25644 ?auto_25648 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25646 ?auto_25645 ?auto_25647 )
      ( !LIFT ?auto_25648 ?auto_25643 ?auto_25649 ?auto_25647 )
      ( !LOAD ?auto_25648 ?auto_25643 ?auto_25646 ?auto_25647 )
      ( !DRIVE ?auto_25646 ?auto_25647 ?auto_25645 )
      ( !UNLOAD ?auto_25644 ?auto_25643 ?auto_25646 ?auto_25645 )
      ( !DROP ?auto_25644 ?auto_25643 ?auto_25642 ?auto_25645 )
      ( MAKE-1CRATE-VERIFY ?auto_25642 ?auto_25643 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_25660 - SURFACE
      ?auto_25661 - SURFACE
      ?auto_25662 - SURFACE
      ?auto_25663 - SURFACE
      ?auto_25664 - SURFACE
      ?auto_25665 - SURFACE
      ?auto_25666 - SURFACE
      ?auto_25669 - SURFACE
      ?auto_25668 - SURFACE
      ?auto_25667 - SURFACE
    )
    :vars
    (
      ?auto_25675 - HOIST
      ?auto_25671 - PLACE
      ?auto_25670 - PLACE
      ?auto_25672 - HOIST
      ?auto_25674 - SURFACE
      ?auto_25678 - PLACE
      ?auto_25697 - HOIST
      ?auto_25699 - SURFACE
      ?auto_25698 - PLACE
      ?auto_25686 - HOIST
      ?auto_25694 - SURFACE
      ?auto_25682 - PLACE
      ?auto_25679 - HOIST
      ?auto_25680 - SURFACE
      ?auto_25691 - PLACE
      ?auto_25677 - HOIST
      ?auto_25684 - SURFACE
      ?auto_25690 - PLACE
      ?auto_25685 - HOIST
      ?auto_25687 - SURFACE
      ?auto_25681 - PLACE
      ?auto_25676 - HOIST
      ?auto_25692 - SURFACE
      ?auto_25696 - PLACE
      ?auto_25689 - HOIST
      ?auto_25688 - SURFACE
      ?auto_25693 - PLACE
      ?auto_25695 - HOIST
      ?auto_25683 - SURFACE
      ?auto_25673 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25675 ?auto_25671 ) ( IS-CRATE ?auto_25667 ) ( not ( = ?auto_25670 ?auto_25671 ) ) ( HOIST-AT ?auto_25672 ?auto_25670 ) ( AVAILABLE ?auto_25672 ) ( SURFACE-AT ?auto_25667 ?auto_25670 ) ( ON ?auto_25667 ?auto_25674 ) ( CLEAR ?auto_25667 ) ( not ( = ?auto_25668 ?auto_25667 ) ) ( not ( = ?auto_25668 ?auto_25674 ) ) ( not ( = ?auto_25667 ?auto_25674 ) ) ( not ( = ?auto_25675 ?auto_25672 ) ) ( IS-CRATE ?auto_25668 ) ( not ( = ?auto_25678 ?auto_25671 ) ) ( HOIST-AT ?auto_25697 ?auto_25678 ) ( AVAILABLE ?auto_25697 ) ( SURFACE-AT ?auto_25668 ?auto_25678 ) ( ON ?auto_25668 ?auto_25699 ) ( CLEAR ?auto_25668 ) ( not ( = ?auto_25669 ?auto_25668 ) ) ( not ( = ?auto_25669 ?auto_25699 ) ) ( not ( = ?auto_25668 ?auto_25699 ) ) ( not ( = ?auto_25675 ?auto_25697 ) ) ( IS-CRATE ?auto_25669 ) ( not ( = ?auto_25698 ?auto_25671 ) ) ( HOIST-AT ?auto_25686 ?auto_25698 ) ( AVAILABLE ?auto_25686 ) ( SURFACE-AT ?auto_25669 ?auto_25698 ) ( ON ?auto_25669 ?auto_25694 ) ( CLEAR ?auto_25669 ) ( not ( = ?auto_25666 ?auto_25669 ) ) ( not ( = ?auto_25666 ?auto_25694 ) ) ( not ( = ?auto_25669 ?auto_25694 ) ) ( not ( = ?auto_25675 ?auto_25686 ) ) ( IS-CRATE ?auto_25666 ) ( not ( = ?auto_25682 ?auto_25671 ) ) ( HOIST-AT ?auto_25679 ?auto_25682 ) ( AVAILABLE ?auto_25679 ) ( SURFACE-AT ?auto_25666 ?auto_25682 ) ( ON ?auto_25666 ?auto_25680 ) ( CLEAR ?auto_25666 ) ( not ( = ?auto_25665 ?auto_25666 ) ) ( not ( = ?auto_25665 ?auto_25680 ) ) ( not ( = ?auto_25666 ?auto_25680 ) ) ( not ( = ?auto_25675 ?auto_25679 ) ) ( IS-CRATE ?auto_25665 ) ( not ( = ?auto_25691 ?auto_25671 ) ) ( HOIST-AT ?auto_25677 ?auto_25691 ) ( AVAILABLE ?auto_25677 ) ( SURFACE-AT ?auto_25665 ?auto_25691 ) ( ON ?auto_25665 ?auto_25684 ) ( CLEAR ?auto_25665 ) ( not ( = ?auto_25664 ?auto_25665 ) ) ( not ( = ?auto_25664 ?auto_25684 ) ) ( not ( = ?auto_25665 ?auto_25684 ) ) ( not ( = ?auto_25675 ?auto_25677 ) ) ( IS-CRATE ?auto_25664 ) ( not ( = ?auto_25690 ?auto_25671 ) ) ( HOIST-AT ?auto_25685 ?auto_25690 ) ( AVAILABLE ?auto_25685 ) ( SURFACE-AT ?auto_25664 ?auto_25690 ) ( ON ?auto_25664 ?auto_25687 ) ( CLEAR ?auto_25664 ) ( not ( = ?auto_25663 ?auto_25664 ) ) ( not ( = ?auto_25663 ?auto_25687 ) ) ( not ( = ?auto_25664 ?auto_25687 ) ) ( not ( = ?auto_25675 ?auto_25685 ) ) ( IS-CRATE ?auto_25663 ) ( not ( = ?auto_25681 ?auto_25671 ) ) ( HOIST-AT ?auto_25676 ?auto_25681 ) ( AVAILABLE ?auto_25676 ) ( SURFACE-AT ?auto_25663 ?auto_25681 ) ( ON ?auto_25663 ?auto_25692 ) ( CLEAR ?auto_25663 ) ( not ( = ?auto_25662 ?auto_25663 ) ) ( not ( = ?auto_25662 ?auto_25692 ) ) ( not ( = ?auto_25663 ?auto_25692 ) ) ( not ( = ?auto_25675 ?auto_25676 ) ) ( IS-CRATE ?auto_25662 ) ( not ( = ?auto_25696 ?auto_25671 ) ) ( HOIST-AT ?auto_25689 ?auto_25696 ) ( AVAILABLE ?auto_25689 ) ( SURFACE-AT ?auto_25662 ?auto_25696 ) ( ON ?auto_25662 ?auto_25688 ) ( CLEAR ?auto_25662 ) ( not ( = ?auto_25661 ?auto_25662 ) ) ( not ( = ?auto_25661 ?auto_25688 ) ) ( not ( = ?auto_25662 ?auto_25688 ) ) ( not ( = ?auto_25675 ?auto_25689 ) ) ( SURFACE-AT ?auto_25660 ?auto_25671 ) ( CLEAR ?auto_25660 ) ( IS-CRATE ?auto_25661 ) ( AVAILABLE ?auto_25675 ) ( not ( = ?auto_25693 ?auto_25671 ) ) ( HOIST-AT ?auto_25695 ?auto_25693 ) ( AVAILABLE ?auto_25695 ) ( SURFACE-AT ?auto_25661 ?auto_25693 ) ( ON ?auto_25661 ?auto_25683 ) ( CLEAR ?auto_25661 ) ( TRUCK-AT ?auto_25673 ?auto_25671 ) ( not ( = ?auto_25660 ?auto_25661 ) ) ( not ( = ?auto_25660 ?auto_25683 ) ) ( not ( = ?auto_25661 ?auto_25683 ) ) ( not ( = ?auto_25675 ?auto_25695 ) ) ( not ( = ?auto_25660 ?auto_25662 ) ) ( not ( = ?auto_25660 ?auto_25688 ) ) ( not ( = ?auto_25662 ?auto_25683 ) ) ( not ( = ?auto_25696 ?auto_25693 ) ) ( not ( = ?auto_25689 ?auto_25695 ) ) ( not ( = ?auto_25688 ?auto_25683 ) ) ( not ( = ?auto_25660 ?auto_25663 ) ) ( not ( = ?auto_25660 ?auto_25692 ) ) ( not ( = ?auto_25661 ?auto_25663 ) ) ( not ( = ?auto_25661 ?auto_25692 ) ) ( not ( = ?auto_25663 ?auto_25688 ) ) ( not ( = ?auto_25663 ?auto_25683 ) ) ( not ( = ?auto_25681 ?auto_25696 ) ) ( not ( = ?auto_25681 ?auto_25693 ) ) ( not ( = ?auto_25676 ?auto_25689 ) ) ( not ( = ?auto_25676 ?auto_25695 ) ) ( not ( = ?auto_25692 ?auto_25688 ) ) ( not ( = ?auto_25692 ?auto_25683 ) ) ( not ( = ?auto_25660 ?auto_25664 ) ) ( not ( = ?auto_25660 ?auto_25687 ) ) ( not ( = ?auto_25661 ?auto_25664 ) ) ( not ( = ?auto_25661 ?auto_25687 ) ) ( not ( = ?auto_25662 ?auto_25664 ) ) ( not ( = ?auto_25662 ?auto_25687 ) ) ( not ( = ?auto_25664 ?auto_25692 ) ) ( not ( = ?auto_25664 ?auto_25688 ) ) ( not ( = ?auto_25664 ?auto_25683 ) ) ( not ( = ?auto_25690 ?auto_25681 ) ) ( not ( = ?auto_25690 ?auto_25696 ) ) ( not ( = ?auto_25690 ?auto_25693 ) ) ( not ( = ?auto_25685 ?auto_25676 ) ) ( not ( = ?auto_25685 ?auto_25689 ) ) ( not ( = ?auto_25685 ?auto_25695 ) ) ( not ( = ?auto_25687 ?auto_25692 ) ) ( not ( = ?auto_25687 ?auto_25688 ) ) ( not ( = ?auto_25687 ?auto_25683 ) ) ( not ( = ?auto_25660 ?auto_25665 ) ) ( not ( = ?auto_25660 ?auto_25684 ) ) ( not ( = ?auto_25661 ?auto_25665 ) ) ( not ( = ?auto_25661 ?auto_25684 ) ) ( not ( = ?auto_25662 ?auto_25665 ) ) ( not ( = ?auto_25662 ?auto_25684 ) ) ( not ( = ?auto_25663 ?auto_25665 ) ) ( not ( = ?auto_25663 ?auto_25684 ) ) ( not ( = ?auto_25665 ?auto_25687 ) ) ( not ( = ?auto_25665 ?auto_25692 ) ) ( not ( = ?auto_25665 ?auto_25688 ) ) ( not ( = ?auto_25665 ?auto_25683 ) ) ( not ( = ?auto_25691 ?auto_25690 ) ) ( not ( = ?auto_25691 ?auto_25681 ) ) ( not ( = ?auto_25691 ?auto_25696 ) ) ( not ( = ?auto_25691 ?auto_25693 ) ) ( not ( = ?auto_25677 ?auto_25685 ) ) ( not ( = ?auto_25677 ?auto_25676 ) ) ( not ( = ?auto_25677 ?auto_25689 ) ) ( not ( = ?auto_25677 ?auto_25695 ) ) ( not ( = ?auto_25684 ?auto_25687 ) ) ( not ( = ?auto_25684 ?auto_25692 ) ) ( not ( = ?auto_25684 ?auto_25688 ) ) ( not ( = ?auto_25684 ?auto_25683 ) ) ( not ( = ?auto_25660 ?auto_25666 ) ) ( not ( = ?auto_25660 ?auto_25680 ) ) ( not ( = ?auto_25661 ?auto_25666 ) ) ( not ( = ?auto_25661 ?auto_25680 ) ) ( not ( = ?auto_25662 ?auto_25666 ) ) ( not ( = ?auto_25662 ?auto_25680 ) ) ( not ( = ?auto_25663 ?auto_25666 ) ) ( not ( = ?auto_25663 ?auto_25680 ) ) ( not ( = ?auto_25664 ?auto_25666 ) ) ( not ( = ?auto_25664 ?auto_25680 ) ) ( not ( = ?auto_25666 ?auto_25684 ) ) ( not ( = ?auto_25666 ?auto_25687 ) ) ( not ( = ?auto_25666 ?auto_25692 ) ) ( not ( = ?auto_25666 ?auto_25688 ) ) ( not ( = ?auto_25666 ?auto_25683 ) ) ( not ( = ?auto_25682 ?auto_25691 ) ) ( not ( = ?auto_25682 ?auto_25690 ) ) ( not ( = ?auto_25682 ?auto_25681 ) ) ( not ( = ?auto_25682 ?auto_25696 ) ) ( not ( = ?auto_25682 ?auto_25693 ) ) ( not ( = ?auto_25679 ?auto_25677 ) ) ( not ( = ?auto_25679 ?auto_25685 ) ) ( not ( = ?auto_25679 ?auto_25676 ) ) ( not ( = ?auto_25679 ?auto_25689 ) ) ( not ( = ?auto_25679 ?auto_25695 ) ) ( not ( = ?auto_25680 ?auto_25684 ) ) ( not ( = ?auto_25680 ?auto_25687 ) ) ( not ( = ?auto_25680 ?auto_25692 ) ) ( not ( = ?auto_25680 ?auto_25688 ) ) ( not ( = ?auto_25680 ?auto_25683 ) ) ( not ( = ?auto_25660 ?auto_25669 ) ) ( not ( = ?auto_25660 ?auto_25694 ) ) ( not ( = ?auto_25661 ?auto_25669 ) ) ( not ( = ?auto_25661 ?auto_25694 ) ) ( not ( = ?auto_25662 ?auto_25669 ) ) ( not ( = ?auto_25662 ?auto_25694 ) ) ( not ( = ?auto_25663 ?auto_25669 ) ) ( not ( = ?auto_25663 ?auto_25694 ) ) ( not ( = ?auto_25664 ?auto_25669 ) ) ( not ( = ?auto_25664 ?auto_25694 ) ) ( not ( = ?auto_25665 ?auto_25669 ) ) ( not ( = ?auto_25665 ?auto_25694 ) ) ( not ( = ?auto_25669 ?auto_25680 ) ) ( not ( = ?auto_25669 ?auto_25684 ) ) ( not ( = ?auto_25669 ?auto_25687 ) ) ( not ( = ?auto_25669 ?auto_25692 ) ) ( not ( = ?auto_25669 ?auto_25688 ) ) ( not ( = ?auto_25669 ?auto_25683 ) ) ( not ( = ?auto_25698 ?auto_25682 ) ) ( not ( = ?auto_25698 ?auto_25691 ) ) ( not ( = ?auto_25698 ?auto_25690 ) ) ( not ( = ?auto_25698 ?auto_25681 ) ) ( not ( = ?auto_25698 ?auto_25696 ) ) ( not ( = ?auto_25698 ?auto_25693 ) ) ( not ( = ?auto_25686 ?auto_25679 ) ) ( not ( = ?auto_25686 ?auto_25677 ) ) ( not ( = ?auto_25686 ?auto_25685 ) ) ( not ( = ?auto_25686 ?auto_25676 ) ) ( not ( = ?auto_25686 ?auto_25689 ) ) ( not ( = ?auto_25686 ?auto_25695 ) ) ( not ( = ?auto_25694 ?auto_25680 ) ) ( not ( = ?auto_25694 ?auto_25684 ) ) ( not ( = ?auto_25694 ?auto_25687 ) ) ( not ( = ?auto_25694 ?auto_25692 ) ) ( not ( = ?auto_25694 ?auto_25688 ) ) ( not ( = ?auto_25694 ?auto_25683 ) ) ( not ( = ?auto_25660 ?auto_25668 ) ) ( not ( = ?auto_25660 ?auto_25699 ) ) ( not ( = ?auto_25661 ?auto_25668 ) ) ( not ( = ?auto_25661 ?auto_25699 ) ) ( not ( = ?auto_25662 ?auto_25668 ) ) ( not ( = ?auto_25662 ?auto_25699 ) ) ( not ( = ?auto_25663 ?auto_25668 ) ) ( not ( = ?auto_25663 ?auto_25699 ) ) ( not ( = ?auto_25664 ?auto_25668 ) ) ( not ( = ?auto_25664 ?auto_25699 ) ) ( not ( = ?auto_25665 ?auto_25668 ) ) ( not ( = ?auto_25665 ?auto_25699 ) ) ( not ( = ?auto_25666 ?auto_25668 ) ) ( not ( = ?auto_25666 ?auto_25699 ) ) ( not ( = ?auto_25668 ?auto_25694 ) ) ( not ( = ?auto_25668 ?auto_25680 ) ) ( not ( = ?auto_25668 ?auto_25684 ) ) ( not ( = ?auto_25668 ?auto_25687 ) ) ( not ( = ?auto_25668 ?auto_25692 ) ) ( not ( = ?auto_25668 ?auto_25688 ) ) ( not ( = ?auto_25668 ?auto_25683 ) ) ( not ( = ?auto_25678 ?auto_25698 ) ) ( not ( = ?auto_25678 ?auto_25682 ) ) ( not ( = ?auto_25678 ?auto_25691 ) ) ( not ( = ?auto_25678 ?auto_25690 ) ) ( not ( = ?auto_25678 ?auto_25681 ) ) ( not ( = ?auto_25678 ?auto_25696 ) ) ( not ( = ?auto_25678 ?auto_25693 ) ) ( not ( = ?auto_25697 ?auto_25686 ) ) ( not ( = ?auto_25697 ?auto_25679 ) ) ( not ( = ?auto_25697 ?auto_25677 ) ) ( not ( = ?auto_25697 ?auto_25685 ) ) ( not ( = ?auto_25697 ?auto_25676 ) ) ( not ( = ?auto_25697 ?auto_25689 ) ) ( not ( = ?auto_25697 ?auto_25695 ) ) ( not ( = ?auto_25699 ?auto_25694 ) ) ( not ( = ?auto_25699 ?auto_25680 ) ) ( not ( = ?auto_25699 ?auto_25684 ) ) ( not ( = ?auto_25699 ?auto_25687 ) ) ( not ( = ?auto_25699 ?auto_25692 ) ) ( not ( = ?auto_25699 ?auto_25688 ) ) ( not ( = ?auto_25699 ?auto_25683 ) ) ( not ( = ?auto_25660 ?auto_25667 ) ) ( not ( = ?auto_25660 ?auto_25674 ) ) ( not ( = ?auto_25661 ?auto_25667 ) ) ( not ( = ?auto_25661 ?auto_25674 ) ) ( not ( = ?auto_25662 ?auto_25667 ) ) ( not ( = ?auto_25662 ?auto_25674 ) ) ( not ( = ?auto_25663 ?auto_25667 ) ) ( not ( = ?auto_25663 ?auto_25674 ) ) ( not ( = ?auto_25664 ?auto_25667 ) ) ( not ( = ?auto_25664 ?auto_25674 ) ) ( not ( = ?auto_25665 ?auto_25667 ) ) ( not ( = ?auto_25665 ?auto_25674 ) ) ( not ( = ?auto_25666 ?auto_25667 ) ) ( not ( = ?auto_25666 ?auto_25674 ) ) ( not ( = ?auto_25669 ?auto_25667 ) ) ( not ( = ?auto_25669 ?auto_25674 ) ) ( not ( = ?auto_25667 ?auto_25699 ) ) ( not ( = ?auto_25667 ?auto_25694 ) ) ( not ( = ?auto_25667 ?auto_25680 ) ) ( not ( = ?auto_25667 ?auto_25684 ) ) ( not ( = ?auto_25667 ?auto_25687 ) ) ( not ( = ?auto_25667 ?auto_25692 ) ) ( not ( = ?auto_25667 ?auto_25688 ) ) ( not ( = ?auto_25667 ?auto_25683 ) ) ( not ( = ?auto_25670 ?auto_25678 ) ) ( not ( = ?auto_25670 ?auto_25698 ) ) ( not ( = ?auto_25670 ?auto_25682 ) ) ( not ( = ?auto_25670 ?auto_25691 ) ) ( not ( = ?auto_25670 ?auto_25690 ) ) ( not ( = ?auto_25670 ?auto_25681 ) ) ( not ( = ?auto_25670 ?auto_25696 ) ) ( not ( = ?auto_25670 ?auto_25693 ) ) ( not ( = ?auto_25672 ?auto_25697 ) ) ( not ( = ?auto_25672 ?auto_25686 ) ) ( not ( = ?auto_25672 ?auto_25679 ) ) ( not ( = ?auto_25672 ?auto_25677 ) ) ( not ( = ?auto_25672 ?auto_25685 ) ) ( not ( = ?auto_25672 ?auto_25676 ) ) ( not ( = ?auto_25672 ?auto_25689 ) ) ( not ( = ?auto_25672 ?auto_25695 ) ) ( not ( = ?auto_25674 ?auto_25699 ) ) ( not ( = ?auto_25674 ?auto_25694 ) ) ( not ( = ?auto_25674 ?auto_25680 ) ) ( not ( = ?auto_25674 ?auto_25684 ) ) ( not ( = ?auto_25674 ?auto_25687 ) ) ( not ( = ?auto_25674 ?auto_25692 ) ) ( not ( = ?auto_25674 ?auto_25688 ) ) ( not ( = ?auto_25674 ?auto_25683 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_25660 ?auto_25661 ?auto_25662 ?auto_25663 ?auto_25664 ?auto_25665 ?auto_25666 ?auto_25669 ?auto_25668 )
      ( MAKE-1CRATE ?auto_25668 ?auto_25667 )
      ( MAKE-9CRATE-VERIFY ?auto_25660 ?auto_25661 ?auto_25662 ?auto_25663 ?auto_25664 ?auto_25665 ?auto_25666 ?auto_25669 ?auto_25668 ?auto_25667 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25702 - SURFACE
      ?auto_25703 - SURFACE
    )
    :vars
    (
      ?auto_25704 - HOIST
      ?auto_25705 - PLACE
      ?auto_25707 - PLACE
      ?auto_25708 - HOIST
      ?auto_25709 - SURFACE
      ?auto_25706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25704 ?auto_25705 ) ( SURFACE-AT ?auto_25702 ?auto_25705 ) ( CLEAR ?auto_25702 ) ( IS-CRATE ?auto_25703 ) ( AVAILABLE ?auto_25704 ) ( not ( = ?auto_25707 ?auto_25705 ) ) ( HOIST-AT ?auto_25708 ?auto_25707 ) ( AVAILABLE ?auto_25708 ) ( SURFACE-AT ?auto_25703 ?auto_25707 ) ( ON ?auto_25703 ?auto_25709 ) ( CLEAR ?auto_25703 ) ( TRUCK-AT ?auto_25706 ?auto_25705 ) ( not ( = ?auto_25702 ?auto_25703 ) ) ( not ( = ?auto_25702 ?auto_25709 ) ) ( not ( = ?auto_25703 ?auto_25709 ) ) ( not ( = ?auto_25704 ?auto_25708 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25706 ?auto_25705 ?auto_25707 )
      ( !LIFT ?auto_25708 ?auto_25703 ?auto_25709 ?auto_25707 )
      ( !LOAD ?auto_25708 ?auto_25703 ?auto_25706 ?auto_25707 )
      ( !DRIVE ?auto_25706 ?auto_25707 ?auto_25705 )
      ( !UNLOAD ?auto_25704 ?auto_25703 ?auto_25706 ?auto_25705 )
      ( !DROP ?auto_25704 ?auto_25703 ?auto_25702 ?auto_25705 )
      ( MAKE-1CRATE-VERIFY ?auto_25702 ?auto_25703 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_25721 - SURFACE
      ?auto_25722 - SURFACE
      ?auto_25723 - SURFACE
      ?auto_25724 - SURFACE
      ?auto_25725 - SURFACE
      ?auto_25726 - SURFACE
      ?auto_25727 - SURFACE
      ?auto_25730 - SURFACE
      ?auto_25729 - SURFACE
      ?auto_25728 - SURFACE
      ?auto_25731 - SURFACE
    )
    :vars
    (
      ?auto_25737 - HOIST
      ?auto_25735 - PLACE
      ?auto_25732 - PLACE
      ?auto_25733 - HOIST
      ?auto_25736 - SURFACE
      ?auto_25742 - PLACE
      ?auto_25763 - HOIST
      ?auto_25743 - SURFACE
      ?auto_25749 - PLACE
      ?auto_25755 - HOIST
      ?auto_25762 - SURFACE
      ?auto_25745 - PLACE
      ?auto_25750 - HOIST
      ?auto_25754 - SURFACE
      ?auto_25760 - PLACE
      ?auto_25751 - HOIST
      ?auto_25741 - SURFACE
      ?auto_25744 - PLACE
      ?auto_25764 - HOIST
      ?auto_25756 - SURFACE
      ?auto_25739 - PLACE
      ?auto_25759 - HOIST
      ?auto_25746 - SURFACE
      ?auto_25740 - PLACE
      ?auto_25753 - HOIST
      ?auto_25748 - SURFACE
      ?auto_25761 - PLACE
      ?auto_25758 - HOIST
      ?auto_25757 - SURFACE
      ?auto_25752 - PLACE
      ?auto_25747 - HOIST
      ?auto_25738 - SURFACE
      ?auto_25734 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25737 ?auto_25735 ) ( IS-CRATE ?auto_25731 ) ( not ( = ?auto_25732 ?auto_25735 ) ) ( HOIST-AT ?auto_25733 ?auto_25732 ) ( AVAILABLE ?auto_25733 ) ( SURFACE-AT ?auto_25731 ?auto_25732 ) ( ON ?auto_25731 ?auto_25736 ) ( CLEAR ?auto_25731 ) ( not ( = ?auto_25728 ?auto_25731 ) ) ( not ( = ?auto_25728 ?auto_25736 ) ) ( not ( = ?auto_25731 ?auto_25736 ) ) ( not ( = ?auto_25737 ?auto_25733 ) ) ( IS-CRATE ?auto_25728 ) ( not ( = ?auto_25742 ?auto_25735 ) ) ( HOIST-AT ?auto_25763 ?auto_25742 ) ( AVAILABLE ?auto_25763 ) ( SURFACE-AT ?auto_25728 ?auto_25742 ) ( ON ?auto_25728 ?auto_25743 ) ( CLEAR ?auto_25728 ) ( not ( = ?auto_25729 ?auto_25728 ) ) ( not ( = ?auto_25729 ?auto_25743 ) ) ( not ( = ?auto_25728 ?auto_25743 ) ) ( not ( = ?auto_25737 ?auto_25763 ) ) ( IS-CRATE ?auto_25729 ) ( not ( = ?auto_25749 ?auto_25735 ) ) ( HOIST-AT ?auto_25755 ?auto_25749 ) ( AVAILABLE ?auto_25755 ) ( SURFACE-AT ?auto_25729 ?auto_25749 ) ( ON ?auto_25729 ?auto_25762 ) ( CLEAR ?auto_25729 ) ( not ( = ?auto_25730 ?auto_25729 ) ) ( not ( = ?auto_25730 ?auto_25762 ) ) ( not ( = ?auto_25729 ?auto_25762 ) ) ( not ( = ?auto_25737 ?auto_25755 ) ) ( IS-CRATE ?auto_25730 ) ( not ( = ?auto_25745 ?auto_25735 ) ) ( HOIST-AT ?auto_25750 ?auto_25745 ) ( AVAILABLE ?auto_25750 ) ( SURFACE-AT ?auto_25730 ?auto_25745 ) ( ON ?auto_25730 ?auto_25754 ) ( CLEAR ?auto_25730 ) ( not ( = ?auto_25727 ?auto_25730 ) ) ( not ( = ?auto_25727 ?auto_25754 ) ) ( not ( = ?auto_25730 ?auto_25754 ) ) ( not ( = ?auto_25737 ?auto_25750 ) ) ( IS-CRATE ?auto_25727 ) ( not ( = ?auto_25760 ?auto_25735 ) ) ( HOIST-AT ?auto_25751 ?auto_25760 ) ( AVAILABLE ?auto_25751 ) ( SURFACE-AT ?auto_25727 ?auto_25760 ) ( ON ?auto_25727 ?auto_25741 ) ( CLEAR ?auto_25727 ) ( not ( = ?auto_25726 ?auto_25727 ) ) ( not ( = ?auto_25726 ?auto_25741 ) ) ( not ( = ?auto_25727 ?auto_25741 ) ) ( not ( = ?auto_25737 ?auto_25751 ) ) ( IS-CRATE ?auto_25726 ) ( not ( = ?auto_25744 ?auto_25735 ) ) ( HOIST-AT ?auto_25764 ?auto_25744 ) ( AVAILABLE ?auto_25764 ) ( SURFACE-AT ?auto_25726 ?auto_25744 ) ( ON ?auto_25726 ?auto_25756 ) ( CLEAR ?auto_25726 ) ( not ( = ?auto_25725 ?auto_25726 ) ) ( not ( = ?auto_25725 ?auto_25756 ) ) ( not ( = ?auto_25726 ?auto_25756 ) ) ( not ( = ?auto_25737 ?auto_25764 ) ) ( IS-CRATE ?auto_25725 ) ( not ( = ?auto_25739 ?auto_25735 ) ) ( HOIST-AT ?auto_25759 ?auto_25739 ) ( AVAILABLE ?auto_25759 ) ( SURFACE-AT ?auto_25725 ?auto_25739 ) ( ON ?auto_25725 ?auto_25746 ) ( CLEAR ?auto_25725 ) ( not ( = ?auto_25724 ?auto_25725 ) ) ( not ( = ?auto_25724 ?auto_25746 ) ) ( not ( = ?auto_25725 ?auto_25746 ) ) ( not ( = ?auto_25737 ?auto_25759 ) ) ( IS-CRATE ?auto_25724 ) ( not ( = ?auto_25740 ?auto_25735 ) ) ( HOIST-AT ?auto_25753 ?auto_25740 ) ( AVAILABLE ?auto_25753 ) ( SURFACE-AT ?auto_25724 ?auto_25740 ) ( ON ?auto_25724 ?auto_25748 ) ( CLEAR ?auto_25724 ) ( not ( = ?auto_25723 ?auto_25724 ) ) ( not ( = ?auto_25723 ?auto_25748 ) ) ( not ( = ?auto_25724 ?auto_25748 ) ) ( not ( = ?auto_25737 ?auto_25753 ) ) ( IS-CRATE ?auto_25723 ) ( not ( = ?auto_25761 ?auto_25735 ) ) ( HOIST-AT ?auto_25758 ?auto_25761 ) ( AVAILABLE ?auto_25758 ) ( SURFACE-AT ?auto_25723 ?auto_25761 ) ( ON ?auto_25723 ?auto_25757 ) ( CLEAR ?auto_25723 ) ( not ( = ?auto_25722 ?auto_25723 ) ) ( not ( = ?auto_25722 ?auto_25757 ) ) ( not ( = ?auto_25723 ?auto_25757 ) ) ( not ( = ?auto_25737 ?auto_25758 ) ) ( SURFACE-AT ?auto_25721 ?auto_25735 ) ( CLEAR ?auto_25721 ) ( IS-CRATE ?auto_25722 ) ( AVAILABLE ?auto_25737 ) ( not ( = ?auto_25752 ?auto_25735 ) ) ( HOIST-AT ?auto_25747 ?auto_25752 ) ( AVAILABLE ?auto_25747 ) ( SURFACE-AT ?auto_25722 ?auto_25752 ) ( ON ?auto_25722 ?auto_25738 ) ( CLEAR ?auto_25722 ) ( TRUCK-AT ?auto_25734 ?auto_25735 ) ( not ( = ?auto_25721 ?auto_25722 ) ) ( not ( = ?auto_25721 ?auto_25738 ) ) ( not ( = ?auto_25722 ?auto_25738 ) ) ( not ( = ?auto_25737 ?auto_25747 ) ) ( not ( = ?auto_25721 ?auto_25723 ) ) ( not ( = ?auto_25721 ?auto_25757 ) ) ( not ( = ?auto_25723 ?auto_25738 ) ) ( not ( = ?auto_25761 ?auto_25752 ) ) ( not ( = ?auto_25758 ?auto_25747 ) ) ( not ( = ?auto_25757 ?auto_25738 ) ) ( not ( = ?auto_25721 ?auto_25724 ) ) ( not ( = ?auto_25721 ?auto_25748 ) ) ( not ( = ?auto_25722 ?auto_25724 ) ) ( not ( = ?auto_25722 ?auto_25748 ) ) ( not ( = ?auto_25724 ?auto_25757 ) ) ( not ( = ?auto_25724 ?auto_25738 ) ) ( not ( = ?auto_25740 ?auto_25761 ) ) ( not ( = ?auto_25740 ?auto_25752 ) ) ( not ( = ?auto_25753 ?auto_25758 ) ) ( not ( = ?auto_25753 ?auto_25747 ) ) ( not ( = ?auto_25748 ?auto_25757 ) ) ( not ( = ?auto_25748 ?auto_25738 ) ) ( not ( = ?auto_25721 ?auto_25725 ) ) ( not ( = ?auto_25721 ?auto_25746 ) ) ( not ( = ?auto_25722 ?auto_25725 ) ) ( not ( = ?auto_25722 ?auto_25746 ) ) ( not ( = ?auto_25723 ?auto_25725 ) ) ( not ( = ?auto_25723 ?auto_25746 ) ) ( not ( = ?auto_25725 ?auto_25748 ) ) ( not ( = ?auto_25725 ?auto_25757 ) ) ( not ( = ?auto_25725 ?auto_25738 ) ) ( not ( = ?auto_25739 ?auto_25740 ) ) ( not ( = ?auto_25739 ?auto_25761 ) ) ( not ( = ?auto_25739 ?auto_25752 ) ) ( not ( = ?auto_25759 ?auto_25753 ) ) ( not ( = ?auto_25759 ?auto_25758 ) ) ( not ( = ?auto_25759 ?auto_25747 ) ) ( not ( = ?auto_25746 ?auto_25748 ) ) ( not ( = ?auto_25746 ?auto_25757 ) ) ( not ( = ?auto_25746 ?auto_25738 ) ) ( not ( = ?auto_25721 ?auto_25726 ) ) ( not ( = ?auto_25721 ?auto_25756 ) ) ( not ( = ?auto_25722 ?auto_25726 ) ) ( not ( = ?auto_25722 ?auto_25756 ) ) ( not ( = ?auto_25723 ?auto_25726 ) ) ( not ( = ?auto_25723 ?auto_25756 ) ) ( not ( = ?auto_25724 ?auto_25726 ) ) ( not ( = ?auto_25724 ?auto_25756 ) ) ( not ( = ?auto_25726 ?auto_25746 ) ) ( not ( = ?auto_25726 ?auto_25748 ) ) ( not ( = ?auto_25726 ?auto_25757 ) ) ( not ( = ?auto_25726 ?auto_25738 ) ) ( not ( = ?auto_25744 ?auto_25739 ) ) ( not ( = ?auto_25744 ?auto_25740 ) ) ( not ( = ?auto_25744 ?auto_25761 ) ) ( not ( = ?auto_25744 ?auto_25752 ) ) ( not ( = ?auto_25764 ?auto_25759 ) ) ( not ( = ?auto_25764 ?auto_25753 ) ) ( not ( = ?auto_25764 ?auto_25758 ) ) ( not ( = ?auto_25764 ?auto_25747 ) ) ( not ( = ?auto_25756 ?auto_25746 ) ) ( not ( = ?auto_25756 ?auto_25748 ) ) ( not ( = ?auto_25756 ?auto_25757 ) ) ( not ( = ?auto_25756 ?auto_25738 ) ) ( not ( = ?auto_25721 ?auto_25727 ) ) ( not ( = ?auto_25721 ?auto_25741 ) ) ( not ( = ?auto_25722 ?auto_25727 ) ) ( not ( = ?auto_25722 ?auto_25741 ) ) ( not ( = ?auto_25723 ?auto_25727 ) ) ( not ( = ?auto_25723 ?auto_25741 ) ) ( not ( = ?auto_25724 ?auto_25727 ) ) ( not ( = ?auto_25724 ?auto_25741 ) ) ( not ( = ?auto_25725 ?auto_25727 ) ) ( not ( = ?auto_25725 ?auto_25741 ) ) ( not ( = ?auto_25727 ?auto_25756 ) ) ( not ( = ?auto_25727 ?auto_25746 ) ) ( not ( = ?auto_25727 ?auto_25748 ) ) ( not ( = ?auto_25727 ?auto_25757 ) ) ( not ( = ?auto_25727 ?auto_25738 ) ) ( not ( = ?auto_25760 ?auto_25744 ) ) ( not ( = ?auto_25760 ?auto_25739 ) ) ( not ( = ?auto_25760 ?auto_25740 ) ) ( not ( = ?auto_25760 ?auto_25761 ) ) ( not ( = ?auto_25760 ?auto_25752 ) ) ( not ( = ?auto_25751 ?auto_25764 ) ) ( not ( = ?auto_25751 ?auto_25759 ) ) ( not ( = ?auto_25751 ?auto_25753 ) ) ( not ( = ?auto_25751 ?auto_25758 ) ) ( not ( = ?auto_25751 ?auto_25747 ) ) ( not ( = ?auto_25741 ?auto_25756 ) ) ( not ( = ?auto_25741 ?auto_25746 ) ) ( not ( = ?auto_25741 ?auto_25748 ) ) ( not ( = ?auto_25741 ?auto_25757 ) ) ( not ( = ?auto_25741 ?auto_25738 ) ) ( not ( = ?auto_25721 ?auto_25730 ) ) ( not ( = ?auto_25721 ?auto_25754 ) ) ( not ( = ?auto_25722 ?auto_25730 ) ) ( not ( = ?auto_25722 ?auto_25754 ) ) ( not ( = ?auto_25723 ?auto_25730 ) ) ( not ( = ?auto_25723 ?auto_25754 ) ) ( not ( = ?auto_25724 ?auto_25730 ) ) ( not ( = ?auto_25724 ?auto_25754 ) ) ( not ( = ?auto_25725 ?auto_25730 ) ) ( not ( = ?auto_25725 ?auto_25754 ) ) ( not ( = ?auto_25726 ?auto_25730 ) ) ( not ( = ?auto_25726 ?auto_25754 ) ) ( not ( = ?auto_25730 ?auto_25741 ) ) ( not ( = ?auto_25730 ?auto_25756 ) ) ( not ( = ?auto_25730 ?auto_25746 ) ) ( not ( = ?auto_25730 ?auto_25748 ) ) ( not ( = ?auto_25730 ?auto_25757 ) ) ( not ( = ?auto_25730 ?auto_25738 ) ) ( not ( = ?auto_25745 ?auto_25760 ) ) ( not ( = ?auto_25745 ?auto_25744 ) ) ( not ( = ?auto_25745 ?auto_25739 ) ) ( not ( = ?auto_25745 ?auto_25740 ) ) ( not ( = ?auto_25745 ?auto_25761 ) ) ( not ( = ?auto_25745 ?auto_25752 ) ) ( not ( = ?auto_25750 ?auto_25751 ) ) ( not ( = ?auto_25750 ?auto_25764 ) ) ( not ( = ?auto_25750 ?auto_25759 ) ) ( not ( = ?auto_25750 ?auto_25753 ) ) ( not ( = ?auto_25750 ?auto_25758 ) ) ( not ( = ?auto_25750 ?auto_25747 ) ) ( not ( = ?auto_25754 ?auto_25741 ) ) ( not ( = ?auto_25754 ?auto_25756 ) ) ( not ( = ?auto_25754 ?auto_25746 ) ) ( not ( = ?auto_25754 ?auto_25748 ) ) ( not ( = ?auto_25754 ?auto_25757 ) ) ( not ( = ?auto_25754 ?auto_25738 ) ) ( not ( = ?auto_25721 ?auto_25729 ) ) ( not ( = ?auto_25721 ?auto_25762 ) ) ( not ( = ?auto_25722 ?auto_25729 ) ) ( not ( = ?auto_25722 ?auto_25762 ) ) ( not ( = ?auto_25723 ?auto_25729 ) ) ( not ( = ?auto_25723 ?auto_25762 ) ) ( not ( = ?auto_25724 ?auto_25729 ) ) ( not ( = ?auto_25724 ?auto_25762 ) ) ( not ( = ?auto_25725 ?auto_25729 ) ) ( not ( = ?auto_25725 ?auto_25762 ) ) ( not ( = ?auto_25726 ?auto_25729 ) ) ( not ( = ?auto_25726 ?auto_25762 ) ) ( not ( = ?auto_25727 ?auto_25729 ) ) ( not ( = ?auto_25727 ?auto_25762 ) ) ( not ( = ?auto_25729 ?auto_25754 ) ) ( not ( = ?auto_25729 ?auto_25741 ) ) ( not ( = ?auto_25729 ?auto_25756 ) ) ( not ( = ?auto_25729 ?auto_25746 ) ) ( not ( = ?auto_25729 ?auto_25748 ) ) ( not ( = ?auto_25729 ?auto_25757 ) ) ( not ( = ?auto_25729 ?auto_25738 ) ) ( not ( = ?auto_25749 ?auto_25745 ) ) ( not ( = ?auto_25749 ?auto_25760 ) ) ( not ( = ?auto_25749 ?auto_25744 ) ) ( not ( = ?auto_25749 ?auto_25739 ) ) ( not ( = ?auto_25749 ?auto_25740 ) ) ( not ( = ?auto_25749 ?auto_25761 ) ) ( not ( = ?auto_25749 ?auto_25752 ) ) ( not ( = ?auto_25755 ?auto_25750 ) ) ( not ( = ?auto_25755 ?auto_25751 ) ) ( not ( = ?auto_25755 ?auto_25764 ) ) ( not ( = ?auto_25755 ?auto_25759 ) ) ( not ( = ?auto_25755 ?auto_25753 ) ) ( not ( = ?auto_25755 ?auto_25758 ) ) ( not ( = ?auto_25755 ?auto_25747 ) ) ( not ( = ?auto_25762 ?auto_25754 ) ) ( not ( = ?auto_25762 ?auto_25741 ) ) ( not ( = ?auto_25762 ?auto_25756 ) ) ( not ( = ?auto_25762 ?auto_25746 ) ) ( not ( = ?auto_25762 ?auto_25748 ) ) ( not ( = ?auto_25762 ?auto_25757 ) ) ( not ( = ?auto_25762 ?auto_25738 ) ) ( not ( = ?auto_25721 ?auto_25728 ) ) ( not ( = ?auto_25721 ?auto_25743 ) ) ( not ( = ?auto_25722 ?auto_25728 ) ) ( not ( = ?auto_25722 ?auto_25743 ) ) ( not ( = ?auto_25723 ?auto_25728 ) ) ( not ( = ?auto_25723 ?auto_25743 ) ) ( not ( = ?auto_25724 ?auto_25728 ) ) ( not ( = ?auto_25724 ?auto_25743 ) ) ( not ( = ?auto_25725 ?auto_25728 ) ) ( not ( = ?auto_25725 ?auto_25743 ) ) ( not ( = ?auto_25726 ?auto_25728 ) ) ( not ( = ?auto_25726 ?auto_25743 ) ) ( not ( = ?auto_25727 ?auto_25728 ) ) ( not ( = ?auto_25727 ?auto_25743 ) ) ( not ( = ?auto_25730 ?auto_25728 ) ) ( not ( = ?auto_25730 ?auto_25743 ) ) ( not ( = ?auto_25728 ?auto_25762 ) ) ( not ( = ?auto_25728 ?auto_25754 ) ) ( not ( = ?auto_25728 ?auto_25741 ) ) ( not ( = ?auto_25728 ?auto_25756 ) ) ( not ( = ?auto_25728 ?auto_25746 ) ) ( not ( = ?auto_25728 ?auto_25748 ) ) ( not ( = ?auto_25728 ?auto_25757 ) ) ( not ( = ?auto_25728 ?auto_25738 ) ) ( not ( = ?auto_25742 ?auto_25749 ) ) ( not ( = ?auto_25742 ?auto_25745 ) ) ( not ( = ?auto_25742 ?auto_25760 ) ) ( not ( = ?auto_25742 ?auto_25744 ) ) ( not ( = ?auto_25742 ?auto_25739 ) ) ( not ( = ?auto_25742 ?auto_25740 ) ) ( not ( = ?auto_25742 ?auto_25761 ) ) ( not ( = ?auto_25742 ?auto_25752 ) ) ( not ( = ?auto_25763 ?auto_25755 ) ) ( not ( = ?auto_25763 ?auto_25750 ) ) ( not ( = ?auto_25763 ?auto_25751 ) ) ( not ( = ?auto_25763 ?auto_25764 ) ) ( not ( = ?auto_25763 ?auto_25759 ) ) ( not ( = ?auto_25763 ?auto_25753 ) ) ( not ( = ?auto_25763 ?auto_25758 ) ) ( not ( = ?auto_25763 ?auto_25747 ) ) ( not ( = ?auto_25743 ?auto_25762 ) ) ( not ( = ?auto_25743 ?auto_25754 ) ) ( not ( = ?auto_25743 ?auto_25741 ) ) ( not ( = ?auto_25743 ?auto_25756 ) ) ( not ( = ?auto_25743 ?auto_25746 ) ) ( not ( = ?auto_25743 ?auto_25748 ) ) ( not ( = ?auto_25743 ?auto_25757 ) ) ( not ( = ?auto_25743 ?auto_25738 ) ) ( not ( = ?auto_25721 ?auto_25731 ) ) ( not ( = ?auto_25721 ?auto_25736 ) ) ( not ( = ?auto_25722 ?auto_25731 ) ) ( not ( = ?auto_25722 ?auto_25736 ) ) ( not ( = ?auto_25723 ?auto_25731 ) ) ( not ( = ?auto_25723 ?auto_25736 ) ) ( not ( = ?auto_25724 ?auto_25731 ) ) ( not ( = ?auto_25724 ?auto_25736 ) ) ( not ( = ?auto_25725 ?auto_25731 ) ) ( not ( = ?auto_25725 ?auto_25736 ) ) ( not ( = ?auto_25726 ?auto_25731 ) ) ( not ( = ?auto_25726 ?auto_25736 ) ) ( not ( = ?auto_25727 ?auto_25731 ) ) ( not ( = ?auto_25727 ?auto_25736 ) ) ( not ( = ?auto_25730 ?auto_25731 ) ) ( not ( = ?auto_25730 ?auto_25736 ) ) ( not ( = ?auto_25729 ?auto_25731 ) ) ( not ( = ?auto_25729 ?auto_25736 ) ) ( not ( = ?auto_25731 ?auto_25743 ) ) ( not ( = ?auto_25731 ?auto_25762 ) ) ( not ( = ?auto_25731 ?auto_25754 ) ) ( not ( = ?auto_25731 ?auto_25741 ) ) ( not ( = ?auto_25731 ?auto_25756 ) ) ( not ( = ?auto_25731 ?auto_25746 ) ) ( not ( = ?auto_25731 ?auto_25748 ) ) ( not ( = ?auto_25731 ?auto_25757 ) ) ( not ( = ?auto_25731 ?auto_25738 ) ) ( not ( = ?auto_25732 ?auto_25742 ) ) ( not ( = ?auto_25732 ?auto_25749 ) ) ( not ( = ?auto_25732 ?auto_25745 ) ) ( not ( = ?auto_25732 ?auto_25760 ) ) ( not ( = ?auto_25732 ?auto_25744 ) ) ( not ( = ?auto_25732 ?auto_25739 ) ) ( not ( = ?auto_25732 ?auto_25740 ) ) ( not ( = ?auto_25732 ?auto_25761 ) ) ( not ( = ?auto_25732 ?auto_25752 ) ) ( not ( = ?auto_25733 ?auto_25763 ) ) ( not ( = ?auto_25733 ?auto_25755 ) ) ( not ( = ?auto_25733 ?auto_25750 ) ) ( not ( = ?auto_25733 ?auto_25751 ) ) ( not ( = ?auto_25733 ?auto_25764 ) ) ( not ( = ?auto_25733 ?auto_25759 ) ) ( not ( = ?auto_25733 ?auto_25753 ) ) ( not ( = ?auto_25733 ?auto_25758 ) ) ( not ( = ?auto_25733 ?auto_25747 ) ) ( not ( = ?auto_25736 ?auto_25743 ) ) ( not ( = ?auto_25736 ?auto_25762 ) ) ( not ( = ?auto_25736 ?auto_25754 ) ) ( not ( = ?auto_25736 ?auto_25741 ) ) ( not ( = ?auto_25736 ?auto_25756 ) ) ( not ( = ?auto_25736 ?auto_25746 ) ) ( not ( = ?auto_25736 ?auto_25748 ) ) ( not ( = ?auto_25736 ?auto_25757 ) ) ( not ( = ?auto_25736 ?auto_25738 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_25721 ?auto_25722 ?auto_25723 ?auto_25724 ?auto_25725 ?auto_25726 ?auto_25727 ?auto_25730 ?auto_25729 ?auto_25728 )
      ( MAKE-1CRATE ?auto_25728 ?auto_25731 )
      ( MAKE-10CRATE-VERIFY ?auto_25721 ?auto_25722 ?auto_25723 ?auto_25724 ?auto_25725 ?auto_25726 ?auto_25727 ?auto_25730 ?auto_25729 ?auto_25728 ?auto_25731 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25767 - SURFACE
      ?auto_25768 - SURFACE
    )
    :vars
    (
      ?auto_25769 - HOIST
      ?auto_25770 - PLACE
      ?auto_25772 - PLACE
      ?auto_25773 - HOIST
      ?auto_25774 - SURFACE
      ?auto_25771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25769 ?auto_25770 ) ( SURFACE-AT ?auto_25767 ?auto_25770 ) ( CLEAR ?auto_25767 ) ( IS-CRATE ?auto_25768 ) ( AVAILABLE ?auto_25769 ) ( not ( = ?auto_25772 ?auto_25770 ) ) ( HOIST-AT ?auto_25773 ?auto_25772 ) ( AVAILABLE ?auto_25773 ) ( SURFACE-AT ?auto_25768 ?auto_25772 ) ( ON ?auto_25768 ?auto_25774 ) ( CLEAR ?auto_25768 ) ( TRUCK-AT ?auto_25771 ?auto_25770 ) ( not ( = ?auto_25767 ?auto_25768 ) ) ( not ( = ?auto_25767 ?auto_25774 ) ) ( not ( = ?auto_25768 ?auto_25774 ) ) ( not ( = ?auto_25769 ?auto_25773 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25771 ?auto_25770 ?auto_25772 )
      ( !LIFT ?auto_25773 ?auto_25768 ?auto_25774 ?auto_25772 )
      ( !LOAD ?auto_25773 ?auto_25768 ?auto_25771 ?auto_25772 )
      ( !DRIVE ?auto_25771 ?auto_25772 ?auto_25770 )
      ( !UNLOAD ?auto_25769 ?auto_25768 ?auto_25771 ?auto_25770 )
      ( !DROP ?auto_25769 ?auto_25768 ?auto_25767 ?auto_25770 )
      ( MAKE-1CRATE-VERIFY ?auto_25767 ?auto_25768 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_25787 - SURFACE
      ?auto_25788 - SURFACE
      ?auto_25789 - SURFACE
      ?auto_25790 - SURFACE
      ?auto_25791 - SURFACE
      ?auto_25792 - SURFACE
      ?auto_25793 - SURFACE
      ?auto_25796 - SURFACE
      ?auto_25795 - SURFACE
      ?auto_25794 - SURFACE
      ?auto_25797 - SURFACE
      ?auto_25798 - SURFACE
    )
    :vars
    (
      ?auto_25801 - HOIST
      ?auto_25804 - PLACE
      ?auto_25800 - PLACE
      ?auto_25802 - HOIST
      ?auto_25799 - SURFACE
      ?auto_25806 - SURFACE
      ?auto_25821 - PLACE
      ?auto_25823 - HOIST
      ?auto_25813 - SURFACE
      ?auto_25819 - PLACE
      ?auto_25820 - HOIST
      ?auto_25808 - SURFACE
      ?auto_25805 - PLACE
      ?auto_25826 - HOIST
      ?auto_25817 - SURFACE
      ?auto_25832 - PLACE
      ?auto_25822 - HOIST
      ?auto_25816 - SURFACE
      ?auto_25810 - PLACE
      ?auto_25807 - HOIST
      ?auto_25815 - SURFACE
      ?auto_25809 - PLACE
      ?auto_25829 - HOIST
      ?auto_25812 - SURFACE
      ?auto_25818 - PLACE
      ?auto_25811 - HOIST
      ?auto_25824 - SURFACE
      ?auto_25828 - PLACE
      ?auto_25831 - HOIST
      ?auto_25830 - SURFACE
      ?auto_25827 - PLACE
      ?auto_25825 - HOIST
      ?auto_25814 - SURFACE
      ?auto_25803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25801 ?auto_25804 ) ( IS-CRATE ?auto_25798 ) ( not ( = ?auto_25800 ?auto_25804 ) ) ( HOIST-AT ?auto_25802 ?auto_25800 ) ( SURFACE-AT ?auto_25798 ?auto_25800 ) ( ON ?auto_25798 ?auto_25799 ) ( CLEAR ?auto_25798 ) ( not ( = ?auto_25797 ?auto_25798 ) ) ( not ( = ?auto_25797 ?auto_25799 ) ) ( not ( = ?auto_25798 ?auto_25799 ) ) ( not ( = ?auto_25801 ?auto_25802 ) ) ( IS-CRATE ?auto_25797 ) ( AVAILABLE ?auto_25802 ) ( SURFACE-AT ?auto_25797 ?auto_25800 ) ( ON ?auto_25797 ?auto_25806 ) ( CLEAR ?auto_25797 ) ( not ( = ?auto_25794 ?auto_25797 ) ) ( not ( = ?auto_25794 ?auto_25806 ) ) ( not ( = ?auto_25797 ?auto_25806 ) ) ( IS-CRATE ?auto_25794 ) ( not ( = ?auto_25821 ?auto_25804 ) ) ( HOIST-AT ?auto_25823 ?auto_25821 ) ( AVAILABLE ?auto_25823 ) ( SURFACE-AT ?auto_25794 ?auto_25821 ) ( ON ?auto_25794 ?auto_25813 ) ( CLEAR ?auto_25794 ) ( not ( = ?auto_25795 ?auto_25794 ) ) ( not ( = ?auto_25795 ?auto_25813 ) ) ( not ( = ?auto_25794 ?auto_25813 ) ) ( not ( = ?auto_25801 ?auto_25823 ) ) ( IS-CRATE ?auto_25795 ) ( not ( = ?auto_25819 ?auto_25804 ) ) ( HOIST-AT ?auto_25820 ?auto_25819 ) ( AVAILABLE ?auto_25820 ) ( SURFACE-AT ?auto_25795 ?auto_25819 ) ( ON ?auto_25795 ?auto_25808 ) ( CLEAR ?auto_25795 ) ( not ( = ?auto_25796 ?auto_25795 ) ) ( not ( = ?auto_25796 ?auto_25808 ) ) ( not ( = ?auto_25795 ?auto_25808 ) ) ( not ( = ?auto_25801 ?auto_25820 ) ) ( IS-CRATE ?auto_25796 ) ( not ( = ?auto_25805 ?auto_25804 ) ) ( HOIST-AT ?auto_25826 ?auto_25805 ) ( AVAILABLE ?auto_25826 ) ( SURFACE-AT ?auto_25796 ?auto_25805 ) ( ON ?auto_25796 ?auto_25817 ) ( CLEAR ?auto_25796 ) ( not ( = ?auto_25793 ?auto_25796 ) ) ( not ( = ?auto_25793 ?auto_25817 ) ) ( not ( = ?auto_25796 ?auto_25817 ) ) ( not ( = ?auto_25801 ?auto_25826 ) ) ( IS-CRATE ?auto_25793 ) ( not ( = ?auto_25832 ?auto_25804 ) ) ( HOIST-AT ?auto_25822 ?auto_25832 ) ( AVAILABLE ?auto_25822 ) ( SURFACE-AT ?auto_25793 ?auto_25832 ) ( ON ?auto_25793 ?auto_25816 ) ( CLEAR ?auto_25793 ) ( not ( = ?auto_25792 ?auto_25793 ) ) ( not ( = ?auto_25792 ?auto_25816 ) ) ( not ( = ?auto_25793 ?auto_25816 ) ) ( not ( = ?auto_25801 ?auto_25822 ) ) ( IS-CRATE ?auto_25792 ) ( not ( = ?auto_25810 ?auto_25804 ) ) ( HOIST-AT ?auto_25807 ?auto_25810 ) ( AVAILABLE ?auto_25807 ) ( SURFACE-AT ?auto_25792 ?auto_25810 ) ( ON ?auto_25792 ?auto_25815 ) ( CLEAR ?auto_25792 ) ( not ( = ?auto_25791 ?auto_25792 ) ) ( not ( = ?auto_25791 ?auto_25815 ) ) ( not ( = ?auto_25792 ?auto_25815 ) ) ( not ( = ?auto_25801 ?auto_25807 ) ) ( IS-CRATE ?auto_25791 ) ( not ( = ?auto_25809 ?auto_25804 ) ) ( HOIST-AT ?auto_25829 ?auto_25809 ) ( AVAILABLE ?auto_25829 ) ( SURFACE-AT ?auto_25791 ?auto_25809 ) ( ON ?auto_25791 ?auto_25812 ) ( CLEAR ?auto_25791 ) ( not ( = ?auto_25790 ?auto_25791 ) ) ( not ( = ?auto_25790 ?auto_25812 ) ) ( not ( = ?auto_25791 ?auto_25812 ) ) ( not ( = ?auto_25801 ?auto_25829 ) ) ( IS-CRATE ?auto_25790 ) ( not ( = ?auto_25818 ?auto_25804 ) ) ( HOIST-AT ?auto_25811 ?auto_25818 ) ( AVAILABLE ?auto_25811 ) ( SURFACE-AT ?auto_25790 ?auto_25818 ) ( ON ?auto_25790 ?auto_25824 ) ( CLEAR ?auto_25790 ) ( not ( = ?auto_25789 ?auto_25790 ) ) ( not ( = ?auto_25789 ?auto_25824 ) ) ( not ( = ?auto_25790 ?auto_25824 ) ) ( not ( = ?auto_25801 ?auto_25811 ) ) ( IS-CRATE ?auto_25789 ) ( not ( = ?auto_25828 ?auto_25804 ) ) ( HOIST-AT ?auto_25831 ?auto_25828 ) ( AVAILABLE ?auto_25831 ) ( SURFACE-AT ?auto_25789 ?auto_25828 ) ( ON ?auto_25789 ?auto_25830 ) ( CLEAR ?auto_25789 ) ( not ( = ?auto_25788 ?auto_25789 ) ) ( not ( = ?auto_25788 ?auto_25830 ) ) ( not ( = ?auto_25789 ?auto_25830 ) ) ( not ( = ?auto_25801 ?auto_25831 ) ) ( SURFACE-AT ?auto_25787 ?auto_25804 ) ( CLEAR ?auto_25787 ) ( IS-CRATE ?auto_25788 ) ( AVAILABLE ?auto_25801 ) ( not ( = ?auto_25827 ?auto_25804 ) ) ( HOIST-AT ?auto_25825 ?auto_25827 ) ( AVAILABLE ?auto_25825 ) ( SURFACE-AT ?auto_25788 ?auto_25827 ) ( ON ?auto_25788 ?auto_25814 ) ( CLEAR ?auto_25788 ) ( TRUCK-AT ?auto_25803 ?auto_25804 ) ( not ( = ?auto_25787 ?auto_25788 ) ) ( not ( = ?auto_25787 ?auto_25814 ) ) ( not ( = ?auto_25788 ?auto_25814 ) ) ( not ( = ?auto_25801 ?auto_25825 ) ) ( not ( = ?auto_25787 ?auto_25789 ) ) ( not ( = ?auto_25787 ?auto_25830 ) ) ( not ( = ?auto_25789 ?auto_25814 ) ) ( not ( = ?auto_25828 ?auto_25827 ) ) ( not ( = ?auto_25831 ?auto_25825 ) ) ( not ( = ?auto_25830 ?auto_25814 ) ) ( not ( = ?auto_25787 ?auto_25790 ) ) ( not ( = ?auto_25787 ?auto_25824 ) ) ( not ( = ?auto_25788 ?auto_25790 ) ) ( not ( = ?auto_25788 ?auto_25824 ) ) ( not ( = ?auto_25790 ?auto_25830 ) ) ( not ( = ?auto_25790 ?auto_25814 ) ) ( not ( = ?auto_25818 ?auto_25828 ) ) ( not ( = ?auto_25818 ?auto_25827 ) ) ( not ( = ?auto_25811 ?auto_25831 ) ) ( not ( = ?auto_25811 ?auto_25825 ) ) ( not ( = ?auto_25824 ?auto_25830 ) ) ( not ( = ?auto_25824 ?auto_25814 ) ) ( not ( = ?auto_25787 ?auto_25791 ) ) ( not ( = ?auto_25787 ?auto_25812 ) ) ( not ( = ?auto_25788 ?auto_25791 ) ) ( not ( = ?auto_25788 ?auto_25812 ) ) ( not ( = ?auto_25789 ?auto_25791 ) ) ( not ( = ?auto_25789 ?auto_25812 ) ) ( not ( = ?auto_25791 ?auto_25824 ) ) ( not ( = ?auto_25791 ?auto_25830 ) ) ( not ( = ?auto_25791 ?auto_25814 ) ) ( not ( = ?auto_25809 ?auto_25818 ) ) ( not ( = ?auto_25809 ?auto_25828 ) ) ( not ( = ?auto_25809 ?auto_25827 ) ) ( not ( = ?auto_25829 ?auto_25811 ) ) ( not ( = ?auto_25829 ?auto_25831 ) ) ( not ( = ?auto_25829 ?auto_25825 ) ) ( not ( = ?auto_25812 ?auto_25824 ) ) ( not ( = ?auto_25812 ?auto_25830 ) ) ( not ( = ?auto_25812 ?auto_25814 ) ) ( not ( = ?auto_25787 ?auto_25792 ) ) ( not ( = ?auto_25787 ?auto_25815 ) ) ( not ( = ?auto_25788 ?auto_25792 ) ) ( not ( = ?auto_25788 ?auto_25815 ) ) ( not ( = ?auto_25789 ?auto_25792 ) ) ( not ( = ?auto_25789 ?auto_25815 ) ) ( not ( = ?auto_25790 ?auto_25792 ) ) ( not ( = ?auto_25790 ?auto_25815 ) ) ( not ( = ?auto_25792 ?auto_25812 ) ) ( not ( = ?auto_25792 ?auto_25824 ) ) ( not ( = ?auto_25792 ?auto_25830 ) ) ( not ( = ?auto_25792 ?auto_25814 ) ) ( not ( = ?auto_25810 ?auto_25809 ) ) ( not ( = ?auto_25810 ?auto_25818 ) ) ( not ( = ?auto_25810 ?auto_25828 ) ) ( not ( = ?auto_25810 ?auto_25827 ) ) ( not ( = ?auto_25807 ?auto_25829 ) ) ( not ( = ?auto_25807 ?auto_25811 ) ) ( not ( = ?auto_25807 ?auto_25831 ) ) ( not ( = ?auto_25807 ?auto_25825 ) ) ( not ( = ?auto_25815 ?auto_25812 ) ) ( not ( = ?auto_25815 ?auto_25824 ) ) ( not ( = ?auto_25815 ?auto_25830 ) ) ( not ( = ?auto_25815 ?auto_25814 ) ) ( not ( = ?auto_25787 ?auto_25793 ) ) ( not ( = ?auto_25787 ?auto_25816 ) ) ( not ( = ?auto_25788 ?auto_25793 ) ) ( not ( = ?auto_25788 ?auto_25816 ) ) ( not ( = ?auto_25789 ?auto_25793 ) ) ( not ( = ?auto_25789 ?auto_25816 ) ) ( not ( = ?auto_25790 ?auto_25793 ) ) ( not ( = ?auto_25790 ?auto_25816 ) ) ( not ( = ?auto_25791 ?auto_25793 ) ) ( not ( = ?auto_25791 ?auto_25816 ) ) ( not ( = ?auto_25793 ?auto_25815 ) ) ( not ( = ?auto_25793 ?auto_25812 ) ) ( not ( = ?auto_25793 ?auto_25824 ) ) ( not ( = ?auto_25793 ?auto_25830 ) ) ( not ( = ?auto_25793 ?auto_25814 ) ) ( not ( = ?auto_25832 ?auto_25810 ) ) ( not ( = ?auto_25832 ?auto_25809 ) ) ( not ( = ?auto_25832 ?auto_25818 ) ) ( not ( = ?auto_25832 ?auto_25828 ) ) ( not ( = ?auto_25832 ?auto_25827 ) ) ( not ( = ?auto_25822 ?auto_25807 ) ) ( not ( = ?auto_25822 ?auto_25829 ) ) ( not ( = ?auto_25822 ?auto_25811 ) ) ( not ( = ?auto_25822 ?auto_25831 ) ) ( not ( = ?auto_25822 ?auto_25825 ) ) ( not ( = ?auto_25816 ?auto_25815 ) ) ( not ( = ?auto_25816 ?auto_25812 ) ) ( not ( = ?auto_25816 ?auto_25824 ) ) ( not ( = ?auto_25816 ?auto_25830 ) ) ( not ( = ?auto_25816 ?auto_25814 ) ) ( not ( = ?auto_25787 ?auto_25796 ) ) ( not ( = ?auto_25787 ?auto_25817 ) ) ( not ( = ?auto_25788 ?auto_25796 ) ) ( not ( = ?auto_25788 ?auto_25817 ) ) ( not ( = ?auto_25789 ?auto_25796 ) ) ( not ( = ?auto_25789 ?auto_25817 ) ) ( not ( = ?auto_25790 ?auto_25796 ) ) ( not ( = ?auto_25790 ?auto_25817 ) ) ( not ( = ?auto_25791 ?auto_25796 ) ) ( not ( = ?auto_25791 ?auto_25817 ) ) ( not ( = ?auto_25792 ?auto_25796 ) ) ( not ( = ?auto_25792 ?auto_25817 ) ) ( not ( = ?auto_25796 ?auto_25816 ) ) ( not ( = ?auto_25796 ?auto_25815 ) ) ( not ( = ?auto_25796 ?auto_25812 ) ) ( not ( = ?auto_25796 ?auto_25824 ) ) ( not ( = ?auto_25796 ?auto_25830 ) ) ( not ( = ?auto_25796 ?auto_25814 ) ) ( not ( = ?auto_25805 ?auto_25832 ) ) ( not ( = ?auto_25805 ?auto_25810 ) ) ( not ( = ?auto_25805 ?auto_25809 ) ) ( not ( = ?auto_25805 ?auto_25818 ) ) ( not ( = ?auto_25805 ?auto_25828 ) ) ( not ( = ?auto_25805 ?auto_25827 ) ) ( not ( = ?auto_25826 ?auto_25822 ) ) ( not ( = ?auto_25826 ?auto_25807 ) ) ( not ( = ?auto_25826 ?auto_25829 ) ) ( not ( = ?auto_25826 ?auto_25811 ) ) ( not ( = ?auto_25826 ?auto_25831 ) ) ( not ( = ?auto_25826 ?auto_25825 ) ) ( not ( = ?auto_25817 ?auto_25816 ) ) ( not ( = ?auto_25817 ?auto_25815 ) ) ( not ( = ?auto_25817 ?auto_25812 ) ) ( not ( = ?auto_25817 ?auto_25824 ) ) ( not ( = ?auto_25817 ?auto_25830 ) ) ( not ( = ?auto_25817 ?auto_25814 ) ) ( not ( = ?auto_25787 ?auto_25795 ) ) ( not ( = ?auto_25787 ?auto_25808 ) ) ( not ( = ?auto_25788 ?auto_25795 ) ) ( not ( = ?auto_25788 ?auto_25808 ) ) ( not ( = ?auto_25789 ?auto_25795 ) ) ( not ( = ?auto_25789 ?auto_25808 ) ) ( not ( = ?auto_25790 ?auto_25795 ) ) ( not ( = ?auto_25790 ?auto_25808 ) ) ( not ( = ?auto_25791 ?auto_25795 ) ) ( not ( = ?auto_25791 ?auto_25808 ) ) ( not ( = ?auto_25792 ?auto_25795 ) ) ( not ( = ?auto_25792 ?auto_25808 ) ) ( not ( = ?auto_25793 ?auto_25795 ) ) ( not ( = ?auto_25793 ?auto_25808 ) ) ( not ( = ?auto_25795 ?auto_25817 ) ) ( not ( = ?auto_25795 ?auto_25816 ) ) ( not ( = ?auto_25795 ?auto_25815 ) ) ( not ( = ?auto_25795 ?auto_25812 ) ) ( not ( = ?auto_25795 ?auto_25824 ) ) ( not ( = ?auto_25795 ?auto_25830 ) ) ( not ( = ?auto_25795 ?auto_25814 ) ) ( not ( = ?auto_25819 ?auto_25805 ) ) ( not ( = ?auto_25819 ?auto_25832 ) ) ( not ( = ?auto_25819 ?auto_25810 ) ) ( not ( = ?auto_25819 ?auto_25809 ) ) ( not ( = ?auto_25819 ?auto_25818 ) ) ( not ( = ?auto_25819 ?auto_25828 ) ) ( not ( = ?auto_25819 ?auto_25827 ) ) ( not ( = ?auto_25820 ?auto_25826 ) ) ( not ( = ?auto_25820 ?auto_25822 ) ) ( not ( = ?auto_25820 ?auto_25807 ) ) ( not ( = ?auto_25820 ?auto_25829 ) ) ( not ( = ?auto_25820 ?auto_25811 ) ) ( not ( = ?auto_25820 ?auto_25831 ) ) ( not ( = ?auto_25820 ?auto_25825 ) ) ( not ( = ?auto_25808 ?auto_25817 ) ) ( not ( = ?auto_25808 ?auto_25816 ) ) ( not ( = ?auto_25808 ?auto_25815 ) ) ( not ( = ?auto_25808 ?auto_25812 ) ) ( not ( = ?auto_25808 ?auto_25824 ) ) ( not ( = ?auto_25808 ?auto_25830 ) ) ( not ( = ?auto_25808 ?auto_25814 ) ) ( not ( = ?auto_25787 ?auto_25794 ) ) ( not ( = ?auto_25787 ?auto_25813 ) ) ( not ( = ?auto_25788 ?auto_25794 ) ) ( not ( = ?auto_25788 ?auto_25813 ) ) ( not ( = ?auto_25789 ?auto_25794 ) ) ( not ( = ?auto_25789 ?auto_25813 ) ) ( not ( = ?auto_25790 ?auto_25794 ) ) ( not ( = ?auto_25790 ?auto_25813 ) ) ( not ( = ?auto_25791 ?auto_25794 ) ) ( not ( = ?auto_25791 ?auto_25813 ) ) ( not ( = ?auto_25792 ?auto_25794 ) ) ( not ( = ?auto_25792 ?auto_25813 ) ) ( not ( = ?auto_25793 ?auto_25794 ) ) ( not ( = ?auto_25793 ?auto_25813 ) ) ( not ( = ?auto_25796 ?auto_25794 ) ) ( not ( = ?auto_25796 ?auto_25813 ) ) ( not ( = ?auto_25794 ?auto_25808 ) ) ( not ( = ?auto_25794 ?auto_25817 ) ) ( not ( = ?auto_25794 ?auto_25816 ) ) ( not ( = ?auto_25794 ?auto_25815 ) ) ( not ( = ?auto_25794 ?auto_25812 ) ) ( not ( = ?auto_25794 ?auto_25824 ) ) ( not ( = ?auto_25794 ?auto_25830 ) ) ( not ( = ?auto_25794 ?auto_25814 ) ) ( not ( = ?auto_25821 ?auto_25819 ) ) ( not ( = ?auto_25821 ?auto_25805 ) ) ( not ( = ?auto_25821 ?auto_25832 ) ) ( not ( = ?auto_25821 ?auto_25810 ) ) ( not ( = ?auto_25821 ?auto_25809 ) ) ( not ( = ?auto_25821 ?auto_25818 ) ) ( not ( = ?auto_25821 ?auto_25828 ) ) ( not ( = ?auto_25821 ?auto_25827 ) ) ( not ( = ?auto_25823 ?auto_25820 ) ) ( not ( = ?auto_25823 ?auto_25826 ) ) ( not ( = ?auto_25823 ?auto_25822 ) ) ( not ( = ?auto_25823 ?auto_25807 ) ) ( not ( = ?auto_25823 ?auto_25829 ) ) ( not ( = ?auto_25823 ?auto_25811 ) ) ( not ( = ?auto_25823 ?auto_25831 ) ) ( not ( = ?auto_25823 ?auto_25825 ) ) ( not ( = ?auto_25813 ?auto_25808 ) ) ( not ( = ?auto_25813 ?auto_25817 ) ) ( not ( = ?auto_25813 ?auto_25816 ) ) ( not ( = ?auto_25813 ?auto_25815 ) ) ( not ( = ?auto_25813 ?auto_25812 ) ) ( not ( = ?auto_25813 ?auto_25824 ) ) ( not ( = ?auto_25813 ?auto_25830 ) ) ( not ( = ?auto_25813 ?auto_25814 ) ) ( not ( = ?auto_25787 ?auto_25797 ) ) ( not ( = ?auto_25787 ?auto_25806 ) ) ( not ( = ?auto_25788 ?auto_25797 ) ) ( not ( = ?auto_25788 ?auto_25806 ) ) ( not ( = ?auto_25789 ?auto_25797 ) ) ( not ( = ?auto_25789 ?auto_25806 ) ) ( not ( = ?auto_25790 ?auto_25797 ) ) ( not ( = ?auto_25790 ?auto_25806 ) ) ( not ( = ?auto_25791 ?auto_25797 ) ) ( not ( = ?auto_25791 ?auto_25806 ) ) ( not ( = ?auto_25792 ?auto_25797 ) ) ( not ( = ?auto_25792 ?auto_25806 ) ) ( not ( = ?auto_25793 ?auto_25797 ) ) ( not ( = ?auto_25793 ?auto_25806 ) ) ( not ( = ?auto_25796 ?auto_25797 ) ) ( not ( = ?auto_25796 ?auto_25806 ) ) ( not ( = ?auto_25795 ?auto_25797 ) ) ( not ( = ?auto_25795 ?auto_25806 ) ) ( not ( = ?auto_25797 ?auto_25813 ) ) ( not ( = ?auto_25797 ?auto_25808 ) ) ( not ( = ?auto_25797 ?auto_25817 ) ) ( not ( = ?auto_25797 ?auto_25816 ) ) ( not ( = ?auto_25797 ?auto_25815 ) ) ( not ( = ?auto_25797 ?auto_25812 ) ) ( not ( = ?auto_25797 ?auto_25824 ) ) ( not ( = ?auto_25797 ?auto_25830 ) ) ( not ( = ?auto_25797 ?auto_25814 ) ) ( not ( = ?auto_25800 ?auto_25821 ) ) ( not ( = ?auto_25800 ?auto_25819 ) ) ( not ( = ?auto_25800 ?auto_25805 ) ) ( not ( = ?auto_25800 ?auto_25832 ) ) ( not ( = ?auto_25800 ?auto_25810 ) ) ( not ( = ?auto_25800 ?auto_25809 ) ) ( not ( = ?auto_25800 ?auto_25818 ) ) ( not ( = ?auto_25800 ?auto_25828 ) ) ( not ( = ?auto_25800 ?auto_25827 ) ) ( not ( = ?auto_25802 ?auto_25823 ) ) ( not ( = ?auto_25802 ?auto_25820 ) ) ( not ( = ?auto_25802 ?auto_25826 ) ) ( not ( = ?auto_25802 ?auto_25822 ) ) ( not ( = ?auto_25802 ?auto_25807 ) ) ( not ( = ?auto_25802 ?auto_25829 ) ) ( not ( = ?auto_25802 ?auto_25811 ) ) ( not ( = ?auto_25802 ?auto_25831 ) ) ( not ( = ?auto_25802 ?auto_25825 ) ) ( not ( = ?auto_25806 ?auto_25813 ) ) ( not ( = ?auto_25806 ?auto_25808 ) ) ( not ( = ?auto_25806 ?auto_25817 ) ) ( not ( = ?auto_25806 ?auto_25816 ) ) ( not ( = ?auto_25806 ?auto_25815 ) ) ( not ( = ?auto_25806 ?auto_25812 ) ) ( not ( = ?auto_25806 ?auto_25824 ) ) ( not ( = ?auto_25806 ?auto_25830 ) ) ( not ( = ?auto_25806 ?auto_25814 ) ) ( not ( = ?auto_25787 ?auto_25798 ) ) ( not ( = ?auto_25787 ?auto_25799 ) ) ( not ( = ?auto_25788 ?auto_25798 ) ) ( not ( = ?auto_25788 ?auto_25799 ) ) ( not ( = ?auto_25789 ?auto_25798 ) ) ( not ( = ?auto_25789 ?auto_25799 ) ) ( not ( = ?auto_25790 ?auto_25798 ) ) ( not ( = ?auto_25790 ?auto_25799 ) ) ( not ( = ?auto_25791 ?auto_25798 ) ) ( not ( = ?auto_25791 ?auto_25799 ) ) ( not ( = ?auto_25792 ?auto_25798 ) ) ( not ( = ?auto_25792 ?auto_25799 ) ) ( not ( = ?auto_25793 ?auto_25798 ) ) ( not ( = ?auto_25793 ?auto_25799 ) ) ( not ( = ?auto_25796 ?auto_25798 ) ) ( not ( = ?auto_25796 ?auto_25799 ) ) ( not ( = ?auto_25795 ?auto_25798 ) ) ( not ( = ?auto_25795 ?auto_25799 ) ) ( not ( = ?auto_25794 ?auto_25798 ) ) ( not ( = ?auto_25794 ?auto_25799 ) ) ( not ( = ?auto_25798 ?auto_25806 ) ) ( not ( = ?auto_25798 ?auto_25813 ) ) ( not ( = ?auto_25798 ?auto_25808 ) ) ( not ( = ?auto_25798 ?auto_25817 ) ) ( not ( = ?auto_25798 ?auto_25816 ) ) ( not ( = ?auto_25798 ?auto_25815 ) ) ( not ( = ?auto_25798 ?auto_25812 ) ) ( not ( = ?auto_25798 ?auto_25824 ) ) ( not ( = ?auto_25798 ?auto_25830 ) ) ( not ( = ?auto_25798 ?auto_25814 ) ) ( not ( = ?auto_25799 ?auto_25806 ) ) ( not ( = ?auto_25799 ?auto_25813 ) ) ( not ( = ?auto_25799 ?auto_25808 ) ) ( not ( = ?auto_25799 ?auto_25817 ) ) ( not ( = ?auto_25799 ?auto_25816 ) ) ( not ( = ?auto_25799 ?auto_25815 ) ) ( not ( = ?auto_25799 ?auto_25812 ) ) ( not ( = ?auto_25799 ?auto_25824 ) ) ( not ( = ?auto_25799 ?auto_25830 ) ) ( not ( = ?auto_25799 ?auto_25814 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_25787 ?auto_25788 ?auto_25789 ?auto_25790 ?auto_25791 ?auto_25792 ?auto_25793 ?auto_25796 ?auto_25795 ?auto_25794 ?auto_25797 )
      ( MAKE-1CRATE ?auto_25797 ?auto_25798 )
      ( MAKE-11CRATE-VERIFY ?auto_25787 ?auto_25788 ?auto_25789 ?auto_25790 ?auto_25791 ?auto_25792 ?auto_25793 ?auto_25796 ?auto_25795 ?auto_25794 ?auto_25797 ?auto_25798 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25835 - SURFACE
      ?auto_25836 - SURFACE
    )
    :vars
    (
      ?auto_25837 - HOIST
      ?auto_25838 - PLACE
      ?auto_25840 - PLACE
      ?auto_25841 - HOIST
      ?auto_25842 - SURFACE
      ?auto_25839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25837 ?auto_25838 ) ( SURFACE-AT ?auto_25835 ?auto_25838 ) ( CLEAR ?auto_25835 ) ( IS-CRATE ?auto_25836 ) ( AVAILABLE ?auto_25837 ) ( not ( = ?auto_25840 ?auto_25838 ) ) ( HOIST-AT ?auto_25841 ?auto_25840 ) ( AVAILABLE ?auto_25841 ) ( SURFACE-AT ?auto_25836 ?auto_25840 ) ( ON ?auto_25836 ?auto_25842 ) ( CLEAR ?auto_25836 ) ( TRUCK-AT ?auto_25839 ?auto_25838 ) ( not ( = ?auto_25835 ?auto_25836 ) ) ( not ( = ?auto_25835 ?auto_25842 ) ) ( not ( = ?auto_25836 ?auto_25842 ) ) ( not ( = ?auto_25837 ?auto_25841 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25839 ?auto_25838 ?auto_25840 )
      ( !LIFT ?auto_25841 ?auto_25836 ?auto_25842 ?auto_25840 )
      ( !LOAD ?auto_25841 ?auto_25836 ?auto_25839 ?auto_25840 )
      ( !DRIVE ?auto_25839 ?auto_25840 ?auto_25838 )
      ( !UNLOAD ?auto_25837 ?auto_25836 ?auto_25839 ?auto_25838 )
      ( !DROP ?auto_25837 ?auto_25836 ?auto_25835 ?auto_25838 )
      ( MAKE-1CRATE-VERIFY ?auto_25835 ?auto_25836 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_25856 - SURFACE
      ?auto_25857 - SURFACE
      ?auto_25858 - SURFACE
      ?auto_25859 - SURFACE
      ?auto_25860 - SURFACE
      ?auto_25861 - SURFACE
      ?auto_25862 - SURFACE
      ?auto_25865 - SURFACE
      ?auto_25864 - SURFACE
      ?auto_25863 - SURFACE
      ?auto_25866 - SURFACE
      ?auto_25867 - SURFACE
      ?auto_25868 - SURFACE
    )
    :vars
    (
      ?auto_25870 - HOIST
      ?auto_25869 - PLACE
      ?auto_25871 - PLACE
      ?auto_25872 - HOIST
      ?auto_25874 - SURFACE
      ?auto_25881 - PLACE
      ?auto_25903 - HOIST
      ?auto_25897 - SURFACE
      ?auto_25905 - SURFACE
      ?auto_25877 - PLACE
      ?auto_25885 - HOIST
      ?auto_25879 - SURFACE
      ?auto_25902 - PLACE
      ?auto_25882 - HOIST
      ?auto_25889 - SURFACE
      ?auto_25890 - PLACE
      ?auto_25904 - HOIST
      ?auto_25894 - SURFACE
      ?auto_25883 - PLACE
      ?auto_25895 - HOIST
      ?auto_25892 - SURFACE
      ?auto_25878 - PLACE
      ?auto_25888 - HOIST
      ?auto_25896 - SURFACE
      ?auto_25884 - PLACE
      ?auto_25887 - HOIST
      ?auto_25901 - SURFACE
      ?auto_25876 - PLACE
      ?auto_25893 - HOIST
      ?auto_25891 - SURFACE
      ?auto_25886 - PLACE
      ?auto_25880 - HOIST
      ?auto_25900 - SURFACE
      ?auto_25899 - PLACE
      ?auto_25875 - HOIST
      ?auto_25898 - SURFACE
      ?auto_25873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25870 ?auto_25869 ) ( IS-CRATE ?auto_25868 ) ( not ( = ?auto_25871 ?auto_25869 ) ) ( HOIST-AT ?auto_25872 ?auto_25871 ) ( AVAILABLE ?auto_25872 ) ( SURFACE-AT ?auto_25868 ?auto_25871 ) ( ON ?auto_25868 ?auto_25874 ) ( CLEAR ?auto_25868 ) ( not ( = ?auto_25867 ?auto_25868 ) ) ( not ( = ?auto_25867 ?auto_25874 ) ) ( not ( = ?auto_25868 ?auto_25874 ) ) ( not ( = ?auto_25870 ?auto_25872 ) ) ( IS-CRATE ?auto_25867 ) ( not ( = ?auto_25881 ?auto_25869 ) ) ( HOIST-AT ?auto_25903 ?auto_25881 ) ( SURFACE-AT ?auto_25867 ?auto_25881 ) ( ON ?auto_25867 ?auto_25897 ) ( CLEAR ?auto_25867 ) ( not ( = ?auto_25866 ?auto_25867 ) ) ( not ( = ?auto_25866 ?auto_25897 ) ) ( not ( = ?auto_25867 ?auto_25897 ) ) ( not ( = ?auto_25870 ?auto_25903 ) ) ( IS-CRATE ?auto_25866 ) ( AVAILABLE ?auto_25903 ) ( SURFACE-AT ?auto_25866 ?auto_25881 ) ( ON ?auto_25866 ?auto_25905 ) ( CLEAR ?auto_25866 ) ( not ( = ?auto_25863 ?auto_25866 ) ) ( not ( = ?auto_25863 ?auto_25905 ) ) ( not ( = ?auto_25866 ?auto_25905 ) ) ( IS-CRATE ?auto_25863 ) ( not ( = ?auto_25877 ?auto_25869 ) ) ( HOIST-AT ?auto_25885 ?auto_25877 ) ( AVAILABLE ?auto_25885 ) ( SURFACE-AT ?auto_25863 ?auto_25877 ) ( ON ?auto_25863 ?auto_25879 ) ( CLEAR ?auto_25863 ) ( not ( = ?auto_25864 ?auto_25863 ) ) ( not ( = ?auto_25864 ?auto_25879 ) ) ( not ( = ?auto_25863 ?auto_25879 ) ) ( not ( = ?auto_25870 ?auto_25885 ) ) ( IS-CRATE ?auto_25864 ) ( not ( = ?auto_25902 ?auto_25869 ) ) ( HOIST-AT ?auto_25882 ?auto_25902 ) ( AVAILABLE ?auto_25882 ) ( SURFACE-AT ?auto_25864 ?auto_25902 ) ( ON ?auto_25864 ?auto_25889 ) ( CLEAR ?auto_25864 ) ( not ( = ?auto_25865 ?auto_25864 ) ) ( not ( = ?auto_25865 ?auto_25889 ) ) ( not ( = ?auto_25864 ?auto_25889 ) ) ( not ( = ?auto_25870 ?auto_25882 ) ) ( IS-CRATE ?auto_25865 ) ( not ( = ?auto_25890 ?auto_25869 ) ) ( HOIST-AT ?auto_25904 ?auto_25890 ) ( AVAILABLE ?auto_25904 ) ( SURFACE-AT ?auto_25865 ?auto_25890 ) ( ON ?auto_25865 ?auto_25894 ) ( CLEAR ?auto_25865 ) ( not ( = ?auto_25862 ?auto_25865 ) ) ( not ( = ?auto_25862 ?auto_25894 ) ) ( not ( = ?auto_25865 ?auto_25894 ) ) ( not ( = ?auto_25870 ?auto_25904 ) ) ( IS-CRATE ?auto_25862 ) ( not ( = ?auto_25883 ?auto_25869 ) ) ( HOIST-AT ?auto_25895 ?auto_25883 ) ( AVAILABLE ?auto_25895 ) ( SURFACE-AT ?auto_25862 ?auto_25883 ) ( ON ?auto_25862 ?auto_25892 ) ( CLEAR ?auto_25862 ) ( not ( = ?auto_25861 ?auto_25862 ) ) ( not ( = ?auto_25861 ?auto_25892 ) ) ( not ( = ?auto_25862 ?auto_25892 ) ) ( not ( = ?auto_25870 ?auto_25895 ) ) ( IS-CRATE ?auto_25861 ) ( not ( = ?auto_25878 ?auto_25869 ) ) ( HOIST-AT ?auto_25888 ?auto_25878 ) ( AVAILABLE ?auto_25888 ) ( SURFACE-AT ?auto_25861 ?auto_25878 ) ( ON ?auto_25861 ?auto_25896 ) ( CLEAR ?auto_25861 ) ( not ( = ?auto_25860 ?auto_25861 ) ) ( not ( = ?auto_25860 ?auto_25896 ) ) ( not ( = ?auto_25861 ?auto_25896 ) ) ( not ( = ?auto_25870 ?auto_25888 ) ) ( IS-CRATE ?auto_25860 ) ( not ( = ?auto_25884 ?auto_25869 ) ) ( HOIST-AT ?auto_25887 ?auto_25884 ) ( AVAILABLE ?auto_25887 ) ( SURFACE-AT ?auto_25860 ?auto_25884 ) ( ON ?auto_25860 ?auto_25901 ) ( CLEAR ?auto_25860 ) ( not ( = ?auto_25859 ?auto_25860 ) ) ( not ( = ?auto_25859 ?auto_25901 ) ) ( not ( = ?auto_25860 ?auto_25901 ) ) ( not ( = ?auto_25870 ?auto_25887 ) ) ( IS-CRATE ?auto_25859 ) ( not ( = ?auto_25876 ?auto_25869 ) ) ( HOIST-AT ?auto_25893 ?auto_25876 ) ( AVAILABLE ?auto_25893 ) ( SURFACE-AT ?auto_25859 ?auto_25876 ) ( ON ?auto_25859 ?auto_25891 ) ( CLEAR ?auto_25859 ) ( not ( = ?auto_25858 ?auto_25859 ) ) ( not ( = ?auto_25858 ?auto_25891 ) ) ( not ( = ?auto_25859 ?auto_25891 ) ) ( not ( = ?auto_25870 ?auto_25893 ) ) ( IS-CRATE ?auto_25858 ) ( not ( = ?auto_25886 ?auto_25869 ) ) ( HOIST-AT ?auto_25880 ?auto_25886 ) ( AVAILABLE ?auto_25880 ) ( SURFACE-AT ?auto_25858 ?auto_25886 ) ( ON ?auto_25858 ?auto_25900 ) ( CLEAR ?auto_25858 ) ( not ( = ?auto_25857 ?auto_25858 ) ) ( not ( = ?auto_25857 ?auto_25900 ) ) ( not ( = ?auto_25858 ?auto_25900 ) ) ( not ( = ?auto_25870 ?auto_25880 ) ) ( SURFACE-AT ?auto_25856 ?auto_25869 ) ( CLEAR ?auto_25856 ) ( IS-CRATE ?auto_25857 ) ( AVAILABLE ?auto_25870 ) ( not ( = ?auto_25899 ?auto_25869 ) ) ( HOIST-AT ?auto_25875 ?auto_25899 ) ( AVAILABLE ?auto_25875 ) ( SURFACE-AT ?auto_25857 ?auto_25899 ) ( ON ?auto_25857 ?auto_25898 ) ( CLEAR ?auto_25857 ) ( TRUCK-AT ?auto_25873 ?auto_25869 ) ( not ( = ?auto_25856 ?auto_25857 ) ) ( not ( = ?auto_25856 ?auto_25898 ) ) ( not ( = ?auto_25857 ?auto_25898 ) ) ( not ( = ?auto_25870 ?auto_25875 ) ) ( not ( = ?auto_25856 ?auto_25858 ) ) ( not ( = ?auto_25856 ?auto_25900 ) ) ( not ( = ?auto_25858 ?auto_25898 ) ) ( not ( = ?auto_25886 ?auto_25899 ) ) ( not ( = ?auto_25880 ?auto_25875 ) ) ( not ( = ?auto_25900 ?auto_25898 ) ) ( not ( = ?auto_25856 ?auto_25859 ) ) ( not ( = ?auto_25856 ?auto_25891 ) ) ( not ( = ?auto_25857 ?auto_25859 ) ) ( not ( = ?auto_25857 ?auto_25891 ) ) ( not ( = ?auto_25859 ?auto_25900 ) ) ( not ( = ?auto_25859 ?auto_25898 ) ) ( not ( = ?auto_25876 ?auto_25886 ) ) ( not ( = ?auto_25876 ?auto_25899 ) ) ( not ( = ?auto_25893 ?auto_25880 ) ) ( not ( = ?auto_25893 ?auto_25875 ) ) ( not ( = ?auto_25891 ?auto_25900 ) ) ( not ( = ?auto_25891 ?auto_25898 ) ) ( not ( = ?auto_25856 ?auto_25860 ) ) ( not ( = ?auto_25856 ?auto_25901 ) ) ( not ( = ?auto_25857 ?auto_25860 ) ) ( not ( = ?auto_25857 ?auto_25901 ) ) ( not ( = ?auto_25858 ?auto_25860 ) ) ( not ( = ?auto_25858 ?auto_25901 ) ) ( not ( = ?auto_25860 ?auto_25891 ) ) ( not ( = ?auto_25860 ?auto_25900 ) ) ( not ( = ?auto_25860 ?auto_25898 ) ) ( not ( = ?auto_25884 ?auto_25876 ) ) ( not ( = ?auto_25884 ?auto_25886 ) ) ( not ( = ?auto_25884 ?auto_25899 ) ) ( not ( = ?auto_25887 ?auto_25893 ) ) ( not ( = ?auto_25887 ?auto_25880 ) ) ( not ( = ?auto_25887 ?auto_25875 ) ) ( not ( = ?auto_25901 ?auto_25891 ) ) ( not ( = ?auto_25901 ?auto_25900 ) ) ( not ( = ?auto_25901 ?auto_25898 ) ) ( not ( = ?auto_25856 ?auto_25861 ) ) ( not ( = ?auto_25856 ?auto_25896 ) ) ( not ( = ?auto_25857 ?auto_25861 ) ) ( not ( = ?auto_25857 ?auto_25896 ) ) ( not ( = ?auto_25858 ?auto_25861 ) ) ( not ( = ?auto_25858 ?auto_25896 ) ) ( not ( = ?auto_25859 ?auto_25861 ) ) ( not ( = ?auto_25859 ?auto_25896 ) ) ( not ( = ?auto_25861 ?auto_25901 ) ) ( not ( = ?auto_25861 ?auto_25891 ) ) ( not ( = ?auto_25861 ?auto_25900 ) ) ( not ( = ?auto_25861 ?auto_25898 ) ) ( not ( = ?auto_25878 ?auto_25884 ) ) ( not ( = ?auto_25878 ?auto_25876 ) ) ( not ( = ?auto_25878 ?auto_25886 ) ) ( not ( = ?auto_25878 ?auto_25899 ) ) ( not ( = ?auto_25888 ?auto_25887 ) ) ( not ( = ?auto_25888 ?auto_25893 ) ) ( not ( = ?auto_25888 ?auto_25880 ) ) ( not ( = ?auto_25888 ?auto_25875 ) ) ( not ( = ?auto_25896 ?auto_25901 ) ) ( not ( = ?auto_25896 ?auto_25891 ) ) ( not ( = ?auto_25896 ?auto_25900 ) ) ( not ( = ?auto_25896 ?auto_25898 ) ) ( not ( = ?auto_25856 ?auto_25862 ) ) ( not ( = ?auto_25856 ?auto_25892 ) ) ( not ( = ?auto_25857 ?auto_25862 ) ) ( not ( = ?auto_25857 ?auto_25892 ) ) ( not ( = ?auto_25858 ?auto_25862 ) ) ( not ( = ?auto_25858 ?auto_25892 ) ) ( not ( = ?auto_25859 ?auto_25862 ) ) ( not ( = ?auto_25859 ?auto_25892 ) ) ( not ( = ?auto_25860 ?auto_25862 ) ) ( not ( = ?auto_25860 ?auto_25892 ) ) ( not ( = ?auto_25862 ?auto_25896 ) ) ( not ( = ?auto_25862 ?auto_25901 ) ) ( not ( = ?auto_25862 ?auto_25891 ) ) ( not ( = ?auto_25862 ?auto_25900 ) ) ( not ( = ?auto_25862 ?auto_25898 ) ) ( not ( = ?auto_25883 ?auto_25878 ) ) ( not ( = ?auto_25883 ?auto_25884 ) ) ( not ( = ?auto_25883 ?auto_25876 ) ) ( not ( = ?auto_25883 ?auto_25886 ) ) ( not ( = ?auto_25883 ?auto_25899 ) ) ( not ( = ?auto_25895 ?auto_25888 ) ) ( not ( = ?auto_25895 ?auto_25887 ) ) ( not ( = ?auto_25895 ?auto_25893 ) ) ( not ( = ?auto_25895 ?auto_25880 ) ) ( not ( = ?auto_25895 ?auto_25875 ) ) ( not ( = ?auto_25892 ?auto_25896 ) ) ( not ( = ?auto_25892 ?auto_25901 ) ) ( not ( = ?auto_25892 ?auto_25891 ) ) ( not ( = ?auto_25892 ?auto_25900 ) ) ( not ( = ?auto_25892 ?auto_25898 ) ) ( not ( = ?auto_25856 ?auto_25865 ) ) ( not ( = ?auto_25856 ?auto_25894 ) ) ( not ( = ?auto_25857 ?auto_25865 ) ) ( not ( = ?auto_25857 ?auto_25894 ) ) ( not ( = ?auto_25858 ?auto_25865 ) ) ( not ( = ?auto_25858 ?auto_25894 ) ) ( not ( = ?auto_25859 ?auto_25865 ) ) ( not ( = ?auto_25859 ?auto_25894 ) ) ( not ( = ?auto_25860 ?auto_25865 ) ) ( not ( = ?auto_25860 ?auto_25894 ) ) ( not ( = ?auto_25861 ?auto_25865 ) ) ( not ( = ?auto_25861 ?auto_25894 ) ) ( not ( = ?auto_25865 ?auto_25892 ) ) ( not ( = ?auto_25865 ?auto_25896 ) ) ( not ( = ?auto_25865 ?auto_25901 ) ) ( not ( = ?auto_25865 ?auto_25891 ) ) ( not ( = ?auto_25865 ?auto_25900 ) ) ( not ( = ?auto_25865 ?auto_25898 ) ) ( not ( = ?auto_25890 ?auto_25883 ) ) ( not ( = ?auto_25890 ?auto_25878 ) ) ( not ( = ?auto_25890 ?auto_25884 ) ) ( not ( = ?auto_25890 ?auto_25876 ) ) ( not ( = ?auto_25890 ?auto_25886 ) ) ( not ( = ?auto_25890 ?auto_25899 ) ) ( not ( = ?auto_25904 ?auto_25895 ) ) ( not ( = ?auto_25904 ?auto_25888 ) ) ( not ( = ?auto_25904 ?auto_25887 ) ) ( not ( = ?auto_25904 ?auto_25893 ) ) ( not ( = ?auto_25904 ?auto_25880 ) ) ( not ( = ?auto_25904 ?auto_25875 ) ) ( not ( = ?auto_25894 ?auto_25892 ) ) ( not ( = ?auto_25894 ?auto_25896 ) ) ( not ( = ?auto_25894 ?auto_25901 ) ) ( not ( = ?auto_25894 ?auto_25891 ) ) ( not ( = ?auto_25894 ?auto_25900 ) ) ( not ( = ?auto_25894 ?auto_25898 ) ) ( not ( = ?auto_25856 ?auto_25864 ) ) ( not ( = ?auto_25856 ?auto_25889 ) ) ( not ( = ?auto_25857 ?auto_25864 ) ) ( not ( = ?auto_25857 ?auto_25889 ) ) ( not ( = ?auto_25858 ?auto_25864 ) ) ( not ( = ?auto_25858 ?auto_25889 ) ) ( not ( = ?auto_25859 ?auto_25864 ) ) ( not ( = ?auto_25859 ?auto_25889 ) ) ( not ( = ?auto_25860 ?auto_25864 ) ) ( not ( = ?auto_25860 ?auto_25889 ) ) ( not ( = ?auto_25861 ?auto_25864 ) ) ( not ( = ?auto_25861 ?auto_25889 ) ) ( not ( = ?auto_25862 ?auto_25864 ) ) ( not ( = ?auto_25862 ?auto_25889 ) ) ( not ( = ?auto_25864 ?auto_25894 ) ) ( not ( = ?auto_25864 ?auto_25892 ) ) ( not ( = ?auto_25864 ?auto_25896 ) ) ( not ( = ?auto_25864 ?auto_25901 ) ) ( not ( = ?auto_25864 ?auto_25891 ) ) ( not ( = ?auto_25864 ?auto_25900 ) ) ( not ( = ?auto_25864 ?auto_25898 ) ) ( not ( = ?auto_25902 ?auto_25890 ) ) ( not ( = ?auto_25902 ?auto_25883 ) ) ( not ( = ?auto_25902 ?auto_25878 ) ) ( not ( = ?auto_25902 ?auto_25884 ) ) ( not ( = ?auto_25902 ?auto_25876 ) ) ( not ( = ?auto_25902 ?auto_25886 ) ) ( not ( = ?auto_25902 ?auto_25899 ) ) ( not ( = ?auto_25882 ?auto_25904 ) ) ( not ( = ?auto_25882 ?auto_25895 ) ) ( not ( = ?auto_25882 ?auto_25888 ) ) ( not ( = ?auto_25882 ?auto_25887 ) ) ( not ( = ?auto_25882 ?auto_25893 ) ) ( not ( = ?auto_25882 ?auto_25880 ) ) ( not ( = ?auto_25882 ?auto_25875 ) ) ( not ( = ?auto_25889 ?auto_25894 ) ) ( not ( = ?auto_25889 ?auto_25892 ) ) ( not ( = ?auto_25889 ?auto_25896 ) ) ( not ( = ?auto_25889 ?auto_25901 ) ) ( not ( = ?auto_25889 ?auto_25891 ) ) ( not ( = ?auto_25889 ?auto_25900 ) ) ( not ( = ?auto_25889 ?auto_25898 ) ) ( not ( = ?auto_25856 ?auto_25863 ) ) ( not ( = ?auto_25856 ?auto_25879 ) ) ( not ( = ?auto_25857 ?auto_25863 ) ) ( not ( = ?auto_25857 ?auto_25879 ) ) ( not ( = ?auto_25858 ?auto_25863 ) ) ( not ( = ?auto_25858 ?auto_25879 ) ) ( not ( = ?auto_25859 ?auto_25863 ) ) ( not ( = ?auto_25859 ?auto_25879 ) ) ( not ( = ?auto_25860 ?auto_25863 ) ) ( not ( = ?auto_25860 ?auto_25879 ) ) ( not ( = ?auto_25861 ?auto_25863 ) ) ( not ( = ?auto_25861 ?auto_25879 ) ) ( not ( = ?auto_25862 ?auto_25863 ) ) ( not ( = ?auto_25862 ?auto_25879 ) ) ( not ( = ?auto_25865 ?auto_25863 ) ) ( not ( = ?auto_25865 ?auto_25879 ) ) ( not ( = ?auto_25863 ?auto_25889 ) ) ( not ( = ?auto_25863 ?auto_25894 ) ) ( not ( = ?auto_25863 ?auto_25892 ) ) ( not ( = ?auto_25863 ?auto_25896 ) ) ( not ( = ?auto_25863 ?auto_25901 ) ) ( not ( = ?auto_25863 ?auto_25891 ) ) ( not ( = ?auto_25863 ?auto_25900 ) ) ( not ( = ?auto_25863 ?auto_25898 ) ) ( not ( = ?auto_25877 ?auto_25902 ) ) ( not ( = ?auto_25877 ?auto_25890 ) ) ( not ( = ?auto_25877 ?auto_25883 ) ) ( not ( = ?auto_25877 ?auto_25878 ) ) ( not ( = ?auto_25877 ?auto_25884 ) ) ( not ( = ?auto_25877 ?auto_25876 ) ) ( not ( = ?auto_25877 ?auto_25886 ) ) ( not ( = ?auto_25877 ?auto_25899 ) ) ( not ( = ?auto_25885 ?auto_25882 ) ) ( not ( = ?auto_25885 ?auto_25904 ) ) ( not ( = ?auto_25885 ?auto_25895 ) ) ( not ( = ?auto_25885 ?auto_25888 ) ) ( not ( = ?auto_25885 ?auto_25887 ) ) ( not ( = ?auto_25885 ?auto_25893 ) ) ( not ( = ?auto_25885 ?auto_25880 ) ) ( not ( = ?auto_25885 ?auto_25875 ) ) ( not ( = ?auto_25879 ?auto_25889 ) ) ( not ( = ?auto_25879 ?auto_25894 ) ) ( not ( = ?auto_25879 ?auto_25892 ) ) ( not ( = ?auto_25879 ?auto_25896 ) ) ( not ( = ?auto_25879 ?auto_25901 ) ) ( not ( = ?auto_25879 ?auto_25891 ) ) ( not ( = ?auto_25879 ?auto_25900 ) ) ( not ( = ?auto_25879 ?auto_25898 ) ) ( not ( = ?auto_25856 ?auto_25866 ) ) ( not ( = ?auto_25856 ?auto_25905 ) ) ( not ( = ?auto_25857 ?auto_25866 ) ) ( not ( = ?auto_25857 ?auto_25905 ) ) ( not ( = ?auto_25858 ?auto_25866 ) ) ( not ( = ?auto_25858 ?auto_25905 ) ) ( not ( = ?auto_25859 ?auto_25866 ) ) ( not ( = ?auto_25859 ?auto_25905 ) ) ( not ( = ?auto_25860 ?auto_25866 ) ) ( not ( = ?auto_25860 ?auto_25905 ) ) ( not ( = ?auto_25861 ?auto_25866 ) ) ( not ( = ?auto_25861 ?auto_25905 ) ) ( not ( = ?auto_25862 ?auto_25866 ) ) ( not ( = ?auto_25862 ?auto_25905 ) ) ( not ( = ?auto_25865 ?auto_25866 ) ) ( not ( = ?auto_25865 ?auto_25905 ) ) ( not ( = ?auto_25864 ?auto_25866 ) ) ( not ( = ?auto_25864 ?auto_25905 ) ) ( not ( = ?auto_25866 ?auto_25879 ) ) ( not ( = ?auto_25866 ?auto_25889 ) ) ( not ( = ?auto_25866 ?auto_25894 ) ) ( not ( = ?auto_25866 ?auto_25892 ) ) ( not ( = ?auto_25866 ?auto_25896 ) ) ( not ( = ?auto_25866 ?auto_25901 ) ) ( not ( = ?auto_25866 ?auto_25891 ) ) ( not ( = ?auto_25866 ?auto_25900 ) ) ( not ( = ?auto_25866 ?auto_25898 ) ) ( not ( = ?auto_25881 ?auto_25877 ) ) ( not ( = ?auto_25881 ?auto_25902 ) ) ( not ( = ?auto_25881 ?auto_25890 ) ) ( not ( = ?auto_25881 ?auto_25883 ) ) ( not ( = ?auto_25881 ?auto_25878 ) ) ( not ( = ?auto_25881 ?auto_25884 ) ) ( not ( = ?auto_25881 ?auto_25876 ) ) ( not ( = ?auto_25881 ?auto_25886 ) ) ( not ( = ?auto_25881 ?auto_25899 ) ) ( not ( = ?auto_25903 ?auto_25885 ) ) ( not ( = ?auto_25903 ?auto_25882 ) ) ( not ( = ?auto_25903 ?auto_25904 ) ) ( not ( = ?auto_25903 ?auto_25895 ) ) ( not ( = ?auto_25903 ?auto_25888 ) ) ( not ( = ?auto_25903 ?auto_25887 ) ) ( not ( = ?auto_25903 ?auto_25893 ) ) ( not ( = ?auto_25903 ?auto_25880 ) ) ( not ( = ?auto_25903 ?auto_25875 ) ) ( not ( = ?auto_25905 ?auto_25879 ) ) ( not ( = ?auto_25905 ?auto_25889 ) ) ( not ( = ?auto_25905 ?auto_25894 ) ) ( not ( = ?auto_25905 ?auto_25892 ) ) ( not ( = ?auto_25905 ?auto_25896 ) ) ( not ( = ?auto_25905 ?auto_25901 ) ) ( not ( = ?auto_25905 ?auto_25891 ) ) ( not ( = ?auto_25905 ?auto_25900 ) ) ( not ( = ?auto_25905 ?auto_25898 ) ) ( not ( = ?auto_25856 ?auto_25867 ) ) ( not ( = ?auto_25856 ?auto_25897 ) ) ( not ( = ?auto_25857 ?auto_25867 ) ) ( not ( = ?auto_25857 ?auto_25897 ) ) ( not ( = ?auto_25858 ?auto_25867 ) ) ( not ( = ?auto_25858 ?auto_25897 ) ) ( not ( = ?auto_25859 ?auto_25867 ) ) ( not ( = ?auto_25859 ?auto_25897 ) ) ( not ( = ?auto_25860 ?auto_25867 ) ) ( not ( = ?auto_25860 ?auto_25897 ) ) ( not ( = ?auto_25861 ?auto_25867 ) ) ( not ( = ?auto_25861 ?auto_25897 ) ) ( not ( = ?auto_25862 ?auto_25867 ) ) ( not ( = ?auto_25862 ?auto_25897 ) ) ( not ( = ?auto_25865 ?auto_25867 ) ) ( not ( = ?auto_25865 ?auto_25897 ) ) ( not ( = ?auto_25864 ?auto_25867 ) ) ( not ( = ?auto_25864 ?auto_25897 ) ) ( not ( = ?auto_25863 ?auto_25867 ) ) ( not ( = ?auto_25863 ?auto_25897 ) ) ( not ( = ?auto_25867 ?auto_25905 ) ) ( not ( = ?auto_25867 ?auto_25879 ) ) ( not ( = ?auto_25867 ?auto_25889 ) ) ( not ( = ?auto_25867 ?auto_25894 ) ) ( not ( = ?auto_25867 ?auto_25892 ) ) ( not ( = ?auto_25867 ?auto_25896 ) ) ( not ( = ?auto_25867 ?auto_25901 ) ) ( not ( = ?auto_25867 ?auto_25891 ) ) ( not ( = ?auto_25867 ?auto_25900 ) ) ( not ( = ?auto_25867 ?auto_25898 ) ) ( not ( = ?auto_25897 ?auto_25905 ) ) ( not ( = ?auto_25897 ?auto_25879 ) ) ( not ( = ?auto_25897 ?auto_25889 ) ) ( not ( = ?auto_25897 ?auto_25894 ) ) ( not ( = ?auto_25897 ?auto_25892 ) ) ( not ( = ?auto_25897 ?auto_25896 ) ) ( not ( = ?auto_25897 ?auto_25901 ) ) ( not ( = ?auto_25897 ?auto_25891 ) ) ( not ( = ?auto_25897 ?auto_25900 ) ) ( not ( = ?auto_25897 ?auto_25898 ) ) ( not ( = ?auto_25856 ?auto_25868 ) ) ( not ( = ?auto_25856 ?auto_25874 ) ) ( not ( = ?auto_25857 ?auto_25868 ) ) ( not ( = ?auto_25857 ?auto_25874 ) ) ( not ( = ?auto_25858 ?auto_25868 ) ) ( not ( = ?auto_25858 ?auto_25874 ) ) ( not ( = ?auto_25859 ?auto_25868 ) ) ( not ( = ?auto_25859 ?auto_25874 ) ) ( not ( = ?auto_25860 ?auto_25868 ) ) ( not ( = ?auto_25860 ?auto_25874 ) ) ( not ( = ?auto_25861 ?auto_25868 ) ) ( not ( = ?auto_25861 ?auto_25874 ) ) ( not ( = ?auto_25862 ?auto_25868 ) ) ( not ( = ?auto_25862 ?auto_25874 ) ) ( not ( = ?auto_25865 ?auto_25868 ) ) ( not ( = ?auto_25865 ?auto_25874 ) ) ( not ( = ?auto_25864 ?auto_25868 ) ) ( not ( = ?auto_25864 ?auto_25874 ) ) ( not ( = ?auto_25863 ?auto_25868 ) ) ( not ( = ?auto_25863 ?auto_25874 ) ) ( not ( = ?auto_25866 ?auto_25868 ) ) ( not ( = ?auto_25866 ?auto_25874 ) ) ( not ( = ?auto_25868 ?auto_25897 ) ) ( not ( = ?auto_25868 ?auto_25905 ) ) ( not ( = ?auto_25868 ?auto_25879 ) ) ( not ( = ?auto_25868 ?auto_25889 ) ) ( not ( = ?auto_25868 ?auto_25894 ) ) ( not ( = ?auto_25868 ?auto_25892 ) ) ( not ( = ?auto_25868 ?auto_25896 ) ) ( not ( = ?auto_25868 ?auto_25901 ) ) ( not ( = ?auto_25868 ?auto_25891 ) ) ( not ( = ?auto_25868 ?auto_25900 ) ) ( not ( = ?auto_25868 ?auto_25898 ) ) ( not ( = ?auto_25871 ?auto_25881 ) ) ( not ( = ?auto_25871 ?auto_25877 ) ) ( not ( = ?auto_25871 ?auto_25902 ) ) ( not ( = ?auto_25871 ?auto_25890 ) ) ( not ( = ?auto_25871 ?auto_25883 ) ) ( not ( = ?auto_25871 ?auto_25878 ) ) ( not ( = ?auto_25871 ?auto_25884 ) ) ( not ( = ?auto_25871 ?auto_25876 ) ) ( not ( = ?auto_25871 ?auto_25886 ) ) ( not ( = ?auto_25871 ?auto_25899 ) ) ( not ( = ?auto_25872 ?auto_25903 ) ) ( not ( = ?auto_25872 ?auto_25885 ) ) ( not ( = ?auto_25872 ?auto_25882 ) ) ( not ( = ?auto_25872 ?auto_25904 ) ) ( not ( = ?auto_25872 ?auto_25895 ) ) ( not ( = ?auto_25872 ?auto_25888 ) ) ( not ( = ?auto_25872 ?auto_25887 ) ) ( not ( = ?auto_25872 ?auto_25893 ) ) ( not ( = ?auto_25872 ?auto_25880 ) ) ( not ( = ?auto_25872 ?auto_25875 ) ) ( not ( = ?auto_25874 ?auto_25897 ) ) ( not ( = ?auto_25874 ?auto_25905 ) ) ( not ( = ?auto_25874 ?auto_25879 ) ) ( not ( = ?auto_25874 ?auto_25889 ) ) ( not ( = ?auto_25874 ?auto_25894 ) ) ( not ( = ?auto_25874 ?auto_25892 ) ) ( not ( = ?auto_25874 ?auto_25896 ) ) ( not ( = ?auto_25874 ?auto_25901 ) ) ( not ( = ?auto_25874 ?auto_25891 ) ) ( not ( = ?auto_25874 ?auto_25900 ) ) ( not ( = ?auto_25874 ?auto_25898 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_25856 ?auto_25857 ?auto_25858 ?auto_25859 ?auto_25860 ?auto_25861 ?auto_25862 ?auto_25865 ?auto_25864 ?auto_25863 ?auto_25866 ?auto_25867 )
      ( MAKE-1CRATE ?auto_25867 ?auto_25868 )
      ( MAKE-12CRATE-VERIFY ?auto_25856 ?auto_25857 ?auto_25858 ?auto_25859 ?auto_25860 ?auto_25861 ?auto_25862 ?auto_25865 ?auto_25864 ?auto_25863 ?auto_25866 ?auto_25867 ?auto_25868 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25908 - SURFACE
      ?auto_25909 - SURFACE
    )
    :vars
    (
      ?auto_25910 - HOIST
      ?auto_25911 - PLACE
      ?auto_25913 - PLACE
      ?auto_25914 - HOIST
      ?auto_25915 - SURFACE
      ?auto_25912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25910 ?auto_25911 ) ( SURFACE-AT ?auto_25908 ?auto_25911 ) ( CLEAR ?auto_25908 ) ( IS-CRATE ?auto_25909 ) ( AVAILABLE ?auto_25910 ) ( not ( = ?auto_25913 ?auto_25911 ) ) ( HOIST-AT ?auto_25914 ?auto_25913 ) ( AVAILABLE ?auto_25914 ) ( SURFACE-AT ?auto_25909 ?auto_25913 ) ( ON ?auto_25909 ?auto_25915 ) ( CLEAR ?auto_25909 ) ( TRUCK-AT ?auto_25912 ?auto_25911 ) ( not ( = ?auto_25908 ?auto_25909 ) ) ( not ( = ?auto_25908 ?auto_25915 ) ) ( not ( = ?auto_25909 ?auto_25915 ) ) ( not ( = ?auto_25910 ?auto_25914 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25912 ?auto_25911 ?auto_25913 )
      ( !LIFT ?auto_25914 ?auto_25909 ?auto_25915 ?auto_25913 )
      ( !LOAD ?auto_25914 ?auto_25909 ?auto_25912 ?auto_25913 )
      ( !DRIVE ?auto_25912 ?auto_25913 ?auto_25911 )
      ( !UNLOAD ?auto_25910 ?auto_25909 ?auto_25912 ?auto_25911 )
      ( !DROP ?auto_25910 ?auto_25909 ?auto_25908 ?auto_25911 )
      ( MAKE-1CRATE-VERIFY ?auto_25908 ?auto_25909 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_25930 - SURFACE
      ?auto_25931 - SURFACE
      ?auto_25932 - SURFACE
      ?auto_25933 - SURFACE
      ?auto_25934 - SURFACE
      ?auto_25935 - SURFACE
      ?auto_25936 - SURFACE
      ?auto_25939 - SURFACE
      ?auto_25938 - SURFACE
      ?auto_25937 - SURFACE
      ?auto_25940 - SURFACE
      ?auto_25941 - SURFACE
      ?auto_25942 - SURFACE
      ?auto_25943 - SURFACE
    )
    :vars
    (
      ?auto_25945 - HOIST
      ?auto_25944 - PLACE
      ?auto_25948 - PLACE
      ?auto_25949 - HOIST
      ?auto_25946 - SURFACE
      ?auto_25983 - PLACE
      ?auto_25962 - HOIST
      ?auto_25975 - SURFACE
      ?auto_25972 - PLACE
      ?auto_25978 - HOIST
      ?auto_25957 - SURFACE
      ?auto_25976 - SURFACE
      ?auto_25952 - PLACE
      ?auto_25963 - HOIST
      ?auto_25961 - SURFACE
      ?auto_25973 - PLACE
      ?auto_25960 - HOIST
      ?auto_25958 - SURFACE
      ?auto_25980 - PLACE
      ?auto_25977 - HOIST
      ?auto_25969 - SURFACE
      ?auto_25971 - PLACE
      ?auto_25981 - HOIST
      ?auto_25956 - SURFACE
      ?auto_25954 - PLACE
      ?auto_25974 - HOIST
      ?auto_25982 - SURFACE
      ?auto_25950 - PLACE
      ?auto_25959 - HOIST
      ?auto_25968 - SURFACE
      ?auto_25970 - PLACE
      ?auto_25967 - HOIST
      ?auto_25951 - SURFACE
      ?auto_25979 - PLACE
      ?auto_25953 - HOIST
      ?auto_25965 - SURFACE
      ?auto_25964 - PLACE
      ?auto_25955 - HOIST
      ?auto_25966 - SURFACE
      ?auto_25947 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25945 ?auto_25944 ) ( IS-CRATE ?auto_25943 ) ( not ( = ?auto_25948 ?auto_25944 ) ) ( HOIST-AT ?auto_25949 ?auto_25948 ) ( AVAILABLE ?auto_25949 ) ( SURFACE-AT ?auto_25943 ?auto_25948 ) ( ON ?auto_25943 ?auto_25946 ) ( CLEAR ?auto_25943 ) ( not ( = ?auto_25942 ?auto_25943 ) ) ( not ( = ?auto_25942 ?auto_25946 ) ) ( not ( = ?auto_25943 ?auto_25946 ) ) ( not ( = ?auto_25945 ?auto_25949 ) ) ( IS-CRATE ?auto_25942 ) ( not ( = ?auto_25983 ?auto_25944 ) ) ( HOIST-AT ?auto_25962 ?auto_25983 ) ( AVAILABLE ?auto_25962 ) ( SURFACE-AT ?auto_25942 ?auto_25983 ) ( ON ?auto_25942 ?auto_25975 ) ( CLEAR ?auto_25942 ) ( not ( = ?auto_25941 ?auto_25942 ) ) ( not ( = ?auto_25941 ?auto_25975 ) ) ( not ( = ?auto_25942 ?auto_25975 ) ) ( not ( = ?auto_25945 ?auto_25962 ) ) ( IS-CRATE ?auto_25941 ) ( not ( = ?auto_25972 ?auto_25944 ) ) ( HOIST-AT ?auto_25978 ?auto_25972 ) ( SURFACE-AT ?auto_25941 ?auto_25972 ) ( ON ?auto_25941 ?auto_25957 ) ( CLEAR ?auto_25941 ) ( not ( = ?auto_25940 ?auto_25941 ) ) ( not ( = ?auto_25940 ?auto_25957 ) ) ( not ( = ?auto_25941 ?auto_25957 ) ) ( not ( = ?auto_25945 ?auto_25978 ) ) ( IS-CRATE ?auto_25940 ) ( AVAILABLE ?auto_25978 ) ( SURFACE-AT ?auto_25940 ?auto_25972 ) ( ON ?auto_25940 ?auto_25976 ) ( CLEAR ?auto_25940 ) ( not ( = ?auto_25937 ?auto_25940 ) ) ( not ( = ?auto_25937 ?auto_25976 ) ) ( not ( = ?auto_25940 ?auto_25976 ) ) ( IS-CRATE ?auto_25937 ) ( not ( = ?auto_25952 ?auto_25944 ) ) ( HOIST-AT ?auto_25963 ?auto_25952 ) ( AVAILABLE ?auto_25963 ) ( SURFACE-AT ?auto_25937 ?auto_25952 ) ( ON ?auto_25937 ?auto_25961 ) ( CLEAR ?auto_25937 ) ( not ( = ?auto_25938 ?auto_25937 ) ) ( not ( = ?auto_25938 ?auto_25961 ) ) ( not ( = ?auto_25937 ?auto_25961 ) ) ( not ( = ?auto_25945 ?auto_25963 ) ) ( IS-CRATE ?auto_25938 ) ( not ( = ?auto_25973 ?auto_25944 ) ) ( HOIST-AT ?auto_25960 ?auto_25973 ) ( AVAILABLE ?auto_25960 ) ( SURFACE-AT ?auto_25938 ?auto_25973 ) ( ON ?auto_25938 ?auto_25958 ) ( CLEAR ?auto_25938 ) ( not ( = ?auto_25939 ?auto_25938 ) ) ( not ( = ?auto_25939 ?auto_25958 ) ) ( not ( = ?auto_25938 ?auto_25958 ) ) ( not ( = ?auto_25945 ?auto_25960 ) ) ( IS-CRATE ?auto_25939 ) ( not ( = ?auto_25980 ?auto_25944 ) ) ( HOIST-AT ?auto_25977 ?auto_25980 ) ( AVAILABLE ?auto_25977 ) ( SURFACE-AT ?auto_25939 ?auto_25980 ) ( ON ?auto_25939 ?auto_25969 ) ( CLEAR ?auto_25939 ) ( not ( = ?auto_25936 ?auto_25939 ) ) ( not ( = ?auto_25936 ?auto_25969 ) ) ( not ( = ?auto_25939 ?auto_25969 ) ) ( not ( = ?auto_25945 ?auto_25977 ) ) ( IS-CRATE ?auto_25936 ) ( not ( = ?auto_25971 ?auto_25944 ) ) ( HOIST-AT ?auto_25981 ?auto_25971 ) ( AVAILABLE ?auto_25981 ) ( SURFACE-AT ?auto_25936 ?auto_25971 ) ( ON ?auto_25936 ?auto_25956 ) ( CLEAR ?auto_25936 ) ( not ( = ?auto_25935 ?auto_25936 ) ) ( not ( = ?auto_25935 ?auto_25956 ) ) ( not ( = ?auto_25936 ?auto_25956 ) ) ( not ( = ?auto_25945 ?auto_25981 ) ) ( IS-CRATE ?auto_25935 ) ( not ( = ?auto_25954 ?auto_25944 ) ) ( HOIST-AT ?auto_25974 ?auto_25954 ) ( AVAILABLE ?auto_25974 ) ( SURFACE-AT ?auto_25935 ?auto_25954 ) ( ON ?auto_25935 ?auto_25982 ) ( CLEAR ?auto_25935 ) ( not ( = ?auto_25934 ?auto_25935 ) ) ( not ( = ?auto_25934 ?auto_25982 ) ) ( not ( = ?auto_25935 ?auto_25982 ) ) ( not ( = ?auto_25945 ?auto_25974 ) ) ( IS-CRATE ?auto_25934 ) ( not ( = ?auto_25950 ?auto_25944 ) ) ( HOIST-AT ?auto_25959 ?auto_25950 ) ( AVAILABLE ?auto_25959 ) ( SURFACE-AT ?auto_25934 ?auto_25950 ) ( ON ?auto_25934 ?auto_25968 ) ( CLEAR ?auto_25934 ) ( not ( = ?auto_25933 ?auto_25934 ) ) ( not ( = ?auto_25933 ?auto_25968 ) ) ( not ( = ?auto_25934 ?auto_25968 ) ) ( not ( = ?auto_25945 ?auto_25959 ) ) ( IS-CRATE ?auto_25933 ) ( not ( = ?auto_25970 ?auto_25944 ) ) ( HOIST-AT ?auto_25967 ?auto_25970 ) ( AVAILABLE ?auto_25967 ) ( SURFACE-AT ?auto_25933 ?auto_25970 ) ( ON ?auto_25933 ?auto_25951 ) ( CLEAR ?auto_25933 ) ( not ( = ?auto_25932 ?auto_25933 ) ) ( not ( = ?auto_25932 ?auto_25951 ) ) ( not ( = ?auto_25933 ?auto_25951 ) ) ( not ( = ?auto_25945 ?auto_25967 ) ) ( IS-CRATE ?auto_25932 ) ( not ( = ?auto_25979 ?auto_25944 ) ) ( HOIST-AT ?auto_25953 ?auto_25979 ) ( AVAILABLE ?auto_25953 ) ( SURFACE-AT ?auto_25932 ?auto_25979 ) ( ON ?auto_25932 ?auto_25965 ) ( CLEAR ?auto_25932 ) ( not ( = ?auto_25931 ?auto_25932 ) ) ( not ( = ?auto_25931 ?auto_25965 ) ) ( not ( = ?auto_25932 ?auto_25965 ) ) ( not ( = ?auto_25945 ?auto_25953 ) ) ( SURFACE-AT ?auto_25930 ?auto_25944 ) ( CLEAR ?auto_25930 ) ( IS-CRATE ?auto_25931 ) ( AVAILABLE ?auto_25945 ) ( not ( = ?auto_25964 ?auto_25944 ) ) ( HOIST-AT ?auto_25955 ?auto_25964 ) ( AVAILABLE ?auto_25955 ) ( SURFACE-AT ?auto_25931 ?auto_25964 ) ( ON ?auto_25931 ?auto_25966 ) ( CLEAR ?auto_25931 ) ( TRUCK-AT ?auto_25947 ?auto_25944 ) ( not ( = ?auto_25930 ?auto_25931 ) ) ( not ( = ?auto_25930 ?auto_25966 ) ) ( not ( = ?auto_25931 ?auto_25966 ) ) ( not ( = ?auto_25945 ?auto_25955 ) ) ( not ( = ?auto_25930 ?auto_25932 ) ) ( not ( = ?auto_25930 ?auto_25965 ) ) ( not ( = ?auto_25932 ?auto_25966 ) ) ( not ( = ?auto_25979 ?auto_25964 ) ) ( not ( = ?auto_25953 ?auto_25955 ) ) ( not ( = ?auto_25965 ?auto_25966 ) ) ( not ( = ?auto_25930 ?auto_25933 ) ) ( not ( = ?auto_25930 ?auto_25951 ) ) ( not ( = ?auto_25931 ?auto_25933 ) ) ( not ( = ?auto_25931 ?auto_25951 ) ) ( not ( = ?auto_25933 ?auto_25965 ) ) ( not ( = ?auto_25933 ?auto_25966 ) ) ( not ( = ?auto_25970 ?auto_25979 ) ) ( not ( = ?auto_25970 ?auto_25964 ) ) ( not ( = ?auto_25967 ?auto_25953 ) ) ( not ( = ?auto_25967 ?auto_25955 ) ) ( not ( = ?auto_25951 ?auto_25965 ) ) ( not ( = ?auto_25951 ?auto_25966 ) ) ( not ( = ?auto_25930 ?auto_25934 ) ) ( not ( = ?auto_25930 ?auto_25968 ) ) ( not ( = ?auto_25931 ?auto_25934 ) ) ( not ( = ?auto_25931 ?auto_25968 ) ) ( not ( = ?auto_25932 ?auto_25934 ) ) ( not ( = ?auto_25932 ?auto_25968 ) ) ( not ( = ?auto_25934 ?auto_25951 ) ) ( not ( = ?auto_25934 ?auto_25965 ) ) ( not ( = ?auto_25934 ?auto_25966 ) ) ( not ( = ?auto_25950 ?auto_25970 ) ) ( not ( = ?auto_25950 ?auto_25979 ) ) ( not ( = ?auto_25950 ?auto_25964 ) ) ( not ( = ?auto_25959 ?auto_25967 ) ) ( not ( = ?auto_25959 ?auto_25953 ) ) ( not ( = ?auto_25959 ?auto_25955 ) ) ( not ( = ?auto_25968 ?auto_25951 ) ) ( not ( = ?auto_25968 ?auto_25965 ) ) ( not ( = ?auto_25968 ?auto_25966 ) ) ( not ( = ?auto_25930 ?auto_25935 ) ) ( not ( = ?auto_25930 ?auto_25982 ) ) ( not ( = ?auto_25931 ?auto_25935 ) ) ( not ( = ?auto_25931 ?auto_25982 ) ) ( not ( = ?auto_25932 ?auto_25935 ) ) ( not ( = ?auto_25932 ?auto_25982 ) ) ( not ( = ?auto_25933 ?auto_25935 ) ) ( not ( = ?auto_25933 ?auto_25982 ) ) ( not ( = ?auto_25935 ?auto_25968 ) ) ( not ( = ?auto_25935 ?auto_25951 ) ) ( not ( = ?auto_25935 ?auto_25965 ) ) ( not ( = ?auto_25935 ?auto_25966 ) ) ( not ( = ?auto_25954 ?auto_25950 ) ) ( not ( = ?auto_25954 ?auto_25970 ) ) ( not ( = ?auto_25954 ?auto_25979 ) ) ( not ( = ?auto_25954 ?auto_25964 ) ) ( not ( = ?auto_25974 ?auto_25959 ) ) ( not ( = ?auto_25974 ?auto_25967 ) ) ( not ( = ?auto_25974 ?auto_25953 ) ) ( not ( = ?auto_25974 ?auto_25955 ) ) ( not ( = ?auto_25982 ?auto_25968 ) ) ( not ( = ?auto_25982 ?auto_25951 ) ) ( not ( = ?auto_25982 ?auto_25965 ) ) ( not ( = ?auto_25982 ?auto_25966 ) ) ( not ( = ?auto_25930 ?auto_25936 ) ) ( not ( = ?auto_25930 ?auto_25956 ) ) ( not ( = ?auto_25931 ?auto_25936 ) ) ( not ( = ?auto_25931 ?auto_25956 ) ) ( not ( = ?auto_25932 ?auto_25936 ) ) ( not ( = ?auto_25932 ?auto_25956 ) ) ( not ( = ?auto_25933 ?auto_25936 ) ) ( not ( = ?auto_25933 ?auto_25956 ) ) ( not ( = ?auto_25934 ?auto_25936 ) ) ( not ( = ?auto_25934 ?auto_25956 ) ) ( not ( = ?auto_25936 ?auto_25982 ) ) ( not ( = ?auto_25936 ?auto_25968 ) ) ( not ( = ?auto_25936 ?auto_25951 ) ) ( not ( = ?auto_25936 ?auto_25965 ) ) ( not ( = ?auto_25936 ?auto_25966 ) ) ( not ( = ?auto_25971 ?auto_25954 ) ) ( not ( = ?auto_25971 ?auto_25950 ) ) ( not ( = ?auto_25971 ?auto_25970 ) ) ( not ( = ?auto_25971 ?auto_25979 ) ) ( not ( = ?auto_25971 ?auto_25964 ) ) ( not ( = ?auto_25981 ?auto_25974 ) ) ( not ( = ?auto_25981 ?auto_25959 ) ) ( not ( = ?auto_25981 ?auto_25967 ) ) ( not ( = ?auto_25981 ?auto_25953 ) ) ( not ( = ?auto_25981 ?auto_25955 ) ) ( not ( = ?auto_25956 ?auto_25982 ) ) ( not ( = ?auto_25956 ?auto_25968 ) ) ( not ( = ?auto_25956 ?auto_25951 ) ) ( not ( = ?auto_25956 ?auto_25965 ) ) ( not ( = ?auto_25956 ?auto_25966 ) ) ( not ( = ?auto_25930 ?auto_25939 ) ) ( not ( = ?auto_25930 ?auto_25969 ) ) ( not ( = ?auto_25931 ?auto_25939 ) ) ( not ( = ?auto_25931 ?auto_25969 ) ) ( not ( = ?auto_25932 ?auto_25939 ) ) ( not ( = ?auto_25932 ?auto_25969 ) ) ( not ( = ?auto_25933 ?auto_25939 ) ) ( not ( = ?auto_25933 ?auto_25969 ) ) ( not ( = ?auto_25934 ?auto_25939 ) ) ( not ( = ?auto_25934 ?auto_25969 ) ) ( not ( = ?auto_25935 ?auto_25939 ) ) ( not ( = ?auto_25935 ?auto_25969 ) ) ( not ( = ?auto_25939 ?auto_25956 ) ) ( not ( = ?auto_25939 ?auto_25982 ) ) ( not ( = ?auto_25939 ?auto_25968 ) ) ( not ( = ?auto_25939 ?auto_25951 ) ) ( not ( = ?auto_25939 ?auto_25965 ) ) ( not ( = ?auto_25939 ?auto_25966 ) ) ( not ( = ?auto_25980 ?auto_25971 ) ) ( not ( = ?auto_25980 ?auto_25954 ) ) ( not ( = ?auto_25980 ?auto_25950 ) ) ( not ( = ?auto_25980 ?auto_25970 ) ) ( not ( = ?auto_25980 ?auto_25979 ) ) ( not ( = ?auto_25980 ?auto_25964 ) ) ( not ( = ?auto_25977 ?auto_25981 ) ) ( not ( = ?auto_25977 ?auto_25974 ) ) ( not ( = ?auto_25977 ?auto_25959 ) ) ( not ( = ?auto_25977 ?auto_25967 ) ) ( not ( = ?auto_25977 ?auto_25953 ) ) ( not ( = ?auto_25977 ?auto_25955 ) ) ( not ( = ?auto_25969 ?auto_25956 ) ) ( not ( = ?auto_25969 ?auto_25982 ) ) ( not ( = ?auto_25969 ?auto_25968 ) ) ( not ( = ?auto_25969 ?auto_25951 ) ) ( not ( = ?auto_25969 ?auto_25965 ) ) ( not ( = ?auto_25969 ?auto_25966 ) ) ( not ( = ?auto_25930 ?auto_25938 ) ) ( not ( = ?auto_25930 ?auto_25958 ) ) ( not ( = ?auto_25931 ?auto_25938 ) ) ( not ( = ?auto_25931 ?auto_25958 ) ) ( not ( = ?auto_25932 ?auto_25938 ) ) ( not ( = ?auto_25932 ?auto_25958 ) ) ( not ( = ?auto_25933 ?auto_25938 ) ) ( not ( = ?auto_25933 ?auto_25958 ) ) ( not ( = ?auto_25934 ?auto_25938 ) ) ( not ( = ?auto_25934 ?auto_25958 ) ) ( not ( = ?auto_25935 ?auto_25938 ) ) ( not ( = ?auto_25935 ?auto_25958 ) ) ( not ( = ?auto_25936 ?auto_25938 ) ) ( not ( = ?auto_25936 ?auto_25958 ) ) ( not ( = ?auto_25938 ?auto_25969 ) ) ( not ( = ?auto_25938 ?auto_25956 ) ) ( not ( = ?auto_25938 ?auto_25982 ) ) ( not ( = ?auto_25938 ?auto_25968 ) ) ( not ( = ?auto_25938 ?auto_25951 ) ) ( not ( = ?auto_25938 ?auto_25965 ) ) ( not ( = ?auto_25938 ?auto_25966 ) ) ( not ( = ?auto_25973 ?auto_25980 ) ) ( not ( = ?auto_25973 ?auto_25971 ) ) ( not ( = ?auto_25973 ?auto_25954 ) ) ( not ( = ?auto_25973 ?auto_25950 ) ) ( not ( = ?auto_25973 ?auto_25970 ) ) ( not ( = ?auto_25973 ?auto_25979 ) ) ( not ( = ?auto_25973 ?auto_25964 ) ) ( not ( = ?auto_25960 ?auto_25977 ) ) ( not ( = ?auto_25960 ?auto_25981 ) ) ( not ( = ?auto_25960 ?auto_25974 ) ) ( not ( = ?auto_25960 ?auto_25959 ) ) ( not ( = ?auto_25960 ?auto_25967 ) ) ( not ( = ?auto_25960 ?auto_25953 ) ) ( not ( = ?auto_25960 ?auto_25955 ) ) ( not ( = ?auto_25958 ?auto_25969 ) ) ( not ( = ?auto_25958 ?auto_25956 ) ) ( not ( = ?auto_25958 ?auto_25982 ) ) ( not ( = ?auto_25958 ?auto_25968 ) ) ( not ( = ?auto_25958 ?auto_25951 ) ) ( not ( = ?auto_25958 ?auto_25965 ) ) ( not ( = ?auto_25958 ?auto_25966 ) ) ( not ( = ?auto_25930 ?auto_25937 ) ) ( not ( = ?auto_25930 ?auto_25961 ) ) ( not ( = ?auto_25931 ?auto_25937 ) ) ( not ( = ?auto_25931 ?auto_25961 ) ) ( not ( = ?auto_25932 ?auto_25937 ) ) ( not ( = ?auto_25932 ?auto_25961 ) ) ( not ( = ?auto_25933 ?auto_25937 ) ) ( not ( = ?auto_25933 ?auto_25961 ) ) ( not ( = ?auto_25934 ?auto_25937 ) ) ( not ( = ?auto_25934 ?auto_25961 ) ) ( not ( = ?auto_25935 ?auto_25937 ) ) ( not ( = ?auto_25935 ?auto_25961 ) ) ( not ( = ?auto_25936 ?auto_25937 ) ) ( not ( = ?auto_25936 ?auto_25961 ) ) ( not ( = ?auto_25939 ?auto_25937 ) ) ( not ( = ?auto_25939 ?auto_25961 ) ) ( not ( = ?auto_25937 ?auto_25958 ) ) ( not ( = ?auto_25937 ?auto_25969 ) ) ( not ( = ?auto_25937 ?auto_25956 ) ) ( not ( = ?auto_25937 ?auto_25982 ) ) ( not ( = ?auto_25937 ?auto_25968 ) ) ( not ( = ?auto_25937 ?auto_25951 ) ) ( not ( = ?auto_25937 ?auto_25965 ) ) ( not ( = ?auto_25937 ?auto_25966 ) ) ( not ( = ?auto_25952 ?auto_25973 ) ) ( not ( = ?auto_25952 ?auto_25980 ) ) ( not ( = ?auto_25952 ?auto_25971 ) ) ( not ( = ?auto_25952 ?auto_25954 ) ) ( not ( = ?auto_25952 ?auto_25950 ) ) ( not ( = ?auto_25952 ?auto_25970 ) ) ( not ( = ?auto_25952 ?auto_25979 ) ) ( not ( = ?auto_25952 ?auto_25964 ) ) ( not ( = ?auto_25963 ?auto_25960 ) ) ( not ( = ?auto_25963 ?auto_25977 ) ) ( not ( = ?auto_25963 ?auto_25981 ) ) ( not ( = ?auto_25963 ?auto_25974 ) ) ( not ( = ?auto_25963 ?auto_25959 ) ) ( not ( = ?auto_25963 ?auto_25967 ) ) ( not ( = ?auto_25963 ?auto_25953 ) ) ( not ( = ?auto_25963 ?auto_25955 ) ) ( not ( = ?auto_25961 ?auto_25958 ) ) ( not ( = ?auto_25961 ?auto_25969 ) ) ( not ( = ?auto_25961 ?auto_25956 ) ) ( not ( = ?auto_25961 ?auto_25982 ) ) ( not ( = ?auto_25961 ?auto_25968 ) ) ( not ( = ?auto_25961 ?auto_25951 ) ) ( not ( = ?auto_25961 ?auto_25965 ) ) ( not ( = ?auto_25961 ?auto_25966 ) ) ( not ( = ?auto_25930 ?auto_25940 ) ) ( not ( = ?auto_25930 ?auto_25976 ) ) ( not ( = ?auto_25931 ?auto_25940 ) ) ( not ( = ?auto_25931 ?auto_25976 ) ) ( not ( = ?auto_25932 ?auto_25940 ) ) ( not ( = ?auto_25932 ?auto_25976 ) ) ( not ( = ?auto_25933 ?auto_25940 ) ) ( not ( = ?auto_25933 ?auto_25976 ) ) ( not ( = ?auto_25934 ?auto_25940 ) ) ( not ( = ?auto_25934 ?auto_25976 ) ) ( not ( = ?auto_25935 ?auto_25940 ) ) ( not ( = ?auto_25935 ?auto_25976 ) ) ( not ( = ?auto_25936 ?auto_25940 ) ) ( not ( = ?auto_25936 ?auto_25976 ) ) ( not ( = ?auto_25939 ?auto_25940 ) ) ( not ( = ?auto_25939 ?auto_25976 ) ) ( not ( = ?auto_25938 ?auto_25940 ) ) ( not ( = ?auto_25938 ?auto_25976 ) ) ( not ( = ?auto_25940 ?auto_25961 ) ) ( not ( = ?auto_25940 ?auto_25958 ) ) ( not ( = ?auto_25940 ?auto_25969 ) ) ( not ( = ?auto_25940 ?auto_25956 ) ) ( not ( = ?auto_25940 ?auto_25982 ) ) ( not ( = ?auto_25940 ?auto_25968 ) ) ( not ( = ?auto_25940 ?auto_25951 ) ) ( not ( = ?auto_25940 ?auto_25965 ) ) ( not ( = ?auto_25940 ?auto_25966 ) ) ( not ( = ?auto_25972 ?auto_25952 ) ) ( not ( = ?auto_25972 ?auto_25973 ) ) ( not ( = ?auto_25972 ?auto_25980 ) ) ( not ( = ?auto_25972 ?auto_25971 ) ) ( not ( = ?auto_25972 ?auto_25954 ) ) ( not ( = ?auto_25972 ?auto_25950 ) ) ( not ( = ?auto_25972 ?auto_25970 ) ) ( not ( = ?auto_25972 ?auto_25979 ) ) ( not ( = ?auto_25972 ?auto_25964 ) ) ( not ( = ?auto_25978 ?auto_25963 ) ) ( not ( = ?auto_25978 ?auto_25960 ) ) ( not ( = ?auto_25978 ?auto_25977 ) ) ( not ( = ?auto_25978 ?auto_25981 ) ) ( not ( = ?auto_25978 ?auto_25974 ) ) ( not ( = ?auto_25978 ?auto_25959 ) ) ( not ( = ?auto_25978 ?auto_25967 ) ) ( not ( = ?auto_25978 ?auto_25953 ) ) ( not ( = ?auto_25978 ?auto_25955 ) ) ( not ( = ?auto_25976 ?auto_25961 ) ) ( not ( = ?auto_25976 ?auto_25958 ) ) ( not ( = ?auto_25976 ?auto_25969 ) ) ( not ( = ?auto_25976 ?auto_25956 ) ) ( not ( = ?auto_25976 ?auto_25982 ) ) ( not ( = ?auto_25976 ?auto_25968 ) ) ( not ( = ?auto_25976 ?auto_25951 ) ) ( not ( = ?auto_25976 ?auto_25965 ) ) ( not ( = ?auto_25976 ?auto_25966 ) ) ( not ( = ?auto_25930 ?auto_25941 ) ) ( not ( = ?auto_25930 ?auto_25957 ) ) ( not ( = ?auto_25931 ?auto_25941 ) ) ( not ( = ?auto_25931 ?auto_25957 ) ) ( not ( = ?auto_25932 ?auto_25941 ) ) ( not ( = ?auto_25932 ?auto_25957 ) ) ( not ( = ?auto_25933 ?auto_25941 ) ) ( not ( = ?auto_25933 ?auto_25957 ) ) ( not ( = ?auto_25934 ?auto_25941 ) ) ( not ( = ?auto_25934 ?auto_25957 ) ) ( not ( = ?auto_25935 ?auto_25941 ) ) ( not ( = ?auto_25935 ?auto_25957 ) ) ( not ( = ?auto_25936 ?auto_25941 ) ) ( not ( = ?auto_25936 ?auto_25957 ) ) ( not ( = ?auto_25939 ?auto_25941 ) ) ( not ( = ?auto_25939 ?auto_25957 ) ) ( not ( = ?auto_25938 ?auto_25941 ) ) ( not ( = ?auto_25938 ?auto_25957 ) ) ( not ( = ?auto_25937 ?auto_25941 ) ) ( not ( = ?auto_25937 ?auto_25957 ) ) ( not ( = ?auto_25941 ?auto_25976 ) ) ( not ( = ?auto_25941 ?auto_25961 ) ) ( not ( = ?auto_25941 ?auto_25958 ) ) ( not ( = ?auto_25941 ?auto_25969 ) ) ( not ( = ?auto_25941 ?auto_25956 ) ) ( not ( = ?auto_25941 ?auto_25982 ) ) ( not ( = ?auto_25941 ?auto_25968 ) ) ( not ( = ?auto_25941 ?auto_25951 ) ) ( not ( = ?auto_25941 ?auto_25965 ) ) ( not ( = ?auto_25941 ?auto_25966 ) ) ( not ( = ?auto_25957 ?auto_25976 ) ) ( not ( = ?auto_25957 ?auto_25961 ) ) ( not ( = ?auto_25957 ?auto_25958 ) ) ( not ( = ?auto_25957 ?auto_25969 ) ) ( not ( = ?auto_25957 ?auto_25956 ) ) ( not ( = ?auto_25957 ?auto_25982 ) ) ( not ( = ?auto_25957 ?auto_25968 ) ) ( not ( = ?auto_25957 ?auto_25951 ) ) ( not ( = ?auto_25957 ?auto_25965 ) ) ( not ( = ?auto_25957 ?auto_25966 ) ) ( not ( = ?auto_25930 ?auto_25942 ) ) ( not ( = ?auto_25930 ?auto_25975 ) ) ( not ( = ?auto_25931 ?auto_25942 ) ) ( not ( = ?auto_25931 ?auto_25975 ) ) ( not ( = ?auto_25932 ?auto_25942 ) ) ( not ( = ?auto_25932 ?auto_25975 ) ) ( not ( = ?auto_25933 ?auto_25942 ) ) ( not ( = ?auto_25933 ?auto_25975 ) ) ( not ( = ?auto_25934 ?auto_25942 ) ) ( not ( = ?auto_25934 ?auto_25975 ) ) ( not ( = ?auto_25935 ?auto_25942 ) ) ( not ( = ?auto_25935 ?auto_25975 ) ) ( not ( = ?auto_25936 ?auto_25942 ) ) ( not ( = ?auto_25936 ?auto_25975 ) ) ( not ( = ?auto_25939 ?auto_25942 ) ) ( not ( = ?auto_25939 ?auto_25975 ) ) ( not ( = ?auto_25938 ?auto_25942 ) ) ( not ( = ?auto_25938 ?auto_25975 ) ) ( not ( = ?auto_25937 ?auto_25942 ) ) ( not ( = ?auto_25937 ?auto_25975 ) ) ( not ( = ?auto_25940 ?auto_25942 ) ) ( not ( = ?auto_25940 ?auto_25975 ) ) ( not ( = ?auto_25942 ?auto_25957 ) ) ( not ( = ?auto_25942 ?auto_25976 ) ) ( not ( = ?auto_25942 ?auto_25961 ) ) ( not ( = ?auto_25942 ?auto_25958 ) ) ( not ( = ?auto_25942 ?auto_25969 ) ) ( not ( = ?auto_25942 ?auto_25956 ) ) ( not ( = ?auto_25942 ?auto_25982 ) ) ( not ( = ?auto_25942 ?auto_25968 ) ) ( not ( = ?auto_25942 ?auto_25951 ) ) ( not ( = ?auto_25942 ?auto_25965 ) ) ( not ( = ?auto_25942 ?auto_25966 ) ) ( not ( = ?auto_25983 ?auto_25972 ) ) ( not ( = ?auto_25983 ?auto_25952 ) ) ( not ( = ?auto_25983 ?auto_25973 ) ) ( not ( = ?auto_25983 ?auto_25980 ) ) ( not ( = ?auto_25983 ?auto_25971 ) ) ( not ( = ?auto_25983 ?auto_25954 ) ) ( not ( = ?auto_25983 ?auto_25950 ) ) ( not ( = ?auto_25983 ?auto_25970 ) ) ( not ( = ?auto_25983 ?auto_25979 ) ) ( not ( = ?auto_25983 ?auto_25964 ) ) ( not ( = ?auto_25962 ?auto_25978 ) ) ( not ( = ?auto_25962 ?auto_25963 ) ) ( not ( = ?auto_25962 ?auto_25960 ) ) ( not ( = ?auto_25962 ?auto_25977 ) ) ( not ( = ?auto_25962 ?auto_25981 ) ) ( not ( = ?auto_25962 ?auto_25974 ) ) ( not ( = ?auto_25962 ?auto_25959 ) ) ( not ( = ?auto_25962 ?auto_25967 ) ) ( not ( = ?auto_25962 ?auto_25953 ) ) ( not ( = ?auto_25962 ?auto_25955 ) ) ( not ( = ?auto_25975 ?auto_25957 ) ) ( not ( = ?auto_25975 ?auto_25976 ) ) ( not ( = ?auto_25975 ?auto_25961 ) ) ( not ( = ?auto_25975 ?auto_25958 ) ) ( not ( = ?auto_25975 ?auto_25969 ) ) ( not ( = ?auto_25975 ?auto_25956 ) ) ( not ( = ?auto_25975 ?auto_25982 ) ) ( not ( = ?auto_25975 ?auto_25968 ) ) ( not ( = ?auto_25975 ?auto_25951 ) ) ( not ( = ?auto_25975 ?auto_25965 ) ) ( not ( = ?auto_25975 ?auto_25966 ) ) ( not ( = ?auto_25930 ?auto_25943 ) ) ( not ( = ?auto_25930 ?auto_25946 ) ) ( not ( = ?auto_25931 ?auto_25943 ) ) ( not ( = ?auto_25931 ?auto_25946 ) ) ( not ( = ?auto_25932 ?auto_25943 ) ) ( not ( = ?auto_25932 ?auto_25946 ) ) ( not ( = ?auto_25933 ?auto_25943 ) ) ( not ( = ?auto_25933 ?auto_25946 ) ) ( not ( = ?auto_25934 ?auto_25943 ) ) ( not ( = ?auto_25934 ?auto_25946 ) ) ( not ( = ?auto_25935 ?auto_25943 ) ) ( not ( = ?auto_25935 ?auto_25946 ) ) ( not ( = ?auto_25936 ?auto_25943 ) ) ( not ( = ?auto_25936 ?auto_25946 ) ) ( not ( = ?auto_25939 ?auto_25943 ) ) ( not ( = ?auto_25939 ?auto_25946 ) ) ( not ( = ?auto_25938 ?auto_25943 ) ) ( not ( = ?auto_25938 ?auto_25946 ) ) ( not ( = ?auto_25937 ?auto_25943 ) ) ( not ( = ?auto_25937 ?auto_25946 ) ) ( not ( = ?auto_25940 ?auto_25943 ) ) ( not ( = ?auto_25940 ?auto_25946 ) ) ( not ( = ?auto_25941 ?auto_25943 ) ) ( not ( = ?auto_25941 ?auto_25946 ) ) ( not ( = ?auto_25943 ?auto_25975 ) ) ( not ( = ?auto_25943 ?auto_25957 ) ) ( not ( = ?auto_25943 ?auto_25976 ) ) ( not ( = ?auto_25943 ?auto_25961 ) ) ( not ( = ?auto_25943 ?auto_25958 ) ) ( not ( = ?auto_25943 ?auto_25969 ) ) ( not ( = ?auto_25943 ?auto_25956 ) ) ( not ( = ?auto_25943 ?auto_25982 ) ) ( not ( = ?auto_25943 ?auto_25968 ) ) ( not ( = ?auto_25943 ?auto_25951 ) ) ( not ( = ?auto_25943 ?auto_25965 ) ) ( not ( = ?auto_25943 ?auto_25966 ) ) ( not ( = ?auto_25948 ?auto_25983 ) ) ( not ( = ?auto_25948 ?auto_25972 ) ) ( not ( = ?auto_25948 ?auto_25952 ) ) ( not ( = ?auto_25948 ?auto_25973 ) ) ( not ( = ?auto_25948 ?auto_25980 ) ) ( not ( = ?auto_25948 ?auto_25971 ) ) ( not ( = ?auto_25948 ?auto_25954 ) ) ( not ( = ?auto_25948 ?auto_25950 ) ) ( not ( = ?auto_25948 ?auto_25970 ) ) ( not ( = ?auto_25948 ?auto_25979 ) ) ( not ( = ?auto_25948 ?auto_25964 ) ) ( not ( = ?auto_25949 ?auto_25962 ) ) ( not ( = ?auto_25949 ?auto_25978 ) ) ( not ( = ?auto_25949 ?auto_25963 ) ) ( not ( = ?auto_25949 ?auto_25960 ) ) ( not ( = ?auto_25949 ?auto_25977 ) ) ( not ( = ?auto_25949 ?auto_25981 ) ) ( not ( = ?auto_25949 ?auto_25974 ) ) ( not ( = ?auto_25949 ?auto_25959 ) ) ( not ( = ?auto_25949 ?auto_25967 ) ) ( not ( = ?auto_25949 ?auto_25953 ) ) ( not ( = ?auto_25949 ?auto_25955 ) ) ( not ( = ?auto_25946 ?auto_25975 ) ) ( not ( = ?auto_25946 ?auto_25957 ) ) ( not ( = ?auto_25946 ?auto_25976 ) ) ( not ( = ?auto_25946 ?auto_25961 ) ) ( not ( = ?auto_25946 ?auto_25958 ) ) ( not ( = ?auto_25946 ?auto_25969 ) ) ( not ( = ?auto_25946 ?auto_25956 ) ) ( not ( = ?auto_25946 ?auto_25982 ) ) ( not ( = ?auto_25946 ?auto_25968 ) ) ( not ( = ?auto_25946 ?auto_25951 ) ) ( not ( = ?auto_25946 ?auto_25965 ) ) ( not ( = ?auto_25946 ?auto_25966 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_25930 ?auto_25931 ?auto_25932 ?auto_25933 ?auto_25934 ?auto_25935 ?auto_25936 ?auto_25939 ?auto_25938 ?auto_25937 ?auto_25940 ?auto_25941 ?auto_25942 )
      ( MAKE-1CRATE ?auto_25942 ?auto_25943 )
      ( MAKE-13CRATE-VERIFY ?auto_25930 ?auto_25931 ?auto_25932 ?auto_25933 ?auto_25934 ?auto_25935 ?auto_25936 ?auto_25939 ?auto_25938 ?auto_25937 ?auto_25940 ?auto_25941 ?auto_25942 ?auto_25943 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25986 - SURFACE
      ?auto_25987 - SURFACE
    )
    :vars
    (
      ?auto_25988 - HOIST
      ?auto_25989 - PLACE
      ?auto_25991 - PLACE
      ?auto_25992 - HOIST
      ?auto_25993 - SURFACE
      ?auto_25990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25988 ?auto_25989 ) ( SURFACE-AT ?auto_25986 ?auto_25989 ) ( CLEAR ?auto_25986 ) ( IS-CRATE ?auto_25987 ) ( AVAILABLE ?auto_25988 ) ( not ( = ?auto_25991 ?auto_25989 ) ) ( HOIST-AT ?auto_25992 ?auto_25991 ) ( AVAILABLE ?auto_25992 ) ( SURFACE-AT ?auto_25987 ?auto_25991 ) ( ON ?auto_25987 ?auto_25993 ) ( CLEAR ?auto_25987 ) ( TRUCK-AT ?auto_25990 ?auto_25989 ) ( not ( = ?auto_25986 ?auto_25987 ) ) ( not ( = ?auto_25986 ?auto_25993 ) ) ( not ( = ?auto_25987 ?auto_25993 ) ) ( not ( = ?auto_25988 ?auto_25992 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25990 ?auto_25989 ?auto_25991 )
      ( !LIFT ?auto_25992 ?auto_25987 ?auto_25993 ?auto_25991 )
      ( !LOAD ?auto_25992 ?auto_25987 ?auto_25990 ?auto_25991 )
      ( !DRIVE ?auto_25990 ?auto_25991 ?auto_25989 )
      ( !UNLOAD ?auto_25988 ?auto_25987 ?auto_25990 ?auto_25989 )
      ( !DROP ?auto_25988 ?auto_25987 ?auto_25986 ?auto_25989 )
      ( MAKE-1CRATE-VERIFY ?auto_25986 ?auto_25987 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_26009 - SURFACE
      ?auto_26010 - SURFACE
      ?auto_26011 - SURFACE
      ?auto_26012 - SURFACE
      ?auto_26013 - SURFACE
      ?auto_26014 - SURFACE
      ?auto_26015 - SURFACE
      ?auto_26018 - SURFACE
      ?auto_26017 - SURFACE
      ?auto_26016 - SURFACE
      ?auto_26019 - SURFACE
      ?auto_26020 - SURFACE
      ?auto_26021 - SURFACE
      ?auto_26022 - SURFACE
      ?auto_26023 - SURFACE
    )
    :vars
    (
      ?auto_26028 - HOIST
      ?auto_26024 - PLACE
      ?auto_26029 - PLACE
      ?auto_26027 - HOIST
      ?auto_26026 - SURFACE
      ?auto_26063 - PLACE
      ?auto_26030 - HOIST
      ?auto_26041 - SURFACE
      ?auto_26049 - PLACE
      ?auto_26056 - HOIST
      ?auto_26050 - SURFACE
      ?auto_26062 - PLACE
      ?auto_26043 - HOIST
      ?auto_26045 - SURFACE
      ?auto_26039 - SURFACE
      ?auto_26038 - PLACE
      ?auto_26061 - HOIST
      ?auto_26035 - SURFACE
      ?auto_26034 - PLACE
      ?auto_26036 - HOIST
      ?auto_26046 - SURFACE
      ?auto_26040 - PLACE
      ?auto_26060 - HOIST
      ?auto_26031 - SURFACE
      ?auto_26058 - PLACE
      ?auto_26053 - HOIST
      ?auto_26057 - SURFACE
      ?auto_26054 - PLACE
      ?auto_26048 - HOIST
      ?auto_26042 - SURFACE
      ?auto_26065 - PLACE
      ?auto_26033 - HOIST
      ?auto_26066 - SURFACE
      ?auto_26032 - PLACE
      ?auto_26064 - HOIST
      ?auto_26052 - SURFACE
      ?auto_26037 - PLACE
      ?auto_26044 - HOIST
      ?auto_26055 - SURFACE
      ?auto_26051 - PLACE
      ?auto_26047 - HOIST
      ?auto_26059 - SURFACE
      ?auto_26025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26028 ?auto_26024 ) ( IS-CRATE ?auto_26023 ) ( not ( = ?auto_26029 ?auto_26024 ) ) ( HOIST-AT ?auto_26027 ?auto_26029 ) ( AVAILABLE ?auto_26027 ) ( SURFACE-AT ?auto_26023 ?auto_26029 ) ( ON ?auto_26023 ?auto_26026 ) ( CLEAR ?auto_26023 ) ( not ( = ?auto_26022 ?auto_26023 ) ) ( not ( = ?auto_26022 ?auto_26026 ) ) ( not ( = ?auto_26023 ?auto_26026 ) ) ( not ( = ?auto_26028 ?auto_26027 ) ) ( IS-CRATE ?auto_26022 ) ( not ( = ?auto_26063 ?auto_26024 ) ) ( HOIST-AT ?auto_26030 ?auto_26063 ) ( AVAILABLE ?auto_26030 ) ( SURFACE-AT ?auto_26022 ?auto_26063 ) ( ON ?auto_26022 ?auto_26041 ) ( CLEAR ?auto_26022 ) ( not ( = ?auto_26021 ?auto_26022 ) ) ( not ( = ?auto_26021 ?auto_26041 ) ) ( not ( = ?auto_26022 ?auto_26041 ) ) ( not ( = ?auto_26028 ?auto_26030 ) ) ( IS-CRATE ?auto_26021 ) ( not ( = ?auto_26049 ?auto_26024 ) ) ( HOIST-AT ?auto_26056 ?auto_26049 ) ( AVAILABLE ?auto_26056 ) ( SURFACE-AT ?auto_26021 ?auto_26049 ) ( ON ?auto_26021 ?auto_26050 ) ( CLEAR ?auto_26021 ) ( not ( = ?auto_26020 ?auto_26021 ) ) ( not ( = ?auto_26020 ?auto_26050 ) ) ( not ( = ?auto_26021 ?auto_26050 ) ) ( not ( = ?auto_26028 ?auto_26056 ) ) ( IS-CRATE ?auto_26020 ) ( not ( = ?auto_26062 ?auto_26024 ) ) ( HOIST-AT ?auto_26043 ?auto_26062 ) ( SURFACE-AT ?auto_26020 ?auto_26062 ) ( ON ?auto_26020 ?auto_26045 ) ( CLEAR ?auto_26020 ) ( not ( = ?auto_26019 ?auto_26020 ) ) ( not ( = ?auto_26019 ?auto_26045 ) ) ( not ( = ?auto_26020 ?auto_26045 ) ) ( not ( = ?auto_26028 ?auto_26043 ) ) ( IS-CRATE ?auto_26019 ) ( AVAILABLE ?auto_26043 ) ( SURFACE-AT ?auto_26019 ?auto_26062 ) ( ON ?auto_26019 ?auto_26039 ) ( CLEAR ?auto_26019 ) ( not ( = ?auto_26016 ?auto_26019 ) ) ( not ( = ?auto_26016 ?auto_26039 ) ) ( not ( = ?auto_26019 ?auto_26039 ) ) ( IS-CRATE ?auto_26016 ) ( not ( = ?auto_26038 ?auto_26024 ) ) ( HOIST-AT ?auto_26061 ?auto_26038 ) ( AVAILABLE ?auto_26061 ) ( SURFACE-AT ?auto_26016 ?auto_26038 ) ( ON ?auto_26016 ?auto_26035 ) ( CLEAR ?auto_26016 ) ( not ( = ?auto_26017 ?auto_26016 ) ) ( not ( = ?auto_26017 ?auto_26035 ) ) ( not ( = ?auto_26016 ?auto_26035 ) ) ( not ( = ?auto_26028 ?auto_26061 ) ) ( IS-CRATE ?auto_26017 ) ( not ( = ?auto_26034 ?auto_26024 ) ) ( HOIST-AT ?auto_26036 ?auto_26034 ) ( AVAILABLE ?auto_26036 ) ( SURFACE-AT ?auto_26017 ?auto_26034 ) ( ON ?auto_26017 ?auto_26046 ) ( CLEAR ?auto_26017 ) ( not ( = ?auto_26018 ?auto_26017 ) ) ( not ( = ?auto_26018 ?auto_26046 ) ) ( not ( = ?auto_26017 ?auto_26046 ) ) ( not ( = ?auto_26028 ?auto_26036 ) ) ( IS-CRATE ?auto_26018 ) ( not ( = ?auto_26040 ?auto_26024 ) ) ( HOIST-AT ?auto_26060 ?auto_26040 ) ( AVAILABLE ?auto_26060 ) ( SURFACE-AT ?auto_26018 ?auto_26040 ) ( ON ?auto_26018 ?auto_26031 ) ( CLEAR ?auto_26018 ) ( not ( = ?auto_26015 ?auto_26018 ) ) ( not ( = ?auto_26015 ?auto_26031 ) ) ( not ( = ?auto_26018 ?auto_26031 ) ) ( not ( = ?auto_26028 ?auto_26060 ) ) ( IS-CRATE ?auto_26015 ) ( not ( = ?auto_26058 ?auto_26024 ) ) ( HOIST-AT ?auto_26053 ?auto_26058 ) ( AVAILABLE ?auto_26053 ) ( SURFACE-AT ?auto_26015 ?auto_26058 ) ( ON ?auto_26015 ?auto_26057 ) ( CLEAR ?auto_26015 ) ( not ( = ?auto_26014 ?auto_26015 ) ) ( not ( = ?auto_26014 ?auto_26057 ) ) ( not ( = ?auto_26015 ?auto_26057 ) ) ( not ( = ?auto_26028 ?auto_26053 ) ) ( IS-CRATE ?auto_26014 ) ( not ( = ?auto_26054 ?auto_26024 ) ) ( HOIST-AT ?auto_26048 ?auto_26054 ) ( AVAILABLE ?auto_26048 ) ( SURFACE-AT ?auto_26014 ?auto_26054 ) ( ON ?auto_26014 ?auto_26042 ) ( CLEAR ?auto_26014 ) ( not ( = ?auto_26013 ?auto_26014 ) ) ( not ( = ?auto_26013 ?auto_26042 ) ) ( not ( = ?auto_26014 ?auto_26042 ) ) ( not ( = ?auto_26028 ?auto_26048 ) ) ( IS-CRATE ?auto_26013 ) ( not ( = ?auto_26065 ?auto_26024 ) ) ( HOIST-AT ?auto_26033 ?auto_26065 ) ( AVAILABLE ?auto_26033 ) ( SURFACE-AT ?auto_26013 ?auto_26065 ) ( ON ?auto_26013 ?auto_26066 ) ( CLEAR ?auto_26013 ) ( not ( = ?auto_26012 ?auto_26013 ) ) ( not ( = ?auto_26012 ?auto_26066 ) ) ( not ( = ?auto_26013 ?auto_26066 ) ) ( not ( = ?auto_26028 ?auto_26033 ) ) ( IS-CRATE ?auto_26012 ) ( not ( = ?auto_26032 ?auto_26024 ) ) ( HOIST-AT ?auto_26064 ?auto_26032 ) ( AVAILABLE ?auto_26064 ) ( SURFACE-AT ?auto_26012 ?auto_26032 ) ( ON ?auto_26012 ?auto_26052 ) ( CLEAR ?auto_26012 ) ( not ( = ?auto_26011 ?auto_26012 ) ) ( not ( = ?auto_26011 ?auto_26052 ) ) ( not ( = ?auto_26012 ?auto_26052 ) ) ( not ( = ?auto_26028 ?auto_26064 ) ) ( IS-CRATE ?auto_26011 ) ( not ( = ?auto_26037 ?auto_26024 ) ) ( HOIST-AT ?auto_26044 ?auto_26037 ) ( AVAILABLE ?auto_26044 ) ( SURFACE-AT ?auto_26011 ?auto_26037 ) ( ON ?auto_26011 ?auto_26055 ) ( CLEAR ?auto_26011 ) ( not ( = ?auto_26010 ?auto_26011 ) ) ( not ( = ?auto_26010 ?auto_26055 ) ) ( not ( = ?auto_26011 ?auto_26055 ) ) ( not ( = ?auto_26028 ?auto_26044 ) ) ( SURFACE-AT ?auto_26009 ?auto_26024 ) ( CLEAR ?auto_26009 ) ( IS-CRATE ?auto_26010 ) ( AVAILABLE ?auto_26028 ) ( not ( = ?auto_26051 ?auto_26024 ) ) ( HOIST-AT ?auto_26047 ?auto_26051 ) ( AVAILABLE ?auto_26047 ) ( SURFACE-AT ?auto_26010 ?auto_26051 ) ( ON ?auto_26010 ?auto_26059 ) ( CLEAR ?auto_26010 ) ( TRUCK-AT ?auto_26025 ?auto_26024 ) ( not ( = ?auto_26009 ?auto_26010 ) ) ( not ( = ?auto_26009 ?auto_26059 ) ) ( not ( = ?auto_26010 ?auto_26059 ) ) ( not ( = ?auto_26028 ?auto_26047 ) ) ( not ( = ?auto_26009 ?auto_26011 ) ) ( not ( = ?auto_26009 ?auto_26055 ) ) ( not ( = ?auto_26011 ?auto_26059 ) ) ( not ( = ?auto_26037 ?auto_26051 ) ) ( not ( = ?auto_26044 ?auto_26047 ) ) ( not ( = ?auto_26055 ?auto_26059 ) ) ( not ( = ?auto_26009 ?auto_26012 ) ) ( not ( = ?auto_26009 ?auto_26052 ) ) ( not ( = ?auto_26010 ?auto_26012 ) ) ( not ( = ?auto_26010 ?auto_26052 ) ) ( not ( = ?auto_26012 ?auto_26055 ) ) ( not ( = ?auto_26012 ?auto_26059 ) ) ( not ( = ?auto_26032 ?auto_26037 ) ) ( not ( = ?auto_26032 ?auto_26051 ) ) ( not ( = ?auto_26064 ?auto_26044 ) ) ( not ( = ?auto_26064 ?auto_26047 ) ) ( not ( = ?auto_26052 ?auto_26055 ) ) ( not ( = ?auto_26052 ?auto_26059 ) ) ( not ( = ?auto_26009 ?auto_26013 ) ) ( not ( = ?auto_26009 ?auto_26066 ) ) ( not ( = ?auto_26010 ?auto_26013 ) ) ( not ( = ?auto_26010 ?auto_26066 ) ) ( not ( = ?auto_26011 ?auto_26013 ) ) ( not ( = ?auto_26011 ?auto_26066 ) ) ( not ( = ?auto_26013 ?auto_26052 ) ) ( not ( = ?auto_26013 ?auto_26055 ) ) ( not ( = ?auto_26013 ?auto_26059 ) ) ( not ( = ?auto_26065 ?auto_26032 ) ) ( not ( = ?auto_26065 ?auto_26037 ) ) ( not ( = ?auto_26065 ?auto_26051 ) ) ( not ( = ?auto_26033 ?auto_26064 ) ) ( not ( = ?auto_26033 ?auto_26044 ) ) ( not ( = ?auto_26033 ?auto_26047 ) ) ( not ( = ?auto_26066 ?auto_26052 ) ) ( not ( = ?auto_26066 ?auto_26055 ) ) ( not ( = ?auto_26066 ?auto_26059 ) ) ( not ( = ?auto_26009 ?auto_26014 ) ) ( not ( = ?auto_26009 ?auto_26042 ) ) ( not ( = ?auto_26010 ?auto_26014 ) ) ( not ( = ?auto_26010 ?auto_26042 ) ) ( not ( = ?auto_26011 ?auto_26014 ) ) ( not ( = ?auto_26011 ?auto_26042 ) ) ( not ( = ?auto_26012 ?auto_26014 ) ) ( not ( = ?auto_26012 ?auto_26042 ) ) ( not ( = ?auto_26014 ?auto_26066 ) ) ( not ( = ?auto_26014 ?auto_26052 ) ) ( not ( = ?auto_26014 ?auto_26055 ) ) ( not ( = ?auto_26014 ?auto_26059 ) ) ( not ( = ?auto_26054 ?auto_26065 ) ) ( not ( = ?auto_26054 ?auto_26032 ) ) ( not ( = ?auto_26054 ?auto_26037 ) ) ( not ( = ?auto_26054 ?auto_26051 ) ) ( not ( = ?auto_26048 ?auto_26033 ) ) ( not ( = ?auto_26048 ?auto_26064 ) ) ( not ( = ?auto_26048 ?auto_26044 ) ) ( not ( = ?auto_26048 ?auto_26047 ) ) ( not ( = ?auto_26042 ?auto_26066 ) ) ( not ( = ?auto_26042 ?auto_26052 ) ) ( not ( = ?auto_26042 ?auto_26055 ) ) ( not ( = ?auto_26042 ?auto_26059 ) ) ( not ( = ?auto_26009 ?auto_26015 ) ) ( not ( = ?auto_26009 ?auto_26057 ) ) ( not ( = ?auto_26010 ?auto_26015 ) ) ( not ( = ?auto_26010 ?auto_26057 ) ) ( not ( = ?auto_26011 ?auto_26015 ) ) ( not ( = ?auto_26011 ?auto_26057 ) ) ( not ( = ?auto_26012 ?auto_26015 ) ) ( not ( = ?auto_26012 ?auto_26057 ) ) ( not ( = ?auto_26013 ?auto_26015 ) ) ( not ( = ?auto_26013 ?auto_26057 ) ) ( not ( = ?auto_26015 ?auto_26042 ) ) ( not ( = ?auto_26015 ?auto_26066 ) ) ( not ( = ?auto_26015 ?auto_26052 ) ) ( not ( = ?auto_26015 ?auto_26055 ) ) ( not ( = ?auto_26015 ?auto_26059 ) ) ( not ( = ?auto_26058 ?auto_26054 ) ) ( not ( = ?auto_26058 ?auto_26065 ) ) ( not ( = ?auto_26058 ?auto_26032 ) ) ( not ( = ?auto_26058 ?auto_26037 ) ) ( not ( = ?auto_26058 ?auto_26051 ) ) ( not ( = ?auto_26053 ?auto_26048 ) ) ( not ( = ?auto_26053 ?auto_26033 ) ) ( not ( = ?auto_26053 ?auto_26064 ) ) ( not ( = ?auto_26053 ?auto_26044 ) ) ( not ( = ?auto_26053 ?auto_26047 ) ) ( not ( = ?auto_26057 ?auto_26042 ) ) ( not ( = ?auto_26057 ?auto_26066 ) ) ( not ( = ?auto_26057 ?auto_26052 ) ) ( not ( = ?auto_26057 ?auto_26055 ) ) ( not ( = ?auto_26057 ?auto_26059 ) ) ( not ( = ?auto_26009 ?auto_26018 ) ) ( not ( = ?auto_26009 ?auto_26031 ) ) ( not ( = ?auto_26010 ?auto_26018 ) ) ( not ( = ?auto_26010 ?auto_26031 ) ) ( not ( = ?auto_26011 ?auto_26018 ) ) ( not ( = ?auto_26011 ?auto_26031 ) ) ( not ( = ?auto_26012 ?auto_26018 ) ) ( not ( = ?auto_26012 ?auto_26031 ) ) ( not ( = ?auto_26013 ?auto_26018 ) ) ( not ( = ?auto_26013 ?auto_26031 ) ) ( not ( = ?auto_26014 ?auto_26018 ) ) ( not ( = ?auto_26014 ?auto_26031 ) ) ( not ( = ?auto_26018 ?auto_26057 ) ) ( not ( = ?auto_26018 ?auto_26042 ) ) ( not ( = ?auto_26018 ?auto_26066 ) ) ( not ( = ?auto_26018 ?auto_26052 ) ) ( not ( = ?auto_26018 ?auto_26055 ) ) ( not ( = ?auto_26018 ?auto_26059 ) ) ( not ( = ?auto_26040 ?auto_26058 ) ) ( not ( = ?auto_26040 ?auto_26054 ) ) ( not ( = ?auto_26040 ?auto_26065 ) ) ( not ( = ?auto_26040 ?auto_26032 ) ) ( not ( = ?auto_26040 ?auto_26037 ) ) ( not ( = ?auto_26040 ?auto_26051 ) ) ( not ( = ?auto_26060 ?auto_26053 ) ) ( not ( = ?auto_26060 ?auto_26048 ) ) ( not ( = ?auto_26060 ?auto_26033 ) ) ( not ( = ?auto_26060 ?auto_26064 ) ) ( not ( = ?auto_26060 ?auto_26044 ) ) ( not ( = ?auto_26060 ?auto_26047 ) ) ( not ( = ?auto_26031 ?auto_26057 ) ) ( not ( = ?auto_26031 ?auto_26042 ) ) ( not ( = ?auto_26031 ?auto_26066 ) ) ( not ( = ?auto_26031 ?auto_26052 ) ) ( not ( = ?auto_26031 ?auto_26055 ) ) ( not ( = ?auto_26031 ?auto_26059 ) ) ( not ( = ?auto_26009 ?auto_26017 ) ) ( not ( = ?auto_26009 ?auto_26046 ) ) ( not ( = ?auto_26010 ?auto_26017 ) ) ( not ( = ?auto_26010 ?auto_26046 ) ) ( not ( = ?auto_26011 ?auto_26017 ) ) ( not ( = ?auto_26011 ?auto_26046 ) ) ( not ( = ?auto_26012 ?auto_26017 ) ) ( not ( = ?auto_26012 ?auto_26046 ) ) ( not ( = ?auto_26013 ?auto_26017 ) ) ( not ( = ?auto_26013 ?auto_26046 ) ) ( not ( = ?auto_26014 ?auto_26017 ) ) ( not ( = ?auto_26014 ?auto_26046 ) ) ( not ( = ?auto_26015 ?auto_26017 ) ) ( not ( = ?auto_26015 ?auto_26046 ) ) ( not ( = ?auto_26017 ?auto_26031 ) ) ( not ( = ?auto_26017 ?auto_26057 ) ) ( not ( = ?auto_26017 ?auto_26042 ) ) ( not ( = ?auto_26017 ?auto_26066 ) ) ( not ( = ?auto_26017 ?auto_26052 ) ) ( not ( = ?auto_26017 ?auto_26055 ) ) ( not ( = ?auto_26017 ?auto_26059 ) ) ( not ( = ?auto_26034 ?auto_26040 ) ) ( not ( = ?auto_26034 ?auto_26058 ) ) ( not ( = ?auto_26034 ?auto_26054 ) ) ( not ( = ?auto_26034 ?auto_26065 ) ) ( not ( = ?auto_26034 ?auto_26032 ) ) ( not ( = ?auto_26034 ?auto_26037 ) ) ( not ( = ?auto_26034 ?auto_26051 ) ) ( not ( = ?auto_26036 ?auto_26060 ) ) ( not ( = ?auto_26036 ?auto_26053 ) ) ( not ( = ?auto_26036 ?auto_26048 ) ) ( not ( = ?auto_26036 ?auto_26033 ) ) ( not ( = ?auto_26036 ?auto_26064 ) ) ( not ( = ?auto_26036 ?auto_26044 ) ) ( not ( = ?auto_26036 ?auto_26047 ) ) ( not ( = ?auto_26046 ?auto_26031 ) ) ( not ( = ?auto_26046 ?auto_26057 ) ) ( not ( = ?auto_26046 ?auto_26042 ) ) ( not ( = ?auto_26046 ?auto_26066 ) ) ( not ( = ?auto_26046 ?auto_26052 ) ) ( not ( = ?auto_26046 ?auto_26055 ) ) ( not ( = ?auto_26046 ?auto_26059 ) ) ( not ( = ?auto_26009 ?auto_26016 ) ) ( not ( = ?auto_26009 ?auto_26035 ) ) ( not ( = ?auto_26010 ?auto_26016 ) ) ( not ( = ?auto_26010 ?auto_26035 ) ) ( not ( = ?auto_26011 ?auto_26016 ) ) ( not ( = ?auto_26011 ?auto_26035 ) ) ( not ( = ?auto_26012 ?auto_26016 ) ) ( not ( = ?auto_26012 ?auto_26035 ) ) ( not ( = ?auto_26013 ?auto_26016 ) ) ( not ( = ?auto_26013 ?auto_26035 ) ) ( not ( = ?auto_26014 ?auto_26016 ) ) ( not ( = ?auto_26014 ?auto_26035 ) ) ( not ( = ?auto_26015 ?auto_26016 ) ) ( not ( = ?auto_26015 ?auto_26035 ) ) ( not ( = ?auto_26018 ?auto_26016 ) ) ( not ( = ?auto_26018 ?auto_26035 ) ) ( not ( = ?auto_26016 ?auto_26046 ) ) ( not ( = ?auto_26016 ?auto_26031 ) ) ( not ( = ?auto_26016 ?auto_26057 ) ) ( not ( = ?auto_26016 ?auto_26042 ) ) ( not ( = ?auto_26016 ?auto_26066 ) ) ( not ( = ?auto_26016 ?auto_26052 ) ) ( not ( = ?auto_26016 ?auto_26055 ) ) ( not ( = ?auto_26016 ?auto_26059 ) ) ( not ( = ?auto_26038 ?auto_26034 ) ) ( not ( = ?auto_26038 ?auto_26040 ) ) ( not ( = ?auto_26038 ?auto_26058 ) ) ( not ( = ?auto_26038 ?auto_26054 ) ) ( not ( = ?auto_26038 ?auto_26065 ) ) ( not ( = ?auto_26038 ?auto_26032 ) ) ( not ( = ?auto_26038 ?auto_26037 ) ) ( not ( = ?auto_26038 ?auto_26051 ) ) ( not ( = ?auto_26061 ?auto_26036 ) ) ( not ( = ?auto_26061 ?auto_26060 ) ) ( not ( = ?auto_26061 ?auto_26053 ) ) ( not ( = ?auto_26061 ?auto_26048 ) ) ( not ( = ?auto_26061 ?auto_26033 ) ) ( not ( = ?auto_26061 ?auto_26064 ) ) ( not ( = ?auto_26061 ?auto_26044 ) ) ( not ( = ?auto_26061 ?auto_26047 ) ) ( not ( = ?auto_26035 ?auto_26046 ) ) ( not ( = ?auto_26035 ?auto_26031 ) ) ( not ( = ?auto_26035 ?auto_26057 ) ) ( not ( = ?auto_26035 ?auto_26042 ) ) ( not ( = ?auto_26035 ?auto_26066 ) ) ( not ( = ?auto_26035 ?auto_26052 ) ) ( not ( = ?auto_26035 ?auto_26055 ) ) ( not ( = ?auto_26035 ?auto_26059 ) ) ( not ( = ?auto_26009 ?auto_26019 ) ) ( not ( = ?auto_26009 ?auto_26039 ) ) ( not ( = ?auto_26010 ?auto_26019 ) ) ( not ( = ?auto_26010 ?auto_26039 ) ) ( not ( = ?auto_26011 ?auto_26019 ) ) ( not ( = ?auto_26011 ?auto_26039 ) ) ( not ( = ?auto_26012 ?auto_26019 ) ) ( not ( = ?auto_26012 ?auto_26039 ) ) ( not ( = ?auto_26013 ?auto_26019 ) ) ( not ( = ?auto_26013 ?auto_26039 ) ) ( not ( = ?auto_26014 ?auto_26019 ) ) ( not ( = ?auto_26014 ?auto_26039 ) ) ( not ( = ?auto_26015 ?auto_26019 ) ) ( not ( = ?auto_26015 ?auto_26039 ) ) ( not ( = ?auto_26018 ?auto_26019 ) ) ( not ( = ?auto_26018 ?auto_26039 ) ) ( not ( = ?auto_26017 ?auto_26019 ) ) ( not ( = ?auto_26017 ?auto_26039 ) ) ( not ( = ?auto_26019 ?auto_26035 ) ) ( not ( = ?auto_26019 ?auto_26046 ) ) ( not ( = ?auto_26019 ?auto_26031 ) ) ( not ( = ?auto_26019 ?auto_26057 ) ) ( not ( = ?auto_26019 ?auto_26042 ) ) ( not ( = ?auto_26019 ?auto_26066 ) ) ( not ( = ?auto_26019 ?auto_26052 ) ) ( not ( = ?auto_26019 ?auto_26055 ) ) ( not ( = ?auto_26019 ?auto_26059 ) ) ( not ( = ?auto_26062 ?auto_26038 ) ) ( not ( = ?auto_26062 ?auto_26034 ) ) ( not ( = ?auto_26062 ?auto_26040 ) ) ( not ( = ?auto_26062 ?auto_26058 ) ) ( not ( = ?auto_26062 ?auto_26054 ) ) ( not ( = ?auto_26062 ?auto_26065 ) ) ( not ( = ?auto_26062 ?auto_26032 ) ) ( not ( = ?auto_26062 ?auto_26037 ) ) ( not ( = ?auto_26062 ?auto_26051 ) ) ( not ( = ?auto_26043 ?auto_26061 ) ) ( not ( = ?auto_26043 ?auto_26036 ) ) ( not ( = ?auto_26043 ?auto_26060 ) ) ( not ( = ?auto_26043 ?auto_26053 ) ) ( not ( = ?auto_26043 ?auto_26048 ) ) ( not ( = ?auto_26043 ?auto_26033 ) ) ( not ( = ?auto_26043 ?auto_26064 ) ) ( not ( = ?auto_26043 ?auto_26044 ) ) ( not ( = ?auto_26043 ?auto_26047 ) ) ( not ( = ?auto_26039 ?auto_26035 ) ) ( not ( = ?auto_26039 ?auto_26046 ) ) ( not ( = ?auto_26039 ?auto_26031 ) ) ( not ( = ?auto_26039 ?auto_26057 ) ) ( not ( = ?auto_26039 ?auto_26042 ) ) ( not ( = ?auto_26039 ?auto_26066 ) ) ( not ( = ?auto_26039 ?auto_26052 ) ) ( not ( = ?auto_26039 ?auto_26055 ) ) ( not ( = ?auto_26039 ?auto_26059 ) ) ( not ( = ?auto_26009 ?auto_26020 ) ) ( not ( = ?auto_26009 ?auto_26045 ) ) ( not ( = ?auto_26010 ?auto_26020 ) ) ( not ( = ?auto_26010 ?auto_26045 ) ) ( not ( = ?auto_26011 ?auto_26020 ) ) ( not ( = ?auto_26011 ?auto_26045 ) ) ( not ( = ?auto_26012 ?auto_26020 ) ) ( not ( = ?auto_26012 ?auto_26045 ) ) ( not ( = ?auto_26013 ?auto_26020 ) ) ( not ( = ?auto_26013 ?auto_26045 ) ) ( not ( = ?auto_26014 ?auto_26020 ) ) ( not ( = ?auto_26014 ?auto_26045 ) ) ( not ( = ?auto_26015 ?auto_26020 ) ) ( not ( = ?auto_26015 ?auto_26045 ) ) ( not ( = ?auto_26018 ?auto_26020 ) ) ( not ( = ?auto_26018 ?auto_26045 ) ) ( not ( = ?auto_26017 ?auto_26020 ) ) ( not ( = ?auto_26017 ?auto_26045 ) ) ( not ( = ?auto_26016 ?auto_26020 ) ) ( not ( = ?auto_26016 ?auto_26045 ) ) ( not ( = ?auto_26020 ?auto_26039 ) ) ( not ( = ?auto_26020 ?auto_26035 ) ) ( not ( = ?auto_26020 ?auto_26046 ) ) ( not ( = ?auto_26020 ?auto_26031 ) ) ( not ( = ?auto_26020 ?auto_26057 ) ) ( not ( = ?auto_26020 ?auto_26042 ) ) ( not ( = ?auto_26020 ?auto_26066 ) ) ( not ( = ?auto_26020 ?auto_26052 ) ) ( not ( = ?auto_26020 ?auto_26055 ) ) ( not ( = ?auto_26020 ?auto_26059 ) ) ( not ( = ?auto_26045 ?auto_26039 ) ) ( not ( = ?auto_26045 ?auto_26035 ) ) ( not ( = ?auto_26045 ?auto_26046 ) ) ( not ( = ?auto_26045 ?auto_26031 ) ) ( not ( = ?auto_26045 ?auto_26057 ) ) ( not ( = ?auto_26045 ?auto_26042 ) ) ( not ( = ?auto_26045 ?auto_26066 ) ) ( not ( = ?auto_26045 ?auto_26052 ) ) ( not ( = ?auto_26045 ?auto_26055 ) ) ( not ( = ?auto_26045 ?auto_26059 ) ) ( not ( = ?auto_26009 ?auto_26021 ) ) ( not ( = ?auto_26009 ?auto_26050 ) ) ( not ( = ?auto_26010 ?auto_26021 ) ) ( not ( = ?auto_26010 ?auto_26050 ) ) ( not ( = ?auto_26011 ?auto_26021 ) ) ( not ( = ?auto_26011 ?auto_26050 ) ) ( not ( = ?auto_26012 ?auto_26021 ) ) ( not ( = ?auto_26012 ?auto_26050 ) ) ( not ( = ?auto_26013 ?auto_26021 ) ) ( not ( = ?auto_26013 ?auto_26050 ) ) ( not ( = ?auto_26014 ?auto_26021 ) ) ( not ( = ?auto_26014 ?auto_26050 ) ) ( not ( = ?auto_26015 ?auto_26021 ) ) ( not ( = ?auto_26015 ?auto_26050 ) ) ( not ( = ?auto_26018 ?auto_26021 ) ) ( not ( = ?auto_26018 ?auto_26050 ) ) ( not ( = ?auto_26017 ?auto_26021 ) ) ( not ( = ?auto_26017 ?auto_26050 ) ) ( not ( = ?auto_26016 ?auto_26021 ) ) ( not ( = ?auto_26016 ?auto_26050 ) ) ( not ( = ?auto_26019 ?auto_26021 ) ) ( not ( = ?auto_26019 ?auto_26050 ) ) ( not ( = ?auto_26021 ?auto_26045 ) ) ( not ( = ?auto_26021 ?auto_26039 ) ) ( not ( = ?auto_26021 ?auto_26035 ) ) ( not ( = ?auto_26021 ?auto_26046 ) ) ( not ( = ?auto_26021 ?auto_26031 ) ) ( not ( = ?auto_26021 ?auto_26057 ) ) ( not ( = ?auto_26021 ?auto_26042 ) ) ( not ( = ?auto_26021 ?auto_26066 ) ) ( not ( = ?auto_26021 ?auto_26052 ) ) ( not ( = ?auto_26021 ?auto_26055 ) ) ( not ( = ?auto_26021 ?auto_26059 ) ) ( not ( = ?auto_26049 ?auto_26062 ) ) ( not ( = ?auto_26049 ?auto_26038 ) ) ( not ( = ?auto_26049 ?auto_26034 ) ) ( not ( = ?auto_26049 ?auto_26040 ) ) ( not ( = ?auto_26049 ?auto_26058 ) ) ( not ( = ?auto_26049 ?auto_26054 ) ) ( not ( = ?auto_26049 ?auto_26065 ) ) ( not ( = ?auto_26049 ?auto_26032 ) ) ( not ( = ?auto_26049 ?auto_26037 ) ) ( not ( = ?auto_26049 ?auto_26051 ) ) ( not ( = ?auto_26056 ?auto_26043 ) ) ( not ( = ?auto_26056 ?auto_26061 ) ) ( not ( = ?auto_26056 ?auto_26036 ) ) ( not ( = ?auto_26056 ?auto_26060 ) ) ( not ( = ?auto_26056 ?auto_26053 ) ) ( not ( = ?auto_26056 ?auto_26048 ) ) ( not ( = ?auto_26056 ?auto_26033 ) ) ( not ( = ?auto_26056 ?auto_26064 ) ) ( not ( = ?auto_26056 ?auto_26044 ) ) ( not ( = ?auto_26056 ?auto_26047 ) ) ( not ( = ?auto_26050 ?auto_26045 ) ) ( not ( = ?auto_26050 ?auto_26039 ) ) ( not ( = ?auto_26050 ?auto_26035 ) ) ( not ( = ?auto_26050 ?auto_26046 ) ) ( not ( = ?auto_26050 ?auto_26031 ) ) ( not ( = ?auto_26050 ?auto_26057 ) ) ( not ( = ?auto_26050 ?auto_26042 ) ) ( not ( = ?auto_26050 ?auto_26066 ) ) ( not ( = ?auto_26050 ?auto_26052 ) ) ( not ( = ?auto_26050 ?auto_26055 ) ) ( not ( = ?auto_26050 ?auto_26059 ) ) ( not ( = ?auto_26009 ?auto_26022 ) ) ( not ( = ?auto_26009 ?auto_26041 ) ) ( not ( = ?auto_26010 ?auto_26022 ) ) ( not ( = ?auto_26010 ?auto_26041 ) ) ( not ( = ?auto_26011 ?auto_26022 ) ) ( not ( = ?auto_26011 ?auto_26041 ) ) ( not ( = ?auto_26012 ?auto_26022 ) ) ( not ( = ?auto_26012 ?auto_26041 ) ) ( not ( = ?auto_26013 ?auto_26022 ) ) ( not ( = ?auto_26013 ?auto_26041 ) ) ( not ( = ?auto_26014 ?auto_26022 ) ) ( not ( = ?auto_26014 ?auto_26041 ) ) ( not ( = ?auto_26015 ?auto_26022 ) ) ( not ( = ?auto_26015 ?auto_26041 ) ) ( not ( = ?auto_26018 ?auto_26022 ) ) ( not ( = ?auto_26018 ?auto_26041 ) ) ( not ( = ?auto_26017 ?auto_26022 ) ) ( not ( = ?auto_26017 ?auto_26041 ) ) ( not ( = ?auto_26016 ?auto_26022 ) ) ( not ( = ?auto_26016 ?auto_26041 ) ) ( not ( = ?auto_26019 ?auto_26022 ) ) ( not ( = ?auto_26019 ?auto_26041 ) ) ( not ( = ?auto_26020 ?auto_26022 ) ) ( not ( = ?auto_26020 ?auto_26041 ) ) ( not ( = ?auto_26022 ?auto_26050 ) ) ( not ( = ?auto_26022 ?auto_26045 ) ) ( not ( = ?auto_26022 ?auto_26039 ) ) ( not ( = ?auto_26022 ?auto_26035 ) ) ( not ( = ?auto_26022 ?auto_26046 ) ) ( not ( = ?auto_26022 ?auto_26031 ) ) ( not ( = ?auto_26022 ?auto_26057 ) ) ( not ( = ?auto_26022 ?auto_26042 ) ) ( not ( = ?auto_26022 ?auto_26066 ) ) ( not ( = ?auto_26022 ?auto_26052 ) ) ( not ( = ?auto_26022 ?auto_26055 ) ) ( not ( = ?auto_26022 ?auto_26059 ) ) ( not ( = ?auto_26063 ?auto_26049 ) ) ( not ( = ?auto_26063 ?auto_26062 ) ) ( not ( = ?auto_26063 ?auto_26038 ) ) ( not ( = ?auto_26063 ?auto_26034 ) ) ( not ( = ?auto_26063 ?auto_26040 ) ) ( not ( = ?auto_26063 ?auto_26058 ) ) ( not ( = ?auto_26063 ?auto_26054 ) ) ( not ( = ?auto_26063 ?auto_26065 ) ) ( not ( = ?auto_26063 ?auto_26032 ) ) ( not ( = ?auto_26063 ?auto_26037 ) ) ( not ( = ?auto_26063 ?auto_26051 ) ) ( not ( = ?auto_26030 ?auto_26056 ) ) ( not ( = ?auto_26030 ?auto_26043 ) ) ( not ( = ?auto_26030 ?auto_26061 ) ) ( not ( = ?auto_26030 ?auto_26036 ) ) ( not ( = ?auto_26030 ?auto_26060 ) ) ( not ( = ?auto_26030 ?auto_26053 ) ) ( not ( = ?auto_26030 ?auto_26048 ) ) ( not ( = ?auto_26030 ?auto_26033 ) ) ( not ( = ?auto_26030 ?auto_26064 ) ) ( not ( = ?auto_26030 ?auto_26044 ) ) ( not ( = ?auto_26030 ?auto_26047 ) ) ( not ( = ?auto_26041 ?auto_26050 ) ) ( not ( = ?auto_26041 ?auto_26045 ) ) ( not ( = ?auto_26041 ?auto_26039 ) ) ( not ( = ?auto_26041 ?auto_26035 ) ) ( not ( = ?auto_26041 ?auto_26046 ) ) ( not ( = ?auto_26041 ?auto_26031 ) ) ( not ( = ?auto_26041 ?auto_26057 ) ) ( not ( = ?auto_26041 ?auto_26042 ) ) ( not ( = ?auto_26041 ?auto_26066 ) ) ( not ( = ?auto_26041 ?auto_26052 ) ) ( not ( = ?auto_26041 ?auto_26055 ) ) ( not ( = ?auto_26041 ?auto_26059 ) ) ( not ( = ?auto_26009 ?auto_26023 ) ) ( not ( = ?auto_26009 ?auto_26026 ) ) ( not ( = ?auto_26010 ?auto_26023 ) ) ( not ( = ?auto_26010 ?auto_26026 ) ) ( not ( = ?auto_26011 ?auto_26023 ) ) ( not ( = ?auto_26011 ?auto_26026 ) ) ( not ( = ?auto_26012 ?auto_26023 ) ) ( not ( = ?auto_26012 ?auto_26026 ) ) ( not ( = ?auto_26013 ?auto_26023 ) ) ( not ( = ?auto_26013 ?auto_26026 ) ) ( not ( = ?auto_26014 ?auto_26023 ) ) ( not ( = ?auto_26014 ?auto_26026 ) ) ( not ( = ?auto_26015 ?auto_26023 ) ) ( not ( = ?auto_26015 ?auto_26026 ) ) ( not ( = ?auto_26018 ?auto_26023 ) ) ( not ( = ?auto_26018 ?auto_26026 ) ) ( not ( = ?auto_26017 ?auto_26023 ) ) ( not ( = ?auto_26017 ?auto_26026 ) ) ( not ( = ?auto_26016 ?auto_26023 ) ) ( not ( = ?auto_26016 ?auto_26026 ) ) ( not ( = ?auto_26019 ?auto_26023 ) ) ( not ( = ?auto_26019 ?auto_26026 ) ) ( not ( = ?auto_26020 ?auto_26023 ) ) ( not ( = ?auto_26020 ?auto_26026 ) ) ( not ( = ?auto_26021 ?auto_26023 ) ) ( not ( = ?auto_26021 ?auto_26026 ) ) ( not ( = ?auto_26023 ?auto_26041 ) ) ( not ( = ?auto_26023 ?auto_26050 ) ) ( not ( = ?auto_26023 ?auto_26045 ) ) ( not ( = ?auto_26023 ?auto_26039 ) ) ( not ( = ?auto_26023 ?auto_26035 ) ) ( not ( = ?auto_26023 ?auto_26046 ) ) ( not ( = ?auto_26023 ?auto_26031 ) ) ( not ( = ?auto_26023 ?auto_26057 ) ) ( not ( = ?auto_26023 ?auto_26042 ) ) ( not ( = ?auto_26023 ?auto_26066 ) ) ( not ( = ?auto_26023 ?auto_26052 ) ) ( not ( = ?auto_26023 ?auto_26055 ) ) ( not ( = ?auto_26023 ?auto_26059 ) ) ( not ( = ?auto_26029 ?auto_26063 ) ) ( not ( = ?auto_26029 ?auto_26049 ) ) ( not ( = ?auto_26029 ?auto_26062 ) ) ( not ( = ?auto_26029 ?auto_26038 ) ) ( not ( = ?auto_26029 ?auto_26034 ) ) ( not ( = ?auto_26029 ?auto_26040 ) ) ( not ( = ?auto_26029 ?auto_26058 ) ) ( not ( = ?auto_26029 ?auto_26054 ) ) ( not ( = ?auto_26029 ?auto_26065 ) ) ( not ( = ?auto_26029 ?auto_26032 ) ) ( not ( = ?auto_26029 ?auto_26037 ) ) ( not ( = ?auto_26029 ?auto_26051 ) ) ( not ( = ?auto_26027 ?auto_26030 ) ) ( not ( = ?auto_26027 ?auto_26056 ) ) ( not ( = ?auto_26027 ?auto_26043 ) ) ( not ( = ?auto_26027 ?auto_26061 ) ) ( not ( = ?auto_26027 ?auto_26036 ) ) ( not ( = ?auto_26027 ?auto_26060 ) ) ( not ( = ?auto_26027 ?auto_26053 ) ) ( not ( = ?auto_26027 ?auto_26048 ) ) ( not ( = ?auto_26027 ?auto_26033 ) ) ( not ( = ?auto_26027 ?auto_26064 ) ) ( not ( = ?auto_26027 ?auto_26044 ) ) ( not ( = ?auto_26027 ?auto_26047 ) ) ( not ( = ?auto_26026 ?auto_26041 ) ) ( not ( = ?auto_26026 ?auto_26050 ) ) ( not ( = ?auto_26026 ?auto_26045 ) ) ( not ( = ?auto_26026 ?auto_26039 ) ) ( not ( = ?auto_26026 ?auto_26035 ) ) ( not ( = ?auto_26026 ?auto_26046 ) ) ( not ( = ?auto_26026 ?auto_26031 ) ) ( not ( = ?auto_26026 ?auto_26057 ) ) ( not ( = ?auto_26026 ?auto_26042 ) ) ( not ( = ?auto_26026 ?auto_26066 ) ) ( not ( = ?auto_26026 ?auto_26052 ) ) ( not ( = ?auto_26026 ?auto_26055 ) ) ( not ( = ?auto_26026 ?auto_26059 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_26009 ?auto_26010 ?auto_26011 ?auto_26012 ?auto_26013 ?auto_26014 ?auto_26015 ?auto_26018 ?auto_26017 ?auto_26016 ?auto_26019 ?auto_26020 ?auto_26021 ?auto_26022 )
      ( MAKE-1CRATE ?auto_26022 ?auto_26023 )
      ( MAKE-14CRATE-VERIFY ?auto_26009 ?auto_26010 ?auto_26011 ?auto_26012 ?auto_26013 ?auto_26014 ?auto_26015 ?auto_26018 ?auto_26017 ?auto_26016 ?auto_26019 ?auto_26020 ?auto_26021 ?auto_26022 ?auto_26023 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26069 - SURFACE
      ?auto_26070 - SURFACE
    )
    :vars
    (
      ?auto_26071 - HOIST
      ?auto_26072 - PLACE
      ?auto_26074 - PLACE
      ?auto_26075 - HOIST
      ?auto_26076 - SURFACE
      ?auto_26073 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26071 ?auto_26072 ) ( SURFACE-AT ?auto_26069 ?auto_26072 ) ( CLEAR ?auto_26069 ) ( IS-CRATE ?auto_26070 ) ( AVAILABLE ?auto_26071 ) ( not ( = ?auto_26074 ?auto_26072 ) ) ( HOIST-AT ?auto_26075 ?auto_26074 ) ( AVAILABLE ?auto_26075 ) ( SURFACE-AT ?auto_26070 ?auto_26074 ) ( ON ?auto_26070 ?auto_26076 ) ( CLEAR ?auto_26070 ) ( TRUCK-AT ?auto_26073 ?auto_26072 ) ( not ( = ?auto_26069 ?auto_26070 ) ) ( not ( = ?auto_26069 ?auto_26076 ) ) ( not ( = ?auto_26070 ?auto_26076 ) ) ( not ( = ?auto_26071 ?auto_26075 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26073 ?auto_26072 ?auto_26074 )
      ( !LIFT ?auto_26075 ?auto_26070 ?auto_26076 ?auto_26074 )
      ( !LOAD ?auto_26075 ?auto_26070 ?auto_26073 ?auto_26074 )
      ( !DRIVE ?auto_26073 ?auto_26074 ?auto_26072 )
      ( !UNLOAD ?auto_26071 ?auto_26070 ?auto_26073 ?auto_26072 )
      ( !DROP ?auto_26071 ?auto_26070 ?auto_26069 ?auto_26072 )
      ( MAKE-1CRATE-VERIFY ?auto_26069 ?auto_26070 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_26093 - SURFACE
      ?auto_26094 - SURFACE
      ?auto_26095 - SURFACE
      ?auto_26096 - SURFACE
      ?auto_26097 - SURFACE
      ?auto_26098 - SURFACE
      ?auto_26099 - SURFACE
      ?auto_26102 - SURFACE
      ?auto_26101 - SURFACE
      ?auto_26100 - SURFACE
      ?auto_26103 - SURFACE
      ?auto_26104 - SURFACE
      ?auto_26105 - SURFACE
      ?auto_26106 - SURFACE
      ?auto_26108 - SURFACE
      ?auto_26107 - SURFACE
    )
    :vars
    (
      ?auto_26111 - HOIST
      ?auto_26110 - PLACE
      ?auto_26113 - PLACE
      ?auto_26109 - HOIST
      ?auto_26114 - SURFACE
      ?auto_26126 - PLACE
      ?auto_26143 - HOIST
      ?auto_26137 - SURFACE
      ?auto_26139 - PLACE
      ?auto_26146 - HOIST
      ?auto_26129 - SURFACE
      ?auto_26121 - PLACE
      ?auto_26132 - HOIST
      ?auto_26118 - SURFACE
      ?auto_26151 - PLACE
      ?auto_26145 - HOIST
      ?auto_26131 - SURFACE
      ?auto_26150 - SURFACE
      ?auto_26149 - PLACE
      ?auto_26134 - HOIST
      ?auto_26122 - SURFACE
      ?auto_26125 - PLACE
      ?auto_26148 - HOIST
      ?auto_26138 - SURFACE
      ?auto_26144 - PLACE
      ?auto_26135 - HOIST
      ?auto_26116 - SURFACE
      ?auto_26128 - PLACE
      ?auto_26115 - HOIST
      ?auto_26141 - SURFACE
      ?auto_26117 - PLACE
      ?auto_26152 - HOIST
      ?auto_26119 - SURFACE
      ?auto_26133 - SURFACE
      ?auto_26147 - PLACE
      ?auto_26140 - HOIST
      ?auto_26130 - SURFACE
      ?auto_26120 - PLACE
      ?auto_26123 - HOIST
      ?auto_26127 - SURFACE
      ?auto_26124 - PLACE
      ?auto_26142 - HOIST
      ?auto_26136 - SURFACE
      ?auto_26112 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26111 ?auto_26110 ) ( IS-CRATE ?auto_26107 ) ( not ( = ?auto_26113 ?auto_26110 ) ) ( HOIST-AT ?auto_26109 ?auto_26113 ) ( SURFACE-AT ?auto_26107 ?auto_26113 ) ( ON ?auto_26107 ?auto_26114 ) ( CLEAR ?auto_26107 ) ( not ( = ?auto_26108 ?auto_26107 ) ) ( not ( = ?auto_26108 ?auto_26114 ) ) ( not ( = ?auto_26107 ?auto_26114 ) ) ( not ( = ?auto_26111 ?auto_26109 ) ) ( IS-CRATE ?auto_26108 ) ( not ( = ?auto_26126 ?auto_26110 ) ) ( HOIST-AT ?auto_26143 ?auto_26126 ) ( AVAILABLE ?auto_26143 ) ( SURFACE-AT ?auto_26108 ?auto_26126 ) ( ON ?auto_26108 ?auto_26137 ) ( CLEAR ?auto_26108 ) ( not ( = ?auto_26106 ?auto_26108 ) ) ( not ( = ?auto_26106 ?auto_26137 ) ) ( not ( = ?auto_26108 ?auto_26137 ) ) ( not ( = ?auto_26111 ?auto_26143 ) ) ( IS-CRATE ?auto_26106 ) ( not ( = ?auto_26139 ?auto_26110 ) ) ( HOIST-AT ?auto_26146 ?auto_26139 ) ( AVAILABLE ?auto_26146 ) ( SURFACE-AT ?auto_26106 ?auto_26139 ) ( ON ?auto_26106 ?auto_26129 ) ( CLEAR ?auto_26106 ) ( not ( = ?auto_26105 ?auto_26106 ) ) ( not ( = ?auto_26105 ?auto_26129 ) ) ( not ( = ?auto_26106 ?auto_26129 ) ) ( not ( = ?auto_26111 ?auto_26146 ) ) ( IS-CRATE ?auto_26105 ) ( not ( = ?auto_26121 ?auto_26110 ) ) ( HOIST-AT ?auto_26132 ?auto_26121 ) ( AVAILABLE ?auto_26132 ) ( SURFACE-AT ?auto_26105 ?auto_26121 ) ( ON ?auto_26105 ?auto_26118 ) ( CLEAR ?auto_26105 ) ( not ( = ?auto_26104 ?auto_26105 ) ) ( not ( = ?auto_26104 ?auto_26118 ) ) ( not ( = ?auto_26105 ?auto_26118 ) ) ( not ( = ?auto_26111 ?auto_26132 ) ) ( IS-CRATE ?auto_26104 ) ( not ( = ?auto_26151 ?auto_26110 ) ) ( HOIST-AT ?auto_26145 ?auto_26151 ) ( SURFACE-AT ?auto_26104 ?auto_26151 ) ( ON ?auto_26104 ?auto_26131 ) ( CLEAR ?auto_26104 ) ( not ( = ?auto_26103 ?auto_26104 ) ) ( not ( = ?auto_26103 ?auto_26131 ) ) ( not ( = ?auto_26104 ?auto_26131 ) ) ( not ( = ?auto_26111 ?auto_26145 ) ) ( IS-CRATE ?auto_26103 ) ( AVAILABLE ?auto_26145 ) ( SURFACE-AT ?auto_26103 ?auto_26151 ) ( ON ?auto_26103 ?auto_26150 ) ( CLEAR ?auto_26103 ) ( not ( = ?auto_26100 ?auto_26103 ) ) ( not ( = ?auto_26100 ?auto_26150 ) ) ( not ( = ?auto_26103 ?auto_26150 ) ) ( IS-CRATE ?auto_26100 ) ( not ( = ?auto_26149 ?auto_26110 ) ) ( HOIST-AT ?auto_26134 ?auto_26149 ) ( AVAILABLE ?auto_26134 ) ( SURFACE-AT ?auto_26100 ?auto_26149 ) ( ON ?auto_26100 ?auto_26122 ) ( CLEAR ?auto_26100 ) ( not ( = ?auto_26101 ?auto_26100 ) ) ( not ( = ?auto_26101 ?auto_26122 ) ) ( not ( = ?auto_26100 ?auto_26122 ) ) ( not ( = ?auto_26111 ?auto_26134 ) ) ( IS-CRATE ?auto_26101 ) ( not ( = ?auto_26125 ?auto_26110 ) ) ( HOIST-AT ?auto_26148 ?auto_26125 ) ( AVAILABLE ?auto_26148 ) ( SURFACE-AT ?auto_26101 ?auto_26125 ) ( ON ?auto_26101 ?auto_26138 ) ( CLEAR ?auto_26101 ) ( not ( = ?auto_26102 ?auto_26101 ) ) ( not ( = ?auto_26102 ?auto_26138 ) ) ( not ( = ?auto_26101 ?auto_26138 ) ) ( not ( = ?auto_26111 ?auto_26148 ) ) ( IS-CRATE ?auto_26102 ) ( not ( = ?auto_26144 ?auto_26110 ) ) ( HOIST-AT ?auto_26135 ?auto_26144 ) ( AVAILABLE ?auto_26135 ) ( SURFACE-AT ?auto_26102 ?auto_26144 ) ( ON ?auto_26102 ?auto_26116 ) ( CLEAR ?auto_26102 ) ( not ( = ?auto_26099 ?auto_26102 ) ) ( not ( = ?auto_26099 ?auto_26116 ) ) ( not ( = ?auto_26102 ?auto_26116 ) ) ( not ( = ?auto_26111 ?auto_26135 ) ) ( IS-CRATE ?auto_26099 ) ( not ( = ?auto_26128 ?auto_26110 ) ) ( HOIST-AT ?auto_26115 ?auto_26128 ) ( AVAILABLE ?auto_26115 ) ( SURFACE-AT ?auto_26099 ?auto_26128 ) ( ON ?auto_26099 ?auto_26141 ) ( CLEAR ?auto_26099 ) ( not ( = ?auto_26098 ?auto_26099 ) ) ( not ( = ?auto_26098 ?auto_26141 ) ) ( not ( = ?auto_26099 ?auto_26141 ) ) ( not ( = ?auto_26111 ?auto_26115 ) ) ( IS-CRATE ?auto_26098 ) ( not ( = ?auto_26117 ?auto_26110 ) ) ( HOIST-AT ?auto_26152 ?auto_26117 ) ( AVAILABLE ?auto_26152 ) ( SURFACE-AT ?auto_26098 ?auto_26117 ) ( ON ?auto_26098 ?auto_26119 ) ( CLEAR ?auto_26098 ) ( not ( = ?auto_26097 ?auto_26098 ) ) ( not ( = ?auto_26097 ?auto_26119 ) ) ( not ( = ?auto_26098 ?auto_26119 ) ) ( not ( = ?auto_26111 ?auto_26152 ) ) ( IS-CRATE ?auto_26097 ) ( AVAILABLE ?auto_26109 ) ( SURFACE-AT ?auto_26097 ?auto_26113 ) ( ON ?auto_26097 ?auto_26133 ) ( CLEAR ?auto_26097 ) ( not ( = ?auto_26096 ?auto_26097 ) ) ( not ( = ?auto_26096 ?auto_26133 ) ) ( not ( = ?auto_26097 ?auto_26133 ) ) ( IS-CRATE ?auto_26096 ) ( not ( = ?auto_26147 ?auto_26110 ) ) ( HOIST-AT ?auto_26140 ?auto_26147 ) ( AVAILABLE ?auto_26140 ) ( SURFACE-AT ?auto_26096 ?auto_26147 ) ( ON ?auto_26096 ?auto_26130 ) ( CLEAR ?auto_26096 ) ( not ( = ?auto_26095 ?auto_26096 ) ) ( not ( = ?auto_26095 ?auto_26130 ) ) ( not ( = ?auto_26096 ?auto_26130 ) ) ( not ( = ?auto_26111 ?auto_26140 ) ) ( IS-CRATE ?auto_26095 ) ( not ( = ?auto_26120 ?auto_26110 ) ) ( HOIST-AT ?auto_26123 ?auto_26120 ) ( AVAILABLE ?auto_26123 ) ( SURFACE-AT ?auto_26095 ?auto_26120 ) ( ON ?auto_26095 ?auto_26127 ) ( CLEAR ?auto_26095 ) ( not ( = ?auto_26094 ?auto_26095 ) ) ( not ( = ?auto_26094 ?auto_26127 ) ) ( not ( = ?auto_26095 ?auto_26127 ) ) ( not ( = ?auto_26111 ?auto_26123 ) ) ( SURFACE-AT ?auto_26093 ?auto_26110 ) ( CLEAR ?auto_26093 ) ( IS-CRATE ?auto_26094 ) ( AVAILABLE ?auto_26111 ) ( not ( = ?auto_26124 ?auto_26110 ) ) ( HOIST-AT ?auto_26142 ?auto_26124 ) ( AVAILABLE ?auto_26142 ) ( SURFACE-AT ?auto_26094 ?auto_26124 ) ( ON ?auto_26094 ?auto_26136 ) ( CLEAR ?auto_26094 ) ( TRUCK-AT ?auto_26112 ?auto_26110 ) ( not ( = ?auto_26093 ?auto_26094 ) ) ( not ( = ?auto_26093 ?auto_26136 ) ) ( not ( = ?auto_26094 ?auto_26136 ) ) ( not ( = ?auto_26111 ?auto_26142 ) ) ( not ( = ?auto_26093 ?auto_26095 ) ) ( not ( = ?auto_26093 ?auto_26127 ) ) ( not ( = ?auto_26095 ?auto_26136 ) ) ( not ( = ?auto_26120 ?auto_26124 ) ) ( not ( = ?auto_26123 ?auto_26142 ) ) ( not ( = ?auto_26127 ?auto_26136 ) ) ( not ( = ?auto_26093 ?auto_26096 ) ) ( not ( = ?auto_26093 ?auto_26130 ) ) ( not ( = ?auto_26094 ?auto_26096 ) ) ( not ( = ?auto_26094 ?auto_26130 ) ) ( not ( = ?auto_26096 ?auto_26127 ) ) ( not ( = ?auto_26096 ?auto_26136 ) ) ( not ( = ?auto_26147 ?auto_26120 ) ) ( not ( = ?auto_26147 ?auto_26124 ) ) ( not ( = ?auto_26140 ?auto_26123 ) ) ( not ( = ?auto_26140 ?auto_26142 ) ) ( not ( = ?auto_26130 ?auto_26127 ) ) ( not ( = ?auto_26130 ?auto_26136 ) ) ( not ( = ?auto_26093 ?auto_26097 ) ) ( not ( = ?auto_26093 ?auto_26133 ) ) ( not ( = ?auto_26094 ?auto_26097 ) ) ( not ( = ?auto_26094 ?auto_26133 ) ) ( not ( = ?auto_26095 ?auto_26097 ) ) ( not ( = ?auto_26095 ?auto_26133 ) ) ( not ( = ?auto_26097 ?auto_26130 ) ) ( not ( = ?auto_26097 ?auto_26127 ) ) ( not ( = ?auto_26097 ?auto_26136 ) ) ( not ( = ?auto_26113 ?auto_26147 ) ) ( not ( = ?auto_26113 ?auto_26120 ) ) ( not ( = ?auto_26113 ?auto_26124 ) ) ( not ( = ?auto_26109 ?auto_26140 ) ) ( not ( = ?auto_26109 ?auto_26123 ) ) ( not ( = ?auto_26109 ?auto_26142 ) ) ( not ( = ?auto_26133 ?auto_26130 ) ) ( not ( = ?auto_26133 ?auto_26127 ) ) ( not ( = ?auto_26133 ?auto_26136 ) ) ( not ( = ?auto_26093 ?auto_26098 ) ) ( not ( = ?auto_26093 ?auto_26119 ) ) ( not ( = ?auto_26094 ?auto_26098 ) ) ( not ( = ?auto_26094 ?auto_26119 ) ) ( not ( = ?auto_26095 ?auto_26098 ) ) ( not ( = ?auto_26095 ?auto_26119 ) ) ( not ( = ?auto_26096 ?auto_26098 ) ) ( not ( = ?auto_26096 ?auto_26119 ) ) ( not ( = ?auto_26098 ?auto_26133 ) ) ( not ( = ?auto_26098 ?auto_26130 ) ) ( not ( = ?auto_26098 ?auto_26127 ) ) ( not ( = ?auto_26098 ?auto_26136 ) ) ( not ( = ?auto_26117 ?auto_26113 ) ) ( not ( = ?auto_26117 ?auto_26147 ) ) ( not ( = ?auto_26117 ?auto_26120 ) ) ( not ( = ?auto_26117 ?auto_26124 ) ) ( not ( = ?auto_26152 ?auto_26109 ) ) ( not ( = ?auto_26152 ?auto_26140 ) ) ( not ( = ?auto_26152 ?auto_26123 ) ) ( not ( = ?auto_26152 ?auto_26142 ) ) ( not ( = ?auto_26119 ?auto_26133 ) ) ( not ( = ?auto_26119 ?auto_26130 ) ) ( not ( = ?auto_26119 ?auto_26127 ) ) ( not ( = ?auto_26119 ?auto_26136 ) ) ( not ( = ?auto_26093 ?auto_26099 ) ) ( not ( = ?auto_26093 ?auto_26141 ) ) ( not ( = ?auto_26094 ?auto_26099 ) ) ( not ( = ?auto_26094 ?auto_26141 ) ) ( not ( = ?auto_26095 ?auto_26099 ) ) ( not ( = ?auto_26095 ?auto_26141 ) ) ( not ( = ?auto_26096 ?auto_26099 ) ) ( not ( = ?auto_26096 ?auto_26141 ) ) ( not ( = ?auto_26097 ?auto_26099 ) ) ( not ( = ?auto_26097 ?auto_26141 ) ) ( not ( = ?auto_26099 ?auto_26119 ) ) ( not ( = ?auto_26099 ?auto_26133 ) ) ( not ( = ?auto_26099 ?auto_26130 ) ) ( not ( = ?auto_26099 ?auto_26127 ) ) ( not ( = ?auto_26099 ?auto_26136 ) ) ( not ( = ?auto_26128 ?auto_26117 ) ) ( not ( = ?auto_26128 ?auto_26113 ) ) ( not ( = ?auto_26128 ?auto_26147 ) ) ( not ( = ?auto_26128 ?auto_26120 ) ) ( not ( = ?auto_26128 ?auto_26124 ) ) ( not ( = ?auto_26115 ?auto_26152 ) ) ( not ( = ?auto_26115 ?auto_26109 ) ) ( not ( = ?auto_26115 ?auto_26140 ) ) ( not ( = ?auto_26115 ?auto_26123 ) ) ( not ( = ?auto_26115 ?auto_26142 ) ) ( not ( = ?auto_26141 ?auto_26119 ) ) ( not ( = ?auto_26141 ?auto_26133 ) ) ( not ( = ?auto_26141 ?auto_26130 ) ) ( not ( = ?auto_26141 ?auto_26127 ) ) ( not ( = ?auto_26141 ?auto_26136 ) ) ( not ( = ?auto_26093 ?auto_26102 ) ) ( not ( = ?auto_26093 ?auto_26116 ) ) ( not ( = ?auto_26094 ?auto_26102 ) ) ( not ( = ?auto_26094 ?auto_26116 ) ) ( not ( = ?auto_26095 ?auto_26102 ) ) ( not ( = ?auto_26095 ?auto_26116 ) ) ( not ( = ?auto_26096 ?auto_26102 ) ) ( not ( = ?auto_26096 ?auto_26116 ) ) ( not ( = ?auto_26097 ?auto_26102 ) ) ( not ( = ?auto_26097 ?auto_26116 ) ) ( not ( = ?auto_26098 ?auto_26102 ) ) ( not ( = ?auto_26098 ?auto_26116 ) ) ( not ( = ?auto_26102 ?auto_26141 ) ) ( not ( = ?auto_26102 ?auto_26119 ) ) ( not ( = ?auto_26102 ?auto_26133 ) ) ( not ( = ?auto_26102 ?auto_26130 ) ) ( not ( = ?auto_26102 ?auto_26127 ) ) ( not ( = ?auto_26102 ?auto_26136 ) ) ( not ( = ?auto_26144 ?auto_26128 ) ) ( not ( = ?auto_26144 ?auto_26117 ) ) ( not ( = ?auto_26144 ?auto_26113 ) ) ( not ( = ?auto_26144 ?auto_26147 ) ) ( not ( = ?auto_26144 ?auto_26120 ) ) ( not ( = ?auto_26144 ?auto_26124 ) ) ( not ( = ?auto_26135 ?auto_26115 ) ) ( not ( = ?auto_26135 ?auto_26152 ) ) ( not ( = ?auto_26135 ?auto_26109 ) ) ( not ( = ?auto_26135 ?auto_26140 ) ) ( not ( = ?auto_26135 ?auto_26123 ) ) ( not ( = ?auto_26135 ?auto_26142 ) ) ( not ( = ?auto_26116 ?auto_26141 ) ) ( not ( = ?auto_26116 ?auto_26119 ) ) ( not ( = ?auto_26116 ?auto_26133 ) ) ( not ( = ?auto_26116 ?auto_26130 ) ) ( not ( = ?auto_26116 ?auto_26127 ) ) ( not ( = ?auto_26116 ?auto_26136 ) ) ( not ( = ?auto_26093 ?auto_26101 ) ) ( not ( = ?auto_26093 ?auto_26138 ) ) ( not ( = ?auto_26094 ?auto_26101 ) ) ( not ( = ?auto_26094 ?auto_26138 ) ) ( not ( = ?auto_26095 ?auto_26101 ) ) ( not ( = ?auto_26095 ?auto_26138 ) ) ( not ( = ?auto_26096 ?auto_26101 ) ) ( not ( = ?auto_26096 ?auto_26138 ) ) ( not ( = ?auto_26097 ?auto_26101 ) ) ( not ( = ?auto_26097 ?auto_26138 ) ) ( not ( = ?auto_26098 ?auto_26101 ) ) ( not ( = ?auto_26098 ?auto_26138 ) ) ( not ( = ?auto_26099 ?auto_26101 ) ) ( not ( = ?auto_26099 ?auto_26138 ) ) ( not ( = ?auto_26101 ?auto_26116 ) ) ( not ( = ?auto_26101 ?auto_26141 ) ) ( not ( = ?auto_26101 ?auto_26119 ) ) ( not ( = ?auto_26101 ?auto_26133 ) ) ( not ( = ?auto_26101 ?auto_26130 ) ) ( not ( = ?auto_26101 ?auto_26127 ) ) ( not ( = ?auto_26101 ?auto_26136 ) ) ( not ( = ?auto_26125 ?auto_26144 ) ) ( not ( = ?auto_26125 ?auto_26128 ) ) ( not ( = ?auto_26125 ?auto_26117 ) ) ( not ( = ?auto_26125 ?auto_26113 ) ) ( not ( = ?auto_26125 ?auto_26147 ) ) ( not ( = ?auto_26125 ?auto_26120 ) ) ( not ( = ?auto_26125 ?auto_26124 ) ) ( not ( = ?auto_26148 ?auto_26135 ) ) ( not ( = ?auto_26148 ?auto_26115 ) ) ( not ( = ?auto_26148 ?auto_26152 ) ) ( not ( = ?auto_26148 ?auto_26109 ) ) ( not ( = ?auto_26148 ?auto_26140 ) ) ( not ( = ?auto_26148 ?auto_26123 ) ) ( not ( = ?auto_26148 ?auto_26142 ) ) ( not ( = ?auto_26138 ?auto_26116 ) ) ( not ( = ?auto_26138 ?auto_26141 ) ) ( not ( = ?auto_26138 ?auto_26119 ) ) ( not ( = ?auto_26138 ?auto_26133 ) ) ( not ( = ?auto_26138 ?auto_26130 ) ) ( not ( = ?auto_26138 ?auto_26127 ) ) ( not ( = ?auto_26138 ?auto_26136 ) ) ( not ( = ?auto_26093 ?auto_26100 ) ) ( not ( = ?auto_26093 ?auto_26122 ) ) ( not ( = ?auto_26094 ?auto_26100 ) ) ( not ( = ?auto_26094 ?auto_26122 ) ) ( not ( = ?auto_26095 ?auto_26100 ) ) ( not ( = ?auto_26095 ?auto_26122 ) ) ( not ( = ?auto_26096 ?auto_26100 ) ) ( not ( = ?auto_26096 ?auto_26122 ) ) ( not ( = ?auto_26097 ?auto_26100 ) ) ( not ( = ?auto_26097 ?auto_26122 ) ) ( not ( = ?auto_26098 ?auto_26100 ) ) ( not ( = ?auto_26098 ?auto_26122 ) ) ( not ( = ?auto_26099 ?auto_26100 ) ) ( not ( = ?auto_26099 ?auto_26122 ) ) ( not ( = ?auto_26102 ?auto_26100 ) ) ( not ( = ?auto_26102 ?auto_26122 ) ) ( not ( = ?auto_26100 ?auto_26138 ) ) ( not ( = ?auto_26100 ?auto_26116 ) ) ( not ( = ?auto_26100 ?auto_26141 ) ) ( not ( = ?auto_26100 ?auto_26119 ) ) ( not ( = ?auto_26100 ?auto_26133 ) ) ( not ( = ?auto_26100 ?auto_26130 ) ) ( not ( = ?auto_26100 ?auto_26127 ) ) ( not ( = ?auto_26100 ?auto_26136 ) ) ( not ( = ?auto_26149 ?auto_26125 ) ) ( not ( = ?auto_26149 ?auto_26144 ) ) ( not ( = ?auto_26149 ?auto_26128 ) ) ( not ( = ?auto_26149 ?auto_26117 ) ) ( not ( = ?auto_26149 ?auto_26113 ) ) ( not ( = ?auto_26149 ?auto_26147 ) ) ( not ( = ?auto_26149 ?auto_26120 ) ) ( not ( = ?auto_26149 ?auto_26124 ) ) ( not ( = ?auto_26134 ?auto_26148 ) ) ( not ( = ?auto_26134 ?auto_26135 ) ) ( not ( = ?auto_26134 ?auto_26115 ) ) ( not ( = ?auto_26134 ?auto_26152 ) ) ( not ( = ?auto_26134 ?auto_26109 ) ) ( not ( = ?auto_26134 ?auto_26140 ) ) ( not ( = ?auto_26134 ?auto_26123 ) ) ( not ( = ?auto_26134 ?auto_26142 ) ) ( not ( = ?auto_26122 ?auto_26138 ) ) ( not ( = ?auto_26122 ?auto_26116 ) ) ( not ( = ?auto_26122 ?auto_26141 ) ) ( not ( = ?auto_26122 ?auto_26119 ) ) ( not ( = ?auto_26122 ?auto_26133 ) ) ( not ( = ?auto_26122 ?auto_26130 ) ) ( not ( = ?auto_26122 ?auto_26127 ) ) ( not ( = ?auto_26122 ?auto_26136 ) ) ( not ( = ?auto_26093 ?auto_26103 ) ) ( not ( = ?auto_26093 ?auto_26150 ) ) ( not ( = ?auto_26094 ?auto_26103 ) ) ( not ( = ?auto_26094 ?auto_26150 ) ) ( not ( = ?auto_26095 ?auto_26103 ) ) ( not ( = ?auto_26095 ?auto_26150 ) ) ( not ( = ?auto_26096 ?auto_26103 ) ) ( not ( = ?auto_26096 ?auto_26150 ) ) ( not ( = ?auto_26097 ?auto_26103 ) ) ( not ( = ?auto_26097 ?auto_26150 ) ) ( not ( = ?auto_26098 ?auto_26103 ) ) ( not ( = ?auto_26098 ?auto_26150 ) ) ( not ( = ?auto_26099 ?auto_26103 ) ) ( not ( = ?auto_26099 ?auto_26150 ) ) ( not ( = ?auto_26102 ?auto_26103 ) ) ( not ( = ?auto_26102 ?auto_26150 ) ) ( not ( = ?auto_26101 ?auto_26103 ) ) ( not ( = ?auto_26101 ?auto_26150 ) ) ( not ( = ?auto_26103 ?auto_26122 ) ) ( not ( = ?auto_26103 ?auto_26138 ) ) ( not ( = ?auto_26103 ?auto_26116 ) ) ( not ( = ?auto_26103 ?auto_26141 ) ) ( not ( = ?auto_26103 ?auto_26119 ) ) ( not ( = ?auto_26103 ?auto_26133 ) ) ( not ( = ?auto_26103 ?auto_26130 ) ) ( not ( = ?auto_26103 ?auto_26127 ) ) ( not ( = ?auto_26103 ?auto_26136 ) ) ( not ( = ?auto_26151 ?auto_26149 ) ) ( not ( = ?auto_26151 ?auto_26125 ) ) ( not ( = ?auto_26151 ?auto_26144 ) ) ( not ( = ?auto_26151 ?auto_26128 ) ) ( not ( = ?auto_26151 ?auto_26117 ) ) ( not ( = ?auto_26151 ?auto_26113 ) ) ( not ( = ?auto_26151 ?auto_26147 ) ) ( not ( = ?auto_26151 ?auto_26120 ) ) ( not ( = ?auto_26151 ?auto_26124 ) ) ( not ( = ?auto_26145 ?auto_26134 ) ) ( not ( = ?auto_26145 ?auto_26148 ) ) ( not ( = ?auto_26145 ?auto_26135 ) ) ( not ( = ?auto_26145 ?auto_26115 ) ) ( not ( = ?auto_26145 ?auto_26152 ) ) ( not ( = ?auto_26145 ?auto_26109 ) ) ( not ( = ?auto_26145 ?auto_26140 ) ) ( not ( = ?auto_26145 ?auto_26123 ) ) ( not ( = ?auto_26145 ?auto_26142 ) ) ( not ( = ?auto_26150 ?auto_26122 ) ) ( not ( = ?auto_26150 ?auto_26138 ) ) ( not ( = ?auto_26150 ?auto_26116 ) ) ( not ( = ?auto_26150 ?auto_26141 ) ) ( not ( = ?auto_26150 ?auto_26119 ) ) ( not ( = ?auto_26150 ?auto_26133 ) ) ( not ( = ?auto_26150 ?auto_26130 ) ) ( not ( = ?auto_26150 ?auto_26127 ) ) ( not ( = ?auto_26150 ?auto_26136 ) ) ( not ( = ?auto_26093 ?auto_26104 ) ) ( not ( = ?auto_26093 ?auto_26131 ) ) ( not ( = ?auto_26094 ?auto_26104 ) ) ( not ( = ?auto_26094 ?auto_26131 ) ) ( not ( = ?auto_26095 ?auto_26104 ) ) ( not ( = ?auto_26095 ?auto_26131 ) ) ( not ( = ?auto_26096 ?auto_26104 ) ) ( not ( = ?auto_26096 ?auto_26131 ) ) ( not ( = ?auto_26097 ?auto_26104 ) ) ( not ( = ?auto_26097 ?auto_26131 ) ) ( not ( = ?auto_26098 ?auto_26104 ) ) ( not ( = ?auto_26098 ?auto_26131 ) ) ( not ( = ?auto_26099 ?auto_26104 ) ) ( not ( = ?auto_26099 ?auto_26131 ) ) ( not ( = ?auto_26102 ?auto_26104 ) ) ( not ( = ?auto_26102 ?auto_26131 ) ) ( not ( = ?auto_26101 ?auto_26104 ) ) ( not ( = ?auto_26101 ?auto_26131 ) ) ( not ( = ?auto_26100 ?auto_26104 ) ) ( not ( = ?auto_26100 ?auto_26131 ) ) ( not ( = ?auto_26104 ?auto_26150 ) ) ( not ( = ?auto_26104 ?auto_26122 ) ) ( not ( = ?auto_26104 ?auto_26138 ) ) ( not ( = ?auto_26104 ?auto_26116 ) ) ( not ( = ?auto_26104 ?auto_26141 ) ) ( not ( = ?auto_26104 ?auto_26119 ) ) ( not ( = ?auto_26104 ?auto_26133 ) ) ( not ( = ?auto_26104 ?auto_26130 ) ) ( not ( = ?auto_26104 ?auto_26127 ) ) ( not ( = ?auto_26104 ?auto_26136 ) ) ( not ( = ?auto_26131 ?auto_26150 ) ) ( not ( = ?auto_26131 ?auto_26122 ) ) ( not ( = ?auto_26131 ?auto_26138 ) ) ( not ( = ?auto_26131 ?auto_26116 ) ) ( not ( = ?auto_26131 ?auto_26141 ) ) ( not ( = ?auto_26131 ?auto_26119 ) ) ( not ( = ?auto_26131 ?auto_26133 ) ) ( not ( = ?auto_26131 ?auto_26130 ) ) ( not ( = ?auto_26131 ?auto_26127 ) ) ( not ( = ?auto_26131 ?auto_26136 ) ) ( not ( = ?auto_26093 ?auto_26105 ) ) ( not ( = ?auto_26093 ?auto_26118 ) ) ( not ( = ?auto_26094 ?auto_26105 ) ) ( not ( = ?auto_26094 ?auto_26118 ) ) ( not ( = ?auto_26095 ?auto_26105 ) ) ( not ( = ?auto_26095 ?auto_26118 ) ) ( not ( = ?auto_26096 ?auto_26105 ) ) ( not ( = ?auto_26096 ?auto_26118 ) ) ( not ( = ?auto_26097 ?auto_26105 ) ) ( not ( = ?auto_26097 ?auto_26118 ) ) ( not ( = ?auto_26098 ?auto_26105 ) ) ( not ( = ?auto_26098 ?auto_26118 ) ) ( not ( = ?auto_26099 ?auto_26105 ) ) ( not ( = ?auto_26099 ?auto_26118 ) ) ( not ( = ?auto_26102 ?auto_26105 ) ) ( not ( = ?auto_26102 ?auto_26118 ) ) ( not ( = ?auto_26101 ?auto_26105 ) ) ( not ( = ?auto_26101 ?auto_26118 ) ) ( not ( = ?auto_26100 ?auto_26105 ) ) ( not ( = ?auto_26100 ?auto_26118 ) ) ( not ( = ?auto_26103 ?auto_26105 ) ) ( not ( = ?auto_26103 ?auto_26118 ) ) ( not ( = ?auto_26105 ?auto_26131 ) ) ( not ( = ?auto_26105 ?auto_26150 ) ) ( not ( = ?auto_26105 ?auto_26122 ) ) ( not ( = ?auto_26105 ?auto_26138 ) ) ( not ( = ?auto_26105 ?auto_26116 ) ) ( not ( = ?auto_26105 ?auto_26141 ) ) ( not ( = ?auto_26105 ?auto_26119 ) ) ( not ( = ?auto_26105 ?auto_26133 ) ) ( not ( = ?auto_26105 ?auto_26130 ) ) ( not ( = ?auto_26105 ?auto_26127 ) ) ( not ( = ?auto_26105 ?auto_26136 ) ) ( not ( = ?auto_26121 ?auto_26151 ) ) ( not ( = ?auto_26121 ?auto_26149 ) ) ( not ( = ?auto_26121 ?auto_26125 ) ) ( not ( = ?auto_26121 ?auto_26144 ) ) ( not ( = ?auto_26121 ?auto_26128 ) ) ( not ( = ?auto_26121 ?auto_26117 ) ) ( not ( = ?auto_26121 ?auto_26113 ) ) ( not ( = ?auto_26121 ?auto_26147 ) ) ( not ( = ?auto_26121 ?auto_26120 ) ) ( not ( = ?auto_26121 ?auto_26124 ) ) ( not ( = ?auto_26132 ?auto_26145 ) ) ( not ( = ?auto_26132 ?auto_26134 ) ) ( not ( = ?auto_26132 ?auto_26148 ) ) ( not ( = ?auto_26132 ?auto_26135 ) ) ( not ( = ?auto_26132 ?auto_26115 ) ) ( not ( = ?auto_26132 ?auto_26152 ) ) ( not ( = ?auto_26132 ?auto_26109 ) ) ( not ( = ?auto_26132 ?auto_26140 ) ) ( not ( = ?auto_26132 ?auto_26123 ) ) ( not ( = ?auto_26132 ?auto_26142 ) ) ( not ( = ?auto_26118 ?auto_26131 ) ) ( not ( = ?auto_26118 ?auto_26150 ) ) ( not ( = ?auto_26118 ?auto_26122 ) ) ( not ( = ?auto_26118 ?auto_26138 ) ) ( not ( = ?auto_26118 ?auto_26116 ) ) ( not ( = ?auto_26118 ?auto_26141 ) ) ( not ( = ?auto_26118 ?auto_26119 ) ) ( not ( = ?auto_26118 ?auto_26133 ) ) ( not ( = ?auto_26118 ?auto_26130 ) ) ( not ( = ?auto_26118 ?auto_26127 ) ) ( not ( = ?auto_26118 ?auto_26136 ) ) ( not ( = ?auto_26093 ?auto_26106 ) ) ( not ( = ?auto_26093 ?auto_26129 ) ) ( not ( = ?auto_26094 ?auto_26106 ) ) ( not ( = ?auto_26094 ?auto_26129 ) ) ( not ( = ?auto_26095 ?auto_26106 ) ) ( not ( = ?auto_26095 ?auto_26129 ) ) ( not ( = ?auto_26096 ?auto_26106 ) ) ( not ( = ?auto_26096 ?auto_26129 ) ) ( not ( = ?auto_26097 ?auto_26106 ) ) ( not ( = ?auto_26097 ?auto_26129 ) ) ( not ( = ?auto_26098 ?auto_26106 ) ) ( not ( = ?auto_26098 ?auto_26129 ) ) ( not ( = ?auto_26099 ?auto_26106 ) ) ( not ( = ?auto_26099 ?auto_26129 ) ) ( not ( = ?auto_26102 ?auto_26106 ) ) ( not ( = ?auto_26102 ?auto_26129 ) ) ( not ( = ?auto_26101 ?auto_26106 ) ) ( not ( = ?auto_26101 ?auto_26129 ) ) ( not ( = ?auto_26100 ?auto_26106 ) ) ( not ( = ?auto_26100 ?auto_26129 ) ) ( not ( = ?auto_26103 ?auto_26106 ) ) ( not ( = ?auto_26103 ?auto_26129 ) ) ( not ( = ?auto_26104 ?auto_26106 ) ) ( not ( = ?auto_26104 ?auto_26129 ) ) ( not ( = ?auto_26106 ?auto_26118 ) ) ( not ( = ?auto_26106 ?auto_26131 ) ) ( not ( = ?auto_26106 ?auto_26150 ) ) ( not ( = ?auto_26106 ?auto_26122 ) ) ( not ( = ?auto_26106 ?auto_26138 ) ) ( not ( = ?auto_26106 ?auto_26116 ) ) ( not ( = ?auto_26106 ?auto_26141 ) ) ( not ( = ?auto_26106 ?auto_26119 ) ) ( not ( = ?auto_26106 ?auto_26133 ) ) ( not ( = ?auto_26106 ?auto_26130 ) ) ( not ( = ?auto_26106 ?auto_26127 ) ) ( not ( = ?auto_26106 ?auto_26136 ) ) ( not ( = ?auto_26139 ?auto_26121 ) ) ( not ( = ?auto_26139 ?auto_26151 ) ) ( not ( = ?auto_26139 ?auto_26149 ) ) ( not ( = ?auto_26139 ?auto_26125 ) ) ( not ( = ?auto_26139 ?auto_26144 ) ) ( not ( = ?auto_26139 ?auto_26128 ) ) ( not ( = ?auto_26139 ?auto_26117 ) ) ( not ( = ?auto_26139 ?auto_26113 ) ) ( not ( = ?auto_26139 ?auto_26147 ) ) ( not ( = ?auto_26139 ?auto_26120 ) ) ( not ( = ?auto_26139 ?auto_26124 ) ) ( not ( = ?auto_26146 ?auto_26132 ) ) ( not ( = ?auto_26146 ?auto_26145 ) ) ( not ( = ?auto_26146 ?auto_26134 ) ) ( not ( = ?auto_26146 ?auto_26148 ) ) ( not ( = ?auto_26146 ?auto_26135 ) ) ( not ( = ?auto_26146 ?auto_26115 ) ) ( not ( = ?auto_26146 ?auto_26152 ) ) ( not ( = ?auto_26146 ?auto_26109 ) ) ( not ( = ?auto_26146 ?auto_26140 ) ) ( not ( = ?auto_26146 ?auto_26123 ) ) ( not ( = ?auto_26146 ?auto_26142 ) ) ( not ( = ?auto_26129 ?auto_26118 ) ) ( not ( = ?auto_26129 ?auto_26131 ) ) ( not ( = ?auto_26129 ?auto_26150 ) ) ( not ( = ?auto_26129 ?auto_26122 ) ) ( not ( = ?auto_26129 ?auto_26138 ) ) ( not ( = ?auto_26129 ?auto_26116 ) ) ( not ( = ?auto_26129 ?auto_26141 ) ) ( not ( = ?auto_26129 ?auto_26119 ) ) ( not ( = ?auto_26129 ?auto_26133 ) ) ( not ( = ?auto_26129 ?auto_26130 ) ) ( not ( = ?auto_26129 ?auto_26127 ) ) ( not ( = ?auto_26129 ?auto_26136 ) ) ( not ( = ?auto_26093 ?auto_26108 ) ) ( not ( = ?auto_26093 ?auto_26137 ) ) ( not ( = ?auto_26094 ?auto_26108 ) ) ( not ( = ?auto_26094 ?auto_26137 ) ) ( not ( = ?auto_26095 ?auto_26108 ) ) ( not ( = ?auto_26095 ?auto_26137 ) ) ( not ( = ?auto_26096 ?auto_26108 ) ) ( not ( = ?auto_26096 ?auto_26137 ) ) ( not ( = ?auto_26097 ?auto_26108 ) ) ( not ( = ?auto_26097 ?auto_26137 ) ) ( not ( = ?auto_26098 ?auto_26108 ) ) ( not ( = ?auto_26098 ?auto_26137 ) ) ( not ( = ?auto_26099 ?auto_26108 ) ) ( not ( = ?auto_26099 ?auto_26137 ) ) ( not ( = ?auto_26102 ?auto_26108 ) ) ( not ( = ?auto_26102 ?auto_26137 ) ) ( not ( = ?auto_26101 ?auto_26108 ) ) ( not ( = ?auto_26101 ?auto_26137 ) ) ( not ( = ?auto_26100 ?auto_26108 ) ) ( not ( = ?auto_26100 ?auto_26137 ) ) ( not ( = ?auto_26103 ?auto_26108 ) ) ( not ( = ?auto_26103 ?auto_26137 ) ) ( not ( = ?auto_26104 ?auto_26108 ) ) ( not ( = ?auto_26104 ?auto_26137 ) ) ( not ( = ?auto_26105 ?auto_26108 ) ) ( not ( = ?auto_26105 ?auto_26137 ) ) ( not ( = ?auto_26108 ?auto_26129 ) ) ( not ( = ?auto_26108 ?auto_26118 ) ) ( not ( = ?auto_26108 ?auto_26131 ) ) ( not ( = ?auto_26108 ?auto_26150 ) ) ( not ( = ?auto_26108 ?auto_26122 ) ) ( not ( = ?auto_26108 ?auto_26138 ) ) ( not ( = ?auto_26108 ?auto_26116 ) ) ( not ( = ?auto_26108 ?auto_26141 ) ) ( not ( = ?auto_26108 ?auto_26119 ) ) ( not ( = ?auto_26108 ?auto_26133 ) ) ( not ( = ?auto_26108 ?auto_26130 ) ) ( not ( = ?auto_26108 ?auto_26127 ) ) ( not ( = ?auto_26108 ?auto_26136 ) ) ( not ( = ?auto_26126 ?auto_26139 ) ) ( not ( = ?auto_26126 ?auto_26121 ) ) ( not ( = ?auto_26126 ?auto_26151 ) ) ( not ( = ?auto_26126 ?auto_26149 ) ) ( not ( = ?auto_26126 ?auto_26125 ) ) ( not ( = ?auto_26126 ?auto_26144 ) ) ( not ( = ?auto_26126 ?auto_26128 ) ) ( not ( = ?auto_26126 ?auto_26117 ) ) ( not ( = ?auto_26126 ?auto_26113 ) ) ( not ( = ?auto_26126 ?auto_26147 ) ) ( not ( = ?auto_26126 ?auto_26120 ) ) ( not ( = ?auto_26126 ?auto_26124 ) ) ( not ( = ?auto_26143 ?auto_26146 ) ) ( not ( = ?auto_26143 ?auto_26132 ) ) ( not ( = ?auto_26143 ?auto_26145 ) ) ( not ( = ?auto_26143 ?auto_26134 ) ) ( not ( = ?auto_26143 ?auto_26148 ) ) ( not ( = ?auto_26143 ?auto_26135 ) ) ( not ( = ?auto_26143 ?auto_26115 ) ) ( not ( = ?auto_26143 ?auto_26152 ) ) ( not ( = ?auto_26143 ?auto_26109 ) ) ( not ( = ?auto_26143 ?auto_26140 ) ) ( not ( = ?auto_26143 ?auto_26123 ) ) ( not ( = ?auto_26143 ?auto_26142 ) ) ( not ( = ?auto_26137 ?auto_26129 ) ) ( not ( = ?auto_26137 ?auto_26118 ) ) ( not ( = ?auto_26137 ?auto_26131 ) ) ( not ( = ?auto_26137 ?auto_26150 ) ) ( not ( = ?auto_26137 ?auto_26122 ) ) ( not ( = ?auto_26137 ?auto_26138 ) ) ( not ( = ?auto_26137 ?auto_26116 ) ) ( not ( = ?auto_26137 ?auto_26141 ) ) ( not ( = ?auto_26137 ?auto_26119 ) ) ( not ( = ?auto_26137 ?auto_26133 ) ) ( not ( = ?auto_26137 ?auto_26130 ) ) ( not ( = ?auto_26137 ?auto_26127 ) ) ( not ( = ?auto_26137 ?auto_26136 ) ) ( not ( = ?auto_26093 ?auto_26107 ) ) ( not ( = ?auto_26093 ?auto_26114 ) ) ( not ( = ?auto_26094 ?auto_26107 ) ) ( not ( = ?auto_26094 ?auto_26114 ) ) ( not ( = ?auto_26095 ?auto_26107 ) ) ( not ( = ?auto_26095 ?auto_26114 ) ) ( not ( = ?auto_26096 ?auto_26107 ) ) ( not ( = ?auto_26096 ?auto_26114 ) ) ( not ( = ?auto_26097 ?auto_26107 ) ) ( not ( = ?auto_26097 ?auto_26114 ) ) ( not ( = ?auto_26098 ?auto_26107 ) ) ( not ( = ?auto_26098 ?auto_26114 ) ) ( not ( = ?auto_26099 ?auto_26107 ) ) ( not ( = ?auto_26099 ?auto_26114 ) ) ( not ( = ?auto_26102 ?auto_26107 ) ) ( not ( = ?auto_26102 ?auto_26114 ) ) ( not ( = ?auto_26101 ?auto_26107 ) ) ( not ( = ?auto_26101 ?auto_26114 ) ) ( not ( = ?auto_26100 ?auto_26107 ) ) ( not ( = ?auto_26100 ?auto_26114 ) ) ( not ( = ?auto_26103 ?auto_26107 ) ) ( not ( = ?auto_26103 ?auto_26114 ) ) ( not ( = ?auto_26104 ?auto_26107 ) ) ( not ( = ?auto_26104 ?auto_26114 ) ) ( not ( = ?auto_26105 ?auto_26107 ) ) ( not ( = ?auto_26105 ?auto_26114 ) ) ( not ( = ?auto_26106 ?auto_26107 ) ) ( not ( = ?auto_26106 ?auto_26114 ) ) ( not ( = ?auto_26107 ?auto_26137 ) ) ( not ( = ?auto_26107 ?auto_26129 ) ) ( not ( = ?auto_26107 ?auto_26118 ) ) ( not ( = ?auto_26107 ?auto_26131 ) ) ( not ( = ?auto_26107 ?auto_26150 ) ) ( not ( = ?auto_26107 ?auto_26122 ) ) ( not ( = ?auto_26107 ?auto_26138 ) ) ( not ( = ?auto_26107 ?auto_26116 ) ) ( not ( = ?auto_26107 ?auto_26141 ) ) ( not ( = ?auto_26107 ?auto_26119 ) ) ( not ( = ?auto_26107 ?auto_26133 ) ) ( not ( = ?auto_26107 ?auto_26130 ) ) ( not ( = ?auto_26107 ?auto_26127 ) ) ( not ( = ?auto_26107 ?auto_26136 ) ) ( not ( = ?auto_26114 ?auto_26137 ) ) ( not ( = ?auto_26114 ?auto_26129 ) ) ( not ( = ?auto_26114 ?auto_26118 ) ) ( not ( = ?auto_26114 ?auto_26131 ) ) ( not ( = ?auto_26114 ?auto_26150 ) ) ( not ( = ?auto_26114 ?auto_26122 ) ) ( not ( = ?auto_26114 ?auto_26138 ) ) ( not ( = ?auto_26114 ?auto_26116 ) ) ( not ( = ?auto_26114 ?auto_26141 ) ) ( not ( = ?auto_26114 ?auto_26119 ) ) ( not ( = ?auto_26114 ?auto_26133 ) ) ( not ( = ?auto_26114 ?auto_26130 ) ) ( not ( = ?auto_26114 ?auto_26127 ) ) ( not ( = ?auto_26114 ?auto_26136 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_26093 ?auto_26094 ?auto_26095 ?auto_26096 ?auto_26097 ?auto_26098 ?auto_26099 ?auto_26102 ?auto_26101 ?auto_26100 ?auto_26103 ?auto_26104 ?auto_26105 ?auto_26106 ?auto_26108 )
      ( MAKE-1CRATE ?auto_26108 ?auto_26107 )
      ( MAKE-15CRATE-VERIFY ?auto_26093 ?auto_26094 ?auto_26095 ?auto_26096 ?auto_26097 ?auto_26098 ?auto_26099 ?auto_26102 ?auto_26101 ?auto_26100 ?auto_26103 ?auto_26104 ?auto_26105 ?auto_26106 ?auto_26108 ?auto_26107 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26155 - SURFACE
      ?auto_26156 - SURFACE
    )
    :vars
    (
      ?auto_26157 - HOIST
      ?auto_26158 - PLACE
      ?auto_26160 - PLACE
      ?auto_26161 - HOIST
      ?auto_26162 - SURFACE
      ?auto_26159 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26157 ?auto_26158 ) ( SURFACE-AT ?auto_26155 ?auto_26158 ) ( CLEAR ?auto_26155 ) ( IS-CRATE ?auto_26156 ) ( AVAILABLE ?auto_26157 ) ( not ( = ?auto_26160 ?auto_26158 ) ) ( HOIST-AT ?auto_26161 ?auto_26160 ) ( AVAILABLE ?auto_26161 ) ( SURFACE-AT ?auto_26156 ?auto_26160 ) ( ON ?auto_26156 ?auto_26162 ) ( CLEAR ?auto_26156 ) ( TRUCK-AT ?auto_26159 ?auto_26158 ) ( not ( = ?auto_26155 ?auto_26156 ) ) ( not ( = ?auto_26155 ?auto_26162 ) ) ( not ( = ?auto_26156 ?auto_26162 ) ) ( not ( = ?auto_26157 ?auto_26161 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26159 ?auto_26158 ?auto_26160 )
      ( !LIFT ?auto_26161 ?auto_26156 ?auto_26162 ?auto_26160 )
      ( !LOAD ?auto_26161 ?auto_26156 ?auto_26159 ?auto_26160 )
      ( !DRIVE ?auto_26159 ?auto_26160 ?auto_26158 )
      ( !UNLOAD ?auto_26157 ?auto_26156 ?auto_26159 ?auto_26158 )
      ( !DROP ?auto_26157 ?auto_26156 ?auto_26155 ?auto_26158 )
      ( MAKE-1CRATE-VERIFY ?auto_26155 ?auto_26156 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_26180 - SURFACE
      ?auto_26181 - SURFACE
      ?auto_26182 - SURFACE
      ?auto_26183 - SURFACE
      ?auto_26184 - SURFACE
      ?auto_26185 - SURFACE
      ?auto_26186 - SURFACE
      ?auto_26189 - SURFACE
      ?auto_26188 - SURFACE
      ?auto_26187 - SURFACE
      ?auto_26190 - SURFACE
      ?auto_26191 - SURFACE
      ?auto_26192 - SURFACE
      ?auto_26193 - SURFACE
      ?auto_26195 - SURFACE
      ?auto_26194 - SURFACE
      ?auto_26196 - SURFACE
    )
    :vars
    (
      ?auto_26197 - HOIST
      ?auto_26201 - PLACE
      ?auto_26202 - PLACE
      ?auto_26199 - HOIST
      ?auto_26198 - SURFACE
      ?auto_26207 - PLACE
      ?auto_26231 - HOIST
      ?auto_26210 - SURFACE
      ?auto_26223 - PLACE
      ?auto_26235 - HOIST
      ?auto_26236 - SURFACE
      ?auto_26205 - PLACE
      ?auto_26225 - HOIST
      ?auto_26230 - SURFACE
      ?auto_26226 - PLACE
      ?auto_26209 - HOIST
      ?auto_26242 - SURFACE
      ?auto_26234 - PLACE
      ?auto_26219 - HOIST
      ?auto_26227 - SURFACE
      ?auto_26238 - SURFACE
      ?auto_26211 - PLACE
      ?auto_26215 - HOIST
      ?auto_26229 - SURFACE
      ?auto_26217 - PLACE
      ?auto_26232 - HOIST
      ?auto_26241 - SURFACE
      ?auto_26220 - PLACE
      ?auto_26237 - HOIST
      ?auto_26228 - SURFACE
      ?auto_26240 - PLACE
      ?auto_26203 - HOIST
      ?auto_26224 - SURFACE
      ?auto_26206 - PLACE
      ?auto_26221 - HOIST
      ?auto_26212 - SURFACE
      ?auto_26204 - SURFACE
      ?auto_26243 - PLACE
      ?auto_26222 - HOIST
      ?auto_26208 - SURFACE
      ?auto_26216 - PLACE
      ?auto_26214 - HOIST
      ?auto_26213 - SURFACE
      ?auto_26239 - PLACE
      ?auto_26233 - HOIST
      ?auto_26218 - SURFACE
      ?auto_26200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26197 ?auto_26201 ) ( IS-CRATE ?auto_26196 ) ( not ( = ?auto_26202 ?auto_26201 ) ) ( HOIST-AT ?auto_26199 ?auto_26202 ) ( AVAILABLE ?auto_26199 ) ( SURFACE-AT ?auto_26196 ?auto_26202 ) ( ON ?auto_26196 ?auto_26198 ) ( CLEAR ?auto_26196 ) ( not ( = ?auto_26194 ?auto_26196 ) ) ( not ( = ?auto_26194 ?auto_26198 ) ) ( not ( = ?auto_26196 ?auto_26198 ) ) ( not ( = ?auto_26197 ?auto_26199 ) ) ( IS-CRATE ?auto_26194 ) ( not ( = ?auto_26207 ?auto_26201 ) ) ( HOIST-AT ?auto_26231 ?auto_26207 ) ( SURFACE-AT ?auto_26194 ?auto_26207 ) ( ON ?auto_26194 ?auto_26210 ) ( CLEAR ?auto_26194 ) ( not ( = ?auto_26195 ?auto_26194 ) ) ( not ( = ?auto_26195 ?auto_26210 ) ) ( not ( = ?auto_26194 ?auto_26210 ) ) ( not ( = ?auto_26197 ?auto_26231 ) ) ( IS-CRATE ?auto_26195 ) ( not ( = ?auto_26223 ?auto_26201 ) ) ( HOIST-AT ?auto_26235 ?auto_26223 ) ( AVAILABLE ?auto_26235 ) ( SURFACE-AT ?auto_26195 ?auto_26223 ) ( ON ?auto_26195 ?auto_26236 ) ( CLEAR ?auto_26195 ) ( not ( = ?auto_26193 ?auto_26195 ) ) ( not ( = ?auto_26193 ?auto_26236 ) ) ( not ( = ?auto_26195 ?auto_26236 ) ) ( not ( = ?auto_26197 ?auto_26235 ) ) ( IS-CRATE ?auto_26193 ) ( not ( = ?auto_26205 ?auto_26201 ) ) ( HOIST-AT ?auto_26225 ?auto_26205 ) ( AVAILABLE ?auto_26225 ) ( SURFACE-AT ?auto_26193 ?auto_26205 ) ( ON ?auto_26193 ?auto_26230 ) ( CLEAR ?auto_26193 ) ( not ( = ?auto_26192 ?auto_26193 ) ) ( not ( = ?auto_26192 ?auto_26230 ) ) ( not ( = ?auto_26193 ?auto_26230 ) ) ( not ( = ?auto_26197 ?auto_26225 ) ) ( IS-CRATE ?auto_26192 ) ( not ( = ?auto_26226 ?auto_26201 ) ) ( HOIST-AT ?auto_26209 ?auto_26226 ) ( AVAILABLE ?auto_26209 ) ( SURFACE-AT ?auto_26192 ?auto_26226 ) ( ON ?auto_26192 ?auto_26242 ) ( CLEAR ?auto_26192 ) ( not ( = ?auto_26191 ?auto_26192 ) ) ( not ( = ?auto_26191 ?auto_26242 ) ) ( not ( = ?auto_26192 ?auto_26242 ) ) ( not ( = ?auto_26197 ?auto_26209 ) ) ( IS-CRATE ?auto_26191 ) ( not ( = ?auto_26234 ?auto_26201 ) ) ( HOIST-AT ?auto_26219 ?auto_26234 ) ( SURFACE-AT ?auto_26191 ?auto_26234 ) ( ON ?auto_26191 ?auto_26227 ) ( CLEAR ?auto_26191 ) ( not ( = ?auto_26190 ?auto_26191 ) ) ( not ( = ?auto_26190 ?auto_26227 ) ) ( not ( = ?auto_26191 ?auto_26227 ) ) ( not ( = ?auto_26197 ?auto_26219 ) ) ( IS-CRATE ?auto_26190 ) ( AVAILABLE ?auto_26219 ) ( SURFACE-AT ?auto_26190 ?auto_26234 ) ( ON ?auto_26190 ?auto_26238 ) ( CLEAR ?auto_26190 ) ( not ( = ?auto_26187 ?auto_26190 ) ) ( not ( = ?auto_26187 ?auto_26238 ) ) ( not ( = ?auto_26190 ?auto_26238 ) ) ( IS-CRATE ?auto_26187 ) ( not ( = ?auto_26211 ?auto_26201 ) ) ( HOIST-AT ?auto_26215 ?auto_26211 ) ( AVAILABLE ?auto_26215 ) ( SURFACE-AT ?auto_26187 ?auto_26211 ) ( ON ?auto_26187 ?auto_26229 ) ( CLEAR ?auto_26187 ) ( not ( = ?auto_26188 ?auto_26187 ) ) ( not ( = ?auto_26188 ?auto_26229 ) ) ( not ( = ?auto_26187 ?auto_26229 ) ) ( not ( = ?auto_26197 ?auto_26215 ) ) ( IS-CRATE ?auto_26188 ) ( not ( = ?auto_26217 ?auto_26201 ) ) ( HOIST-AT ?auto_26232 ?auto_26217 ) ( AVAILABLE ?auto_26232 ) ( SURFACE-AT ?auto_26188 ?auto_26217 ) ( ON ?auto_26188 ?auto_26241 ) ( CLEAR ?auto_26188 ) ( not ( = ?auto_26189 ?auto_26188 ) ) ( not ( = ?auto_26189 ?auto_26241 ) ) ( not ( = ?auto_26188 ?auto_26241 ) ) ( not ( = ?auto_26197 ?auto_26232 ) ) ( IS-CRATE ?auto_26189 ) ( not ( = ?auto_26220 ?auto_26201 ) ) ( HOIST-AT ?auto_26237 ?auto_26220 ) ( AVAILABLE ?auto_26237 ) ( SURFACE-AT ?auto_26189 ?auto_26220 ) ( ON ?auto_26189 ?auto_26228 ) ( CLEAR ?auto_26189 ) ( not ( = ?auto_26186 ?auto_26189 ) ) ( not ( = ?auto_26186 ?auto_26228 ) ) ( not ( = ?auto_26189 ?auto_26228 ) ) ( not ( = ?auto_26197 ?auto_26237 ) ) ( IS-CRATE ?auto_26186 ) ( not ( = ?auto_26240 ?auto_26201 ) ) ( HOIST-AT ?auto_26203 ?auto_26240 ) ( AVAILABLE ?auto_26203 ) ( SURFACE-AT ?auto_26186 ?auto_26240 ) ( ON ?auto_26186 ?auto_26224 ) ( CLEAR ?auto_26186 ) ( not ( = ?auto_26185 ?auto_26186 ) ) ( not ( = ?auto_26185 ?auto_26224 ) ) ( not ( = ?auto_26186 ?auto_26224 ) ) ( not ( = ?auto_26197 ?auto_26203 ) ) ( IS-CRATE ?auto_26185 ) ( not ( = ?auto_26206 ?auto_26201 ) ) ( HOIST-AT ?auto_26221 ?auto_26206 ) ( AVAILABLE ?auto_26221 ) ( SURFACE-AT ?auto_26185 ?auto_26206 ) ( ON ?auto_26185 ?auto_26212 ) ( CLEAR ?auto_26185 ) ( not ( = ?auto_26184 ?auto_26185 ) ) ( not ( = ?auto_26184 ?auto_26212 ) ) ( not ( = ?auto_26185 ?auto_26212 ) ) ( not ( = ?auto_26197 ?auto_26221 ) ) ( IS-CRATE ?auto_26184 ) ( AVAILABLE ?auto_26231 ) ( SURFACE-AT ?auto_26184 ?auto_26207 ) ( ON ?auto_26184 ?auto_26204 ) ( CLEAR ?auto_26184 ) ( not ( = ?auto_26183 ?auto_26184 ) ) ( not ( = ?auto_26183 ?auto_26204 ) ) ( not ( = ?auto_26184 ?auto_26204 ) ) ( IS-CRATE ?auto_26183 ) ( not ( = ?auto_26243 ?auto_26201 ) ) ( HOIST-AT ?auto_26222 ?auto_26243 ) ( AVAILABLE ?auto_26222 ) ( SURFACE-AT ?auto_26183 ?auto_26243 ) ( ON ?auto_26183 ?auto_26208 ) ( CLEAR ?auto_26183 ) ( not ( = ?auto_26182 ?auto_26183 ) ) ( not ( = ?auto_26182 ?auto_26208 ) ) ( not ( = ?auto_26183 ?auto_26208 ) ) ( not ( = ?auto_26197 ?auto_26222 ) ) ( IS-CRATE ?auto_26182 ) ( not ( = ?auto_26216 ?auto_26201 ) ) ( HOIST-AT ?auto_26214 ?auto_26216 ) ( AVAILABLE ?auto_26214 ) ( SURFACE-AT ?auto_26182 ?auto_26216 ) ( ON ?auto_26182 ?auto_26213 ) ( CLEAR ?auto_26182 ) ( not ( = ?auto_26181 ?auto_26182 ) ) ( not ( = ?auto_26181 ?auto_26213 ) ) ( not ( = ?auto_26182 ?auto_26213 ) ) ( not ( = ?auto_26197 ?auto_26214 ) ) ( SURFACE-AT ?auto_26180 ?auto_26201 ) ( CLEAR ?auto_26180 ) ( IS-CRATE ?auto_26181 ) ( AVAILABLE ?auto_26197 ) ( not ( = ?auto_26239 ?auto_26201 ) ) ( HOIST-AT ?auto_26233 ?auto_26239 ) ( AVAILABLE ?auto_26233 ) ( SURFACE-AT ?auto_26181 ?auto_26239 ) ( ON ?auto_26181 ?auto_26218 ) ( CLEAR ?auto_26181 ) ( TRUCK-AT ?auto_26200 ?auto_26201 ) ( not ( = ?auto_26180 ?auto_26181 ) ) ( not ( = ?auto_26180 ?auto_26218 ) ) ( not ( = ?auto_26181 ?auto_26218 ) ) ( not ( = ?auto_26197 ?auto_26233 ) ) ( not ( = ?auto_26180 ?auto_26182 ) ) ( not ( = ?auto_26180 ?auto_26213 ) ) ( not ( = ?auto_26182 ?auto_26218 ) ) ( not ( = ?auto_26216 ?auto_26239 ) ) ( not ( = ?auto_26214 ?auto_26233 ) ) ( not ( = ?auto_26213 ?auto_26218 ) ) ( not ( = ?auto_26180 ?auto_26183 ) ) ( not ( = ?auto_26180 ?auto_26208 ) ) ( not ( = ?auto_26181 ?auto_26183 ) ) ( not ( = ?auto_26181 ?auto_26208 ) ) ( not ( = ?auto_26183 ?auto_26213 ) ) ( not ( = ?auto_26183 ?auto_26218 ) ) ( not ( = ?auto_26243 ?auto_26216 ) ) ( not ( = ?auto_26243 ?auto_26239 ) ) ( not ( = ?auto_26222 ?auto_26214 ) ) ( not ( = ?auto_26222 ?auto_26233 ) ) ( not ( = ?auto_26208 ?auto_26213 ) ) ( not ( = ?auto_26208 ?auto_26218 ) ) ( not ( = ?auto_26180 ?auto_26184 ) ) ( not ( = ?auto_26180 ?auto_26204 ) ) ( not ( = ?auto_26181 ?auto_26184 ) ) ( not ( = ?auto_26181 ?auto_26204 ) ) ( not ( = ?auto_26182 ?auto_26184 ) ) ( not ( = ?auto_26182 ?auto_26204 ) ) ( not ( = ?auto_26184 ?auto_26208 ) ) ( not ( = ?auto_26184 ?auto_26213 ) ) ( not ( = ?auto_26184 ?auto_26218 ) ) ( not ( = ?auto_26207 ?auto_26243 ) ) ( not ( = ?auto_26207 ?auto_26216 ) ) ( not ( = ?auto_26207 ?auto_26239 ) ) ( not ( = ?auto_26231 ?auto_26222 ) ) ( not ( = ?auto_26231 ?auto_26214 ) ) ( not ( = ?auto_26231 ?auto_26233 ) ) ( not ( = ?auto_26204 ?auto_26208 ) ) ( not ( = ?auto_26204 ?auto_26213 ) ) ( not ( = ?auto_26204 ?auto_26218 ) ) ( not ( = ?auto_26180 ?auto_26185 ) ) ( not ( = ?auto_26180 ?auto_26212 ) ) ( not ( = ?auto_26181 ?auto_26185 ) ) ( not ( = ?auto_26181 ?auto_26212 ) ) ( not ( = ?auto_26182 ?auto_26185 ) ) ( not ( = ?auto_26182 ?auto_26212 ) ) ( not ( = ?auto_26183 ?auto_26185 ) ) ( not ( = ?auto_26183 ?auto_26212 ) ) ( not ( = ?auto_26185 ?auto_26204 ) ) ( not ( = ?auto_26185 ?auto_26208 ) ) ( not ( = ?auto_26185 ?auto_26213 ) ) ( not ( = ?auto_26185 ?auto_26218 ) ) ( not ( = ?auto_26206 ?auto_26207 ) ) ( not ( = ?auto_26206 ?auto_26243 ) ) ( not ( = ?auto_26206 ?auto_26216 ) ) ( not ( = ?auto_26206 ?auto_26239 ) ) ( not ( = ?auto_26221 ?auto_26231 ) ) ( not ( = ?auto_26221 ?auto_26222 ) ) ( not ( = ?auto_26221 ?auto_26214 ) ) ( not ( = ?auto_26221 ?auto_26233 ) ) ( not ( = ?auto_26212 ?auto_26204 ) ) ( not ( = ?auto_26212 ?auto_26208 ) ) ( not ( = ?auto_26212 ?auto_26213 ) ) ( not ( = ?auto_26212 ?auto_26218 ) ) ( not ( = ?auto_26180 ?auto_26186 ) ) ( not ( = ?auto_26180 ?auto_26224 ) ) ( not ( = ?auto_26181 ?auto_26186 ) ) ( not ( = ?auto_26181 ?auto_26224 ) ) ( not ( = ?auto_26182 ?auto_26186 ) ) ( not ( = ?auto_26182 ?auto_26224 ) ) ( not ( = ?auto_26183 ?auto_26186 ) ) ( not ( = ?auto_26183 ?auto_26224 ) ) ( not ( = ?auto_26184 ?auto_26186 ) ) ( not ( = ?auto_26184 ?auto_26224 ) ) ( not ( = ?auto_26186 ?auto_26212 ) ) ( not ( = ?auto_26186 ?auto_26204 ) ) ( not ( = ?auto_26186 ?auto_26208 ) ) ( not ( = ?auto_26186 ?auto_26213 ) ) ( not ( = ?auto_26186 ?auto_26218 ) ) ( not ( = ?auto_26240 ?auto_26206 ) ) ( not ( = ?auto_26240 ?auto_26207 ) ) ( not ( = ?auto_26240 ?auto_26243 ) ) ( not ( = ?auto_26240 ?auto_26216 ) ) ( not ( = ?auto_26240 ?auto_26239 ) ) ( not ( = ?auto_26203 ?auto_26221 ) ) ( not ( = ?auto_26203 ?auto_26231 ) ) ( not ( = ?auto_26203 ?auto_26222 ) ) ( not ( = ?auto_26203 ?auto_26214 ) ) ( not ( = ?auto_26203 ?auto_26233 ) ) ( not ( = ?auto_26224 ?auto_26212 ) ) ( not ( = ?auto_26224 ?auto_26204 ) ) ( not ( = ?auto_26224 ?auto_26208 ) ) ( not ( = ?auto_26224 ?auto_26213 ) ) ( not ( = ?auto_26224 ?auto_26218 ) ) ( not ( = ?auto_26180 ?auto_26189 ) ) ( not ( = ?auto_26180 ?auto_26228 ) ) ( not ( = ?auto_26181 ?auto_26189 ) ) ( not ( = ?auto_26181 ?auto_26228 ) ) ( not ( = ?auto_26182 ?auto_26189 ) ) ( not ( = ?auto_26182 ?auto_26228 ) ) ( not ( = ?auto_26183 ?auto_26189 ) ) ( not ( = ?auto_26183 ?auto_26228 ) ) ( not ( = ?auto_26184 ?auto_26189 ) ) ( not ( = ?auto_26184 ?auto_26228 ) ) ( not ( = ?auto_26185 ?auto_26189 ) ) ( not ( = ?auto_26185 ?auto_26228 ) ) ( not ( = ?auto_26189 ?auto_26224 ) ) ( not ( = ?auto_26189 ?auto_26212 ) ) ( not ( = ?auto_26189 ?auto_26204 ) ) ( not ( = ?auto_26189 ?auto_26208 ) ) ( not ( = ?auto_26189 ?auto_26213 ) ) ( not ( = ?auto_26189 ?auto_26218 ) ) ( not ( = ?auto_26220 ?auto_26240 ) ) ( not ( = ?auto_26220 ?auto_26206 ) ) ( not ( = ?auto_26220 ?auto_26207 ) ) ( not ( = ?auto_26220 ?auto_26243 ) ) ( not ( = ?auto_26220 ?auto_26216 ) ) ( not ( = ?auto_26220 ?auto_26239 ) ) ( not ( = ?auto_26237 ?auto_26203 ) ) ( not ( = ?auto_26237 ?auto_26221 ) ) ( not ( = ?auto_26237 ?auto_26231 ) ) ( not ( = ?auto_26237 ?auto_26222 ) ) ( not ( = ?auto_26237 ?auto_26214 ) ) ( not ( = ?auto_26237 ?auto_26233 ) ) ( not ( = ?auto_26228 ?auto_26224 ) ) ( not ( = ?auto_26228 ?auto_26212 ) ) ( not ( = ?auto_26228 ?auto_26204 ) ) ( not ( = ?auto_26228 ?auto_26208 ) ) ( not ( = ?auto_26228 ?auto_26213 ) ) ( not ( = ?auto_26228 ?auto_26218 ) ) ( not ( = ?auto_26180 ?auto_26188 ) ) ( not ( = ?auto_26180 ?auto_26241 ) ) ( not ( = ?auto_26181 ?auto_26188 ) ) ( not ( = ?auto_26181 ?auto_26241 ) ) ( not ( = ?auto_26182 ?auto_26188 ) ) ( not ( = ?auto_26182 ?auto_26241 ) ) ( not ( = ?auto_26183 ?auto_26188 ) ) ( not ( = ?auto_26183 ?auto_26241 ) ) ( not ( = ?auto_26184 ?auto_26188 ) ) ( not ( = ?auto_26184 ?auto_26241 ) ) ( not ( = ?auto_26185 ?auto_26188 ) ) ( not ( = ?auto_26185 ?auto_26241 ) ) ( not ( = ?auto_26186 ?auto_26188 ) ) ( not ( = ?auto_26186 ?auto_26241 ) ) ( not ( = ?auto_26188 ?auto_26228 ) ) ( not ( = ?auto_26188 ?auto_26224 ) ) ( not ( = ?auto_26188 ?auto_26212 ) ) ( not ( = ?auto_26188 ?auto_26204 ) ) ( not ( = ?auto_26188 ?auto_26208 ) ) ( not ( = ?auto_26188 ?auto_26213 ) ) ( not ( = ?auto_26188 ?auto_26218 ) ) ( not ( = ?auto_26217 ?auto_26220 ) ) ( not ( = ?auto_26217 ?auto_26240 ) ) ( not ( = ?auto_26217 ?auto_26206 ) ) ( not ( = ?auto_26217 ?auto_26207 ) ) ( not ( = ?auto_26217 ?auto_26243 ) ) ( not ( = ?auto_26217 ?auto_26216 ) ) ( not ( = ?auto_26217 ?auto_26239 ) ) ( not ( = ?auto_26232 ?auto_26237 ) ) ( not ( = ?auto_26232 ?auto_26203 ) ) ( not ( = ?auto_26232 ?auto_26221 ) ) ( not ( = ?auto_26232 ?auto_26231 ) ) ( not ( = ?auto_26232 ?auto_26222 ) ) ( not ( = ?auto_26232 ?auto_26214 ) ) ( not ( = ?auto_26232 ?auto_26233 ) ) ( not ( = ?auto_26241 ?auto_26228 ) ) ( not ( = ?auto_26241 ?auto_26224 ) ) ( not ( = ?auto_26241 ?auto_26212 ) ) ( not ( = ?auto_26241 ?auto_26204 ) ) ( not ( = ?auto_26241 ?auto_26208 ) ) ( not ( = ?auto_26241 ?auto_26213 ) ) ( not ( = ?auto_26241 ?auto_26218 ) ) ( not ( = ?auto_26180 ?auto_26187 ) ) ( not ( = ?auto_26180 ?auto_26229 ) ) ( not ( = ?auto_26181 ?auto_26187 ) ) ( not ( = ?auto_26181 ?auto_26229 ) ) ( not ( = ?auto_26182 ?auto_26187 ) ) ( not ( = ?auto_26182 ?auto_26229 ) ) ( not ( = ?auto_26183 ?auto_26187 ) ) ( not ( = ?auto_26183 ?auto_26229 ) ) ( not ( = ?auto_26184 ?auto_26187 ) ) ( not ( = ?auto_26184 ?auto_26229 ) ) ( not ( = ?auto_26185 ?auto_26187 ) ) ( not ( = ?auto_26185 ?auto_26229 ) ) ( not ( = ?auto_26186 ?auto_26187 ) ) ( not ( = ?auto_26186 ?auto_26229 ) ) ( not ( = ?auto_26189 ?auto_26187 ) ) ( not ( = ?auto_26189 ?auto_26229 ) ) ( not ( = ?auto_26187 ?auto_26241 ) ) ( not ( = ?auto_26187 ?auto_26228 ) ) ( not ( = ?auto_26187 ?auto_26224 ) ) ( not ( = ?auto_26187 ?auto_26212 ) ) ( not ( = ?auto_26187 ?auto_26204 ) ) ( not ( = ?auto_26187 ?auto_26208 ) ) ( not ( = ?auto_26187 ?auto_26213 ) ) ( not ( = ?auto_26187 ?auto_26218 ) ) ( not ( = ?auto_26211 ?auto_26217 ) ) ( not ( = ?auto_26211 ?auto_26220 ) ) ( not ( = ?auto_26211 ?auto_26240 ) ) ( not ( = ?auto_26211 ?auto_26206 ) ) ( not ( = ?auto_26211 ?auto_26207 ) ) ( not ( = ?auto_26211 ?auto_26243 ) ) ( not ( = ?auto_26211 ?auto_26216 ) ) ( not ( = ?auto_26211 ?auto_26239 ) ) ( not ( = ?auto_26215 ?auto_26232 ) ) ( not ( = ?auto_26215 ?auto_26237 ) ) ( not ( = ?auto_26215 ?auto_26203 ) ) ( not ( = ?auto_26215 ?auto_26221 ) ) ( not ( = ?auto_26215 ?auto_26231 ) ) ( not ( = ?auto_26215 ?auto_26222 ) ) ( not ( = ?auto_26215 ?auto_26214 ) ) ( not ( = ?auto_26215 ?auto_26233 ) ) ( not ( = ?auto_26229 ?auto_26241 ) ) ( not ( = ?auto_26229 ?auto_26228 ) ) ( not ( = ?auto_26229 ?auto_26224 ) ) ( not ( = ?auto_26229 ?auto_26212 ) ) ( not ( = ?auto_26229 ?auto_26204 ) ) ( not ( = ?auto_26229 ?auto_26208 ) ) ( not ( = ?auto_26229 ?auto_26213 ) ) ( not ( = ?auto_26229 ?auto_26218 ) ) ( not ( = ?auto_26180 ?auto_26190 ) ) ( not ( = ?auto_26180 ?auto_26238 ) ) ( not ( = ?auto_26181 ?auto_26190 ) ) ( not ( = ?auto_26181 ?auto_26238 ) ) ( not ( = ?auto_26182 ?auto_26190 ) ) ( not ( = ?auto_26182 ?auto_26238 ) ) ( not ( = ?auto_26183 ?auto_26190 ) ) ( not ( = ?auto_26183 ?auto_26238 ) ) ( not ( = ?auto_26184 ?auto_26190 ) ) ( not ( = ?auto_26184 ?auto_26238 ) ) ( not ( = ?auto_26185 ?auto_26190 ) ) ( not ( = ?auto_26185 ?auto_26238 ) ) ( not ( = ?auto_26186 ?auto_26190 ) ) ( not ( = ?auto_26186 ?auto_26238 ) ) ( not ( = ?auto_26189 ?auto_26190 ) ) ( not ( = ?auto_26189 ?auto_26238 ) ) ( not ( = ?auto_26188 ?auto_26190 ) ) ( not ( = ?auto_26188 ?auto_26238 ) ) ( not ( = ?auto_26190 ?auto_26229 ) ) ( not ( = ?auto_26190 ?auto_26241 ) ) ( not ( = ?auto_26190 ?auto_26228 ) ) ( not ( = ?auto_26190 ?auto_26224 ) ) ( not ( = ?auto_26190 ?auto_26212 ) ) ( not ( = ?auto_26190 ?auto_26204 ) ) ( not ( = ?auto_26190 ?auto_26208 ) ) ( not ( = ?auto_26190 ?auto_26213 ) ) ( not ( = ?auto_26190 ?auto_26218 ) ) ( not ( = ?auto_26234 ?auto_26211 ) ) ( not ( = ?auto_26234 ?auto_26217 ) ) ( not ( = ?auto_26234 ?auto_26220 ) ) ( not ( = ?auto_26234 ?auto_26240 ) ) ( not ( = ?auto_26234 ?auto_26206 ) ) ( not ( = ?auto_26234 ?auto_26207 ) ) ( not ( = ?auto_26234 ?auto_26243 ) ) ( not ( = ?auto_26234 ?auto_26216 ) ) ( not ( = ?auto_26234 ?auto_26239 ) ) ( not ( = ?auto_26219 ?auto_26215 ) ) ( not ( = ?auto_26219 ?auto_26232 ) ) ( not ( = ?auto_26219 ?auto_26237 ) ) ( not ( = ?auto_26219 ?auto_26203 ) ) ( not ( = ?auto_26219 ?auto_26221 ) ) ( not ( = ?auto_26219 ?auto_26231 ) ) ( not ( = ?auto_26219 ?auto_26222 ) ) ( not ( = ?auto_26219 ?auto_26214 ) ) ( not ( = ?auto_26219 ?auto_26233 ) ) ( not ( = ?auto_26238 ?auto_26229 ) ) ( not ( = ?auto_26238 ?auto_26241 ) ) ( not ( = ?auto_26238 ?auto_26228 ) ) ( not ( = ?auto_26238 ?auto_26224 ) ) ( not ( = ?auto_26238 ?auto_26212 ) ) ( not ( = ?auto_26238 ?auto_26204 ) ) ( not ( = ?auto_26238 ?auto_26208 ) ) ( not ( = ?auto_26238 ?auto_26213 ) ) ( not ( = ?auto_26238 ?auto_26218 ) ) ( not ( = ?auto_26180 ?auto_26191 ) ) ( not ( = ?auto_26180 ?auto_26227 ) ) ( not ( = ?auto_26181 ?auto_26191 ) ) ( not ( = ?auto_26181 ?auto_26227 ) ) ( not ( = ?auto_26182 ?auto_26191 ) ) ( not ( = ?auto_26182 ?auto_26227 ) ) ( not ( = ?auto_26183 ?auto_26191 ) ) ( not ( = ?auto_26183 ?auto_26227 ) ) ( not ( = ?auto_26184 ?auto_26191 ) ) ( not ( = ?auto_26184 ?auto_26227 ) ) ( not ( = ?auto_26185 ?auto_26191 ) ) ( not ( = ?auto_26185 ?auto_26227 ) ) ( not ( = ?auto_26186 ?auto_26191 ) ) ( not ( = ?auto_26186 ?auto_26227 ) ) ( not ( = ?auto_26189 ?auto_26191 ) ) ( not ( = ?auto_26189 ?auto_26227 ) ) ( not ( = ?auto_26188 ?auto_26191 ) ) ( not ( = ?auto_26188 ?auto_26227 ) ) ( not ( = ?auto_26187 ?auto_26191 ) ) ( not ( = ?auto_26187 ?auto_26227 ) ) ( not ( = ?auto_26191 ?auto_26238 ) ) ( not ( = ?auto_26191 ?auto_26229 ) ) ( not ( = ?auto_26191 ?auto_26241 ) ) ( not ( = ?auto_26191 ?auto_26228 ) ) ( not ( = ?auto_26191 ?auto_26224 ) ) ( not ( = ?auto_26191 ?auto_26212 ) ) ( not ( = ?auto_26191 ?auto_26204 ) ) ( not ( = ?auto_26191 ?auto_26208 ) ) ( not ( = ?auto_26191 ?auto_26213 ) ) ( not ( = ?auto_26191 ?auto_26218 ) ) ( not ( = ?auto_26227 ?auto_26238 ) ) ( not ( = ?auto_26227 ?auto_26229 ) ) ( not ( = ?auto_26227 ?auto_26241 ) ) ( not ( = ?auto_26227 ?auto_26228 ) ) ( not ( = ?auto_26227 ?auto_26224 ) ) ( not ( = ?auto_26227 ?auto_26212 ) ) ( not ( = ?auto_26227 ?auto_26204 ) ) ( not ( = ?auto_26227 ?auto_26208 ) ) ( not ( = ?auto_26227 ?auto_26213 ) ) ( not ( = ?auto_26227 ?auto_26218 ) ) ( not ( = ?auto_26180 ?auto_26192 ) ) ( not ( = ?auto_26180 ?auto_26242 ) ) ( not ( = ?auto_26181 ?auto_26192 ) ) ( not ( = ?auto_26181 ?auto_26242 ) ) ( not ( = ?auto_26182 ?auto_26192 ) ) ( not ( = ?auto_26182 ?auto_26242 ) ) ( not ( = ?auto_26183 ?auto_26192 ) ) ( not ( = ?auto_26183 ?auto_26242 ) ) ( not ( = ?auto_26184 ?auto_26192 ) ) ( not ( = ?auto_26184 ?auto_26242 ) ) ( not ( = ?auto_26185 ?auto_26192 ) ) ( not ( = ?auto_26185 ?auto_26242 ) ) ( not ( = ?auto_26186 ?auto_26192 ) ) ( not ( = ?auto_26186 ?auto_26242 ) ) ( not ( = ?auto_26189 ?auto_26192 ) ) ( not ( = ?auto_26189 ?auto_26242 ) ) ( not ( = ?auto_26188 ?auto_26192 ) ) ( not ( = ?auto_26188 ?auto_26242 ) ) ( not ( = ?auto_26187 ?auto_26192 ) ) ( not ( = ?auto_26187 ?auto_26242 ) ) ( not ( = ?auto_26190 ?auto_26192 ) ) ( not ( = ?auto_26190 ?auto_26242 ) ) ( not ( = ?auto_26192 ?auto_26227 ) ) ( not ( = ?auto_26192 ?auto_26238 ) ) ( not ( = ?auto_26192 ?auto_26229 ) ) ( not ( = ?auto_26192 ?auto_26241 ) ) ( not ( = ?auto_26192 ?auto_26228 ) ) ( not ( = ?auto_26192 ?auto_26224 ) ) ( not ( = ?auto_26192 ?auto_26212 ) ) ( not ( = ?auto_26192 ?auto_26204 ) ) ( not ( = ?auto_26192 ?auto_26208 ) ) ( not ( = ?auto_26192 ?auto_26213 ) ) ( not ( = ?auto_26192 ?auto_26218 ) ) ( not ( = ?auto_26226 ?auto_26234 ) ) ( not ( = ?auto_26226 ?auto_26211 ) ) ( not ( = ?auto_26226 ?auto_26217 ) ) ( not ( = ?auto_26226 ?auto_26220 ) ) ( not ( = ?auto_26226 ?auto_26240 ) ) ( not ( = ?auto_26226 ?auto_26206 ) ) ( not ( = ?auto_26226 ?auto_26207 ) ) ( not ( = ?auto_26226 ?auto_26243 ) ) ( not ( = ?auto_26226 ?auto_26216 ) ) ( not ( = ?auto_26226 ?auto_26239 ) ) ( not ( = ?auto_26209 ?auto_26219 ) ) ( not ( = ?auto_26209 ?auto_26215 ) ) ( not ( = ?auto_26209 ?auto_26232 ) ) ( not ( = ?auto_26209 ?auto_26237 ) ) ( not ( = ?auto_26209 ?auto_26203 ) ) ( not ( = ?auto_26209 ?auto_26221 ) ) ( not ( = ?auto_26209 ?auto_26231 ) ) ( not ( = ?auto_26209 ?auto_26222 ) ) ( not ( = ?auto_26209 ?auto_26214 ) ) ( not ( = ?auto_26209 ?auto_26233 ) ) ( not ( = ?auto_26242 ?auto_26227 ) ) ( not ( = ?auto_26242 ?auto_26238 ) ) ( not ( = ?auto_26242 ?auto_26229 ) ) ( not ( = ?auto_26242 ?auto_26241 ) ) ( not ( = ?auto_26242 ?auto_26228 ) ) ( not ( = ?auto_26242 ?auto_26224 ) ) ( not ( = ?auto_26242 ?auto_26212 ) ) ( not ( = ?auto_26242 ?auto_26204 ) ) ( not ( = ?auto_26242 ?auto_26208 ) ) ( not ( = ?auto_26242 ?auto_26213 ) ) ( not ( = ?auto_26242 ?auto_26218 ) ) ( not ( = ?auto_26180 ?auto_26193 ) ) ( not ( = ?auto_26180 ?auto_26230 ) ) ( not ( = ?auto_26181 ?auto_26193 ) ) ( not ( = ?auto_26181 ?auto_26230 ) ) ( not ( = ?auto_26182 ?auto_26193 ) ) ( not ( = ?auto_26182 ?auto_26230 ) ) ( not ( = ?auto_26183 ?auto_26193 ) ) ( not ( = ?auto_26183 ?auto_26230 ) ) ( not ( = ?auto_26184 ?auto_26193 ) ) ( not ( = ?auto_26184 ?auto_26230 ) ) ( not ( = ?auto_26185 ?auto_26193 ) ) ( not ( = ?auto_26185 ?auto_26230 ) ) ( not ( = ?auto_26186 ?auto_26193 ) ) ( not ( = ?auto_26186 ?auto_26230 ) ) ( not ( = ?auto_26189 ?auto_26193 ) ) ( not ( = ?auto_26189 ?auto_26230 ) ) ( not ( = ?auto_26188 ?auto_26193 ) ) ( not ( = ?auto_26188 ?auto_26230 ) ) ( not ( = ?auto_26187 ?auto_26193 ) ) ( not ( = ?auto_26187 ?auto_26230 ) ) ( not ( = ?auto_26190 ?auto_26193 ) ) ( not ( = ?auto_26190 ?auto_26230 ) ) ( not ( = ?auto_26191 ?auto_26193 ) ) ( not ( = ?auto_26191 ?auto_26230 ) ) ( not ( = ?auto_26193 ?auto_26242 ) ) ( not ( = ?auto_26193 ?auto_26227 ) ) ( not ( = ?auto_26193 ?auto_26238 ) ) ( not ( = ?auto_26193 ?auto_26229 ) ) ( not ( = ?auto_26193 ?auto_26241 ) ) ( not ( = ?auto_26193 ?auto_26228 ) ) ( not ( = ?auto_26193 ?auto_26224 ) ) ( not ( = ?auto_26193 ?auto_26212 ) ) ( not ( = ?auto_26193 ?auto_26204 ) ) ( not ( = ?auto_26193 ?auto_26208 ) ) ( not ( = ?auto_26193 ?auto_26213 ) ) ( not ( = ?auto_26193 ?auto_26218 ) ) ( not ( = ?auto_26205 ?auto_26226 ) ) ( not ( = ?auto_26205 ?auto_26234 ) ) ( not ( = ?auto_26205 ?auto_26211 ) ) ( not ( = ?auto_26205 ?auto_26217 ) ) ( not ( = ?auto_26205 ?auto_26220 ) ) ( not ( = ?auto_26205 ?auto_26240 ) ) ( not ( = ?auto_26205 ?auto_26206 ) ) ( not ( = ?auto_26205 ?auto_26207 ) ) ( not ( = ?auto_26205 ?auto_26243 ) ) ( not ( = ?auto_26205 ?auto_26216 ) ) ( not ( = ?auto_26205 ?auto_26239 ) ) ( not ( = ?auto_26225 ?auto_26209 ) ) ( not ( = ?auto_26225 ?auto_26219 ) ) ( not ( = ?auto_26225 ?auto_26215 ) ) ( not ( = ?auto_26225 ?auto_26232 ) ) ( not ( = ?auto_26225 ?auto_26237 ) ) ( not ( = ?auto_26225 ?auto_26203 ) ) ( not ( = ?auto_26225 ?auto_26221 ) ) ( not ( = ?auto_26225 ?auto_26231 ) ) ( not ( = ?auto_26225 ?auto_26222 ) ) ( not ( = ?auto_26225 ?auto_26214 ) ) ( not ( = ?auto_26225 ?auto_26233 ) ) ( not ( = ?auto_26230 ?auto_26242 ) ) ( not ( = ?auto_26230 ?auto_26227 ) ) ( not ( = ?auto_26230 ?auto_26238 ) ) ( not ( = ?auto_26230 ?auto_26229 ) ) ( not ( = ?auto_26230 ?auto_26241 ) ) ( not ( = ?auto_26230 ?auto_26228 ) ) ( not ( = ?auto_26230 ?auto_26224 ) ) ( not ( = ?auto_26230 ?auto_26212 ) ) ( not ( = ?auto_26230 ?auto_26204 ) ) ( not ( = ?auto_26230 ?auto_26208 ) ) ( not ( = ?auto_26230 ?auto_26213 ) ) ( not ( = ?auto_26230 ?auto_26218 ) ) ( not ( = ?auto_26180 ?auto_26195 ) ) ( not ( = ?auto_26180 ?auto_26236 ) ) ( not ( = ?auto_26181 ?auto_26195 ) ) ( not ( = ?auto_26181 ?auto_26236 ) ) ( not ( = ?auto_26182 ?auto_26195 ) ) ( not ( = ?auto_26182 ?auto_26236 ) ) ( not ( = ?auto_26183 ?auto_26195 ) ) ( not ( = ?auto_26183 ?auto_26236 ) ) ( not ( = ?auto_26184 ?auto_26195 ) ) ( not ( = ?auto_26184 ?auto_26236 ) ) ( not ( = ?auto_26185 ?auto_26195 ) ) ( not ( = ?auto_26185 ?auto_26236 ) ) ( not ( = ?auto_26186 ?auto_26195 ) ) ( not ( = ?auto_26186 ?auto_26236 ) ) ( not ( = ?auto_26189 ?auto_26195 ) ) ( not ( = ?auto_26189 ?auto_26236 ) ) ( not ( = ?auto_26188 ?auto_26195 ) ) ( not ( = ?auto_26188 ?auto_26236 ) ) ( not ( = ?auto_26187 ?auto_26195 ) ) ( not ( = ?auto_26187 ?auto_26236 ) ) ( not ( = ?auto_26190 ?auto_26195 ) ) ( not ( = ?auto_26190 ?auto_26236 ) ) ( not ( = ?auto_26191 ?auto_26195 ) ) ( not ( = ?auto_26191 ?auto_26236 ) ) ( not ( = ?auto_26192 ?auto_26195 ) ) ( not ( = ?auto_26192 ?auto_26236 ) ) ( not ( = ?auto_26195 ?auto_26230 ) ) ( not ( = ?auto_26195 ?auto_26242 ) ) ( not ( = ?auto_26195 ?auto_26227 ) ) ( not ( = ?auto_26195 ?auto_26238 ) ) ( not ( = ?auto_26195 ?auto_26229 ) ) ( not ( = ?auto_26195 ?auto_26241 ) ) ( not ( = ?auto_26195 ?auto_26228 ) ) ( not ( = ?auto_26195 ?auto_26224 ) ) ( not ( = ?auto_26195 ?auto_26212 ) ) ( not ( = ?auto_26195 ?auto_26204 ) ) ( not ( = ?auto_26195 ?auto_26208 ) ) ( not ( = ?auto_26195 ?auto_26213 ) ) ( not ( = ?auto_26195 ?auto_26218 ) ) ( not ( = ?auto_26223 ?auto_26205 ) ) ( not ( = ?auto_26223 ?auto_26226 ) ) ( not ( = ?auto_26223 ?auto_26234 ) ) ( not ( = ?auto_26223 ?auto_26211 ) ) ( not ( = ?auto_26223 ?auto_26217 ) ) ( not ( = ?auto_26223 ?auto_26220 ) ) ( not ( = ?auto_26223 ?auto_26240 ) ) ( not ( = ?auto_26223 ?auto_26206 ) ) ( not ( = ?auto_26223 ?auto_26207 ) ) ( not ( = ?auto_26223 ?auto_26243 ) ) ( not ( = ?auto_26223 ?auto_26216 ) ) ( not ( = ?auto_26223 ?auto_26239 ) ) ( not ( = ?auto_26235 ?auto_26225 ) ) ( not ( = ?auto_26235 ?auto_26209 ) ) ( not ( = ?auto_26235 ?auto_26219 ) ) ( not ( = ?auto_26235 ?auto_26215 ) ) ( not ( = ?auto_26235 ?auto_26232 ) ) ( not ( = ?auto_26235 ?auto_26237 ) ) ( not ( = ?auto_26235 ?auto_26203 ) ) ( not ( = ?auto_26235 ?auto_26221 ) ) ( not ( = ?auto_26235 ?auto_26231 ) ) ( not ( = ?auto_26235 ?auto_26222 ) ) ( not ( = ?auto_26235 ?auto_26214 ) ) ( not ( = ?auto_26235 ?auto_26233 ) ) ( not ( = ?auto_26236 ?auto_26230 ) ) ( not ( = ?auto_26236 ?auto_26242 ) ) ( not ( = ?auto_26236 ?auto_26227 ) ) ( not ( = ?auto_26236 ?auto_26238 ) ) ( not ( = ?auto_26236 ?auto_26229 ) ) ( not ( = ?auto_26236 ?auto_26241 ) ) ( not ( = ?auto_26236 ?auto_26228 ) ) ( not ( = ?auto_26236 ?auto_26224 ) ) ( not ( = ?auto_26236 ?auto_26212 ) ) ( not ( = ?auto_26236 ?auto_26204 ) ) ( not ( = ?auto_26236 ?auto_26208 ) ) ( not ( = ?auto_26236 ?auto_26213 ) ) ( not ( = ?auto_26236 ?auto_26218 ) ) ( not ( = ?auto_26180 ?auto_26194 ) ) ( not ( = ?auto_26180 ?auto_26210 ) ) ( not ( = ?auto_26181 ?auto_26194 ) ) ( not ( = ?auto_26181 ?auto_26210 ) ) ( not ( = ?auto_26182 ?auto_26194 ) ) ( not ( = ?auto_26182 ?auto_26210 ) ) ( not ( = ?auto_26183 ?auto_26194 ) ) ( not ( = ?auto_26183 ?auto_26210 ) ) ( not ( = ?auto_26184 ?auto_26194 ) ) ( not ( = ?auto_26184 ?auto_26210 ) ) ( not ( = ?auto_26185 ?auto_26194 ) ) ( not ( = ?auto_26185 ?auto_26210 ) ) ( not ( = ?auto_26186 ?auto_26194 ) ) ( not ( = ?auto_26186 ?auto_26210 ) ) ( not ( = ?auto_26189 ?auto_26194 ) ) ( not ( = ?auto_26189 ?auto_26210 ) ) ( not ( = ?auto_26188 ?auto_26194 ) ) ( not ( = ?auto_26188 ?auto_26210 ) ) ( not ( = ?auto_26187 ?auto_26194 ) ) ( not ( = ?auto_26187 ?auto_26210 ) ) ( not ( = ?auto_26190 ?auto_26194 ) ) ( not ( = ?auto_26190 ?auto_26210 ) ) ( not ( = ?auto_26191 ?auto_26194 ) ) ( not ( = ?auto_26191 ?auto_26210 ) ) ( not ( = ?auto_26192 ?auto_26194 ) ) ( not ( = ?auto_26192 ?auto_26210 ) ) ( not ( = ?auto_26193 ?auto_26194 ) ) ( not ( = ?auto_26193 ?auto_26210 ) ) ( not ( = ?auto_26194 ?auto_26236 ) ) ( not ( = ?auto_26194 ?auto_26230 ) ) ( not ( = ?auto_26194 ?auto_26242 ) ) ( not ( = ?auto_26194 ?auto_26227 ) ) ( not ( = ?auto_26194 ?auto_26238 ) ) ( not ( = ?auto_26194 ?auto_26229 ) ) ( not ( = ?auto_26194 ?auto_26241 ) ) ( not ( = ?auto_26194 ?auto_26228 ) ) ( not ( = ?auto_26194 ?auto_26224 ) ) ( not ( = ?auto_26194 ?auto_26212 ) ) ( not ( = ?auto_26194 ?auto_26204 ) ) ( not ( = ?auto_26194 ?auto_26208 ) ) ( not ( = ?auto_26194 ?auto_26213 ) ) ( not ( = ?auto_26194 ?auto_26218 ) ) ( not ( = ?auto_26210 ?auto_26236 ) ) ( not ( = ?auto_26210 ?auto_26230 ) ) ( not ( = ?auto_26210 ?auto_26242 ) ) ( not ( = ?auto_26210 ?auto_26227 ) ) ( not ( = ?auto_26210 ?auto_26238 ) ) ( not ( = ?auto_26210 ?auto_26229 ) ) ( not ( = ?auto_26210 ?auto_26241 ) ) ( not ( = ?auto_26210 ?auto_26228 ) ) ( not ( = ?auto_26210 ?auto_26224 ) ) ( not ( = ?auto_26210 ?auto_26212 ) ) ( not ( = ?auto_26210 ?auto_26204 ) ) ( not ( = ?auto_26210 ?auto_26208 ) ) ( not ( = ?auto_26210 ?auto_26213 ) ) ( not ( = ?auto_26210 ?auto_26218 ) ) ( not ( = ?auto_26180 ?auto_26196 ) ) ( not ( = ?auto_26180 ?auto_26198 ) ) ( not ( = ?auto_26181 ?auto_26196 ) ) ( not ( = ?auto_26181 ?auto_26198 ) ) ( not ( = ?auto_26182 ?auto_26196 ) ) ( not ( = ?auto_26182 ?auto_26198 ) ) ( not ( = ?auto_26183 ?auto_26196 ) ) ( not ( = ?auto_26183 ?auto_26198 ) ) ( not ( = ?auto_26184 ?auto_26196 ) ) ( not ( = ?auto_26184 ?auto_26198 ) ) ( not ( = ?auto_26185 ?auto_26196 ) ) ( not ( = ?auto_26185 ?auto_26198 ) ) ( not ( = ?auto_26186 ?auto_26196 ) ) ( not ( = ?auto_26186 ?auto_26198 ) ) ( not ( = ?auto_26189 ?auto_26196 ) ) ( not ( = ?auto_26189 ?auto_26198 ) ) ( not ( = ?auto_26188 ?auto_26196 ) ) ( not ( = ?auto_26188 ?auto_26198 ) ) ( not ( = ?auto_26187 ?auto_26196 ) ) ( not ( = ?auto_26187 ?auto_26198 ) ) ( not ( = ?auto_26190 ?auto_26196 ) ) ( not ( = ?auto_26190 ?auto_26198 ) ) ( not ( = ?auto_26191 ?auto_26196 ) ) ( not ( = ?auto_26191 ?auto_26198 ) ) ( not ( = ?auto_26192 ?auto_26196 ) ) ( not ( = ?auto_26192 ?auto_26198 ) ) ( not ( = ?auto_26193 ?auto_26196 ) ) ( not ( = ?auto_26193 ?auto_26198 ) ) ( not ( = ?auto_26195 ?auto_26196 ) ) ( not ( = ?auto_26195 ?auto_26198 ) ) ( not ( = ?auto_26196 ?auto_26210 ) ) ( not ( = ?auto_26196 ?auto_26236 ) ) ( not ( = ?auto_26196 ?auto_26230 ) ) ( not ( = ?auto_26196 ?auto_26242 ) ) ( not ( = ?auto_26196 ?auto_26227 ) ) ( not ( = ?auto_26196 ?auto_26238 ) ) ( not ( = ?auto_26196 ?auto_26229 ) ) ( not ( = ?auto_26196 ?auto_26241 ) ) ( not ( = ?auto_26196 ?auto_26228 ) ) ( not ( = ?auto_26196 ?auto_26224 ) ) ( not ( = ?auto_26196 ?auto_26212 ) ) ( not ( = ?auto_26196 ?auto_26204 ) ) ( not ( = ?auto_26196 ?auto_26208 ) ) ( not ( = ?auto_26196 ?auto_26213 ) ) ( not ( = ?auto_26196 ?auto_26218 ) ) ( not ( = ?auto_26202 ?auto_26207 ) ) ( not ( = ?auto_26202 ?auto_26223 ) ) ( not ( = ?auto_26202 ?auto_26205 ) ) ( not ( = ?auto_26202 ?auto_26226 ) ) ( not ( = ?auto_26202 ?auto_26234 ) ) ( not ( = ?auto_26202 ?auto_26211 ) ) ( not ( = ?auto_26202 ?auto_26217 ) ) ( not ( = ?auto_26202 ?auto_26220 ) ) ( not ( = ?auto_26202 ?auto_26240 ) ) ( not ( = ?auto_26202 ?auto_26206 ) ) ( not ( = ?auto_26202 ?auto_26243 ) ) ( not ( = ?auto_26202 ?auto_26216 ) ) ( not ( = ?auto_26202 ?auto_26239 ) ) ( not ( = ?auto_26199 ?auto_26231 ) ) ( not ( = ?auto_26199 ?auto_26235 ) ) ( not ( = ?auto_26199 ?auto_26225 ) ) ( not ( = ?auto_26199 ?auto_26209 ) ) ( not ( = ?auto_26199 ?auto_26219 ) ) ( not ( = ?auto_26199 ?auto_26215 ) ) ( not ( = ?auto_26199 ?auto_26232 ) ) ( not ( = ?auto_26199 ?auto_26237 ) ) ( not ( = ?auto_26199 ?auto_26203 ) ) ( not ( = ?auto_26199 ?auto_26221 ) ) ( not ( = ?auto_26199 ?auto_26222 ) ) ( not ( = ?auto_26199 ?auto_26214 ) ) ( not ( = ?auto_26199 ?auto_26233 ) ) ( not ( = ?auto_26198 ?auto_26210 ) ) ( not ( = ?auto_26198 ?auto_26236 ) ) ( not ( = ?auto_26198 ?auto_26230 ) ) ( not ( = ?auto_26198 ?auto_26242 ) ) ( not ( = ?auto_26198 ?auto_26227 ) ) ( not ( = ?auto_26198 ?auto_26238 ) ) ( not ( = ?auto_26198 ?auto_26229 ) ) ( not ( = ?auto_26198 ?auto_26241 ) ) ( not ( = ?auto_26198 ?auto_26228 ) ) ( not ( = ?auto_26198 ?auto_26224 ) ) ( not ( = ?auto_26198 ?auto_26212 ) ) ( not ( = ?auto_26198 ?auto_26204 ) ) ( not ( = ?auto_26198 ?auto_26208 ) ) ( not ( = ?auto_26198 ?auto_26213 ) ) ( not ( = ?auto_26198 ?auto_26218 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_26180 ?auto_26181 ?auto_26182 ?auto_26183 ?auto_26184 ?auto_26185 ?auto_26186 ?auto_26189 ?auto_26188 ?auto_26187 ?auto_26190 ?auto_26191 ?auto_26192 ?auto_26193 ?auto_26195 ?auto_26194 )
      ( MAKE-1CRATE ?auto_26194 ?auto_26196 )
      ( MAKE-16CRATE-VERIFY ?auto_26180 ?auto_26181 ?auto_26182 ?auto_26183 ?auto_26184 ?auto_26185 ?auto_26186 ?auto_26189 ?auto_26188 ?auto_26187 ?auto_26190 ?auto_26191 ?auto_26192 ?auto_26193 ?auto_26195 ?auto_26194 ?auto_26196 ) )
  )

)

