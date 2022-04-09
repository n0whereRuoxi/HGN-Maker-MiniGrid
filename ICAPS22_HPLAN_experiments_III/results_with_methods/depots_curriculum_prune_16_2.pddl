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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25373 - SURFACE
      ?auto_25374 - SURFACE
      ?auto_25375 - SURFACE
    )
    :vars
    (
      ?auto_25380 - HOIST
      ?auto_25376 - PLACE
      ?auto_25377 - PLACE
      ?auto_25381 - HOIST
      ?auto_25378 - SURFACE
      ?auto_25382 - PLACE
      ?auto_25383 - HOIST
      ?auto_25384 - SURFACE
      ?auto_25379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25380 ?auto_25376 ) ( IS-CRATE ?auto_25375 ) ( not ( = ?auto_25377 ?auto_25376 ) ) ( HOIST-AT ?auto_25381 ?auto_25377 ) ( AVAILABLE ?auto_25381 ) ( SURFACE-AT ?auto_25375 ?auto_25377 ) ( ON ?auto_25375 ?auto_25378 ) ( CLEAR ?auto_25375 ) ( not ( = ?auto_25374 ?auto_25375 ) ) ( not ( = ?auto_25374 ?auto_25378 ) ) ( not ( = ?auto_25375 ?auto_25378 ) ) ( not ( = ?auto_25380 ?auto_25381 ) ) ( SURFACE-AT ?auto_25373 ?auto_25376 ) ( CLEAR ?auto_25373 ) ( IS-CRATE ?auto_25374 ) ( AVAILABLE ?auto_25380 ) ( not ( = ?auto_25382 ?auto_25376 ) ) ( HOIST-AT ?auto_25383 ?auto_25382 ) ( AVAILABLE ?auto_25383 ) ( SURFACE-AT ?auto_25374 ?auto_25382 ) ( ON ?auto_25374 ?auto_25384 ) ( CLEAR ?auto_25374 ) ( TRUCK-AT ?auto_25379 ?auto_25376 ) ( not ( = ?auto_25373 ?auto_25374 ) ) ( not ( = ?auto_25373 ?auto_25384 ) ) ( not ( = ?auto_25374 ?auto_25384 ) ) ( not ( = ?auto_25380 ?auto_25383 ) ) ( not ( = ?auto_25373 ?auto_25375 ) ) ( not ( = ?auto_25373 ?auto_25378 ) ) ( not ( = ?auto_25375 ?auto_25384 ) ) ( not ( = ?auto_25377 ?auto_25382 ) ) ( not ( = ?auto_25381 ?auto_25383 ) ) ( not ( = ?auto_25378 ?auto_25384 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25373 ?auto_25374 )
      ( MAKE-1CRATE ?auto_25374 ?auto_25375 )
      ( MAKE-2CRATE-VERIFY ?auto_25373 ?auto_25374 ?auto_25375 ) )
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
      ?auto_25406 - HOIST
      ?auto_25404 - PLACE
      ?auto_25407 - PLACE
      ?auto_25408 - HOIST
      ?auto_25403 - SURFACE
      ?auto_25411 - PLACE
      ?auto_25412 - HOIST
      ?auto_25409 - SURFACE
      ?auto_25414 - PLACE
      ?auto_25413 - HOIST
      ?auto_25410 - SURFACE
      ?auto_25405 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25406 ?auto_25404 ) ( IS-CRATE ?auto_25402 ) ( not ( = ?auto_25407 ?auto_25404 ) ) ( HOIST-AT ?auto_25408 ?auto_25407 ) ( AVAILABLE ?auto_25408 ) ( SURFACE-AT ?auto_25402 ?auto_25407 ) ( ON ?auto_25402 ?auto_25403 ) ( CLEAR ?auto_25402 ) ( not ( = ?auto_25401 ?auto_25402 ) ) ( not ( = ?auto_25401 ?auto_25403 ) ) ( not ( = ?auto_25402 ?auto_25403 ) ) ( not ( = ?auto_25406 ?auto_25408 ) ) ( IS-CRATE ?auto_25401 ) ( not ( = ?auto_25411 ?auto_25404 ) ) ( HOIST-AT ?auto_25412 ?auto_25411 ) ( AVAILABLE ?auto_25412 ) ( SURFACE-AT ?auto_25401 ?auto_25411 ) ( ON ?auto_25401 ?auto_25409 ) ( CLEAR ?auto_25401 ) ( not ( = ?auto_25400 ?auto_25401 ) ) ( not ( = ?auto_25400 ?auto_25409 ) ) ( not ( = ?auto_25401 ?auto_25409 ) ) ( not ( = ?auto_25406 ?auto_25412 ) ) ( SURFACE-AT ?auto_25399 ?auto_25404 ) ( CLEAR ?auto_25399 ) ( IS-CRATE ?auto_25400 ) ( AVAILABLE ?auto_25406 ) ( not ( = ?auto_25414 ?auto_25404 ) ) ( HOIST-AT ?auto_25413 ?auto_25414 ) ( AVAILABLE ?auto_25413 ) ( SURFACE-AT ?auto_25400 ?auto_25414 ) ( ON ?auto_25400 ?auto_25410 ) ( CLEAR ?auto_25400 ) ( TRUCK-AT ?auto_25405 ?auto_25404 ) ( not ( = ?auto_25399 ?auto_25400 ) ) ( not ( = ?auto_25399 ?auto_25410 ) ) ( not ( = ?auto_25400 ?auto_25410 ) ) ( not ( = ?auto_25406 ?auto_25413 ) ) ( not ( = ?auto_25399 ?auto_25401 ) ) ( not ( = ?auto_25399 ?auto_25409 ) ) ( not ( = ?auto_25401 ?auto_25410 ) ) ( not ( = ?auto_25411 ?auto_25414 ) ) ( not ( = ?auto_25412 ?auto_25413 ) ) ( not ( = ?auto_25409 ?auto_25410 ) ) ( not ( = ?auto_25399 ?auto_25402 ) ) ( not ( = ?auto_25399 ?auto_25403 ) ) ( not ( = ?auto_25400 ?auto_25402 ) ) ( not ( = ?auto_25400 ?auto_25403 ) ) ( not ( = ?auto_25402 ?auto_25409 ) ) ( not ( = ?auto_25402 ?auto_25410 ) ) ( not ( = ?auto_25407 ?auto_25411 ) ) ( not ( = ?auto_25407 ?auto_25414 ) ) ( not ( = ?auto_25408 ?auto_25412 ) ) ( not ( = ?auto_25408 ?auto_25413 ) ) ( not ( = ?auto_25403 ?auto_25409 ) ) ( not ( = ?auto_25403 ?auto_25410 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25399 ?auto_25400 ?auto_25401 )
      ( MAKE-1CRATE ?auto_25401 ?auto_25402 )
      ( MAKE-3CRATE-VERIFY ?auto_25399 ?auto_25400 ?auto_25401 ?auto_25402 ) )
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
      ?auto_25435 - HOIST
      ?auto_25439 - PLACE
      ?auto_25437 - PLACE
      ?auto_25440 - HOIST
      ?auto_25436 - SURFACE
      ?auto_25444 - PLACE
      ?auto_25443 - HOIST
      ?auto_25446 - SURFACE
      ?auto_25447 - PLACE
      ?auto_25448 - HOIST
      ?auto_25445 - SURFACE
      ?auto_25442 - PLACE
      ?auto_25441 - HOIST
      ?auto_25449 - SURFACE
      ?auto_25438 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25435 ?auto_25439 ) ( IS-CRATE ?auto_25434 ) ( not ( = ?auto_25437 ?auto_25439 ) ) ( HOIST-AT ?auto_25440 ?auto_25437 ) ( AVAILABLE ?auto_25440 ) ( SURFACE-AT ?auto_25434 ?auto_25437 ) ( ON ?auto_25434 ?auto_25436 ) ( CLEAR ?auto_25434 ) ( not ( = ?auto_25433 ?auto_25434 ) ) ( not ( = ?auto_25433 ?auto_25436 ) ) ( not ( = ?auto_25434 ?auto_25436 ) ) ( not ( = ?auto_25435 ?auto_25440 ) ) ( IS-CRATE ?auto_25433 ) ( not ( = ?auto_25444 ?auto_25439 ) ) ( HOIST-AT ?auto_25443 ?auto_25444 ) ( AVAILABLE ?auto_25443 ) ( SURFACE-AT ?auto_25433 ?auto_25444 ) ( ON ?auto_25433 ?auto_25446 ) ( CLEAR ?auto_25433 ) ( not ( = ?auto_25432 ?auto_25433 ) ) ( not ( = ?auto_25432 ?auto_25446 ) ) ( not ( = ?auto_25433 ?auto_25446 ) ) ( not ( = ?auto_25435 ?auto_25443 ) ) ( IS-CRATE ?auto_25432 ) ( not ( = ?auto_25447 ?auto_25439 ) ) ( HOIST-AT ?auto_25448 ?auto_25447 ) ( AVAILABLE ?auto_25448 ) ( SURFACE-AT ?auto_25432 ?auto_25447 ) ( ON ?auto_25432 ?auto_25445 ) ( CLEAR ?auto_25432 ) ( not ( = ?auto_25431 ?auto_25432 ) ) ( not ( = ?auto_25431 ?auto_25445 ) ) ( not ( = ?auto_25432 ?auto_25445 ) ) ( not ( = ?auto_25435 ?auto_25448 ) ) ( SURFACE-AT ?auto_25430 ?auto_25439 ) ( CLEAR ?auto_25430 ) ( IS-CRATE ?auto_25431 ) ( AVAILABLE ?auto_25435 ) ( not ( = ?auto_25442 ?auto_25439 ) ) ( HOIST-AT ?auto_25441 ?auto_25442 ) ( AVAILABLE ?auto_25441 ) ( SURFACE-AT ?auto_25431 ?auto_25442 ) ( ON ?auto_25431 ?auto_25449 ) ( CLEAR ?auto_25431 ) ( TRUCK-AT ?auto_25438 ?auto_25439 ) ( not ( = ?auto_25430 ?auto_25431 ) ) ( not ( = ?auto_25430 ?auto_25449 ) ) ( not ( = ?auto_25431 ?auto_25449 ) ) ( not ( = ?auto_25435 ?auto_25441 ) ) ( not ( = ?auto_25430 ?auto_25432 ) ) ( not ( = ?auto_25430 ?auto_25445 ) ) ( not ( = ?auto_25432 ?auto_25449 ) ) ( not ( = ?auto_25447 ?auto_25442 ) ) ( not ( = ?auto_25448 ?auto_25441 ) ) ( not ( = ?auto_25445 ?auto_25449 ) ) ( not ( = ?auto_25430 ?auto_25433 ) ) ( not ( = ?auto_25430 ?auto_25446 ) ) ( not ( = ?auto_25431 ?auto_25433 ) ) ( not ( = ?auto_25431 ?auto_25446 ) ) ( not ( = ?auto_25433 ?auto_25445 ) ) ( not ( = ?auto_25433 ?auto_25449 ) ) ( not ( = ?auto_25444 ?auto_25447 ) ) ( not ( = ?auto_25444 ?auto_25442 ) ) ( not ( = ?auto_25443 ?auto_25448 ) ) ( not ( = ?auto_25443 ?auto_25441 ) ) ( not ( = ?auto_25446 ?auto_25445 ) ) ( not ( = ?auto_25446 ?auto_25449 ) ) ( not ( = ?auto_25430 ?auto_25434 ) ) ( not ( = ?auto_25430 ?auto_25436 ) ) ( not ( = ?auto_25431 ?auto_25434 ) ) ( not ( = ?auto_25431 ?auto_25436 ) ) ( not ( = ?auto_25432 ?auto_25434 ) ) ( not ( = ?auto_25432 ?auto_25436 ) ) ( not ( = ?auto_25434 ?auto_25446 ) ) ( not ( = ?auto_25434 ?auto_25445 ) ) ( not ( = ?auto_25434 ?auto_25449 ) ) ( not ( = ?auto_25437 ?auto_25444 ) ) ( not ( = ?auto_25437 ?auto_25447 ) ) ( not ( = ?auto_25437 ?auto_25442 ) ) ( not ( = ?auto_25440 ?auto_25443 ) ) ( not ( = ?auto_25440 ?auto_25448 ) ) ( not ( = ?auto_25440 ?auto_25441 ) ) ( not ( = ?auto_25436 ?auto_25446 ) ) ( not ( = ?auto_25436 ?auto_25445 ) ) ( not ( = ?auto_25436 ?auto_25449 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_25430 ?auto_25431 ?auto_25432 ?auto_25433 )
      ( MAKE-1CRATE ?auto_25433 ?auto_25434 )
      ( MAKE-4CRATE-VERIFY ?auto_25430 ?auto_25431 ?auto_25432 ?auto_25433 ?auto_25434 ) )
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
      ?auto_25476 - HOIST
      ?auto_25475 - PLACE
      ?auto_25474 - PLACE
      ?auto_25473 - HOIST
      ?auto_25477 - SURFACE
      ?auto_25488 - PLACE
      ?auto_25479 - HOIST
      ?auto_25478 - SURFACE
      ?auto_25487 - PLACE
      ?auto_25484 - HOIST
      ?auto_25489 - SURFACE
      ?auto_25483 - PLACE
      ?auto_25485 - HOIST
      ?auto_25482 - SURFACE
      ?auto_25486 - PLACE
      ?auto_25481 - HOIST
      ?auto_25480 - SURFACE
      ?auto_25472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25476 ?auto_25475 ) ( IS-CRATE ?auto_25471 ) ( not ( = ?auto_25474 ?auto_25475 ) ) ( HOIST-AT ?auto_25473 ?auto_25474 ) ( AVAILABLE ?auto_25473 ) ( SURFACE-AT ?auto_25471 ?auto_25474 ) ( ON ?auto_25471 ?auto_25477 ) ( CLEAR ?auto_25471 ) ( not ( = ?auto_25470 ?auto_25471 ) ) ( not ( = ?auto_25470 ?auto_25477 ) ) ( not ( = ?auto_25471 ?auto_25477 ) ) ( not ( = ?auto_25476 ?auto_25473 ) ) ( IS-CRATE ?auto_25470 ) ( not ( = ?auto_25488 ?auto_25475 ) ) ( HOIST-AT ?auto_25479 ?auto_25488 ) ( AVAILABLE ?auto_25479 ) ( SURFACE-AT ?auto_25470 ?auto_25488 ) ( ON ?auto_25470 ?auto_25478 ) ( CLEAR ?auto_25470 ) ( not ( = ?auto_25469 ?auto_25470 ) ) ( not ( = ?auto_25469 ?auto_25478 ) ) ( not ( = ?auto_25470 ?auto_25478 ) ) ( not ( = ?auto_25476 ?auto_25479 ) ) ( IS-CRATE ?auto_25469 ) ( not ( = ?auto_25487 ?auto_25475 ) ) ( HOIST-AT ?auto_25484 ?auto_25487 ) ( AVAILABLE ?auto_25484 ) ( SURFACE-AT ?auto_25469 ?auto_25487 ) ( ON ?auto_25469 ?auto_25489 ) ( CLEAR ?auto_25469 ) ( not ( = ?auto_25468 ?auto_25469 ) ) ( not ( = ?auto_25468 ?auto_25489 ) ) ( not ( = ?auto_25469 ?auto_25489 ) ) ( not ( = ?auto_25476 ?auto_25484 ) ) ( IS-CRATE ?auto_25468 ) ( not ( = ?auto_25483 ?auto_25475 ) ) ( HOIST-AT ?auto_25485 ?auto_25483 ) ( AVAILABLE ?auto_25485 ) ( SURFACE-AT ?auto_25468 ?auto_25483 ) ( ON ?auto_25468 ?auto_25482 ) ( CLEAR ?auto_25468 ) ( not ( = ?auto_25467 ?auto_25468 ) ) ( not ( = ?auto_25467 ?auto_25482 ) ) ( not ( = ?auto_25468 ?auto_25482 ) ) ( not ( = ?auto_25476 ?auto_25485 ) ) ( SURFACE-AT ?auto_25466 ?auto_25475 ) ( CLEAR ?auto_25466 ) ( IS-CRATE ?auto_25467 ) ( AVAILABLE ?auto_25476 ) ( not ( = ?auto_25486 ?auto_25475 ) ) ( HOIST-AT ?auto_25481 ?auto_25486 ) ( AVAILABLE ?auto_25481 ) ( SURFACE-AT ?auto_25467 ?auto_25486 ) ( ON ?auto_25467 ?auto_25480 ) ( CLEAR ?auto_25467 ) ( TRUCK-AT ?auto_25472 ?auto_25475 ) ( not ( = ?auto_25466 ?auto_25467 ) ) ( not ( = ?auto_25466 ?auto_25480 ) ) ( not ( = ?auto_25467 ?auto_25480 ) ) ( not ( = ?auto_25476 ?auto_25481 ) ) ( not ( = ?auto_25466 ?auto_25468 ) ) ( not ( = ?auto_25466 ?auto_25482 ) ) ( not ( = ?auto_25468 ?auto_25480 ) ) ( not ( = ?auto_25483 ?auto_25486 ) ) ( not ( = ?auto_25485 ?auto_25481 ) ) ( not ( = ?auto_25482 ?auto_25480 ) ) ( not ( = ?auto_25466 ?auto_25469 ) ) ( not ( = ?auto_25466 ?auto_25489 ) ) ( not ( = ?auto_25467 ?auto_25469 ) ) ( not ( = ?auto_25467 ?auto_25489 ) ) ( not ( = ?auto_25469 ?auto_25482 ) ) ( not ( = ?auto_25469 ?auto_25480 ) ) ( not ( = ?auto_25487 ?auto_25483 ) ) ( not ( = ?auto_25487 ?auto_25486 ) ) ( not ( = ?auto_25484 ?auto_25485 ) ) ( not ( = ?auto_25484 ?auto_25481 ) ) ( not ( = ?auto_25489 ?auto_25482 ) ) ( not ( = ?auto_25489 ?auto_25480 ) ) ( not ( = ?auto_25466 ?auto_25470 ) ) ( not ( = ?auto_25466 ?auto_25478 ) ) ( not ( = ?auto_25467 ?auto_25470 ) ) ( not ( = ?auto_25467 ?auto_25478 ) ) ( not ( = ?auto_25468 ?auto_25470 ) ) ( not ( = ?auto_25468 ?auto_25478 ) ) ( not ( = ?auto_25470 ?auto_25489 ) ) ( not ( = ?auto_25470 ?auto_25482 ) ) ( not ( = ?auto_25470 ?auto_25480 ) ) ( not ( = ?auto_25488 ?auto_25487 ) ) ( not ( = ?auto_25488 ?auto_25483 ) ) ( not ( = ?auto_25488 ?auto_25486 ) ) ( not ( = ?auto_25479 ?auto_25484 ) ) ( not ( = ?auto_25479 ?auto_25485 ) ) ( not ( = ?auto_25479 ?auto_25481 ) ) ( not ( = ?auto_25478 ?auto_25489 ) ) ( not ( = ?auto_25478 ?auto_25482 ) ) ( not ( = ?auto_25478 ?auto_25480 ) ) ( not ( = ?auto_25466 ?auto_25471 ) ) ( not ( = ?auto_25466 ?auto_25477 ) ) ( not ( = ?auto_25467 ?auto_25471 ) ) ( not ( = ?auto_25467 ?auto_25477 ) ) ( not ( = ?auto_25468 ?auto_25471 ) ) ( not ( = ?auto_25468 ?auto_25477 ) ) ( not ( = ?auto_25469 ?auto_25471 ) ) ( not ( = ?auto_25469 ?auto_25477 ) ) ( not ( = ?auto_25471 ?auto_25478 ) ) ( not ( = ?auto_25471 ?auto_25489 ) ) ( not ( = ?auto_25471 ?auto_25482 ) ) ( not ( = ?auto_25471 ?auto_25480 ) ) ( not ( = ?auto_25474 ?auto_25488 ) ) ( not ( = ?auto_25474 ?auto_25487 ) ) ( not ( = ?auto_25474 ?auto_25483 ) ) ( not ( = ?auto_25474 ?auto_25486 ) ) ( not ( = ?auto_25473 ?auto_25479 ) ) ( not ( = ?auto_25473 ?auto_25484 ) ) ( not ( = ?auto_25473 ?auto_25485 ) ) ( not ( = ?auto_25473 ?auto_25481 ) ) ( not ( = ?auto_25477 ?auto_25478 ) ) ( not ( = ?auto_25477 ?auto_25489 ) ) ( not ( = ?auto_25477 ?auto_25482 ) ) ( not ( = ?auto_25477 ?auto_25480 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_25466 ?auto_25467 ?auto_25468 ?auto_25469 ?auto_25470 )
      ( MAKE-1CRATE ?auto_25470 ?auto_25471 )
      ( MAKE-5CRATE-VERIFY ?auto_25466 ?auto_25467 ?auto_25468 ?auto_25469 ?auto_25470 ?auto_25471 ) )
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
      ?auto_25518 - HOIST
      ?auto_25517 - PLACE
      ?auto_25514 - PLACE
      ?auto_25519 - HOIST
      ?auto_25515 - SURFACE
      ?auto_25524 - PLACE
      ?auto_25520 - HOIST
      ?auto_25525 - SURFACE
      ?auto_25522 - PLACE
      ?auto_25531 - HOIST
      ?auto_25523 - SURFACE
      ?auto_25533 - PLACE
      ?auto_25527 - HOIST
      ?auto_25534 - SURFACE
      ?auto_25526 - PLACE
      ?auto_25528 - HOIST
      ?auto_25521 - SURFACE
      ?auto_25529 - PLACE
      ?auto_25530 - HOIST
      ?auto_25532 - SURFACE
      ?auto_25516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25518 ?auto_25517 ) ( IS-CRATE ?auto_25513 ) ( not ( = ?auto_25514 ?auto_25517 ) ) ( HOIST-AT ?auto_25519 ?auto_25514 ) ( AVAILABLE ?auto_25519 ) ( SURFACE-AT ?auto_25513 ?auto_25514 ) ( ON ?auto_25513 ?auto_25515 ) ( CLEAR ?auto_25513 ) ( not ( = ?auto_25512 ?auto_25513 ) ) ( not ( = ?auto_25512 ?auto_25515 ) ) ( not ( = ?auto_25513 ?auto_25515 ) ) ( not ( = ?auto_25518 ?auto_25519 ) ) ( IS-CRATE ?auto_25512 ) ( not ( = ?auto_25524 ?auto_25517 ) ) ( HOIST-AT ?auto_25520 ?auto_25524 ) ( AVAILABLE ?auto_25520 ) ( SURFACE-AT ?auto_25512 ?auto_25524 ) ( ON ?auto_25512 ?auto_25525 ) ( CLEAR ?auto_25512 ) ( not ( = ?auto_25511 ?auto_25512 ) ) ( not ( = ?auto_25511 ?auto_25525 ) ) ( not ( = ?auto_25512 ?auto_25525 ) ) ( not ( = ?auto_25518 ?auto_25520 ) ) ( IS-CRATE ?auto_25511 ) ( not ( = ?auto_25522 ?auto_25517 ) ) ( HOIST-AT ?auto_25531 ?auto_25522 ) ( AVAILABLE ?auto_25531 ) ( SURFACE-AT ?auto_25511 ?auto_25522 ) ( ON ?auto_25511 ?auto_25523 ) ( CLEAR ?auto_25511 ) ( not ( = ?auto_25510 ?auto_25511 ) ) ( not ( = ?auto_25510 ?auto_25523 ) ) ( not ( = ?auto_25511 ?auto_25523 ) ) ( not ( = ?auto_25518 ?auto_25531 ) ) ( IS-CRATE ?auto_25510 ) ( not ( = ?auto_25533 ?auto_25517 ) ) ( HOIST-AT ?auto_25527 ?auto_25533 ) ( AVAILABLE ?auto_25527 ) ( SURFACE-AT ?auto_25510 ?auto_25533 ) ( ON ?auto_25510 ?auto_25534 ) ( CLEAR ?auto_25510 ) ( not ( = ?auto_25509 ?auto_25510 ) ) ( not ( = ?auto_25509 ?auto_25534 ) ) ( not ( = ?auto_25510 ?auto_25534 ) ) ( not ( = ?auto_25518 ?auto_25527 ) ) ( IS-CRATE ?auto_25509 ) ( not ( = ?auto_25526 ?auto_25517 ) ) ( HOIST-AT ?auto_25528 ?auto_25526 ) ( AVAILABLE ?auto_25528 ) ( SURFACE-AT ?auto_25509 ?auto_25526 ) ( ON ?auto_25509 ?auto_25521 ) ( CLEAR ?auto_25509 ) ( not ( = ?auto_25508 ?auto_25509 ) ) ( not ( = ?auto_25508 ?auto_25521 ) ) ( not ( = ?auto_25509 ?auto_25521 ) ) ( not ( = ?auto_25518 ?auto_25528 ) ) ( SURFACE-AT ?auto_25507 ?auto_25517 ) ( CLEAR ?auto_25507 ) ( IS-CRATE ?auto_25508 ) ( AVAILABLE ?auto_25518 ) ( not ( = ?auto_25529 ?auto_25517 ) ) ( HOIST-AT ?auto_25530 ?auto_25529 ) ( AVAILABLE ?auto_25530 ) ( SURFACE-AT ?auto_25508 ?auto_25529 ) ( ON ?auto_25508 ?auto_25532 ) ( CLEAR ?auto_25508 ) ( TRUCK-AT ?auto_25516 ?auto_25517 ) ( not ( = ?auto_25507 ?auto_25508 ) ) ( not ( = ?auto_25507 ?auto_25532 ) ) ( not ( = ?auto_25508 ?auto_25532 ) ) ( not ( = ?auto_25518 ?auto_25530 ) ) ( not ( = ?auto_25507 ?auto_25509 ) ) ( not ( = ?auto_25507 ?auto_25521 ) ) ( not ( = ?auto_25509 ?auto_25532 ) ) ( not ( = ?auto_25526 ?auto_25529 ) ) ( not ( = ?auto_25528 ?auto_25530 ) ) ( not ( = ?auto_25521 ?auto_25532 ) ) ( not ( = ?auto_25507 ?auto_25510 ) ) ( not ( = ?auto_25507 ?auto_25534 ) ) ( not ( = ?auto_25508 ?auto_25510 ) ) ( not ( = ?auto_25508 ?auto_25534 ) ) ( not ( = ?auto_25510 ?auto_25521 ) ) ( not ( = ?auto_25510 ?auto_25532 ) ) ( not ( = ?auto_25533 ?auto_25526 ) ) ( not ( = ?auto_25533 ?auto_25529 ) ) ( not ( = ?auto_25527 ?auto_25528 ) ) ( not ( = ?auto_25527 ?auto_25530 ) ) ( not ( = ?auto_25534 ?auto_25521 ) ) ( not ( = ?auto_25534 ?auto_25532 ) ) ( not ( = ?auto_25507 ?auto_25511 ) ) ( not ( = ?auto_25507 ?auto_25523 ) ) ( not ( = ?auto_25508 ?auto_25511 ) ) ( not ( = ?auto_25508 ?auto_25523 ) ) ( not ( = ?auto_25509 ?auto_25511 ) ) ( not ( = ?auto_25509 ?auto_25523 ) ) ( not ( = ?auto_25511 ?auto_25534 ) ) ( not ( = ?auto_25511 ?auto_25521 ) ) ( not ( = ?auto_25511 ?auto_25532 ) ) ( not ( = ?auto_25522 ?auto_25533 ) ) ( not ( = ?auto_25522 ?auto_25526 ) ) ( not ( = ?auto_25522 ?auto_25529 ) ) ( not ( = ?auto_25531 ?auto_25527 ) ) ( not ( = ?auto_25531 ?auto_25528 ) ) ( not ( = ?auto_25531 ?auto_25530 ) ) ( not ( = ?auto_25523 ?auto_25534 ) ) ( not ( = ?auto_25523 ?auto_25521 ) ) ( not ( = ?auto_25523 ?auto_25532 ) ) ( not ( = ?auto_25507 ?auto_25512 ) ) ( not ( = ?auto_25507 ?auto_25525 ) ) ( not ( = ?auto_25508 ?auto_25512 ) ) ( not ( = ?auto_25508 ?auto_25525 ) ) ( not ( = ?auto_25509 ?auto_25512 ) ) ( not ( = ?auto_25509 ?auto_25525 ) ) ( not ( = ?auto_25510 ?auto_25512 ) ) ( not ( = ?auto_25510 ?auto_25525 ) ) ( not ( = ?auto_25512 ?auto_25523 ) ) ( not ( = ?auto_25512 ?auto_25534 ) ) ( not ( = ?auto_25512 ?auto_25521 ) ) ( not ( = ?auto_25512 ?auto_25532 ) ) ( not ( = ?auto_25524 ?auto_25522 ) ) ( not ( = ?auto_25524 ?auto_25533 ) ) ( not ( = ?auto_25524 ?auto_25526 ) ) ( not ( = ?auto_25524 ?auto_25529 ) ) ( not ( = ?auto_25520 ?auto_25531 ) ) ( not ( = ?auto_25520 ?auto_25527 ) ) ( not ( = ?auto_25520 ?auto_25528 ) ) ( not ( = ?auto_25520 ?auto_25530 ) ) ( not ( = ?auto_25525 ?auto_25523 ) ) ( not ( = ?auto_25525 ?auto_25534 ) ) ( not ( = ?auto_25525 ?auto_25521 ) ) ( not ( = ?auto_25525 ?auto_25532 ) ) ( not ( = ?auto_25507 ?auto_25513 ) ) ( not ( = ?auto_25507 ?auto_25515 ) ) ( not ( = ?auto_25508 ?auto_25513 ) ) ( not ( = ?auto_25508 ?auto_25515 ) ) ( not ( = ?auto_25509 ?auto_25513 ) ) ( not ( = ?auto_25509 ?auto_25515 ) ) ( not ( = ?auto_25510 ?auto_25513 ) ) ( not ( = ?auto_25510 ?auto_25515 ) ) ( not ( = ?auto_25511 ?auto_25513 ) ) ( not ( = ?auto_25511 ?auto_25515 ) ) ( not ( = ?auto_25513 ?auto_25525 ) ) ( not ( = ?auto_25513 ?auto_25523 ) ) ( not ( = ?auto_25513 ?auto_25534 ) ) ( not ( = ?auto_25513 ?auto_25521 ) ) ( not ( = ?auto_25513 ?auto_25532 ) ) ( not ( = ?auto_25514 ?auto_25524 ) ) ( not ( = ?auto_25514 ?auto_25522 ) ) ( not ( = ?auto_25514 ?auto_25533 ) ) ( not ( = ?auto_25514 ?auto_25526 ) ) ( not ( = ?auto_25514 ?auto_25529 ) ) ( not ( = ?auto_25519 ?auto_25520 ) ) ( not ( = ?auto_25519 ?auto_25531 ) ) ( not ( = ?auto_25519 ?auto_25527 ) ) ( not ( = ?auto_25519 ?auto_25528 ) ) ( not ( = ?auto_25519 ?auto_25530 ) ) ( not ( = ?auto_25515 ?auto_25525 ) ) ( not ( = ?auto_25515 ?auto_25523 ) ) ( not ( = ?auto_25515 ?auto_25534 ) ) ( not ( = ?auto_25515 ?auto_25521 ) ) ( not ( = ?auto_25515 ?auto_25532 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_25507 ?auto_25508 ?auto_25509 ?auto_25510 ?auto_25511 ?auto_25512 )
      ( MAKE-1CRATE ?auto_25512 ?auto_25513 )
      ( MAKE-6CRATE-VERIFY ?auto_25507 ?auto_25508 ?auto_25509 ?auto_25510 ?auto_25511 ?auto_25512 ?auto_25513 ) )
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
      ?auto_25566 - HOIST
      ?auto_25564 - PLACE
      ?auto_25561 - PLACE
      ?auto_25563 - HOIST
      ?auto_25562 - SURFACE
      ?auto_25573 - PLACE
      ?auto_25578 - HOIST
      ?auto_25579 - SURFACE
      ?auto_25568 - PLACE
      ?auto_25580 - HOIST
      ?auto_25574 - SURFACE
      ?auto_25569 - PLACE
      ?auto_25577 - HOIST
      ?auto_25571 - SURFACE
      ?auto_25575 - PLACE
      ?auto_25567 - HOIST
      ?auto_25570 - SURFACE
      ?auto_25584 - PLACE
      ?auto_25581 - HOIST
      ?auto_25572 - SURFACE
      ?auto_25583 - PLACE
      ?auto_25582 - HOIST
      ?auto_25576 - SURFACE
      ?auto_25565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25566 ?auto_25564 ) ( IS-CRATE ?auto_25560 ) ( not ( = ?auto_25561 ?auto_25564 ) ) ( HOIST-AT ?auto_25563 ?auto_25561 ) ( AVAILABLE ?auto_25563 ) ( SURFACE-AT ?auto_25560 ?auto_25561 ) ( ON ?auto_25560 ?auto_25562 ) ( CLEAR ?auto_25560 ) ( not ( = ?auto_25559 ?auto_25560 ) ) ( not ( = ?auto_25559 ?auto_25562 ) ) ( not ( = ?auto_25560 ?auto_25562 ) ) ( not ( = ?auto_25566 ?auto_25563 ) ) ( IS-CRATE ?auto_25559 ) ( not ( = ?auto_25573 ?auto_25564 ) ) ( HOIST-AT ?auto_25578 ?auto_25573 ) ( AVAILABLE ?auto_25578 ) ( SURFACE-AT ?auto_25559 ?auto_25573 ) ( ON ?auto_25559 ?auto_25579 ) ( CLEAR ?auto_25559 ) ( not ( = ?auto_25558 ?auto_25559 ) ) ( not ( = ?auto_25558 ?auto_25579 ) ) ( not ( = ?auto_25559 ?auto_25579 ) ) ( not ( = ?auto_25566 ?auto_25578 ) ) ( IS-CRATE ?auto_25558 ) ( not ( = ?auto_25568 ?auto_25564 ) ) ( HOIST-AT ?auto_25580 ?auto_25568 ) ( AVAILABLE ?auto_25580 ) ( SURFACE-AT ?auto_25558 ?auto_25568 ) ( ON ?auto_25558 ?auto_25574 ) ( CLEAR ?auto_25558 ) ( not ( = ?auto_25557 ?auto_25558 ) ) ( not ( = ?auto_25557 ?auto_25574 ) ) ( not ( = ?auto_25558 ?auto_25574 ) ) ( not ( = ?auto_25566 ?auto_25580 ) ) ( IS-CRATE ?auto_25557 ) ( not ( = ?auto_25569 ?auto_25564 ) ) ( HOIST-AT ?auto_25577 ?auto_25569 ) ( AVAILABLE ?auto_25577 ) ( SURFACE-AT ?auto_25557 ?auto_25569 ) ( ON ?auto_25557 ?auto_25571 ) ( CLEAR ?auto_25557 ) ( not ( = ?auto_25556 ?auto_25557 ) ) ( not ( = ?auto_25556 ?auto_25571 ) ) ( not ( = ?auto_25557 ?auto_25571 ) ) ( not ( = ?auto_25566 ?auto_25577 ) ) ( IS-CRATE ?auto_25556 ) ( not ( = ?auto_25575 ?auto_25564 ) ) ( HOIST-AT ?auto_25567 ?auto_25575 ) ( AVAILABLE ?auto_25567 ) ( SURFACE-AT ?auto_25556 ?auto_25575 ) ( ON ?auto_25556 ?auto_25570 ) ( CLEAR ?auto_25556 ) ( not ( = ?auto_25555 ?auto_25556 ) ) ( not ( = ?auto_25555 ?auto_25570 ) ) ( not ( = ?auto_25556 ?auto_25570 ) ) ( not ( = ?auto_25566 ?auto_25567 ) ) ( IS-CRATE ?auto_25555 ) ( not ( = ?auto_25584 ?auto_25564 ) ) ( HOIST-AT ?auto_25581 ?auto_25584 ) ( AVAILABLE ?auto_25581 ) ( SURFACE-AT ?auto_25555 ?auto_25584 ) ( ON ?auto_25555 ?auto_25572 ) ( CLEAR ?auto_25555 ) ( not ( = ?auto_25554 ?auto_25555 ) ) ( not ( = ?auto_25554 ?auto_25572 ) ) ( not ( = ?auto_25555 ?auto_25572 ) ) ( not ( = ?auto_25566 ?auto_25581 ) ) ( SURFACE-AT ?auto_25553 ?auto_25564 ) ( CLEAR ?auto_25553 ) ( IS-CRATE ?auto_25554 ) ( AVAILABLE ?auto_25566 ) ( not ( = ?auto_25583 ?auto_25564 ) ) ( HOIST-AT ?auto_25582 ?auto_25583 ) ( AVAILABLE ?auto_25582 ) ( SURFACE-AT ?auto_25554 ?auto_25583 ) ( ON ?auto_25554 ?auto_25576 ) ( CLEAR ?auto_25554 ) ( TRUCK-AT ?auto_25565 ?auto_25564 ) ( not ( = ?auto_25553 ?auto_25554 ) ) ( not ( = ?auto_25553 ?auto_25576 ) ) ( not ( = ?auto_25554 ?auto_25576 ) ) ( not ( = ?auto_25566 ?auto_25582 ) ) ( not ( = ?auto_25553 ?auto_25555 ) ) ( not ( = ?auto_25553 ?auto_25572 ) ) ( not ( = ?auto_25555 ?auto_25576 ) ) ( not ( = ?auto_25584 ?auto_25583 ) ) ( not ( = ?auto_25581 ?auto_25582 ) ) ( not ( = ?auto_25572 ?auto_25576 ) ) ( not ( = ?auto_25553 ?auto_25556 ) ) ( not ( = ?auto_25553 ?auto_25570 ) ) ( not ( = ?auto_25554 ?auto_25556 ) ) ( not ( = ?auto_25554 ?auto_25570 ) ) ( not ( = ?auto_25556 ?auto_25572 ) ) ( not ( = ?auto_25556 ?auto_25576 ) ) ( not ( = ?auto_25575 ?auto_25584 ) ) ( not ( = ?auto_25575 ?auto_25583 ) ) ( not ( = ?auto_25567 ?auto_25581 ) ) ( not ( = ?auto_25567 ?auto_25582 ) ) ( not ( = ?auto_25570 ?auto_25572 ) ) ( not ( = ?auto_25570 ?auto_25576 ) ) ( not ( = ?auto_25553 ?auto_25557 ) ) ( not ( = ?auto_25553 ?auto_25571 ) ) ( not ( = ?auto_25554 ?auto_25557 ) ) ( not ( = ?auto_25554 ?auto_25571 ) ) ( not ( = ?auto_25555 ?auto_25557 ) ) ( not ( = ?auto_25555 ?auto_25571 ) ) ( not ( = ?auto_25557 ?auto_25570 ) ) ( not ( = ?auto_25557 ?auto_25572 ) ) ( not ( = ?auto_25557 ?auto_25576 ) ) ( not ( = ?auto_25569 ?auto_25575 ) ) ( not ( = ?auto_25569 ?auto_25584 ) ) ( not ( = ?auto_25569 ?auto_25583 ) ) ( not ( = ?auto_25577 ?auto_25567 ) ) ( not ( = ?auto_25577 ?auto_25581 ) ) ( not ( = ?auto_25577 ?auto_25582 ) ) ( not ( = ?auto_25571 ?auto_25570 ) ) ( not ( = ?auto_25571 ?auto_25572 ) ) ( not ( = ?auto_25571 ?auto_25576 ) ) ( not ( = ?auto_25553 ?auto_25558 ) ) ( not ( = ?auto_25553 ?auto_25574 ) ) ( not ( = ?auto_25554 ?auto_25558 ) ) ( not ( = ?auto_25554 ?auto_25574 ) ) ( not ( = ?auto_25555 ?auto_25558 ) ) ( not ( = ?auto_25555 ?auto_25574 ) ) ( not ( = ?auto_25556 ?auto_25558 ) ) ( not ( = ?auto_25556 ?auto_25574 ) ) ( not ( = ?auto_25558 ?auto_25571 ) ) ( not ( = ?auto_25558 ?auto_25570 ) ) ( not ( = ?auto_25558 ?auto_25572 ) ) ( not ( = ?auto_25558 ?auto_25576 ) ) ( not ( = ?auto_25568 ?auto_25569 ) ) ( not ( = ?auto_25568 ?auto_25575 ) ) ( not ( = ?auto_25568 ?auto_25584 ) ) ( not ( = ?auto_25568 ?auto_25583 ) ) ( not ( = ?auto_25580 ?auto_25577 ) ) ( not ( = ?auto_25580 ?auto_25567 ) ) ( not ( = ?auto_25580 ?auto_25581 ) ) ( not ( = ?auto_25580 ?auto_25582 ) ) ( not ( = ?auto_25574 ?auto_25571 ) ) ( not ( = ?auto_25574 ?auto_25570 ) ) ( not ( = ?auto_25574 ?auto_25572 ) ) ( not ( = ?auto_25574 ?auto_25576 ) ) ( not ( = ?auto_25553 ?auto_25559 ) ) ( not ( = ?auto_25553 ?auto_25579 ) ) ( not ( = ?auto_25554 ?auto_25559 ) ) ( not ( = ?auto_25554 ?auto_25579 ) ) ( not ( = ?auto_25555 ?auto_25559 ) ) ( not ( = ?auto_25555 ?auto_25579 ) ) ( not ( = ?auto_25556 ?auto_25559 ) ) ( not ( = ?auto_25556 ?auto_25579 ) ) ( not ( = ?auto_25557 ?auto_25559 ) ) ( not ( = ?auto_25557 ?auto_25579 ) ) ( not ( = ?auto_25559 ?auto_25574 ) ) ( not ( = ?auto_25559 ?auto_25571 ) ) ( not ( = ?auto_25559 ?auto_25570 ) ) ( not ( = ?auto_25559 ?auto_25572 ) ) ( not ( = ?auto_25559 ?auto_25576 ) ) ( not ( = ?auto_25573 ?auto_25568 ) ) ( not ( = ?auto_25573 ?auto_25569 ) ) ( not ( = ?auto_25573 ?auto_25575 ) ) ( not ( = ?auto_25573 ?auto_25584 ) ) ( not ( = ?auto_25573 ?auto_25583 ) ) ( not ( = ?auto_25578 ?auto_25580 ) ) ( not ( = ?auto_25578 ?auto_25577 ) ) ( not ( = ?auto_25578 ?auto_25567 ) ) ( not ( = ?auto_25578 ?auto_25581 ) ) ( not ( = ?auto_25578 ?auto_25582 ) ) ( not ( = ?auto_25579 ?auto_25574 ) ) ( not ( = ?auto_25579 ?auto_25571 ) ) ( not ( = ?auto_25579 ?auto_25570 ) ) ( not ( = ?auto_25579 ?auto_25572 ) ) ( not ( = ?auto_25579 ?auto_25576 ) ) ( not ( = ?auto_25553 ?auto_25560 ) ) ( not ( = ?auto_25553 ?auto_25562 ) ) ( not ( = ?auto_25554 ?auto_25560 ) ) ( not ( = ?auto_25554 ?auto_25562 ) ) ( not ( = ?auto_25555 ?auto_25560 ) ) ( not ( = ?auto_25555 ?auto_25562 ) ) ( not ( = ?auto_25556 ?auto_25560 ) ) ( not ( = ?auto_25556 ?auto_25562 ) ) ( not ( = ?auto_25557 ?auto_25560 ) ) ( not ( = ?auto_25557 ?auto_25562 ) ) ( not ( = ?auto_25558 ?auto_25560 ) ) ( not ( = ?auto_25558 ?auto_25562 ) ) ( not ( = ?auto_25560 ?auto_25579 ) ) ( not ( = ?auto_25560 ?auto_25574 ) ) ( not ( = ?auto_25560 ?auto_25571 ) ) ( not ( = ?auto_25560 ?auto_25570 ) ) ( not ( = ?auto_25560 ?auto_25572 ) ) ( not ( = ?auto_25560 ?auto_25576 ) ) ( not ( = ?auto_25561 ?auto_25573 ) ) ( not ( = ?auto_25561 ?auto_25568 ) ) ( not ( = ?auto_25561 ?auto_25569 ) ) ( not ( = ?auto_25561 ?auto_25575 ) ) ( not ( = ?auto_25561 ?auto_25584 ) ) ( not ( = ?auto_25561 ?auto_25583 ) ) ( not ( = ?auto_25563 ?auto_25578 ) ) ( not ( = ?auto_25563 ?auto_25580 ) ) ( not ( = ?auto_25563 ?auto_25577 ) ) ( not ( = ?auto_25563 ?auto_25567 ) ) ( not ( = ?auto_25563 ?auto_25581 ) ) ( not ( = ?auto_25563 ?auto_25582 ) ) ( not ( = ?auto_25562 ?auto_25579 ) ) ( not ( = ?auto_25562 ?auto_25574 ) ) ( not ( = ?auto_25562 ?auto_25571 ) ) ( not ( = ?auto_25562 ?auto_25570 ) ) ( not ( = ?auto_25562 ?auto_25572 ) ) ( not ( = ?auto_25562 ?auto_25576 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_25553 ?auto_25554 ?auto_25555 ?auto_25556 ?auto_25557 ?auto_25558 ?auto_25559 )
      ( MAKE-1CRATE ?auto_25559 ?auto_25560 )
      ( MAKE-7CRATE-VERIFY ?auto_25553 ?auto_25554 ?auto_25555 ?auto_25556 ?auto_25557 ?auto_25558 ?auto_25559 ?auto_25560 ) )
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
      ?auto_25611 - SURFACE
      ?auto_25612 - SURFACE
    )
    :vars
    (
      ?auto_25617 - HOIST
      ?auto_25618 - PLACE
      ?auto_25615 - PLACE
      ?auto_25616 - HOIST
      ?auto_25613 - SURFACE
      ?auto_25633 - PLACE
      ?auto_25634 - HOIST
      ?auto_25635 - SURFACE
      ?auto_25630 - PLACE
      ?auto_25626 - HOIST
      ?auto_25627 - SURFACE
      ?auto_25620 - PLACE
      ?auto_25628 - HOIST
      ?auto_25629 - SURFACE
      ?auto_25622 - PLACE
      ?auto_25624 - HOIST
      ?auto_25632 - SURFACE
      ?auto_25623 - PLACE
      ?auto_25636 - HOIST
      ?auto_25621 - SURFACE
      ?auto_25638 - PLACE
      ?auto_25639 - HOIST
      ?auto_25631 - SURFACE
      ?auto_25619 - PLACE
      ?auto_25637 - HOIST
      ?auto_25625 - SURFACE
      ?auto_25614 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25617 ?auto_25618 ) ( IS-CRATE ?auto_25612 ) ( not ( = ?auto_25615 ?auto_25618 ) ) ( HOIST-AT ?auto_25616 ?auto_25615 ) ( AVAILABLE ?auto_25616 ) ( SURFACE-AT ?auto_25612 ?auto_25615 ) ( ON ?auto_25612 ?auto_25613 ) ( CLEAR ?auto_25612 ) ( not ( = ?auto_25611 ?auto_25612 ) ) ( not ( = ?auto_25611 ?auto_25613 ) ) ( not ( = ?auto_25612 ?auto_25613 ) ) ( not ( = ?auto_25617 ?auto_25616 ) ) ( IS-CRATE ?auto_25611 ) ( not ( = ?auto_25633 ?auto_25618 ) ) ( HOIST-AT ?auto_25634 ?auto_25633 ) ( AVAILABLE ?auto_25634 ) ( SURFACE-AT ?auto_25611 ?auto_25633 ) ( ON ?auto_25611 ?auto_25635 ) ( CLEAR ?auto_25611 ) ( not ( = ?auto_25610 ?auto_25611 ) ) ( not ( = ?auto_25610 ?auto_25635 ) ) ( not ( = ?auto_25611 ?auto_25635 ) ) ( not ( = ?auto_25617 ?auto_25634 ) ) ( IS-CRATE ?auto_25610 ) ( not ( = ?auto_25630 ?auto_25618 ) ) ( HOIST-AT ?auto_25626 ?auto_25630 ) ( AVAILABLE ?auto_25626 ) ( SURFACE-AT ?auto_25610 ?auto_25630 ) ( ON ?auto_25610 ?auto_25627 ) ( CLEAR ?auto_25610 ) ( not ( = ?auto_25609 ?auto_25610 ) ) ( not ( = ?auto_25609 ?auto_25627 ) ) ( not ( = ?auto_25610 ?auto_25627 ) ) ( not ( = ?auto_25617 ?auto_25626 ) ) ( IS-CRATE ?auto_25609 ) ( not ( = ?auto_25620 ?auto_25618 ) ) ( HOIST-AT ?auto_25628 ?auto_25620 ) ( AVAILABLE ?auto_25628 ) ( SURFACE-AT ?auto_25609 ?auto_25620 ) ( ON ?auto_25609 ?auto_25629 ) ( CLEAR ?auto_25609 ) ( not ( = ?auto_25608 ?auto_25609 ) ) ( not ( = ?auto_25608 ?auto_25629 ) ) ( not ( = ?auto_25609 ?auto_25629 ) ) ( not ( = ?auto_25617 ?auto_25628 ) ) ( IS-CRATE ?auto_25608 ) ( not ( = ?auto_25622 ?auto_25618 ) ) ( HOIST-AT ?auto_25624 ?auto_25622 ) ( AVAILABLE ?auto_25624 ) ( SURFACE-AT ?auto_25608 ?auto_25622 ) ( ON ?auto_25608 ?auto_25632 ) ( CLEAR ?auto_25608 ) ( not ( = ?auto_25607 ?auto_25608 ) ) ( not ( = ?auto_25607 ?auto_25632 ) ) ( not ( = ?auto_25608 ?auto_25632 ) ) ( not ( = ?auto_25617 ?auto_25624 ) ) ( IS-CRATE ?auto_25607 ) ( not ( = ?auto_25623 ?auto_25618 ) ) ( HOIST-AT ?auto_25636 ?auto_25623 ) ( AVAILABLE ?auto_25636 ) ( SURFACE-AT ?auto_25607 ?auto_25623 ) ( ON ?auto_25607 ?auto_25621 ) ( CLEAR ?auto_25607 ) ( not ( = ?auto_25606 ?auto_25607 ) ) ( not ( = ?auto_25606 ?auto_25621 ) ) ( not ( = ?auto_25607 ?auto_25621 ) ) ( not ( = ?auto_25617 ?auto_25636 ) ) ( IS-CRATE ?auto_25606 ) ( not ( = ?auto_25638 ?auto_25618 ) ) ( HOIST-AT ?auto_25639 ?auto_25638 ) ( AVAILABLE ?auto_25639 ) ( SURFACE-AT ?auto_25606 ?auto_25638 ) ( ON ?auto_25606 ?auto_25631 ) ( CLEAR ?auto_25606 ) ( not ( = ?auto_25605 ?auto_25606 ) ) ( not ( = ?auto_25605 ?auto_25631 ) ) ( not ( = ?auto_25606 ?auto_25631 ) ) ( not ( = ?auto_25617 ?auto_25639 ) ) ( SURFACE-AT ?auto_25604 ?auto_25618 ) ( CLEAR ?auto_25604 ) ( IS-CRATE ?auto_25605 ) ( AVAILABLE ?auto_25617 ) ( not ( = ?auto_25619 ?auto_25618 ) ) ( HOIST-AT ?auto_25637 ?auto_25619 ) ( AVAILABLE ?auto_25637 ) ( SURFACE-AT ?auto_25605 ?auto_25619 ) ( ON ?auto_25605 ?auto_25625 ) ( CLEAR ?auto_25605 ) ( TRUCK-AT ?auto_25614 ?auto_25618 ) ( not ( = ?auto_25604 ?auto_25605 ) ) ( not ( = ?auto_25604 ?auto_25625 ) ) ( not ( = ?auto_25605 ?auto_25625 ) ) ( not ( = ?auto_25617 ?auto_25637 ) ) ( not ( = ?auto_25604 ?auto_25606 ) ) ( not ( = ?auto_25604 ?auto_25631 ) ) ( not ( = ?auto_25606 ?auto_25625 ) ) ( not ( = ?auto_25638 ?auto_25619 ) ) ( not ( = ?auto_25639 ?auto_25637 ) ) ( not ( = ?auto_25631 ?auto_25625 ) ) ( not ( = ?auto_25604 ?auto_25607 ) ) ( not ( = ?auto_25604 ?auto_25621 ) ) ( not ( = ?auto_25605 ?auto_25607 ) ) ( not ( = ?auto_25605 ?auto_25621 ) ) ( not ( = ?auto_25607 ?auto_25631 ) ) ( not ( = ?auto_25607 ?auto_25625 ) ) ( not ( = ?auto_25623 ?auto_25638 ) ) ( not ( = ?auto_25623 ?auto_25619 ) ) ( not ( = ?auto_25636 ?auto_25639 ) ) ( not ( = ?auto_25636 ?auto_25637 ) ) ( not ( = ?auto_25621 ?auto_25631 ) ) ( not ( = ?auto_25621 ?auto_25625 ) ) ( not ( = ?auto_25604 ?auto_25608 ) ) ( not ( = ?auto_25604 ?auto_25632 ) ) ( not ( = ?auto_25605 ?auto_25608 ) ) ( not ( = ?auto_25605 ?auto_25632 ) ) ( not ( = ?auto_25606 ?auto_25608 ) ) ( not ( = ?auto_25606 ?auto_25632 ) ) ( not ( = ?auto_25608 ?auto_25621 ) ) ( not ( = ?auto_25608 ?auto_25631 ) ) ( not ( = ?auto_25608 ?auto_25625 ) ) ( not ( = ?auto_25622 ?auto_25623 ) ) ( not ( = ?auto_25622 ?auto_25638 ) ) ( not ( = ?auto_25622 ?auto_25619 ) ) ( not ( = ?auto_25624 ?auto_25636 ) ) ( not ( = ?auto_25624 ?auto_25639 ) ) ( not ( = ?auto_25624 ?auto_25637 ) ) ( not ( = ?auto_25632 ?auto_25621 ) ) ( not ( = ?auto_25632 ?auto_25631 ) ) ( not ( = ?auto_25632 ?auto_25625 ) ) ( not ( = ?auto_25604 ?auto_25609 ) ) ( not ( = ?auto_25604 ?auto_25629 ) ) ( not ( = ?auto_25605 ?auto_25609 ) ) ( not ( = ?auto_25605 ?auto_25629 ) ) ( not ( = ?auto_25606 ?auto_25609 ) ) ( not ( = ?auto_25606 ?auto_25629 ) ) ( not ( = ?auto_25607 ?auto_25609 ) ) ( not ( = ?auto_25607 ?auto_25629 ) ) ( not ( = ?auto_25609 ?auto_25632 ) ) ( not ( = ?auto_25609 ?auto_25621 ) ) ( not ( = ?auto_25609 ?auto_25631 ) ) ( not ( = ?auto_25609 ?auto_25625 ) ) ( not ( = ?auto_25620 ?auto_25622 ) ) ( not ( = ?auto_25620 ?auto_25623 ) ) ( not ( = ?auto_25620 ?auto_25638 ) ) ( not ( = ?auto_25620 ?auto_25619 ) ) ( not ( = ?auto_25628 ?auto_25624 ) ) ( not ( = ?auto_25628 ?auto_25636 ) ) ( not ( = ?auto_25628 ?auto_25639 ) ) ( not ( = ?auto_25628 ?auto_25637 ) ) ( not ( = ?auto_25629 ?auto_25632 ) ) ( not ( = ?auto_25629 ?auto_25621 ) ) ( not ( = ?auto_25629 ?auto_25631 ) ) ( not ( = ?auto_25629 ?auto_25625 ) ) ( not ( = ?auto_25604 ?auto_25610 ) ) ( not ( = ?auto_25604 ?auto_25627 ) ) ( not ( = ?auto_25605 ?auto_25610 ) ) ( not ( = ?auto_25605 ?auto_25627 ) ) ( not ( = ?auto_25606 ?auto_25610 ) ) ( not ( = ?auto_25606 ?auto_25627 ) ) ( not ( = ?auto_25607 ?auto_25610 ) ) ( not ( = ?auto_25607 ?auto_25627 ) ) ( not ( = ?auto_25608 ?auto_25610 ) ) ( not ( = ?auto_25608 ?auto_25627 ) ) ( not ( = ?auto_25610 ?auto_25629 ) ) ( not ( = ?auto_25610 ?auto_25632 ) ) ( not ( = ?auto_25610 ?auto_25621 ) ) ( not ( = ?auto_25610 ?auto_25631 ) ) ( not ( = ?auto_25610 ?auto_25625 ) ) ( not ( = ?auto_25630 ?auto_25620 ) ) ( not ( = ?auto_25630 ?auto_25622 ) ) ( not ( = ?auto_25630 ?auto_25623 ) ) ( not ( = ?auto_25630 ?auto_25638 ) ) ( not ( = ?auto_25630 ?auto_25619 ) ) ( not ( = ?auto_25626 ?auto_25628 ) ) ( not ( = ?auto_25626 ?auto_25624 ) ) ( not ( = ?auto_25626 ?auto_25636 ) ) ( not ( = ?auto_25626 ?auto_25639 ) ) ( not ( = ?auto_25626 ?auto_25637 ) ) ( not ( = ?auto_25627 ?auto_25629 ) ) ( not ( = ?auto_25627 ?auto_25632 ) ) ( not ( = ?auto_25627 ?auto_25621 ) ) ( not ( = ?auto_25627 ?auto_25631 ) ) ( not ( = ?auto_25627 ?auto_25625 ) ) ( not ( = ?auto_25604 ?auto_25611 ) ) ( not ( = ?auto_25604 ?auto_25635 ) ) ( not ( = ?auto_25605 ?auto_25611 ) ) ( not ( = ?auto_25605 ?auto_25635 ) ) ( not ( = ?auto_25606 ?auto_25611 ) ) ( not ( = ?auto_25606 ?auto_25635 ) ) ( not ( = ?auto_25607 ?auto_25611 ) ) ( not ( = ?auto_25607 ?auto_25635 ) ) ( not ( = ?auto_25608 ?auto_25611 ) ) ( not ( = ?auto_25608 ?auto_25635 ) ) ( not ( = ?auto_25609 ?auto_25611 ) ) ( not ( = ?auto_25609 ?auto_25635 ) ) ( not ( = ?auto_25611 ?auto_25627 ) ) ( not ( = ?auto_25611 ?auto_25629 ) ) ( not ( = ?auto_25611 ?auto_25632 ) ) ( not ( = ?auto_25611 ?auto_25621 ) ) ( not ( = ?auto_25611 ?auto_25631 ) ) ( not ( = ?auto_25611 ?auto_25625 ) ) ( not ( = ?auto_25633 ?auto_25630 ) ) ( not ( = ?auto_25633 ?auto_25620 ) ) ( not ( = ?auto_25633 ?auto_25622 ) ) ( not ( = ?auto_25633 ?auto_25623 ) ) ( not ( = ?auto_25633 ?auto_25638 ) ) ( not ( = ?auto_25633 ?auto_25619 ) ) ( not ( = ?auto_25634 ?auto_25626 ) ) ( not ( = ?auto_25634 ?auto_25628 ) ) ( not ( = ?auto_25634 ?auto_25624 ) ) ( not ( = ?auto_25634 ?auto_25636 ) ) ( not ( = ?auto_25634 ?auto_25639 ) ) ( not ( = ?auto_25634 ?auto_25637 ) ) ( not ( = ?auto_25635 ?auto_25627 ) ) ( not ( = ?auto_25635 ?auto_25629 ) ) ( not ( = ?auto_25635 ?auto_25632 ) ) ( not ( = ?auto_25635 ?auto_25621 ) ) ( not ( = ?auto_25635 ?auto_25631 ) ) ( not ( = ?auto_25635 ?auto_25625 ) ) ( not ( = ?auto_25604 ?auto_25612 ) ) ( not ( = ?auto_25604 ?auto_25613 ) ) ( not ( = ?auto_25605 ?auto_25612 ) ) ( not ( = ?auto_25605 ?auto_25613 ) ) ( not ( = ?auto_25606 ?auto_25612 ) ) ( not ( = ?auto_25606 ?auto_25613 ) ) ( not ( = ?auto_25607 ?auto_25612 ) ) ( not ( = ?auto_25607 ?auto_25613 ) ) ( not ( = ?auto_25608 ?auto_25612 ) ) ( not ( = ?auto_25608 ?auto_25613 ) ) ( not ( = ?auto_25609 ?auto_25612 ) ) ( not ( = ?auto_25609 ?auto_25613 ) ) ( not ( = ?auto_25610 ?auto_25612 ) ) ( not ( = ?auto_25610 ?auto_25613 ) ) ( not ( = ?auto_25612 ?auto_25635 ) ) ( not ( = ?auto_25612 ?auto_25627 ) ) ( not ( = ?auto_25612 ?auto_25629 ) ) ( not ( = ?auto_25612 ?auto_25632 ) ) ( not ( = ?auto_25612 ?auto_25621 ) ) ( not ( = ?auto_25612 ?auto_25631 ) ) ( not ( = ?auto_25612 ?auto_25625 ) ) ( not ( = ?auto_25615 ?auto_25633 ) ) ( not ( = ?auto_25615 ?auto_25630 ) ) ( not ( = ?auto_25615 ?auto_25620 ) ) ( not ( = ?auto_25615 ?auto_25622 ) ) ( not ( = ?auto_25615 ?auto_25623 ) ) ( not ( = ?auto_25615 ?auto_25638 ) ) ( not ( = ?auto_25615 ?auto_25619 ) ) ( not ( = ?auto_25616 ?auto_25634 ) ) ( not ( = ?auto_25616 ?auto_25626 ) ) ( not ( = ?auto_25616 ?auto_25628 ) ) ( not ( = ?auto_25616 ?auto_25624 ) ) ( not ( = ?auto_25616 ?auto_25636 ) ) ( not ( = ?auto_25616 ?auto_25639 ) ) ( not ( = ?auto_25616 ?auto_25637 ) ) ( not ( = ?auto_25613 ?auto_25635 ) ) ( not ( = ?auto_25613 ?auto_25627 ) ) ( not ( = ?auto_25613 ?auto_25629 ) ) ( not ( = ?auto_25613 ?auto_25632 ) ) ( not ( = ?auto_25613 ?auto_25621 ) ) ( not ( = ?auto_25613 ?auto_25631 ) ) ( not ( = ?auto_25613 ?auto_25625 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_25604 ?auto_25605 ?auto_25606 ?auto_25607 ?auto_25608 ?auto_25609 ?auto_25610 ?auto_25611 )
      ( MAKE-1CRATE ?auto_25611 ?auto_25612 )
      ( MAKE-8CRATE-VERIFY ?auto_25604 ?auto_25605 ?auto_25606 ?auto_25607 ?auto_25608 ?auto_25609 ?auto_25610 ?auto_25611 ?auto_25612 ) )
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
      ?auto_25667 - SURFACE
      ?auto_25668 - SURFACE
      ?auto_25669 - SURFACE
    )
    :vars
    (
      ?auto_25672 - HOIST
      ?auto_25674 - PLACE
      ?auto_25675 - PLACE
      ?auto_25670 - HOIST
      ?auto_25671 - SURFACE
      ?auto_25686 - PLACE
      ?auto_25688 - HOIST
      ?auto_25689 - SURFACE
      ?auto_25681 - PLACE
      ?auto_25678 - HOIST
      ?auto_25694 - SURFACE
      ?auto_25696 - PLACE
      ?auto_25692 - HOIST
      ?auto_25683 - SURFACE
      ?auto_25698 - PLACE
      ?auto_25685 - HOIST
      ?auto_25684 - SURFACE
      ?auto_25687 - PLACE
      ?auto_25695 - HOIST
      ?auto_25697 - SURFACE
      ?auto_25690 - PLACE
      ?auto_25676 - HOIST
      ?auto_25679 - SURFACE
      ?auto_25682 - PLACE
      ?auto_25677 - HOIST
      ?auto_25699 - SURFACE
      ?auto_25693 - PLACE
      ?auto_25680 - HOIST
      ?auto_25691 - SURFACE
      ?auto_25673 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25672 ?auto_25674 ) ( IS-CRATE ?auto_25669 ) ( not ( = ?auto_25675 ?auto_25674 ) ) ( HOIST-AT ?auto_25670 ?auto_25675 ) ( AVAILABLE ?auto_25670 ) ( SURFACE-AT ?auto_25669 ?auto_25675 ) ( ON ?auto_25669 ?auto_25671 ) ( CLEAR ?auto_25669 ) ( not ( = ?auto_25668 ?auto_25669 ) ) ( not ( = ?auto_25668 ?auto_25671 ) ) ( not ( = ?auto_25669 ?auto_25671 ) ) ( not ( = ?auto_25672 ?auto_25670 ) ) ( IS-CRATE ?auto_25668 ) ( not ( = ?auto_25686 ?auto_25674 ) ) ( HOIST-AT ?auto_25688 ?auto_25686 ) ( AVAILABLE ?auto_25688 ) ( SURFACE-AT ?auto_25668 ?auto_25686 ) ( ON ?auto_25668 ?auto_25689 ) ( CLEAR ?auto_25668 ) ( not ( = ?auto_25667 ?auto_25668 ) ) ( not ( = ?auto_25667 ?auto_25689 ) ) ( not ( = ?auto_25668 ?auto_25689 ) ) ( not ( = ?auto_25672 ?auto_25688 ) ) ( IS-CRATE ?auto_25667 ) ( not ( = ?auto_25681 ?auto_25674 ) ) ( HOIST-AT ?auto_25678 ?auto_25681 ) ( AVAILABLE ?auto_25678 ) ( SURFACE-AT ?auto_25667 ?auto_25681 ) ( ON ?auto_25667 ?auto_25694 ) ( CLEAR ?auto_25667 ) ( not ( = ?auto_25666 ?auto_25667 ) ) ( not ( = ?auto_25666 ?auto_25694 ) ) ( not ( = ?auto_25667 ?auto_25694 ) ) ( not ( = ?auto_25672 ?auto_25678 ) ) ( IS-CRATE ?auto_25666 ) ( not ( = ?auto_25696 ?auto_25674 ) ) ( HOIST-AT ?auto_25692 ?auto_25696 ) ( AVAILABLE ?auto_25692 ) ( SURFACE-AT ?auto_25666 ?auto_25696 ) ( ON ?auto_25666 ?auto_25683 ) ( CLEAR ?auto_25666 ) ( not ( = ?auto_25665 ?auto_25666 ) ) ( not ( = ?auto_25665 ?auto_25683 ) ) ( not ( = ?auto_25666 ?auto_25683 ) ) ( not ( = ?auto_25672 ?auto_25692 ) ) ( IS-CRATE ?auto_25665 ) ( not ( = ?auto_25698 ?auto_25674 ) ) ( HOIST-AT ?auto_25685 ?auto_25698 ) ( AVAILABLE ?auto_25685 ) ( SURFACE-AT ?auto_25665 ?auto_25698 ) ( ON ?auto_25665 ?auto_25684 ) ( CLEAR ?auto_25665 ) ( not ( = ?auto_25664 ?auto_25665 ) ) ( not ( = ?auto_25664 ?auto_25684 ) ) ( not ( = ?auto_25665 ?auto_25684 ) ) ( not ( = ?auto_25672 ?auto_25685 ) ) ( IS-CRATE ?auto_25664 ) ( not ( = ?auto_25687 ?auto_25674 ) ) ( HOIST-AT ?auto_25695 ?auto_25687 ) ( AVAILABLE ?auto_25695 ) ( SURFACE-AT ?auto_25664 ?auto_25687 ) ( ON ?auto_25664 ?auto_25697 ) ( CLEAR ?auto_25664 ) ( not ( = ?auto_25663 ?auto_25664 ) ) ( not ( = ?auto_25663 ?auto_25697 ) ) ( not ( = ?auto_25664 ?auto_25697 ) ) ( not ( = ?auto_25672 ?auto_25695 ) ) ( IS-CRATE ?auto_25663 ) ( not ( = ?auto_25690 ?auto_25674 ) ) ( HOIST-AT ?auto_25676 ?auto_25690 ) ( AVAILABLE ?auto_25676 ) ( SURFACE-AT ?auto_25663 ?auto_25690 ) ( ON ?auto_25663 ?auto_25679 ) ( CLEAR ?auto_25663 ) ( not ( = ?auto_25662 ?auto_25663 ) ) ( not ( = ?auto_25662 ?auto_25679 ) ) ( not ( = ?auto_25663 ?auto_25679 ) ) ( not ( = ?auto_25672 ?auto_25676 ) ) ( IS-CRATE ?auto_25662 ) ( not ( = ?auto_25682 ?auto_25674 ) ) ( HOIST-AT ?auto_25677 ?auto_25682 ) ( AVAILABLE ?auto_25677 ) ( SURFACE-AT ?auto_25662 ?auto_25682 ) ( ON ?auto_25662 ?auto_25699 ) ( CLEAR ?auto_25662 ) ( not ( = ?auto_25661 ?auto_25662 ) ) ( not ( = ?auto_25661 ?auto_25699 ) ) ( not ( = ?auto_25662 ?auto_25699 ) ) ( not ( = ?auto_25672 ?auto_25677 ) ) ( SURFACE-AT ?auto_25660 ?auto_25674 ) ( CLEAR ?auto_25660 ) ( IS-CRATE ?auto_25661 ) ( AVAILABLE ?auto_25672 ) ( not ( = ?auto_25693 ?auto_25674 ) ) ( HOIST-AT ?auto_25680 ?auto_25693 ) ( AVAILABLE ?auto_25680 ) ( SURFACE-AT ?auto_25661 ?auto_25693 ) ( ON ?auto_25661 ?auto_25691 ) ( CLEAR ?auto_25661 ) ( TRUCK-AT ?auto_25673 ?auto_25674 ) ( not ( = ?auto_25660 ?auto_25661 ) ) ( not ( = ?auto_25660 ?auto_25691 ) ) ( not ( = ?auto_25661 ?auto_25691 ) ) ( not ( = ?auto_25672 ?auto_25680 ) ) ( not ( = ?auto_25660 ?auto_25662 ) ) ( not ( = ?auto_25660 ?auto_25699 ) ) ( not ( = ?auto_25662 ?auto_25691 ) ) ( not ( = ?auto_25682 ?auto_25693 ) ) ( not ( = ?auto_25677 ?auto_25680 ) ) ( not ( = ?auto_25699 ?auto_25691 ) ) ( not ( = ?auto_25660 ?auto_25663 ) ) ( not ( = ?auto_25660 ?auto_25679 ) ) ( not ( = ?auto_25661 ?auto_25663 ) ) ( not ( = ?auto_25661 ?auto_25679 ) ) ( not ( = ?auto_25663 ?auto_25699 ) ) ( not ( = ?auto_25663 ?auto_25691 ) ) ( not ( = ?auto_25690 ?auto_25682 ) ) ( not ( = ?auto_25690 ?auto_25693 ) ) ( not ( = ?auto_25676 ?auto_25677 ) ) ( not ( = ?auto_25676 ?auto_25680 ) ) ( not ( = ?auto_25679 ?auto_25699 ) ) ( not ( = ?auto_25679 ?auto_25691 ) ) ( not ( = ?auto_25660 ?auto_25664 ) ) ( not ( = ?auto_25660 ?auto_25697 ) ) ( not ( = ?auto_25661 ?auto_25664 ) ) ( not ( = ?auto_25661 ?auto_25697 ) ) ( not ( = ?auto_25662 ?auto_25664 ) ) ( not ( = ?auto_25662 ?auto_25697 ) ) ( not ( = ?auto_25664 ?auto_25679 ) ) ( not ( = ?auto_25664 ?auto_25699 ) ) ( not ( = ?auto_25664 ?auto_25691 ) ) ( not ( = ?auto_25687 ?auto_25690 ) ) ( not ( = ?auto_25687 ?auto_25682 ) ) ( not ( = ?auto_25687 ?auto_25693 ) ) ( not ( = ?auto_25695 ?auto_25676 ) ) ( not ( = ?auto_25695 ?auto_25677 ) ) ( not ( = ?auto_25695 ?auto_25680 ) ) ( not ( = ?auto_25697 ?auto_25679 ) ) ( not ( = ?auto_25697 ?auto_25699 ) ) ( not ( = ?auto_25697 ?auto_25691 ) ) ( not ( = ?auto_25660 ?auto_25665 ) ) ( not ( = ?auto_25660 ?auto_25684 ) ) ( not ( = ?auto_25661 ?auto_25665 ) ) ( not ( = ?auto_25661 ?auto_25684 ) ) ( not ( = ?auto_25662 ?auto_25665 ) ) ( not ( = ?auto_25662 ?auto_25684 ) ) ( not ( = ?auto_25663 ?auto_25665 ) ) ( not ( = ?auto_25663 ?auto_25684 ) ) ( not ( = ?auto_25665 ?auto_25697 ) ) ( not ( = ?auto_25665 ?auto_25679 ) ) ( not ( = ?auto_25665 ?auto_25699 ) ) ( not ( = ?auto_25665 ?auto_25691 ) ) ( not ( = ?auto_25698 ?auto_25687 ) ) ( not ( = ?auto_25698 ?auto_25690 ) ) ( not ( = ?auto_25698 ?auto_25682 ) ) ( not ( = ?auto_25698 ?auto_25693 ) ) ( not ( = ?auto_25685 ?auto_25695 ) ) ( not ( = ?auto_25685 ?auto_25676 ) ) ( not ( = ?auto_25685 ?auto_25677 ) ) ( not ( = ?auto_25685 ?auto_25680 ) ) ( not ( = ?auto_25684 ?auto_25697 ) ) ( not ( = ?auto_25684 ?auto_25679 ) ) ( not ( = ?auto_25684 ?auto_25699 ) ) ( not ( = ?auto_25684 ?auto_25691 ) ) ( not ( = ?auto_25660 ?auto_25666 ) ) ( not ( = ?auto_25660 ?auto_25683 ) ) ( not ( = ?auto_25661 ?auto_25666 ) ) ( not ( = ?auto_25661 ?auto_25683 ) ) ( not ( = ?auto_25662 ?auto_25666 ) ) ( not ( = ?auto_25662 ?auto_25683 ) ) ( not ( = ?auto_25663 ?auto_25666 ) ) ( not ( = ?auto_25663 ?auto_25683 ) ) ( not ( = ?auto_25664 ?auto_25666 ) ) ( not ( = ?auto_25664 ?auto_25683 ) ) ( not ( = ?auto_25666 ?auto_25684 ) ) ( not ( = ?auto_25666 ?auto_25697 ) ) ( not ( = ?auto_25666 ?auto_25679 ) ) ( not ( = ?auto_25666 ?auto_25699 ) ) ( not ( = ?auto_25666 ?auto_25691 ) ) ( not ( = ?auto_25696 ?auto_25698 ) ) ( not ( = ?auto_25696 ?auto_25687 ) ) ( not ( = ?auto_25696 ?auto_25690 ) ) ( not ( = ?auto_25696 ?auto_25682 ) ) ( not ( = ?auto_25696 ?auto_25693 ) ) ( not ( = ?auto_25692 ?auto_25685 ) ) ( not ( = ?auto_25692 ?auto_25695 ) ) ( not ( = ?auto_25692 ?auto_25676 ) ) ( not ( = ?auto_25692 ?auto_25677 ) ) ( not ( = ?auto_25692 ?auto_25680 ) ) ( not ( = ?auto_25683 ?auto_25684 ) ) ( not ( = ?auto_25683 ?auto_25697 ) ) ( not ( = ?auto_25683 ?auto_25679 ) ) ( not ( = ?auto_25683 ?auto_25699 ) ) ( not ( = ?auto_25683 ?auto_25691 ) ) ( not ( = ?auto_25660 ?auto_25667 ) ) ( not ( = ?auto_25660 ?auto_25694 ) ) ( not ( = ?auto_25661 ?auto_25667 ) ) ( not ( = ?auto_25661 ?auto_25694 ) ) ( not ( = ?auto_25662 ?auto_25667 ) ) ( not ( = ?auto_25662 ?auto_25694 ) ) ( not ( = ?auto_25663 ?auto_25667 ) ) ( not ( = ?auto_25663 ?auto_25694 ) ) ( not ( = ?auto_25664 ?auto_25667 ) ) ( not ( = ?auto_25664 ?auto_25694 ) ) ( not ( = ?auto_25665 ?auto_25667 ) ) ( not ( = ?auto_25665 ?auto_25694 ) ) ( not ( = ?auto_25667 ?auto_25683 ) ) ( not ( = ?auto_25667 ?auto_25684 ) ) ( not ( = ?auto_25667 ?auto_25697 ) ) ( not ( = ?auto_25667 ?auto_25679 ) ) ( not ( = ?auto_25667 ?auto_25699 ) ) ( not ( = ?auto_25667 ?auto_25691 ) ) ( not ( = ?auto_25681 ?auto_25696 ) ) ( not ( = ?auto_25681 ?auto_25698 ) ) ( not ( = ?auto_25681 ?auto_25687 ) ) ( not ( = ?auto_25681 ?auto_25690 ) ) ( not ( = ?auto_25681 ?auto_25682 ) ) ( not ( = ?auto_25681 ?auto_25693 ) ) ( not ( = ?auto_25678 ?auto_25692 ) ) ( not ( = ?auto_25678 ?auto_25685 ) ) ( not ( = ?auto_25678 ?auto_25695 ) ) ( not ( = ?auto_25678 ?auto_25676 ) ) ( not ( = ?auto_25678 ?auto_25677 ) ) ( not ( = ?auto_25678 ?auto_25680 ) ) ( not ( = ?auto_25694 ?auto_25683 ) ) ( not ( = ?auto_25694 ?auto_25684 ) ) ( not ( = ?auto_25694 ?auto_25697 ) ) ( not ( = ?auto_25694 ?auto_25679 ) ) ( not ( = ?auto_25694 ?auto_25699 ) ) ( not ( = ?auto_25694 ?auto_25691 ) ) ( not ( = ?auto_25660 ?auto_25668 ) ) ( not ( = ?auto_25660 ?auto_25689 ) ) ( not ( = ?auto_25661 ?auto_25668 ) ) ( not ( = ?auto_25661 ?auto_25689 ) ) ( not ( = ?auto_25662 ?auto_25668 ) ) ( not ( = ?auto_25662 ?auto_25689 ) ) ( not ( = ?auto_25663 ?auto_25668 ) ) ( not ( = ?auto_25663 ?auto_25689 ) ) ( not ( = ?auto_25664 ?auto_25668 ) ) ( not ( = ?auto_25664 ?auto_25689 ) ) ( not ( = ?auto_25665 ?auto_25668 ) ) ( not ( = ?auto_25665 ?auto_25689 ) ) ( not ( = ?auto_25666 ?auto_25668 ) ) ( not ( = ?auto_25666 ?auto_25689 ) ) ( not ( = ?auto_25668 ?auto_25694 ) ) ( not ( = ?auto_25668 ?auto_25683 ) ) ( not ( = ?auto_25668 ?auto_25684 ) ) ( not ( = ?auto_25668 ?auto_25697 ) ) ( not ( = ?auto_25668 ?auto_25679 ) ) ( not ( = ?auto_25668 ?auto_25699 ) ) ( not ( = ?auto_25668 ?auto_25691 ) ) ( not ( = ?auto_25686 ?auto_25681 ) ) ( not ( = ?auto_25686 ?auto_25696 ) ) ( not ( = ?auto_25686 ?auto_25698 ) ) ( not ( = ?auto_25686 ?auto_25687 ) ) ( not ( = ?auto_25686 ?auto_25690 ) ) ( not ( = ?auto_25686 ?auto_25682 ) ) ( not ( = ?auto_25686 ?auto_25693 ) ) ( not ( = ?auto_25688 ?auto_25678 ) ) ( not ( = ?auto_25688 ?auto_25692 ) ) ( not ( = ?auto_25688 ?auto_25685 ) ) ( not ( = ?auto_25688 ?auto_25695 ) ) ( not ( = ?auto_25688 ?auto_25676 ) ) ( not ( = ?auto_25688 ?auto_25677 ) ) ( not ( = ?auto_25688 ?auto_25680 ) ) ( not ( = ?auto_25689 ?auto_25694 ) ) ( not ( = ?auto_25689 ?auto_25683 ) ) ( not ( = ?auto_25689 ?auto_25684 ) ) ( not ( = ?auto_25689 ?auto_25697 ) ) ( not ( = ?auto_25689 ?auto_25679 ) ) ( not ( = ?auto_25689 ?auto_25699 ) ) ( not ( = ?auto_25689 ?auto_25691 ) ) ( not ( = ?auto_25660 ?auto_25669 ) ) ( not ( = ?auto_25660 ?auto_25671 ) ) ( not ( = ?auto_25661 ?auto_25669 ) ) ( not ( = ?auto_25661 ?auto_25671 ) ) ( not ( = ?auto_25662 ?auto_25669 ) ) ( not ( = ?auto_25662 ?auto_25671 ) ) ( not ( = ?auto_25663 ?auto_25669 ) ) ( not ( = ?auto_25663 ?auto_25671 ) ) ( not ( = ?auto_25664 ?auto_25669 ) ) ( not ( = ?auto_25664 ?auto_25671 ) ) ( not ( = ?auto_25665 ?auto_25669 ) ) ( not ( = ?auto_25665 ?auto_25671 ) ) ( not ( = ?auto_25666 ?auto_25669 ) ) ( not ( = ?auto_25666 ?auto_25671 ) ) ( not ( = ?auto_25667 ?auto_25669 ) ) ( not ( = ?auto_25667 ?auto_25671 ) ) ( not ( = ?auto_25669 ?auto_25689 ) ) ( not ( = ?auto_25669 ?auto_25694 ) ) ( not ( = ?auto_25669 ?auto_25683 ) ) ( not ( = ?auto_25669 ?auto_25684 ) ) ( not ( = ?auto_25669 ?auto_25697 ) ) ( not ( = ?auto_25669 ?auto_25679 ) ) ( not ( = ?auto_25669 ?auto_25699 ) ) ( not ( = ?auto_25669 ?auto_25691 ) ) ( not ( = ?auto_25675 ?auto_25686 ) ) ( not ( = ?auto_25675 ?auto_25681 ) ) ( not ( = ?auto_25675 ?auto_25696 ) ) ( not ( = ?auto_25675 ?auto_25698 ) ) ( not ( = ?auto_25675 ?auto_25687 ) ) ( not ( = ?auto_25675 ?auto_25690 ) ) ( not ( = ?auto_25675 ?auto_25682 ) ) ( not ( = ?auto_25675 ?auto_25693 ) ) ( not ( = ?auto_25670 ?auto_25688 ) ) ( not ( = ?auto_25670 ?auto_25678 ) ) ( not ( = ?auto_25670 ?auto_25692 ) ) ( not ( = ?auto_25670 ?auto_25685 ) ) ( not ( = ?auto_25670 ?auto_25695 ) ) ( not ( = ?auto_25670 ?auto_25676 ) ) ( not ( = ?auto_25670 ?auto_25677 ) ) ( not ( = ?auto_25670 ?auto_25680 ) ) ( not ( = ?auto_25671 ?auto_25689 ) ) ( not ( = ?auto_25671 ?auto_25694 ) ) ( not ( = ?auto_25671 ?auto_25683 ) ) ( not ( = ?auto_25671 ?auto_25684 ) ) ( not ( = ?auto_25671 ?auto_25697 ) ) ( not ( = ?auto_25671 ?auto_25679 ) ) ( not ( = ?auto_25671 ?auto_25699 ) ) ( not ( = ?auto_25671 ?auto_25691 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_25660 ?auto_25661 ?auto_25662 ?auto_25663 ?auto_25664 ?auto_25665 ?auto_25666 ?auto_25667 ?auto_25668 )
      ( MAKE-1CRATE ?auto_25668 ?auto_25669 )
      ( MAKE-9CRATE-VERIFY ?auto_25660 ?auto_25661 ?auto_25662 ?auto_25663 ?auto_25664 ?auto_25665 ?auto_25666 ?auto_25667 ?auto_25668 ?auto_25669 ) )
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
      ?auto_25728 - SURFACE
      ?auto_25729 - SURFACE
      ?auto_25730 - SURFACE
      ?auto_25731 - SURFACE
    )
    :vars
    (
      ?auto_25736 - HOIST
      ?auto_25732 - PLACE
      ?auto_25734 - PLACE
      ?auto_25737 - HOIST
      ?auto_25735 - SURFACE
      ?auto_25758 - PLACE
      ?auto_25743 - HOIST
      ?auto_25747 - SURFACE
      ?auto_25762 - PLACE
      ?auto_25761 - HOIST
      ?auto_25751 - SURFACE
      ?auto_25749 - PLACE
      ?auto_25750 - HOIST
      ?auto_25740 - SURFACE
      ?auto_25757 - PLACE
      ?auto_25763 - HOIST
      ?auto_25738 - SURFACE
      ?auto_25753 - PLACE
      ?auto_25739 - HOIST
      ?auto_25744 - SURFACE
      ?auto_25760 - PLACE
      ?auto_25745 - HOIST
      ?auto_25754 - SURFACE
      ?auto_25748 - PLACE
      ?auto_25746 - HOIST
      ?auto_25764 - SURFACE
      ?auto_25759 - PLACE
      ?auto_25741 - HOIST
      ?auto_25752 - SURFACE
      ?auto_25755 - PLACE
      ?auto_25742 - HOIST
      ?auto_25756 - SURFACE
      ?auto_25733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25736 ?auto_25732 ) ( IS-CRATE ?auto_25731 ) ( not ( = ?auto_25734 ?auto_25732 ) ) ( HOIST-AT ?auto_25737 ?auto_25734 ) ( AVAILABLE ?auto_25737 ) ( SURFACE-AT ?auto_25731 ?auto_25734 ) ( ON ?auto_25731 ?auto_25735 ) ( CLEAR ?auto_25731 ) ( not ( = ?auto_25730 ?auto_25731 ) ) ( not ( = ?auto_25730 ?auto_25735 ) ) ( not ( = ?auto_25731 ?auto_25735 ) ) ( not ( = ?auto_25736 ?auto_25737 ) ) ( IS-CRATE ?auto_25730 ) ( not ( = ?auto_25758 ?auto_25732 ) ) ( HOIST-AT ?auto_25743 ?auto_25758 ) ( AVAILABLE ?auto_25743 ) ( SURFACE-AT ?auto_25730 ?auto_25758 ) ( ON ?auto_25730 ?auto_25747 ) ( CLEAR ?auto_25730 ) ( not ( = ?auto_25729 ?auto_25730 ) ) ( not ( = ?auto_25729 ?auto_25747 ) ) ( not ( = ?auto_25730 ?auto_25747 ) ) ( not ( = ?auto_25736 ?auto_25743 ) ) ( IS-CRATE ?auto_25729 ) ( not ( = ?auto_25762 ?auto_25732 ) ) ( HOIST-AT ?auto_25761 ?auto_25762 ) ( AVAILABLE ?auto_25761 ) ( SURFACE-AT ?auto_25729 ?auto_25762 ) ( ON ?auto_25729 ?auto_25751 ) ( CLEAR ?auto_25729 ) ( not ( = ?auto_25728 ?auto_25729 ) ) ( not ( = ?auto_25728 ?auto_25751 ) ) ( not ( = ?auto_25729 ?auto_25751 ) ) ( not ( = ?auto_25736 ?auto_25761 ) ) ( IS-CRATE ?auto_25728 ) ( not ( = ?auto_25749 ?auto_25732 ) ) ( HOIST-AT ?auto_25750 ?auto_25749 ) ( AVAILABLE ?auto_25750 ) ( SURFACE-AT ?auto_25728 ?auto_25749 ) ( ON ?auto_25728 ?auto_25740 ) ( CLEAR ?auto_25728 ) ( not ( = ?auto_25727 ?auto_25728 ) ) ( not ( = ?auto_25727 ?auto_25740 ) ) ( not ( = ?auto_25728 ?auto_25740 ) ) ( not ( = ?auto_25736 ?auto_25750 ) ) ( IS-CRATE ?auto_25727 ) ( not ( = ?auto_25757 ?auto_25732 ) ) ( HOIST-AT ?auto_25763 ?auto_25757 ) ( AVAILABLE ?auto_25763 ) ( SURFACE-AT ?auto_25727 ?auto_25757 ) ( ON ?auto_25727 ?auto_25738 ) ( CLEAR ?auto_25727 ) ( not ( = ?auto_25726 ?auto_25727 ) ) ( not ( = ?auto_25726 ?auto_25738 ) ) ( not ( = ?auto_25727 ?auto_25738 ) ) ( not ( = ?auto_25736 ?auto_25763 ) ) ( IS-CRATE ?auto_25726 ) ( not ( = ?auto_25753 ?auto_25732 ) ) ( HOIST-AT ?auto_25739 ?auto_25753 ) ( AVAILABLE ?auto_25739 ) ( SURFACE-AT ?auto_25726 ?auto_25753 ) ( ON ?auto_25726 ?auto_25744 ) ( CLEAR ?auto_25726 ) ( not ( = ?auto_25725 ?auto_25726 ) ) ( not ( = ?auto_25725 ?auto_25744 ) ) ( not ( = ?auto_25726 ?auto_25744 ) ) ( not ( = ?auto_25736 ?auto_25739 ) ) ( IS-CRATE ?auto_25725 ) ( not ( = ?auto_25760 ?auto_25732 ) ) ( HOIST-AT ?auto_25745 ?auto_25760 ) ( AVAILABLE ?auto_25745 ) ( SURFACE-AT ?auto_25725 ?auto_25760 ) ( ON ?auto_25725 ?auto_25754 ) ( CLEAR ?auto_25725 ) ( not ( = ?auto_25724 ?auto_25725 ) ) ( not ( = ?auto_25724 ?auto_25754 ) ) ( not ( = ?auto_25725 ?auto_25754 ) ) ( not ( = ?auto_25736 ?auto_25745 ) ) ( IS-CRATE ?auto_25724 ) ( not ( = ?auto_25748 ?auto_25732 ) ) ( HOIST-AT ?auto_25746 ?auto_25748 ) ( AVAILABLE ?auto_25746 ) ( SURFACE-AT ?auto_25724 ?auto_25748 ) ( ON ?auto_25724 ?auto_25764 ) ( CLEAR ?auto_25724 ) ( not ( = ?auto_25723 ?auto_25724 ) ) ( not ( = ?auto_25723 ?auto_25764 ) ) ( not ( = ?auto_25724 ?auto_25764 ) ) ( not ( = ?auto_25736 ?auto_25746 ) ) ( IS-CRATE ?auto_25723 ) ( not ( = ?auto_25759 ?auto_25732 ) ) ( HOIST-AT ?auto_25741 ?auto_25759 ) ( AVAILABLE ?auto_25741 ) ( SURFACE-AT ?auto_25723 ?auto_25759 ) ( ON ?auto_25723 ?auto_25752 ) ( CLEAR ?auto_25723 ) ( not ( = ?auto_25722 ?auto_25723 ) ) ( not ( = ?auto_25722 ?auto_25752 ) ) ( not ( = ?auto_25723 ?auto_25752 ) ) ( not ( = ?auto_25736 ?auto_25741 ) ) ( SURFACE-AT ?auto_25721 ?auto_25732 ) ( CLEAR ?auto_25721 ) ( IS-CRATE ?auto_25722 ) ( AVAILABLE ?auto_25736 ) ( not ( = ?auto_25755 ?auto_25732 ) ) ( HOIST-AT ?auto_25742 ?auto_25755 ) ( AVAILABLE ?auto_25742 ) ( SURFACE-AT ?auto_25722 ?auto_25755 ) ( ON ?auto_25722 ?auto_25756 ) ( CLEAR ?auto_25722 ) ( TRUCK-AT ?auto_25733 ?auto_25732 ) ( not ( = ?auto_25721 ?auto_25722 ) ) ( not ( = ?auto_25721 ?auto_25756 ) ) ( not ( = ?auto_25722 ?auto_25756 ) ) ( not ( = ?auto_25736 ?auto_25742 ) ) ( not ( = ?auto_25721 ?auto_25723 ) ) ( not ( = ?auto_25721 ?auto_25752 ) ) ( not ( = ?auto_25723 ?auto_25756 ) ) ( not ( = ?auto_25759 ?auto_25755 ) ) ( not ( = ?auto_25741 ?auto_25742 ) ) ( not ( = ?auto_25752 ?auto_25756 ) ) ( not ( = ?auto_25721 ?auto_25724 ) ) ( not ( = ?auto_25721 ?auto_25764 ) ) ( not ( = ?auto_25722 ?auto_25724 ) ) ( not ( = ?auto_25722 ?auto_25764 ) ) ( not ( = ?auto_25724 ?auto_25752 ) ) ( not ( = ?auto_25724 ?auto_25756 ) ) ( not ( = ?auto_25748 ?auto_25759 ) ) ( not ( = ?auto_25748 ?auto_25755 ) ) ( not ( = ?auto_25746 ?auto_25741 ) ) ( not ( = ?auto_25746 ?auto_25742 ) ) ( not ( = ?auto_25764 ?auto_25752 ) ) ( not ( = ?auto_25764 ?auto_25756 ) ) ( not ( = ?auto_25721 ?auto_25725 ) ) ( not ( = ?auto_25721 ?auto_25754 ) ) ( not ( = ?auto_25722 ?auto_25725 ) ) ( not ( = ?auto_25722 ?auto_25754 ) ) ( not ( = ?auto_25723 ?auto_25725 ) ) ( not ( = ?auto_25723 ?auto_25754 ) ) ( not ( = ?auto_25725 ?auto_25764 ) ) ( not ( = ?auto_25725 ?auto_25752 ) ) ( not ( = ?auto_25725 ?auto_25756 ) ) ( not ( = ?auto_25760 ?auto_25748 ) ) ( not ( = ?auto_25760 ?auto_25759 ) ) ( not ( = ?auto_25760 ?auto_25755 ) ) ( not ( = ?auto_25745 ?auto_25746 ) ) ( not ( = ?auto_25745 ?auto_25741 ) ) ( not ( = ?auto_25745 ?auto_25742 ) ) ( not ( = ?auto_25754 ?auto_25764 ) ) ( not ( = ?auto_25754 ?auto_25752 ) ) ( not ( = ?auto_25754 ?auto_25756 ) ) ( not ( = ?auto_25721 ?auto_25726 ) ) ( not ( = ?auto_25721 ?auto_25744 ) ) ( not ( = ?auto_25722 ?auto_25726 ) ) ( not ( = ?auto_25722 ?auto_25744 ) ) ( not ( = ?auto_25723 ?auto_25726 ) ) ( not ( = ?auto_25723 ?auto_25744 ) ) ( not ( = ?auto_25724 ?auto_25726 ) ) ( not ( = ?auto_25724 ?auto_25744 ) ) ( not ( = ?auto_25726 ?auto_25754 ) ) ( not ( = ?auto_25726 ?auto_25764 ) ) ( not ( = ?auto_25726 ?auto_25752 ) ) ( not ( = ?auto_25726 ?auto_25756 ) ) ( not ( = ?auto_25753 ?auto_25760 ) ) ( not ( = ?auto_25753 ?auto_25748 ) ) ( not ( = ?auto_25753 ?auto_25759 ) ) ( not ( = ?auto_25753 ?auto_25755 ) ) ( not ( = ?auto_25739 ?auto_25745 ) ) ( not ( = ?auto_25739 ?auto_25746 ) ) ( not ( = ?auto_25739 ?auto_25741 ) ) ( not ( = ?auto_25739 ?auto_25742 ) ) ( not ( = ?auto_25744 ?auto_25754 ) ) ( not ( = ?auto_25744 ?auto_25764 ) ) ( not ( = ?auto_25744 ?auto_25752 ) ) ( not ( = ?auto_25744 ?auto_25756 ) ) ( not ( = ?auto_25721 ?auto_25727 ) ) ( not ( = ?auto_25721 ?auto_25738 ) ) ( not ( = ?auto_25722 ?auto_25727 ) ) ( not ( = ?auto_25722 ?auto_25738 ) ) ( not ( = ?auto_25723 ?auto_25727 ) ) ( not ( = ?auto_25723 ?auto_25738 ) ) ( not ( = ?auto_25724 ?auto_25727 ) ) ( not ( = ?auto_25724 ?auto_25738 ) ) ( not ( = ?auto_25725 ?auto_25727 ) ) ( not ( = ?auto_25725 ?auto_25738 ) ) ( not ( = ?auto_25727 ?auto_25744 ) ) ( not ( = ?auto_25727 ?auto_25754 ) ) ( not ( = ?auto_25727 ?auto_25764 ) ) ( not ( = ?auto_25727 ?auto_25752 ) ) ( not ( = ?auto_25727 ?auto_25756 ) ) ( not ( = ?auto_25757 ?auto_25753 ) ) ( not ( = ?auto_25757 ?auto_25760 ) ) ( not ( = ?auto_25757 ?auto_25748 ) ) ( not ( = ?auto_25757 ?auto_25759 ) ) ( not ( = ?auto_25757 ?auto_25755 ) ) ( not ( = ?auto_25763 ?auto_25739 ) ) ( not ( = ?auto_25763 ?auto_25745 ) ) ( not ( = ?auto_25763 ?auto_25746 ) ) ( not ( = ?auto_25763 ?auto_25741 ) ) ( not ( = ?auto_25763 ?auto_25742 ) ) ( not ( = ?auto_25738 ?auto_25744 ) ) ( not ( = ?auto_25738 ?auto_25754 ) ) ( not ( = ?auto_25738 ?auto_25764 ) ) ( not ( = ?auto_25738 ?auto_25752 ) ) ( not ( = ?auto_25738 ?auto_25756 ) ) ( not ( = ?auto_25721 ?auto_25728 ) ) ( not ( = ?auto_25721 ?auto_25740 ) ) ( not ( = ?auto_25722 ?auto_25728 ) ) ( not ( = ?auto_25722 ?auto_25740 ) ) ( not ( = ?auto_25723 ?auto_25728 ) ) ( not ( = ?auto_25723 ?auto_25740 ) ) ( not ( = ?auto_25724 ?auto_25728 ) ) ( not ( = ?auto_25724 ?auto_25740 ) ) ( not ( = ?auto_25725 ?auto_25728 ) ) ( not ( = ?auto_25725 ?auto_25740 ) ) ( not ( = ?auto_25726 ?auto_25728 ) ) ( not ( = ?auto_25726 ?auto_25740 ) ) ( not ( = ?auto_25728 ?auto_25738 ) ) ( not ( = ?auto_25728 ?auto_25744 ) ) ( not ( = ?auto_25728 ?auto_25754 ) ) ( not ( = ?auto_25728 ?auto_25764 ) ) ( not ( = ?auto_25728 ?auto_25752 ) ) ( not ( = ?auto_25728 ?auto_25756 ) ) ( not ( = ?auto_25749 ?auto_25757 ) ) ( not ( = ?auto_25749 ?auto_25753 ) ) ( not ( = ?auto_25749 ?auto_25760 ) ) ( not ( = ?auto_25749 ?auto_25748 ) ) ( not ( = ?auto_25749 ?auto_25759 ) ) ( not ( = ?auto_25749 ?auto_25755 ) ) ( not ( = ?auto_25750 ?auto_25763 ) ) ( not ( = ?auto_25750 ?auto_25739 ) ) ( not ( = ?auto_25750 ?auto_25745 ) ) ( not ( = ?auto_25750 ?auto_25746 ) ) ( not ( = ?auto_25750 ?auto_25741 ) ) ( not ( = ?auto_25750 ?auto_25742 ) ) ( not ( = ?auto_25740 ?auto_25738 ) ) ( not ( = ?auto_25740 ?auto_25744 ) ) ( not ( = ?auto_25740 ?auto_25754 ) ) ( not ( = ?auto_25740 ?auto_25764 ) ) ( not ( = ?auto_25740 ?auto_25752 ) ) ( not ( = ?auto_25740 ?auto_25756 ) ) ( not ( = ?auto_25721 ?auto_25729 ) ) ( not ( = ?auto_25721 ?auto_25751 ) ) ( not ( = ?auto_25722 ?auto_25729 ) ) ( not ( = ?auto_25722 ?auto_25751 ) ) ( not ( = ?auto_25723 ?auto_25729 ) ) ( not ( = ?auto_25723 ?auto_25751 ) ) ( not ( = ?auto_25724 ?auto_25729 ) ) ( not ( = ?auto_25724 ?auto_25751 ) ) ( not ( = ?auto_25725 ?auto_25729 ) ) ( not ( = ?auto_25725 ?auto_25751 ) ) ( not ( = ?auto_25726 ?auto_25729 ) ) ( not ( = ?auto_25726 ?auto_25751 ) ) ( not ( = ?auto_25727 ?auto_25729 ) ) ( not ( = ?auto_25727 ?auto_25751 ) ) ( not ( = ?auto_25729 ?auto_25740 ) ) ( not ( = ?auto_25729 ?auto_25738 ) ) ( not ( = ?auto_25729 ?auto_25744 ) ) ( not ( = ?auto_25729 ?auto_25754 ) ) ( not ( = ?auto_25729 ?auto_25764 ) ) ( not ( = ?auto_25729 ?auto_25752 ) ) ( not ( = ?auto_25729 ?auto_25756 ) ) ( not ( = ?auto_25762 ?auto_25749 ) ) ( not ( = ?auto_25762 ?auto_25757 ) ) ( not ( = ?auto_25762 ?auto_25753 ) ) ( not ( = ?auto_25762 ?auto_25760 ) ) ( not ( = ?auto_25762 ?auto_25748 ) ) ( not ( = ?auto_25762 ?auto_25759 ) ) ( not ( = ?auto_25762 ?auto_25755 ) ) ( not ( = ?auto_25761 ?auto_25750 ) ) ( not ( = ?auto_25761 ?auto_25763 ) ) ( not ( = ?auto_25761 ?auto_25739 ) ) ( not ( = ?auto_25761 ?auto_25745 ) ) ( not ( = ?auto_25761 ?auto_25746 ) ) ( not ( = ?auto_25761 ?auto_25741 ) ) ( not ( = ?auto_25761 ?auto_25742 ) ) ( not ( = ?auto_25751 ?auto_25740 ) ) ( not ( = ?auto_25751 ?auto_25738 ) ) ( not ( = ?auto_25751 ?auto_25744 ) ) ( not ( = ?auto_25751 ?auto_25754 ) ) ( not ( = ?auto_25751 ?auto_25764 ) ) ( not ( = ?auto_25751 ?auto_25752 ) ) ( not ( = ?auto_25751 ?auto_25756 ) ) ( not ( = ?auto_25721 ?auto_25730 ) ) ( not ( = ?auto_25721 ?auto_25747 ) ) ( not ( = ?auto_25722 ?auto_25730 ) ) ( not ( = ?auto_25722 ?auto_25747 ) ) ( not ( = ?auto_25723 ?auto_25730 ) ) ( not ( = ?auto_25723 ?auto_25747 ) ) ( not ( = ?auto_25724 ?auto_25730 ) ) ( not ( = ?auto_25724 ?auto_25747 ) ) ( not ( = ?auto_25725 ?auto_25730 ) ) ( not ( = ?auto_25725 ?auto_25747 ) ) ( not ( = ?auto_25726 ?auto_25730 ) ) ( not ( = ?auto_25726 ?auto_25747 ) ) ( not ( = ?auto_25727 ?auto_25730 ) ) ( not ( = ?auto_25727 ?auto_25747 ) ) ( not ( = ?auto_25728 ?auto_25730 ) ) ( not ( = ?auto_25728 ?auto_25747 ) ) ( not ( = ?auto_25730 ?auto_25751 ) ) ( not ( = ?auto_25730 ?auto_25740 ) ) ( not ( = ?auto_25730 ?auto_25738 ) ) ( not ( = ?auto_25730 ?auto_25744 ) ) ( not ( = ?auto_25730 ?auto_25754 ) ) ( not ( = ?auto_25730 ?auto_25764 ) ) ( not ( = ?auto_25730 ?auto_25752 ) ) ( not ( = ?auto_25730 ?auto_25756 ) ) ( not ( = ?auto_25758 ?auto_25762 ) ) ( not ( = ?auto_25758 ?auto_25749 ) ) ( not ( = ?auto_25758 ?auto_25757 ) ) ( not ( = ?auto_25758 ?auto_25753 ) ) ( not ( = ?auto_25758 ?auto_25760 ) ) ( not ( = ?auto_25758 ?auto_25748 ) ) ( not ( = ?auto_25758 ?auto_25759 ) ) ( not ( = ?auto_25758 ?auto_25755 ) ) ( not ( = ?auto_25743 ?auto_25761 ) ) ( not ( = ?auto_25743 ?auto_25750 ) ) ( not ( = ?auto_25743 ?auto_25763 ) ) ( not ( = ?auto_25743 ?auto_25739 ) ) ( not ( = ?auto_25743 ?auto_25745 ) ) ( not ( = ?auto_25743 ?auto_25746 ) ) ( not ( = ?auto_25743 ?auto_25741 ) ) ( not ( = ?auto_25743 ?auto_25742 ) ) ( not ( = ?auto_25747 ?auto_25751 ) ) ( not ( = ?auto_25747 ?auto_25740 ) ) ( not ( = ?auto_25747 ?auto_25738 ) ) ( not ( = ?auto_25747 ?auto_25744 ) ) ( not ( = ?auto_25747 ?auto_25754 ) ) ( not ( = ?auto_25747 ?auto_25764 ) ) ( not ( = ?auto_25747 ?auto_25752 ) ) ( not ( = ?auto_25747 ?auto_25756 ) ) ( not ( = ?auto_25721 ?auto_25731 ) ) ( not ( = ?auto_25721 ?auto_25735 ) ) ( not ( = ?auto_25722 ?auto_25731 ) ) ( not ( = ?auto_25722 ?auto_25735 ) ) ( not ( = ?auto_25723 ?auto_25731 ) ) ( not ( = ?auto_25723 ?auto_25735 ) ) ( not ( = ?auto_25724 ?auto_25731 ) ) ( not ( = ?auto_25724 ?auto_25735 ) ) ( not ( = ?auto_25725 ?auto_25731 ) ) ( not ( = ?auto_25725 ?auto_25735 ) ) ( not ( = ?auto_25726 ?auto_25731 ) ) ( not ( = ?auto_25726 ?auto_25735 ) ) ( not ( = ?auto_25727 ?auto_25731 ) ) ( not ( = ?auto_25727 ?auto_25735 ) ) ( not ( = ?auto_25728 ?auto_25731 ) ) ( not ( = ?auto_25728 ?auto_25735 ) ) ( not ( = ?auto_25729 ?auto_25731 ) ) ( not ( = ?auto_25729 ?auto_25735 ) ) ( not ( = ?auto_25731 ?auto_25747 ) ) ( not ( = ?auto_25731 ?auto_25751 ) ) ( not ( = ?auto_25731 ?auto_25740 ) ) ( not ( = ?auto_25731 ?auto_25738 ) ) ( not ( = ?auto_25731 ?auto_25744 ) ) ( not ( = ?auto_25731 ?auto_25754 ) ) ( not ( = ?auto_25731 ?auto_25764 ) ) ( not ( = ?auto_25731 ?auto_25752 ) ) ( not ( = ?auto_25731 ?auto_25756 ) ) ( not ( = ?auto_25734 ?auto_25758 ) ) ( not ( = ?auto_25734 ?auto_25762 ) ) ( not ( = ?auto_25734 ?auto_25749 ) ) ( not ( = ?auto_25734 ?auto_25757 ) ) ( not ( = ?auto_25734 ?auto_25753 ) ) ( not ( = ?auto_25734 ?auto_25760 ) ) ( not ( = ?auto_25734 ?auto_25748 ) ) ( not ( = ?auto_25734 ?auto_25759 ) ) ( not ( = ?auto_25734 ?auto_25755 ) ) ( not ( = ?auto_25737 ?auto_25743 ) ) ( not ( = ?auto_25737 ?auto_25761 ) ) ( not ( = ?auto_25737 ?auto_25750 ) ) ( not ( = ?auto_25737 ?auto_25763 ) ) ( not ( = ?auto_25737 ?auto_25739 ) ) ( not ( = ?auto_25737 ?auto_25745 ) ) ( not ( = ?auto_25737 ?auto_25746 ) ) ( not ( = ?auto_25737 ?auto_25741 ) ) ( not ( = ?auto_25737 ?auto_25742 ) ) ( not ( = ?auto_25735 ?auto_25747 ) ) ( not ( = ?auto_25735 ?auto_25751 ) ) ( not ( = ?auto_25735 ?auto_25740 ) ) ( not ( = ?auto_25735 ?auto_25738 ) ) ( not ( = ?auto_25735 ?auto_25744 ) ) ( not ( = ?auto_25735 ?auto_25754 ) ) ( not ( = ?auto_25735 ?auto_25764 ) ) ( not ( = ?auto_25735 ?auto_25752 ) ) ( not ( = ?auto_25735 ?auto_25756 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_25721 ?auto_25722 ?auto_25723 ?auto_25724 ?auto_25725 ?auto_25726 ?auto_25727 ?auto_25728 ?auto_25729 ?auto_25730 )
      ( MAKE-1CRATE ?auto_25730 ?auto_25731 )
      ( MAKE-10CRATE-VERIFY ?auto_25721 ?auto_25722 ?auto_25723 ?auto_25724 ?auto_25725 ?auto_25726 ?auto_25727 ?auto_25728 ?auto_25729 ?auto_25730 ?auto_25731 ) )
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
      ?auto_25794 - SURFACE
      ?auto_25795 - SURFACE
      ?auto_25796 - SURFACE
      ?auto_25797 - SURFACE
      ?auto_25798 - SURFACE
    )
    :vars
    (
      ?auto_25803 - HOIST
      ?auto_25804 - PLACE
      ?auto_25801 - PLACE
      ?auto_25799 - HOIST
      ?auto_25802 - SURFACE
      ?auto_25814 - SURFACE
      ?auto_25812 - PLACE
      ?auto_25816 - HOIST
      ?auto_25807 - SURFACE
      ?auto_25805 - PLACE
      ?auto_25832 - HOIST
      ?auto_25819 - SURFACE
      ?auto_25809 - PLACE
      ?auto_25818 - HOIST
      ?auto_25808 - SURFACE
      ?auto_25811 - PLACE
      ?auto_25821 - HOIST
      ?auto_25823 - SURFACE
      ?auto_25829 - PLACE
      ?auto_25827 - HOIST
      ?auto_25828 - SURFACE
      ?auto_25817 - PLACE
      ?auto_25810 - HOIST
      ?auto_25825 - SURFACE
      ?auto_25806 - PLACE
      ?auto_25815 - HOIST
      ?auto_25822 - SURFACE
      ?auto_25813 - PLACE
      ?auto_25824 - HOIST
      ?auto_25820 - SURFACE
      ?auto_25831 - PLACE
      ?auto_25830 - HOIST
      ?auto_25826 - SURFACE
      ?auto_25800 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25803 ?auto_25804 ) ( IS-CRATE ?auto_25798 ) ( not ( = ?auto_25801 ?auto_25804 ) ) ( HOIST-AT ?auto_25799 ?auto_25801 ) ( SURFACE-AT ?auto_25798 ?auto_25801 ) ( ON ?auto_25798 ?auto_25802 ) ( CLEAR ?auto_25798 ) ( not ( = ?auto_25797 ?auto_25798 ) ) ( not ( = ?auto_25797 ?auto_25802 ) ) ( not ( = ?auto_25798 ?auto_25802 ) ) ( not ( = ?auto_25803 ?auto_25799 ) ) ( IS-CRATE ?auto_25797 ) ( AVAILABLE ?auto_25799 ) ( SURFACE-AT ?auto_25797 ?auto_25801 ) ( ON ?auto_25797 ?auto_25814 ) ( CLEAR ?auto_25797 ) ( not ( = ?auto_25796 ?auto_25797 ) ) ( not ( = ?auto_25796 ?auto_25814 ) ) ( not ( = ?auto_25797 ?auto_25814 ) ) ( IS-CRATE ?auto_25796 ) ( not ( = ?auto_25812 ?auto_25804 ) ) ( HOIST-AT ?auto_25816 ?auto_25812 ) ( AVAILABLE ?auto_25816 ) ( SURFACE-AT ?auto_25796 ?auto_25812 ) ( ON ?auto_25796 ?auto_25807 ) ( CLEAR ?auto_25796 ) ( not ( = ?auto_25795 ?auto_25796 ) ) ( not ( = ?auto_25795 ?auto_25807 ) ) ( not ( = ?auto_25796 ?auto_25807 ) ) ( not ( = ?auto_25803 ?auto_25816 ) ) ( IS-CRATE ?auto_25795 ) ( not ( = ?auto_25805 ?auto_25804 ) ) ( HOIST-AT ?auto_25832 ?auto_25805 ) ( AVAILABLE ?auto_25832 ) ( SURFACE-AT ?auto_25795 ?auto_25805 ) ( ON ?auto_25795 ?auto_25819 ) ( CLEAR ?auto_25795 ) ( not ( = ?auto_25794 ?auto_25795 ) ) ( not ( = ?auto_25794 ?auto_25819 ) ) ( not ( = ?auto_25795 ?auto_25819 ) ) ( not ( = ?auto_25803 ?auto_25832 ) ) ( IS-CRATE ?auto_25794 ) ( not ( = ?auto_25809 ?auto_25804 ) ) ( HOIST-AT ?auto_25818 ?auto_25809 ) ( AVAILABLE ?auto_25818 ) ( SURFACE-AT ?auto_25794 ?auto_25809 ) ( ON ?auto_25794 ?auto_25808 ) ( CLEAR ?auto_25794 ) ( not ( = ?auto_25793 ?auto_25794 ) ) ( not ( = ?auto_25793 ?auto_25808 ) ) ( not ( = ?auto_25794 ?auto_25808 ) ) ( not ( = ?auto_25803 ?auto_25818 ) ) ( IS-CRATE ?auto_25793 ) ( not ( = ?auto_25811 ?auto_25804 ) ) ( HOIST-AT ?auto_25821 ?auto_25811 ) ( AVAILABLE ?auto_25821 ) ( SURFACE-AT ?auto_25793 ?auto_25811 ) ( ON ?auto_25793 ?auto_25823 ) ( CLEAR ?auto_25793 ) ( not ( = ?auto_25792 ?auto_25793 ) ) ( not ( = ?auto_25792 ?auto_25823 ) ) ( not ( = ?auto_25793 ?auto_25823 ) ) ( not ( = ?auto_25803 ?auto_25821 ) ) ( IS-CRATE ?auto_25792 ) ( not ( = ?auto_25829 ?auto_25804 ) ) ( HOIST-AT ?auto_25827 ?auto_25829 ) ( AVAILABLE ?auto_25827 ) ( SURFACE-AT ?auto_25792 ?auto_25829 ) ( ON ?auto_25792 ?auto_25828 ) ( CLEAR ?auto_25792 ) ( not ( = ?auto_25791 ?auto_25792 ) ) ( not ( = ?auto_25791 ?auto_25828 ) ) ( not ( = ?auto_25792 ?auto_25828 ) ) ( not ( = ?auto_25803 ?auto_25827 ) ) ( IS-CRATE ?auto_25791 ) ( not ( = ?auto_25817 ?auto_25804 ) ) ( HOIST-AT ?auto_25810 ?auto_25817 ) ( AVAILABLE ?auto_25810 ) ( SURFACE-AT ?auto_25791 ?auto_25817 ) ( ON ?auto_25791 ?auto_25825 ) ( CLEAR ?auto_25791 ) ( not ( = ?auto_25790 ?auto_25791 ) ) ( not ( = ?auto_25790 ?auto_25825 ) ) ( not ( = ?auto_25791 ?auto_25825 ) ) ( not ( = ?auto_25803 ?auto_25810 ) ) ( IS-CRATE ?auto_25790 ) ( not ( = ?auto_25806 ?auto_25804 ) ) ( HOIST-AT ?auto_25815 ?auto_25806 ) ( AVAILABLE ?auto_25815 ) ( SURFACE-AT ?auto_25790 ?auto_25806 ) ( ON ?auto_25790 ?auto_25822 ) ( CLEAR ?auto_25790 ) ( not ( = ?auto_25789 ?auto_25790 ) ) ( not ( = ?auto_25789 ?auto_25822 ) ) ( not ( = ?auto_25790 ?auto_25822 ) ) ( not ( = ?auto_25803 ?auto_25815 ) ) ( IS-CRATE ?auto_25789 ) ( not ( = ?auto_25813 ?auto_25804 ) ) ( HOIST-AT ?auto_25824 ?auto_25813 ) ( AVAILABLE ?auto_25824 ) ( SURFACE-AT ?auto_25789 ?auto_25813 ) ( ON ?auto_25789 ?auto_25820 ) ( CLEAR ?auto_25789 ) ( not ( = ?auto_25788 ?auto_25789 ) ) ( not ( = ?auto_25788 ?auto_25820 ) ) ( not ( = ?auto_25789 ?auto_25820 ) ) ( not ( = ?auto_25803 ?auto_25824 ) ) ( SURFACE-AT ?auto_25787 ?auto_25804 ) ( CLEAR ?auto_25787 ) ( IS-CRATE ?auto_25788 ) ( AVAILABLE ?auto_25803 ) ( not ( = ?auto_25831 ?auto_25804 ) ) ( HOIST-AT ?auto_25830 ?auto_25831 ) ( AVAILABLE ?auto_25830 ) ( SURFACE-AT ?auto_25788 ?auto_25831 ) ( ON ?auto_25788 ?auto_25826 ) ( CLEAR ?auto_25788 ) ( TRUCK-AT ?auto_25800 ?auto_25804 ) ( not ( = ?auto_25787 ?auto_25788 ) ) ( not ( = ?auto_25787 ?auto_25826 ) ) ( not ( = ?auto_25788 ?auto_25826 ) ) ( not ( = ?auto_25803 ?auto_25830 ) ) ( not ( = ?auto_25787 ?auto_25789 ) ) ( not ( = ?auto_25787 ?auto_25820 ) ) ( not ( = ?auto_25789 ?auto_25826 ) ) ( not ( = ?auto_25813 ?auto_25831 ) ) ( not ( = ?auto_25824 ?auto_25830 ) ) ( not ( = ?auto_25820 ?auto_25826 ) ) ( not ( = ?auto_25787 ?auto_25790 ) ) ( not ( = ?auto_25787 ?auto_25822 ) ) ( not ( = ?auto_25788 ?auto_25790 ) ) ( not ( = ?auto_25788 ?auto_25822 ) ) ( not ( = ?auto_25790 ?auto_25820 ) ) ( not ( = ?auto_25790 ?auto_25826 ) ) ( not ( = ?auto_25806 ?auto_25813 ) ) ( not ( = ?auto_25806 ?auto_25831 ) ) ( not ( = ?auto_25815 ?auto_25824 ) ) ( not ( = ?auto_25815 ?auto_25830 ) ) ( not ( = ?auto_25822 ?auto_25820 ) ) ( not ( = ?auto_25822 ?auto_25826 ) ) ( not ( = ?auto_25787 ?auto_25791 ) ) ( not ( = ?auto_25787 ?auto_25825 ) ) ( not ( = ?auto_25788 ?auto_25791 ) ) ( not ( = ?auto_25788 ?auto_25825 ) ) ( not ( = ?auto_25789 ?auto_25791 ) ) ( not ( = ?auto_25789 ?auto_25825 ) ) ( not ( = ?auto_25791 ?auto_25822 ) ) ( not ( = ?auto_25791 ?auto_25820 ) ) ( not ( = ?auto_25791 ?auto_25826 ) ) ( not ( = ?auto_25817 ?auto_25806 ) ) ( not ( = ?auto_25817 ?auto_25813 ) ) ( not ( = ?auto_25817 ?auto_25831 ) ) ( not ( = ?auto_25810 ?auto_25815 ) ) ( not ( = ?auto_25810 ?auto_25824 ) ) ( not ( = ?auto_25810 ?auto_25830 ) ) ( not ( = ?auto_25825 ?auto_25822 ) ) ( not ( = ?auto_25825 ?auto_25820 ) ) ( not ( = ?auto_25825 ?auto_25826 ) ) ( not ( = ?auto_25787 ?auto_25792 ) ) ( not ( = ?auto_25787 ?auto_25828 ) ) ( not ( = ?auto_25788 ?auto_25792 ) ) ( not ( = ?auto_25788 ?auto_25828 ) ) ( not ( = ?auto_25789 ?auto_25792 ) ) ( not ( = ?auto_25789 ?auto_25828 ) ) ( not ( = ?auto_25790 ?auto_25792 ) ) ( not ( = ?auto_25790 ?auto_25828 ) ) ( not ( = ?auto_25792 ?auto_25825 ) ) ( not ( = ?auto_25792 ?auto_25822 ) ) ( not ( = ?auto_25792 ?auto_25820 ) ) ( not ( = ?auto_25792 ?auto_25826 ) ) ( not ( = ?auto_25829 ?auto_25817 ) ) ( not ( = ?auto_25829 ?auto_25806 ) ) ( not ( = ?auto_25829 ?auto_25813 ) ) ( not ( = ?auto_25829 ?auto_25831 ) ) ( not ( = ?auto_25827 ?auto_25810 ) ) ( not ( = ?auto_25827 ?auto_25815 ) ) ( not ( = ?auto_25827 ?auto_25824 ) ) ( not ( = ?auto_25827 ?auto_25830 ) ) ( not ( = ?auto_25828 ?auto_25825 ) ) ( not ( = ?auto_25828 ?auto_25822 ) ) ( not ( = ?auto_25828 ?auto_25820 ) ) ( not ( = ?auto_25828 ?auto_25826 ) ) ( not ( = ?auto_25787 ?auto_25793 ) ) ( not ( = ?auto_25787 ?auto_25823 ) ) ( not ( = ?auto_25788 ?auto_25793 ) ) ( not ( = ?auto_25788 ?auto_25823 ) ) ( not ( = ?auto_25789 ?auto_25793 ) ) ( not ( = ?auto_25789 ?auto_25823 ) ) ( not ( = ?auto_25790 ?auto_25793 ) ) ( not ( = ?auto_25790 ?auto_25823 ) ) ( not ( = ?auto_25791 ?auto_25793 ) ) ( not ( = ?auto_25791 ?auto_25823 ) ) ( not ( = ?auto_25793 ?auto_25828 ) ) ( not ( = ?auto_25793 ?auto_25825 ) ) ( not ( = ?auto_25793 ?auto_25822 ) ) ( not ( = ?auto_25793 ?auto_25820 ) ) ( not ( = ?auto_25793 ?auto_25826 ) ) ( not ( = ?auto_25811 ?auto_25829 ) ) ( not ( = ?auto_25811 ?auto_25817 ) ) ( not ( = ?auto_25811 ?auto_25806 ) ) ( not ( = ?auto_25811 ?auto_25813 ) ) ( not ( = ?auto_25811 ?auto_25831 ) ) ( not ( = ?auto_25821 ?auto_25827 ) ) ( not ( = ?auto_25821 ?auto_25810 ) ) ( not ( = ?auto_25821 ?auto_25815 ) ) ( not ( = ?auto_25821 ?auto_25824 ) ) ( not ( = ?auto_25821 ?auto_25830 ) ) ( not ( = ?auto_25823 ?auto_25828 ) ) ( not ( = ?auto_25823 ?auto_25825 ) ) ( not ( = ?auto_25823 ?auto_25822 ) ) ( not ( = ?auto_25823 ?auto_25820 ) ) ( not ( = ?auto_25823 ?auto_25826 ) ) ( not ( = ?auto_25787 ?auto_25794 ) ) ( not ( = ?auto_25787 ?auto_25808 ) ) ( not ( = ?auto_25788 ?auto_25794 ) ) ( not ( = ?auto_25788 ?auto_25808 ) ) ( not ( = ?auto_25789 ?auto_25794 ) ) ( not ( = ?auto_25789 ?auto_25808 ) ) ( not ( = ?auto_25790 ?auto_25794 ) ) ( not ( = ?auto_25790 ?auto_25808 ) ) ( not ( = ?auto_25791 ?auto_25794 ) ) ( not ( = ?auto_25791 ?auto_25808 ) ) ( not ( = ?auto_25792 ?auto_25794 ) ) ( not ( = ?auto_25792 ?auto_25808 ) ) ( not ( = ?auto_25794 ?auto_25823 ) ) ( not ( = ?auto_25794 ?auto_25828 ) ) ( not ( = ?auto_25794 ?auto_25825 ) ) ( not ( = ?auto_25794 ?auto_25822 ) ) ( not ( = ?auto_25794 ?auto_25820 ) ) ( not ( = ?auto_25794 ?auto_25826 ) ) ( not ( = ?auto_25809 ?auto_25811 ) ) ( not ( = ?auto_25809 ?auto_25829 ) ) ( not ( = ?auto_25809 ?auto_25817 ) ) ( not ( = ?auto_25809 ?auto_25806 ) ) ( not ( = ?auto_25809 ?auto_25813 ) ) ( not ( = ?auto_25809 ?auto_25831 ) ) ( not ( = ?auto_25818 ?auto_25821 ) ) ( not ( = ?auto_25818 ?auto_25827 ) ) ( not ( = ?auto_25818 ?auto_25810 ) ) ( not ( = ?auto_25818 ?auto_25815 ) ) ( not ( = ?auto_25818 ?auto_25824 ) ) ( not ( = ?auto_25818 ?auto_25830 ) ) ( not ( = ?auto_25808 ?auto_25823 ) ) ( not ( = ?auto_25808 ?auto_25828 ) ) ( not ( = ?auto_25808 ?auto_25825 ) ) ( not ( = ?auto_25808 ?auto_25822 ) ) ( not ( = ?auto_25808 ?auto_25820 ) ) ( not ( = ?auto_25808 ?auto_25826 ) ) ( not ( = ?auto_25787 ?auto_25795 ) ) ( not ( = ?auto_25787 ?auto_25819 ) ) ( not ( = ?auto_25788 ?auto_25795 ) ) ( not ( = ?auto_25788 ?auto_25819 ) ) ( not ( = ?auto_25789 ?auto_25795 ) ) ( not ( = ?auto_25789 ?auto_25819 ) ) ( not ( = ?auto_25790 ?auto_25795 ) ) ( not ( = ?auto_25790 ?auto_25819 ) ) ( not ( = ?auto_25791 ?auto_25795 ) ) ( not ( = ?auto_25791 ?auto_25819 ) ) ( not ( = ?auto_25792 ?auto_25795 ) ) ( not ( = ?auto_25792 ?auto_25819 ) ) ( not ( = ?auto_25793 ?auto_25795 ) ) ( not ( = ?auto_25793 ?auto_25819 ) ) ( not ( = ?auto_25795 ?auto_25808 ) ) ( not ( = ?auto_25795 ?auto_25823 ) ) ( not ( = ?auto_25795 ?auto_25828 ) ) ( not ( = ?auto_25795 ?auto_25825 ) ) ( not ( = ?auto_25795 ?auto_25822 ) ) ( not ( = ?auto_25795 ?auto_25820 ) ) ( not ( = ?auto_25795 ?auto_25826 ) ) ( not ( = ?auto_25805 ?auto_25809 ) ) ( not ( = ?auto_25805 ?auto_25811 ) ) ( not ( = ?auto_25805 ?auto_25829 ) ) ( not ( = ?auto_25805 ?auto_25817 ) ) ( not ( = ?auto_25805 ?auto_25806 ) ) ( not ( = ?auto_25805 ?auto_25813 ) ) ( not ( = ?auto_25805 ?auto_25831 ) ) ( not ( = ?auto_25832 ?auto_25818 ) ) ( not ( = ?auto_25832 ?auto_25821 ) ) ( not ( = ?auto_25832 ?auto_25827 ) ) ( not ( = ?auto_25832 ?auto_25810 ) ) ( not ( = ?auto_25832 ?auto_25815 ) ) ( not ( = ?auto_25832 ?auto_25824 ) ) ( not ( = ?auto_25832 ?auto_25830 ) ) ( not ( = ?auto_25819 ?auto_25808 ) ) ( not ( = ?auto_25819 ?auto_25823 ) ) ( not ( = ?auto_25819 ?auto_25828 ) ) ( not ( = ?auto_25819 ?auto_25825 ) ) ( not ( = ?auto_25819 ?auto_25822 ) ) ( not ( = ?auto_25819 ?auto_25820 ) ) ( not ( = ?auto_25819 ?auto_25826 ) ) ( not ( = ?auto_25787 ?auto_25796 ) ) ( not ( = ?auto_25787 ?auto_25807 ) ) ( not ( = ?auto_25788 ?auto_25796 ) ) ( not ( = ?auto_25788 ?auto_25807 ) ) ( not ( = ?auto_25789 ?auto_25796 ) ) ( not ( = ?auto_25789 ?auto_25807 ) ) ( not ( = ?auto_25790 ?auto_25796 ) ) ( not ( = ?auto_25790 ?auto_25807 ) ) ( not ( = ?auto_25791 ?auto_25796 ) ) ( not ( = ?auto_25791 ?auto_25807 ) ) ( not ( = ?auto_25792 ?auto_25796 ) ) ( not ( = ?auto_25792 ?auto_25807 ) ) ( not ( = ?auto_25793 ?auto_25796 ) ) ( not ( = ?auto_25793 ?auto_25807 ) ) ( not ( = ?auto_25794 ?auto_25796 ) ) ( not ( = ?auto_25794 ?auto_25807 ) ) ( not ( = ?auto_25796 ?auto_25819 ) ) ( not ( = ?auto_25796 ?auto_25808 ) ) ( not ( = ?auto_25796 ?auto_25823 ) ) ( not ( = ?auto_25796 ?auto_25828 ) ) ( not ( = ?auto_25796 ?auto_25825 ) ) ( not ( = ?auto_25796 ?auto_25822 ) ) ( not ( = ?auto_25796 ?auto_25820 ) ) ( not ( = ?auto_25796 ?auto_25826 ) ) ( not ( = ?auto_25812 ?auto_25805 ) ) ( not ( = ?auto_25812 ?auto_25809 ) ) ( not ( = ?auto_25812 ?auto_25811 ) ) ( not ( = ?auto_25812 ?auto_25829 ) ) ( not ( = ?auto_25812 ?auto_25817 ) ) ( not ( = ?auto_25812 ?auto_25806 ) ) ( not ( = ?auto_25812 ?auto_25813 ) ) ( not ( = ?auto_25812 ?auto_25831 ) ) ( not ( = ?auto_25816 ?auto_25832 ) ) ( not ( = ?auto_25816 ?auto_25818 ) ) ( not ( = ?auto_25816 ?auto_25821 ) ) ( not ( = ?auto_25816 ?auto_25827 ) ) ( not ( = ?auto_25816 ?auto_25810 ) ) ( not ( = ?auto_25816 ?auto_25815 ) ) ( not ( = ?auto_25816 ?auto_25824 ) ) ( not ( = ?auto_25816 ?auto_25830 ) ) ( not ( = ?auto_25807 ?auto_25819 ) ) ( not ( = ?auto_25807 ?auto_25808 ) ) ( not ( = ?auto_25807 ?auto_25823 ) ) ( not ( = ?auto_25807 ?auto_25828 ) ) ( not ( = ?auto_25807 ?auto_25825 ) ) ( not ( = ?auto_25807 ?auto_25822 ) ) ( not ( = ?auto_25807 ?auto_25820 ) ) ( not ( = ?auto_25807 ?auto_25826 ) ) ( not ( = ?auto_25787 ?auto_25797 ) ) ( not ( = ?auto_25787 ?auto_25814 ) ) ( not ( = ?auto_25788 ?auto_25797 ) ) ( not ( = ?auto_25788 ?auto_25814 ) ) ( not ( = ?auto_25789 ?auto_25797 ) ) ( not ( = ?auto_25789 ?auto_25814 ) ) ( not ( = ?auto_25790 ?auto_25797 ) ) ( not ( = ?auto_25790 ?auto_25814 ) ) ( not ( = ?auto_25791 ?auto_25797 ) ) ( not ( = ?auto_25791 ?auto_25814 ) ) ( not ( = ?auto_25792 ?auto_25797 ) ) ( not ( = ?auto_25792 ?auto_25814 ) ) ( not ( = ?auto_25793 ?auto_25797 ) ) ( not ( = ?auto_25793 ?auto_25814 ) ) ( not ( = ?auto_25794 ?auto_25797 ) ) ( not ( = ?auto_25794 ?auto_25814 ) ) ( not ( = ?auto_25795 ?auto_25797 ) ) ( not ( = ?auto_25795 ?auto_25814 ) ) ( not ( = ?auto_25797 ?auto_25807 ) ) ( not ( = ?auto_25797 ?auto_25819 ) ) ( not ( = ?auto_25797 ?auto_25808 ) ) ( not ( = ?auto_25797 ?auto_25823 ) ) ( not ( = ?auto_25797 ?auto_25828 ) ) ( not ( = ?auto_25797 ?auto_25825 ) ) ( not ( = ?auto_25797 ?auto_25822 ) ) ( not ( = ?auto_25797 ?auto_25820 ) ) ( not ( = ?auto_25797 ?auto_25826 ) ) ( not ( = ?auto_25801 ?auto_25812 ) ) ( not ( = ?auto_25801 ?auto_25805 ) ) ( not ( = ?auto_25801 ?auto_25809 ) ) ( not ( = ?auto_25801 ?auto_25811 ) ) ( not ( = ?auto_25801 ?auto_25829 ) ) ( not ( = ?auto_25801 ?auto_25817 ) ) ( not ( = ?auto_25801 ?auto_25806 ) ) ( not ( = ?auto_25801 ?auto_25813 ) ) ( not ( = ?auto_25801 ?auto_25831 ) ) ( not ( = ?auto_25799 ?auto_25816 ) ) ( not ( = ?auto_25799 ?auto_25832 ) ) ( not ( = ?auto_25799 ?auto_25818 ) ) ( not ( = ?auto_25799 ?auto_25821 ) ) ( not ( = ?auto_25799 ?auto_25827 ) ) ( not ( = ?auto_25799 ?auto_25810 ) ) ( not ( = ?auto_25799 ?auto_25815 ) ) ( not ( = ?auto_25799 ?auto_25824 ) ) ( not ( = ?auto_25799 ?auto_25830 ) ) ( not ( = ?auto_25814 ?auto_25807 ) ) ( not ( = ?auto_25814 ?auto_25819 ) ) ( not ( = ?auto_25814 ?auto_25808 ) ) ( not ( = ?auto_25814 ?auto_25823 ) ) ( not ( = ?auto_25814 ?auto_25828 ) ) ( not ( = ?auto_25814 ?auto_25825 ) ) ( not ( = ?auto_25814 ?auto_25822 ) ) ( not ( = ?auto_25814 ?auto_25820 ) ) ( not ( = ?auto_25814 ?auto_25826 ) ) ( not ( = ?auto_25787 ?auto_25798 ) ) ( not ( = ?auto_25787 ?auto_25802 ) ) ( not ( = ?auto_25788 ?auto_25798 ) ) ( not ( = ?auto_25788 ?auto_25802 ) ) ( not ( = ?auto_25789 ?auto_25798 ) ) ( not ( = ?auto_25789 ?auto_25802 ) ) ( not ( = ?auto_25790 ?auto_25798 ) ) ( not ( = ?auto_25790 ?auto_25802 ) ) ( not ( = ?auto_25791 ?auto_25798 ) ) ( not ( = ?auto_25791 ?auto_25802 ) ) ( not ( = ?auto_25792 ?auto_25798 ) ) ( not ( = ?auto_25792 ?auto_25802 ) ) ( not ( = ?auto_25793 ?auto_25798 ) ) ( not ( = ?auto_25793 ?auto_25802 ) ) ( not ( = ?auto_25794 ?auto_25798 ) ) ( not ( = ?auto_25794 ?auto_25802 ) ) ( not ( = ?auto_25795 ?auto_25798 ) ) ( not ( = ?auto_25795 ?auto_25802 ) ) ( not ( = ?auto_25796 ?auto_25798 ) ) ( not ( = ?auto_25796 ?auto_25802 ) ) ( not ( = ?auto_25798 ?auto_25814 ) ) ( not ( = ?auto_25798 ?auto_25807 ) ) ( not ( = ?auto_25798 ?auto_25819 ) ) ( not ( = ?auto_25798 ?auto_25808 ) ) ( not ( = ?auto_25798 ?auto_25823 ) ) ( not ( = ?auto_25798 ?auto_25828 ) ) ( not ( = ?auto_25798 ?auto_25825 ) ) ( not ( = ?auto_25798 ?auto_25822 ) ) ( not ( = ?auto_25798 ?auto_25820 ) ) ( not ( = ?auto_25798 ?auto_25826 ) ) ( not ( = ?auto_25802 ?auto_25814 ) ) ( not ( = ?auto_25802 ?auto_25807 ) ) ( not ( = ?auto_25802 ?auto_25819 ) ) ( not ( = ?auto_25802 ?auto_25808 ) ) ( not ( = ?auto_25802 ?auto_25823 ) ) ( not ( = ?auto_25802 ?auto_25828 ) ) ( not ( = ?auto_25802 ?auto_25825 ) ) ( not ( = ?auto_25802 ?auto_25822 ) ) ( not ( = ?auto_25802 ?auto_25820 ) ) ( not ( = ?auto_25802 ?auto_25826 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_25787 ?auto_25788 ?auto_25789 ?auto_25790 ?auto_25791 ?auto_25792 ?auto_25793 ?auto_25794 ?auto_25795 ?auto_25796 ?auto_25797 )
      ( MAKE-1CRATE ?auto_25797 ?auto_25798 )
      ( MAKE-11CRATE-VERIFY ?auto_25787 ?auto_25788 ?auto_25789 ?auto_25790 ?auto_25791 ?auto_25792 ?auto_25793 ?auto_25794 ?auto_25795 ?auto_25796 ?auto_25797 ?auto_25798 ) )
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
      ?auto_25863 - SURFACE
      ?auto_25864 - SURFACE
      ?auto_25865 - SURFACE
      ?auto_25866 - SURFACE
      ?auto_25867 - SURFACE
      ?auto_25868 - SURFACE
    )
    :vars
    (
      ?auto_25873 - HOIST
      ?auto_25870 - PLACE
      ?auto_25871 - PLACE
      ?auto_25874 - HOIST
      ?auto_25872 - SURFACE
      ?auto_25875 - PLACE
      ?auto_25895 - HOIST
      ?auto_25904 - SURFACE
      ?auto_25896 - SURFACE
      ?auto_25899 - PLACE
      ?auto_25901 - HOIST
      ?auto_25886 - SURFACE
      ?auto_25879 - PLACE
      ?auto_25891 - HOIST
      ?auto_25881 - SURFACE
      ?auto_25893 - PLACE
      ?auto_25884 - HOIST
      ?auto_25889 - SURFACE
      ?auto_25882 - PLACE
      ?auto_25905 - HOIST
      ?auto_25888 - SURFACE
      ?auto_25885 - PLACE
      ?auto_25880 - HOIST
      ?auto_25878 - SURFACE
      ?auto_25883 - PLACE
      ?auto_25892 - HOIST
      ?auto_25890 - SURFACE
      ?auto_25887 - PLACE
      ?auto_25894 - HOIST
      ?auto_25897 - SURFACE
      ?auto_25877 - PLACE
      ?auto_25900 - HOIST
      ?auto_25902 - SURFACE
      ?auto_25876 - PLACE
      ?auto_25898 - HOIST
      ?auto_25903 - SURFACE
      ?auto_25869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25873 ?auto_25870 ) ( IS-CRATE ?auto_25868 ) ( not ( = ?auto_25871 ?auto_25870 ) ) ( HOIST-AT ?auto_25874 ?auto_25871 ) ( AVAILABLE ?auto_25874 ) ( SURFACE-AT ?auto_25868 ?auto_25871 ) ( ON ?auto_25868 ?auto_25872 ) ( CLEAR ?auto_25868 ) ( not ( = ?auto_25867 ?auto_25868 ) ) ( not ( = ?auto_25867 ?auto_25872 ) ) ( not ( = ?auto_25868 ?auto_25872 ) ) ( not ( = ?auto_25873 ?auto_25874 ) ) ( IS-CRATE ?auto_25867 ) ( not ( = ?auto_25875 ?auto_25870 ) ) ( HOIST-AT ?auto_25895 ?auto_25875 ) ( SURFACE-AT ?auto_25867 ?auto_25875 ) ( ON ?auto_25867 ?auto_25904 ) ( CLEAR ?auto_25867 ) ( not ( = ?auto_25866 ?auto_25867 ) ) ( not ( = ?auto_25866 ?auto_25904 ) ) ( not ( = ?auto_25867 ?auto_25904 ) ) ( not ( = ?auto_25873 ?auto_25895 ) ) ( IS-CRATE ?auto_25866 ) ( AVAILABLE ?auto_25895 ) ( SURFACE-AT ?auto_25866 ?auto_25875 ) ( ON ?auto_25866 ?auto_25896 ) ( CLEAR ?auto_25866 ) ( not ( = ?auto_25865 ?auto_25866 ) ) ( not ( = ?auto_25865 ?auto_25896 ) ) ( not ( = ?auto_25866 ?auto_25896 ) ) ( IS-CRATE ?auto_25865 ) ( not ( = ?auto_25899 ?auto_25870 ) ) ( HOIST-AT ?auto_25901 ?auto_25899 ) ( AVAILABLE ?auto_25901 ) ( SURFACE-AT ?auto_25865 ?auto_25899 ) ( ON ?auto_25865 ?auto_25886 ) ( CLEAR ?auto_25865 ) ( not ( = ?auto_25864 ?auto_25865 ) ) ( not ( = ?auto_25864 ?auto_25886 ) ) ( not ( = ?auto_25865 ?auto_25886 ) ) ( not ( = ?auto_25873 ?auto_25901 ) ) ( IS-CRATE ?auto_25864 ) ( not ( = ?auto_25879 ?auto_25870 ) ) ( HOIST-AT ?auto_25891 ?auto_25879 ) ( AVAILABLE ?auto_25891 ) ( SURFACE-AT ?auto_25864 ?auto_25879 ) ( ON ?auto_25864 ?auto_25881 ) ( CLEAR ?auto_25864 ) ( not ( = ?auto_25863 ?auto_25864 ) ) ( not ( = ?auto_25863 ?auto_25881 ) ) ( not ( = ?auto_25864 ?auto_25881 ) ) ( not ( = ?auto_25873 ?auto_25891 ) ) ( IS-CRATE ?auto_25863 ) ( not ( = ?auto_25893 ?auto_25870 ) ) ( HOIST-AT ?auto_25884 ?auto_25893 ) ( AVAILABLE ?auto_25884 ) ( SURFACE-AT ?auto_25863 ?auto_25893 ) ( ON ?auto_25863 ?auto_25889 ) ( CLEAR ?auto_25863 ) ( not ( = ?auto_25862 ?auto_25863 ) ) ( not ( = ?auto_25862 ?auto_25889 ) ) ( not ( = ?auto_25863 ?auto_25889 ) ) ( not ( = ?auto_25873 ?auto_25884 ) ) ( IS-CRATE ?auto_25862 ) ( not ( = ?auto_25882 ?auto_25870 ) ) ( HOIST-AT ?auto_25905 ?auto_25882 ) ( AVAILABLE ?auto_25905 ) ( SURFACE-AT ?auto_25862 ?auto_25882 ) ( ON ?auto_25862 ?auto_25888 ) ( CLEAR ?auto_25862 ) ( not ( = ?auto_25861 ?auto_25862 ) ) ( not ( = ?auto_25861 ?auto_25888 ) ) ( not ( = ?auto_25862 ?auto_25888 ) ) ( not ( = ?auto_25873 ?auto_25905 ) ) ( IS-CRATE ?auto_25861 ) ( not ( = ?auto_25885 ?auto_25870 ) ) ( HOIST-AT ?auto_25880 ?auto_25885 ) ( AVAILABLE ?auto_25880 ) ( SURFACE-AT ?auto_25861 ?auto_25885 ) ( ON ?auto_25861 ?auto_25878 ) ( CLEAR ?auto_25861 ) ( not ( = ?auto_25860 ?auto_25861 ) ) ( not ( = ?auto_25860 ?auto_25878 ) ) ( not ( = ?auto_25861 ?auto_25878 ) ) ( not ( = ?auto_25873 ?auto_25880 ) ) ( IS-CRATE ?auto_25860 ) ( not ( = ?auto_25883 ?auto_25870 ) ) ( HOIST-AT ?auto_25892 ?auto_25883 ) ( AVAILABLE ?auto_25892 ) ( SURFACE-AT ?auto_25860 ?auto_25883 ) ( ON ?auto_25860 ?auto_25890 ) ( CLEAR ?auto_25860 ) ( not ( = ?auto_25859 ?auto_25860 ) ) ( not ( = ?auto_25859 ?auto_25890 ) ) ( not ( = ?auto_25860 ?auto_25890 ) ) ( not ( = ?auto_25873 ?auto_25892 ) ) ( IS-CRATE ?auto_25859 ) ( not ( = ?auto_25887 ?auto_25870 ) ) ( HOIST-AT ?auto_25894 ?auto_25887 ) ( AVAILABLE ?auto_25894 ) ( SURFACE-AT ?auto_25859 ?auto_25887 ) ( ON ?auto_25859 ?auto_25897 ) ( CLEAR ?auto_25859 ) ( not ( = ?auto_25858 ?auto_25859 ) ) ( not ( = ?auto_25858 ?auto_25897 ) ) ( not ( = ?auto_25859 ?auto_25897 ) ) ( not ( = ?auto_25873 ?auto_25894 ) ) ( IS-CRATE ?auto_25858 ) ( not ( = ?auto_25877 ?auto_25870 ) ) ( HOIST-AT ?auto_25900 ?auto_25877 ) ( AVAILABLE ?auto_25900 ) ( SURFACE-AT ?auto_25858 ?auto_25877 ) ( ON ?auto_25858 ?auto_25902 ) ( CLEAR ?auto_25858 ) ( not ( = ?auto_25857 ?auto_25858 ) ) ( not ( = ?auto_25857 ?auto_25902 ) ) ( not ( = ?auto_25858 ?auto_25902 ) ) ( not ( = ?auto_25873 ?auto_25900 ) ) ( SURFACE-AT ?auto_25856 ?auto_25870 ) ( CLEAR ?auto_25856 ) ( IS-CRATE ?auto_25857 ) ( AVAILABLE ?auto_25873 ) ( not ( = ?auto_25876 ?auto_25870 ) ) ( HOIST-AT ?auto_25898 ?auto_25876 ) ( AVAILABLE ?auto_25898 ) ( SURFACE-AT ?auto_25857 ?auto_25876 ) ( ON ?auto_25857 ?auto_25903 ) ( CLEAR ?auto_25857 ) ( TRUCK-AT ?auto_25869 ?auto_25870 ) ( not ( = ?auto_25856 ?auto_25857 ) ) ( not ( = ?auto_25856 ?auto_25903 ) ) ( not ( = ?auto_25857 ?auto_25903 ) ) ( not ( = ?auto_25873 ?auto_25898 ) ) ( not ( = ?auto_25856 ?auto_25858 ) ) ( not ( = ?auto_25856 ?auto_25902 ) ) ( not ( = ?auto_25858 ?auto_25903 ) ) ( not ( = ?auto_25877 ?auto_25876 ) ) ( not ( = ?auto_25900 ?auto_25898 ) ) ( not ( = ?auto_25902 ?auto_25903 ) ) ( not ( = ?auto_25856 ?auto_25859 ) ) ( not ( = ?auto_25856 ?auto_25897 ) ) ( not ( = ?auto_25857 ?auto_25859 ) ) ( not ( = ?auto_25857 ?auto_25897 ) ) ( not ( = ?auto_25859 ?auto_25902 ) ) ( not ( = ?auto_25859 ?auto_25903 ) ) ( not ( = ?auto_25887 ?auto_25877 ) ) ( not ( = ?auto_25887 ?auto_25876 ) ) ( not ( = ?auto_25894 ?auto_25900 ) ) ( not ( = ?auto_25894 ?auto_25898 ) ) ( not ( = ?auto_25897 ?auto_25902 ) ) ( not ( = ?auto_25897 ?auto_25903 ) ) ( not ( = ?auto_25856 ?auto_25860 ) ) ( not ( = ?auto_25856 ?auto_25890 ) ) ( not ( = ?auto_25857 ?auto_25860 ) ) ( not ( = ?auto_25857 ?auto_25890 ) ) ( not ( = ?auto_25858 ?auto_25860 ) ) ( not ( = ?auto_25858 ?auto_25890 ) ) ( not ( = ?auto_25860 ?auto_25897 ) ) ( not ( = ?auto_25860 ?auto_25902 ) ) ( not ( = ?auto_25860 ?auto_25903 ) ) ( not ( = ?auto_25883 ?auto_25887 ) ) ( not ( = ?auto_25883 ?auto_25877 ) ) ( not ( = ?auto_25883 ?auto_25876 ) ) ( not ( = ?auto_25892 ?auto_25894 ) ) ( not ( = ?auto_25892 ?auto_25900 ) ) ( not ( = ?auto_25892 ?auto_25898 ) ) ( not ( = ?auto_25890 ?auto_25897 ) ) ( not ( = ?auto_25890 ?auto_25902 ) ) ( not ( = ?auto_25890 ?auto_25903 ) ) ( not ( = ?auto_25856 ?auto_25861 ) ) ( not ( = ?auto_25856 ?auto_25878 ) ) ( not ( = ?auto_25857 ?auto_25861 ) ) ( not ( = ?auto_25857 ?auto_25878 ) ) ( not ( = ?auto_25858 ?auto_25861 ) ) ( not ( = ?auto_25858 ?auto_25878 ) ) ( not ( = ?auto_25859 ?auto_25861 ) ) ( not ( = ?auto_25859 ?auto_25878 ) ) ( not ( = ?auto_25861 ?auto_25890 ) ) ( not ( = ?auto_25861 ?auto_25897 ) ) ( not ( = ?auto_25861 ?auto_25902 ) ) ( not ( = ?auto_25861 ?auto_25903 ) ) ( not ( = ?auto_25885 ?auto_25883 ) ) ( not ( = ?auto_25885 ?auto_25887 ) ) ( not ( = ?auto_25885 ?auto_25877 ) ) ( not ( = ?auto_25885 ?auto_25876 ) ) ( not ( = ?auto_25880 ?auto_25892 ) ) ( not ( = ?auto_25880 ?auto_25894 ) ) ( not ( = ?auto_25880 ?auto_25900 ) ) ( not ( = ?auto_25880 ?auto_25898 ) ) ( not ( = ?auto_25878 ?auto_25890 ) ) ( not ( = ?auto_25878 ?auto_25897 ) ) ( not ( = ?auto_25878 ?auto_25902 ) ) ( not ( = ?auto_25878 ?auto_25903 ) ) ( not ( = ?auto_25856 ?auto_25862 ) ) ( not ( = ?auto_25856 ?auto_25888 ) ) ( not ( = ?auto_25857 ?auto_25862 ) ) ( not ( = ?auto_25857 ?auto_25888 ) ) ( not ( = ?auto_25858 ?auto_25862 ) ) ( not ( = ?auto_25858 ?auto_25888 ) ) ( not ( = ?auto_25859 ?auto_25862 ) ) ( not ( = ?auto_25859 ?auto_25888 ) ) ( not ( = ?auto_25860 ?auto_25862 ) ) ( not ( = ?auto_25860 ?auto_25888 ) ) ( not ( = ?auto_25862 ?auto_25878 ) ) ( not ( = ?auto_25862 ?auto_25890 ) ) ( not ( = ?auto_25862 ?auto_25897 ) ) ( not ( = ?auto_25862 ?auto_25902 ) ) ( not ( = ?auto_25862 ?auto_25903 ) ) ( not ( = ?auto_25882 ?auto_25885 ) ) ( not ( = ?auto_25882 ?auto_25883 ) ) ( not ( = ?auto_25882 ?auto_25887 ) ) ( not ( = ?auto_25882 ?auto_25877 ) ) ( not ( = ?auto_25882 ?auto_25876 ) ) ( not ( = ?auto_25905 ?auto_25880 ) ) ( not ( = ?auto_25905 ?auto_25892 ) ) ( not ( = ?auto_25905 ?auto_25894 ) ) ( not ( = ?auto_25905 ?auto_25900 ) ) ( not ( = ?auto_25905 ?auto_25898 ) ) ( not ( = ?auto_25888 ?auto_25878 ) ) ( not ( = ?auto_25888 ?auto_25890 ) ) ( not ( = ?auto_25888 ?auto_25897 ) ) ( not ( = ?auto_25888 ?auto_25902 ) ) ( not ( = ?auto_25888 ?auto_25903 ) ) ( not ( = ?auto_25856 ?auto_25863 ) ) ( not ( = ?auto_25856 ?auto_25889 ) ) ( not ( = ?auto_25857 ?auto_25863 ) ) ( not ( = ?auto_25857 ?auto_25889 ) ) ( not ( = ?auto_25858 ?auto_25863 ) ) ( not ( = ?auto_25858 ?auto_25889 ) ) ( not ( = ?auto_25859 ?auto_25863 ) ) ( not ( = ?auto_25859 ?auto_25889 ) ) ( not ( = ?auto_25860 ?auto_25863 ) ) ( not ( = ?auto_25860 ?auto_25889 ) ) ( not ( = ?auto_25861 ?auto_25863 ) ) ( not ( = ?auto_25861 ?auto_25889 ) ) ( not ( = ?auto_25863 ?auto_25888 ) ) ( not ( = ?auto_25863 ?auto_25878 ) ) ( not ( = ?auto_25863 ?auto_25890 ) ) ( not ( = ?auto_25863 ?auto_25897 ) ) ( not ( = ?auto_25863 ?auto_25902 ) ) ( not ( = ?auto_25863 ?auto_25903 ) ) ( not ( = ?auto_25893 ?auto_25882 ) ) ( not ( = ?auto_25893 ?auto_25885 ) ) ( not ( = ?auto_25893 ?auto_25883 ) ) ( not ( = ?auto_25893 ?auto_25887 ) ) ( not ( = ?auto_25893 ?auto_25877 ) ) ( not ( = ?auto_25893 ?auto_25876 ) ) ( not ( = ?auto_25884 ?auto_25905 ) ) ( not ( = ?auto_25884 ?auto_25880 ) ) ( not ( = ?auto_25884 ?auto_25892 ) ) ( not ( = ?auto_25884 ?auto_25894 ) ) ( not ( = ?auto_25884 ?auto_25900 ) ) ( not ( = ?auto_25884 ?auto_25898 ) ) ( not ( = ?auto_25889 ?auto_25888 ) ) ( not ( = ?auto_25889 ?auto_25878 ) ) ( not ( = ?auto_25889 ?auto_25890 ) ) ( not ( = ?auto_25889 ?auto_25897 ) ) ( not ( = ?auto_25889 ?auto_25902 ) ) ( not ( = ?auto_25889 ?auto_25903 ) ) ( not ( = ?auto_25856 ?auto_25864 ) ) ( not ( = ?auto_25856 ?auto_25881 ) ) ( not ( = ?auto_25857 ?auto_25864 ) ) ( not ( = ?auto_25857 ?auto_25881 ) ) ( not ( = ?auto_25858 ?auto_25864 ) ) ( not ( = ?auto_25858 ?auto_25881 ) ) ( not ( = ?auto_25859 ?auto_25864 ) ) ( not ( = ?auto_25859 ?auto_25881 ) ) ( not ( = ?auto_25860 ?auto_25864 ) ) ( not ( = ?auto_25860 ?auto_25881 ) ) ( not ( = ?auto_25861 ?auto_25864 ) ) ( not ( = ?auto_25861 ?auto_25881 ) ) ( not ( = ?auto_25862 ?auto_25864 ) ) ( not ( = ?auto_25862 ?auto_25881 ) ) ( not ( = ?auto_25864 ?auto_25889 ) ) ( not ( = ?auto_25864 ?auto_25888 ) ) ( not ( = ?auto_25864 ?auto_25878 ) ) ( not ( = ?auto_25864 ?auto_25890 ) ) ( not ( = ?auto_25864 ?auto_25897 ) ) ( not ( = ?auto_25864 ?auto_25902 ) ) ( not ( = ?auto_25864 ?auto_25903 ) ) ( not ( = ?auto_25879 ?auto_25893 ) ) ( not ( = ?auto_25879 ?auto_25882 ) ) ( not ( = ?auto_25879 ?auto_25885 ) ) ( not ( = ?auto_25879 ?auto_25883 ) ) ( not ( = ?auto_25879 ?auto_25887 ) ) ( not ( = ?auto_25879 ?auto_25877 ) ) ( not ( = ?auto_25879 ?auto_25876 ) ) ( not ( = ?auto_25891 ?auto_25884 ) ) ( not ( = ?auto_25891 ?auto_25905 ) ) ( not ( = ?auto_25891 ?auto_25880 ) ) ( not ( = ?auto_25891 ?auto_25892 ) ) ( not ( = ?auto_25891 ?auto_25894 ) ) ( not ( = ?auto_25891 ?auto_25900 ) ) ( not ( = ?auto_25891 ?auto_25898 ) ) ( not ( = ?auto_25881 ?auto_25889 ) ) ( not ( = ?auto_25881 ?auto_25888 ) ) ( not ( = ?auto_25881 ?auto_25878 ) ) ( not ( = ?auto_25881 ?auto_25890 ) ) ( not ( = ?auto_25881 ?auto_25897 ) ) ( not ( = ?auto_25881 ?auto_25902 ) ) ( not ( = ?auto_25881 ?auto_25903 ) ) ( not ( = ?auto_25856 ?auto_25865 ) ) ( not ( = ?auto_25856 ?auto_25886 ) ) ( not ( = ?auto_25857 ?auto_25865 ) ) ( not ( = ?auto_25857 ?auto_25886 ) ) ( not ( = ?auto_25858 ?auto_25865 ) ) ( not ( = ?auto_25858 ?auto_25886 ) ) ( not ( = ?auto_25859 ?auto_25865 ) ) ( not ( = ?auto_25859 ?auto_25886 ) ) ( not ( = ?auto_25860 ?auto_25865 ) ) ( not ( = ?auto_25860 ?auto_25886 ) ) ( not ( = ?auto_25861 ?auto_25865 ) ) ( not ( = ?auto_25861 ?auto_25886 ) ) ( not ( = ?auto_25862 ?auto_25865 ) ) ( not ( = ?auto_25862 ?auto_25886 ) ) ( not ( = ?auto_25863 ?auto_25865 ) ) ( not ( = ?auto_25863 ?auto_25886 ) ) ( not ( = ?auto_25865 ?auto_25881 ) ) ( not ( = ?auto_25865 ?auto_25889 ) ) ( not ( = ?auto_25865 ?auto_25888 ) ) ( not ( = ?auto_25865 ?auto_25878 ) ) ( not ( = ?auto_25865 ?auto_25890 ) ) ( not ( = ?auto_25865 ?auto_25897 ) ) ( not ( = ?auto_25865 ?auto_25902 ) ) ( not ( = ?auto_25865 ?auto_25903 ) ) ( not ( = ?auto_25899 ?auto_25879 ) ) ( not ( = ?auto_25899 ?auto_25893 ) ) ( not ( = ?auto_25899 ?auto_25882 ) ) ( not ( = ?auto_25899 ?auto_25885 ) ) ( not ( = ?auto_25899 ?auto_25883 ) ) ( not ( = ?auto_25899 ?auto_25887 ) ) ( not ( = ?auto_25899 ?auto_25877 ) ) ( not ( = ?auto_25899 ?auto_25876 ) ) ( not ( = ?auto_25901 ?auto_25891 ) ) ( not ( = ?auto_25901 ?auto_25884 ) ) ( not ( = ?auto_25901 ?auto_25905 ) ) ( not ( = ?auto_25901 ?auto_25880 ) ) ( not ( = ?auto_25901 ?auto_25892 ) ) ( not ( = ?auto_25901 ?auto_25894 ) ) ( not ( = ?auto_25901 ?auto_25900 ) ) ( not ( = ?auto_25901 ?auto_25898 ) ) ( not ( = ?auto_25886 ?auto_25881 ) ) ( not ( = ?auto_25886 ?auto_25889 ) ) ( not ( = ?auto_25886 ?auto_25888 ) ) ( not ( = ?auto_25886 ?auto_25878 ) ) ( not ( = ?auto_25886 ?auto_25890 ) ) ( not ( = ?auto_25886 ?auto_25897 ) ) ( not ( = ?auto_25886 ?auto_25902 ) ) ( not ( = ?auto_25886 ?auto_25903 ) ) ( not ( = ?auto_25856 ?auto_25866 ) ) ( not ( = ?auto_25856 ?auto_25896 ) ) ( not ( = ?auto_25857 ?auto_25866 ) ) ( not ( = ?auto_25857 ?auto_25896 ) ) ( not ( = ?auto_25858 ?auto_25866 ) ) ( not ( = ?auto_25858 ?auto_25896 ) ) ( not ( = ?auto_25859 ?auto_25866 ) ) ( not ( = ?auto_25859 ?auto_25896 ) ) ( not ( = ?auto_25860 ?auto_25866 ) ) ( not ( = ?auto_25860 ?auto_25896 ) ) ( not ( = ?auto_25861 ?auto_25866 ) ) ( not ( = ?auto_25861 ?auto_25896 ) ) ( not ( = ?auto_25862 ?auto_25866 ) ) ( not ( = ?auto_25862 ?auto_25896 ) ) ( not ( = ?auto_25863 ?auto_25866 ) ) ( not ( = ?auto_25863 ?auto_25896 ) ) ( not ( = ?auto_25864 ?auto_25866 ) ) ( not ( = ?auto_25864 ?auto_25896 ) ) ( not ( = ?auto_25866 ?auto_25886 ) ) ( not ( = ?auto_25866 ?auto_25881 ) ) ( not ( = ?auto_25866 ?auto_25889 ) ) ( not ( = ?auto_25866 ?auto_25888 ) ) ( not ( = ?auto_25866 ?auto_25878 ) ) ( not ( = ?auto_25866 ?auto_25890 ) ) ( not ( = ?auto_25866 ?auto_25897 ) ) ( not ( = ?auto_25866 ?auto_25902 ) ) ( not ( = ?auto_25866 ?auto_25903 ) ) ( not ( = ?auto_25875 ?auto_25899 ) ) ( not ( = ?auto_25875 ?auto_25879 ) ) ( not ( = ?auto_25875 ?auto_25893 ) ) ( not ( = ?auto_25875 ?auto_25882 ) ) ( not ( = ?auto_25875 ?auto_25885 ) ) ( not ( = ?auto_25875 ?auto_25883 ) ) ( not ( = ?auto_25875 ?auto_25887 ) ) ( not ( = ?auto_25875 ?auto_25877 ) ) ( not ( = ?auto_25875 ?auto_25876 ) ) ( not ( = ?auto_25895 ?auto_25901 ) ) ( not ( = ?auto_25895 ?auto_25891 ) ) ( not ( = ?auto_25895 ?auto_25884 ) ) ( not ( = ?auto_25895 ?auto_25905 ) ) ( not ( = ?auto_25895 ?auto_25880 ) ) ( not ( = ?auto_25895 ?auto_25892 ) ) ( not ( = ?auto_25895 ?auto_25894 ) ) ( not ( = ?auto_25895 ?auto_25900 ) ) ( not ( = ?auto_25895 ?auto_25898 ) ) ( not ( = ?auto_25896 ?auto_25886 ) ) ( not ( = ?auto_25896 ?auto_25881 ) ) ( not ( = ?auto_25896 ?auto_25889 ) ) ( not ( = ?auto_25896 ?auto_25888 ) ) ( not ( = ?auto_25896 ?auto_25878 ) ) ( not ( = ?auto_25896 ?auto_25890 ) ) ( not ( = ?auto_25896 ?auto_25897 ) ) ( not ( = ?auto_25896 ?auto_25902 ) ) ( not ( = ?auto_25896 ?auto_25903 ) ) ( not ( = ?auto_25856 ?auto_25867 ) ) ( not ( = ?auto_25856 ?auto_25904 ) ) ( not ( = ?auto_25857 ?auto_25867 ) ) ( not ( = ?auto_25857 ?auto_25904 ) ) ( not ( = ?auto_25858 ?auto_25867 ) ) ( not ( = ?auto_25858 ?auto_25904 ) ) ( not ( = ?auto_25859 ?auto_25867 ) ) ( not ( = ?auto_25859 ?auto_25904 ) ) ( not ( = ?auto_25860 ?auto_25867 ) ) ( not ( = ?auto_25860 ?auto_25904 ) ) ( not ( = ?auto_25861 ?auto_25867 ) ) ( not ( = ?auto_25861 ?auto_25904 ) ) ( not ( = ?auto_25862 ?auto_25867 ) ) ( not ( = ?auto_25862 ?auto_25904 ) ) ( not ( = ?auto_25863 ?auto_25867 ) ) ( not ( = ?auto_25863 ?auto_25904 ) ) ( not ( = ?auto_25864 ?auto_25867 ) ) ( not ( = ?auto_25864 ?auto_25904 ) ) ( not ( = ?auto_25865 ?auto_25867 ) ) ( not ( = ?auto_25865 ?auto_25904 ) ) ( not ( = ?auto_25867 ?auto_25896 ) ) ( not ( = ?auto_25867 ?auto_25886 ) ) ( not ( = ?auto_25867 ?auto_25881 ) ) ( not ( = ?auto_25867 ?auto_25889 ) ) ( not ( = ?auto_25867 ?auto_25888 ) ) ( not ( = ?auto_25867 ?auto_25878 ) ) ( not ( = ?auto_25867 ?auto_25890 ) ) ( not ( = ?auto_25867 ?auto_25897 ) ) ( not ( = ?auto_25867 ?auto_25902 ) ) ( not ( = ?auto_25867 ?auto_25903 ) ) ( not ( = ?auto_25904 ?auto_25896 ) ) ( not ( = ?auto_25904 ?auto_25886 ) ) ( not ( = ?auto_25904 ?auto_25881 ) ) ( not ( = ?auto_25904 ?auto_25889 ) ) ( not ( = ?auto_25904 ?auto_25888 ) ) ( not ( = ?auto_25904 ?auto_25878 ) ) ( not ( = ?auto_25904 ?auto_25890 ) ) ( not ( = ?auto_25904 ?auto_25897 ) ) ( not ( = ?auto_25904 ?auto_25902 ) ) ( not ( = ?auto_25904 ?auto_25903 ) ) ( not ( = ?auto_25856 ?auto_25868 ) ) ( not ( = ?auto_25856 ?auto_25872 ) ) ( not ( = ?auto_25857 ?auto_25868 ) ) ( not ( = ?auto_25857 ?auto_25872 ) ) ( not ( = ?auto_25858 ?auto_25868 ) ) ( not ( = ?auto_25858 ?auto_25872 ) ) ( not ( = ?auto_25859 ?auto_25868 ) ) ( not ( = ?auto_25859 ?auto_25872 ) ) ( not ( = ?auto_25860 ?auto_25868 ) ) ( not ( = ?auto_25860 ?auto_25872 ) ) ( not ( = ?auto_25861 ?auto_25868 ) ) ( not ( = ?auto_25861 ?auto_25872 ) ) ( not ( = ?auto_25862 ?auto_25868 ) ) ( not ( = ?auto_25862 ?auto_25872 ) ) ( not ( = ?auto_25863 ?auto_25868 ) ) ( not ( = ?auto_25863 ?auto_25872 ) ) ( not ( = ?auto_25864 ?auto_25868 ) ) ( not ( = ?auto_25864 ?auto_25872 ) ) ( not ( = ?auto_25865 ?auto_25868 ) ) ( not ( = ?auto_25865 ?auto_25872 ) ) ( not ( = ?auto_25866 ?auto_25868 ) ) ( not ( = ?auto_25866 ?auto_25872 ) ) ( not ( = ?auto_25868 ?auto_25904 ) ) ( not ( = ?auto_25868 ?auto_25896 ) ) ( not ( = ?auto_25868 ?auto_25886 ) ) ( not ( = ?auto_25868 ?auto_25881 ) ) ( not ( = ?auto_25868 ?auto_25889 ) ) ( not ( = ?auto_25868 ?auto_25888 ) ) ( not ( = ?auto_25868 ?auto_25878 ) ) ( not ( = ?auto_25868 ?auto_25890 ) ) ( not ( = ?auto_25868 ?auto_25897 ) ) ( not ( = ?auto_25868 ?auto_25902 ) ) ( not ( = ?auto_25868 ?auto_25903 ) ) ( not ( = ?auto_25871 ?auto_25875 ) ) ( not ( = ?auto_25871 ?auto_25899 ) ) ( not ( = ?auto_25871 ?auto_25879 ) ) ( not ( = ?auto_25871 ?auto_25893 ) ) ( not ( = ?auto_25871 ?auto_25882 ) ) ( not ( = ?auto_25871 ?auto_25885 ) ) ( not ( = ?auto_25871 ?auto_25883 ) ) ( not ( = ?auto_25871 ?auto_25887 ) ) ( not ( = ?auto_25871 ?auto_25877 ) ) ( not ( = ?auto_25871 ?auto_25876 ) ) ( not ( = ?auto_25874 ?auto_25895 ) ) ( not ( = ?auto_25874 ?auto_25901 ) ) ( not ( = ?auto_25874 ?auto_25891 ) ) ( not ( = ?auto_25874 ?auto_25884 ) ) ( not ( = ?auto_25874 ?auto_25905 ) ) ( not ( = ?auto_25874 ?auto_25880 ) ) ( not ( = ?auto_25874 ?auto_25892 ) ) ( not ( = ?auto_25874 ?auto_25894 ) ) ( not ( = ?auto_25874 ?auto_25900 ) ) ( not ( = ?auto_25874 ?auto_25898 ) ) ( not ( = ?auto_25872 ?auto_25904 ) ) ( not ( = ?auto_25872 ?auto_25896 ) ) ( not ( = ?auto_25872 ?auto_25886 ) ) ( not ( = ?auto_25872 ?auto_25881 ) ) ( not ( = ?auto_25872 ?auto_25889 ) ) ( not ( = ?auto_25872 ?auto_25888 ) ) ( not ( = ?auto_25872 ?auto_25878 ) ) ( not ( = ?auto_25872 ?auto_25890 ) ) ( not ( = ?auto_25872 ?auto_25897 ) ) ( not ( = ?auto_25872 ?auto_25902 ) ) ( not ( = ?auto_25872 ?auto_25903 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_25856 ?auto_25857 ?auto_25858 ?auto_25859 ?auto_25860 ?auto_25861 ?auto_25862 ?auto_25863 ?auto_25864 ?auto_25865 ?auto_25866 ?auto_25867 )
      ( MAKE-1CRATE ?auto_25867 ?auto_25868 )
      ( MAKE-12CRATE-VERIFY ?auto_25856 ?auto_25857 ?auto_25858 ?auto_25859 ?auto_25860 ?auto_25861 ?auto_25862 ?auto_25863 ?auto_25864 ?auto_25865 ?auto_25866 ?auto_25867 ?auto_25868 ) )
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
      ?auto_25937 - SURFACE
      ?auto_25938 - SURFACE
      ?auto_25939 - SURFACE
      ?auto_25940 - SURFACE
      ?auto_25941 - SURFACE
      ?auto_25942 - SURFACE
      ?auto_25943 - SURFACE
    )
    :vars
    (
      ?auto_25946 - HOIST
      ?auto_25948 - PLACE
      ?auto_25945 - PLACE
      ?auto_25947 - HOIST
      ?auto_25949 - SURFACE
      ?auto_25969 - PLACE
      ?auto_25968 - HOIST
      ?auto_25980 - SURFACE
      ?auto_25960 - PLACE
      ?auto_25957 - HOIST
      ?auto_25953 - SURFACE
      ?auto_25965 - SURFACE
      ?auto_25961 - PLACE
      ?auto_25962 - HOIST
      ?auto_25956 - SURFACE
      ?auto_25971 - PLACE
      ?auto_25970 - HOIST
      ?auto_25977 - SURFACE
      ?auto_25979 - PLACE
      ?auto_25964 - HOIST
      ?auto_25983 - SURFACE
      ?auto_25981 - PLACE
      ?auto_25972 - HOIST
      ?auto_25973 - SURFACE
      ?auto_25959 - PLACE
      ?auto_25952 - HOIST
      ?auto_25951 - SURFACE
      ?auto_25958 - PLACE
      ?auto_25950 - HOIST
      ?auto_25954 - SURFACE
      ?auto_25974 - PLACE
      ?auto_25967 - HOIST
      ?auto_25966 - SURFACE
      ?auto_25963 - PLACE
      ?auto_25982 - HOIST
      ?auto_25976 - SURFACE
      ?auto_25975 - PLACE
      ?auto_25978 - HOIST
      ?auto_25955 - SURFACE
      ?auto_25944 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25946 ?auto_25948 ) ( IS-CRATE ?auto_25943 ) ( not ( = ?auto_25945 ?auto_25948 ) ) ( HOIST-AT ?auto_25947 ?auto_25945 ) ( AVAILABLE ?auto_25947 ) ( SURFACE-AT ?auto_25943 ?auto_25945 ) ( ON ?auto_25943 ?auto_25949 ) ( CLEAR ?auto_25943 ) ( not ( = ?auto_25942 ?auto_25943 ) ) ( not ( = ?auto_25942 ?auto_25949 ) ) ( not ( = ?auto_25943 ?auto_25949 ) ) ( not ( = ?auto_25946 ?auto_25947 ) ) ( IS-CRATE ?auto_25942 ) ( not ( = ?auto_25969 ?auto_25948 ) ) ( HOIST-AT ?auto_25968 ?auto_25969 ) ( AVAILABLE ?auto_25968 ) ( SURFACE-AT ?auto_25942 ?auto_25969 ) ( ON ?auto_25942 ?auto_25980 ) ( CLEAR ?auto_25942 ) ( not ( = ?auto_25941 ?auto_25942 ) ) ( not ( = ?auto_25941 ?auto_25980 ) ) ( not ( = ?auto_25942 ?auto_25980 ) ) ( not ( = ?auto_25946 ?auto_25968 ) ) ( IS-CRATE ?auto_25941 ) ( not ( = ?auto_25960 ?auto_25948 ) ) ( HOIST-AT ?auto_25957 ?auto_25960 ) ( SURFACE-AT ?auto_25941 ?auto_25960 ) ( ON ?auto_25941 ?auto_25953 ) ( CLEAR ?auto_25941 ) ( not ( = ?auto_25940 ?auto_25941 ) ) ( not ( = ?auto_25940 ?auto_25953 ) ) ( not ( = ?auto_25941 ?auto_25953 ) ) ( not ( = ?auto_25946 ?auto_25957 ) ) ( IS-CRATE ?auto_25940 ) ( AVAILABLE ?auto_25957 ) ( SURFACE-AT ?auto_25940 ?auto_25960 ) ( ON ?auto_25940 ?auto_25965 ) ( CLEAR ?auto_25940 ) ( not ( = ?auto_25939 ?auto_25940 ) ) ( not ( = ?auto_25939 ?auto_25965 ) ) ( not ( = ?auto_25940 ?auto_25965 ) ) ( IS-CRATE ?auto_25939 ) ( not ( = ?auto_25961 ?auto_25948 ) ) ( HOIST-AT ?auto_25962 ?auto_25961 ) ( AVAILABLE ?auto_25962 ) ( SURFACE-AT ?auto_25939 ?auto_25961 ) ( ON ?auto_25939 ?auto_25956 ) ( CLEAR ?auto_25939 ) ( not ( = ?auto_25938 ?auto_25939 ) ) ( not ( = ?auto_25938 ?auto_25956 ) ) ( not ( = ?auto_25939 ?auto_25956 ) ) ( not ( = ?auto_25946 ?auto_25962 ) ) ( IS-CRATE ?auto_25938 ) ( not ( = ?auto_25971 ?auto_25948 ) ) ( HOIST-AT ?auto_25970 ?auto_25971 ) ( AVAILABLE ?auto_25970 ) ( SURFACE-AT ?auto_25938 ?auto_25971 ) ( ON ?auto_25938 ?auto_25977 ) ( CLEAR ?auto_25938 ) ( not ( = ?auto_25937 ?auto_25938 ) ) ( not ( = ?auto_25937 ?auto_25977 ) ) ( not ( = ?auto_25938 ?auto_25977 ) ) ( not ( = ?auto_25946 ?auto_25970 ) ) ( IS-CRATE ?auto_25937 ) ( not ( = ?auto_25979 ?auto_25948 ) ) ( HOIST-AT ?auto_25964 ?auto_25979 ) ( AVAILABLE ?auto_25964 ) ( SURFACE-AT ?auto_25937 ?auto_25979 ) ( ON ?auto_25937 ?auto_25983 ) ( CLEAR ?auto_25937 ) ( not ( = ?auto_25936 ?auto_25937 ) ) ( not ( = ?auto_25936 ?auto_25983 ) ) ( not ( = ?auto_25937 ?auto_25983 ) ) ( not ( = ?auto_25946 ?auto_25964 ) ) ( IS-CRATE ?auto_25936 ) ( not ( = ?auto_25981 ?auto_25948 ) ) ( HOIST-AT ?auto_25972 ?auto_25981 ) ( AVAILABLE ?auto_25972 ) ( SURFACE-AT ?auto_25936 ?auto_25981 ) ( ON ?auto_25936 ?auto_25973 ) ( CLEAR ?auto_25936 ) ( not ( = ?auto_25935 ?auto_25936 ) ) ( not ( = ?auto_25935 ?auto_25973 ) ) ( not ( = ?auto_25936 ?auto_25973 ) ) ( not ( = ?auto_25946 ?auto_25972 ) ) ( IS-CRATE ?auto_25935 ) ( not ( = ?auto_25959 ?auto_25948 ) ) ( HOIST-AT ?auto_25952 ?auto_25959 ) ( AVAILABLE ?auto_25952 ) ( SURFACE-AT ?auto_25935 ?auto_25959 ) ( ON ?auto_25935 ?auto_25951 ) ( CLEAR ?auto_25935 ) ( not ( = ?auto_25934 ?auto_25935 ) ) ( not ( = ?auto_25934 ?auto_25951 ) ) ( not ( = ?auto_25935 ?auto_25951 ) ) ( not ( = ?auto_25946 ?auto_25952 ) ) ( IS-CRATE ?auto_25934 ) ( not ( = ?auto_25958 ?auto_25948 ) ) ( HOIST-AT ?auto_25950 ?auto_25958 ) ( AVAILABLE ?auto_25950 ) ( SURFACE-AT ?auto_25934 ?auto_25958 ) ( ON ?auto_25934 ?auto_25954 ) ( CLEAR ?auto_25934 ) ( not ( = ?auto_25933 ?auto_25934 ) ) ( not ( = ?auto_25933 ?auto_25954 ) ) ( not ( = ?auto_25934 ?auto_25954 ) ) ( not ( = ?auto_25946 ?auto_25950 ) ) ( IS-CRATE ?auto_25933 ) ( not ( = ?auto_25974 ?auto_25948 ) ) ( HOIST-AT ?auto_25967 ?auto_25974 ) ( AVAILABLE ?auto_25967 ) ( SURFACE-AT ?auto_25933 ?auto_25974 ) ( ON ?auto_25933 ?auto_25966 ) ( CLEAR ?auto_25933 ) ( not ( = ?auto_25932 ?auto_25933 ) ) ( not ( = ?auto_25932 ?auto_25966 ) ) ( not ( = ?auto_25933 ?auto_25966 ) ) ( not ( = ?auto_25946 ?auto_25967 ) ) ( IS-CRATE ?auto_25932 ) ( not ( = ?auto_25963 ?auto_25948 ) ) ( HOIST-AT ?auto_25982 ?auto_25963 ) ( AVAILABLE ?auto_25982 ) ( SURFACE-AT ?auto_25932 ?auto_25963 ) ( ON ?auto_25932 ?auto_25976 ) ( CLEAR ?auto_25932 ) ( not ( = ?auto_25931 ?auto_25932 ) ) ( not ( = ?auto_25931 ?auto_25976 ) ) ( not ( = ?auto_25932 ?auto_25976 ) ) ( not ( = ?auto_25946 ?auto_25982 ) ) ( SURFACE-AT ?auto_25930 ?auto_25948 ) ( CLEAR ?auto_25930 ) ( IS-CRATE ?auto_25931 ) ( AVAILABLE ?auto_25946 ) ( not ( = ?auto_25975 ?auto_25948 ) ) ( HOIST-AT ?auto_25978 ?auto_25975 ) ( AVAILABLE ?auto_25978 ) ( SURFACE-AT ?auto_25931 ?auto_25975 ) ( ON ?auto_25931 ?auto_25955 ) ( CLEAR ?auto_25931 ) ( TRUCK-AT ?auto_25944 ?auto_25948 ) ( not ( = ?auto_25930 ?auto_25931 ) ) ( not ( = ?auto_25930 ?auto_25955 ) ) ( not ( = ?auto_25931 ?auto_25955 ) ) ( not ( = ?auto_25946 ?auto_25978 ) ) ( not ( = ?auto_25930 ?auto_25932 ) ) ( not ( = ?auto_25930 ?auto_25976 ) ) ( not ( = ?auto_25932 ?auto_25955 ) ) ( not ( = ?auto_25963 ?auto_25975 ) ) ( not ( = ?auto_25982 ?auto_25978 ) ) ( not ( = ?auto_25976 ?auto_25955 ) ) ( not ( = ?auto_25930 ?auto_25933 ) ) ( not ( = ?auto_25930 ?auto_25966 ) ) ( not ( = ?auto_25931 ?auto_25933 ) ) ( not ( = ?auto_25931 ?auto_25966 ) ) ( not ( = ?auto_25933 ?auto_25976 ) ) ( not ( = ?auto_25933 ?auto_25955 ) ) ( not ( = ?auto_25974 ?auto_25963 ) ) ( not ( = ?auto_25974 ?auto_25975 ) ) ( not ( = ?auto_25967 ?auto_25982 ) ) ( not ( = ?auto_25967 ?auto_25978 ) ) ( not ( = ?auto_25966 ?auto_25976 ) ) ( not ( = ?auto_25966 ?auto_25955 ) ) ( not ( = ?auto_25930 ?auto_25934 ) ) ( not ( = ?auto_25930 ?auto_25954 ) ) ( not ( = ?auto_25931 ?auto_25934 ) ) ( not ( = ?auto_25931 ?auto_25954 ) ) ( not ( = ?auto_25932 ?auto_25934 ) ) ( not ( = ?auto_25932 ?auto_25954 ) ) ( not ( = ?auto_25934 ?auto_25966 ) ) ( not ( = ?auto_25934 ?auto_25976 ) ) ( not ( = ?auto_25934 ?auto_25955 ) ) ( not ( = ?auto_25958 ?auto_25974 ) ) ( not ( = ?auto_25958 ?auto_25963 ) ) ( not ( = ?auto_25958 ?auto_25975 ) ) ( not ( = ?auto_25950 ?auto_25967 ) ) ( not ( = ?auto_25950 ?auto_25982 ) ) ( not ( = ?auto_25950 ?auto_25978 ) ) ( not ( = ?auto_25954 ?auto_25966 ) ) ( not ( = ?auto_25954 ?auto_25976 ) ) ( not ( = ?auto_25954 ?auto_25955 ) ) ( not ( = ?auto_25930 ?auto_25935 ) ) ( not ( = ?auto_25930 ?auto_25951 ) ) ( not ( = ?auto_25931 ?auto_25935 ) ) ( not ( = ?auto_25931 ?auto_25951 ) ) ( not ( = ?auto_25932 ?auto_25935 ) ) ( not ( = ?auto_25932 ?auto_25951 ) ) ( not ( = ?auto_25933 ?auto_25935 ) ) ( not ( = ?auto_25933 ?auto_25951 ) ) ( not ( = ?auto_25935 ?auto_25954 ) ) ( not ( = ?auto_25935 ?auto_25966 ) ) ( not ( = ?auto_25935 ?auto_25976 ) ) ( not ( = ?auto_25935 ?auto_25955 ) ) ( not ( = ?auto_25959 ?auto_25958 ) ) ( not ( = ?auto_25959 ?auto_25974 ) ) ( not ( = ?auto_25959 ?auto_25963 ) ) ( not ( = ?auto_25959 ?auto_25975 ) ) ( not ( = ?auto_25952 ?auto_25950 ) ) ( not ( = ?auto_25952 ?auto_25967 ) ) ( not ( = ?auto_25952 ?auto_25982 ) ) ( not ( = ?auto_25952 ?auto_25978 ) ) ( not ( = ?auto_25951 ?auto_25954 ) ) ( not ( = ?auto_25951 ?auto_25966 ) ) ( not ( = ?auto_25951 ?auto_25976 ) ) ( not ( = ?auto_25951 ?auto_25955 ) ) ( not ( = ?auto_25930 ?auto_25936 ) ) ( not ( = ?auto_25930 ?auto_25973 ) ) ( not ( = ?auto_25931 ?auto_25936 ) ) ( not ( = ?auto_25931 ?auto_25973 ) ) ( not ( = ?auto_25932 ?auto_25936 ) ) ( not ( = ?auto_25932 ?auto_25973 ) ) ( not ( = ?auto_25933 ?auto_25936 ) ) ( not ( = ?auto_25933 ?auto_25973 ) ) ( not ( = ?auto_25934 ?auto_25936 ) ) ( not ( = ?auto_25934 ?auto_25973 ) ) ( not ( = ?auto_25936 ?auto_25951 ) ) ( not ( = ?auto_25936 ?auto_25954 ) ) ( not ( = ?auto_25936 ?auto_25966 ) ) ( not ( = ?auto_25936 ?auto_25976 ) ) ( not ( = ?auto_25936 ?auto_25955 ) ) ( not ( = ?auto_25981 ?auto_25959 ) ) ( not ( = ?auto_25981 ?auto_25958 ) ) ( not ( = ?auto_25981 ?auto_25974 ) ) ( not ( = ?auto_25981 ?auto_25963 ) ) ( not ( = ?auto_25981 ?auto_25975 ) ) ( not ( = ?auto_25972 ?auto_25952 ) ) ( not ( = ?auto_25972 ?auto_25950 ) ) ( not ( = ?auto_25972 ?auto_25967 ) ) ( not ( = ?auto_25972 ?auto_25982 ) ) ( not ( = ?auto_25972 ?auto_25978 ) ) ( not ( = ?auto_25973 ?auto_25951 ) ) ( not ( = ?auto_25973 ?auto_25954 ) ) ( not ( = ?auto_25973 ?auto_25966 ) ) ( not ( = ?auto_25973 ?auto_25976 ) ) ( not ( = ?auto_25973 ?auto_25955 ) ) ( not ( = ?auto_25930 ?auto_25937 ) ) ( not ( = ?auto_25930 ?auto_25983 ) ) ( not ( = ?auto_25931 ?auto_25937 ) ) ( not ( = ?auto_25931 ?auto_25983 ) ) ( not ( = ?auto_25932 ?auto_25937 ) ) ( not ( = ?auto_25932 ?auto_25983 ) ) ( not ( = ?auto_25933 ?auto_25937 ) ) ( not ( = ?auto_25933 ?auto_25983 ) ) ( not ( = ?auto_25934 ?auto_25937 ) ) ( not ( = ?auto_25934 ?auto_25983 ) ) ( not ( = ?auto_25935 ?auto_25937 ) ) ( not ( = ?auto_25935 ?auto_25983 ) ) ( not ( = ?auto_25937 ?auto_25973 ) ) ( not ( = ?auto_25937 ?auto_25951 ) ) ( not ( = ?auto_25937 ?auto_25954 ) ) ( not ( = ?auto_25937 ?auto_25966 ) ) ( not ( = ?auto_25937 ?auto_25976 ) ) ( not ( = ?auto_25937 ?auto_25955 ) ) ( not ( = ?auto_25979 ?auto_25981 ) ) ( not ( = ?auto_25979 ?auto_25959 ) ) ( not ( = ?auto_25979 ?auto_25958 ) ) ( not ( = ?auto_25979 ?auto_25974 ) ) ( not ( = ?auto_25979 ?auto_25963 ) ) ( not ( = ?auto_25979 ?auto_25975 ) ) ( not ( = ?auto_25964 ?auto_25972 ) ) ( not ( = ?auto_25964 ?auto_25952 ) ) ( not ( = ?auto_25964 ?auto_25950 ) ) ( not ( = ?auto_25964 ?auto_25967 ) ) ( not ( = ?auto_25964 ?auto_25982 ) ) ( not ( = ?auto_25964 ?auto_25978 ) ) ( not ( = ?auto_25983 ?auto_25973 ) ) ( not ( = ?auto_25983 ?auto_25951 ) ) ( not ( = ?auto_25983 ?auto_25954 ) ) ( not ( = ?auto_25983 ?auto_25966 ) ) ( not ( = ?auto_25983 ?auto_25976 ) ) ( not ( = ?auto_25983 ?auto_25955 ) ) ( not ( = ?auto_25930 ?auto_25938 ) ) ( not ( = ?auto_25930 ?auto_25977 ) ) ( not ( = ?auto_25931 ?auto_25938 ) ) ( not ( = ?auto_25931 ?auto_25977 ) ) ( not ( = ?auto_25932 ?auto_25938 ) ) ( not ( = ?auto_25932 ?auto_25977 ) ) ( not ( = ?auto_25933 ?auto_25938 ) ) ( not ( = ?auto_25933 ?auto_25977 ) ) ( not ( = ?auto_25934 ?auto_25938 ) ) ( not ( = ?auto_25934 ?auto_25977 ) ) ( not ( = ?auto_25935 ?auto_25938 ) ) ( not ( = ?auto_25935 ?auto_25977 ) ) ( not ( = ?auto_25936 ?auto_25938 ) ) ( not ( = ?auto_25936 ?auto_25977 ) ) ( not ( = ?auto_25938 ?auto_25983 ) ) ( not ( = ?auto_25938 ?auto_25973 ) ) ( not ( = ?auto_25938 ?auto_25951 ) ) ( not ( = ?auto_25938 ?auto_25954 ) ) ( not ( = ?auto_25938 ?auto_25966 ) ) ( not ( = ?auto_25938 ?auto_25976 ) ) ( not ( = ?auto_25938 ?auto_25955 ) ) ( not ( = ?auto_25971 ?auto_25979 ) ) ( not ( = ?auto_25971 ?auto_25981 ) ) ( not ( = ?auto_25971 ?auto_25959 ) ) ( not ( = ?auto_25971 ?auto_25958 ) ) ( not ( = ?auto_25971 ?auto_25974 ) ) ( not ( = ?auto_25971 ?auto_25963 ) ) ( not ( = ?auto_25971 ?auto_25975 ) ) ( not ( = ?auto_25970 ?auto_25964 ) ) ( not ( = ?auto_25970 ?auto_25972 ) ) ( not ( = ?auto_25970 ?auto_25952 ) ) ( not ( = ?auto_25970 ?auto_25950 ) ) ( not ( = ?auto_25970 ?auto_25967 ) ) ( not ( = ?auto_25970 ?auto_25982 ) ) ( not ( = ?auto_25970 ?auto_25978 ) ) ( not ( = ?auto_25977 ?auto_25983 ) ) ( not ( = ?auto_25977 ?auto_25973 ) ) ( not ( = ?auto_25977 ?auto_25951 ) ) ( not ( = ?auto_25977 ?auto_25954 ) ) ( not ( = ?auto_25977 ?auto_25966 ) ) ( not ( = ?auto_25977 ?auto_25976 ) ) ( not ( = ?auto_25977 ?auto_25955 ) ) ( not ( = ?auto_25930 ?auto_25939 ) ) ( not ( = ?auto_25930 ?auto_25956 ) ) ( not ( = ?auto_25931 ?auto_25939 ) ) ( not ( = ?auto_25931 ?auto_25956 ) ) ( not ( = ?auto_25932 ?auto_25939 ) ) ( not ( = ?auto_25932 ?auto_25956 ) ) ( not ( = ?auto_25933 ?auto_25939 ) ) ( not ( = ?auto_25933 ?auto_25956 ) ) ( not ( = ?auto_25934 ?auto_25939 ) ) ( not ( = ?auto_25934 ?auto_25956 ) ) ( not ( = ?auto_25935 ?auto_25939 ) ) ( not ( = ?auto_25935 ?auto_25956 ) ) ( not ( = ?auto_25936 ?auto_25939 ) ) ( not ( = ?auto_25936 ?auto_25956 ) ) ( not ( = ?auto_25937 ?auto_25939 ) ) ( not ( = ?auto_25937 ?auto_25956 ) ) ( not ( = ?auto_25939 ?auto_25977 ) ) ( not ( = ?auto_25939 ?auto_25983 ) ) ( not ( = ?auto_25939 ?auto_25973 ) ) ( not ( = ?auto_25939 ?auto_25951 ) ) ( not ( = ?auto_25939 ?auto_25954 ) ) ( not ( = ?auto_25939 ?auto_25966 ) ) ( not ( = ?auto_25939 ?auto_25976 ) ) ( not ( = ?auto_25939 ?auto_25955 ) ) ( not ( = ?auto_25961 ?auto_25971 ) ) ( not ( = ?auto_25961 ?auto_25979 ) ) ( not ( = ?auto_25961 ?auto_25981 ) ) ( not ( = ?auto_25961 ?auto_25959 ) ) ( not ( = ?auto_25961 ?auto_25958 ) ) ( not ( = ?auto_25961 ?auto_25974 ) ) ( not ( = ?auto_25961 ?auto_25963 ) ) ( not ( = ?auto_25961 ?auto_25975 ) ) ( not ( = ?auto_25962 ?auto_25970 ) ) ( not ( = ?auto_25962 ?auto_25964 ) ) ( not ( = ?auto_25962 ?auto_25972 ) ) ( not ( = ?auto_25962 ?auto_25952 ) ) ( not ( = ?auto_25962 ?auto_25950 ) ) ( not ( = ?auto_25962 ?auto_25967 ) ) ( not ( = ?auto_25962 ?auto_25982 ) ) ( not ( = ?auto_25962 ?auto_25978 ) ) ( not ( = ?auto_25956 ?auto_25977 ) ) ( not ( = ?auto_25956 ?auto_25983 ) ) ( not ( = ?auto_25956 ?auto_25973 ) ) ( not ( = ?auto_25956 ?auto_25951 ) ) ( not ( = ?auto_25956 ?auto_25954 ) ) ( not ( = ?auto_25956 ?auto_25966 ) ) ( not ( = ?auto_25956 ?auto_25976 ) ) ( not ( = ?auto_25956 ?auto_25955 ) ) ( not ( = ?auto_25930 ?auto_25940 ) ) ( not ( = ?auto_25930 ?auto_25965 ) ) ( not ( = ?auto_25931 ?auto_25940 ) ) ( not ( = ?auto_25931 ?auto_25965 ) ) ( not ( = ?auto_25932 ?auto_25940 ) ) ( not ( = ?auto_25932 ?auto_25965 ) ) ( not ( = ?auto_25933 ?auto_25940 ) ) ( not ( = ?auto_25933 ?auto_25965 ) ) ( not ( = ?auto_25934 ?auto_25940 ) ) ( not ( = ?auto_25934 ?auto_25965 ) ) ( not ( = ?auto_25935 ?auto_25940 ) ) ( not ( = ?auto_25935 ?auto_25965 ) ) ( not ( = ?auto_25936 ?auto_25940 ) ) ( not ( = ?auto_25936 ?auto_25965 ) ) ( not ( = ?auto_25937 ?auto_25940 ) ) ( not ( = ?auto_25937 ?auto_25965 ) ) ( not ( = ?auto_25938 ?auto_25940 ) ) ( not ( = ?auto_25938 ?auto_25965 ) ) ( not ( = ?auto_25940 ?auto_25956 ) ) ( not ( = ?auto_25940 ?auto_25977 ) ) ( not ( = ?auto_25940 ?auto_25983 ) ) ( not ( = ?auto_25940 ?auto_25973 ) ) ( not ( = ?auto_25940 ?auto_25951 ) ) ( not ( = ?auto_25940 ?auto_25954 ) ) ( not ( = ?auto_25940 ?auto_25966 ) ) ( not ( = ?auto_25940 ?auto_25976 ) ) ( not ( = ?auto_25940 ?auto_25955 ) ) ( not ( = ?auto_25960 ?auto_25961 ) ) ( not ( = ?auto_25960 ?auto_25971 ) ) ( not ( = ?auto_25960 ?auto_25979 ) ) ( not ( = ?auto_25960 ?auto_25981 ) ) ( not ( = ?auto_25960 ?auto_25959 ) ) ( not ( = ?auto_25960 ?auto_25958 ) ) ( not ( = ?auto_25960 ?auto_25974 ) ) ( not ( = ?auto_25960 ?auto_25963 ) ) ( not ( = ?auto_25960 ?auto_25975 ) ) ( not ( = ?auto_25957 ?auto_25962 ) ) ( not ( = ?auto_25957 ?auto_25970 ) ) ( not ( = ?auto_25957 ?auto_25964 ) ) ( not ( = ?auto_25957 ?auto_25972 ) ) ( not ( = ?auto_25957 ?auto_25952 ) ) ( not ( = ?auto_25957 ?auto_25950 ) ) ( not ( = ?auto_25957 ?auto_25967 ) ) ( not ( = ?auto_25957 ?auto_25982 ) ) ( not ( = ?auto_25957 ?auto_25978 ) ) ( not ( = ?auto_25965 ?auto_25956 ) ) ( not ( = ?auto_25965 ?auto_25977 ) ) ( not ( = ?auto_25965 ?auto_25983 ) ) ( not ( = ?auto_25965 ?auto_25973 ) ) ( not ( = ?auto_25965 ?auto_25951 ) ) ( not ( = ?auto_25965 ?auto_25954 ) ) ( not ( = ?auto_25965 ?auto_25966 ) ) ( not ( = ?auto_25965 ?auto_25976 ) ) ( not ( = ?auto_25965 ?auto_25955 ) ) ( not ( = ?auto_25930 ?auto_25941 ) ) ( not ( = ?auto_25930 ?auto_25953 ) ) ( not ( = ?auto_25931 ?auto_25941 ) ) ( not ( = ?auto_25931 ?auto_25953 ) ) ( not ( = ?auto_25932 ?auto_25941 ) ) ( not ( = ?auto_25932 ?auto_25953 ) ) ( not ( = ?auto_25933 ?auto_25941 ) ) ( not ( = ?auto_25933 ?auto_25953 ) ) ( not ( = ?auto_25934 ?auto_25941 ) ) ( not ( = ?auto_25934 ?auto_25953 ) ) ( not ( = ?auto_25935 ?auto_25941 ) ) ( not ( = ?auto_25935 ?auto_25953 ) ) ( not ( = ?auto_25936 ?auto_25941 ) ) ( not ( = ?auto_25936 ?auto_25953 ) ) ( not ( = ?auto_25937 ?auto_25941 ) ) ( not ( = ?auto_25937 ?auto_25953 ) ) ( not ( = ?auto_25938 ?auto_25941 ) ) ( not ( = ?auto_25938 ?auto_25953 ) ) ( not ( = ?auto_25939 ?auto_25941 ) ) ( not ( = ?auto_25939 ?auto_25953 ) ) ( not ( = ?auto_25941 ?auto_25965 ) ) ( not ( = ?auto_25941 ?auto_25956 ) ) ( not ( = ?auto_25941 ?auto_25977 ) ) ( not ( = ?auto_25941 ?auto_25983 ) ) ( not ( = ?auto_25941 ?auto_25973 ) ) ( not ( = ?auto_25941 ?auto_25951 ) ) ( not ( = ?auto_25941 ?auto_25954 ) ) ( not ( = ?auto_25941 ?auto_25966 ) ) ( not ( = ?auto_25941 ?auto_25976 ) ) ( not ( = ?auto_25941 ?auto_25955 ) ) ( not ( = ?auto_25953 ?auto_25965 ) ) ( not ( = ?auto_25953 ?auto_25956 ) ) ( not ( = ?auto_25953 ?auto_25977 ) ) ( not ( = ?auto_25953 ?auto_25983 ) ) ( not ( = ?auto_25953 ?auto_25973 ) ) ( not ( = ?auto_25953 ?auto_25951 ) ) ( not ( = ?auto_25953 ?auto_25954 ) ) ( not ( = ?auto_25953 ?auto_25966 ) ) ( not ( = ?auto_25953 ?auto_25976 ) ) ( not ( = ?auto_25953 ?auto_25955 ) ) ( not ( = ?auto_25930 ?auto_25942 ) ) ( not ( = ?auto_25930 ?auto_25980 ) ) ( not ( = ?auto_25931 ?auto_25942 ) ) ( not ( = ?auto_25931 ?auto_25980 ) ) ( not ( = ?auto_25932 ?auto_25942 ) ) ( not ( = ?auto_25932 ?auto_25980 ) ) ( not ( = ?auto_25933 ?auto_25942 ) ) ( not ( = ?auto_25933 ?auto_25980 ) ) ( not ( = ?auto_25934 ?auto_25942 ) ) ( not ( = ?auto_25934 ?auto_25980 ) ) ( not ( = ?auto_25935 ?auto_25942 ) ) ( not ( = ?auto_25935 ?auto_25980 ) ) ( not ( = ?auto_25936 ?auto_25942 ) ) ( not ( = ?auto_25936 ?auto_25980 ) ) ( not ( = ?auto_25937 ?auto_25942 ) ) ( not ( = ?auto_25937 ?auto_25980 ) ) ( not ( = ?auto_25938 ?auto_25942 ) ) ( not ( = ?auto_25938 ?auto_25980 ) ) ( not ( = ?auto_25939 ?auto_25942 ) ) ( not ( = ?auto_25939 ?auto_25980 ) ) ( not ( = ?auto_25940 ?auto_25942 ) ) ( not ( = ?auto_25940 ?auto_25980 ) ) ( not ( = ?auto_25942 ?auto_25953 ) ) ( not ( = ?auto_25942 ?auto_25965 ) ) ( not ( = ?auto_25942 ?auto_25956 ) ) ( not ( = ?auto_25942 ?auto_25977 ) ) ( not ( = ?auto_25942 ?auto_25983 ) ) ( not ( = ?auto_25942 ?auto_25973 ) ) ( not ( = ?auto_25942 ?auto_25951 ) ) ( not ( = ?auto_25942 ?auto_25954 ) ) ( not ( = ?auto_25942 ?auto_25966 ) ) ( not ( = ?auto_25942 ?auto_25976 ) ) ( not ( = ?auto_25942 ?auto_25955 ) ) ( not ( = ?auto_25969 ?auto_25960 ) ) ( not ( = ?auto_25969 ?auto_25961 ) ) ( not ( = ?auto_25969 ?auto_25971 ) ) ( not ( = ?auto_25969 ?auto_25979 ) ) ( not ( = ?auto_25969 ?auto_25981 ) ) ( not ( = ?auto_25969 ?auto_25959 ) ) ( not ( = ?auto_25969 ?auto_25958 ) ) ( not ( = ?auto_25969 ?auto_25974 ) ) ( not ( = ?auto_25969 ?auto_25963 ) ) ( not ( = ?auto_25969 ?auto_25975 ) ) ( not ( = ?auto_25968 ?auto_25957 ) ) ( not ( = ?auto_25968 ?auto_25962 ) ) ( not ( = ?auto_25968 ?auto_25970 ) ) ( not ( = ?auto_25968 ?auto_25964 ) ) ( not ( = ?auto_25968 ?auto_25972 ) ) ( not ( = ?auto_25968 ?auto_25952 ) ) ( not ( = ?auto_25968 ?auto_25950 ) ) ( not ( = ?auto_25968 ?auto_25967 ) ) ( not ( = ?auto_25968 ?auto_25982 ) ) ( not ( = ?auto_25968 ?auto_25978 ) ) ( not ( = ?auto_25980 ?auto_25953 ) ) ( not ( = ?auto_25980 ?auto_25965 ) ) ( not ( = ?auto_25980 ?auto_25956 ) ) ( not ( = ?auto_25980 ?auto_25977 ) ) ( not ( = ?auto_25980 ?auto_25983 ) ) ( not ( = ?auto_25980 ?auto_25973 ) ) ( not ( = ?auto_25980 ?auto_25951 ) ) ( not ( = ?auto_25980 ?auto_25954 ) ) ( not ( = ?auto_25980 ?auto_25966 ) ) ( not ( = ?auto_25980 ?auto_25976 ) ) ( not ( = ?auto_25980 ?auto_25955 ) ) ( not ( = ?auto_25930 ?auto_25943 ) ) ( not ( = ?auto_25930 ?auto_25949 ) ) ( not ( = ?auto_25931 ?auto_25943 ) ) ( not ( = ?auto_25931 ?auto_25949 ) ) ( not ( = ?auto_25932 ?auto_25943 ) ) ( not ( = ?auto_25932 ?auto_25949 ) ) ( not ( = ?auto_25933 ?auto_25943 ) ) ( not ( = ?auto_25933 ?auto_25949 ) ) ( not ( = ?auto_25934 ?auto_25943 ) ) ( not ( = ?auto_25934 ?auto_25949 ) ) ( not ( = ?auto_25935 ?auto_25943 ) ) ( not ( = ?auto_25935 ?auto_25949 ) ) ( not ( = ?auto_25936 ?auto_25943 ) ) ( not ( = ?auto_25936 ?auto_25949 ) ) ( not ( = ?auto_25937 ?auto_25943 ) ) ( not ( = ?auto_25937 ?auto_25949 ) ) ( not ( = ?auto_25938 ?auto_25943 ) ) ( not ( = ?auto_25938 ?auto_25949 ) ) ( not ( = ?auto_25939 ?auto_25943 ) ) ( not ( = ?auto_25939 ?auto_25949 ) ) ( not ( = ?auto_25940 ?auto_25943 ) ) ( not ( = ?auto_25940 ?auto_25949 ) ) ( not ( = ?auto_25941 ?auto_25943 ) ) ( not ( = ?auto_25941 ?auto_25949 ) ) ( not ( = ?auto_25943 ?auto_25980 ) ) ( not ( = ?auto_25943 ?auto_25953 ) ) ( not ( = ?auto_25943 ?auto_25965 ) ) ( not ( = ?auto_25943 ?auto_25956 ) ) ( not ( = ?auto_25943 ?auto_25977 ) ) ( not ( = ?auto_25943 ?auto_25983 ) ) ( not ( = ?auto_25943 ?auto_25973 ) ) ( not ( = ?auto_25943 ?auto_25951 ) ) ( not ( = ?auto_25943 ?auto_25954 ) ) ( not ( = ?auto_25943 ?auto_25966 ) ) ( not ( = ?auto_25943 ?auto_25976 ) ) ( not ( = ?auto_25943 ?auto_25955 ) ) ( not ( = ?auto_25945 ?auto_25969 ) ) ( not ( = ?auto_25945 ?auto_25960 ) ) ( not ( = ?auto_25945 ?auto_25961 ) ) ( not ( = ?auto_25945 ?auto_25971 ) ) ( not ( = ?auto_25945 ?auto_25979 ) ) ( not ( = ?auto_25945 ?auto_25981 ) ) ( not ( = ?auto_25945 ?auto_25959 ) ) ( not ( = ?auto_25945 ?auto_25958 ) ) ( not ( = ?auto_25945 ?auto_25974 ) ) ( not ( = ?auto_25945 ?auto_25963 ) ) ( not ( = ?auto_25945 ?auto_25975 ) ) ( not ( = ?auto_25947 ?auto_25968 ) ) ( not ( = ?auto_25947 ?auto_25957 ) ) ( not ( = ?auto_25947 ?auto_25962 ) ) ( not ( = ?auto_25947 ?auto_25970 ) ) ( not ( = ?auto_25947 ?auto_25964 ) ) ( not ( = ?auto_25947 ?auto_25972 ) ) ( not ( = ?auto_25947 ?auto_25952 ) ) ( not ( = ?auto_25947 ?auto_25950 ) ) ( not ( = ?auto_25947 ?auto_25967 ) ) ( not ( = ?auto_25947 ?auto_25982 ) ) ( not ( = ?auto_25947 ?auto_25978 ) ) ( not ( = ?auto_25949 ?auto_25980 ) ) ( not ( = ?auto_25949 ?auto_25953 ) ) ( not ( = ?auto_25949 ?auto_25965 ) ) ( not ( = ?auto_25949 ?auto_25956 ) ) ( not ( = ?auto_25949 ?auto_25977 ) ) ( not ( = ?auto_25949 ?auto_25983 ) ) ( not ( = ?auto_25949 ?auto_25973 ) ) ( not ( = ?auto_25949 ?auto_25951 ) ) ( not ( = ?auto_25949 ?auto_25954 ) ) ( not ( = ?auto_25949 ?auto_25966 ) ) ( not ( = ?auto_25949 ?auto_25976 ) ) ( not ( = ?auto_25949 ?auto_25955 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_25930 ?auto_25931 ?auto_25932 ?auto_25933 ?auto_25934 ?auto_25935 ?auto_25936 ?auto_25937 ?auto_25938 ?auto_25939 ?auto_25940 ?auto_25941 ?auto_25942 )
      ( MAKE-1CRATE ?auto_25942 ?auto_25943 )
      ( MAKE-13CRATE-VERIFY ?auto_25930 ?auto_25931 ?auto_25932 ?auto_25933 ?auto_25934 ?auto_25935 ?auto_25936 ?auto_25937 ?auto_25938 ?auto_25939 ?auto_25940 ?auto_25941 ?auto_25942 ?auto_25943 ) )
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
      ?auto_26016 - SURFACE
      ?auto_26017 - SURFACE
      ?auto_26018 - SURFACE
      ?auto_26019 - SURFACE
      ?auto_26020 - SURFACE
      ?auto_26021 - SURFACE
      ?auto_26023 - SURFACE
      ?auto_26022 - SURFACE
    )
    :vars
    (
      ?auto_26026 - HOIST
      ?auto_26025 - PLACE
      ?auto_26029 - PLACE
      ?auto_26027 - HOIST
      ?auto_26028 - SURFACE
      ?auto_26033 - PLACE
      ?auto_26050 - HOIST
      ?auto_26061 - SURFACE
      ?auto_26065 - PLACE
      ?auto_26066 - HOIST
      ?auto_26043 - SURFACE
      ?auto_26054 - PLACE
      ?auto_26036 - HOIST
      ?auto_26044 - SURFACE
      ?auto_26053 - SURFACE
      ?auto_26051 - PLACE
      ?auto_26055 - HOIST
      ?auto_26057 - SURFACE
      ?auto_26056 - PLACE
      ?auto_26034 - HOIST
      ?auto_26059 - SURFACE
      ?auto_26031 - PLACE
      ?auto_26032 - HOIST
      ?auto_26039 - SURFACE
      ?auto_26047 - PLACE
      ?auto_26030 - HOIST
      ?auto_26064 - SURFACE
      ?auto_26041 - PLACE
      ?auto_26049 - HOIST
      ?auto_26045 - SURFACE
      ?auto_26038 - PLACE
      ?auto_26060 - HOIST
      ?auto_26046 - SURFACE
      ?auto_26035 - PLACE
      ?auto_26063 - HOIST
      ?auto_26052 - SURFACE
      ?auto_26037 - PLACE
      ?auto_26040 - HOIST
      ?auto_26062 - SURFACE
      ?auto_26048 - PLACE
      ?auto_26042 - HOIST
      ?auto_26058 - SURFACE
      ?auto_26024 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26026 ?auto_26025 ) ( IS-CRATE ?auto_26022 ) ( not ( = ?auto_26029 ?auto_26025 ) ) ( HOIST-AT ?auto_26027 ?auto_26029 ) ( AVAILABLE ?auto_26027 ) ( SURFACE-AT ?auto_26022 ?auto_26029 ) ( ON ?auto_26022 ?auto_26028 ) ( CLEAR ?auto_26022 ) ( not ( = ?auto_26023 ?auto_26022 ) ) ( not ( = ?auto_26023 ?auto_26028 ) ) ( not ( = ?auto_26022 ?auto_26028 ) ) ( not ( = ?auto_26026 ?auto_26027 ) ) ( IS-CRATE ?auto_26023 ) ( not ( = ?auto_26033 ?auto_26025 ) ) ( HOIST-AT ?auto_26050 ?auto_26033 ) ( AVAILABLE ?auto_26050 ) ( SURFACE-AT ?auto_26023 ?auto_26033 ) ( ON ?auto_26023 ?auto_26061 ) ( CLEAR ?auto_26023 ) ( not ( = ?auto_26021 ?auto_26023 ) ) ( not ( = ?auto_26021 ?auto_26061 ) ) ( not ( = ?auto_26023 ?auto_26061 ) ) ( not ( = ?auto_26026 ?auto_26050 ) ) ( IS-CRATE ?auto_26021 ) ( not ( = ?auto_26065 ?auto_26025 ) ) ( HOIST-AT ?auto_26066 ?auto_26065 ) ( AVAILABLE ?auto_26066 ) ( SURFACE-AT ?auto_26021 ?auto_26065 ) ( ON ?auto_26021 ?auto_26043 ) ( CLEAR ?auto_26021 ) ( not ( = ?auto_26020 ?auto_26021 ) ) ( not ( = ?auto_26020 ?auto_26043 ) ) ( not ( = ?auto_26021 ?auto_26043 ) ) ( not ( = ?auto_26026 ?auto_26066 ) ) ( IS-CRATE ?auto_26020 ) ( not ( = ?auto_26054 ?auto_26025 ) ) ( HOIST-AT ?auto_26036 ?auto_26054 ) ( SURFACE-AT ?auto_26020 ?auto_26054 ) ( ON ?auto_26020 ?auto_26044 ) ( CLEAR ?auto_26020 ) ( not ( = ?auto_26019 ?auto_26020 ) ) ( not ( = ?auto_26019 ?auto_26044 ) ) ( not ( = ?auto_26020 ?auto_26044 ) ) ( not ( = ?auto_26026 ?auto_26036 ) ) ( IS-CRATE ?auto_26019 ) ( AVAILABLE ?auto_26036 ) ( SURFACE-AT ?auto_26019 ?auto_26054 ) ( ON ?auto_26019 ?auto_26053 ) ( CLEAR ?auto_26019 ) ( not ( = ?auto_26018 ?auto_26019 ) ) ( not ( = ?auto_26018 ?auto_26053 ) ) ( not ( = ?auto_26019 ?auto_26053 ) ) ( IS-CRATE ?auto_26018 ) ( not ( = ?auto_26051 ?auto_26025 ) ) ( HOIST-AT ?auto_26055 ?auto_26051 ) ( AVAILABLE ?auto_26055 ) ( SURFACE-AT ?auto_26018 ?auto_26051 ) ( ON ?auto_26018 ?auto_26057 ) ( CLEAR ?auto_26018 ) ( not ( = ?auto_26017 ?auto_26018 ) ) ( not ( = ?auto_26017 ?auto_26057 ) ) ( not ( = ?auto_26018 ?auto_26057 ) ) ( not ( = ?auto_26026 ?auto_26055 ) ) ( IS-CRATE ?auto_26017 ) ( not ( = ?auto_26056 ?auto_26025 ) ) ( HOIST-AT ?auto_26034 ?auto_26056 ) ( AVAILABLE ?auto_26034 ) ( SURFACE-AT ?auto_26017 ?auto_26056 ) ( ON ?auto_26017 ?auto_26059 ) ( CLEAR ?auto_26017 ) ( not ( = ?auto_26016 ?auto_26017 ) ) ( not ( = ?auto_26016 ?auto_26059 ) ) ( not ( = ?auto_26017 ?auto_26059 ) ) ( not ( = ?auto_26026 ?auto_26034 ) ) ( IS-CRATE ?auto_26016 ) ( not ( = ?auto_26031 ?auto_26025 ) ) ( HOIST-AT ?auto_26032 ?auto_26031 ) ( AVAILABLE ?auto_26032 ) ( SURFACE-AT ?auto_26016 ?auto_26031 ) ( ON ?auto_26016 ?auto_26039 ) ( CLEAR ?auto_26016 ) ( not ( = ?auto_26015 ?auto_26016 ) ) ( not ( = ?auto_26015 ?auto_26039 ) ) ( not ( = ?auto_26016 ?auto_26039 ) ) ( not ( = ?auto_26026 ?auto_26032 ) ) ( IS-CRATE ?auto_26015 ) ( not ( = ?auto_26047 ?auto_26025 ) ) ( HOIST-AT ?auto_26030 ?auto_26047 ) ( AVAILABLE ?auto_26030 ) ( SURFACE-AT ?auto_26015 ?auto_26047 ) ( ON ?auto_26015 ?auto_26064 ) ( CLEAR ?auto_26015 ) ( not ( = ?auto_26014 ?auto_26015 ) ) ( not ( = ?auto_26014 ?auto_26064 ) ) ( not ( = ?auto_26015 ?auto_26064 ) ) ( not ( = ?auto_26026 ?auto_26030 ) ) ( IS-CRATE ?auto_26014 ) ( not ( = ?auto_26041 ?auto_26025 ) ) ( HOIST-AT ?auto_26049 ?auto_26041 ) ( AVAILABLE ?auto_26049 ) ( SURFACE-AT ?auto_26014 ?auto_26041 ) ( ON ?auto_26014 ?auto_26045 ) ( CLEAR ?auto_26014 ) ( not ( = ?auto_26013 ?auto_26014 ) ) ( not ( = ?auto_26013 ?auto_26045 ) ) ( not ( = ?auto_26014 ?auto_26045 ) ) ( not ( = ?auto_26026 ?auto_26049 ) ) ( IS-CRATE ?auto_26013 ) ( not ( = ?auto_26038 ?auto_26025 ) ) ( HOIST-AT ?auto_26060 ?auto_26038 ) ( AVAILABLE ?auto_26060 ) ( SURFACE-AT ?auto_26013 ?auto_26038 ) ( ON ?auto_26013 ?auto_26046 ) ( CLEAR ?auto_26013 ) ( not ( = ?auto_26012 ?auto_26013 ) ) ( not ( = ?auto_26012 ?auto_26046 ) ) ( not ( = ?auto_26013 ?auto_26046 ) ) ( not ( = ?auto_26026 ?auto_26060 ) ) ( IS-CRATE ?auto_26012 ) ( not ( = ?auto_26035 ?auto_26025 ) ) ( HOIST-AT ?auto_26063 ?auto_26035 ) ( AVAILABLE ?auto_26063 ) ( SURFACE-AT ?auto_26012 ?auto_26035 ) ( ON ?auto_26012 ?auto_26052 ) ( CLEAR ?auto_26012 ) ( not ( = ?auto_26011 ?auto_26012 ) ) ( not ( = ?auto_26011 ?auto_26052 ) ) ( not ( = ?auto_26012 ?auto_26052 ) ) ( not ( = ?auto_26026 ?auto_26063 ) ) ( IS-CRATE ?auto_26011 ) ( not ( = ?auto_26037 ?auto_26025 ) ) ( HOIST-AT ?auto_26040 ?auto_26037 ) ( AVAILABLE ?auto_26040 ) ( SURFACE-AT ?auto_26011 ?auto_26037 ) ( ON ?auto_26011 ?auto_26062 ) ( CLEAR ?auto_26011 ) ( not ( = ?auto_26010 ?auto_26011 ) ) ( not ( = ?auto_26010 ?auto_26062 ) ) ( not ( = ?auto_26011 ?auto_26062 ) ) ( not ( = ?auto_26026 ?auto_26040 ) ) ( SURFACE-AT ?auto_26009 ?auto_26025 ) ( CLEAR ?auto_26009 ) ( IS-CRATE ?auto_26010 ) ( AVAILABLE ?auto_26026 ) ( not ( = ?auto_26048 ?auto_26025 ) ) ( HOIST-AT ?auto_26042 ?auto_26048 ) ( AVAILABLE ?auto_26042 ) ( SURFACE-AT ?auto_26010 ?auto_26048 ) ( ON ?auto_26010 ?auto_26058 ) ( CLEAR ?auto_26010 ) ( TRUCK-AT ?auto_26024 ?auto_26025 ) ( not ( = ?auto_26009 ?auto_26010 ) ) ( not ( = ?auto_26009 ?auto_26058 ) ) ( not ( = ?auto_26010 ?auto_26058 ) ) ( not ( = ?auto_26026 ?auto_26042 ) ) ( not ( = ?auto_26009 ?auto_26011 ) ) ( not ( = ?auto_26009 ?auto_26062 ) ) ( not ( = ?auto_26011 ?auto_26058 ) ) ( not ( = ?auto_26037 ?auto_26048 ) ) ( not ( = ?auto_26040 ?auto_26042 ) ) ( not ( = ?auto_26062 ?auto_26058 ) ) ( not ( = ?auto_26009 ?auto_26012 ) ) ( not ( = ?auto_26009 ?auto_26052 ) ) ( not ( = ?auto_26010 ?auto_26012 ) ) ( not ( = ?auto_26010 ?auto_26052 ) ) ( not ( = ?auto_26012 ?auto_26062 ) ) ( not ( = ?auto_26012 ?auto_26058 ) ) ( not ( = ?auto_26035 ?auto_26037 ) ) ( not ( = ?auto_26035 ?auto_26048 ) ) ( not ( = ?auto_26063 ?auto_26040 ) ) ( not ( = ?auto_26063 ?auto_26042 ) ) ( not ( = ?auto_26052 ?auto_26062 ) ) ( not ( = ?auto_26052 ?auto_26058 ) ) ( not ( = ?auto_26009 ?auto_26013 ) ) ( not ( = ?auto_26009 ?auto_26046 ) ) ( not ( = ?auto_26010 ?auto_26013 ) ) ( not ( = ?auto_26010 ?auto_26046 ) ) ( not ( = ?auto_26011 ?auto_26013 ) ) ( not ( = ?auto_26011 ?auto_26046 ) ) ( not ( = ?auto_26013 ?auto_26052 ) ) ( not ( = ?auto_26013 ?auto_26062 ) ) ( not ( = ?auto_26013 ?auto_26058 ) ) ( not ( = ?auto_26038 ?auto_26035 ) ) ( not ( = ?auto_26038 ?auto_26037 ) ) ( not ( = ?auto_26038 ?auto_26048 ) ) ( not ( = ?auto_26060 ?auto_26063 ) ) ( not ( = ?auto_26060 ?auto_26040 ) ) ( not ( = ?auto_26060 ?auto_26042 ) ) ( not ( = ?auto_26046 ?auto_26052 ) ) ( not ( = ?auto_26046 ?auto_26062 ) ) ( not ( = ?auto_26046 ?auto_26058 ) ) ( not ( = ?auto_26009 ?auto_26014 ) ) ( not ( = ?auto_26009 ?auto_26045 ) ) ( not ( = ?auto_26010 ?auto_26014 ) ) ( not ( = ?auto_26010 ?auto_26045 ) ) ( not ( = ?auto_26011 ?auto_26014 ) ) ( not ( = ?auto_26011 ?auto_26045 ) ) ( not ( = ?auto_26012 ?auto_26014 ) ) ( not ( = ?auto_26012 ?auto_26045 ) ) ( not ( = ?auto_26014 ?auto_26046 ) ) ( not ( = ?auto_26014 ?auto_26052 ) ) ( not ( = ?auto_26014 ?auto_26062 ) ) ( not ( = ?auto_26014 ?auto_26058 ) ) ( not ( = ?auto_26041 ?auto_26038 ) ) ( not ( = ?auto_26041 ?auto_26035 ) ) ( not ( = ?auto_26041 ?auto_26037 ) ) ( not ( = ?auto_26041 ?auto_26048 ) ) ( not ( = ?auto_26049 ?auto_26060 ) ) ( not ( = ?auto_26049 ?auto_26063 ) ) ( not ( = ?auto_26049 ?auto_26040 ) ) ( not ( = ?auto_26049 ?auto_26042 ) ) ( not ( = ?auto_26045 ?auto_26046 ) ) ( not ( = ?auto_26045 ?auto_26052 ) ) ( not ( = ?auto_26045 ?auto_26062 ) ) ( not ( = ?auto_26045 ?auto_26058 ) ) ( not ( = ?auto_26009 ?auto_26015 ) ) ( not ( = ?auto_26009 ?auto_26064 ) ) ( not ( = ?auto_26010 ?auto_26015 ) ) ( not ( = ?auto_26010 ?auto_26064 ) ) ( not ( = ?auto_26011 ?auto_26015 ) ) ( not ( = ?auto_26011 ?auto_26064 ) ) ( not ( = ?auto_26012 ?auto_26015 ) ) ( not ( = ?auto_26012 ?auto_26064 ) ) ( not ( = ?auto_26013 ?auto_26015 ) ) ( not ( = ?auto_26013 ?auto_26064 ) ) ( not ( = ?auto_26015 ?auto_26045 ) ) ( not ( = ?auto_26015 ?auto_26046 ) ) ( not ( = ?auto_26015 ?auto_26052 ) ) ( not ( = ?auto_26015 ?auto_26062 ) ) ( not ( = ?auto_26015 ?auto_26058 ) ) ( not ( = ?auto_26047 ?auto_26041 ) ) ( not ( = ?auto_26047 ?auto_26038 ) ) ( not ( = ?auto_26047 ?auto_26035 ) ) ( not ( = ?auto_26047 ?auto_26037 ) ) ( not ( = ?auto_26047 ?auto_26048 ) ) ( not ( = ?auto_26030 ?auto_26049 ) ) ( not ( = ?auto_26030 ?auto_26060 ) ) ( not ( = ?auto_26030 ?auto_26063 ) ) ( not ( = ?auto_26030 ?auto_26040 ) ) ( not ( = ?auto_26030 ?auto_26042 ) ) ( not ( = ?auto_26064 ?auto_26045 ) ) ( not ( = ?auto_26064 ?auto_26046 ) ) ( not ( = ?auto_26064 ?auto_26052 ) ) ( not ( = ?auto_26064 ?auto_26062 ) ) ( not ( = ?auto_26064 ?auto_26058 ) ) ( not ( = ?auto_26009 ?auto_26016 ) ) ( not ( = ?auto_26009 ?auto_26039 ) ) ( not ( = ?auto_26010 ?auto_26016 ) ) ( not ( = ?auto_26010 ?auto_26039 ) ) ( not ( = ?auto_26011 ?auto_26016 ) ) ( not ( = ?auto_26011 ?auto_26039 ) ) ( not ( = ?auto_26012 ?auto_26016 ) ) ( not ( = ?auto_26012 ?auto_26039 ) ) ( not ( = ?auto_26013 ?auto_26016 ) ) ( not ( = ?auto_26013 ?auto_26039 ) ) ( not ( = ?auto_26014 ?auto_26016 ) ) ( not ( = ?auto_26014 ?auto_26039 ) ) ( not ( = ?auto_26016 ?auto_26064 ) ) ( not ( = ?auto_26016 ?auto_26045 ) ) ( not ( = ?auto_26016 ?auto_26046 ) ) ( not ( = ?auto_26016 ?auto_26052 ) ) ( not ( = ?auto_26016 ?auto_26062 ) ) ( not ( = ?auto_26016 ?auto_26058 ) ) ( not ( = ?auto_26031 ?auto_26047 ) ) ( not ( = ?auto_26031 ?auto_26041 ) ) ( not ( = ?auto_26031 ?auto_26038 ) ) ( not ( = ?auto_26031 ?auto_26035 ) ) ( not ( = ?auto_26031 ?auto_26037 ) ) ( not ( = ?auto_26031 ?auto_26048 ) ) ( not ( = ?auto_26032 ?auto_26030 ) ) ( not ( = ?auto_26032 ?auto_26049 ) ) ( not ( = ?auto_26032 ?auto_26060 ) ) ( not ( = ?auto_26032 ?auto_26063 ) ) ( not ( = ?auto_26032 ?auto_26040 ) ) ( not ( = ?auto_26032 ?auto_26042 ) ) ( not ( = ?auto_26039 ?auto_26064 ) ) ( not ( = ?auto_26039 ?auto_26045 ) ) ( not ( = ?auto_26039 ?auto_26046 ) ) ( not ( = ?auto_26039 ?auto_26052 ) ) ( not ( = ?auto_26039 ?auto_26062 ) ) ( not ( = ?auto_26039 ?auto_26058 ) ) ( not ( = ?auto_26009 ?auto_26017 ) ) ( not ( = ?auto_26009 ?auto_26059 ) ) ( not ( = ?auto_26010 ?auto_26017 ) ) ( not ( = ?auto_26010 ?auto_26059 ) ) ( not ( = ?auto_26011 ?auto_26017 ) ) ( not ( = ?auto_26011 ?auto_26059 ) ) ( not ( = ?auto_26012 ?auto_26017 ) ) ( not ( = ?auto_26012 ?auto_26059 ) ) ( not ( = ?auto_26013 ?auto_26017 ) ) ( not ( = ?auto_26013 ?auto_26059 ) ) ( not ( = ?auto_26014 ?auto_26017 ) ) ( not ( = ?auto_26014 ?auto_26059 ) ) ( not ( = ?auto_26015 ?auto_26017 ) ) ( not ( = ?auto_26015 ?auto_26059 ) ) ( not ( = ?auto_26017 ?auto_26039 ) ) ( not ( = ?auto_26017 ?auto_26064 ) ) ( not ( = ?auto_26017 ?auto_26045 ) ) ( not ( = ?auto_26017 ?auto_26046 ) ) ( not ( = ?auto_26017 ?auto_26052 ) ) ( not ( = ?auto_26017 ?auto_26062 ) ) ( not ( = ?auto_26017 ?auto_26058 ) ) ( not ( = ?auto_26056 ?auto_26031 ) ) ( not ( = ?auto_26056 ?auto_26047 ) ) ( not ( = ?auto_26056 ?auto_26041 ) ) ( not ( = ?auto_26056 ?auto_26038 ) ) ( not ( = ?auto_26056 ?auto_26035 ) ) ( not ( = ?auto_26056 ?auto_26037 ) ) ( not ( = ?auto_26056 ?auto_26048 ) ) ( not ( = ?auto_26034 ?auto_26032 ) ) ( not ( = ?auto_26034 ?auto_26030 ) ) ( not ( = ?auto_26034 ?auto_26049 ) ) ( not ( = ?auto_26034 ?auto_26060 ) ) ( not ( = ?auto_26034 ?auto_26063 ) ) ( not ( = ?auto_26034 ?auto_26040 ) ) ( not ( = ?auto_26034 ?auto_26042 ) ) ( not ( = ?auto_26059 ?auto_26039 ) ) ( not ( = ?auto_26059 ?auto_26064 ) ) ( not ( = ?auto_26059 ?auto_26045 ) ) ( not ( = ?auto_26059 ?auto_26046 ) ) ( not ( = ?auto_26059 ?auto_26052 ) ) ( not ( = ?auto_26059 ?auto_26062 ) ) ( not ( = ?auto_26059 ?auto_26058 ) ) ( not ( = ?auto_26009 ?auto_26018 ) ) ( not ( = ?auto_26009 ?auto_26057 ) ) ( not ( = ?auto_26010 ?auto_26018 ) ) ( not ( = ?auto_26010 ?auto_26057 ) ) ( not ( = ?auto_26011 ?auto_26018 ) ) ( not ( = ?auto_26011 ?auto_26057 ) ) ( not ( = ?auto_26012 ?auto_26018 ) ) ( not ( = ?auto_26012 ?auto_26057 ) ) ( not ( = ?auto_26013 ?auto_26018 ) ) ( not ( = ?auto_26013 ?auto_26057 ) ) ( not ( = ?auto_26014 ?auto_26018 ) ) ( not ( = ?auto_26014 ?auto_26057 ) ) ( not ( = ?auto_26015 ?auto_26018 ) ) ( not ( = ?auto_26015 ?auto_26057 ) ) ( not ( = ?auto_26016 ?auto_26018 ) ) ( not ( = ?auto_26016 ?auto_26057 ) ) ( not ( = ?auto_26018 ?auto_26059 ) ) ( not ( = ?auto_26018 ?auto_26039 ) ) ( not ( = ?auto_26018 ?auto_26064 ) ) ( not ( = ?auto_26018 ?auto_26045 ) ) ( not ( = ?auto_26018 ?auto_26046 ) ) ( not ( = ?auto_26018 ?auto_26052 ) ) ( not ( = ?auto_26018 ?auto_26062 ) ) ( not ( = ?auto_26018 ?auto_26058 ) ) ( not ( = ?auto_26051 ?auto_26056 ) ) ( not ( = ?auto_26051 ?auto_26031 ) ) ( not ( = ?auto_26051 ?auto_26047 ) ) ( not ( = ?auto_26051 ?auto_26041 ) ) ( not ( = ?auto_26051 ?auto_26038 ) ) ( not ( = ?auto_26051 ?auto_26035 ) ) ( not ( = ?auto_26051 ?auto_26037 ) ) ( not ( = ?auto_26051 ?auto_26048 ) ) ( not ( = ?auto_26055 ?auto_26034 ) ) ( not ( = ?auto_26055 ?auto_26032 ) ) ( not ( = ?auto_26055 ?auto_26030 ) ) ( not ( = ?auto_26055 ?auto_26049 ) ) ( not ( = ?auto_26055 ?auto_26060 ) ) ( not ( = ?auto_26055 ?auto_26063 ) ) ( not ( = ?auto_26055 ?auto_26040 ) ) ( not ( = ?auto_26055 ?auto_26042 ) ) ( not ( = ?auto_26057 ?auto_26059 ) ) ( not ( = ?auto_26057 ?auto_26039 ) ) ( not ( = ?auto_26057 ?auto_26064 ) ) ( not ( = ?auto_26057 ?auto_26045 ) ) ( not ( = ?auto_26057 ?auto_26046 ) ) ( not ( = ?auto_26057 ?auto_26052 ) ) ( not ( = ?auto_26057 ?auto_26062 ) ) ( not ( = ?auto_26057 ?auto_26058 ) ) ( not ( = ?auto_26009 ?auto_26019 ) ) ( not ( = ?auto_26009 ?auto_26053 ) ) ( not ( = ?auto_26010 ?auto_26019 ) ) ( not ( = ?auto_26010 ?auto_26053 ) ) ( not ( = ?auto_26011 ?auto_26019 ) ) ( not ( = ?auto_26011 ?auto_26053 ) ) ( not ( = ?auto_26012 ?auto_26019 ) ) ( not ( = ?auto_26012 ?auto_26053 ) ) ( not ( = ?auto_26013 ?auto_26019 ) ) ( not ( = ?auto_26013 ?auto_26053 ) ) ( not ( = ?auto_26014 ?auto_26019 ) ) ( not ( = ?auto_26014 ?auto_26053 ) ) ( not ( = ?auto_26015 ?auto_26019 ) ) ( not ( = ?auto_26015 ?auto_26053 ) ) ( not ( = ?auto_26016 ?auto_26019 ) ) ( not ( = ?auto_26016 ?auto_26053 ) ) ( not ( = ?auto_26017 ?auto_26019 ) ) ( not ( = ?auto_26017 ?auto_26053 ) ) ( not ( = ?auto_26019 ?auto_26057 ) ) ( not ( = ?auto_26019 ?auto_26059 ) ) ( not ( = ?auto_26019 ?auto_26039 ) ) ( not ( = ?auto_26019 ?auto_26064 ) ) ( not ( = ?auto_26019 ?auto_26045 ) ) ( not ( = ?auto_26019 ?auto_26046 ) ) ( not ( = ?auto_26019 ?auto_26052 ) ) ( not ( = ?auto_26019 ?auto_26062 ) ) ( not ( = ?auto_26019 ?auto_26058 ) ) ( not ( = ?auto_26054 ?auto_26051 ) ) ( not ( = ?auto_26054 ?auto_26056 ) ) ( not ( = ?auto_26054 ?auto_26031 ) ) ( not ( = ?auto_26054 ?auto_26047 ) ) ( not ( = ?auto_26054 ?auto_26041 ) ) ( not ( = ?auto_26054 ?auto_26038 ) ) ( not ( = ?auto_26054 ?auto_26035 ) ) ( not ( = ?auto_26054 ?auto_26037 ) ) ( not ( = ?auto_26054 ?auto_26048 ) ) ( not ( = ?auto_26036 ?auto_26055 ) ) ( not ( = ?auto_26036 ?auto_26034 ) ) ( not ( = ?auto_26036 ?auto_26032 ) ) ( not ( = ?auto_26036 ?auto_26030 ) ) ( not ( = ?auto_26036 ?auto_26049 ) ) ( not ( = ?auto_26036 ?auto_26060 ) ) ( not ( = ?auto_26036 ?auto_26063 ) ) ( not ( = ?auto_26036 ?auto_26040 ) ) ( not ( = ?auto_26036 ?auto_26042 ) ) ( not ( = ?auto_26053 ?auto_26057 ) ) ( not ( = ?auto_26053 ?auto_26059 ) ) ( not ( = ?auto_26053 ?auto_26039 ) ) ( not ( = ?auto_26053 ?auto_26064 ) ) ( not ( = ?auto_26053 ?auto_26045 ) ) ( not ( = ?auto_26053 ?auto_26046 ) ) ( not ( = ?auto_26053 ?auto_26052 ) ) ( not ( = ?auto_26053 ?auto_26062 ) ) ( not ( = ?auto_26053 ?auto_26058 ) ) ( not ( = ?auto_26009 ?auto_26020 ) ) ( not ( = ?auto_26009 ?auto_26044 ) ) ( not ( = ?auto_26010 ?auto_26020 ) ) ( not ( = ?auto_26010 ?auto_26044 ) ) ( not ( = ?auto_26011 ?auto_26020 ) ) ( not ( = ?auto_26011 ?auto_26044 ) ) ( not ( = ?auto_26012 ?auto_26020 ) ) ( not ( = ?auto_26012 ?auto_26044 ) ) ( not ( = ?auto_26013 ?auto_26020 ) ) ( not ( = ?auto_26013 ?auto_26044 ) ) ( not ( = ?auto_26014 ?auto_26020 ) ) ( not ( = ?auto_26014 ?auto_26044 ) ) ( not ( = ?auto_26015 ?auto_26020 ) ) ( not ( = ?auto_26015 ?auto_26044 ) ) ( not ( = ?auto_26016 ?auto_26020 ) ) ( not ( = ?auto_26016 ?auto_26044 ) ) ( not ( = ?auto_26017 ?auto_26020 ) ) ( not ( = ?auto_26017 ?auto_26044 ) ) ( not ( = ?auto_26018 ?auto_26020 ) ) ( not ( = ?auto_26018 ?auto_26044 ) ) ( not ( = ?auto_26020 ?auto_26053 ) ) ( not ( = ?auto_26020 ?auto_26057 ) ) ( not ( = ?auto_26020 ?auto_26059 ) ) ( not ( = ?auto_26020 ?auto_26039 ) ) ( not ( = ?auto_26020 ?auto_26064 ) ) ( not ( = ?auto_26020 ?auto_26045 ) ) ( not ( = ?auto_26020 ?auto_26046 ) ) ( not ( = ?auto_26020 ?auto_26052 ) ) ( not ( = ?auto_26020 ?auto_26062 ) ) ( not ( = ?auto_26020 ?auto_26058 ) ) ( not ( = ?auto_26044 ?auto_26053 ) ) ( not ( = ?auto_26044 ?auto_26057 ) ) ( not ( = ?auto_26044 ?auto_26059 ) ) ( not ( = ?auto_26044 ?auto_26039 ) ) ( not ( = ?auto_26044 ?auto_26064 ) ) ( not ( = ?auto_26044 ?auto_26045 ) ) ( not ( = ?auto_26044 ?auto_26046 ) ) ( not ( = ?auto_26044 ?auto_26052 ) ) ( not ( = ?auto_26044 ?auto_26062 ) ) ( not ( = ?auto_26044 ?auto_26058 ) ) ( not ( = ?auto_26009 ?auto_26021 ) ) ( not ( = ?auto_26009 ?auto_26043 ) ) ( not ( = ?auto_26010 ?auto_26021 ) ) ( not ( = ?auto_26010 ?auto_26043 ) ) ( not ( = ?auto_26011 ?auto_26021 ) ) ( not ( = ?auto_26011 ?auto_26043 ) ) ( not ( = ?auto_26012 ?auto_26021 ) ) ( not ( = ?auto_26012 ?auto_26043 ) ) ( not ( = ?auto_26013 ?auto_26021 ) ) ( not ( = ?auto_26013 ?auto_26043 ) ) ( not ( = ?auto_26014 ?auto_26021 ) ) ( not ( = ?auto_26014 ?auto_26043 ) ) ( not ( = ?auto_26015 ?auto_26021 ) ) ( not ( = ?auto_26015 ?auto_26043 ) ) ( not ( = ?auto_26016 ?auto_26021 ) ) ( not ( = ?auto_26016 ?auto_26043 ) ) ( not ( = ?auto_26017 ?auto_26021 ) ) ( not ( = ?auto_26017 ?auto_26043 ) ) ( not ( = ?auto_26018 ?auto_26021 ) ) ( not ( = ?auto_26018 ?auto_26043 ) ) ( not ( = ?auto_26019 ?auto_26021 ) ) ( not ( = ?auto_26019 ?auto_26043 ) ) ( not ( = ?auto_26021 ?auto_26044 ) ) ( not ( = ?auto_26021 ?auto_26053 ) ) ( not ( = ?auto_26021 ?auto_26057 ) ) ( not ( = ?auto_26021 ?auto_26059 ) ) ( not ( = ?auto_26021 ?auto_26039 ) ) ( not ( = ?auto_26021 ?auto_26064 ) ) ( not ( = ?auto_26021 ?auto_26045 ) ) ( not ( = ?auto_26021 ?auto_26046 ) ) ( not ( = ?auto_26021 ?auto_26052 ) ) ( not ( = ?auto_26021 ?auto_26062 ) ) ( not ( = ?auto_26021 ?auto_26058 ) ) ( not ( = ?auto_26065 ?auto_26054 ) ) ( not ( = ?auto_26065 ?auto_26051 ) ) ( not ( = ?auto_26065 ?auto_26056 ) ) ( not ( = ?auto_26065 ?auto_26031 ) ) ( not ( = ?auto_26065 ?auto_26047 ) ) ( not ( = ?auto_26065 ?auto_26041 ) ) ( not ( = ?auto_26065 ?auto_26038 ) ) ( not ( = ?auto_26065 ?auto_26035 ) ) ( not ( = ?auto_26065 ?auto_26037 ) ) ( not ( = ?auto_26065 ?auto_26048 ) ) ( not ( = ?auto_26066 ?auto_26036 ) ) ( not ( = ?auto_26066 ?auto_26055 ) ) ( not ( = ?auto_26066 ?auto_26034 ) ) ( not ( = ?auto_26066 ?auto_26032 ) ) ( not ( = ?auto_26066 ?auto_26030 ) ) ( not ( = ?auto_26066 ?auto_26049 ) ) ( not ( = ?auto_26066 ?auto_26060 ) ) ( not ( = ?auto_26066 ?auto_26063 ) ) ( not ( = ?auto_26066 ?auto_26040 ) ) ( not ( = ?auto_26066 ?auto_26042 ) ) ( not ( = ?auto_26043 ?auto_26044 ) ) ( not ( = ?auto_26043 ?auto_26053 ) ) ( not ( = ?auto_26043 ?auto_26057 ) ) ( not ( = ?auto_26043 ?auto_26059 ) ) ( not ( = ?auto_26043 ?auto_26039 ) ) ( not ( = ?auto_26043 ?auto_26064 ) ) ( not ( = ?auto_26043 ?auto_26045 ) ) ( not ( = ?auto_26043 ?auto_26046 ) ) ( not ( = ?auto_26043 ?auto_26052 ) ) ( not ( = ?auto_26043 ?auto_26062 ) ) ( not ( = ?auto_26043 ?auto_26058 ) ) ( not ( = ?auto_26009 ?auto_26023 ) ) ( not ( = ?auto_26009 ?auto_26061 ) ) ( not ( = ?auto_26010 ?auto_26023 ) ) ( not ( = ?auto_26010 ?auto_26061 ) ) ( not ( = ?auto_26011 ?auto_26023 ) ) ( not ( = ?auto_26011 ?auto_26061 ) ) ( not ( = ?auto_26012 ?auto_26023 ) ) ( not ( = ?auto_26012 ?auto_26061 ) ) ( not ( = ?auto_26013 ?auto_26023 ) ) ( not ( = ?auto_26013 ?auto_26061 ) ) ( not ( = ?auto_26014 ?auto_26023 ) ) ( not ( = ?auto_26014 ?auto_26061 ) ) ( not ( = ?auto_26015 ?auto_26023 ) ) ( not ( = ?auto_26015 ?auto_26061 ) ) ( not ( = ?auto_26016 ?auto_26023 ) ) ( not ( = ?auto_26016 ?auto_26061 ) ) ( not ( = ?auto_26017 ?auto_26023 ) ) ( not ( = ?auto_26017 ?auto_26061 ) ) ( not ( = ?auto_26018 ?auto_26023 ) ) ( not ( = ?auto_26018 ?auto_26061 ) ) ( not ( = ?auto_26019 ?auto_26023 ) ) ( not ( = ?auto_26019 ?auto_26061 ) ) ( not ( = ?auto_26020 ?auto_26023 ) ) ( not ( = ?auto_26020 ?auto_26061 ) ) ( not ( = ?auto_26023 ?auto_26043 ) ) ( not ( = ?auto_26023 ?auto_26044 ) ) ( not ( = ?auto_26023 ?auto_26053 ) ) ( not ( = ?auto_26023 ?auto_26057 ) ) ( not ( = ?auto_26023 ?auto_26059 ) ) ( not ( = ?auto_26023 ?auto_26039 ) ) ( not ( = ?auto_26023 ?auto_26064 ) ) ( not ( = ?auto_26023 ?auto_26045 ) ) ( not ( = ?auto_26023 ?auto_26046 ) ) ( not ( = ?auto_26023 ?auto_26052 ) ) ( not ( = ?auto_26023 ?auto_26062 ) ) ( not ( = ?auto_26023 ?auto_26058 ) ) ( not ( = ?auto_26033 ?auto_26065 ) ) ( not ( = ?auto_26033 ?auto_26054 ) ) ( not ( = ?auto_26033 ?auto_26051 ) ) ( not ( = ?auto_26033 ?auto_26056 ) ) ( not ( = ?auto_26033 ?auto_26031 ) ) ( not ( = ?auto_26033 ?auto_26047 ) ) ( not ( = ?auto_26033 ?auto_26041 ) ) ( not ( = ?auto_26033 ?auto_26038 ) ) ( not ( = ?auto_26033 ?auto_26035 ) ) ( not ( = ?auto_26033 ?auto_26037 ) ) ( not ( = ?auto_26033 ?auto_26048 ) ) ( not ( = ?auto_26050 ?auto_26066 ) ) ( not ( = ?auto_26050 ?auto_26036 ) ) ( not ( = ?auto_26050 ?auto_26055 ) ) ( not ( = ?auto_26050 ?auto_26034 ) ) ( not ( = ?auto_26050 ?auto_26032 ) ) ( not ( = ?auto_26050 ?auto_26030 ) ) ( not ( = ?auto_26050 ?auto_26049 ) ) ( not ( = ?auto_26050 ?auto_26060 ) ) ( not ( = ?auto_26050 ?auto_26063 ) ) ( not ( = ?auto_26050 ?auto_26040 ) ) ( not ( = ?auto_26050 ?auto_26042 ) ) ( not ( = ?auto_26061 ?auto_26043 ) ) ( not ( = ?auto_26061 ?auto_26044 ) ) ( not ( = ?auto_26061 ?auto_26053 ) ) ( not ( = ?auto_26061 ?auto_26057 ) ) ( not ( = ?auto_26061 ?auto_26059 ) ) ( not ( = ?auto_26061 ?auto_26039 ) ) ( not ( = ?auto_26061 ?auto_26064 ) ) ( not ( = ?auto_26061 ?auto_26045 ) ) ( not ( = ?auto_26061 ?auto_26046 ) ) ( not ( = ?auto_26061 ?auto_26052 ) ) ( not ( = ?auto_26061 ?auto_26062 ) ) ( not ( = ?auto_26061 ?auto_26058 ) ) ( not ( = ?auto_26009 ?auto_26022 ) ) ( not ( = ?auto_26009 ?auto_26028 ) ) ( not ( = ?auto_26010 ?auto_26022 ) ) ( not ( = ?auto_26010 ?auto_26028 ) ) ( not ( = ?auto_26011 ?auto_26022 ) ) ( not ( = ?auto_26011 ?auto_26028 ) ) ( not ( = ?auto_26012 ?auto_26022 ) ) ( not ( = ?auto_26012 ?auto_26028 ) ) ( not ( = ?auto_26013 ?auto_26022 ) ) ( not ( = ?auto_26013 ?auto_26028 ) ) ( not ( = ?auto_26014 ?auto_26022 ) ) ( not ( = ?auto_26014 ?auto_26028 ) ) ( not ( = ?auto_26015 ?auto_26022 ) ) ( not ( = ?auto_26015 ?auto_26028 ) ) ( not ( = ?auto_26016 ?auto_26022 ) ) ( not ( = ?auto_26016 ?auto_26028 ) ) ( not ( = ?auto_26017 ?auto_26022 ) ) ( not ( = ?auto_26017 ?auto_26028 ) ) ( not ( = ?auto_26018 ?auto_26022 ) ) ( not ( = ?auto_26018 ?auto_26028 ) ) ( not ( = ?auto_26019 ?auto_26022 ) ) ( not ( = ?auto_26019 ?auto_26028 ) ) ( not ( = ?auto_26020 ?auto_26022 ) ) ( not ( = ?auto_26020 ?auto_26028 ) ) ( not ( = ?auto_26021 ?auto_26022 ) ) ( not ( = ?auto_26021 ?auto_26028 ) ) ( not ( = ?auto_26022 ?auto_26061 ) ) ( not ( = ?auto_26022 ?auto_26043 ) ) ( not ( = ?auto_26022 ?auto_26044 ) ) ( not ( = ?auto_26022 ?auto_26053 ) ) ( not ( = ?auto_26022 ?auto_26057 ) ) ( not ( = ?auto_26022 ?auto_26059 ) ) ( not ( = ?auto_26022 ?auto_26039 ) ) ( not ( = ?auto_26022 ?auto_26064 ) ) ( not ( = ?auto_26022 ?auto_26045 ) ) ( not ( = ?auto_26022 ?auto_26046 ) ) ( not ( = ?auto_26022 ?auto_26052 ) ) ( not ( = ?auto_26022 ?auto_26062 ) ) ( not ( = ?auto_26022 ?auto_26058 ) ) ( not ( = ?auto_26029 ?auto_26033 ) ) ( not ( = ?auto_26029 ?auto_26065 ) ) ( not ( = ?auto_26029 ?auto_26054 ) ) ( not ( = ?auto_26029 ?auto_26051 ) ) ( not ( = ?auto_26029 ?auto_26056 ) ) ( not ( = ?auto_26029 ?auto_26031 ) ) ( not ( = ?auto_26029 ?auto_26047 ) ) ( not ( = ?auto_26029 ?auto_26041 ) ) ( not ( = ?auto_26029 ?auto_26038 ) ) ( not ( = ?auto_26029 ?auto_26035 ) ) ( not ( = ?auto_26029 ?auto_26037 ) ) ( not ( = ?auto_26029 ?auto_26048 ) ) ( not ( = ?auto_26027 ?auto_26050 ) ) ( not ( = ?auto_26027 ?auto_26066 ) ) ( not ( = ?auto_26027 ?auto_26036 ) ) ( not ( = ?auto_26027 ?auto_26055 ) ) ( not ( = ?auto_26027 ?auto_26034 ) ) ( not ( = ?auto_26027 ?auto_26032 ) ) ( not ( = ?auto_26027 ?auto_26030 ) ) ( not ( = ?auto_26027 ?auto_26049 ) ) ( not ( = ?auto_26027 ?auto_26060 ) ) ( not ( = ?auto_26027 ?auto_26063 ) ) ( not ( = ?auto_26027 ?auto_26040 ) ) ( not ( = ?auto_26027 ?auto_26042 ) ) ( not ( = ?auto_26028 ?auto_26061 ) ) ( not ( = ?auto_26028 ?auto_26043 ) ) ( not ( = ?auto_26028 ?auto_26044 ) ) ( not ( = ?auto_26028 ?auto_26053 ) ) ( not ( = ?auto_26028 ?auto_26057 ) ) ( not ( = ?auto_26028 ?auto_26059 ) ) ( not ( = ?auto_26028 ?auto_26039 ) ) ( not ( = ?auto_26028 ?auto_26064 ) ) ( not ( = ?auto_26028 ?auto_26045 ) ) ( not ( = ?auto_26028 ?auto_26046 ) ) ( not ( = ?auto_26028 ?auto_26052 ) ) ( not ( = ?auto_26028 ?auto_26062 ) ) ( not ( = ?auto_26028 ?auto_26058 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_26009 ?auto_26010 ?auto_26011 ?auto_26012 ?auto_26013 ?auto_26014 ?auto_26015 ?auto_26016 ?auto_26017 ?auto_26018 ?auto_26019 ?auto_26020 ?auto_26021 ?auto_26023 )
      ( MAKE-1CRATE ?auto_26023 ?auto_26022 )
      ( MAKE-14CRATE-VERIFY ?auto_26009 ?auto_26010 ?auto_26011 ?auto_26012 ?auto_26013 ?auto_26014 ?auto_26015 ?auto_26016 ?auto_26017 ?auto_26018 ?auto_26019 ?auto_26020 ?auto_26021 ?auto_26023 ?auto_26022 ) )
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
      ?auto_26100 - SURFACE
      ?auto_26101 - SURFACE
      ?auto_26102 - SURFACE
      ?auto_26103 - SURFACE
      ?auto_26104 - SURFACE
      ?auto_26105 - SURFACE
      ?auto_26107 - SURFACE
      ?auto_26106 - SURFACE
      ?auto_26108 - SURFACE
    )
    :vars
    (
      ?auto_26111 - HOIST
      ?auto_26113 - PLACE
      ?auto_26112 - PLACE
      ?auto_26114 - HOIST
      ?auto_26109 - SURFACE
      ?auto_26129 - PLACE
      ?auto_26134 - HOIST
      ?auto_26115 - SURFACE
      ?auto_26147 - PLACE
      ?auto_26131 - HOIST
      ?auto_26126 - SURFACE
      ?auto_26139 - PLACE
      ?auto_26152 - HOIST
      ?auto_26135 - SURFACE
      ?auto_26122 - PLACE
      ?auto_26141 - HOIST
      ?auto_26120 - SURFACE
      ?auto_26125 - SURFACE
      ?auto_26121 - PLACE
      ?auto_26130 - HOIST
      ?auto_26132 - SURFACE
      ?auto_26151 - PLACE
      ?auto_26149 - HOIST
      ?auto_26124 - SURFACE
      ?auto_26148 - PLACE
      ?auto_26144 - HOIST
      ?auto_26142 - SURFACE
      ?auto_26133 - PLACE
      ?auto_26138 - HOIST
      ?auto_26128 - SURFACE
      ?auto_26117 - PLACE
      ?auto_26145 - HOIST
      ?auto_26146 - SURFACE
      ?auto_26150 - SURFACE
      ?auto_26140 - PLACE
      ?auto_26123 - HOIST
      ?auto_26137 - SURFACE
      ?auto_26127 - PLACE
      ?auto_26136 - HOIST
      ?auto_26116 - SURFACE
      ?auto_26143 - PLACE
      ?auto_26119 - HOIST
      ?auto_26118 - SURFACE
      ?auto_26110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26111 ?auto_26113 ) ( IS-CRATE ?auto_26108 ) ( not ( = ?auto_26112 ?auto_26113 ) ) ( HOIST-AT ?auto_26114 ?auto_26112 ) ( SURFACE-AT ?auto_26108 ?auto_26112 ) ( ON ?auto_26108 ?auto_26109 ) ( CLEAR ?auto_26108 ) ( not ( = ?auto_26106 ?auto_26108 ) ) ( not ( = ?auto_26106 ?auto_26109 ) ) ( not ( = ?auto_26108 ?auto_26109 ) ) ( not ( = ?auto_26111 ?auto_26114 ) ) ( IS-CRATE ?auto_26106 ) ( not ( = ?auto_26129 ?auto_26113 ) ) ( HOIST-AT ?auto_26134 ?auto_26129 ) ( AVAILABLE ?auto_26134 ) ( SURFACE-AT ?auto_26106 ?auto_26129 ) ( ON ?auto_26106 ?auto_26115 ) ( CLEAR ?auto_26106 ) ( not ( = ?auto_26107 ?auto_26106 ) ) ( not ( = ?auto_26107 ?auto_26115 ) ) ( not ( = ?auto_26106 ?auto_26115 ) ) ( not ( = ?auto_26111 ?auto_26134 ) ) ( IS-CRATE ?auto_26107 ) ( not ( = ?auto_26147 ?auto_26113 ) ) ( HOIST-AT ?auto_26131 ?auto_26147 ) ( AVAILABLE ?auto_26131 ) ( SURFACE-AT ?auto_26107 ?auto_26147 ) ( ON ?auto_26107 ?auto_26126 ) ( CLEAR ?auto_26107 ) ( not ( = ?auto_26105 ?auto_26107 ) ) ( not ( = ?auto_26105 ?auto_26126 ) ) ( not ( = ?auto_26107 ?auto_26126 ) ) ( not ( = ?auto_26111 ?auto_26131 ) ) ( IS-CRATE ?auto_26105 ) ( not ( = ?auto_26139 ?auto_26113 ) ) ( HOIST-AT ?auto_26152 ?auto_26139 ) ( AVAILABLE ?auto_26152 ) ( SURFACE-AT ?auto_26105 ?auto_26139 ) ( ON ?auto_26105 ?auto_26135 ) ( CLEAR ?auto_26105 ) ( not ( = ?auto_26104 ?auto_26105 ) ) ( not ( = ?auto_26104 ?auto_26135 ) ) ( not ( = ?auto_26105 ?auto_26135 ) ) ( not ( = ?auto_26111 ?auto_26152 ) ) ( IS-CRATE ?auto_26104 ) ( not ( = ?auto_26122 ?auto_26113 ) ) ( HOIST-AT ?auto_26141 ?auto_26122 ) ( SURFACE-AT ?auto_26104 ?auto_26122 ) ( ON ?auto_26104 ?auto_26120 ) ( CLEAR ?auto_26104 ) ( not ( = ?auto_26103 ?auto_26104 ) ) ( not ( = ?auto_26103 ?auto_26120 ) ) ( not ( = ?auto_26104 ?auto_26120 ) ) ( not ( = ?auto_26111 ?auto_26141 ) ) ( IS-CRATE ?auto_26103 ) ( AVAILABLE ?auto_26141 ) ( SURFACE-AT ?auto_26103 ?auto_26122 ) ( ON ?auto_26103 ?auto_26125 ) ( CLEAR ?auto_26103 ) ( not ( = ?auto_26102 ?auto_26103 ) ) ( not ( = ?auto_26102 ?auto_26125 ) ) ( not ( = ?auto_26103 ?auto_26125 ) ) ( IS-CRATE ?auto_26102 ) ( not ( = ?auto_26121 ?auto_26113 ) ) ( HOIST-AT ?auto_26130 ?auto_26121 ) ( AVAILABLE ?auto_26130 ) ( SURFACE-AT ?auto_26102 ?auto_26121 ) ( ON ?auto_26102 ?auto_26132 ) ( CLEAR ?auto_26102 ) ( not ( = ?auto_26101 ?auto_26102 ) ) ( not ( = ?auto_26101 ?auto_26132 ) ) ( not ( = ?auto_26102 ?auto_26132 ) ) ( not ( = ?auto_26111 ?auto_26130 ) ) ( IS-CRATE ?auto_26101 ) ( not ( = ?auto_26151 ?auto_26113 ) ) ( HOIST-AT ?auto_26149 ?auto_26151 ) ( AVAILABLE ?auto_26149 ) ( SURFACE-AT ?auto_26101 ?auto_26151 ) ( ON ?auto_26101 ?auto_26124 ) ( CLEAR ?auto_26101 ) ( not ( = ?auto_26100 ?auto_26101 ) ) ( not ( = ?auto_26100 ?auto_26124 ) ) ( not ( = ?auto_26101 ?auto_26124 ) ) ( not ( = ?auto_26111 ?auto_26149 ) ) ( IS-CRATE ?auto_26100 ) ( not ( = ?auto_26148 ?auto_26113 ) ) ( HOIST-AT ?auto_26144 ?auto_26148 ) ( AVAILABLE ?auto_26144 ) ( SURFACE-AT ?auto_26100 ?auto_26148 ) ( ON ?auto_26100 ?auto_26142 ) ( CLEAR ?auto_26100 ) ( not ( = ?auto_26099 ?auto_26100 ) ) ( not ( = ?auto_26099 ?auto_26142 ) ) ( not ( = ?auto_26100 ?auto_26142 ) ) ( not ( = ?auto_26111 ?auto_26144 ) ) ( IS-CRATE ?auto_26099 ) ( not ( = ?auto_26133 ?auto_26113 ) ) ( HOIST-AT ?auto_26138 ?auto_26133 ) ( AVAILABLE ?auto_26138 ) ( SURFACE-AT ?auto_26099 ?auto_26133 ) ( ON ?auto_26099 ?auto_26128 ) ( CLEAR ?auto_26099 ) ( not ( = ?auto_26098 ?auto_26099 ) ) ( not ( = ?auto_26098 ?auto_26128 ) ) ( not ( = ?auto_26099 ?auto_26128 ) ) ( not ( = ?auto_26111 ?auto_26138 ) ) ( IS-CRATE ?auto_26098 ) ( not ( = ?auto_26117 ?auto_26113 ) ) ( HOIST-AT ?auto_26145 ?auto_26117 ) ( AVAILABLE ?auto_26145 ) ( SURFACE-AT ?auto_26098 ?auto_26117 ) ( ON ?auto_26098 ?auto_26146 ) ( CLEAR ?auto_26098 ) ( not ( = ?auto_26097 ?auto_26098 ) ) ( not ( = ?auto_26097 ?auto_26146 ) ) ( not ( = ?auto_26098 ?auto_26146 ) ) ( not ( = ?auto_26111 ?auto_26145 ) ) ( IS-CRATE ?auto_26097 ) ( AVAILABLE ?auto_26114 ) ( SURFACE-AT ?auto_26097 ?auto_26112 ) ( ON ?auto_26097 ?auto_26150 ) ( CLEAR ?auto_26097 ) ( not ( = ?auto_26096 ?auto_26097 ) ) ( not ( = ?auto_26096 ?auto_26150 ) ) ( not ( = ?auto_26097 ?auto_26150 ) ) ( IS-CRATE ?auto_26096 ) ( not ( = ?auto_26140 ?auto_26113 ) ) ( HOIST-AT ?auto_26123 ?auto_26140 ) ( AVAILABLE ?auto_26123 ) ( SURFACE-AT ?auto_26096 ?auto_26140 ) ( ON ?auto_26096 ?auto_26137 ) ( CLEAR ?auto_26096 ) ( not ( = ?auto_26095 ?auto_26096 ) ) ( not ( = ?auto_26095 ?auto_26137 ) ) ( not ( = ?auto_26096 ?auto_26137 ) ) ( not ( = ?auto_26111 ?auto_26123 ) ) ( IS-CRATE ?auto_26095 ) ( not ( = ?auto_26127 ?auto_26113 ) ) ( HOIST-AT ?auto_26136 ?auto_26127 ) ( AVAILABLE ?auto_26136 ) ( SURFACE-AT ?auto_26095 ?auto_26127 ) ( ON ?auto_26095 ?auto_26116 ) ( CLEAR ?auto_26095 ) ( not ( = ?auto_26094 ?auto_26095 ) ) ( not ( = ?auto_26094 ?auto_26116 ) ) ( not ( = ?auto_26095 ?auto_26116 ) ) ( not ( = ?auto_26111 ?auto_26136 ) ) ( SURFACE-AT ?auto_26093 ?auto_26113 ) ( CLEAR ?auto_26093 ) ( IS-CRATE ?auto_26094 ) ( AVAILABLE ?auto_26111 ) ( not ( = ?auto_26143 ?auto_26113 ) ) ( HOIST-AT ?auto_26119 ?auto_26143 ) ( AVAILABLE ?auto_26119 ) ( SURFACE-AT ?auto_26094 ?auto_26143 ) ( ON ?auto_26094 ?auto_26118 ) ( CLEAR ?auto_26094 ) ( TRUCK-AT ?auto_26110 ?auto_26113 ) ( not ( = ?auto_26093 ?auto_26094 ) ) ( not ( = ?auto_26093 ?auto_26118 ) ) ( not ( = ?auto_26094 ?auto_26118 ) ) ( not ( = ?auto_26111 ?auto_26119 ) ) ( not ( = ?auto_26093 ?auto_26095 ) ) ( not ( = ?auto_26093 ?auto_26116 ) ) ( not ( = ?auto_26095 ?auto_26118 ) ) ( not ( = ?auto_26127 ?auto_26143 ) ) ( not ( = ?auto_26136 ?auto_26119 ) ) ( not ( = ?auto_26116 ?auto_26118 ) ) ( not ( = ?auto_26093 ?auto_26096 ) ) ( not ( = ?auto_26093 ?auto_26137 ) ) ( not ( = ?auto_26094 ?auto_26096 ) ) ( not ( = ?auto_26094 ?auto_26137 ) ) ( not ( = ?auto_26096 ?auto_26116 ) ) ( not ( = ?auto_26096 ?auto_26118 ) ) ( not ( = ?auto_26140 ?auto_26127 ) ) ( not ( = ?auto_26140 ?auto_26143 ) ) ( not ( = ?auto_26123 ?auto_26136 ) ) ( not ( = ?auto_26123 ?auto_26119 ) ) ( not ( = ?auto_26137 ?auto_26116 ) ) ( not ( = ?auto_26137 ?auto_26118 ) ) ( not ( = ?auto_26093 ?auto_26097 ) ) ( not ( = ?auto_26093 ?auto_26150 ) ) ( not ( = ?auto_26094 ?auto_26097 ) ) ( not ( = ?auto_26094 ?auto_26150 ) ) ( not ( = ?auto_26095 ?auto_26097 ) ) ( not ( = ?auto_26095 ?auto_26150 ) ) ( not ( = ?auto_26097 ?auto_26137 ) ) ( not ( = ?auto_26097 ?auto_26116 ) ) ( not ( = ?auto_26097 ?auto_26118 ) ) ( not ( = ?auto_26112 ?auto_26140 ) ) ( not ( = ?auto_26112 ?auto_26127 ) ) ( not ( = ?auto_26112 ?auto_26143 ) ) ( not ( = ?auto_26114 ?auto_26123 ) ) ( not ( = ?auto_26114 ?auto_26136 ) ) ( not ( = ?auto_26114 ?auto_26119 ) ) ( not ( = ?auto_26150 ?auto_26137 ) ) ( not ( = ?auto_26150 ?auto_26116 ) ) ( not ( = ?auto_26150 ?auto_26118 ) ) ( not ( = ?auto_26093 ?auto_26098 ) ) ( not ( = ?auto_26093 ?auto_26146 ) ) ( not ( = ?auto_26094 ?auto_26098 ) ) ( not ( = ?auto_26094 ?auto_26146 ) ) ( not ( = ?auto_26095 ?auto_26098 ) ) ( not ( = ?auto_26095 ?auto_26146 ) ) ( not ( = ?auto_26096 ?auto_26098 ) ) ( not ( = ?auto_26096 ?auto_26146 ) ) ( not ( = ?auto_26098 ?auto_26150 ) ) ( not ( = ?auto_26098 ?auto_26137 ) ) ( not ( = ?auto_26098 ?auto_26116 ) ) ( not ( = ?auto_26098 ?auto_26118 ) ) ( not ( = ?auto_26117 ?auto_26112 ) ) ( not ( = ?auto_26117 ?auto_26140 ) ) ( not ( = ?auto_26117 ?auto_26127 ) ) ( not ( = ?auto_26117 ?auto_26143 ) ) ( not ( = ?auto_26145 ?auto_26114 ) ) ( not ( = ?auto_26145 ?auto_26123 ) ) ( not ( = ?auto_26145 ?auto_26136 ) ) ( not ( = ?auto_26145 ?auto_26119 ) ) ( not ( = ?auto_26146 ?auto_26150 ) ) ( not ( = ?auto_26146 ?auto_26137 ) ) ( not ( = ?auto_26146 ?auto_26116 ) ) ( not ( = ?auto_26146 ?auto_26118 ) ) ( not ( = ?auto_26093 ?auto_26099 ) ) ( not ( = ?auto_26093 ?auto_26128 ) ) ( not ( = ?auto_26094 ?auto_26099 ) ) ( not ( = ?auto_26094 ?auto_26128 ) ) ( not ( = ?auto_26095 ?auto_26099 ) ) ( not ( = ?auto_26095 ?auto_26128 ) ) ( not ( = ?auto_26096 ?auto_26099 ) ) ( not ( = ?auto_26096 ?auto_26128 ) ) ( not ( = ?auto_26097 ?auto_26099 ) ) ( not ( = ?auto_26097 ?auto_26128 ) ) ( not ( = ?auto_26099 ?auto_26146 ) ) ( not ( = ?auto_26099 ?auto_26150 ) ) ( not ( = ?auto_26099 ?auto_26137 ) ) ( not ( = ?auto_26099 ?auto_26116 ) ) ( not ( = ?auto_26099 ?auto_26118 ) ) ( not ( = ?auto_26133 ?auto_26117 ) ) ( not ( = ?auto_26133 ?auto_26112 ) ) ( not ( = ?auto_26133 ?auto_26140 ) ) ( not ( = ?auto_26133 ?auto_26127 ) ) ( not ( = ?auto_26133 ?auto_26143 ) ) ( not ( = ?auto_26138 ?auto_26145 ) ) ( not ( = ?auto_26138 ?auto_26114 ) ) ( not ( = ?auto_26138 ?auto_26123 ) ) ( not ( = ?auto_26138 ?auto_26136 ) ) ( not ( = ?auto_26138 ?auto_26119 ) ) ( not ( = ?auto_26128 ?auto_26146 ) ) ( not ( = ?auto_26128 ?auto_26150 ) ) ( not ( = ?auto_26128 ?auto_26137 ) ) ( not ( = ?auto_26128 ?auto_26116 ) ) ( not ( = ?auto_26128 ?auto_26118 ) ) ( not ( = ?auto_26093 ?auto_26100 ) ) ( not ( = ?auto_26093 ?auto_26142 ) ) ( not ( = ?auto_26094 ?auto_26100 ) ) ( not ( = ?auto_26094 ?auto_26142 ) ) ( not ( = ?auto_26095 ?auto_26100 ) ) ( not ( = ?auto_26095 ?auto_26142 ) ) ( not ( = ?auto_26096 ?auto_26100 ) ) ( not ( = ?auto_26096 ?auto_26142 ) ) ( not ( = ?auto_26097 ?auto_26100 ) ) ( not ( = ?auto_26097 ?auto_26142 ) ) ( not ( = ?auto_26098 ?auto_26100 ) ) ( not ( = ?auto_26098 ?auto_26142 ) ) ( not ( = ?auto_26100 ?auto_26128 ) ) ( not ( = ?auto_26100 ?auto_26146 ) ) ( not ( = ?auto_26100 ?auto_26150 ) ) ( not ( = ?auto_26100 ?auto_26137 ) ) ( not ( = ?auto_26100 ?auto_26116 ) ) ( not ( = ?auto_26100 ?auto_26118 ) ) ( not ( = ?auto_26148 ?auto_26133 ) ) ( not ( = ?auto_26148 ?auto_26117 ) ) ( not ( = ?auto_26148 ?auto_26112 ) ) ( not ( = ?auto_26148 ?auto_26140 ) ) ( not ( = ?auto_26148 ?auto_26127 ) ) ( not ( = ?auto_26148 ?auto_26143 ) ) ( not ( = ?auto_26144 ?auto_26138 ) ) ( not ( = ?auto_26144 ?auto_26145 ) ) ( not ( = ?auto_26144 ?auto_26114 ) ) ( not ( = ?auto_26144 ?auto_26123 ) ) ( not ( = ?auto_26144 ?auto_26136 ) ) ( not ( = ?auto_26144 ?auto_26119 ) ) ( not ( = ?auto_26142 ?auto_26128 ) ) ( not ( = ?auto_26142 ?auto_26146 ) ) ( not ( = ?auto_26142 ?auto_26150 ) ) ( not ( = ?auto_26142 ?auto_26137 ) ) ( not ( = ?auto_26142 ?auto_26116 ) ) ( not ( = ?auto_26142 ?auto_26118 ) ) ( not ( = ?auto_26093 ?auto_26101 ) ) ( not ( = ?auto_26093 ?auto_26124 ) ) ( not ( = ?auto_26094 ?auto_26101 ) ) ( not ( = ?auto_26094 ?auto_26124 ) ) ( not ( = ?auto_26095 ?auto_26101 ) ) ( not ( = ?auto_26095 ?auto_26124 ) ) ( not ( = ?auto_26096 ?auto_26101 ) ) ( not ( = ?auto_26096 ?auto_26124 ) ) ( not ( = ?auto_26097 ?auto_26101 ) ) ( not ( = ?auto_26097 ?auto_26124 ) ) ( not ( = ?auto_26098 ?auto_26101 ) ) ( not ( = ?auto_26098 ?auto_26124 ) ) ( not ( = ?auto_26099 ?auto_26101 ) ) ( not ( = ?auto_26099 ?auto_26124 ) ) ( not ( = ?auto_26101 ?auto_26142 ) ) ( not ( = ?auto_26101 ?auto_26128 ) ) ( not ( = ?auto_26101 ?auto_26146 ) ) ( not ( = ?auto_26101 ?auto_26150 ) ) ( not ( = ?auto_26101 ?auto_26137 ) ) ( not ( = ?auto_26101 ?auto_26116 ) ) ( not ( = ?auto_26101 ?auto_26118 ) ) ( not ( = ?auto_26151 ?auto_26148 ) ) ( not ( = ?auto_26151 ?auto_26133 ) ) ( not ( = ?auto_26151 ?auto_26117 ) ) ( not ( = ?auto_26151 ?auto_26112 ) ) ( not ( = ?auto_26151 ?auto_26140 ) ) ( not ( = ?auto_26151 ?auto_26127 ) ) ( not ( = ?auto_26151 ?auto_26143 ) ) ( not ( = ?auto_26149 ?auto_26144 ) ) ( not ( = ?auto_26149 ?auto_26138 ) ) ( not ( = ?auto_26149 ?auto_26145 ) ) ( not ( = ?auto_26149 ?auto_26114 ) ) ( not ( = ?auto_26149 ?auto_26123 ) ) ( not ( = ?auto_26149 ?auto_26136 ) ) ( not ( = ?auto_26149 ?auto_26119 ) ) ( not ( = ?auto_26124 ?auto_26142 ) ) ( not ( = ?auto_26124 ?auto_26128 ) ) ( not ( = ?auto_26124 ?auto_26146 ) ) ( not ( = ?auto_26124 ?auto_26150 ) ) ( not ( = ?auto_26124 ?auto_26137 ) ) ( not ( = ?auto_26124 ?auto_26116 ) ) ( not ( = ?auto_26124 ?auto_26118 ) ) ( not ( = ?auto_26093 ?auto_26102 ) ) ( not ( = ?auto_26093 ?auto_26132 ) ) ( not ( = ?auto_26094 ?auto_26102 ) ) ( not ( = ?auto_26094 ?auto_26132 ) ) ( not ( = ?auto_26095 ?auto_26102 ) ) ( not ( = ?auto_26095 ?auto_26132 ) ) ( not ( = ?auto_26096 ?auto_26102 ) ) ( not ( = ?auto_26096 ?auto_26132 ) ) ( not ( = ?auto_26097 ?auto_26102 ) ) ( not ( = ?auto_26097 ?auto_26132 ) ) ( not ( = ?auto_26098 ?auto_26102 ) ) ( not ( = ?auto_26098 ?auto_26132 ) ) ( not ( = ?auto_26099 ?auto_26102 ) ) ( not ( = ?auto_26099 ?auto_26132 ) ) ( not ( = ?auto_26100 ?auto_26102 ) ) ( not ( = ?auto_26100 ?auto_26132 ) ) ( not ( = ?auto_26102 ?auto_26124 ) ) ( not ( = ?auto_26102 ?auto_26142 ) ) ( not ( = ?auto_26102 ?auto_26128 ) ) ( not ( = ?auto_26102 ?auto_26146 ) ) ( not ( = ?auto_26102 ?auto_26150 ) ) ( not ( = ?auto_26102 ?auto_26137 ) ) ( not ( = ?auto_26102 ?auto_26116 ) ) ( not ( = ?auto_26102 ?auto_26118 ) ) ( not ( = ?auto_26121 ?auto_26151 ) ) ( not ( = ?auto_26121 ?auto_26148 ) ) ( not ( = ?auto_26121 ?auto_26133 ) ) ( not ( = ?auto_26121 ?auto_26117 ) ) ( not ( = ?auto_26121 ?auto_26112 ) ) ( not ( = ?auto_26121 ?auto_26140 ) ) ( not ( = ?auto_26121 ?auto_26127 ) ) ( not ( = ?auto_26121 ?auto_26143 ) ) ( not ( = ?auto_26130 ?auto_26149 ) ) ( not ( = ?auto_26130 ?auto_26144 ) ) ( not ( = ?auto_26130 ?auto_26138 ) ) ( not ( = ?auto_26130 ?auto_26145 ) ) ( not ( = ?auto_26130 ?auto_26114 ) ) ( not ( = ?auto_26130 ?auto_26123 ) ) ( not ( = ?auto_26130 ?auto_26136 ) ) ( not ( = ?auto_26130 ?auto_26119 ) ) ( not ( = ?auto_26132 ?auto_26124 ) ) ( not ( = ?auto_26132 ?auto_26142 ) ) ( not ( = ?auto_26132 ?auto_26128 ) ) ( not ( = ?auto_26132 ?auto_26146 ) ) ( not ( = ?auto_26132 ?auto_26150 ) ) ( not ( = ?auto_26132 ?auto_26137 ) ) ( not ( = ?auto_26132 ?auto_26116 ) ) ( not ( = ?auto_26132 ?auto_26118 ) ) ( not ( = ?auto_26093 ?auto_26103 ) ) ( not ( = ?auto_26093 ?auto_26125 ) ) ( not ( = ?auto_26094 ?auto_26103 ) ) ( not ( = ?auto_26094 ?auto_26125 ) ) ( not ( = ?auto_26095 ?auto_26103 ) ) ( not ( = ?auto_26095 ?auto_26125 ) ) ( not ( = ?auto_26096 ?auto_26103 ) ) ( not ( = ?auto_26096 ?auto_26125 ) ) ( not ( = ?auto_26097 ?auto_26103 ) ) ( not ( = ?auto_26097 ?auto_26125 ) ) ( not ( = ?auto_26098 ?auto_26103 ) ) ( not ( = ?auto_26098 ?auto_26125 ) ) ( not ( = ?auto_26099 ?auto_26103 ) ) ( not ( = ?auto_26099 ?auto_26125 ) ) ( not ( = ?auto_26100 ?auto_26103 ) ) ( not ( = ?auto_26100 ?auto_26125 ) ) ( not ( = ?auto_26101 ?auto_26103 ) ) ( not ( = ?auto_26101 ?auto_26125 ) ) ( not ( = ?auto_26103 ?auto_26132 ) ) ( not ( = ?auto_26103 ?auto_26124 ) ) ( not ( = ?auto_26103 ?auto_26142 ) ) ( not ( = ?auto_26103 ?auto_26128 ) ) ( not ( = ?auto_26103 ?auto_26146 ) ) ( not ( = ?auto_26103 ?auto_26150 ) ) ( not ( = ?auto_26103 ?auto_26137 ) ) ( not ( = ?auto_26103 ?auto_26116 ) ) ( not ( = ?auto_26103 ?auto_26118 ) ) ( not ( = ?auto_26122 ?auto_26121 ) ) ( not ( = ?auto_26122 ?auto_26151 ) ) ( not ( = ?auto_26122 ?auto_26148 ) ) ( not ( = ?auto_26122 ?auto_26133 ) ) ( not ( = ?auto_26122 ?auto_26117 ) ) ( not ( = ?auto_26122 ?auto_26112 ) ) ( not ( = ?auto_26122 ?auto_26140 ) ) ( not ( = ?auto_26122 ?auto_26127 ) ) ( not ( = ?auto_26122 ?auto_26143 ) ) ( not ( = ?auto_26141 ?auto_26130 ) ) ( not ( = ?auto_26141 ?auto_26149 ) ) ( not ( = ?auto_26141 ?auto_26144 ) ) ( not ( = ?auto_26141 ?auto_26138 ) ) ( not ( = ?auto_26141 ?auto_26145 ) ) ( not ( = ?auto_26141 ?auto_26114 ) ) ( not ( = ?auto_26141 ?auto_26123 ) ) ( not ( = ?auto_26141 ?auto_26136 ) ) ( not ( = ?auto_26141 ?auto_26119 ) ) ( not ( = ?auto_26125 ?auto_26132 ) ) ( not ( = ?auto_26125 ?auto_26124 ) ) ( not ( = ?auto_26125 ?auto_26142 ) ) ( not ( = ?auto_26125 ?auto_26128 ) ) ( not ( = ?auto_26125 ?auto_26146 ) ) ( not ( = ?auto_26125 ?auto_26150 ) ) ( not ( = ?auto_26125 ?auto_26137 ) ) ( not ( = ?auto_26125 ?auto_26116 ) ) ( not ( = ?auto_26125 ?auto_26118 ) ) ( not ( = ?auto_26093 ?auto_26104 ) ) ( not ( = ?auto_26093 ?auto_26120 ) ) ( not ( = ?auto_26094 ?auto_26104 ) ) ( not ( = ?auto_26094 ?auto_26120 ) ) ( not ( = ?auto_26095 ?auto_26104 ) ) ( not ( = ?auto_26095 ?auto_26120 ) ) ( not ( = ?auto_26096 ?auto_26104 ) ) ( not ( = ?auto_26096 ?auto_26120 ) ) ( not ( = ?auto_26097 ?auto_26104 ) ) ( not ( = ?auto_26097 ?auto_26120 ) ) ( not ( = ?auto_26098 ?auto_26104 ) ) ( not ( = ?auto_26098 ?auto_26120 ) ) ( not ( = ?auto_26099 ?auto_26104 ) ) ( not ( = ?auto_26099 ?auto_26120 ) ) ( not ( = ?auto_26100 ?auto_26104 ) ) ( not ( = ?auto_26100 ?auto_26120 ) ) ( not ( = ?auto_26101 ?auto_26104 ) ) ( not ( = ?auto_26101 ?auto_26120 ) ) ( not ( = ?auto_26102 ?auto_26104 ) ) ( not ( = ?auto_26102 ?auto_26120 ) ) ( not ( = ?auto_26104 ?auto_26125 ) ) ( not ( = ?auto_26104 ?auto_26132 ) ) ( not ( = ?auto_26104 ?auto_26124 ) ) ( not ( = ?auto_26104 ?auto_26142 ) ) ( not ( = ?auto_26104 ?auto_26128 ) ) ( not ( = ?auto_26104 ?auto_26146 ) ) ( not ( = ?auto_26104 ?auto_26150 ) ) ( not ( = ?auto_26104 ?auto_26137 ) ) ( not ( = ?auto_26104 ?auto_26116 ) ) ( not ( = ?auto_26104 ?auto_26118 ) ) ( not ( = ?auto_26120 ?auto_26125 ) ) ( not ( = ?auto_26120 ?auto_26132 ) ) ( not ( = ?auto_26120 ?auto_26124 ) ) ( not ( = ?auto_26120 ?auto_26142 ) ) ( not ( = ?auto_26120 ?auto_26128 ) ) ( not ( = ?auto_26120 ?auto_26146 ) ) ( not ( = ?auto_26120 ?auto_26150 ) ) ( not ( = ?auto_26120 ?auto_26137 ) ) ( not ( = ?auto_26120 ?auto_26116 ) ) ( not ( = ?auto_26120 ?auto_26118 ) ) ( not ( = ?auto_26093 ?auto_26105 ) ) ( not ( = ?auto_26093 ?auto_26135 ) ) ( not ( = ?auto_26094 ?auto_26105 ) ) ( not ( = ?auto_26094 ?auto_26135 ) ) ( not ( = ?auto_26095 ?auto_26105 ) ) ( not ( = ?auto_26095 ?auto_26135 ) ) ( not ( = ?auto_26096 ?auto_26105 ) ) ( not ( = ?auto_26096 ?auto_26135 ) ) ( not ( = ?auto_26097 ?auto_26105 ) ) ( not ( = ?auto_26097 ?auto_26135 ) ) ( not ( = ?auto_26098 ?auto_26105 ) ) ( not ( = ?auto_26098 ?auto_26135 ) ) ( not ( = ?auto_26099 ?auto_26105 ) ) ( not ( = ?auto_26099 ?auto_26135 ) ) ( not ( = ?auto_26100 ?auto_26105 ) ) ( not ( = ?auto_26100 ?auto_26135 ) ) ( not ( = ?auto_26101 ?auto_26105 ) ) ( not ( = ?auto_26101 ?auto_26135 ) ) ( not ( = ?auto_26102 ?auto_26105 ) ) ( not ( = ?auto_26102 ?auto_26135 ) ) ( not ( = ?auto_26103 ?auto_26105 ) ) ( not ( = ?auto_26103 ?auto_26135 ) ) ( not ( = ?auto_26105 ?auto_26120 ) ) ( not ( = ?auto_26105 ?auto_26125 ) ) ( not ( = ?auto_26105 ?auto_26132 ) ) ( not ( = ?auto_26105 ?auto_26124 ) ) ( not ( = ?auto_26105 ?auto_26142 ) ) ( not ( = ?auto_26105 ?auto_26128 ) ) ( not ( = ?auto_26105 ?auto_26146 ) ) ( not ( = ?auto_26105 ?auto_26150 ) ) ( not ( = ?auto_26105 ?auto_26137 ) ) ( not ( = ?auto_26105 ?auto_26116 ) ) ( not ( = ?auto_26105 ?auto_26118 ) ) ( not ( = ?auto_26139 ?auto_26122 ) ) ( not ( = ?auto_26139 ?auto_26121 ) ) ( not ( = ?auto_26139 ?auto_26151 ) ) ( not ( = ?auto_26139 ?auto_26148 ) ) ( not ( = ?auto_26139 ?auto_26133 ) ) ( not ( = ?auto_26139 ?auto_26117 ) ) ( not ( = ?auto_26139 ?auto_26112 ) ) ( not ( = ?auto_26139 ?auto_26140 ) ) ( not ( = ?auto_26139 ?auto_26127 ) ) ( not ( = ?auto_26139 ?auto_26143 ) ) ( not ( = ?auto_26152 ?auto_26141 ) ) ( not ( = ?auto_26152 ?auto_26130 ) ) ( not ( = ?auto_26152 ?auto_26149 ) ) ( not ( = ?auto_26152 ?auto_26144 ) ) ( not ( = ?auto_26152 ?auto_26138 ) ) ( not ( = ?auto_26152 ?auto_26145 ) ) ( not ( = ?auto_26152 ?auto_26114 ) ) ( not ( = ?auto_26152 ?auto_26123 ) ) ( not ( = ?auto_26152 ?auto_26136 ) ) ( not ( = ?auto_26152 ?auto_26119 ) ) ( not ( = ?auto_26135 ?auto_26120 ) ) ( not ( = ?auto_26135 ?auto_26125 ) ) ( not ( = ?auto_26135 ?auto_26132 ) ) ( not ( = ?auto_26135 ?auto_26124 ) ) ( not ( = ?auto_26135 ?auto_26142 ) ) ( not ( = ?auto_26135 ?auto_26128 ) ) ( not ( = ?auto_26135 ?auto_26146 ) ) ( not ( = ?auto_26135 ?auto_26150 ) ) ( not ( = ?auto_26135 ?auto_26137 ) ) ( not ( = ?auto_26135 ?auto_26116 ) ) ( not ( = ?auto_26135 ?auto_26118 ) ) ( not ( = ?auto_26093 ?auto_26107 ) ) ( not ( = ?auto_26093 ?auto_26126 ) ) ( not ( = ?auto_26094 ?auto_26107 ) ) ( not ( = ?auto_26094 ?auto_26126 ) ) ( not ( = ?auto_26095 ?auto_26107 ) ) ( not ( = ?auto_26095 ?auto_26126 ) ) ( not ( = ?auto_26096 ?auto_26107 ) ) ( not ( = ?auto_26096 ?auto_26126 ) ) ( not ( = ?auto_26097 ?auto_26107 ) ) ( not ( = ?auto_26097 ?auto_26126 ) ) ( not ( = ?auto_26098 ?auto_26107 ) ) ( not ( = ?auto_26098 ?auto_26126 ) ) ( not ( = ?auto_26099 ?auto_26107 ) ) ( not ( = ?auto_26099 ?auto_26126 ) ) ( not ( = ?auto_26100 ?auto_26107 ) ) ( not ( = ?auto_26100 ?auto_26126 ) ) ( not ( = ?auto_26101 ?auto_26107 ) ) ( not ( = ?auto_26101 ?auto_26126 ) ) ( not ( = ?auto_26102 ?auto_26107 ) ) ( not ( = ?auto_26102 ?auto_26126 ) ) ( not ( = ?auto_26103 ?auto_26107 ) ) ( not ( = ?auto_26103 ?auto_26126 ) ) ( not ( = ?auto_26104 ?auto_26107 ) ) ( not ( = ?auto_26104 ?auto_26126 ) ) ( not ( = ?auto_26107 ?auto_26135 ) ) ( not ( = ?auto_26107 ?auto_26120 ) ) ( not ( = ?auto_26107 ?auto_26125 ) ) ( not ( = ?auto_26107 ?auto_26132 ) ) ( not ( = ?auto_26107 ?auto_26124 ) ) ( not ( = ?auto_26107 ?auto_26142 ) ) ( not ( = ?auto_26107 ?auto_26128 ) ) ( not ( = ?auto_26107 ?auto_26146 ) ) ( not ( = ?auto_26107 ?auto_26150 ) ) ( not ( = ?auto_26107 ?auto_26137 ) ) ( not ( = ?auto_26107 ?auto_26116 ) ) ( not ( = ?auto_26107 ?auto_26118 ) ) ( not ( = ?auto_26147 ?auto_26139 ) ) ( not ( = ?auto_26147 ?auto_26122 ) ) ( not ( = ?auto_26147 ?auto_26121 ) ) ( not ( = ?auto_26147 ?auto_26151 ) ) ( not ( = ?auto_26147 ?auto_26148 ) ) ( not ( = ?auto_26147 ?auto_26133 ) ) ( not ( = ?auto_26147 ?auto_26117 ) ) ( not ( = ?auto_26147 ?auto_26112 ) ) ( not ( = ?auto_26147 ?auto_26140 ) ) ( not ( = ?auto_26147 ?auto_26127 ) ) ( not ( = ?auto_26147 ?auto_26143 ) ) ( not ( = ?auto_26131 ?auto_26152 ) ) ( not ( = ?auto_26131 ?auto_26141 ) ) ( not ( = ?auto_26131 ?auto_26130 ) ) ( not ( = ?auto_26131 ?auto_26149 ) ) ( not ( = ?auto_26131 ?auto_26144 ) ) ( not ( = ?auto_26131 ?auto_26138 ) ) ( not ( = ?auto_26131 ?auto_26145 ) ) ( not ( = ?auto_26131 ?auto_26114 ) ) ( not ( = ?auto_26131 ?auto_26123 ) ) ( not ( = ?auto_26131 ?auto_26136 ) ) ( not ( = ?auto_26131 ?auto_26119 ) ) ( not ( = ?auto_26126 ?auto_26135 ) ) ( not ( = ?auto_26126 ?auto_26120 ) ) ( not ( = ?auto_26126 ?auto_26125 ) ) ( not ( = ?auto_26126 ?auto_26132 ) ) ( not ( = ?auto_26126 ?auto_26124 ) ) ( not ( = ?auto_26126 ?auto_26142 ) ) ( not ( = ?auto_26126 ?auto_26128 ) ) ( not ( = ?auto_26126 ?auto_26146 ) ) ( not ( = ?auto_26126 ?auto_26150 ) ) ( not ( = ?auto_26126 ?auto_26137 ) ) ( not ( = ?auto_26126 ?auto_26116 ) ) ( not ( = ?auto_26126 ?auto_26118 ) ) ( not ( = ?auto_26093 ?auto_26106 ) ) ( not ( = ?auto_26093 ?auto_26115 ) ) ( not ( = ?auto_26094 ?auto_26106 ) ) ( not ( = ?auto_26094 ?auto_26115 ) ) ( not ( = ?auto_26095 ?auto_26106 ) ) ( not ( = ?auto_26095 ?auto_26115 ) ) ( not ( = ?auto_26096 ?auto_26106 ) ) ( not ( = ?auto_26096 ?auto_26115 ) ) ( not ( = ?auto_26097 ?auto_26106 ) ) ( not ( = ?auto_26097 ?auto_26115 ) ) ( not ( = ?auto_26098 ?auto_26106 ) ) ( not ( = ?auto_26098 ?auto_26115 ) ) ( not ( = ?auto_26099 ?auto_26106 ) ) ( not ( = ?auto_26099 ?auto_26115 ) ) ( not ( = ?auto_26100 ?auto_26106 ) ) ( not ( = ?auto_26100 ?auto_26115 ) ) ( not ( = ?auto_26101 ?auto_26106 ) ) ( not ( = ?auto_26101 ?auto_26115 ) ) ( not ( = ?auto_26102 ?auto_26106 ) ) ( not ( = ?auto_26102 ?auto_26115 ) ) ( not ( = ?auto_26103 ?auto_26106 ) ) ( not ( = ?auto_26103 ?auto_26115 ) ) ( not ( = ?auto_26104 ?auto_26106 ) ) ( not ( = ?auto_26104 ?auto_26115 ) ) ( not ( = ?auto_26105 ?auto_26106 ) ) ( not ( = ?auto_26105 ?auto_26115 ) ) ( not ( = ?auto_26106 ?auto_26126 ) ) ( not ( = ?auto_26106 ?auto_26135 ) ) ( not ( = ?auto_26106 ?auto_26120 ) ) ( not ( = ?auto_26106 ?auto_26125 ) ) ( not ( = ?auto_26106 ?auto_26132 ) ) ( not ( = ?auto_26106 ?auto_26124 ) ) ( not ( = ?auto_26106 ?auto_26142 ) ) ( not ( = ?auto_26106 ?auto_26128 ) ) ( not ( = ?auto_26106 ?auto_26146 ) ) ( not ( = ?auto_26106 ?auto_26150 ) ) ( not ( = ?auto_26106 ?auto_26137 ) ) ( not ( = ?auto_26106 ?auto_26116 ) ) ( not ( = ?auto_26106 ?auto_26118 ) ) ( not ( = ?auto_26129 ?auto_26147 ) ) ( not ( = ?auto_26129 ?auto_26139 ) ) ( not ( = ?auto_26129 ?auto_26122 ) ) ( not ( = ?auto_26129 ?auto_26121 ) ) ( not ( = ?auto_26129 ?auto_26151 ) ) ( not ( = ?auto_26129 ?auto_26148 ) ) ( not ( = ?auto_26129 ?auto_26133 ) ) ( not ( = ?auto_26129 ?auto_26117 ) ) ( not ( = ?auto_26129 ?auto_26112 ) ) ( not ( = ?auto_26129 ?auto_26140 ) ) ( not ( = ?auto_26129 ?auto_26127 ) ) ( not ( = ?auto_26129 ?auto_26143 ) ) ( not ( = ?auto_26134 ?auto_26131 ) ) ( not ( = ?auto_26134 ?auto_26152 ) ) ( not ( = ?auto_26134 ?auto_26141 ) ) ( not ( = ?auto_26134 ?auto_26130 ) ) ( not ( = ?auto_26134 ?auto_26149 ) ) ( not ( = ?auto_26134 ?auto_26144 ) ) ( not ( = ?auto_26134 ?auto_26138 ) ) ( not ( = ?auto_26134 ?auto_26145 ) ) ( not ( = ?auto_26134 ?auto_26114 ) ) ( not ( = ?auto_26134 ?auto_26123 ) ) ( not ( = ?auto_26134 ?auto_26136 ) ) ( not ( = ?auto_26134 ?auto_26119 ) ) ( not ( = ?auto_26115 ?auto_26126 ) ) ( not ( = ?auto_26115 ?auto_26135 ) ) ( not ( = ?auto_26115 ?auto_26120 ) ) ( not ( = ?auto_26115 ?auto_26125 ) ) ( not ( = ?auto_26115 ?auto_26132 ) ) ( not ( = ?auto_26115 ?auto_26124 ) ) ( not ( = ?auto_26115 ?auto_26142 ) ) ( not ( = ?auto_26115 ?auto_26128 ) ) ( not ( = ?auto_26115 ?auto_26146 ) ) ( not ( = ?auto_26115 ?auto_26150 ) ) ( not ( = ?auto_26115 ?auto_26137 ) ) ( not ( = ?auto_26115 ?auto_26116 ) ) ( not ( = ?auto_26115 ?auto_26118 ) ) ( not ( = ?auto_26093 ?auto_26108 ) ) ( not ( = ?auto_26093 ?auto_26109 ) ) ( not ( = ?auto_26094 ?auto_26108 ) ) ( not ( = ?auto_26094 ?auto_26109 ) ) ( not ( = ?auto_26095 ?auto_26108 ) ) ( not ( = ?auto_26095 ?auto_26109 ) ) ( not ( = ?auto_26096 ?auto_26108 ) ) ( not ( = ?auto_26096 ?auto_26109 ) ) ( not ( = ?auto_26097 ?auto_26108 ) ) ( not ( = ?auto_26097 ?auto_26109 ) ) ( not ( = ?auto_26098 ?auto_26108 ) ) ( not ( = ?auto_26098 ?auto_26109 ) ) ( not ( = ?auto_26099 ?auto_26108 ) ) ( not ( = ?auto_26099 ?auto_26109 ) ) ( not ( = ?auto_26100 ?auto_26108 ) ) ( not ( = ?auto_26100 ?auto_26109 ) ) ( not ( = ?auto_26101 ?auto_26108 ) ) ( not ( = ?auto_26101 ?auto_26109 ) ) ( not ( = ?auto_26102 ?auto_26108 ) ) ( not ( = ?auto_26102 ?auto_26109 ) ) ( not ( = ?auto_26103 ?auto_26108 ) ) ( not ( = ?auto_26103 ?auto_26109 ) ) ( not ( = ?auto_26104 ?auto_26108 ) ) ( not ( = ?auto_26104 ?auto_26109 ) ) ( not ( = ?auto_26105 ?auto_26108 ) ) ( not ( = ?auto_26105 ?auto_26109 ) ) ( not ( = ?auto_26107 ?auto_26108 ) ) ( not ( = ?auto_26107 ?auto_26109 ) ) ( not ( = ?auto_26108 ?auto_26115 ) ) ( not ( = ?auto_26108 ?auto_26126 ) ) ( not ( = ?auto_26108 ?auto_26135 ) ) ( not ( = ?auto_26108 ?auto_26120 ) ) ( not ( = ?auto_26108 ?auto_26125 ) ) ( not ( = ?auto_26108 ?auto_26132 ) ) ( not ( = ?auto_26108 ?auto_26124 ) ) ( not ( = ?auto_26108 ?auto_26142 ) ) ( not ( = ?auto_26108 ?auto_26128 ) ) ( not ( = ?auto_26108 ?auto_26146 ) ) ( not ( = ?auto_26108 ?auto_26150 ) ) ( not ( = ?auto_26108 ?auto_26137 ) ) ( not ( = ?auto_26108 ?auto_26116 ) ) ( not ( = ?auto_26108 ?auto_26118 ) ) ( not ( = ?auto_26109 ?auto_26115 ) ) ( not ( = ?auto_26109 ?auto_26126 ) ) ( not ( = ?auto_26109 ?auto_26135 ) ) ( not ( = ?auto_26109 ?auto_26120 ) ) ( not ( = ?auto_26109 ?auto_26125 ) ) ( not ( = ?auto_26109 ?auto_26132 ) ) ( not ( = ?auto_26109 ?auto_26124 ) ) ( not ( = ?auto_26109 ?auto_26142 ) ) ( not ( = ?auto_26109 ?auto_26128 ) ) ( not ( = ?auto_26109 ?auto_26146 ) ) ( not ( = ?auto_26109 ?auto_26150 ) ) ( not ( = ?auto_26109 ?auto_26137 ) ) ( not ( = ?auto_26109 ?auto_26116 ) ) ( not ( = ?auto_26109 ?auto_26118 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_26093 ?auto_26094 ?auto_26095 ?auto_26096 ?auto_26097 ?auto_26098 ?auto_26099 ?auto_26100 ?auto_26101 ?auto_26102 ?auto_26103 ?auto_26104 ?auto_26105 ?auto_26107 ?auto_26106 )
      ( MAKE-1CRATE ?auto_26106 ?auto_26108 )
      ( MAKE-15CRATE-VERIFY ?auto_26093 ?auto_26094 ?auto_26095 ?auto_26096 ?auto_26097 ?auto_26098 ?auto_26099 ?auto_26100 ?auto_26101 ?auto_26102 ?auto_26103 ?auto_26104 ?auto_26105 ?auto_26107 ?auto_26106 ?auto_26108 ) )
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
      ?auto_26187 - SURFACE
      ?auto_26188 - SURFACE
      ?auto_26189 - SURFACE
      ?auto_26190 - SURFACE
      ?auto_26191 - SURFACE
      ?auto_26192 - SURFACE
      ?auto_26194 - SURFACE
      ?auto_26193 - SURFACE
      ?auto_26196 - SURFACE
      ?auto_26195 - SURFACE
    )
    :vars
    (
      ?auto_26197 - HOIST
      ?auto_26201 - PLACE
      ?auto_26202 - PLACE
      ?auto_26200 - HOIST
      ?auto_26198 - SURFACE
      ?auto_26210 - PLACE
      ?auto_26235 - HOIST
      ?auto_26224 - SURFACE
      ?auto_26243 - PLACE
      ?auto_26240 - HOIST
      ?auto_26229 - SURFACE
      ?auto_26206 - PLACE
      ?auto_26237 - HOIST
      ?auto_26207 - SURFACE
      ?auto_26223 - PLACE
      ?auto_26228 - HOIST
      ?auto_26226 - SURFACE
      ?auto_26241 - PLACE
      ?auto_26232 - HOIST
      ?auto_26217 - SURFACE
      ?auto_26218 - SURFACE
      ?auto_26238 - PLACE
      ?auto_26216 - HOIST
      ?auto_26234 - SURFACE
      ?auto_26242 - PLACE
      ?auto_26227 - HOIST
      ?auto_26209 - SURFACE
      ?auto_26220 - PLACE
      ?auto_26225 - HOIST
      ?auto_26212 - SURFACE
      ?auto_26205 - PLACE
      ?auto_26231 - HOIST
      ?auto_26204 - SURFACE
      ?auto_26221 - PLACE
      ?auto_26215 - HOIST
      ?auto_26230 - SURFACE
      ?auto_26213 - SURFACE
      ?auto_26208 - PLACE
      ?auto_26239 - HOIST
      ?auto_26203 - SURFACE
      ?auto_26233 - PLACE
      ?auto_26214 - HOIST
      ?auto_26236 - SURFACE
      ?auto_26222 - PLACE
      ?auto_26219 - HOIST
      ?auto_26211 - SURFACE
      ?auto_26199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26197 ?auto_26201 ) ( IS-CRATE ?auto_26195 ) ( not ( = ?auto_26202 ?auto_26201 ) ) ( HOIST-AT ?auto_26200 ?auto_26202 ) ( AVAILABLE ?auto_26200 ) ( SURFACE-AT ?auto_26195 ?auto_26202 ) ( ON ?auto_26195 ?auto_26198 ) ( CLEAR ?auto_26195 ) ( not ( = ?auto_26196 ?auto_26195 ) ) ( not ( = ?auto_26196 ?auto_26198 ) ) ( not ( = ?auto_26195 ?auto_26198 ) ) ( not ( = ?auto_26197 ?auto_26200 ) ) ( IS-CRATE ?auto_26196 ) ( not ( = ?auto_26210 ?auto_26201 ) ) ( HOIST-AT ?auto_26235 ?auto_26210 ) ( SURFACE-AT ?auto_26196 ?auto_26210 ) ( ON ?auto_26196 ?auto_26224 ) ( CLEAR ?auto_26196 ) ( not ( = ?auto_26193 ?auto_26196 ) ) ( not ( = ?auto_26193 ?auto_26224 ) ) ( not ( = ?auto_26196 ?auto_26224 ) ) ( not ( = ?auto_26197 ?auto_26235 ) ) ( IS-CRATE ?auto_26193 ) ( not ( = ?auto_26243 ?auto_26201 ) ) ( HOIST-AT ?auto_26240 ?auto_26243 ) ( AVAILABLE ?auto_26240 ) ( SURFACE-AT ?auto_26193 ?auto_26243 ) ( ON ?auto_26193 ?auto_26229 ) ( CLEAR ?auto_26193 ) ( not ( = ?auto_26194 ?auto_26193 ) ) ( not ( = ?auto_26194 ?auto_26229 ) ) ( not ( = ?auto_26193 ?auto_26229 ) ) ( not ( = ?auto_26197 ?auto_26240 ) ) ( IS-CRATE ?auto_26194 ) ( not ( = ?auto_26206 ?auto_26201 ) ) ( HOIST-AT ?auto_26237 ?auto_26206 ) ( AVAILABLE ?auto_26237 ) ( SURFACE-AT ?auto_26194 ?auto_26206 ) ( ON ?auto_26194 ?auto_26207 ) ( CLEAR ?auto_26194 ) ( not ( = ?auto_26192 ?auto_26194 ) ) ( not ( = ?auto_26192 ?auto_26207 ) ) ( not ( = ?auto_26194 ?auto_26207 ) ) ( not ( = ?auto_26197 ?auto_26237 ) ) ( IS-CRATE ?auto_26192 ) ( not ( = ?auto_26223 ?auto_26201 ) ) ( HOIST-AT ?auto_26228 ?auto_26223 ) ( AVAILABLE ?auto_26228 ) ( SURFACE-AT ?auto_26192 ?auto_26223 ) ( ON ?auto_26192 ?auto_26226 ) ( CLEAR ?auto_26192 ) ( not ( = ?auto_26191 ?auto_26192 ) ) ( not ( = ?auto_26191 ?auto_26226 ) ) ( not ( = ?auto_26192 ?auto_26226 ) ) ( not ( = ?auto_26197 ?auto_26228 ) ) ( IS-CRATE ?auto_26191 ) ( not ( = ?auto_26241 ?auto_26201 ) ) ( HOIST-AT ?auto_26232 ?auto_26241 ) ( SURFACE-AT ?auto_26191 ?auto_26241 ) ( ON ?auto_26191 ?auto_26217 ) ( CLEAR ?auto_26191 ) ( not ( = ?auto_26190 ?auto_26191 ) ) ( not ( = ?auto_26190 ?auto_26217 ) ) ( not ( = ?auto_26191 ?auto_26217 ) ) ( not ( = ?auto_26197 ?auto_26232 ) ) ( IS-CRATE ?auto_26190 ) ( AVAILABLE ?auto_26232 ) ( SURFACE-AT ?auto_26190 ?auto_26241 ) ( ON ?auto_26190 ?auto_26218 ) ( CLEAR ?auto_26190 ) ( not ( = ?auto_26189 ?auto_26190 ) ) ( not ( = ?auto_26189 ?auto_26218 ) ) ( not ( = ?auto_26190 ?auto_26218 ) ) ( IS-CRATE ?auto_26189 ) ( not ( = ?auto_26238 ?auto_26201 ) ) ( HOIST-AT ?auto_26216 ?auto_26238 ) ( AVAILABLE ?auto_26216 ) ( SURFACE-AT ?auto_26189 ?auto_26238 ) ( ON ?auto_26189 ?auto_26234 ) ( CLEAR ?auto_26189 ) ( not ( = ?auto_26188 ?auto_26189 ) ) ( not ( = ?auto_26188 ?auto_26234 ) ) ( not ( = ?auto_26189 ?auto_26234 ) ) ( not ( = ?auto_26197 ?auto_26216 ) ) ( IS-CRATE ?auto_26188 ) ( not ( = ?auto_26242 ?auto_26201 ) ) ( HOIST-AT ?auto_26227 ?auto_26242 ) ( AVAILABLE ?auto_26227 ) ( SURFACE-AT ?auto_26188 ?auto_26242 ) ( ON ?auto_26188 ?auto_26209 ) ( CLEAR ?auto_26188 ) ( not ( = ?auto_26187 ?auto_26188 ) ) ( not ( = ?auto_26187 ?auto_26209 ) ) ( not ( = ?auto_26188 ?auto_26209 ) ) ( not ( = ?auto_26197 ?auto_26227 ) ) ( IS-CRATE ?auto_26187 ) ( not ( = ?auto_26220 ?auto_26201 ) ) ( HOIST-AT ?auto_26225 ?auto_26220 ) ( AVAILABLE ?auto_26225 ) ( SURFACE-AT ?auto_26187 ?auto_26220 ) ( ON ?auto_26187 ?auto_26212 ) ( CLEAR ?auto_26187 ) ( not ( = ?auto_26186 ?auto_26187 ) ) ( not ( = ?auto_26186 ?auto_26212 ) ) ( not ( = ?auto_26187 ?auto_26212 ) ) ( not ( = ?auto_26197 ?auto_26225 ) ) ( IS-CRATE ?auto_26186 ) ( not ( = ?auto_26205 ?auto_26201 ) ) ( HOIST-AT ?auto_26231 ?auto_26205 ) ( AVAILABLE ?auto_26231 ) ( SURFACE-AT ?auto_26186 ?auto_26205 ) ( ON ?auto_26186 ?auto_26204 ) ( CLEAR ?auto_26186 ) ( not ( = ?auto_26185 ?auto_26186 ) ) ( not ( = ?auto_26185 ?auto_26204 ) ) ( not ( = ?auto_26186 ?auto_26204 ) ) ( not ( = ?auto_26197 ?auto_26231 ) ) ( IS-CRATE ?auto_26185 ) ( not ( = ?auto_26221 ?auto_26201 ) ) ( HOIST-AT ?auto_26215 ?auto_26221 ) ( AVAILABLE ?auto_26215 ) ( SURFACE-AT ?auto_26185 ?auto_26221 ) ( ON ?auto_26185 ?auto_26230 ) ( CLEAR ?auto_26185 ) ( not ( = ?auto_26184 ?auto_26185 ) ) ( not ( = ?auto_26184 ?auto_26230 ) ) ( not ( = ?auto_26185 ?auto_26230 ) ) ( not ( = ?auto_26197 ?auto_26215 ) ) ( IS-CRATE ?auto_26184 ) ( AVAILABLE ?auto_26235 ) ( SURFACE-AT ?auto_26184 ?auto_26210 ) ( ON ?auto_26184 ?auto_26213 ) ( CLEAR ?auto_26184 ) ( not ( = ?auto_26183 ?auto_26184 ) ) ( not ( = ?auto_26183 ?auto_26213 ) ) ( not ( = ?auto_26184 ?auto_26213 ) ) ( IS-CRATE ?auto_26183 ) ( not ( = ?auto_26208 ?auto_26201 ) ) ( HOIST-AT ?auto_26239 ?auto_26208 ) ( AVAILABLE ?auto_26239 ) ( SURFACE-AT ?auto_26183 ?auto_26208 ) ( ON ?auto_26183 ?auto_26203 ) ( CLEAR ?auto_26183 ) ( not ( = ?auto_26182 ?auto_26183 ) ) ( not ( = ?auto_26182 ?auto_26203 ) ) ( not ( = ?auto_26183 ?auto_26203 ) ) ( not ( = ?auto_26197 ?auto_26239 ) ) ( IS-CRATE ?auto_26182 ) ( not ( = ?auto_26233 ?auto_26201 ) ) ( HOIST-AT ?auto_26214 ?auto_26233 ) ( AVAILABLE ?auto_26214 ) ( SURFACE-AT ?auto_26182 ?auto_26233 ) ( ON ?auto_26182 ?auto_26236 ) ( CLEAR ?auto_26182 ) ( not ( = ?auto_26181 ?auto_26182 ) ) ( not ( = ?auto_26181 ?auto_26236 ) ) ( not ( = ?auto_26182 ?auto_26236 ) ) ( not ( = ?auto_26197 ?auto_26214 ) ) ( SURFACE-AT ?auto_26180 ?auto_26201 ) ( CLEAR ?auto_26180 ) ( IS-CRATE ?auto_26181 ) ( AVAILABLE ?auto_26197 ) ( not ( = ?auto_26222 ?auto_26201 ) ) ( HOIST-AT ?auto_26219 ?auto_26222 ) ( AVAILABLE ?auto_26219 ) ( SURFACE-AT ?auto_26181 ?auto_26222 ) ( ON ?auto_26181 ?auto_26211 ) ( CLEAR ?auto_26181 ) ( TRUCK-AT ?auto_26199 ?auto_26201 ) ( not ( = ?auto_26180 ?auto_26181 ) ) ( not ( = ?auto_26180 ?auto_26211 ) ) ( not ( = ?auto_26181 ?auto_26211 ) ) ( not ( = ?auto_26197 ?auto_26219 ) ) ( not ( = ?auto_26180 ?auto_26182 ) ) ( not ( = ?auto_26180 ?auto_26236 ) ) ( not ( = ?auto_26182 ?auto_26211 ) ) ( not ( = ?auto_26233 ?auto_26222 ) ) ( not ( = ?auto_26214 ?auto_26219 ) ) ( not ( = ?auto_26236 ?auto_26211 ) ) ( not ( = ?auto_26180 ?auto_26183 ) ) ( not ( = ?auto_26180 ?auto_26203 ) ) ( not ( = ?auto_26181 ?auto_26183 ) ) ( not ( = ?auto_26181 ?auto_26203 ) ) ( not ( = ?auto_26183 ?auto_26236 ) ) ( not ( = ?auto_26183 ?auto_26211 ) ) ( not ( = ?auto_26208 ?auto_26233 ) ) ( not ( = ?auto_26208 ?auto_26222 ) ) ( not ( = ?auto_26239 ?auto_26214 ) ) ( not ( = ?auto_26239 ?auto_26219 ) ) ( not ( = ?auto_26203 ?auto_26236 ) ) ( not ( = ?auto_26203 ?auto_26211 ) ) ( not ( = ?auto_26180 ?auto_26184 ) ) ( not ( = ?auto_26180 ?auto_26213 ) ) ( not ( = ?auto_26181 ?auto_26184 ) ) ( not ( = ?auto_26181 ?auto_26213 ) ) ( not ( = ?auto_26182 ?auto_26184 ) ) ( not ( = ?auto_26182 ?auto_26213 ) ) ( not ( = ?auto_26184 ?auto_26203 ) ) ( not ( = ?auto_26184 ?auto_26236 ) ) ( not ( = ?auto_26184 ?auto_26211 ) ) ( not ( = ?auto_26210 ?auto_26208 ) ) ( not ( = ?auto_26210 ?auto_26233 ) ) ( not ( = ?auto_26210 ?auto_26222 ) ) ( not ( = ?auto_26235 ?auto_26239 ) ) ( not ( = ?auto_26235 ?auto_26214 ) ) ( not ( = ?auto_26235 ?auto_26219 ) ) ( not ( = ?auto_26213 ?auto_26203 ) ) ( not ( = ?auto_26213 ?auto_26236 ) ) ( not ( = ?auto_26213 ?auto_26211 ) ) ( not ( = ?auto_26180 ?auto_26185 ) ) ( not ( = ?auto_26180 ?auto_26230 ) ) ( not ( = ?auto_26181 ?auto_26185 ) ) ( not ( = ?auto_26181 ?auto_26230 ) ) ( not ( = ?auto_26182 ?auto_26185 ) ) ( not ( = ?auto_26182 ?auto_26230 ) ) ( not ( = ?auto_26183 ?auto_26185 ) ) ( not ( = ?auto_26183 ?auto_26230 ) ) ( not ( = ?auto_26185 ?auto_26213 ) ) ( not ( = ?auto_26185 ?auto_26203 ) ) ( not ( = ?auto_26185 ?auto_26236 ) ) ( not ( = ?auto_26185 ?auto_26211 ) ) ( not ( = ?auto_26221 ?auto_26210 ) ) ( not ( = ?auto_26221 ?auto_26208 ) ) ( not ( = ?auto_26221 ?auto_26233 ) ) ( not ( = ?auto_26221 ?auto_26222 ) ) ( not ( = ?auto_26215 ?auto_26235 ) ) ( not ( = ?auto_26215 ?auto_26239 ) ) ( not ( = ?auto_26215 ?auto_26214 ) ) ( not ( = ?auto_26215 ?auto_26219 ) ) ( not ( = ?auto_26230 ?auto_26213 ) ) ( not ( = ?auto_26230 ?auto_26203 ) ) ( not ( = ?auto_26230 ?auto_26236 ) ) ( not ( = ?auto_26230 ?auto_26211 ) ) ( not ( = ?auto_26180 ?auto_26186 ) ) ( not ( = ?auto_26180 ?auto_26204 ) ) ( not ( = ?auto_26181 ?auto_26186 ) ) ( not ( = ?auto_26181 ?auto_26204 ) ) ( not ( = ?auto_26182 ?auto_26186 ) ) ( not ( = ?auto_26182 ?auto_26204 ) ) ( not ( = ?auto_26183 ?auto_26186 ) ) ( not ( = ?auto_26183 ?auto_26204 ) ) ( not ( = ?auto_26184 ?auto_26186 ) ) ( not ( = ?auto_26184 ?auto_26204 ) ) ( not ( = ?auto_26186 ?auto_26230 ) ) ( not ( = ?auto_26186 ?auto_26213 ) ) ( not ( = ?auto_26186 ?auto_26203 ) ) ( not ( = ?auto_26186 ?auto_26236 ) ) ( not ( = ?auto_26186 ?auto_26211 ) ) ( not ( = ?auto_26205 ?auto_26221 ) ) ( not ( = ?auto_26205 ?auto_26210 ) ) ( not ( = ?auto_26205 ?auto_26208 ) ) ( not ( = ?auto_26205 ?auto_26233 ) ) ( not ( = ?auto_26205 ?auto_26222 ) ) ( not ( = ?auto_26231 ?auto_26215 ) ) ( not ( = ?auto_26231 ?auto_26235 ) ) ( not ( = ?auto_26231 ?auto_26239 ) ) ( not ( = ?auto_26231 ?auto_26214 ) ) ( not ( = ?auto_26231 ?auto_26219 ) ) ( not ( = ?auto_26204 ?auto_26230 ) ) ( not ( = ?auto_26204 ?auto_26213 ) ) ( not ( = ?auto_26204 ?auto_26203 ) ) ( not ( = ?auto_26204 ?auto_26236 ) ) ( not ( = ?auto_26204 ?auto_26211 ) ) ( not ( = ?auto_26180 ?auto_26187 ) ) ( not ( = ?auto_26180 ?auto_26212 ) ) ( not ( = ?auto_26181 ?auto_26187 ) ) ( not ( = ?auto_26181 ?auto_26212 ) ) ( not ( = ?auto_26182 ?auto_26187 ) ) ( not ( = ?auto_26182 ?auto_26212 ) ) ( not ( = ?auto_26183 ?auto_26187 ) ) ( not ( = ?auto_26183 ?auto_26212 ) ) ( not ( = ?auto_26184 ?auto_26187 ) ) ( not ( = ?auto_26184 ?auto_26212 ) ) ( not ( = ?auto_26185 ?auto_26187 ) ) ( not ( = ?auto_26185 ?auto_26212 ) ) ( not ( = ?auto_26187 ?auto_26204 ) ) ( not ( = ?auto_26187 ?auto_26230 ) ) ( not ( = ?auto_26187 ?auto_26213 ) ) ( not ( = ?auto_26187 ?auto_26203 ) ) ( not ( = ?auto_26187 ?auto_26236 ) ) ( not ( = ?auto_26187 ?auto_26211 ) ) ( not ( = ?auto_26220 ?auto_26205 ) ) ( not ( = ?auto_26220 ?auto_26221 ) ) ( not ( = ?auto_26220 ?auto_26210 ) ) ( not ( = ?auto_26220 ?auto_26208 ) ) ( not ( = ?auto_26220 ?auto_26233 ) ) ( not ( = ?auto_26220 ?auto_26222 ) ) ( not ( = ?auto_26225 ?auto_26231 ) ) ( not ( = ?auto_26225 ?auto_26215 ) ) ( not ( = ?auto_26225 ?auto_26235 ) ) ( not ( = ?auto_26225 ?auto_26239 ) ) ( not ( = ?auto_26225 ?auto_26214 ) ) ( not ( = ?auto_26225 ?auto_26219 ) ) ( not ( = ?auto_26212 ?auto_26204 ) ) ( not ( = ?auto_26212 ?auto_26230 ) ) ( not ( = ?auto_26212 ?auto_26213 ) ) ( not ( = ?auto_26212 ?auto_26203 ) ) ( not ( = ?auto_26212 ?auto_26236 ) ) ( not ( = ?auto_26212 ?auto_26211 ) ) ( not ( = ?auto_26180 ?auto_26188 ) ) ( not ( = ?auto_26180 ?auto_26209 ) ) ( not ( = ?auto_26181 ?auto_26188 ) ) ( not ( = ?auto_26181 ?auto_26209 ) ) ( not ( = ?auto_26182 ?auto_26188 ) ) ( not ( = ?auto_26182 ?auto_26209 ) ) ( not ( = ?auto_26183 ?auto_26188 ) ) ( not ( = ?auto_26183 ?auto_26209 ) ) ( not ( = ?auto_26184 ?auto_26188 ) ) ( not ( = ?auto_26184 ?auto_26209 ) ) ( not ( = ?auto_26185 ?auto_26188 ) ) ( not ( = ?auto_26185 ?auto_26209 ) ) ( not ( = ?auto_26186 ?auto_26188 ) ) ( not ( = ?auto_26186 ?auto_26209 ) ) ( not ( = ?auto_26188 ?auto_26212 ) ) ( not ( = ?auto_26188 ?auto_26204 ) ) ( not ( = ?auto_26188 ?auto_26230 ) ) ( not ( = ?auto_26188 ?auto_26213 ) ) ( not ( = ?auto_26188 ?auto_26203 ) ) ( not ( = ?auto_26188 ?auto_26236 ) ) ( not ( = ?auto_26188 ?auto_26211 ) ) ( not ( = ?auto_26242 ?auto_26220 ) ) ( not ( = ?auto_26242 ?auto_26205 ) ) ( not ( = ?auto_26242 ?auto_26221 ) ) ( not ( = ?auto_26242 ?auto_26210 ) ) ( not ( = ?auto_26242 ?auto_26208 ) ) ( not ( = ?auto_26242 ?auto_26233 ) ) ( not ( = ?auto_26242 ?auto_26222 ) ) ( not ( = ?auto_26227 ?auto_26225 ) ) ( not ( = ?auto_26227 ?auto_26231 ) ) ( not ( = ?auto_26227 ?auto_26215 ) ) ( not ( = ?auto_26227 ?auto_26235 ) ) ( not ( = ?auto_26227 ?auto_26239 ) ) ( not ( = ?auto_26227 ?auto_26214 ) ) ( not ( = ?auto_26227 ?auto_26219 ) ) ( not ( = ?auto_26209 ?auto_26212 ) ) ( not ( = ?auto_26209 ?auto_26204 ) ) ( not ( = ?auto_26209 ?auto_26230 ) ) ( not ( = ?auto_26209 ?auto_26213 ) ) ( not ( = ?auto_26209 ?auto_26203 ) ) ( not ( = ?auto_26209 ?auto_26236 ) ) ( not ( = ?auto_26209 ?auto_26211 ) ) ( not ( = ?auto_26180 ?auto_26189 ) ) ( not ( = ?auto_26180 ?auto_26234 ) ) ( not ( = ?auto_26181 ?auto_26189 ) ) ( not ( = ?auto_26181 ?auto_26234 ) ) ( not ( = ?auto_26182 ?auto_26189 ) ) ( not ( = ?auto_26182 ?auto_26234 ) ) ( not ( = ?auto_26183 ?auto_26189 ) ) ( not ( = ?auto_26183 ?auto_26234 ) ) ( not ( = ?auto_26184 ?auto_26189 ) ) ( not ( = ?auto_26184 ?auto_26234 ) ) ( not ( = ?auto_26185 ?auto_26189 ) ) ( not ( = ?auto_26185 ?auto_26234 ) ) ( not ( = ?auto_26186 ?auto_26189 ) ) ( not ( = ?auto_26186 ?auto_26234 ) ) ( not ( = ?auto_26187 ?auto_26189 ) ) ( not ( = ?auto_26187 ?auto_26234 ) ) ( not ( = ?auto_26189 ?auto_26209 ) ) ( not ( = ?auto_26189 ?auto_26212 ) ) ( not ( = ?auto_26189 ?auto_26204 ) ) ( not ( = ?auto_26189 ?auto_26230 ) ) ( not ( = ?auto_26189 ?auto_26213 ) ) ( not ( = ?auto_26189 ?auto_26203 ) ) ( not ( = ?auto_26189 ?auto_26236 ) ) ( not ( = ?auto_26189 ?auto_26211 ) ) ( not ( = ?auto_26238 ?auto_26242 ) ) ( not ( = ?auto_26238 ?auto_26220 ) ) ( not ( = ?auto_26238 ?auto_26205 ) ) ( not ( = ?auto_26238 ?auto_26221 ) ) ( not ( = ?auto_26238 ?auto_26210 ) ) ( not ( = ?auto_26238 ?auto_26208 ) ) ( not ( = ?auto_26238 ?auto_26233 ) ) ( not ( = ?auto_26238 ?auto_26222 ) ) ( not ( = ?auto_26216 ?auto_26227 ) ) ( not ( = ?auto_26216 ?auto_26225 ) ) ( not ( = ?auto_26216 ?auto_26231 ) ) ( not ( = ?auto_26216 ?auto_26215 ) ) ( not ( = ?auto_26216 ?auto_26235 ) ) ( not ( = ?auto_26216 ?auto_26239 ) ) ( not ( = ?auto_26216 ?auto_26214 ) ) ( not ( = ?auto_26216 ?auto_26219 ) ) ( not ( = ?auto_26234 ?auto_26209 ) ) ( not ( = ?auto_26234 ?auto_26212 ) ) ( not ( = ?auto_26234 ?auto_26204 ) ) ( not ( = ?auto_26234 ?auto_26230 ) ) ( not ( = ?auto_26234 ?auto_26213 ) ) ( not ( = ?auto_26234 ?auto_26203 ) ) ( not ( = ?auto_26234 ?auto_26236 ) ) ( not ( = ?auto_26234 ?auto_26211 ) ) ( not ( = ?auto_26180 ?auto_26190 ) ) ( not ( = ?auto_26180 ?auto_26218 ) ) ( not ( = ?auto_26181 ?auto_26190 ) ) ( not ( = ?auto_26181 ?auto_26218 ) ) ( not ( = ?auto_26182 ?auto_26190 ) ) ( not ( = ?auto_26182 ?auto_26218 ) ) ( not ( = ?auto_26183 ?auto_26190 ) ) ( not ( = ?auto_26183 ?auto_26218 ) ) ( not ( = ?auto_26184 ?auto_26190 ) ) ( not ( = ?auto_26184 ?auto_26218 ) ) ( not ( = ?auto_26185 ?auto_26190 ) ) ( not ( = ?auto_26185 ?auto_26218 ) ) ( not ( = ?auto_26186 ?auto_26190 ) ) ( not ( = ?auto_26186 ?auto_26218 ) ) ( not ( = ?auto_26187 ?auto_26190 ) ) ( not ( = ?auto_26187 ?auto_26218 ) ) ( not ( = ?auto_26188 ?auto_26190 ) ) ( not ( = ?auto_26188 ?auto_26218 ) ) ( not ( = ?auto_26190 ?auto_26234 ) ) ( not ( = ?auto_26190 ?auto_26209 ) ) ( not ( = ?auto_26190 ?auto_26212 ) ) ( not ( = ?auto_26190 ?auto_26204 ) ) ( not ( = ?auto_26190 ?auto_26230 ) ) ( not ( = ?auto_26190 ?auto_26213 ) ) ( not ( = ?auto_26190 ?auto_26203 ) ) ( not ( = ?auto_26190 ?auto_26236 ) ) ( not ( = ?auto_26190 ?auto_26211 ) ) ( not ( = ?auto_26241 ?auto_26238 ) ) ( not ( = ?auto_26241 ?auto_26242 ) ) ( not ( = ?auto_26241 ?auto_26220 ) ) ( not ( = ?auto_26241 ?auto_26205 ) ) ( not ( = ?auto_26241 ?auto_26221 ) ) ( not ( = ?auto_26241 ?auto_26210 ) ) ( not ( = ?auto_26241 ?auto_26208 ) ) ( not ( = ?auto_26241 ?auto_26233 ) ) ( not ( = ?auto_26241 ?auto_26222 ) ) ( not ( = ?auto_26232 ?auto_26216 ) ) ( not ( = ?auto_26232 ?auto_26227 ) ) ( not ( = ?auto_26232 ?auto_26225 ) ) ( not ( = ?auto_26232 ?auto_26231 ) ) ( not ( = ?auto_26232 ?auto_26215 ) ) ( not ( = ?auto_26232 ?auto_26235 ) ) ( not ( = ?auto_26232 ?auto_26239 ) ) ( not ( = ?auto_26232 ?auto_26214 ) ) ( not ( = ?auto_26232 ?auto_26219 ) ) ( not ( = ?auto_26218 ?auto_26234 ) ) ( not ( = ?auto_26218 ?auto_26209 ) ) ( not ( = ?auto_26218 ?auto_26212 ) ) ( not ( = ?auto_26218 ?auto_26204 ) ) ( not ( = ?auto_26218 ?auto_26230 ) ) ( not ( = ?auto_26218 ?auto_26213 ) ) ( not ( = ?auto_26218 ?auto_26203 ) ) ( not ( = ?auto_26218 ?auto_26236 ) ) ( not ( = ?auto_26218 ?auto_26211 ) ) ( not ( = ?auto_26180 ?auto_26191 ) ) ( not ( = ?auto_26180 ?auto_26217 ) ) ( not ( = ?auto_26181 ?auto_26191 ) ) ( not ( = ?auto_26181 ?auto_26217 ) ) ( not ( = ?auto_26182 ?auto_26191 ) ) ( not ( = ?auto_26182 ?auto_26217 ) ) ( not ( = ?auto_26183 ?auto_26191 ) ) ( not ( = ?auto_26183 ?auto_26217 ) ) ( not ( = ?auto_26184 ?auto_26191 ) ) ( not ( = ?auto_26184 ?auto_26217 ) ) ( not ( = ?auto_26185 ?auto_26191 ) ) ( not ( = ?auto_26185 ?auto_26217 ) ) ( not ( = ?auto_26186 ?auto_26191 ) ) ( not ( = ?auto_26186 ?auto_26217 ) ) ( not ( = ?auto_26187 ?auto_26191 ) ) ( not ( = ?auto_26187 ?auto_26217 ) ) ( not ( = ?auto_26188 ?auto_26191 ) ) ( not ( = ?auto_26188 ?auto_26217 ) ) ( not ( = ?auto_26189 ?auto_26191 ) ) ( not ( = ?auto_26189 ?auto_26217 ) ) ( not ( = ?auto_26191 ?auto_26218 ) ) ( not ( = ?auto_26191 ?auto_26234 ) ) ( not ( = ?auto_26191 ?auto_26209 ) ) ( not ( = ?auto_26191 ?auto_26212 ) ) ( not ( = ?auto_26191 ?auto_26204 ) ) ( not ( = ?auto_26191 ?auto_26230 ) ) ( not ( = ?auto_26191 ?auto_26213 ) ) ( not ( = ?auto_26191 ?auto_26203 ) ) ( not ( = ?auto_26191 ?auto_26236 ) ) ( not ( = ?auto_26191 ?auto_26211 ) ) ( not ( = ?auto_26217 ?auto_26218 ) ) ( not ( = ?auto_26217 ?auto_26234 ) ) ( not ( = ?auto_26217 ?auto_26209 ) ) ( not ( = ?auto_26217 ?auto_26212 ) ) ( not ( = ?auto_26217 ?auto_26204 ) ) ( not ( = ?auto_26217 ?auto_26230 ) ) ( not ( = ?auto_26217 ?auto_26213 ) ) ( not ( = ?auto_26217 ?auto_26203 ) ) ( not ( = ?auto_26217 ?auto_26236 ) ) ( not ( = ?auto_26217 ?auto_26211 ) ) ( not ( = ?auto_26180 ?auto_26192 ) ) ( not ( = ?auto_26180 ?auto_26226 ) ) ( not ( = ?auto_26181 ?auto_26192 ) ) ( not ( = ?auto_26181 ?auto_26226 ) ) ( not ( = ?auto_26182 ?auto_26192 ) ) ( not ( = ?auto_26182 ?auto_26226 ) ) ( not ( = ?auto_26183 ?auto_26192 ) ) ( not ( = ?auto_26183 ?auto_26226 ) ) ( not ( = ?auto_26184 ?auto_26192 ) ) ( not ( = ?auto_26184 ?auto_26226 ) ) ( not ( = ?auto_26185 ?auto_26192 ) ) ( not ( = ?auto_26185 ?auto_26226 ) ) ( not ( = ?auto_26186 ?auto_26192 ) ) ( not ( = ?auto_26186 ?auto_26226 ) ) ( not ( = ?auto_26187 ?auto_26192 ) ) ( not ( = ?auto_26187 ?auto_26226 ) ) ( not ( = ?auto_26188 ?auto_26192 ) ) ( not ( = ?auto_26188 ?auto_26226 ) ) ( not ( = ?auto_26189 ?auto_26192 ) ) ( not ( = ?auto_26189 ?auto_26226 ) ) ( not ( = ?auto_26190 ?auto_26192 ) ) ( not ( = ?auto_26190 ?auto_26226 ) ) ( not ( = ?auto_26192 ?auto_26217 ) ) ( not ( = ?auto_26192 ?auto_26218 ) ) ( not ( = ?auto_26192 ?auto_26234 ) ) ( not ( = ?auto_26192 ?auto_26209 ) ) ( not ( = ?auto_26192 ?auto_26212 ) ) ( not ( = ?auto_26192 ?auto_26204 ) ) ( not ( = ?auto_26192 ?auto_26230 ) ) ( not ( = ?auto_26192 ?auto_26213 ) ) ( not ( = ?auto_26192 ?auto_26203 ) ) ( not ( = ?auto_26192 ?auto_26236 ) ) ( not ( = ?auto_26192 ?auto_26211 ) ) ( not ( = ?auto_26223 ?auto_26241 ) ) ( not ( = ?auto_26223 ?auto_26238 ) ) ( not ( = ?auto_26223 ?auto_26242 ) ) ( not ( = ?auto_26223 ?auto_26220 ) ) ( not ( = ?auto_26223 ?auto_26205 ) ) ( not ( = ?auto_26223 ?auto_26221 ) ) ( not ( = ?auto_26223 ?auto_26210 ) ) ( not ( = ?auto_26223 ?auto_26208 ) ) ( not ( = ?auto_26223 ?auto_26233 ) ) ( not ( = ?auto_26223 ?auto_26222 ) ) ( not ( = ?auto_26228 ?auto_26232 ) ) ( not ( = ?auto_26228 ?auto_26216 ) ) ( not ( = ?auto_26228 ?auto_26227 ) ) ( not ( = ?auto_26228 ?auto_26225 ) ) ( not ( = ?auto_26228 ?auto_26231 ) ) ( not ( = ?auto_26228 ?auto_26215 ) ) ( not ( = ?auto_26228 ?auto_26235 ) ) ( not ( = ?auto_26228 ?auto_26239 ) ) ( not ( = ?auto_26228 ?auto_26214 ) ) ( not ( = ?auto_26228 ?auto_26219 ) ) ( not ( = ?auto_26226 ?auto_26217 ) ) ( not ( = ?auto_26226 ?auto_26218 ) ) ( not ( = ?auto_26226 ?auto_26234 ) ) ( not ( = ?auto_26226 ?auto_26209 ) ) ( not ( = ?auto_26226 ?auto_26212 ) ) ( not ( = ?auto_26226 ?auto_26204 ) ) ( not ( = ?auto_26226 ?auto_26230 ) ) ( not ( = ?auto_26226 ?auto_26213 ) ) ( not ( = ?auto_26226 ?auto_26203 ) ) ( not ( = ?auto_26226 ?auto_26236 ) ) ( not ( = ?auto_26226 ?auto_26211 ) ) ( not ( = ?auto_26180 ?auto_26194 ) ) ( not ( = ?auto_26180 ?auto_26207 ) ) ( not ( = ?auto_26181 ?auto_26194 ) ) ( not ( = ?auto_26181 ?auto_26207 ) ) ( not ( = ?auto_26182 ?auto_26194 ) ) ( not ( = ?auto_26182 ?auto_26207 ) ) ( not ( = ?auto_26183 ?auto_26194 ) ) ( not ( = ?auto_26183 ?auto_26207 ) ) ( not ( = ?auto_26184 ?auto_26194 ) ) ( not ( = ?auto_26184 ?auto_26207 ) ) ( not ( = ?auto_26185 ?auto_26194 ) ) ( not ( = ?auto_26185 ?auto_26207 ) ) ( not ( = ?auto_26186 ?auto_26194 ) ) ( not ( = ?auto_26186 ?auto_26207 ) ) ( not ( = ?auto_26187 ?auto_26194 ) ) ( not ( = ?auto_26187 ?auto_26207 ) ) ( not ( = ?auto_26188 ?auto_26194 ) ) ( not ( = ?auto_26188 ?auto_26207 ) ) ( not ( = ?auto_26189 ?auto_26194 ) ) ( not ( = ?auto_26189 ?auto_26207 ) ) ( not ( = ?auto_26190 ?auto_26194 ) ) ( not ( = ?auto_26190 ?auto_26207 ) ) ( not ( = ?auto_26191 ?auto_26194 ) ) ( not ( = ?auto_26191 ?auto_26207 ) ) ( not ( = ?auto_26194 ?auto_26226 ) ) ( not ( = ?auto_26194 ?auto_26217 ) ) ( not ( = ?auto_26194 ?auto_26218 ) ) ( not ( = ?auto_26194 ?auto_26234 ) ) ( not ( = ?auto_26194 ?auto_26209 ) ) ( not ( = ?auto_26194 ?auto_26212 ) ) ( not ( = ?auto_26194 ?auto_26204 ) ) ( not ( = ?auto_26194 ?auto_26230 ) ) ( not ( = ?auto_26194 ?auto_26213 ) ) ( not ( = ?auto_26194 ?auto_26203 ) ) ( not ( = ?auto_26194 ?auto_26236 ) ) ( not ( = ?auto_26194 ?auto_26211 ) ) ( not ( = ?auto_26206 ?auto_26223 ) ) ( not ( = ?auto_26206 ?auto_26241 ) ) ( not ( = ?auto_26206 ?auto_26238 ) ) ( not ( = ?auto_26206 ?auto_26242 ) ) ( not ( = ?auto_26206 ?auto_26220 ) ) ( not ( = ?auto_26206 ?auto_26205 ) ) ( not ( = ?auto_26206 ?auto_26221 ) ) ( not ( = ?auto_26206 ?auto_26210 ) ) ( not ( = ?auto_26206 ?auto_26208 ) ) ( not ( = ?auto_26206 ?auto_26233 ) ) ( not ( = ?auto_26206 ?auto_26222 ) ) ( not ( = ?auto_26237 ?auto_26228 ) ) ( not ( = ?auto_26237 ?auto_26232 ) ) ( not ( = ?auto_26237 ?auto_26216 ) ) ( not ( = ?auto_26237 ?auto_26227 ) ) ( not ( = ?auto_26237 ?auto_26225 ) ) ( not ( = ?auto_26237 ?auto_26231 ) ) ( not ( = ?auto_26237 ?auto_26215 ) ) ( not ( = ?auto_26237 ?auto_26235 ) ) ( not ( = ?auto_26237 ?auto_26239 ) ) ( not ( = ?auto_26237 ?auto_26214 ) ) ( not ( = ?auto_26237 ?auto_26219 ) ) ( not ( = ?auto_26207 ?auto_26226 ) ) ( not ( = ?auto_26207 ?auto_26217 ) ) ( not ( = ?auto_26207 ?auto_26218 ) ) ( not ( = ?auto_26207 ?auto_26234 ) ) ( not ( = ?auto_26207 ?auto_26209 ) ) ( not ( = ?auto_26207 ?auto_26212 ) ) ( not ( = ?auto_26207 ?auto_26204 ) ) ( not ( = ?auto_26207 ?auto_26230 ) ) ( not ( = ?auto_26207 ?auto_26213 ) ) ( not ( = ?auto_26207 ?auto_26203 ) ) ( not ( = ?auto_26207 ?auto_26236 ) ) ( not ( = ?auto_26207 ?auto_26211 ) ) ( not ( = ?auto_26180 ?auto_26193 ) ) ( not ( = ?auto_26180 ?auto_26229 ) ) ( not ( = ?auto_26181 ?auto_26193 ) ) ( not ( = ?auto_26181 ?auto_26229 ) ) ( not ( = ?auto_26182 ?auto_26193 ) ) ( not ( = ?auto_26182 ?auto_26229 ) ) ( not ( = ?auto_26183 ?auto_26193 ) ) ( not ( = ?auto_26183 ?auto_26229 ) ) ( not ( = ?auto_26184 ?auto_26193 ) ) ( not ( = ?auto_26184 ?auto_26229 ) ) ( not ( = ?auto_26185 ?auto_26193 ) ) ( not ( = ?auto_26185 ?auto_26229 ) ) ( not ( = ?auto_26186 ?auto_26193 ) ) ( not ( = ?auto_26186 ?auto_26229 ) ) ( not ( = ?auto_26187 ?auto_26193 ) ) ( not ( = ?auto_26187 ?auto_26229 ) ) ( not ( = ?auto_26188 ?auto_26193 ) ) ( not ( = ?auto_26188 ?auto_26229 ) ) ( not ( = ?auto_26189 ?auto_26193 ) ) ( not ( = ?auto_26189 ?auto_26229 ) ) ( not ( = ?auto_26190 ?auto_26193 ) ) ( not ( = ?auto_26190 ?auto_26229 ) ) ( not ( = ?auto_26191 ?auto_26193 ) ) ( not ( = ?auto_26191 ?auto_26229 ) ) ( not ( = ?auto_26192 ?auto_26193 ) ) ( not ( = ?auto_26192 ?auto_26229 ) ) ( not ( = ?auto_26193 ?auto_26207 ) ) ( not ( = ?auto_26193 ?auto_26226 ) ) ( not ( = ?auto_26193 ?auto_26217 ) ) ( not ( = ?auto_26193 ?auto_26218 ) ) ( not ( = ?auto_26193 ?auto_26234 ) ) ( not ( = ?auto_26193 ?auto_26209 ) ) ( not ( = ?auto_26193 ?auto_26212 ) ) ( not ( = ?auto_26193 ?auto_26204 ) ) ( not ( = ?auto_26193 ?auto_26230 ) ) ( not ( = ?auto_26193 ?auto_26213 ) ) ( not ( = ?auto_26193 ?auto_26203 ) ) ( not ( = ?auto_26193 ?auto_26236 ) ) ( not ( = ?auto_26193 ?auto_26211 ) ) ( not ( = ?auto_26243 ?auto_26206 ) ) ( not ( = ?auto_26243 ?auto_26223 ) ) ( not ( = ?auto_26243 ?auto_26241 ) ) ( not ( = ?auto_26243 ?auto_26238 ) ) ( not ( = ?auto_26243 ?auto_26242 ) ) ( not ( = ?auto_26243 ?auto_26220 ) ) ( not ( = ?auto_26243 ?auto_26205 ) ) ( not ( = ?auto_26243 ?auto_26221 ) ) ( not ( = ?auto_26243 ?auto_26210 ) ) ( not ( = ?auto_26243 ?auto_26208 ) ) ( not ( = ?auto_26243 ?auto_26233 ) ) ( not ( = ?auto_26243 ?auto_26222 ) ) ( not ( = ?auto_26240 ?auto_26237 ) ) ( not ( = ?auto_26240 ?auto_26228 ) ) ( not ( = ?auto_26240 ?auto_26232 ) ) ( not ( = ?auto_26240 ?auto_26216 ) ) ( not ( = ?auto_26240 ?auto_26227 ) ) ( not ( = ?auto_26240 ?auto_26225 ) ) ( not ( = ?auto_26240 ?auto_26231 ) ) ( not ( = ?auto_26240 ?auto_26215 ) ) ( not ( = ?auto_26240 ?auto_26235 ) ) ( not ( = ?auto_26240 ?auto_26239 ) ) ( not ( = ?auto_26240 ?auto_26214 ) ) ( not ( = ?auto_26240 ?auto_26219 ) ) ( not ( = ?auto_26229 ?auto_26207 ) ) ( not ( = ?auto_26229 ?auto_26226 ) ) ( not ( = ?auto_26229 ?auto_26217 ) ) ( not ( = ?auto_26229 ?auto_26218 ) ) ( not ( = ?auto_26229 ?auto_26234 ) ) ( not ( = ?auto_26229 ?auto_26209 ) ) ( not ( = ?auto_26229 ?auto_26212 ) ) ( not ( = ?auto_26229 ?auto_26204 ) ) ( not ( = ?auto_26229 ?auto_26230 ) ) ( not ( = ?auto_26229 ?auto_26213 ) ) ( not ( = ?auto_26229 ?auto_26203 ) ) ( not ( = ?auto_26229 ?auto_26236 ) ) ( not ( = ?auto_26229 ?auto_26211 ) ) ( not ( = ?auto_26180 ?auto_26196 ) ) ( not ( = ?auto_26180 ?auto_26224 ) ) ( not ( = ?auto_26181 ?auto_26196 ) ) ( not ( = ?auto_26181 ?auto_26224 ) ) ( not ( = ?auto_26182 ?auto_26196 ) ) ( not ( = ?auto_26182 ?auto_26224 ) ) ( not ( = ?auto_26183 ?auto_26196 ) ) ( not ( = ?auto_26183 ?auto_26224 ) ) ( not ( = ?auto_26184 ?auto_26196 ) ) ( not ( = ?auto_26184 ?auto_26224 ) ) ( not ( = ?auto_26185 ?auto_26196 ) ) ( not ( = ?auto_26185 ?auto_26224 ) ) ( not ( = ?auto_26186 ?auto_26196 ) ) ( not ( = ?auto_26186 ?auto_26224 ) ) ( not ( = ?auto_26187 ?auto_26196 ) ) ( not ( = ?auto_26187 ?auto_26224 ) ) ( not ( = ?auto_26188 ?auto_26196 ) ) ( not ( = ?auto_26188 ?auto_26224 ) ) ( not ( = ?auto_26189 ?auto_26196 ) ) ( not ( = ?auto_26189 ?auto_26224 ) ) ( not ( = ?auto_26190 ?auto_26196 ) ) ( not ( = ?auto_26190 ?auto_26224 ) ) ( not ( = ?auto_26191 ?auto_26196 ) ) ( not ( = ?auto_26191 ?auto_26224 ) ) ( not ( = ?auto_26192 ?auto_26196 ) ) ( not ( = ?auto_26192 ?auto_26224 ) ) ( not ( = ?auto_26194 ?auto_26196 ) ) ( not ( = ?auto_26194 ?auto_26224 ) ) ( not ( = ?auto_26196 ?auto_26229 ) ) ( not ( = ?auto_26196 ?auto_26207 ) ) ( not ( = ?auto_26196 ?auto_26226 ) ) ( not ( = ?auto_26196 ?auto_26217 ) ) ( not ( = ?auto_26196 ?auto_26218 ) ) ( not ( = ?auto_26196 ?auto_26234 ) ) ( not ( = ?auto_26196 ?auto_26209 ) ) ( not ( = ?auto_26196 ?auto_26212 ) ) ( not ( = ?auto_26196 ?auto_26204 ) ) ( not ( = ?auto_26196 ?auto_26230 ) ) ( not ( = ?auto_26196 ?auto_26213 ) ) ( not ( = ?auto_26196 ?auto_26203 ) ) ( not ( = ?auto_26196 ?auto_26236 ) ) ( not ( = ?auto_26196 ?auto_26211 ) ) ( not ( = ?auto_26224 ?auto_26229 ) ) ( not ( = ?auto_26224 ?auto_26207 ) ) ( not ( = ?auto_26224 ?auto_26226 ) ) ( not ( = ?auto_26224 ?auto_26217 ) ) ( not ( = ?auto_26224 ?auto_26218 ) ) ( not ( = ?auto_26224 ?auto_26234 ) ) ( not ( = ?auto_26224 ?auto_26209 ) ) ( not ( = ?auto_26224 ?auto_26212 ) ) ( not ( = ?auto_26224 ?auto_26204 ) ) ( not ( = ?auto_26224 ?auto_26230 ) ) ( not ( = ?auto_26224 ?auto_26213 ) ) ( not ( = ?auto_26224 ?auto_26203 ) ) ( not ( = ?auto_26224 ?auto_26236 ) ) ( not ( = ?auto_26224 ?auto_26211 ) ) ( not ( = ?auto_26180 ?auto_26195 ) ) ( not ( = ?auto_26180 ?auto_26198 ) ) ( not ( = ?auto_26181 ?auto_26195 ) ) ( not ( = ?auto_26181 ?auto_26198 ) ) ( not ( = ?auto_26182 ?auto_26195 ) ) ( not ( = ?auto_26182 ?auto_26198 ) ) ( not ( = ?auto_26183 ?auto_26195 ) ) ( not ( = ?auto_26183 ?auto_26198 ) ) ( not ( = ?auto_26184 ?auto_26195 ) ) ( not ( = ?auto_26184 ?auto_26198 ) ) ( not ( = ?auto_26185 ?auto_26195 ) ) ( not ( = ?auto_26185 ?auto_26198 ) ) ( not ( = ?auto_26186 ?auto_26195 ) ) ( not ( = ?auto_26186 ?auto_26198 ) ) ( not ( = ?auto_26187 ?auto_26195 ) ) ( not ( = ?auto_26187 ?auto_26198 ) ) ( not ( = ?auto_26188 ?auto_26195 ) ) ( not ( = ?auto_26188 ?auto_26198 ) ) ( not ( = ?auto_26189 ?auto_26195 ) ) ( not ( = ?auto_26189 ?auto_26198 ) ) ( not ( = ?auto_26190 ?auto_26195 ) ) ( not ( = ?auto_26190 ?auto_26198 ) ) ( not ( = ?auto_26191 ?auto_26195 ) ) ( not ( = ?auto_26191 ?auto_26198 ) ) ( not ( = ?auto_26192 ?auto_26195 ) ) ( not ( = ?auto_26192 ?auto_26198 ) ) ( not ( = ?auto_26194 ?auto_26195 ) ) ( not ( = ?auto_26194 ?auto_26198 ) ) ( not ( = ?auto_26193 ?auto_26195 ) ) ( not ( = ?auto_26193 ?auto_26198 ) ) ( not ( = ?auto_26195 ?auto_26224 ) ) ( not ( = ?auto_26195 ?auto_26229 ) ) ( not ( = ?auto_26195 ?auto_26207 ) ) ( not ( = ?auto_26195 ?auto_26226 ) ) ( not ( = ?auto_26195 ?auto_26217 ) ) ( not ( = ?auto_26195 ?auto_26218 ) ) ( not ( = ?auto_26195 ?auto_26234 ) ) ( not ( = ?auto_26195 ?auto_26209 ) ) ( not ( = ?auto_26195 ?auto_26212 ) ) ( not ( = ?auto_26195 ?auto_26204 ) ) ( not ( = ?auto_26195 ?auto_26230 ) ) ( not ( = ?auto_26195 ?auto_26213 ) ) ( not ( = ?auto_26195 ?auto_26203 ) ) ( not ( = ?auto_26195 ?auto_26236 ) ) ( not ( = ?auto_26195 ?auto_26211 ) ) ( not ( = ?auto_26202 ?auto_26210 ) ) ( not ( = ?auto_26202 ?auto_26243 ) ) ( not ( = ?auto_26202 ?auto_26206 ) ) ( not ( = ?auto_26202 ?auto_26223 ) ) ( not ( = ?auto_26202 ?auto_26241 ) ) ( not ( = ?auto_26202 ?auto_26238 ) ) ( not ( = ?auto_26202 ?auto_26242 ) ) ( not ( = ?auto_26202 ?auto_26220 ) ) ( not ( = ?auto_26202 ?auto_26205 ) ) ( not ( = ?auto_26202 ?auto_26221 ) ) ( not ( = ?auto_26202 ?auto_26208 ) ) ( not ( = ?auto_26202 ?auto_26233 ) ) ( not ( = ?auto_26202 ?auto_26222 ) ) ( not ( = ?auto_26200 ?auto_26235 ) ) ( not ( = ?auto_26200 ?auto_26240 ) ) ( not ( = ?auto_26200 ?auto_26237 ) ) ( not ( = ?auto_26200 ?auto_26228 ) ) ( not ( = ?auto_26200 ?auto_26232 ) ) ( not ( = ?auto_26200 ?auto_26216 ) ) ( not ( = ?auto_26200 ?auto_26227 ) ) ( not ( = ?auto_26200 ?auto_26225 ) ) ( not ( = ?auto_26200 ?auto_26231 ) ) ( not ( = ?auto_26200 ?auto_26215 ) ) ( not ( = ?auto_26200 ?auto_26239 ) ) ( not ( = ?auto_26200 ?auto_26214 ) ) ( not ( = ?auto_26200 ?auto_26219 ) ) ( not ( = ?auto_26198 ?auto_26224 ) ) ( not ( = ?auto_26198 ?auto_26229 ) ) ( not ( = ?auto_26198 ?auto_26207 ) ) ( not ( = ?auto_26198 ?auto_26226 ) ) ( not ( = ?auto_26198 ?auto_26217 ) ) ( not ( = ?auto_26198 ?auto_26218 ) ) ( not ( = ?auto_26198 ?auto_26234 ) ) ( not ( = ?auto_26198 ?auto_26209 ) ) ( not ( = ?auto_26198 ?auto_26212 ) ) ( not ( = ?auto_26198 ?auto_26204 ) ) ( not ( = ?auto_26198 ?auto_26230 ) ) ( not ( = ?auto_26198 ?auto_26213 ) ) ( not ( = ?auto_26198 ?auto_26203 ) ) ( not ( = ?auto_26198 ?auto_26236 ) ) ( not ( = ?auto_26198 ?auto_26211 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_26180 ?auto_26181 ?auto_26182 ?auto_26183 ?auto_26184 ?auto_26185 ?auto_26186 ?auto_26187 ?auto_26188 ?auto_26189 ?auto_26190 ?auto_26191 ?auto_26192 ?auto_26194 ?auto_26193 ?auto_26196 )
      ( MAKE-1CRATE ?auto_26196 ?auto_26195 )
      ( MAKE-16CRATE-VERIFY ?auto_26180 ?auto_26181 ?auto_26182 ?auto_26183 ?auto_26184 ?auto_26185 ?auto_26186 ?auto_26187 ?auto_26188 ?auto_26189 ?auto_26190 ?auto_26191 ?auto_26192 ?auto_26194 ?auto_26193 ?auto_26196 ?auto_26195 ) )
  )

)

