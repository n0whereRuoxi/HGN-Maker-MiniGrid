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
      ?auto_2655348 - SURFACE
      ?auto_2655349 - SURFACE
    )
    :vars
    (
      ?auto_2655350 - HOIST
      ?auto_2655351 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655350 ?auto_2655351 ) ( SURFACE-AT ?auto_2655348 ?auto_2655351 ) ( CLEAR ?auto_2655348 ) ( LIFTING ?auto_2655350 ?auto_2655349 ) ( IS-CRATE ?auto_2655349 ) ( not ( = ?auto_2655348 ?auto_2655349 ) ) )
    :subtasks
    ( ( !DROP ?auto_2655350 ?auto_2655349 ?auto_2655348 ?auto_2655351 )
      ( MAKE-1CRATE-VERIFY ?auto_2655348 ?auto_2655349 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2655352 - SURFACE
      ?auto_2655353 - SURFACE
    )
    :vars
    (
      ?auto_2655355 - HOIST
      ?auto_2655354 - PLACE
      ?auto_2655356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655355 ?auto_2655354 ) ( SURFACE-AT ?auto_2655352 ?auto_2655354 ) ( CLEAR ?auto_2655352 ) ( IS-CRATE ?auto_2655353 ) ( not ( = ?auto_2655352 ?auto_2655353 ) ) ( TRUCK-AT ?auto_2655356 ?auto_2655354 ) ( AVAILABLE ?auto_2655355 ) ( IN ?auto_2655353 ?auto_2655356 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2655355 ?auto_2655353 ?auto_2655356 ?auto_2655354 )
      ( MAKE-1CRATE ?auto_2655352 ?auto_2655353 )
      ( MAKE-1CRATE-VERIFY ?auto_2655352 ?auto_2655353 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2655357 - SURFACE
      ?auto_2655358 - SURFACE
    )
    :vars
    (
      ?auto_2655359 - HOIST
      ?auto_2655361 - PLACE
      ?auto_2655360 - TRUCK
      ?auto_2655362 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655359 ?auto_2655361 ) ( SURFACE-AT ?auto_2655357 ?auto_2655361 ) ( CLEAR ?auto_2655357 ) ( IS-CRATE ?auto_2655358 ) ( not ( = ?auto_2655357 ?auto_2655358 ) ) ( AVAILABLE ?auto_2655359 ) ( IN ?auto_2655358 ?auto_2655360 ) ( TRUCK-AT ?auto_2655360 ?auto_2655362 ) ( not ( = ?auto_2655362 ?auto_2655361 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2655360 ?auto_2655362 ?auto_2655361 )
      ( MAKE-1CRATE ?auto_2655357 ?auto_2655358 )
      ( MAKE-1CRATE-VERIFY ?auto_2655357 ?auto_2655358 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2655363 - SURFACE
      ?auto_2655364 - SURFACE
    )
    :vars
    (
      ?auto_2655367 - HOIST
      ?auto_2655366 - PLACE
      ?auto_2655365 - TRUCK
      ?auto_2655368 - PLACE
      ?auto_2655369 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655367 ?auto_2655366 ) ( SURFACE-AT ?auto_2655363 ?auto_2655366 ) ( CLEAR ?auto_2655363 ) ( IS-CRATE ?auto_2655364 ) ( not ( = ?auto_2655363 ?auto_2655364 ) ) ( AVAILABLE ?auto_2655367 ) ( TRUCK-AT ?auto_2655365 ?auto_2655368 ) ( not ( = ?auto_2655368 ?auto_2655366 ) ) ( HOIST-AT ?auto_2655369 ?auto_2655368 ) ( LIFTING ?auto_2655369 ?auto_2655364 ) ( not ( = ?auto_2655367 ?auto_2655369 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2655369 ?auto_2655364 ?auto_2655365 ?auto_2655368 )
      ( MAKE-1CRATE ?auto_2655363 ?auto_2655364 )
      ( MAKE-1CRATE-VERIFY ?auto_2655363 ?auto_2655364 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2655370 - SURFACE
      ?auto_2655371 - SURFACE
    )
    :vars
    (
      ?auto_2655372 - HOIST
      ?auto_2655376 - PLACE
      ?auto_2655374 - TRUCK
      ?auto_2655375 - PLACE
      ?auto_2655373 - HOIST
      ?auto_2655377 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655372 ?auto_2655376 ) ( SURFACE-AT ?auto_2655370 ?auto_2655376 ) ( CLEAR ?auto_2655370 ) ( IS-CRATE ?auto_2655371 ) ( not ( = ?auto_2655370 ?auto_2655371 ) ) ( AVAILABLE ?auto_2655372 ) ( TRUCK-AT ?auto_2655374 ?auto_2655375 ) ( not ( = ?auto_2655375 ?auto_2655376 ) ) ( HOIST-AT ?auto_2655373 ?auto_2655375 ) ( not ( = ?auto_2655372 ?auto_2655373 ) ) ( AVAILABLE ?auto_2655373 ) ( SURFACE-AT ?auto_2655371 ?auto_2655375 ) ( ON ?auto_2655371 ?auto_2655377 ) ( CLEAR ?auto_2655371 ) ( not ( = ?auto_2655370 ?auto_2655377 ) ) ( not ( = ?auto_2655371 ?auto_2655377 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2655373 ?auto_2655371 ?auto_2655377 ?auto_2655375 )
      ( MAKE-1CRATE ?auto_2655370 ?auto_2655371 )
      ( MAKE-1CRATE-VERIFY ?auto_2655370 ?auto_2655371 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2655378 - SURFACE
      ?auto_2655379 - SURFACE
    )
    :vars
    (
      ?auto_2655383 - HOIST
      ?auto_2655381 - PLACE
      ?auto_2655382 - PLACE
      ?auto_2655380 - HOIST
      ?auto_2655385 - SURFACE
      ?auto_2655384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655383 ?auto_2655381 ) ( SURFACE-AT ?auto_2655378 ?auto_2655381 ) ( CLEAR ?auto_2655378 ) ( IS-CRATE ?auto_2655379 ) ( not ( = ?auto_2655378 ?auto_2655379 ) ) ( AVAILABLE ?auto_2655383 ) ( not ( = ?auto_2655382 ?auto_2655381 ) ) ( HOIST-AT ?auto_2655380 ?auto_2655382 ) ( not ( = ?auto_2655383 ?auto_2655380 ) ) ( AVAILABLE ?auto_2655380 ) ( SURFACE-AT ?auto_2655379 ?auto_2655382 ) ( ON ?auto_2655379 ?auto_2655385 ) ( CLEAR ?auto_2655379 ) ( not ( = ?auto_2655378 ?auto_2655385 ) ) ( not ( = ?auto_2655379 ?auto_2655385 ) ) ( TRUCK-AT ?auto_2655384 ?auto_2655381 ) )
    :subtasks
    ( ( !DRIVE ?auto_2655384 ?auto_2655381 ?auto_2655382 )
      ( MAKE-1CRATE ?auto_2655378 ?auto_2655379 )
      ( MAKE-1CRATE-VERIFY ?auto_2655378 ?auto_2655379 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2655395 - SURFACE
      ?auto_2655396 - SURFACE
      ?auto_2655397 - SURFACE
    )
    :vars
    (
      ?auto_2655398 - HOIST
      ?auto_2655399 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655398 ?auto_2655399 ) ( SURFACE-AT ?auto_2655396 ?auto_2655399 ) ( CLEAR ?auto_2655396 ) ( LIFTING ?auto_2655398 ?auto_2655397 ) ( IS-CRATE ?auto_2655397 ) ( not ( = ?auto_2655396 ?auto_2655397 ) ) ( ON ?auto_2655396 ?auto_2655395 ) ( not ( = ?auto_2655395 ?auto_2655396 ) ) ( not ( = ?auto_2655395 ?auto_2655397 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2655396 ?auto_2655397 )
      ( MAKE-2CRATE-VERIFY ?auto_2655395 ?auto_2655396 ?auto_2655397 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2655405 - SURFACE
      ?auto_2655406 - SURFACE
      ?auto_2655407 - SURFACE
    )
    :vars
    (
      ?auto_2655410 - HOIST
      ?auto_2655409 - PLACE
      ?auto_2655408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655410 ?auto_2655409 ) ( SURFACE-AT ?auto_2655406 ?auto_2655409 ) ( CLEAR ?auto_2655406 ) ( IS-CRATE ?auto_2655407 ) ( not ( = ?auto_2655406 ?auto_2655407 ) ) ( TRUCK-AT ?auto_2655408 ?auto_2655409 ) ( AVAILABLE ?auto_2655410 ) ( IN ?auto_2655407 ?auto_2655408 ) ( ON ?auto_2655406 ?auto_2655405 ) ( not ( = ?auto_2655405 ?auto_2655406 ) ) ( not ( = ?auto_2655405 ?auto_2655407 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2655406 ?auto_2655407 )
      ( MAKE-2CRATE-VERIFY ?auto_2655405 ?auto_2655406 ?auto_2655407 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2655411 - SURFACE
      ?auto_2655412 - SURFACE
    )
    :vars
    (
      ?auto_2655416 - HOIST
      ?auto_2655415 - PLACE
      ?auto_2655413 - TRUCK
      ?auto_2655414 - SURFACE
      ?auto_2655417 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655416 ?auto_2655415 ) ( SURFACE-AT ?auto_2655411 ?auto_2655415 ) ( CLEAR ?auto_2655411 ) ( IS-CRATE ?auto_2655412 ) ( not ( = ?auto_2655411 ?auto_2655412 ) ) ( AVAILABLE ?auto_2655416 ) ( IN ?auto_2655412 ?auto_2655413 ) ( ON ?auto_2655411 ?auto_2655414 ) ( not ( = ?auto_2655414 ?auto_2655411 ) ) ( not ( = ?auto_2655414 ?auto_2655412 ) ) ( TRUCK-AT ?auto_2655413 ?auto_2655417 ) ( not ( = ?auto_2655417 ?auto_2655415 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2655413 ?auto_2655417 ?auto_2655415 )
      ( MAKE-2CRATE ?auto_2655414 ?auto_2655411 ?auto_2655412 )
      ( MAKE-1CRATE-VERIFY ?auto_2655411 ?auto_2655412 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2655418 - SURFACE
      ?auto_2655419 - SURFACE
      ?auto_2655420 - SURFACE
    )
    :vars
    (
      ?auto_2655422 - HOIST
      ?auto_2655424 - PLACE
      ?auto_2655421 - TRUCK
      ?auto_2655423 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655422 ?auto_2655424 ) ( SURFACE-AT ?auto_2655419 ?auto_2655424 ) ( CLEAR ?auto_2655419 ) ( IS-CRATE ?auto_2655420 ) ( not ( = ?auto_2655419 ?auto_2655420 ) ) ( AVAILABLE ?auto_2655422 ) ( IN ?auto_2655420 ?auto_2655421 ) ( ON ?auto_2655419 ?auto_2655418 ) ( not ( = ?auto_2655418 ?auto_2655419 ) ) ( not ( = ?auto_2655418 ?auto_2655420 ) ) ( TRUCK-AT ?auto_2655421 ?auto_2655423 ) ( not ( = ?auto_2655423 ?auto_2655424 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2655419 ?auto_2655420 )
      ( MAKE-2CRATE-VERIFY ?auto_2655418 ?auto_2655419 ?auto_2655420 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2655425 - SURFACE
      ?auto_2655426 - SURFACE
    )
    :vars
    (
      ?auto_2655428 - HOIST
      ?auto_2655429 - PLACE
      ?auto_2655430 - SURFACE
      ?auto_2655427 - TRUCK
      ?auto_2655431 - PLACE
      ?auto_2655432 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655428 ?auto_2655429 ) ( SURFACE-AT ?auto_2655425 ?auto_2655429 ) ( CLEAR ?auto_2655425 ) ( IS-CRATE ?auto_2655426 ) ( not ( = ?auto_2655425 ?auto_2655426 ) ) ( AVAILABLE ?auto_2655428 ) ( ON ?auto_2655425 ?auto_2655430 ) ( not ( = ?auto_2655430 ?auto_2655425 ) ) ( not ( = ?auto_2655430 ?auto_2655426 ) ) ( TRUCK-AT ?auto_2655427 ?auto_2655431 ) ( not ( = ?auto_2655431 ?auto_2655429 ) ) ( HOIST-AT ?auto_2655432 ?auto_2655431 ) ( LIFTING ?auto_2655432 ?auto_2655426 ) ( not ( = ?auto_2655428 ?auto_2655432 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2655432 ?auto_2655426 ?auto_2655427 ?auto_2655431 )
      ( MAKE-2CRATE ?auto_2655430 ?auto_2655425 ?auto_2655426 )
      ( MAKE-1CRATE-VERIFY ?auto_2655425 ?auto_2655426 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2655433 - SURFACE
      ?auto_2655434 - SURFACE
      ?auto_2655435 - SURFACE
    )
    :vars
    (
      ?auto_2655440 - HOIST
      ?auto_2655438 - PLACE
      ?auto_2655436 - TRUCK
      ?auto_2655437 - PLACE
      ?auto_2655439 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655440 ?auto_2655438 ) ( SURFACE-AT ?auto_2655434 ?auto_2655438 ) ( CLEAR ?auto_2655434 ) ( IS-CRATE ?auto_2655435 ) ( not ( = ?auto_2655434 ?auto_2655435 ) ) ( AVAILABLE ?auto_2655440 ) ( ON ?auto_2655434 ?auto_2655433 ) ( not ( = ?auto_2655433 ?auto_2655434 ) ) ( not ( = ?auto_2655433 ?auto_2655435 ) ) ( TRUCK-AT ?auto_2655436 ?auto_2655437 ) ( not ( = ?auto_2655437 ?auto_2655438 ) ) ( HOIST-AT ?auto_2655439 ?auto_2655437 ) ( LIFTING ?auto_2655439 ?auto_2655435 ) ( not ( = ?auto_2655440 ?auto_2655439 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2655434 ?auto_2655435 )
      ( MAKE-2CRATE-VERIFY ?auto_2655433 ?auto_2655434 ?auto_2655435 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2655441 - SURFACE
      ?auto_2655442 - SURFACE
    )
    :vars
    (
      ?auto_2655445 - HOIST
      ?auto_2655448 - PLACE
      ?auto_2655447 - SURFACE
      ?auto_2655443 - TRUCK
      ?auto_2655446 - PLACE
      ?auto_2655444 - HOIST
      ?auto_2655449 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655445 ?auto_2655448 ) ( SURFACE-AT ?auto_2655441 ?auto_2655448 ) ( CLEAR ?auto_2655441 ) ( IS-CRATE ?auto_2655442 ) ( not ( = ?auto_2655441 ?auto_2655442 ) ) ( AVAILABLE ?auto_2655445 ) ( ON ?auto_2655441 ?auto_2655447 ) ( not ( = ?auto_2655447 ?auto_2655441 ) ) ( not ( = ?auto_2655447 ?auto_2655442 ) ) ( TRUCK-AT ?auto_2655443 ?auto_2655446 ) ( not ( = ?auto_2655446 ?auto_2655448 ) ) ( HOIST-AT ?auto_2655444 ?auto_2655446 ) ( not ( = ?auto_2655445 ?auto_2655444 ) ) ( AVAILABLE ?auto_2655444 ) ( SURFACE-AT ?auto_2655442 ?auto_2655446 ) ( ON ?auto_2655442 ?auto_2655449 ) ( CLEAR ?auto_2655442 ) ( not ( = ?auto_2655441 ?auto_2655449 ) ) ( not ( = ?auto_2655442 ?auto_2655449 ) ) ( not ( = ?auto_2655447 ?auto_2655449 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2655444 ?auto_2655442 ?auto_2655449 ?auto_2655446 )
      ( MAKE-2CRATE ?auto_2655447 ?auto_2655441 ?auto_2655442 )
      ( MAKE-1CRATE-VERIFY ?auto_2655441 ?auto_2655442 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2655450 - SURFACE
      ?auto_2655451 - SURFACE
      ?auto_2655452 - SURFACE
    )
    :vars
    (
      ?auto_2655456 - HOIST
      ?auto_2655453 - PLACE
      ?auto_2655454 - TRUCK
      ?auto_2655458 - PLACE
      ?auto_2655455 - HOIST
      ?auto_2655457 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655456 ?auto_2655453 ) ( SURFACE-AT ?auto_2655451 ?auto_2655453 ) ( CLEAR ?auto_2655451 ) ( IS-CRATE ?auto_2655452 ) ( not ( = ?auto_2655451 ?auto_2655452 ) ) ( AVAILABLE ?auto_2655456 ) ( ON ?auto_2655451 ?auto_2655450 ) ( not ( = ?auto_2655450 ?auto_2655451 ) ) ( not ( = ?auto_2655450 ?auto_2655452 ) ) ( TRUCK-AT ?auto_2655454 ?auto_2655458 ) ( not ( = ?auto_2655458 ?auto_2655453 ) ) ( HOIST-AT ?auto_2655455 ?auto_2655458 ) ( not ( = ?auto_2655456 ?auto_2655455 ) ) ( AVAILABLE ?auto_2655455 ) ( SURFACE-AT ?auto_2655452 ?auto_2655458 ) ( ON ?auto_2655452 ?auto_2655457 ) ( CLEAR ?auto_2655452 ) ( not ( = ?auto_2655451 ?auto_2655457 ) ) ( not ( = ?auto_2655452 ?auto_2655457 ) ) ( not ( = ?auto_2655450 ?auto_2655457 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2655451 ?auto_2655452 )
      ( MAKE-2CRATE-VERIFY ?auto_2655450 ?auto_2655451 ?auto_2655452 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2655459 - SURFACE
      ?auto_2655460 - SURFACE
    )
    :vars
    (
      ?auto_2655467 - HOIST
      ?auto_2655461 - PLACE
      ?auto_2655464 - SURFACE
      ?auto_2655462 - PLACE
      ?auto_2655463 - HOIST
      ?auto_2655465 - SURFACE
      ?auto_2655466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655467 ?auto_2655461 ) ( SURFACE-AT ?auto_2655459 ?auto_2655461 ) ( CLEAR ?auto_2655459 ) ( IS-CRATE ?auto_2655460 ) ( not ( = ?auto_2655459 ?auto_2655460 ) ) ( AVAILABLE ?auto_2655467 ) ( ON ?auto_2655459 ?auto_2655464 ) ( not ( = ?auto_2655464 ?auto_2655459 ) ) ( not ( = ?auto_2655464 ?auto_2655460 ) ) ( not ( = ?auto_2655462 ?auto_2655461 ) ) ( HOIST-AT ?auto_2655463 ?auto_2655462 ) ( not ( = ?auto_2655467 ?auto_2655463 ) ) ( AVAILABLE ?auto_2655463 ) ( SURFACE-AT ?auto_2655460 ?auto_2655462 ) ( ON ?auto_2655460 ?auto_2655465 ) ( CLEAR ?auto_2655460 ) ( not ( = ?auto_2655459 ?auto_2655465 ) ) ( not ( = ?auto_2655460 ?auto_2655465 ) ) ( not ( = ?auto_2655464 ?auto_2655465 ) ) ( TRUCK-AT ?auto_2655466 ?auto_2655461 ) )
    :subtasks
    ( ( !DRIVE ?auto_2655466 ?auto_2655461 ?auto_2655462 )
      ( MAKE-2CRATE ?auto_2655464 ?auto_2655459 ?auto_2655460 )
      ( MAKE-1CRATE-VERIFY ?auto_2655459 ?auto_2655460 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2655468 - SURFACE
      ?auto_2655469 - SURFACE
      ?auto_2655470 - SURFACE
    )
    :vars
    (
      ?auto_2655473 - HOIST
      ?auto_2655474 - PLACE
      ?auto_2655476 - PLACE
      ?auto_2655471 - HOIST
      ?auto_2655475 - SURFACE
      ?auto_2655472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655473 ?auto_2655474 ) ( SURFACE-AT ?auto_2655469 ?auto_2655474 ) ( CLEAR ?auto_2655469 ) ( IS-CRATE ?auto_2655470 ) ( not ( = ?auto_2655469 ?auto_2655470 ) ) ( AVAILABLE ?auto_2655473 ) ( ON ?auto_2655469 ?auto_2655468 ) ( not ( = ?auto_2655468 ?auto_2655469 ) ) ( not ( = ?auto_2655468 ?auto_2655470 ) ) ( not ( = ?auto_2655476 ?auto_2655474 ) ) ( HOIST-AT ?auto_2655471 ?auto_2655476 ) ( not ( = ?auto_2655473 ?auto_2655471 ) ) ( AVAILABLE ?auto_2655471 ) ( SURFACE-AT ?auto_2655470 ?auto_2655476 ) ( ON ?auto_2655470 ?auto_2655475 ) ( CLEAR ?auto_2655470 ) ( not ( = ?auto_2655469 ?auto_2655475 ) ) ( not ( = ?auto_2655470 ?auto_2655475 ) ) ( not ( = ?auto_2655468 ?auto_2655475 ) ) ( TRUCK-AT ?auto_2655472 ?auto_2655474 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2655469 ?auto_2655470 )
      ( MAKE-2CRATE-VERIFY ?auto_2655468 ?auto_2655469 ?auto_2655470 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2655477 - SURFACE
      ?auto_2655478 - SURFACE
    )
    :vars
    (
      ?auto_2655485 - HOIST
      ?auto_2655479 - PLACE
      ?auto_2655481 - SURFACE
      ?auto_2655482 - PLACE
      ?auto_2655484 - HOIST
      ?auto_2655480 - SURFACE
      ?auto_2655483 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655485 ?auto_2655479 ) ( IS-CRATE ?auto_2655478 ) ( not ( = ?auto_2655477 ?auto_2655478 ) ) ( not ( = ?auto_2655481 ?auto_2655477 ) ) ( not ( = ?auto_2655481 ?auto_2655478 ) ) ( not ( = ?auto_2655482 ?auto_2655479 ) ) ( HOIST-AT ?auto_2655484 ?auto_2655482 ) ( not ( = ?auto_2655485 ?auto_2655484 ) ) ( AVAILABLE ?auto_2655484 ) ( SURFACE-AT ?auto_2655478 ?auto_2655482 ) ( ON ?auto_2655478 ?auto_2655480 ) ( CLEAR ?auto_2655478 ) ( not ( = ?auto_2655477 ?auto_2655480 ) ) ( not ( = ?auto_2655478 ?auto_2655480 ) ) ( not ( = ?auto_2655481 ?auto_2655480 ) ) ( TRUCK-AT ?auto_2655483 ?auto_2655479 ) ( SURFACE-AT ?auto_2655481 ?auto_2655479 ) ( CLEAR ?auto_2655481 ) ( LIFTING ?auto_2655485 ?auto_2655477 ) ( IS-CRATE ?auto_2655477 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2655481 ?auto_2655477 )
      ( MAKE-2CRATE ?auto_2655481 ?auto_2655477 ?auto_2655478 )
      ( MAKE-1CRATE-VERIFY ?auto_2655477 ?auto_2655478 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2655486 - SURFACE
      ?auto_2655487 - SURFACE
      ?auto_2655488 - SURFACE
    )
    :vars
    (
      ?auto_2655494 - HOIST
      ?auto_2655490 - PLACE
      ?auto_2655491 - PLACE
      ?auto_2655493 - HOIST
      ?auto_2655492 - SURFACE
      ?auto_2655489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655494 ?auto_2655490 ) ( IS-CRATE ?auto_2655488 ) ( not ( = ?auto_2655487 ?auto_2655488 ) ) ( not ( = ?auto_2655486 ?auto_2655487 ) ) ( not ( = ?auto_2655486 ?auto_2655488 ) ) ( not ( = ?auto_2655491 ?auto_2655490 ) ) ( HOIST-AT ?auto_2655493 ?auto_2655491 ) ( not ( = ?auto_2655494 ?auto_2655493 ) ) ( AVAILABLE ?auto_2655493 ) ( SURFACE-AT ?auto_2655488 ?auto_2655491 ) ( ON ?auto_2655488 ?auto_2655492 ) ( CLEAR ?auto_2655488 ) ( not ( = ?auto_2655487 ?auto_2655492 ) ) ( not ( = ?auto_2655488 ?auto_2655492 ) ) ( not ( = ?auto_2655486 ?auto_2655492 ) ) ( TRUCK-AT ?auto_2655489 ?auto_2655490 ) ( SURFACE-AT ?auto_2655486 ?auto_2655490 ) ( CLEAR ?auto_2655486 ) ( LIFTING ?auto_2655494 ?auto_2655487 ) ( IS-CRATE ?auto_2655487 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2655487 ?auto_2655488 )
      ( MAKE-2CRATE-VERIFY ?auto_2655486 ?auto_2655487 ?auto_2655488 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2655495 - SURFACE
      ?auto_2655496 - SURFACE
    )
    :vars
    (
      ?auto_2655503 - HOIST
      ?auto_2655498 - PLACE
      ?auto_2655497 - SURFACE
      ?auto_2655499 - PLACE
      ?auto_2655500 - HOIST
      ?auto_2655502 - SURFACE
      ?auto_2655501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655503 ?auto_2655498 ) ( IS-CRATE ?auto_2655496 ) ( not ( = ?auto_2655495 ?auto_2655496 ) ) ( not ( = ?auto_2655497 ?auto_2655495 ) ) ( not ( = ?auto_2655497 ?auto_2655496 ) ) ( not ( = ?auto_2655499 ?auto_2655498 ) ) ( HOIST-AT ?auto_2655500 ?auto_2655499 ) ( not ( = ?auto_2655503 ?auto_2655500 ) ) ( AVAILABLE ?auto_2655500 ) ( SURFACE-AT ?auto_2655496 ?auto_2655499 ) ( ON ?auto_2655496 ?auto_2655502 ) ( CLEAR ?auto_2655496 ) ( not ( = ?auto_2655495 ?auto_2655502 ) ) ( not ( = ?auto_2655496 ?auto_2655502 ) ) ( not ( = ?auto_2655497 ?auto_2655502 ) ) ( TRUCK-AT ?auto_2655501 ?auto_2655498 ) ( SURFACE-AT ?auto_2655497 ?auto_2655498 ) ( CLEAR ?auto_2655497 ) ( IS-CRATE ?auto_2655495 ) ( AVAILABLE ?auto_2655503 ) ( IN ?auto_2655495 ?auto_2655501 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2655503 ?auto_2655495 ?auto_2655501 ?auto_2655498 )
      ( MAKE-2CRATE ?auto_2655497 ?auto_2655495 ?auto_2655496 )
      ( MAKE-1CRATE-VERIFY ?auto_2655495 ?auto_2655496 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2655504 - SURFACE
      ?auto_2655505 - SURFACE
      ?auto_2655506 - SURFACE
    )
    :vars
    (
      ?auto_2655507 - HOIST
      ?auto_2655508 - PLACE
      ?auto_2655509 - PLACE
      ?auto_2655512 - HOIST
      ?auto_2655510 - SURFACE
      ?auto_2655511 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655507 ?auto_2655508 ) ( IS-CRATE ?auto_2655506 ) ( not ( = ?auto_2655505 ?auto_2655506 ) ) ( not ( = ?auto_2655504 ?auto_2655505 ) ) ( not ( = ?auto_2655504 ?auto_2655506 ) ) ( not ( = ?auto_2655509 ?auto_2655508 ) ) ( HOIST-AT ?auto_2655512 ?auto_2655509 ) ( not ( = ?auto_2655507 ?auto_2655512 ) ) ( AVAILABLE ?auto_2655512 ) ( SURFACE-AT ?auto_2655506 ?auto_2655509 ) ( ON ?auto_2655506 ?auto_2655510 ) ( CLEAR ?auto_2655506 ) ( not ( = ?auto_2655505 ?auto_2655510 ) ) ( not ( = ?auto_2655506 ?auto_2655510 ) ) ( not ( = ?auto_2655504 ?auto_2655510 ) ) ( TRUCK-AT ?auto_2655511 ?auto_2655508 ) ( SURFACE-AT ?auto_2655504 ?auto_2655508 ) ( CLEAR ?auto_2655504 ) ( IS-CRATE ?auto_2655505 ) ( AVAILABLE ?auto_2655507 ) ( IN ?auto_2655505 ?auto_2655511 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2655505 ?auto_2655506 )
      ( MAKE-2CRATE-VERIFY ?auto_2655504 ?auto_2655505 ?auto_2655506 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2655549 - SURFACE
      ?auto_2655550 - SURFACE
    )
    :vars
    (
      ?auto_2655555 - HOIST
      ?auto_2655551 - PLACE
      ?auto_2655556 - SURFACE
      ?auto_2655552 - PLACE
      ?auto_2655557 - HOIST
      ?auto_2655553 - SURFACE
      ?auto_2655554 - TRUCK
      ?auto_2655558 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655555 ?auto_2655551 ) ( SURFACE-AT ?auto_2655549 ?auto_2655551 ) ( CLEAR ?auto_2655549 ) ( IS-CRATE ?auto_2655550 ) ( not ( = ?auto_2655549 ?auto_2655550 ) ) ( AVAILABLE ?auto_2655555 ) ( ON ?auto_2655549 ?auto_2655556 ) ( not ( = ?auto_2655556 ?auto_2655549 ) ) ( not ( = ?auto_2655556 ?auto_2655550 ) ) ( not ( = ?auto_2655552 ?auto_2655551 ) ) ( HOIST-AT ?auto_2655557 ?auto_2655552 ) ( not ( = ?auto_2655555 ?auto_2655557 ) ) ( AVAILABLE ?auto_2655557 ) ( SURFACE-AT ?auto_2655550 ?auto_2655552 ) ( ON ?auto_2655550 ?auto_2655553 ) ( CLEAR ?auto_2655550 ) ( not ( = ?auto_2655549 ?auto_2655553 ) ) ( not ( = ?auto_2655550 ?auto_2655553 ) ) ( not ( = ?auto_2655556 ?auto_2655553 ) ) ( TRUCK-AT ?auto_2655554 ?auto_2655558 ) ( not ( = ?auto_2655558 ?auto_2655551 ) ) ( not ( = ?auto_2655552 ?auto_2655558 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2655554 ?auto_2655558 ?auto_2655551 )
      ( MAKE-1CRATE ?auto_2655549 ?auto_2655550 )
      ( MAKE-1CRATE-VERIFY ?auto_2655549 ?auto_2655550 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2655588 - SURFACE
      ?auto_2655589 - SURFACE
      ?auto_2655590 - SURFACE
      ?auto_2655591 - SURFACE
    )
    :vars
    (
      ?auto_2655593 - HOIST
      ?auto_2655592 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655593 ?auto_2655592 ) ( SURFACE-AT ?auto_2655590 ?auto_2655592 ) ( CLEAR ?auto_2655590 ) ( LIFTING ?auto_2655593 ?auto_2655591 ) ( IS-CRATE ?auto_2655591 ) ( not ( = ?auto_2655590 ?auto_2655591 ) ) ( ON ?auto_2655589 ?auto_2655588 ) ( ON ?auto_2655590 ?auto_2655589 ) ( not ( = ?auto_2655588 ?auto_2655589 ) ) ( not ( = ?auto_2655588 ?auto_2655590 ) ) ( not ( = ?auto_2655588 ?auto_2655591 ) ) ( not ( = ?auto_2655589 ?auto_2655590 ) ) ( not ( = ?auto_2655589 ?auto_2655591 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2655590 ?auto_2655591 )
      ( MAKE-3CRATE-VERIFY ?auto_2655588 ?auto_2655589 ?auto_2655590 ?auto_2655591 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2655605 - SURFACE
      ?auto_2655606 - SURFACE
      ?auto_2655607 - SURFACE
      ?auto_2655608 - SURFACE
    )
    :vars
    (
      ?auto_2655609 - HOIST
      ?auto_2655611 - PLACE
      ?auto_2655610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655609 ?auto_2655611 ) ( SURFACE-AT ?auto_2655607 ?auto_2655611 ) ( CLEAR ?auto_2655607 ) ( IS-CRATE ?auto_2655608 ) ( not ( = ?auto_2655607 ?auto_2655608 ) ) ( TRUCK-AT ?auto_2655610 ?auto_2655611 ) ( AVAILABLE ?auto_2655609 ) ( IN ?auto_2655608 ?auto_2655610 ) ( ON ?auto_2655607 ?auto_2655606 ) ( not ( = ?auto_2655606 ?auto_2655607 ) ) ( not ( = ?auto_2655606 ?auto_2655608 ) ) ( ON ?auto_2655606 ?auto_2655605 ) ( not ( = ?auto_2655605 ?auto_2655606 ) ) ( not ( = ?auto_2655605 ?auto_2655607 ) ) ( not ( = ?auto_2655605 ?auto_2655608 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2655606 ?auto_2655607 ?auto_2655608 )
      ( MAKE-3CRATE-VERIFY ?auto_2655605 ?auto_2655606 ?auto_2655607 ?auto_2655608 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2655626 - SURFACE
      ?auto_2655627 - SURFACE
      ?auto_2655628 - SURFACE
      ?auto_2655629 - SURFACE
    )
    :vars
    (
      ?auto_2655631 - HOIST
      ?auto_2655630 - PLACE
      ?auto_2655633 - TRUCK
      ?auto_2655632 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655631 ?auto_2655630 ) ( SURFACE-AT ?auto_2655628 ?auto_2655630 ) ( CLEAR ?auto_2655628 ) ( IS-CRATE ?auto_2655629 ) ( not ( = ?auto_2655628 ?auto_2655629 ) ) ( AVAILABLE ?auto_2655631 ) ( IN ?auto_2655629 ?auto_2655633 ) ( ON ?auto_2655628 ?auto_2655627 ) ( not ( = ?auto_2655627 ?auto_2655628 ) ) ( not ( = ?auto_2655627 ?auto_2655629 ) ) ( TRUCK-AT ?auto_2655633 ?auto_2655632 ) ( not ( = ?auto_2655632 ?auto_2655630 ) ) ( ON ?auto_2655627 ?auto_2655626 ) ( not ( = ?auto_2655626 ?auto_2655627 ) ) ( not ( = ?auto_2655626 ?auto_2655628 ) ) ( not ( = ?auto_2655626 ?auto_2655629 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2655627 ?auto_2655628 ?auto_2655629 )
      ( MAKE-3CRATE-VERIFY ?auto_2655626 ?auto_2655627 ?auto_2655628 ?auto_2655629 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2655650 - SURFACE
      ?auto_2655651 - SURFACE
      ?auto_2655652 - SURFACE
      ?auto_2655653 - SURFACE
    )
    :vars
    (
      ?auto_2655656 - HOIST
      ?auto_2655658 - PLACE
      ?auto_2655657 - TRUCK
      ?auto_2655654 - PLACE
      ?auto_2655655 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655656 ?auto_2655658 ) ( SURFACE-AT ?auto_2655652 ?auto_2655658 ) ( CLEAR ?auto_2655652 ) ( IS-CRATE ?auto_2655653 ) ( not ( = ?auto_2655652 ?auto_2655653 ) ) ( AVAILABLE ?auto_2655656 ) ( ON ?auto_2655652 ?auto_2655651 ) ( not ( = ?auto_2655651 ?auto_2655652 ) ) ( not ( = ?auto_2655651 ?auto_2655653 ) ) ( TRUCK-AT ?auto_2655657 ?auto_2655654 ) ( not ( = ?auto_2655654 ?auto_2655658 ) ) ( HOIST-AT ?auto_2655655 ?auto_2655654 ) ( LIFTING ?auto_2655655 ?auto_2655653 ) ( not ( = ?auto_2655656 ?auto_2655655 ) ) ( ON ?auto_2655651 ?auto_2655650 ) ( not ( = ?auto_2655650 ?auto_2655651 ) ) ( not ( = ?auto_2655650 ?auto_2655652 ) ) ( not ( = ?auto_2655650 ?auto_2655653 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2655651 ?auto_2655652 ?auto_2655653 )
      ( MAKE-3CRATE-VERIFY ?auto_2655650 ?auto_2655651 ?auto_2655652 ?auto_2655653 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2655677 - SURFACE
      ?auto_2655678 - SURFACE
      ?auto_2655679 - SURFACE
      ?auto_2655680 - SURFACE
    )
    :vars
    (
      ?auto_2655684 - HOIST
      ?auto_2655682 - PLACE
      ?auto_2655686 - TRUCK
      ?auto_2655685 - PLACE
      ?auto_2655681 - HOIST
      ?auto_2655683 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655684 ?auto_2655682 ) ( SURFACE-AT ?auto_2655679 ?auto_2655682 ) ( CLEAR ?auto_2655679 ) ( IS-CRATE ?auto_2655680 ) ( not ( = ?auto_2655679 ?auto_2655680 ) ) ( AVAILABLE ?auto_2655684 ) ( ON ?auto_2655679 ?auto_2655678 ) ( not ( = ?auto_2655678 ?auto_2655679 ) ) ( not ( = ?auto_2655678 ?auto_2655680 ) ) ( TRUCK-AT ?auto_2655686 ?auto_2655685 ) ( not ( = ?auto_2655685 ?auto_2655682 ) ) ( HOIST-AT ?auto_2655681 ?auto_2655685 ) ( not ( = ?auto_2655684 ?auto_2655681 ) ) ( AVAILABLE ?auto_2655681 ) ( SURFACE-AT ?auto_2655680 ?auto_2655685 ) ( ON ?auto_2655680 ?auto_2655683 ) ( CLEAR ?auto_2655680 ) ( not ( = ?auto_2655679 ?auto_2655683 ) ) ( not ( = ?auto_2655680 ?auto_2655683 ) ) ( not ( = ?auto_2655678 ?auto_2655683 ) ) ( ON ?auto_2655678 ?auto_2655677 ) ( not ( = ?auto_2655677 ?auto_2655678 ) ) ( not ( = ?auto_2655677 ?auto_2655679 ) ) ( not ( = ?auto_2655677 ?auto_2655680 ) ) ( not ( = ?auto_2655677 ?auto_2655683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2655678 ?auto_2655679 ?auto_2655680 )
      ( MAKE-3CRATE-VERIFY ?auto_2655677 ?auto_2655678 ?auto_2655679 ?auto_2655680 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2655705 - SURFACE
      ?auto_2655706 - SURFACE
      ?auto_2655707 - SURFACE
      ?auto_2655708 - SURFACE
    )
    :vars
    (
      ?auto_2655711 - HOIST
      ?auto_2655709 - PLACE
      ?auto_2655712 - PLACE
      ?auto_2655710 - HOIST
      ?auto_2655714 - SURFACE
      ?auto_2655713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655711 ?auto_2655709 ) ( SURFACE-AT ?auto_2655707 ?auto_2655709 ) ( CLEAR ?auto_2655707 ) ( IS-CRATE ?auto_2655708 ) ( not ( = ?auto_2655707 ?auto_2655708 ) ) ( AVAILABLE ?auto_2655711 ) ( ON ?auto_2655707 ?auto_2655706 ) ( not ( = ?auto_2655706 ?auto_2655707 ) ) ( not ( = ?auto_2655706 ?auto_2655708 ) ) ( not ( = ?auto_2655712 ?auto_2655709 ) ) ( HOIST-AT ?auto_2655710 ?auto_2655712 ) ( not ( = ?auto_2655711 ?auto_2655710 ) ) ( AVAILABLE ?auto_2655710 ) ( SURFACE-AT ?auto_2655708 ?auto_2655712 ) ( ON ?auto_2655708 ?auto_2655714 ) ( CLEAR ?auto_2655708 ) ( not ( = ?auto_2655707 ?auto_2655714 ) ) ( not ( = ?auto_2655708 ?auto_2655714 ) ) ( not ( = ?auto_2655706 ?auto_2655714 ) ) ( TRUCK-AT ?auto_2655713 ?auto_2655709 ) ( ON ?auto_2655706 ?auto_2655705 ) ( not ( = ?auto_2655705 ?auto_2655706 ) ) ( not ( = ?auto_2655705 ?auto_2655707 ) ) ( not ( = ?auto_2655705 ?auto_2655708 ) ) ( not ( = ?auto_2655705 ?auto_2655714 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2655706 ?auto_2655707 ?auto_2655708 )
      ( MAKE-3CRATE-VERIFY ?auto_2655705 ?auto_2655706 ?auto_2655707 ?auto_2655708 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2655733 - SURFACE
      ?auto_2655734 - SURFACE
      ?auto_2655735 - SURFACE
      ?auto_2655736 - SURFACE
    )
    :vars
    (
      ?auto_2655737 - HOIST
      ?auto_2655742 - PLACE
      ?auto_2655741 - PLACE
      ?auto_2655739 - HOIST
      ?auto_2655738 - SURFACE
      ?auto_2655740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655737 ?auto_2655742 ) ( IS-CRATE ?auto_2655736 ) ( not ( = ?auto_2655735 ?auto_2655736 ) ) ( not ( = ?auto_2655734 ?auto_2655735 ) ) ( not ( = ?auto_2655734 ?auto_2655736 ) ) ( not ( = ?auto_2655741 ?auto_2655742 ) ) ( HOIST-AT ?auto_2655739 ?auto_2655741 ) ( not ( = ?auto_2655737 ?auto_2655739 ) ) ( AVAILABLE ?auto_2655739 ) ( SURFACE-AT ?auto_2655736 ?auto_2655741 ) ( ON ?auto_2655736 ?auto_2655738 ) ( CLEAR ?auto_2655736 ) ( not ( = ?auto_2655735 ?auto_2655738 ) ) ( not ( = ?auto_2655736 ?auto_2655738 ) ) ( not ( = ?auto_2655734 ?auto_2655738 ) ) ( TRUCK-AT ?auto_2655740 ?auto_2655742 ) ( SURFACE-AT ?auto_2655734 ?auto_2655742 ) ( CLEAR ?auto_2655734 ) ( LIFTING ?auto_2655737 ?auto_2655735 ) ( IS-CRATE ?auto_2655735 ) ( ON ?auto_2655734 ?auto_2655733 ) ( not ( = ?auto_2655733 ?auto_2655734 ) ) ( not ( = ?auto_2655733 ?auto_2655735 ) ) ( not ( = ?auto_2655733 ?auto_2655736 ) ) ( not ( = ?auto_2655733 ?auto_2655738 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2655734 ?auto_2655735 ?auto_2655736 )
      ( MAKE-3CRATE-VERIFY ?auto_2655733 ?auto_2655734 ?auto_2655735 ?auto_2655736 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2655761 - SURFACE
      ?auto_2655762 - SURFACE
      ?auto_2655763 - SURFACE
      ?auto_2655764 - SURFACE
    )
    :vars
    (
      ?auto_2655767 - HOIST
      ?auto_2655766 - PLACE
      ?auto_2655770 - PLACE
      ?auto_2655768 - HOIST
      ?auto_2655765 - SURFACE
      ?auto_2655769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2655767 ?auto_2655766 ) ( IS-CRATE ?auto_2655764 ) ( not ( = ?auto_2655763 ?auto_2655764 ) ) ( not ( = ?auto_2655762 ?auto_2655763 ) ) ( not ( = ?auto_2655762 ?auto_2655764 ) ) ( not ( = ?auto_2655770 ?auto_2655766 ) ) ( HOIST-AT ?auto_2655768 ?auto_2655770 ) ( not ( = ?auto_2655767 ?auto_2655768 ) ) ( AVAILABLE ?auto_2655768 ) ( SURFACE-AT ?auto_2655764 ?auto_2655770 ) ( ON ?auto_2655764 ?auto_2655765 ) ( CLEAR ?auto_2655764 ) ( not ( = ?auto_2655763 ?auto_2655765 ) ) ( not ( = ?auto_2655764 ?auto_2655765 ) ) ( not ( = ?auto_2655762 ?auto_2655765 ) ) ( TRUCK-AT ?auto_2655769 ?auto_2655766 ) ( SURFACE-AT ?auto_2655762 ?auto_2655766 ) ( CLEAR ?auto_2655762 ) ( IS-CRATE ?auto_2655763 ) ( AVAILABLE ?auto_2655767 ) ( IN ?auto_2655763 ?auto_2655769 ) ( ON ?auto_2655762 ?auto_2655761 ) ( not ( = ?auto_2655761 ?auto_2655762 ) ) ( not ( = ?auto_2655761 ?auto_2655763 ) ) ( not ( = ?auto_2655761 ?auto_2655764 ) ) ( not ( = ?auto_2655761 ?auto_2655765 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2655762 ?auto_2655763 ?auto_2655764 )
      ( MAKE-3CRATE-VERIFY ?auto_2655761 ?auto_2655762 ?auto_2655763 ?auto_2655764 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2656052 - SURFACE
      ?auto_2656053 - SURFACE
      ?auto_2656054 - SURFACE
      ?auto_2656056 - SURFACE
      ?auto_2656055 - SURFACE
    )
    :vars
    (
      ?auto_2656057 - HOIST
      ?auto_2656058 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656057 ?auto_2656058 ) ( SURFACE-AT ?auto_2656056 ?auto_2656058 ) ( CLEAR ?auto_2656056 ) ( LIFTING ?auto_2656057 ?auto_2656055 ) ( IS-CRATE ?auto_2656055 ) ( not ( = ?auto_2656056 ?auto_2656055 ) ) ( ON ?auto_2656053 ?auto_2656052 ) ( ON ?auto_2656054 ?auto_2656053 ) ( ON ?auto_2656056 ?auto_2656054 ) ( not ( = ?auto_2656052 ?auto_2656053 ) ) ( not ( = ?auto_2656052 ?auto_2656054 ) ) ( not ( = ?auto_2656052 ?auto_2656056 ) ) ( not ( = ?auto_2656052 ?auto_2656055 ) ) ( not ( = ?auto_2656053 ?auto_2656054 ) ) ( not ( = ?auto_2656053 ?auto_2656056 ) ) ( not ( = ?auto_2656053 ?auto_2656055 ) ) ( not ( = ?auto_2656054 ?auto_2656056 ) ) ( not ( = ?auto_2656054 ?auto_2656055 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2656056 ?auto_2656055 )
      ( MAKE-4CRATE-VERIFY ?auto_2656052 ?auto_2656053 ?auto_2656054 ?auto_2656056 ?auto_2656055 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2656077 - SURFACE
      ?auto_2656078 - SURFACE
      ?auto_2656079 - SURFACE
      ?auto_2656081 - SURFACE
      ?auto_2656080 - SURFACE
    )
    :vars
    (
      ?auto_2656083 - HOIST
      ?auto_2656084 - PLACE
      ?auto_2656082 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656083 ?auto_2656084 ) ( SURFACE-AT ?auto_2656081 ?auto_2656084 ) ( CLEAR ?auto_2656081 ) ( IS-CRATE ?auto_2656080 ) ( not ( = ?auto_2656081 ?auto_2656080 ) ) ( TRUCK-AT ?auto_2656082 ?auto_2656084 ) ( AVAILABLE ?auto_2656083 ) ( IN ?auto_2656080 ?auto_2656082 ) ( ON ?auto_2656081 ?auto_2656079 ) ( not ( = ?auto_2656079 ?auto_2656081 ) ) ( not ( = ?auto_2656079 ?auto_2656080 ) ) ( ON ?auto_2656078 ?auto_2656077 ) ( ON ?auto_2656079 ?auto_2656078 ) ( not ( = ?auto_2656077 ?auto_2656078 ) ) ( not ( = ?auto_2656077 ?auto_2656079 ) ) ( not ( = ?auto_2656077 ?auto_2656081 ) ) ( not ( = ?auto_2656077 ?auto_2656080 ) ) ( not ( = ?auto_2656078 ?auto_2656079 ) ) ( not ( = ?auto_2656078 ?auto_2656081 ) ) ( not ( = ?auto_2656078 ?auto_2656080 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2656079 ?auto_2656081 ?auto_2656080 )
      ( MAKE-4CRATE-VERIFY ?auto_2656077 ?auto_2656078 ?auto_2656079 ?auto_2656081 ?auto_2656080 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2656107 - SURFACE
      ?auto_2656108 - SURFACE
      ?auto_2656109 - SURFACE
      ?auto_2656111 - SURFACE
      ?auto_2656110 - SURFACE
    )
    :vars
    (
      ?auto_2656114 - HOIST
      ?auto_2656112 - PLACE
      ?auto_2656113 - TRUCK
      ?auto_2656115 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656114 ?auto_2656112 ) ( SURFACE-AT ?auto_2656111 ?auto_2656112 ) ( CLEAR ?auto_2656111 ) ( IS-CRATE ?auto_2656110 ) ( not ( = ?auto_2656111 ?auto_2656110 ) ) ( AVAILABLE ?auto_2656114 ) ( IN ?auto_2656110 ?auto_2656113 ) ( ON ?auto_2656111 ?auto_2656109 ) ( not ( = ?auto_2656109 ?auto_2656111 ) ) ( not ( = ?auto_2656109 ?auto_2656110 ) ) ( TRUCK-AT ?auto_2656113 ?auto_2656115 ) ( not ( = ?auto_2656115 ?auto_2656112 ) ) ( ON ?auto_2656108 ?auto_2656107 ) ( ON ?auto_2656109 ?auto_2656108 ) ( not ( = ?auto_2656107 ?auto_2656108 ) ) ( not ( = ?auto_2656107 ?auto_2656109 ) ) ( not ( = ?auto_2656107 ?auto_2656111 ) ) ( not ( = ?auto_2656107 ?auto_2656110 ) ) ( not ( = ?auto_2656108 ?auto_2656109 ) ) ( not ( = ?auto_2656108 ?auto_2656111 ) ) ( not ( = ?auto_2656108 ?auto_2656110 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2656109 ?auto_2656111 ?auto_2656110 )
      ( MAKE-4CRATE-VERIFY ?auto_2656107 ?auto_2656108 ?auto_2656109 ?auto_2656111 ?auto_2656110 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2656141 - SURFACE
      ?auto_2656142 - SURFACE
      ?auto_2656143 - SURFACE
      ?auto_2656145 - SURFACE
      ?auto_2656144 - SURFACE
    )
    :vars
    (
      ?auto_2656147 - HOIST
      ?auto_2656149 - PLACE
      ?auto_2656146 - TRUCK
      ?auto_2656150 - PLACE
      ?auto_2656148 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656147 ?auto_2656149 ) ( SURFACE-AT ?auto_2656145 ?auto_2656149 ) ( CLEAR ?auto_2656145 ) ( IS-CRATE ?auto_2656144 ) ( not ( = ?auto_2656145 ?auto_2656144 ) ) ( AVAILABLE ?auto_2656147 ) ( ON ?auto_2656145 ?auto_2656143 ) ( not ( = ?auto_2656143 ?auto_2656145 ) ) ( not ( = ?auto_2656143 ?auto_2656144 ) ) ( TRUCK-AT ?auto_2656146 ?auto_2656150 ) ( not ( = ?auto_2656150 ?auto_2656149 ) ) ( HOIST-AT ?auto_2656148 ?auto_2656150 ) ( LIFTING ?auto_2656148 ?auto_2656144 ) ( not ( = ?auto_2656147 ?auto_2656148 ) ) ( ON ?auto_2656142 ?auto_2656141 ) ( ON ?auto_2656143 ?auto_2656142 ) ( not ( = ?auto_2656141 ?auto_2656142 ) ) ( not ( = ?auto_2656141 ?auto_2656143 ) ) ( not ( = ?auto_2656141 ?auto_2656145 ) ) ( not ( = ?auto_2656141 ?auto_2656144 ) ) ( not ( = ?auto_2656142 ?auto_2656143 ) ) ( not ( = ?auto_2656142 ?auto_2656145 ) ) ( not ( = ?auto_2656142 ?auto_2656144 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2656143 ?auto_2656145 ?auto_2656144 )
      ( MAKE-4CRATE-VERIFY ?auto_2656141 ?auto_2656142 ?auto_2656143 ?auto_2656145 ?auto_2656144 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2656179 - SURFACE
      ?auto_2656180 - SURFACE
      ?auto_2656181 - SURFACE
      ?auto_2656183 - SURFACE
      ?auto_2656182 - SURFACE
    )
    :vars
    (
      ?auto_2656186 - HOIST
      ?auto_2656189 - PLACE
      ?auto_2656184 - TRUCK
      ?auto_2656185 - PLACE
      ?auto_2656187 - HOIST
      ?auto_2656188 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656186 ?auto_2656189 ) ( SURFACE-AT ?auto_2656183 ?auto_2656189 ) ( CLEAR ?auto_2656183 ) ( IS-CRATE ?auto_2656182 ) ( not ( = ?auto_2656183 ?auto_2656182 ) ) ( AVAILABLE ?auto_2656186 ) ( ON ?auto_2656183 ?auto_2656181 ) ( not ( = ?auto_2656181 ?auto_2656183 ) ) ( not ( = ?auto_2656181 ?auto_2656182 ) ) ( TRUCK-AT ?auto_2656184 ?auto_2656185 ) ( not ( = ?auto_2656185 ?auto_2656189 ) ) ( HOIST-AT ?auto_2656187 ?auto_2656185 ) ( not ( = ?auto_2656186 ?auto_2656187 ) ) ( AVAILABLE ?auto_2656187 ) ( SURFACE-AT ?auto_2656182 ?auto_2656185 ) ( ON ?auto_2656182 ?auto_2656188 ) ( CLEAR ?auto_2656182 ) ( not ( = ?auto_2656183 ?auto_2656188 ) ) ( not ( = ?auto_2656182 ?auto_2656188 ) ) ( not ( = ?auto_2656181 ?auto_2656188 ) ) ( ON ?auto_2656180 ?auto_2656179 ) ( ON ?auto_2656181 ?auto_2656180 ) ( not ( = ?auto_2656179 ?auto_2656180 ) ) ( not ( = ?auto_2656179 ?auto_2656181 ) ) ( not ( = ?auto_2656179 ?auto_2656183 ) ) ( not ( = ?auto_2656179 ?auto_2656182 ) ) ( not ( = ?auto_2656179 ?auto_2656188 ) ) ( not ( = ?auto_2656180 ?auto_2656181 ) ) ( not ( = ?auto_2656180 ?auto_2656183 ) ) ( not ( = ?auto_2656180 ?auto_2656182 ) ) ( not ( = ?auto_2656180 ?auto_2656188 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2656181 ?auto_2656183 ?auto_2656182 )
      ( MAKE-4CRATE-VERIFY ?auto_2656179 ?auto_2656180 ?auto_2656181 ?auto_2656183 ?auto_2656182 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2656218 - SURFACE
      ?auto_2656219 - SURFACE
      ?auto_2656220 - SURFACE
      ?auto_2656222 - SURFACE
      ?auto_2656221 - SURFACE
    )
    :vars
    (
      ?auto_2656227 - HOIST
      ?auto_2656224 - PLACE
      ?auto_2656223 - PLACE
      ?auto_2656228 - HOIST
      ?auto_2656225 - SURFACE
      ?auto_2656226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656227 ?auto_2656224 ) ( SURFACE-AT ?auto_2656222 ?auto_2656224 ) ( CLEAR ?auto_2656222 ) ( IS-CRATE ?auto_2656221 ) ( not ( = ?auto_2656222 ?auto_2656221 ) ) ( AVAILABLE ?auto_2656227 ) ( ON ?auto_2656222 ?auto_2656220 ) ( not ( = ?auto_2656220 ?auto_2656222 ) ) ( not ( = ?auto_2656220 ?auto_2656221 ) ) ( not ( = ?auto_2656223 ?auto_2656224 ) ) ( HOIST-AT ?auto_2656228 ?auto_2656223 ) ( not ( = ?auto_2656227 ?auto_2656228 ) ) ( AVAILABLE ?auto_2656228 ) ( SURFACE-AT ?auto_2656221 ?auto_2656223 ) ( ON ?auto_2656221 ?auto_2656225 ) ( CLEAR ?auto_2656221 ) ( not ( = ?auto_2656222 ?auto_2656225 ) ) ( not ( = ?auto_2656221 ?auto_2656225 ) ) ( not ( = ?auto_2656220 ?auto_2656225 ) ) ( TRUCK-AT ?auto_2656226 ?auto_2656224 ) ( ON ?auto_2656219 ?auto_2656218 ) ( ON ?auto_2656220 ?auto_2656219 ) ( not ( = ?auto_2656218 ?auto_2656219 ) ) ( not ( = ?auto_2656218 ?auto_2656220 ) ) ( not ( = ?auto_2656218 ?auto_2656222 ) ) ( not ( = ?auto_2656218 ?auto_2656221 ) ) ( not ( = ?auto_2656218 ?auto_2656225 ) ) ( not ( = ?auto_2656219 ?auto_2656220 ) ) ( not ( = ?auto_2656219 ?auto_2656222 ) ) ( not ( = ?auto_2656219 ?auto_2656221 ) ) ( not ( = ?auto_2656219 ?auto_2656225 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2656220 ?auto_2656222 ?auto_2656221 )
      ( MAKE-4CRATE-VERIFY ?auto_2656218 ?auto_2656219 ?auto_2656220 ?auto_2656222 ?auto_2656221 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2656257 - SURFACE
      ?auto_2656258 - SURFACE
      ?auto_2656259 - SURFACE
      ?auto_2656261 - SURFACE
      ?auto_2656260 - SURFACE
    )
    :vars
    (
      ?auto_2656262 - HOIST
      ?auto_2656267 - PLACE
      ?auto_2656264 - PLACE
      ?auto_2656263 - HOIST
      ?auto_2656265 - SURFACE
      ?auto_2656266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656262 ?auto_2656267 ) ( IS-CRATE ?auto_2656260 ) ( not ( = ?auto_2656261 ?auto_2656260 ) ) ( not ( = ?auto_2656259 ?auto_2656261 ) ) ( not ( = ?auto_2656259 ?auto_2656260 ) ) ( not ( = ?auto_2656264 ?auto_2656267 ) ) ( HOIST-AT ?auto_2656263 ?auto_2656264 ) ( not ( = ?auto_2656262 ?auto_2656263 ) ) ( AVAILABLE ?auto_2656263 ) ( SURFACE-AT ?auto_2656260 ?auto_2656264 ) ( ON ?auto_2656260 ?auto_2656265 ) ( CLEAR ?auto_2656260 ) ( not ( = ?auto_2656261 ?auto_2656265 ) ) ( not ( = ?auto_2656260 ?auto_2656265 ) ) ( not ( = ?auto_2656259 ?auto_2656265 ) ) ( TRUCK-AT ?auto_2656266 ?auto_2656267 ) ( SURFACE-AT ?auto_2656259 ?auto_2656267 ) ( CLEAR ?auto_2656259 ) ( LIFTING ?auto_2656262 ?auto_2656261 ) ( IS-CRATE ?auto_2656261 ) ( ON ?auto_2656258 ?auto_2656257 ) ( ON ?auto_2656259 ?auto_2656258 ) ( not ( = ?auto_2656257 ?auto_2656258 ) ) ( not ( = ?auto_2656257 ?auto_2656259 ) ) ( not ( = ?auto_2656257 ?auto_2656261 ) ) ( not ( = ?auto_2656257 ?auto_2656260 ) ) ( not ( = ?auto_2656257 ?auto_2656265 ) ) ( not ( = ?auto_2656258 ?auto_2656259 ) ) ( not ( = ?auto_2656258 ?auto_2656261 ) ) ( not ( = ?auto_2656258 ?auto_2656260 ) ) ( not ( = ?auto_2656258 ?auto_2656265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2656259 ?auto_2656261 ?auto_2656260 )
      ( MAKE-4CRATE-VERIFY ?auto_2656257 ?auto_2656258 ?auto_2656259 ?auto_2656261 ?auto_2656260 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2656296 - SURFACE
      ?auto_2656297 - SURFACE
      ?auto_2656298 - SURFACE
      ?auto_2656300 - SURFACE
      ?auto_2656299 - SURFACE
    )
    :vars
    (
      ?auto_2656301 - HOIST
      ?auto_2656302 - PLACE
      ?auto_2656306 - PLACE
      ?auto_2656303 - HOIST
      ?auto_2656304 - SURFACE
      ?auto_2656305 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656301 ?auto_2656302 ) ( IS-CRATE ?auto_2656299 ) ( not ( = ?auto_2656300 ?auto_2656299 ) ) ( not ( = ?auto_2656298 ?auto_2656300 ) ) ( not ( = ?auto_2656298 ?auto_2656299 ) ) ( not ( = ?auto_2656306 ?auto_2656302 ) ) ( HOIST-AT ?auto_2656303 ?auto_2656306 ) ( not ( = ?auto_2656301 ?auto_2656303 ) ) ( AVAILABLE ?auto_2656303 ) ( SURFACE-AT ?auto_2656299 ?auto_2656306 ) ( ON ?auto_2656299 ?auto_2656304 ) ( CLEAR ?auto_2656299 ) ( not ( = ?auto_2656300 ?auto_2656304 ) ) ( not ( = ?auto_2656299 ?auto_2656304 ) ) ( not ( = ?auto_2656298 ?auto_2656304 ) ) ( TRUCK-AT ?auto_2656305 ?auto_2656302 ) ( SURFACE-AT ?auto_2656298 ?auto_2656302 ) ( CLEAR ?auto_2656298 ) ( IS-CRATE ?auto_2656300 ) ( AVAILABLE ?auto_2656301 ) ( IN ?auto_2656300 ?auto_2656305 ) ( ON ?auto_2656297 ?auto_2656296 ) ( ON ?auto_2656298 ?auto_2656297 ) ( not ( = ?auto_2656296 ?auto_2656297 ) ) ( not ( = ?auto_2656296 ?auto_2656298 ) ) ( not ( = ?auto_2656296 ?auto_2656300 ) ) ( not ( = ?auto_2656296 ?auto_2656299 ) ) ( not ( = ?auto_2656296 ?auto_2656304 ) ) ( not ( = ?auto_2656297 ?auto_2656298 ) ) ( not ( = ?auto_2656297 ?auto_2656300 ) ) ( not ( = ?auto_2656297 ?auto_2656299 ) ) ( not ( = ?auto_2656297 ?auto_2656304 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2656298 ?auto_2656300 ?auto_2656299 )
      ( MAKE-4CRATE-VERIFY ?auto_2656296 ?auto_2656297 ?auto_2656298 ?auto_2656300 ?auto_2656299 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2656956 - SURFACE
      ?auto_2656957 - SURFACE
      ?auto_2656958 - SURFACE
      ?auto_2656960 - SURFACE
      ?auto_2656959 - SURFACE
      ?auto_2656961 - SURFACE
    )
    :vars
    (
      ?auto_2656962 - HOIST
      ?auto_2656963 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656962 ?auto_2656963 ) ( SURFACE-AT ?auto_2656959 ?auto_2656963 ) ( CLEAR ?auto_2656959 ) ( LIFTING ?auto_2656962 ?auto_2656961 ) ( IS-CRATE ?auto_2656961 ) ( not ( = ?auto_2656959 ?auto_2656961 ) ) ( ON ?auto_2656957 ?auto_2656956 ) ( ON ?auto_2656958 ?auto_2656957 ) ( ON ?auto_2656960 ?auto_2656958 ) ( ON ?auto_2656959 ?auto_2656960 ) ( not ( = ?auto_2656956 ?auto_2656957 ) ) ( not ( = ?auto_2656956 ?auto_2656958 ) ) ( not ( = ?auto_2656956 ?auto_2656960 ) ) ( not ( = ?auto_2656956 ?auto_2656959 ) ) ( not ( = ?auto_2656956 ?auto_2656961 ) ) ( not ( = ?auto_2656957 ?auto_2656958 ) ) ( not ( = ?auto_2656957 ?auto_2656960 ) ) ( not ( = ?auto_2656957 ?auto_2656959 ) ) ( not ( = ?auto_2656957 ?auto_2656961 ) ) ( not ( = ?auto_2656958 ?auto_2656960 ) ) ( not ( = ?auto_2656958 ?auto_2656959 ) ) ( not ( = ?auto_2656958 ?auto_2656961 ) ) ( not ( = ?auto_2656960 ?auto_2656959 ) ) ( not ( = ?auto_2656960 ?auto_2656961 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2656959 ?auto_2656961 )
      ( MAKE-5CRATE-VERIFY ?auto_2656956 ?auto_2656957 ?auto_2656958 ?auto_2656960 ?auto_2656959 ?auto_2656961 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2656990 - SURFACE
      ?auto_2656991 - SURFACE
      ?auto_2656992 - SURFACE
      ?auto_2656994 - SURFACE
      ?auto_2656993 - SURFACE
      ?auto_2656995 - SURFACE
    )
    :vars
    (
      ?auto_2656997 - HOIST
      ?auto_2656998 - PLACE
      ?auto_2656996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2656997 ?auto_2656998 ) ( SURFACE-AT ?auto_2656993 ?auto_2656998 ) ( CLEAR ?auto_2656993 ) ( IS-CRATE ?auto_2656995 ) ( not ( = ?auto_2656993 ?auto_2656995 ) ) ( TRUCK-AT ?auto_2656996 ?auto_2656998 ) ( AVAILABLE ?auto_2656997 ) ( IN ?auto_2656995 ?auto_2656996 ) ( ON ?auto_2656993 ?auto_2656994 ) ( not ( = ?auto_2656994 ?auto_2656993 ) ) ( not ( = ?auto_2656994 ?auto_2656995 ) ) ( ON ?auto_2656991 ?auto_2656990 ) ( ON ?auto_2656992 ?auto_2656991 ) ( ON ?auto_2656994 ?auto_2656992 ) ( not ( = ?auto_2656990 ?auto_2656991 ) ) ( not ( = ?auto_2656990 ?auto_2656992 ) ) ( not ( = ?auto_2656990 ?auto_2656994 ) ) ( not ( = ?auto_2656990 ?auto_2656993 ) ) ( not ( = ?auto_2656990 ?auto_2656995 ) ) ( not ( = ?auto_2656991 ?auto_2656992 ) ) ( not ( = ?auto_2656991 ?auto_2656994 ) ) ( not ( = ?auto_2656991 ?auto_2656993 ) ) ( not ( = ?auto_2656991 ?auto_2656995 ) ) ( not ( = ?auto_2656992 ?auto_2656994 ) ) ( not ( = ?auto_2656992 ?auto_2656993 ) ) ( not ( = ?auto_2656992 ?auto_2656995 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2656994 ?auto_2656993 ?auto_2656995 )
      ( MAKE-5CRATE-VERIFY ?auto_2656990 ?auto_2656991 ?auto_2656992 ?auto_2656994 ?auto_2656993 ?auto_2656995 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2657030 - SURFACE
      ?auto_2657031 - SURFACE
      ?auto_2657032 - SURFACE
      ?auto_2657034 - SURFACE
      ?auto_2657033 - SURFACE
      ?auto_2657035 - SURFACE
    )
    :vars
    (
      ?auto_2657038 - HOIST
      ?auto_2657036 - PLACE
      ?auto_2657039 - TRUCK
      ?auto_2657037 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657038 ?auto_2657036 ) ( SURFACE-AT ?auto_2657033 ?auto_2657036 ) ( CLEAR ?auto_2657033 ) ( IS-CRATE ?auto_2657035 ) ( not ( = ?auto_2657033 ?auto_2657035 ) ) ( AVAILABLE ?auto_2657038 ) ( IN ?auto_2657035 ?auto_2657039 ) ( ON ?auto_2657033 ?auto_2657034 ) ( not ( = ?auto_2657034 ?auto_2657033 ) ) ( not ( = ?auto_2657034 ?auto_2657035 ) ) ( TRUCK-AT ?auto_2657039 ?auto_2657037 ) ( not ( = ?auto_2657037 ?auto_2657036 ) ) ( ON ?auto_2657031 ?auto_2657030 ) ( ON ?auto_2657032 ?auto_2657031 ) ( ON ?auto_2657034 ?auto_2657032 ) ( not ( = ?auto_2657030 ?auto_2657031 ) ) ( not ( = ?auto_2657030 ?auto_2657032 ) ) ( not ( = ?auto_2657030 ?auto_2657034 ) ) ( not ( = ?auto_2657030 ?auto_2657033 ) ) ( not ( = ?auto_2657030 ?auto_2657035 ) ) ( not ( = ?auto_2657031 ?auto_2657032 ) ) ( not ( = ?auto_2657031 ?auto_2657034 ) ) ( not ( = ?auto_2657031 ?auto_2657033 ) ) ( not ( = ?auto_2657031 ?auto_2657035 ) ) ( not ( = ?auto_2657032 ?auto_2657034 ) ) ( not ( = ?auto_2657032 ?auto_2657033 ) ) ( not ( = ?auto_2657032 ?auto_2657035 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657034 ?auto_2657033 ?auto_2657035 )
      ( MAKE-5CRATE-VERIFY ?auto_2657030 ?auto_2657031 ?auto_2657032 ?auto_2657034 ?auto_2657033 ?auto_2657035 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2657075 - SURFACE
      ?auto_2657076 - SURFACE
      ?auto_2657077 - SURFACE
      ?auto_2657079 - SURFACE
      ?auto_2657078 - SURFACE
      ?auto_2657080 - SURFACE
    )
    :vars
    (
      ?auto_2657084 - HOIST
      ?auto_2657081 - PLACE
      ?auto_2657083 - TRUCK
      ?auto_2657085 - PLACE
      ?auto_2657082 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657084 ?auto_2657081 ) ( SURFACE-AT ?auto_2657078 ?auto_2657081 ) ( CLEAR ?auto_2657078 ) ( IS-CRATE ?auto_2657080 ) ( not ( = ?auto_2657078 ?auto_2657080 ) ) ( AVAILABLE ?auto_2657084 ) ( ON ?auto_2657078 ?auto_2657079 ) ( not ( = ?auto_2657079 ?auto_2657078 ) ) ( not ( = ?auto_2657079 ?auto_2657080 ) ) ( TRUCK-AT ?auto_2657083 ?auto_2657085 ) ( not ( = ?auto_2657085 ?auto_2657081 ) ) ( HOIST-AT ?auto_2657082 ?auto_2657085 ) ( LIFTING ?auto_2657082 ?auto_2657080 ) ( not ( = ?auto_2657084 ?auto_2657082 ) ) ( ON ?auto_2657076 ?auto_2657075 ) ( ON ?auto_2657077 ?auto_2657076 ) ( ON ?auto_2657079 ?auto_2657077 ) ( not ( = ?auto_2657075 ?auto_2657076 ) ) ( not ( = ?auto_2657075 ?auto_2657077 ) ) ( not ( = ?auto_2657075 ?auto_2657079 ) ) ( not ( = ?auto_2657075 ?auto_2657078 ) ) ( not ( = ?auto_2657075 ?auto_2657080 ) ) ( not ( = ?auto_2657076 ?auto_2657077 ) ) ( not ( = ?auto_2657076 ?auto_2657079 ) ) ( not ( = ?auto_2657076 ?auto_2657078 ) ) ( not ( = ?auto_2657076 ?auto_2657080 ) ) ( not ( = ?auto_2657077 ?auto_2657079 ) ) ( not ( = ?auto_2657077 ?auto_2657078 ) ) ( not ( = ?auto_2657077 ?auto_2657080 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657079 ?auto_2657078 ?auto_2657080 )
      ( MAKE-5CRATE-VERIFY ?auto_2657075 ?auto_2657076 ?auto_2657077 ?auto_2657079 ?auto_2657078 ?auto_2657080 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2657125 - SURFACE
      ?auto_2657126 - SURFACE
      ?auto_2657127 - SURFACE
      ?auto_2657129 - SURFACE
      ?auto_2657128 - SURFACE
      ?auto_2657130 - SURFACE
    )
    :vars
    (
      ?auto_2657134 - HOIST
      ?auto_2657132 - PLACE
      ?auto_2657135 - TRUCK
      ?auto_2657136 - PLACE
      ?auto_2657131 - HOIST
      ?auto_2657133 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657134 ?auto_2657132 ) ( SURFACE-AT ?auto_2657128 ?auto_2657132 ) ( CLEAR ?auto_2657128 ) ( IS-CRATE ?auto_2657130 ) ( not ( = ?auto_2657128 ?auto_2657130 ) ) ( AVAILABLE ?auto_2657134 ) ( ON ?auto_2657128 ?auto_2657129 ) ( not ( = ?auto_2657129 ?auto_2657128 ) ) ( not ( = ?auto_2657129 ?auto_2657130 ) ) ( TRUCK-AT ?auto_2657135 ?auto_2657136 ) ( not ( = ?auto_2657136 ?auto_2657132 ) ) ( HOIST-AT ?auto_2657131 ?auto_2657136 ) ( not ( = ?auto_2657134 ?auto_2657131 ) ) ( AVAILABLE ?auto_2657131 ) ( SURFACE-AT ?auto_2657130 ?auto_2657136 ) ( ON ?auto_2657130 ?auto_2657133 ) ( CLEAR ?auto_2657130 ) ( not ( = ?auto_2657128 ?auto_2657133 ) ) ( not ( = ?auto_2657130 ?auto_2657133 ) ) ( not ( = ?auto_2657129 ?auto_2657133 ) ) ( ON ?auto_2657126 ?auto_2657125 ) ( ON ?auto_2657127 ?auto_2657126 ) ( ON ?auto_2657129 ?auto_2657127 ) ( not ( = ?auto_2657125 ?auto_2657126 ) ) ( not ( = ?auto_2657125 ?auto_2657127 ) ) ( not ( = ?auto_2657125 ?auto_2657129 ) ) ( not ( = ?auto_2657125 ?auto_2657128 ) ) ( not ( = ?auto_2657125 ?auto_2657130 ) ) ( not ( = ?auto_2657125 ?auto_2657133 ) ) ( not ( = ?auto_2657126 ?auto_2657127 ) ) ( not ( = ?auto_2657126 ?auto_2657129 ) ) ( not ( = ?auto_2657126 ?auto_2657128 ) ) ( not ( = ?auto_2657126 ?auto_2657130 ) ) ( not ( = ?auto_2657126 ?auto_2657133 ) ) ( not ( = ?auto_2657127 ?auto_2657129 ) ) ( not ( = ?auto_2657127 ?auto_2657128 ) ) ( not ( = ?auto_2657127 ?auto_2657130 ) ) ( not ( = ?auto_2657127 ?auto_2657133 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657129 ?auto_2657128 ?auto_2657130 )
      ( MAKE-5CRATE-VERIFY ?auto_2657125 ?auto_2657126 ?auto_2657127 ?auto_2657129 ?auto_2657128 ?auto_2657130 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2657176 - SURFACE
      ?auto_2657177 - SURFACE
      ?auto_2657178 - SURFACE
      ?auto_2657180 - SURFACE
      ?auto_2657179 - SURFACE
      ?auto_2657181 - SURFACE
    )
    :vars
    (
      ?auto_2657186 - HOIST
      ?auto_2657187 - PLACE
      ?auto_2657183 - PLACE
      ?auto_2657185 - HOIST
      ?auto_2657182 - SURFACE
      ?auto_2657184 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657186 ?auto_2657187 ) ( SURFACE-AT ?auto_2657179 ?auto_2657187 ) ( CLEAR ?auto_2657179 ) ( IS-CRATE ?auto_2657181 ) ( not ( = ?auto_2657179 ?auto_2657181 ) ) ( AVAILABLE ?auto_2657186 ) ( ON ?auto_2657179 ?auto_2657180 ) ( not ( = ?auto_2657180 ?auto_2657179 ) ) ( not ( = ?auto_2657180 ?auto_2657181 ) ) ( not ( = ?auto_2657183 ?auto_2657187 ) ) ( HOIST-AT ?auto_2657185 ?auto_2657183 ) ( not ( = ?auto_2657186 ?auto_2657185 ) ) ( AVAILABLE ?auto_2657185 ) ( SURFACE-AT ?auto_2657181 ?auto_2657183 ) ( ON ?auto_2657181 ?auto_2657182 ) ( CLEAR ?auto_2657181 ) ( not ( = ?auto_2657179 ?auto_2657182 ) ) ( not ( = ?auto_2657181 ?auto_2657182 ) ) ( not ( = ?auto_2657180 ?auto_2657182 ) ) ( TRUCK-AT ?auto_2657184 ?auto_2657187 ) ( ON ?auto_2657177 ?auto_2657176 ) ( ON ?auto_2657178 ?auto_2657177 ) ( ON ?auto_2657180 ?auto_2657178 ) ( not ( = ?auto_2657176 ?auto_2657177 ) ) ( not ( = ?auto_2657176 ?auto_2657178 ) ) ( not ( = ?auto_2657176 ?auto_2657180 ) ) ( not ( = ?auto_2657176 ?auto_2657179 ) ) ( not ( = ?auto_2657176 ?auto_2657181 ) ) ( not ( = ?auto_2657176 ?auto_2657182 ) ) ( not ( = ?auto_2657177 ?auto_2657178 ) ) ( not ( = ?auto_2657177 ?auto_2657180 ) ) ( not ( = ?auto_2657177 ?auto_2657179 ) ) ( not ( = ?auto_2657177 ?auto_2657181 ) ) ( not ( = ?auto_2657177 ?auto_2657182 ) ) ( not ( = ?auto_2657178 ?auto_2657180 ) ) ( not ( = ?auto_2657178 ?auto_2657179 ) ) ( not ( = ?auto_2657178 ?auto_2657181 ) ) ( not ( = ?auto_2657178 ?auto_2657182 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657180 ?auto_2657179 ?auto_2657181 )
      ( MAKE-5CRATE-VERIFY ?auto_2657176 ?auto_2657177 ?auto_2657178 ?auto_2657180 ?auto_2657179 ?auto_2657181 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2657227 - SURFACE
      ?auto_2657228 - SURFACE
      ?auto_2657229 - SURFACE
      ?auto_2657231 - SURFACE
      ?auto_2657230 - SURFACE
      ?auto_2657232 - SURFACE
    )
    :vars
    (
      ?auto_2657235 - HOIST
      ?auto_2657237 - PLACE
      ?auto_2657238 - PLACE
      ?auto_2657233 - HOIST
      ?auto_2657236 - SURFACE
      ?auto_2657234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657235 ?auto_2657237 ) ( IS-CRATE ?auto_2657232 ) ( not ( = ?auto_2657230 ?auto_2657232 ) ) ( not ( = ?auto_2657231 ?auto_2657230 ) ) ( not ( = ?auto_2657231 ?auto_2657232 ) ) ( not ( = ?auto_2657238 ?auto_2657237 ) ) ( HOIST-AT ?auto_2657233 ?auto_2657238 ) ( not ( = ?auto_2657235 ?auto_2657233 ) ) ( AVAILABLE ?auto_2657233 ) ( SURFACE-AT ?auto_2657232 ?auto_2657238 ) ( ON ?auto_2657232 ?auto_2657236 ) ( CLEAR ?auto_2657232 ) ( not ( = ?auto_2657230 ?auto_2657236 ) ) ( not ( = ?auto_2657232 ?auto_2657236 ) ) ( not ( = ?auto_2657231 ?auto_2657236 ) ) ( TRUCK-AT ?auto_2657234 ?auto_2657237 ) ( SURFACE-AT ?auto_2657231 ?auto_2657237 ) ( CLEAR ?auto_2657231 ) ( LIFTING ?auto_2657235 ?auto_2657230 ) ( IS-CRATE ?auto_2657230 ) ( ON ?auto_2657228 ?auto_2657227 ) ( ON ?auto_2657229 ?auto_2657228 ) ( ON ?auto_2657231 ?auto_2657229 ) ( not ( = ?auto_2657227 ?auto_2657228 ) ) ( not ( = ?auto_2657227 ?auto_2657229 ) ) ( not ( = ?auto_2657227 ?auto_2657231 ) ) ( not ( = ?auto_2657227 ?auto_2657230 ) ) ( not ( = ?auto_2657227 ?auto_2657232 ) ) ( not ( = ?auto_2657227 ?auto_2657236 ) ) ( not ( = ?auto_2657228 ?auto_2657229 ) ) ( not ( = ?auto_2657228 ?auto_2657231 ) ) ( not ( = ?auto_2657228 ?auto_2657230 ) ) ( not ( = ?auto_2657228 ?auto_2657232 ) ) ( not ( = ?auto_2657228 ?auto_2657236 ) ) ( not ( = ?auto_2657229 ?auto_2657231 ) ) ( not ( = ?auto_2657229 ?auto_2657230 ) ) ( not ( = ?auto_2657229 ?auto_2657232 ) ) ( not ( = ?auto_2657229 ?auto_2657236 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657231 ?auto_2657230 ?auto_2657232 )
      ( MAKE-5CRATE-VERIFY ?auto_2657227 ?auto_2657228 ?auto_2657229 ?auto_2657231 ?auto_2657230 ?auto_2657232 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2657278 - SURFACE
      ?auto_2657279 - SURFACE
      ?auto_2657280 - SURFACE
      ?auto_2657282 - SURFACE
      ?auto_2657281 - SURFACE
      ?auto_2657283 - SURFACE
    )
    :vars
    (
      ?auto_2657288 - HOIST
      ?auto_2657289 - PLACE
      ?auto_2657286 - PLACE
      ?auto_2657287 - HOIST
      ?auto_2657284 - SURFACE
      ?auto_2657285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657288 ?auto_2657289 ) ( IS-CRATE ?auto_2657283 ) ( not ( = ?auto_2657281 ?auto_2657283 ) ) ( not ( = ?auto_2657282 ?auto_2657281 ) ) ( not ( = ?auto_2657282 ?auto_2657283 ) ) ( not ( = ?auto_2657286 ?auto_2657289 ) ) ( HOIST-AT ?auto_2657287 ?auto_2657286 ) ( not ( = ?auto_2657288 ?auto_2657287 ) ) ( AVAILABLE ?auto_2657287 ) ( SURFACE-AT ?auto_2657283 ?auto_2657286 ) ( ON ?auto_2657283 ?auto_2657284 ) ( CLEAR ?auto_2657283 ) ( not ( = ?auto_2657281 ?auto_2657284 ) ) ( not ( = ?auto_2657283 ?auto_2657284 ) ) ( not ( = ?auto_2657282 ?auto_2657284 ) ) ( TRUCK-AT ?auto_2657285 ?auto_2657289 ) ( SURFACE-AT ?auto_2657282 ?auto_2657289 ) ( CLEAR ?auto_2657282 ) ( IS-CRATE ?auto_2657281 ) ( AVAILABLE ?auto_2657288 ) ( IN ?auto_2657281 ?auto_2657285 ) ( ON ?auto_2657279 ?auto_2657278 ) ( ON ?auto_2657280 ?auto_2657279 ) ( ON ?auto_2657282 ?auto_2657280 ) ( not ( = ?auto_2657278 ?auto_2657279 ) ) ( not ( = ?auto_2657278 ?auto_2657280 ) ) ( not ( = ?auto_2657278 ?auto_2657282 ) ) ( not ( = ?auto_2657278 ?auto_2657281 ) ) ( not ( = ?auto_2657278 ?auto_2657283 ) ) ( not ( = ?auto_2657278 ?auto_2657284 ) ) ( not ( = ?auto_2657279 ?auto_2657280 ) ) ( not ( = ?auto_2657279 ?auto_2657282 ) ) ( not ( = ?auto_2657279 ?auto_2657281 ) ) ( not ( = ?auto_2657279 ?auto_2657283 ) ) ( not ( = ?auto_2657279 ?auto_2657284 ) ) ( not ( = ?auto_2657280 ?auto_2657282 ) ) ( not ( = ?auto_2657280 ?auto_2657281 ) ) ( not ( = ?auto_2657280 ?auto_2657283 ) ) ( not ( = ?auto_2657280 ?auto_2657284 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657282 ?auto_2657281 ?auto_2657283 )
      ( MAKE-5CRATE-VERIFY ?auto_2657278 ?auto_2657279 ?auto_2657280 ?auto_2657282 ?auto_2657281 ?auto_2657283 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2657290 - SURFACE
      ?auto_2657291 - SURFACE
    )
    :vars
    (
      ?auto_2657297 - HOIST
      ?auto_2657298 - PLACE
      ?auto_2657296 - SURFACE
      ?auto_2657294 - PLACE
      ?auto_2657295 - HOIST
      ?auto_2657292 - SURFACE
      ?auto_2657293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657297 ?auto_2657298 ) ( IS-CRATE ?auto_2657291 ) ( not ( = ?auto_2657290 ?auto_2657291 ) ) ( not ( = ?auto_2657296 ?auto_2657290 ) ) ( not ( = ?auto_2657296 ?auto_2657291 ) ) ( not ( = ?auto_2657294 ?auto_2657298 ) ) ( HOIST-AT ?auto_2657295 ?auto_2657294 ) ( not ( = ?auto_2657297 ?auto_2657295 ) ) ( AVAILABLE ?auto_2657295 ) ( SURFACE-AT ?auto_2657291 ?auto_2657294 ) ( ON ?auto_2657291 ?auto_2657292 ) ( CLEAR ?auto_2657291 ) ( not ( = ?auto_2657290 ?auto_2657292 ) ) ( not ( = ?auto_2657291 ?auto_2657292 ) ) ( not ( = ?auto_2657296 ?auto_2657292 ) ) ( SURFACE-AT ?auto_2657296 ?auto_2657298 ) ( CLEAR ?auto_2657296 ) ( IS-CRATE ?auto_2657290 ) ( AVAILABLE ?auto_2657297 ) ( IN ?auto_2657290 ?auto_2657293 ) ( TRUCK-AT ?auto_2657293 ?auto_2657294 ) )
    :subtasks
    ( ( !DRIVE ?auto_2657293 ?auto_2657294 ?auto_2657298 )
      ( MAKE-2CRATE ?auto_2657296 ?auto_2657290 ?auto_2657291 )
      ( MAKE-1CRATE-VERIFY ?auto_2657290 ?auto_2657291 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2657299 - SURFACE
      ?auto_2657300 - SURFACE
      ?auto_2657301 - SURFACE
    )
    :vars
    (
      ?auto_2657306 - HOIST
      ?auto_2657302 - PLACE
      ?auto_2657304 - PLACE
      ?auto_2657305 - HOIST
      ?auto_2657303 - SURFACE
      ?auto_2657307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657306 ?auto_2657302 ) ( IS-CRATE ?auto_2657301 ) ( not ( = ?auto_2657300 ?auto_2657301 ) ) ( not ( = ?auto_2657299 ?auto_2657300 ) ) ( not ( = ?auto_2657299 ?auto_2657301 ) ) ( not ( = ?auto_2657304 ?auto_2657302 ) ) ( HOIST-AT ?auto_2657305 ?auto_2657304 ) ( not ( = ?auto_2657306 ?auto_2657305 ) ) ( AVAILABLE ?auto_2657305 ) ( SURFACE-AT ?auto_2657301 ?auto_2657304 ) ( ON ?auto_2657301 ?auto_2657303 ) ( CLEAR ?auto_2657301 ) ( not ( = ?auto_2657300 ?auto_2657303 ) ) ( not ( = ?auto_2657301 ?auto_2657303 ) ) ( not ( = ?auto_2657299 ?auto_2657303 ) ) ( SURFACE-AT ?auto_2657299 ?auto_2657302 ) ( CLEAR ?auto_2657299 ) ( IS-CRATE ?auto_2657300 ) ( AVAILABLE ?auto_2657306 ) ( IN ?auto_2657300 ?auto_2657307 ) ( TRUCK-AT ?auto_2657307 ?auto_2657304 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2657300 ?auto_2657301 )
      ( MAKE-2CRATE-VERIFY ?auto_2657299 ?auto_2657300 ?auto_2657301 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2657308 - SURFACE
      ?auto_2657309 - SURFACE
      ?auto_2657310 - SURFACE
      ?auto_2657311 - SURFACE
    )
    :vars
    (
      ?auto_2657314 - HOIST
      ?auto_2657313 - PLACE
      ?auto_2657317 - PLACE
      ?auto_2657315 - HOIST
      ?auto_2657312 - SURFACE
      ?auto_2657316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657314 ?auto_2657313 ) ( IS-CRATE ?auto_2657311 ) ( not ( = ?auto_2657310 ?auto_2657311 ) ) ( not ( = ?auto_2657309 ?auto_2657310 ) ) ( not ( = ?auto_2657309 ?auto_2657311 ) ) ( not ( = ?auto_2657317 ?auto_2657313 ) ) ( HOIST-AT ?auto_2657315 ?auto_2657317 ) ( not ( = ?auto_2657314 ?auto_2657315 ) ) ( AVAILABLE ?auto_2657315 ) ( SURFACE-AT ?auto_2657311 ?auto_2657317 ) ( ON ?auto_2657311 ?auto_2657312 ) ( CLEAR ?auto_2657311 ) ( not ( = ?auto_2657310 ?auto_2657312 ) ) ( not ( = ?auto_2657311 ?auto_2657312 ) ) ( not ( = ?auto_2657309 ?auto_2657312 ) ) ( SURFACE-AT ?auto_2657309 ?auto_2657313 ) ( CLEAR ?auto_2657309 ) ( IS-CRATE ?auto_2657310 ) ( AVAILABLE ?auto_2657314 ) ( IN ?auto_2657310 ?auto_2657316 ) ( TRUCK-AT ?auto_2657316 ?auto_2657317 ) ( ON ?auto_2657309 ?auto_2657308 ) ( not ( = ?auto_2657308 ?auto_2657309 ) ) ( not ( = ?auto_2657308 ?auto_2657310 ) ) ( not ( = ?auto_2657308 ?auto_2657311 ) ) ( not ( = ?auto_2657308 ?auto_2657312 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657309 ?auto_2657310 ?auto_2657311 )
      ( MAKE-3CRATE-VERIFY ?auto_2657308 ?auto_2657309 ?auto_2657310 ?auto_2657311 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2657318 - SURFACE
      ?auto_2657319 - SURFACE
      ?auto_2657320 - SURFACE
      ?auto_2657322 - SURFACE
      ?auto_2657321 - SURFACE
    )
    :vars
    (
      ?auto_2657325 - HOIST
      ?auto_2657324 - PLACE
      ?auto_2657328 - PLACE
      ?auto_2657326 - HOIST
      ?auto_2657323 - SURFACE
      ?auto_2657327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657325 ?auto_2657324 ) ( IS-CRATE ?auto_2657321 ) ( not ( = ?auto_2657322 ?auto_2657321 ) ) ( not ( = ?auto_2657320 ?auto_2657322 ) ) ( not ( = ?auto_2657320 ?auto_2657321 ) ) ( not ( = ?auto_2657328 ?auto_2657324 ) ) ( HOIST-AT ?auto_2657326 ?auto_2657328 ) ( not ( = ?auto_2657325 ?auto_2657326 ) ) ( AVAILABLE ?auto_2657326 ) ( SURFACE-AT ?auto_2657321 ?auto_2657328 ) ( ON ?auto_2657321 ?auto_2657323 ) ( CLEAR ?auto_2657321 ) ( not ( = ?auto_2657322 ?auto_2657323 ) ) ( not ( = ?auto_2657321 ?auto_2657323 ) ) ( not ( = ?auto_2657320 ?auto_2657323 ) ) ( SURFACE-AT ?auto_2657320 ?auto_2657324 ) ( CLEAR ?auto_2657320 ) ( IS-CRATE ?auto_2657322 ) ( AVAILABLE ?auto_2657325 ) ( IN ?auto_2657322 ?auto_2657327 ) ( TRUCK-AT ?auto_2657327 ?auto_2657328 ) ( ON ?auto_2657319 ?auto_2657318 ) ( ON ?auto_2657320 ?auto_2657319 ) ( not ( = ?auto_2657318 ?auto_2657319 ) ) ( not ( = ?auto_2657318 ?auto_2657320 ) ) ( not ( = ?auto_2657318 ?auto_2657322 ) ) ( not ( = ?auto_2657318 ?auto_2657321 ) ) ( not ( = ?auto_2657318 ?auto_2657323 ) ) ( not ( = ?auto_2657319 ?auto_2657320 ) ) ( not ( = ?auto_2657319 ?auto_2657322 ) ) ( not ( = ?auto_2657319 ?auto_2657321 ) ) ( not ( = ?auto_2657319 ?auto_2657323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657320 ?auto_2657322 ?auto_2657321 )
      ( MAKE-4CRATE-VERIFY ?auto_2657318 ?auto_2657319 ?auto_2657320 ?auto_2657322 ?auto_2657321 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2657329 - SURFACE
      ?auto_2657330 - SURFACE
      ?auto_2657331 - SURFACE
      ?auto_2657333 - SURFACE
      ?auto_2657332 - SURFACE
      ?auto_2657334 - SURFACE
    )
    :vars
    (
      ?auto_2657337 - HOIST
      ?auto_2657336 - PLACE
      ?auto_2657340 - PLACE
      ?auto_2657338 - HOIST
      ?auto_2657335 - SURFACE
      ?auto_2657339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657337 ?auto_2657336 ) ( IS-CRATE ?auto_2657334 ) ( not ( = ?auto_2657332 ?auto_2657334 ) ) ( not ( = ?auto_2657333 ?auto_2657332 ) ) ( not ( = ?auto_2657333 ?auto_2657334 ) ) ( not ( = ?auto_2657340 ?auto_2657336 ) ) ( HOIST-AT ?auto_2657338 ?auto_2657340 ) ( not ( = ?auto_2657337 ?auto_2657338 ) ) ( AVAILABLE ?auto_2657338 ) ( SURFACE-AT ?auto_2657334 ?auto_2657340 ) ( ON ?auto_2657334 ?auto_2657335 ) ( CLEAR ?auto_2657334 ) ( not ( = ?auto_2657332 ?auto_2657335 ) ) ( not ( = ?auto_2657334 ?auto_2657335 ) ) ( not ( = ?auto_2657333 ?auto_2657335 ) ) ( SURFACE-AT ?auto_2657333 ?auto_2657336 ) ( CLEAR ?auto_2657333 ) ( IS-CRATE ?auto_2657332 ) ( AVAILABLE ?auto_2657337 ) ( IN ?auto_2657332 ?auto_2657339 ) ( TRUCK-AT ?auto_2657339 ?auto_2657340 ) ( ON ?auto_2657330 ?auto_2657329 ) ( ON ?auto_2657331 ?auto_2657330 ) ( ON ?auto_2657333 ?auto_2657331 ) ( not ( = ?auto_2657329 ?auto_2657330 ) ) ( not ( = ?auto_2657329 ?auto_2657331 ) ) ( not ( = ?auto_2657329 ?auto_2657333 ) ) ( not ( = ?auto_2657329 ?auto_2657332 ) ) ( not ( = ?auto_2657329 ?auto_2657334 ) ) ( not ( = ?auto_2657329 ?auto_2657335 ) ) ( not ( = ?auto_2657330 ?auto_2657331 ) ) ( not ( = ?auto_2657330 ?auto_2657333 ) ) ( not ( = ?auto_2657330 ?auto_2657332 ) ) ( not ( = ?auto_2657330 ?auto_2657334 ) ) ( not ( = ?auto_2657330 ?auto_2657335 ) ) ( not ( = ?auto_2657331 ?auto_2657333 ) ) ( not ( = ?auto_2657331 ?auto_2657332 ) ) ( not ( = ?auto_2657331 ?auto_2657334 ) ) ( not ( = ?auto_2657331 ?auto_2657335 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657333 ?auto_2657332 ?auto_2657334 )
      ( MAKE-5CRATE-VERIFY ?auto_2657329 ?auto_2657330 ?auto_2657331 ?auto_2657333 ?auto_2657332 ?auto_2657334 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2657341 - SURFACE
      ?auto_2657342 - SURFACE
    )
    :vars
    (
      ?auto_2657346 - HOIST
      ?auto_2657344 - PLACE
      ?auto_2657345 - SURFACE
      ?auto_2657349 - PLACE
      ?auto_2657347 - HOIST
      ?auto_2657343 - SURFACE
      ?auto_2657348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657346 ?auto_2657344 ) ( IS-CRATE ?auto_2657342 ) ( not ( = ?auto_2657341 ?auto_2657342 ) ) ( not ( = ?auto_2657345 ?auto_2657341 ) ) ( not ( = ?auto_2657345 ?auto_2657342 ) ) ( not ( = ?auto_2657349 ?auto_2657344 ) ) ( HOIST-AT ?auto_2657347 ?auto_2657349 ) ( not ( = ?auto_2657346 ?auto_2657347 ) ) ( SURFACE-AT ?auto_2657342 ?auto_2657349 ) ( ON ?auto_2657342 ?auto_2657343 ) ( CLEAR ?auto_2657342 ) ( not ( = ?auto_2657341 ?auto_2657343 ) ) ( not ( = ?auto_2657342 ?auto_2657343 ) ) ( not ( = ?auto_2657345 ?auto_2657343 ) ) ( SURFACE-AT ?auto_2657345 ?auto_2657344 ) ( CLEAR ?auto_2657345 ) ( IS-CRATE ?auto_2657341 ) ( AVAILABLE ?auto_2657346 ) ( TRUCK-AT ?auto_2657348 ?auto_2657349 ) ( LIFTING ?auto_2657347 ?auto_2657341 ) )
    :subtasks
    ( ( !LOAD ?auto_2657347 ?auto_2657341 ?auto_2657348 ?auto_2657349 )
      ( MAKE-2CRATE ?auto_2657345 ?auto_2657341 ?auto_2657342 )
      ( MAKE-1CRATE-VERIFY ?auto_2657341 ?auto_2657342 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2657350 - SURFACE
      ?auto_2657351 - SURFACE
      ?auto_2657352 - SURFACE
    )
    :vars
    (
      ?auto_2657358 - HOIST
      ?auto_2657357 - PLACE
      ?auto_2657354 - PLACE
      ?auto_2657355 - HOIST
      ?auto_2657353 - SURFACE
      ?auto_2657356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657358 ?auto_2657357 ) ( IS-CRATE ?auto_2657352 ) ( not ( = ?auto_2657351 ?auto_2657352 ) ) ( not ( = ?auto_2657350 ?auto_2657351 ) ) ( not ( = ?auto_2657350 ?auto_2657352 ) ) ( not ( = ?auto_2657354 ?auto_2657357 ) ) ( HOIST-AT ?auto_2657355 ?auto_2657354 ) ( not ( = ?auto_2657358 ?auto_2657355 ) ) ( SURFACE-AT ?auto_2657352 ?auto_2657354 ) ( ON ?auto_2657352 ?auto_2657353 ) ( CLEAR ?auto_2657352 ) ( not ( = ?auto_2657351 ?auto_2657353 ) ) ( not ( = ?auto_2657352 ?auto_2657353 ) ) ( not ( = ?auto_2657350 ?auto_2657353 ) ) ( SURFACE-AT ?auto_2657350 ?auto_2657357 ) ( CLEAR ?auto_2657350 ) ( IS-CRATE ?auto_2657351 ) ( AVAILABLE ?auto_2657358 ) ( TRUCK-AT ?auto_2657356 ?auto_2657354 ) ( LIFTING ?auto_2657355 ?auto_2657351 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2657351 ?auto_2657352 )
      ( MAKE-2CRATE-VERIFY ?auto_2657350 ?auto_2657351 ?auto_2657352 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2657359 - SURFACE
      ?auto_2657360 - SURFACE
      ?auto_2657361 - SURFACE
      ?auto_2657362 - SURFACE
    )
    :vars
    (
      ?auto_2657363 - HOIST
      ?auto_2657364 - PLACE
      ?auto_2657368 - PLACE
      ?auto_2657365 - HOIST
      ?auto_2657366 - SURFACE
      ?auto_2657367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657363 ?auto_2657364 ) ( IS-CRATE ?auto_2657362 ) ( not ( = ?auto_2657361 ?auto_2657362 ) ) ( not ( = ?auto_2657360 ?auto_2657361 ) ) ( not ( = ?auto_2657360 ?auto_2657362 ) ) ( not ( = ?auto_2657368 ?auto_2657364 ) ) ( HOIST-AT ?auto_2657365 ?auto_2657368 ) ( not ( = ?auto_2657363 ?auto_2657365 ) ) ( SURFACE-AT ?auto_2657362 ?auto_2657368 ) ( ON ?auto_2657362 ?auto_2657366 ) ( CLEAR ?auto_2657362 ) ( not ( = ?auto_2657361 ?auto_2657366 ) ) ( not ( = ?auto_2657362 ?auto_2657366 ) ) ( not ( = ?auto_2657360 ?auto_2657366 ) ) ( SURFACE-AT ?auto_2657360 ?auto_2657364 ) ( CLEAR ?auto_2657360 ) ( IS-CRATE ?auto_2657361 ) ( AVAILABLE ?auto_2657363 ) ( TRUCK-AT ?auto_2657367 ?auto_2657368 ) ( LIFTING ?auto_2657365 ?auto_2657361 ) ( ON ?auto_2657360 ?auto_2657359 ) ( not ( = ?auto_2657359 ?auto_2657360 ) ) ( not ( = ?auto_2657359 ?auto_2657361 ) ) ( not ( = ?auto_2657359 ?auto_2657362 ) ) ( not ( = ?auto_2657359 ?auto_2657366 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657360 ?auto_2657361 ?auto_2657362 )
      ( MAKE-3CRATE-VERIFY ?auto_2657359 ?auto_2657360 ?auto_2657361 ?auto_2657362 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2657369 - SURFACE
      ?auto_2657370 - SURFACE
      ?auto_2657371 - SURFACE
      ?auto_2657373 - SURFACE
      ?auto_2657372 - SURFACE
    )
    :vars
    (
      ?auto_2657374 - HOIST
      ?auto_2657375 - PLACE
      ?auto_2657379 - PLACE
      ?auto_2657376 - HOIST
      ?auto_2657377 - SURFACE
      ?auto_2657378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657374 ?auto_2657375 ) ( IS-CRATE ?auto_2657372 ) ( not ( = ?auto_2657373 ?auto_2657372 ) ) ( not ( = ?auto_2657371 ?auto_2657373 ) ) ( not ( = ?auto_2657371 ?auto_2657372 ) ) ( not ( = ?auto_2657379 ?auto_2657375 ) ) ( HOIST-AT ?auto_2657376 ?auto_2657379 ) ( not ( = ?auto_2657374 ?auto_2657376 ) ) ( SURFACE-AT ?auto_2657372 ?auto_2657379 ) ( ON ?auto_2657372 ?auto_2657377 ) ( CLEAR ?auto_2657372 ) ( not ( = ?auto_2657373 ?auto_2657377 ) ) ( not ( = ?auto_2657372 ?auto_2657377 ) ) ( not ( = ?auto_2657371 ?auto_2657377 ) ) ( SURFACE-AT ?auto_2657371 ?auto_2657375 ) ( CLEAR ?auto_2657371 ) ( IS-CRATE ?auto_2657373 ) ( AVAILABLE ?auto_2657374 ) ( TRUCK-AT ?auto_2657378 ?auto_2657379 ) ( LIFTING ?auto_2657376 ?auto_2657373 ) ( ON ?auto_2657370 ?auto_2657369 ) ( ON ?auto_2657371 ?auto_2657370 ) ( not ( = ?auto_2657369 ?auto_2657370 ) ) ( not ( = ?auto_2657369 ?auto_2657371 ) ) ( not ( = ?auto_2657369 ?auto_2657373 ) ) ( not ( = ?auto_2657369 ?auto_2657372 ) ) ( not ( = ?auto_2657369 ?auto_2657377 ) ) ( not ( = ?auto_2657370 ?auto_2657371 ) ) ( not ( = ?auto_2657370 ?auto_2657373 ) ) ( not ( = ?auto_2657370 ?auto_2657372 ) ) ( not ( = ?auto_2657370 ?auto_2657377 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657371 ?auto_2657373 ?auto_2657372 )
      ( MAKE-4CRATE-VERIFY ?auto_2657369 ?auto_2657370 ?auto_2657371 ?auto_2657373 ?auto_2657372 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2657380 - SURFACE
      ?auto_2657381 - SURFACE
      ?auto_2657382 - SURFACE
      ?auto_2657384 - SURFACE
      ?auto_2657383 - SURFACE
      ?auto_2657385 - SURFACE
    )
    :vars
    (
      ?auto_2657386 - HOIST
      ?auto_2657387 - PLACE
      ?auto_2657391 - PLACE
      ?auto_2657388 - HOIST
      ?auto_2657389 - SURFACE
      ?auto_2657390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657386 ?auto_2657387 ) ( IS-CRATE ?auto_2657385 ) ( not ( = ?auto_2657383 ?auto_2657385 ) ) ( not ( = ?auto_2657384 ?auto_2657383 ) ) ( not ( = ?auto_2657384 ?auto_2657385 ) ) ( not ( = ?auto_2657391 ?auto_2657387 ) ) ( HOIST-AT ?auto_2657388 ?auto_2657391 ) ( not ( = ?auto_2657386 ?auto_2657388 ) ) ( SURFACE-AT ?auto_2657385 ?auto_2657391 ) ( ON ?auto_2657385 ?auto_2657389 ) ( CLEAR ?auto_2657385 ) ( not ( = ?auto_2657383 ?auto_2657389 ) ) ( not ( = ?auto_2657385 ?auto_2657389 ) ) ( not ( = ?auto_2657384 ?auto_2657389 ) ) ( SURFACE-AT ?auto_2657384 ?auto_2657387 ) ( CLEAR ?auto_2657384 ) ( IS-CRATE ?auto_2657383 ) ( AVAILABLE ?auto_2657386 ) ( TRUCK-AT ?auto_2657390 ?auto_2657391 ) ( LIFTING ?auto_2657388 ?auto_2657383 ) ( ON ?auto_2657381 ?auto_2657380 ) ( ON ?auto_2657382 ?auto_2657381 ) ( ON ?auto_2657384 ?auto_2657382 ) ( not ( = ?auto_2657380 ?auto_2657381 ) ) ( not ( = ?auto_2657380 ?auto_2657382 ) ) ( not ( = ?auto_2657380 ?auto_2657384 ) ) ( not ( = ?auto_2657380 ?auto_2657383 ) ) ( not ( = ?auto_2657380 ?auto_2657385 ) ) ( not ( = ?auto_2657380 ?auto_2657389 ) ) ( not ( = ?auto_2657381 ?auto_2657382 ) ) ( not ( = ?auto_2657381 ?auto_2657384 ) ) ( not ( = ?auto_2657381 ?auto_2657383 ) ) ( not ( = ?auto_2657381 ?auto_2657385 ) ) ( not ( = ?auto_2657381 ?auto_2657389 ) ) ( not ( = ?auto_2657382 ?auto_2657384 ) ) ( not ( = ?auto_2657382 ?auto_2657383 ) ) ( not ( = ?auto_2657382 ?auto_2657385 ) ) ( not ( = ?auto_2657382 ?auto_2657389 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657384 ?auto_2657383 ?auto_2657385 )
      ( MAKE-5CRATE-VERIFY ?auto_2657380 ?auto_2657381 ?auto_2657382 ?auto_2657384 ?auto_2657383 ?auto_2657385 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2657392 - SURFACE
      ?auto_2657393 - SURFACE
    )
    :vars
    (
      ?auto_2657395 - HOIST
      ?auto_2657396 - PLACE
      ?auto_2657394 - SURFACE
      ?auto_2657400 - PLACE
      ?auto_2657397 - HOIST
      ?auto_2657398 - SURFACE
      ?auto_2657399 - TRUCK
      ?auto_2657401 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657395 ?auto_2657396 ) ( IS-CRATE ?auto_2657393 ) ( not ( = ?auto_2657392 ?auto_2657393 ) ) ( not ( = ?auto_2657394 ?auto_2657392 ) ) ( not ( = ?auto_2657394 ?auto_2657393 ) ) ( not ( = ?auto_2657400 ?auto_2657396 ) ) ( HOIST-AT ?auto_2657397 ?auto_2657400 ) ( not ( = ?auto_2657395 ?auto_2657397 ) ) ( SURFACE-AT ?auto_2657393 ?auto_2657400 ) ( ON ?auto_2657393 ?auto_2657398 ) ( CLEAR ?auto_2657393 ) ( not ( = ?auto_2657392 ?auto_2657398 ) ) ( not ( = ?auto_2657393 ?auto_2657398 ) ) ( not ( = ?auto_2657394 ?auto_2657398 ) ) ( SURFACE-AT ?auto_2657394 ?auto_2657396 ) ( CLEAR ?auto_2657394 ) ( IS-CRATE ?auto_2657392 ) ( AVAILABLE ?auto_2657395 ) ( TRUCK-AT ?auto_2657399 ?auto_2657400 ) ( AVAILABLE ?auto_2657397 ) ( SURFACE-AT ?auto_2657392 ?auto_2657400 ) ( ON ?auto_2657392 ?auto_2657401 ) ( CLEAR ?auto_2657392 ) ( not ( = ?auto_2657392 ?auto_2657401 ) ) ( not ( = ?auto_2657393 ?auto_2657401 ) ) ( not ( = ?auto_2657394 ?auto_2657401 ) ) ( not ( = ?auto_2657398 ?auto_2657401 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2657397 ?auto_2657392 ?auto_2657401 ?auto_2657400 )
      ( MAKE-2CRATE ?auto_2657394 ?auto_2657392 ?auto_2657393 )
      ( MAKE-1CRATE-VERIFY ?auto_2657392 ?auto_2657393 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2657402 - SURFACE
      ?auto_2657403 - SURFACE
      ?auto_2657404 - SURFACE
    )
    :vars
    (
      ?auto_2657406 - HOIST
      ?auto_2657411 - PLACE
      ?auto_2657407 - PLACE
      ?auto_2657408 - HOIST
      ?auto_2657409 - SURFACE
      ?auto_2657405 - TRUCK
      ?auto_2657410 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657406 ?auto_2657411 ) ( IS-CRATE ?auto_2657404 ) ( not ( = ?auto_2657403 ?auto_2657404 ) ) ( not ( = ?auto_2657402 ?auto_2657403 ) ) ( not ( = ?auto_2657402 ?auto_2657404 ) ) ( not ( = ?auto_2657407 ?auto_2657411 ) ) ( HOIST-AT ?auto_2657408 ?auto_2657407 ) ( not ( = ?auto_2657406 ?auto_2657408 ) ) ( SURFACE-AT ?auto_2657404 ?auto_2657407 ) ( ON ?auto_2657404 ?auto_2657409 ) ( CLEAR ?auto_2657404 ) ( not ( = ?auto_2657403 ?auto_2657409 ) ) ( not ( = ?auto_2657404 ?auto_2657409 ) ) ( not ( = ?auto_2657402 ?auto_2657409 ) ) ( SURFACE-AT ?auto_2657402 ?auto_2657411 ) ( CLEAR ?auto_2657402 ) ( IS-CRATE ?auto_2657403 ) ( AVAILABLE ?auto_2657406 ) ( TRUCK-AT ?auto_2657405 ?auto_2657407 ) ( AVAILABLE ?auto_2657408 ) ( SURFACE-AT ?auto_2657403 ?auto_2657407 ) ( ON ?auto_2657403 ?auto_2657410 ) ( CLEAR ?auto_2657403 ) ( not ( = ?auto_2657403 ?auto_2657410 ) ) ( not ( = ?auto_2657404 ?auto_2657410 ) ) ( not ( = ?auto_2657402 ?auto_2657410 ) ) ( not ( = ?auto_2657409 ?auto_2657410 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2657403 ?auto_2657404 )
      ( MAKE-2CRATE-VERIFY ?auto_2657402 ?auto_2657403 ?auto_2657404 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2657412 - SURFACE
      ?auto_2657413 - SURFACE
      ?auto_2657414 - SURFACE
      ?auto_2657415 - SURFACE
    )
    :vars
    (
      ?auto_2657419 - HOIST
      ?auto_2657417 - PLACE
      ?auto_2657422 - PLACE
      ?auto_2657418 - HOIST
      ?auto_2657416 - SURFACE
      ?auto_2657421 - TRUCK
      ?auto_2657420 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657419 ?auto_2657417 ) ( IS-CRATE ?auto_2657415 ) ( not ( = ?auto_2657414 ?auto_2657415 ) ) ( not ( = ?auto_2657413 ?auto_2657414 ) ) ( not ( = ?auto_2657413 ?auto_2657415 ) ) ( not ( = ?auto_2657422 ?auto_2657417 ) ) ( HOIST-AT ?auto_2657418 ?auto_2657422 ) ( not ( = ?auto_2657419 ?auto_2657418 ) ) ( SURFACE-AT ?auto_2657415 ?auto_2657422 ) ( ON ?auto_2657415 ?auto_2657416 ) ( CLEAR ?auto_2657415 ) ( not ( = ?auto_2657414 ?auto_2657416 ) ) ( not ( = ?auto_2657415 ?auto_2657416 ) ) ( not ( = ?auto_2657413 ?auto_2657416 ) ) ( SURFACE-AT ?auto_2657413 ?auto_2657417 ) ( CLEAR ?auto_2657413 ) ( IS-CRATE ?auto_2657414 ) ( AVAILABLE ?auto_2657419 ) ( TRUCK-AT ?auto_2657421 ?auto_2657422 ) ( AVAILABLE ?auto_2657418 ) ( SURFACE-AT ?auto_2657414 ?auto_2657422 ) ( ON ?auto_2657414 ?auto_2657420 ) ( CLEAR ?auto_2657414 ) ( not ( = ?auto_2657414 ?auto_2657420 ) ) ( not ( = ?auto_2657415 ?auto_2657420 ) ) ( not ( = ?auto_2657413 ?auto_2657420 ) ) ( not ( = ?auto_2657416 ?auto_2657420 ) ) ( ON ?auto_2657413 ?auto_2657412 ) ( not ( = ?auto_2657412 ?auto_2657413 ) ) ( not ( = ?auto_2657412 ?auto_2657414 ) ) ( not ( = ?auto_2657412 ?auto_2657415 ) ) ( not ( = ?auto_2657412 ?auto_2657416 ) ) ( not ( = ?auto_2657412 ?auto_2657420 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657413 ?auto_2657414 ?auto_2657415 )
      ( MAKE-3CRATE-VERIFY ?auto_2657412 ?auto_2657413 ?auto_2657414 ?auto_2657415 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2657423 - SURFACE
      ?auto_2657424 - SURFACE
      ?auto_2657425 - SURFACE
      ?auto_2657427 - SURFACE
      ?auto_2657426 - SURFACE
    )
    :vars
    (
      ?auto_2657431 - HOIST
      ?auto_2657429 - PLACE
      ?auto_2657434 - PLACE
      ?auto_2657430 - HOIST
      ?auto_2657428 - SURFACE
      ?auto_2657433 - TRUCK
      ?auto_2657432 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657431 ?auto_2657429 ) ( IS-CRATE ?auto_2657426 ) ( not ( = ?auto_2657427 ?auto_2657426 ) ) ( not ( = ?auto_2657425 ?auto_2657427 ) ) ( not ( = ?auto_2657425 ?auto_2657426 ) ) ( not ( = ?auto_2657434 ?auto_2657429 ) ) ( HOIST-AT ?auto_2657430 ?auto_2657434 ) ( not ( = ?auto_2657431 ?auto_2657430 ) ) ( SURFACE-AT ?auto_2657426 ?auto_2657434 ) ( ON ?auto_2657426 ?auto_2657428 ) ( CLEAR ?auto_2657426 ) ( not ( = ?auto_2657427 ?auto_2657428 ) ) ( not ( = ?auto_2657426 ?auto_2657428 ) ) ( not ( = ?auto_2657425 ?auto_2657428 ) ) ( SURFACE-AT ?auto_2657425 ?auto_2657429 ) ( CLEAR ?auto_2657425 ) ( IS-CRATE ?auto_2657427 ) ( AVAILABLE ?auto_2657431 ) ( TRUCK-AT ?auto_2657433 ?auto_2657434 ) ( AVAILABLE ?auto_2657430 ) ( SURFACE-AT ?auto_2657427 ?auto_2657434 ) ( ON ?auto_2657427 ?auto_2657432 ) ( CLEAR ?auto_2657427 ) ( not ( = ?auto_2657427 ?auto_2657432 ) ) ( not ( = ?auto_2657426 ?auto_2657432 ) ) ( not ( = ?auto_2657425 ?auto_2657432 ) ) ( not ( = ?auto_2657428 ?auto_2657432 ) ) ( ON ?auto_2657424 ?auto_2657423 ) ( ON ?auto_2657425 ?auto_2657424 ) ( not ( = ?auto_2657423 ?auto_2657424 ) ) ( not ( = ?auto_2657423 ?auto_2657425 ) ) ( not ( = ?auto_2657423 ?auto_2657427 ) ) ( not ( = ?auto_2657423 ?auto_2657426 ) ) ( not ( = ?auto_2657423 ?auto_2657428 ) ) ( not ( = ?auto_2657423 ?auto_2657432 ) ) ( not ( = ?auto_2657424 ?auto_2657425 ) ) ( not ( = ?auto_2657424 ?auto_2657427 ) ) ( not ( = ?auto_2657424 ?auto_2657426 ) ) ( not ( = ?auto_2657424 ?auto_2657428 ) ) ( not ( = ?auto_2657424 ?auto_2657432 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657425 ?auto_2657427 ?auto_2657426 )
      ( MAKE-4CRATE-VERIFY ?auto_2657423 ?auto_2657424 ?auto_2657425 ?auto_2657427 ?auto_2657426 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2657435 - SURFACE
      ?auto_2657436 - SURFACE
      ?auto_2657437 - SURFACE
      ?auto_2657439 - SURFACE
      ?auto_2657438 - SURFACE
      ?auto_2657440 - SURFACE
    )
    :vars
    (
      ?auto_2657444 - HOIST
      ?auto_2657442 - PLACE
      ?auto_2657447 - PLACE
      ?auto_2657443 - HOIST
      ?auto_2657441 - SURFACE
      ?auto_2657446 - TRUCK
      ?auto_2657445 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657444 ?auto_2657442 ) ( IS-CRATE ?auto_2657440 ) ( not ( = ?auto_2657438 ?auto_2657440 ) ) ( not ( = ?auto_2657439 ?auto_2657438 ) ) ( not ( = ?auto_2657439 ?auto_2657440 ) ) ( not ( = ?auto_2657447 ?auto_2657442 ) ) ( HOIST-AT ?auto_2657443 ?auto_2657447 ) ( not ( = ?auto_2657444 ?auto_2657443 ) ) ( SURFACE-AT ?auto_2657440 ?auto_2657447 ) ( ON ?auto_2657440 ?auto_2657441 ) ( CLEAR ?auto_2657440 ) ( not ( = ?auto_2657438 ?auto_2657441 ) ) ( not ( = ?auto_2657440 ?auto_2657441 ) ) ( not ( = ?auto_2657439 ?auto_2657441 ) ) ( SURFACE-AT ?auto_2657439 ?auto_2657442 ) ( CLEAR ?auto_2657439 ) ( IS-CRATE ?auto_2657438 ) ( AVAILABLE ?auto_2657444 ) ( TRUCK-AT ?auto_2657446 ?auto_2657447 ) ( AVAILABLE ?auto_2657443 ) ( SURFACE-AT ?auto_2657438 ?auto_2657447 ) ( ON ?auto_2657438 ?auto_2657445 ) ( CLEAR ?auto_2657438 ) ( not ( = ?auto_2657438 ?auto_2657445 ) ) ( not ( = ?auto_2657440 ?auto_2657445 ) ) ( not ( = ?auto_2657439 ?auto_2657445 ) ) ( not ( = ?auto_2657441 ?auto_2657445 ) ) ( ON ?auto_2657436 ?auto_2657435 ) ( ON ?auto_2657437 ?auto_2657436 ) ( ON ?auto_2657439 ?auto_2657437 ) ( not ( = ?auto_2657435 ?auto_2657436 ) ) ( not ( = ?auto_2657435 ?auto_2657437 ) ) ( not ( = ?auto_2657435 ?auto_2657439 ) ) ( not ( = ?auto_2657435 ?auto_2657438 ) ) ( not ( = ?auto_2657435 ?auto_2657440 ) ) ( not ( = ?auto_2657435 ?auto_2657441 ) ) ( not ( = ?auto_2657435 ?auto_2657445 ) ) ( not ( = ?auto_2657436 ?auto_2657437 ) ) ( not ( = ?auto_2657436 ?auto_2657439 ) ) ( not ( = ?auto_2657436 ?auto_2657438 ) ) ( not ( = ?auto_2657436 ?auto_2657440 ) ) ( not ( = ?auto_2657436 ?auto_2657441 ) ) ( not ( = ?auto_2657436 ?auto_2657445 ) ) ( not ( = ?auto_2657437 ?auto_2657439 ) ) ( not ( = ?auto_2657437 ?auto_2657438 ) ) ( not ( = ?auto_2657437 ?auto_2657440 ) ) ( not ( = ?auto_2657437 ?auto_2657441 ) ) ( not ( = ?auto_2657437 ?auto_2657445 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657439 ?auto_2657438 ?auto_2657440 )
      ( MAKE-5CRATE-VERIFY ?auto_2657435 ?auto_2657436 ?auto_2657437 ?auto_2657439 ?auto_2657438 ?auto_2657440 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2657448 - SURFACE
      ?auto_2657449 - SURFACE
    )
    :vars
    (
      ?auto_2657453 - HOIST
      ?auto_2657451 - PLACE
      ?auto_2657456 - SURFACE
      ?auto_2657457 - PLACE
      ?auto_2657452 - HOIST
      ?auto_2657450 - SURFACE
      ?auto_2657454 - SURFACE
      ?auto_2657455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657453 ?auto_2657451 ) ( IS-CRATE ?auto_2657449 ) ( not ( = ?auto_2657448 ?auto_2657449 ) ) ( not ( = ?auto_2657456 ?auto_2657448 ) ) ( not ( = ?auto_2657456 ?auto_2657449 ) ) ( not ( = ?auto_2657457 ?auto_2657451 ) ) ( HOIST-AT ?auto_2657452 ?auto_2657457 ) ( not ( = ?auto_2657453 ?auto_2657452 ) ) ( SURFACE-AT ?auto_2657449 ?auto_2657457 ) ( ON ?auto_2657449 ?auto_2657450 ) ( CLEAR ?auto_2657449 ) ( not ( = ?auto_2657448 ?auto_2657450 ) ) ( not ( = ?auto_2657449 ?auto_2657450 ) ) ( not ( = ?auto_2657456 ?auto_2657450 ) ) ( SURFACE-AT ?auto_2657456 ?auto_2657451 ) ( CLEAR ?auto_2657456 ) ( IS-CRATE ?auto_2657448 ) ( AVAILABLE ?auto_2657453 ) ( AVAILABLE ?auto_2657452 ) ( SURFACE-AT ?auto_2657448 ?auto_2657457 ) ( ON ?auto_2657448 ?auto_2657454 ) ( CLEAR ?auto_2657448 ) ( not ( = ?auto_2657448 ?auto_2657454 ) ) ( not ( = ?auto_2657449 ?auto_2657454 ) ) ( not ( = ?auto_2657456 ?auto_2657454 ) ) ( not ( = ?auto_2657450 ?auto_2657454 ) ) ( TRUCK-AT ?auto_2657455 ?auto_2657451 ) )
    :subtasks
    ( ( !DRIVE ?auto_2657455 ?auto_2657451 ?auto_2657457 )
      ( MAKE-2CRATE ?auto_2657456 ?auto_2657448 ?auto_2657449 )
      ( MAKE-1CRATE-VERIFY ?auto_2657448 ?auto_2657449 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2657458 - SURFACE
      ?auto_2657459 - SURFACE
      ?auto_2657460 - SURFACE
    )
    :vars
    (
      ?auto_2657465 - HOIST
      ?auto_2657467 - PLACE
      ?auto_2657464 - PLACE
      ?auto_2657463 - HOIST
      ?auto_2657462 - SURFACE
      ?auto_2657466 - SURFACE
      ?auto_2657461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657465 ?auto_2657467 ) ( IS-CRATE ?auto_2657460 ) ( not ( = ?auto_2657459 ?auto_2657460 ) ) ( not ( = ?auto_2657458 ?auto_2657459 ) ) ( not ( = ?auto_2657458 ?auto_2657460 ) ) ( not ( = ?auto_2657464 ?auto_2657467 ) ) ( HOIST-AT ?auto_2657463 ?auto_2657464 ) ( not ( = ?auto_2657465 ?auto_2657463 ) ) ( SURFACE-AT ?auto_2657460 ?auto_2657464 ) ( ON ?auto_2657460 ?auto_2657462 ) ( CLEAR ?auto_2657460 ) ( not ( = ?auto_2657459 ?auto_2657462 ) ) ( not ( = ?auto_2657460 ?auto_2657462 ) ) ( not ( = ?auto_2657458 ?auto_2657462 ) ) ( SURFACE-AT ?auto_2657458 ?auto_2657467 ) ( CLEAR ?auto_2657458 ) ( IS-CRATE ?auto_2657459 ) ( AVAILABLE ?auto_2657465 ) ( AVAILABLE ?auto_2657463 ) ( SURFACE-AT ?auto_2657459 ?auto_2657464 ) ( ON ?auto_2657459 ?auto_2657466 ) ( CLEAR ?auto_2657459 ) ( not ( = ?auto_2657459 ?auto_2657466 ) ) ( not ( = ?auto_2657460 ?auto_2657466 ) ) ( not ( = ?auto_2657458 ?auto_2657466 ) ) ( not ( = ?auto_2657462 ?auto_2657466 ) ) ( TRUCK-AT ?auto_2657461 ?auto_2657467 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2657459 ?auto_2657460 )
      ( MAKE-2CRATE-VERIFY ?auto_2657458 ?auto_2657459 ?auto_2657460 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2657468 - SURFACE
      ?auto_2657469 - SURFACE
      ?auto_2657470 - SURFACE
      ?auto_2657471 - SURFACE
    )
    :vars
    (
      ?auto_2657478 - HOIST
      ?auto_2657477 - PLACE
      ?auto_2657473 - PLACE
      ?auto_2657474 - HOIST
      ?auto_2657472 - SURFACE
      ?auto_2657475 - SURFACE
      ?auto_2657476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657478 ?auto_2657477 ) ( IS-CRATE ?auto_2657471 ) ( not ( = ?auto_2657470 ?auto_2657471 ) ) ( not ( = ?auto_2657469 ?auto_2657470 ) ) ( not ( = ?auto_2657469 ?auto_2657471 ) ) ( not ( = ?auto_2657473 ?auto_2657477 ) ) ( HOIST-AT ?auto_2657474 ?auto_2657473 ) ( not ( = ?auto_2657478 ?auto_2657474 ) ) ( SURFACE-AT ?auto_2657471 ?auto_2657473 ) ( ON ?auto_2657471 ?auto_2657472 ) ( CLEAR ?auto_2657471 ) ( not ( = ?auto_2657470 ?auto_2657472 ) ) ( not ( = ?auto_2657471 ?auto_2657472 ) ) ( not ( = ?auto_2657469 ?auto_2657472 ) ) ( SURFACE-AT ?auto_2657469 ?auto_2657477 ) ( CLEAR ?auto_2657469 ) ( IS-CRATE ?auto_2657470 ) ( AVAILABLE ?auto_2657478 ) ( AVAILABLE ?auto_2657474 ) ( SURFACE-AT ?auto_2657470 ?auto_2657473 ) ( ON ?auto_2657470 ?auto_2657475 ) ( CLEAR ?auto_2657470 ) ( not ( = ?auto_2657470 ?auto_2657475 ) ) ( not ( = ?auto_2657471 ?auto_2657475 ) ) ( not ( = ?auto_2657469 ?auto_2657475 ) ) ( not ( = ?auto_2657472 ?auto_2657475 ) ) ( TRUCK-AT ?auto_2657476 ?auto_2657477 ) ( ON ?auto_2657469 ?auto_2657468 ) ( not ( = ?auto_2657468 ?auto_2657469 ) ) ( not ( = ?auto_2657468 ?auto_2657470 ) ) ( not ( = ?auto_2657468 ?auto_2657471 ) ) ( not ( = ?auto_2657468 ?auto_2657472 ) ) ( not ( = ?auto_2657468 ?auto_2657475 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657469 ?auto_2657470 ?auto_2657471 )
      ( MAKE-3CRATE-VERIFY ?auto_2657468 ?auto_2657469 ?auto_2657470 ?auto_2657471 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2657479 - SURFACE
      ?auto_2657480 - SURFACE
      ?auto_2657481 - SURFACE
      ?auto_2657483 - SURFACE
      ?auto_2657482 - SURFACE
    )
    :vars
    (
      ?auto_2657490 - HOIST
      ?auto_2657489 - PLACE
      ?auto_2657485 - PLACE
      ?auto_2657486 - HOIST
      ?auto_2657484 - SURFACE
      ?auto_2657487 - SURFACE
      ?auto_2657488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657490 ?auto_2657489 ) ( IS-CRATE ?auto_2657482 ) ( not ( = ?auto_2657483 ?auto_2657482 ) ) ( not ( = ?auto_2657481 ?auto_2657483 ) ) ( not ( = ?auto_2657481 ?auto_2657482 ) ) ( not ( = ?auto_2657485 ?auto_2657489 ) ) ( HOIST-AT ?auto_2657486 ?auto_2657485 ) ( not ( = ?auto_2657490 ?auto_2657486 ) ) ( SURFACE-AT ?auto_2657482 ?auto_2657485 ) ( ON ?auto_2657482 ?auto_2657484 ) ( CLEAR ?auto_2657482 ) ( not ( = ?auto_2657483 ?auto_2657484 ) ) ( not ( = ?auto_2657482 ?auto_2657484 ) ) ( not ( = ?auto_2657481 ?auto_2657484 ) ) ( SURFACE-AT ?auto_2657481 ?auto_2657489 ) ( CLEAR ?auto_2657481 ) ( IS-CRATE ?auto_2657483 ) ( AVAILABLE ?auto_2657490 ) ( AVAILABLE ?auto_2657486 ) ( SURFACE-AT ?auto_2657483 ?auto_2657485 ) ( ON ?auto_2657483 ?auto_2657487 ) ( CLEAR ?auto_2657483 ) ( not ( = ?auto_2657483 ?auto_2657487 ) ) ( not ( = ?auto_2657482 ?auto_2657487 ) ) ( not ( = ?auto_2657481 ?auto_2657487 ) ) ( not ( = ?auto_2657484 ?auto_2657487 ) ) ( TRUCK-AT ?auto_2657488 ?auto_2657489 ) ( ON ?auto_2657480 ?auto_2657479 ) ( ON ?auto_2657481 ?auto_2657480 ) ( not ( = ?auto_2657479 ?auto_2657480 ) ) ( not ( = ?auto_2657479 ?auto_2657481 ) ) ( not ( = ?auto_2657479 ?auto_2657483 ) ) ( not ( = ?auto_2657479 ?auto_2657482 ) ) ( not ( = ?auto_2657479 ?auto_2657484 ) ) ( not ( = ?auto_2657479 ?auto_2657487 ) ) ( not ( = ?auto_2657480 ?auto_2657481 ) ) ( not ( = ?auto_2657480 ?auto_2657483 ) ) ( not ( = ?auto_2657480 ?auto_2657482 ) ) ( not ( = ?auto_2657480 ?auto_2657484 ) ) ( not ( = ?auto_2657480 ?auto_2657487 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657481 ?auto_2657483 ?auto_2657482 )
      ( MAKE-4CRATE-VERIFY ?auto_2657479 ?auto_2657480 ?auto_2657481 ?auto_2657483 ?auto_2657482 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2657491 - SURFACE
      ?auto_2657492 - SURFACE
      ?auto_2657493 - SURFACE
      ?auto_2657495 - SURFACE
      ?auto_2657494 - SURFACE
      ?auto_2657496 - SURFACE
    )
    :vars
    (
      ?auto_2657503 - HOIST
      ?auto_2657502 - PLACE
      ?auto_2657498 - PLACE
      ?auto_2657499 - HOIST
      ?auto_2657497 - SURFACE
      ?auto_2657500 - SURFACE
      ?auto_2657501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657503 ?auto_2657502 ) ( IS-CRATE ?auto_2657496 ) ( not ( = ?auto_2657494 ?auto_2657496 ) ) ( not ( = ?auto_2657495 ?auto_2657494 ) ) ( not ( = ?auto_2657495 ?auto_2657496 ) ) ( not ( = ?auto_2657498 ?auto_2657502 ) ) ( HOIST-AT ?auto_2657499 ?auto_2657498 ) ( not ( = ?auto_2657503 ?auto_2657499 ) ) ( SURFACE-AT ?auto_2657496 ?auto_2657498 ) ( ON ?auto_2657496 ?auto_2657497 ) ( CLEAR ?auto_2657496 ) ( not ( = ?auto_2657494 ?auto_2657497 ) ) ( not ( = ?auto_2657496 ?auto_2657497 ) ) ( not ( = ?auto_2657495 ?auto_2657497 ) ) ( SURFACE-AT ?auto_2657495 ?auto_2657502 ) ( CLEAR ?auto_2657495 ) ( IS-CRATE ?auto_2657494 ) ( AVAILABLE ?auto_2657503 ) ( AVAILABLE ?auto_2657499 ) ( SURFACE-AT ?auto_2657494 ?auto_2657498 ) ( ON ?auto_2657494 ?auto_2657500 ) ( CLEAR ?auto_2657494 ) ( not ( = ?auto_2657494 ?auto_2657500 ) ) ( not ( = ?auto_2657496 ?auto_2657500 ) ) ( not ( = ?auto_2657495 ?auto_2657500 ) ) ( not ( = ?auto_2657497 ?auto_2657500 ) ) ( TRUCK-AT ?auto_2657501 ?auto_2657502 ) ( ON ?auto_2657492 ?auto_2657491 ) ( ON ?auto_2657493 ?auto_2657492 ) ( ON ?auto_2657495 ?auto_2657493 ) ( not ( = ?auto_2657491 ?auto_2657492 ) ) ( not ( = ?auto_2657491 ?auto_2657493 ) ) ( not ( = ?auto_2657491 ?auto_2657495 ) ) ( not ( = ?auto_2657491 ?auto_2657494 ) ) ( not ( = ?auto_2657491 ?auto_2657496 ) ) ( not ( = ?auto_2657491 ?auto_2657497 ) ) ( not ( = ?auto_2657491 ?auto_2657500 ) ) ( not ( = ?auto_2657492 ?auto_2657493 ) ) ( not ( = ?auto_2657492 ?auto_2657495 ) ) ( not ( = ?auto_2657492 ?auto_2657494 ) ) ( not ( = ?auto_2657492 ?auto_2657496 ) ) ( not ( = ?auto_2657492 ?auto_2657497 ) ) ( not ( = ?auto_2657492 ?auto_2657500 ) ) ( not ( = ?auto_2657493 ?auto_2657495 ) ) ( not ( = ?auto_2657493 ?auto_2657494 ) ) ( not ( = ?auto_2657493 ?auto_2657496 ) ) ( not ( = ?auto_2657493 ?auto_2657497 ) ) ( not ( = ?auto_2657493 ?auto_2657500 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657495 ?auto_2657494 ?auto_2657496 )
      ( MAKE-5CRATE-VERIFY ?auto_2657491 ?auto_2657492 ?auto_2657493 ?auto_2657495 ?auto_2657494 ?auto_2657496 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2657504 - SURFACE
      ?auto_2657505 - SURFACE
    )
    :vars
    (
      ?auto_2657512 - HOIST
      ?auto_2657511 - PLACE
      ?auto_2657513 - SURFACE
      ?auto_2657507 - PLACE
      ?auto_2657508 - HOIST
      ?auto_2657506 - SURFACE
      ?auto_2657509 - SURFACE
      ?auto_2657510 - TRUCK
      ?auto_2657514 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657512 ?auto_2657511 ) ( IS-CRATE ?auto_2657505 ) ( not ( = ?auto_2657504 ?auto_2657505 ) ) ( not ( = ?auto_2657513 ?auto_2657504 ) ) ( not ( = ?auto_2657513 ?auto_2657505 ) ) ( not ( = ?auto_2657507 ?auto_2657511 ) ) ( HOIST-AT ?auto_2657508 ?auto_2657507 ) ( not ( = ?auto_2657512 ?auto_2657508 ) ) ( SURFACE-AT ?auto_2657505 ?auto_2657507 ) ( ON ?auto_2657505 ?auto_2657506 ) ( CLEAR ?auto_2657505 ) ( not ( = ?auto_2657504 ?auto_2657506 ) ) ( not ( = ?auto_2657505 ?auto_2657506 ) ) ( not ( = ?auto_2657513 ?auto_2657506 ) ) ( IS-CRATE ?auto_2657504 ) ( AVAILABLE ?auto_2657508 ) ( SURFACE-AT ?auto_2657504 ?auto_2657507 ) ( ON ?auto_2657504 ?auto_2657509 ) ( CLEAR ?auto_2657504 ) ( not ( = ?auto_2657504 ?auto_2657509 ) ) ( not ( = ?auto_2657505 ?auto_2657509 ) ) ( not ( = ?auto_2657513 ?auto_2657509 ) ) ( not ( = ?auto_2657506 ?auto_2657509 ) ) ( TRUCK-AT ?auto_2657510 ?auto_2657511 ) ( SURFACE-AT ?auto_2657514 ?auto_2657511 ) ( CLEAR ?auto_2657514 ) ( LIFTING ?auto_2657512 ?auto_2657513 ) ( IS-CRATE ?auto_2657513 ) ( not ( = ?auto_2657514 ?auto_2657513 ) ) ( not ( = ?auto_2657504 ?auto_2657514 ) ) ( not ( = ?auto_2657505 ?auto_2657514 ) ) ( not ( = ?auto_2657506 ?auto_2657514 ) ) ( not ( = ?auto_2657509 ?auto_2657514 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2657514 ?auto_2657513 )
      ( MAKE-2CRATE ?auto_2657513 ?auto_2657504 ?auto_2657505 )
      ( MAKE-1CRATE-VERIFY ?auto_2657504 ?auto_2657505 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2657515 - SURFACE
      ?auto_2657516 - SURFACE
      ?auto_2657517 - SURFACE
    )
    :vars
    (
      ?auto_2657519 - HOIST
      ?auto_2657522 - PLACE
      ?auto_2657523 - PLACE
      ?auto_2657520 - HOIST
      ?auto_2657518 - SURFACE
      ?auto_2657521 - SURFACE
      ?auto_2657524 - TRUCK
      ?auto_2657525 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657519 ?auto_2657522 ) ( IS-CRATE ?auto_2657517 ) ( not ( = ?auto_2657516 ?auto_2657517 ) ) ( not ( = ?auto_2657515 ?auto_2657516 ) ) ( not ( = ?auto_2657515 ?auto_2657517 ) ) ( not ( = ?auto_2657523 ?auto_2657522 ) ) ( HOIST-AT ?auto_2657520 ?auto_2657523 ) ( not ( = ?auto_2657519 ?auto_2657520 ) ) ( SURFACE-AT ?auto_2657517 ?auto_2657523 ) ( ON ?auto_2657517 ?auto_2657518 ) ( CLEAR ?auto_2657517 ) ( not ( = ?auto_2657516 ?auto_2657518 ) ) ( not ( = ?auto_2657517 ?auto_2657518 ) ) ( not ( = ?auto_2657515 ?auto_2657518 ) ) ( IS-CRATE ?auto_2657516 ) ( AVAILABLE ?auto_2657520 ) ( SURFACE-AT ?auto_2657516 ?auto_2657523 ) ( ON ?auto_2657516 ?auto_2657521 ) ( CLEAR ?auto_2657516 ) ( not ( = ?auto_2657516 ?auto_2657521 ) ) ( not ( = ?auto_2657517 ?auto_2657521 ) ) ( not ( = ?auto_2657515 ?auto_2657521 ) ) ( not ( = ?auto_2657518 ?auto_2657521 ) ) ( TRUCK-AT ?auto_2657524 ?auto_2657522 ) ( SURFACE-AT ?auto_2657525 ?auto_2657522 ) ( CLEAR ?auto_2657525 ) ( LIFTING ?auto_2657519 ?auto_2657515 ) ( IS-CRATE ?auto_2657515 ) ( not ( = ?auto_2657525 ?auto_2657515 ) ) ( not ( = ?auto_2657516 ?auto_2657525 ) ) ( not ( = ?auto_2657517 ?auto_2657525 ) ) ( not ( = ?auto_2657518 ?auto_2657525 ) ) ( not ( = ?auto_2657521 ?auto_2657525 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2657516 ?auto_2657517 )
      ( MAKE-2CRATE-VERIFY ?auto_2657515 ?auto_2657516 ?auto_2657517 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2657526 - SURFACE
      ?auto_2657527 - SURFACE
      ?auto_2657528 - SURFACE
      ?auto_2657529 - SURFACE
    )
    :vars
    (
      ?auto_2657536 - HOIST
      ?auto_2657533 - PLACE
      ?auto_2657530 - PLACE
      ?auto_2657534 - HOIST
      ?auto_2657531 - SURFACE
      ?auto_2657532 - SURFACE
      ?auto_2657535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657536 ?auto_2657533 ) ( IS-CRATE ?auto_2657529 ) ( not ( = ?auto_2657528 ?auto_2657529 ) ) ( not ( = ?auto_2657527 ?auto_2657528 ) ) ( not ( = ?auto_2657527 ?auto_2657529 ) ) ( not ( = ?auto_2657530 ?auto_2657533 ) ) ( HOIST-AT ?auto_2657534 ?auto_2657530 ) ( not ( = ?auto_2657536 ?auto_2657534 ) ) ( SURFACE-AT ?auto_2657529 ?auto_2657530 ) ( ON ?auto_2657529 ?auto_2657531 ) ( CLEAR ?auto_2657529 ) ( not ( = ?auto_2657528 ?auto_2657531 ) ) ( not ( = ?auto_2657529 ?auto_2657531 ) ) ( not ( = ?auto_2657527 ?auto_2657531 ) ) ( IS-CRATE ?auto_2657528 ) ( AVAILABLE ?auto_2657534 ) ( SURFACE-AT ?auto_2657528 ?auto_2657530 ) ( ON ?auto_2657528 ?auto_2657532 ) ( CLEAR ?auto_2657528 ) ( not ( = ?auto_2657528 ?auto_2657532 ) ) ( not ( = ?auto_2657529 ?auto_2657532 ) ) ( not ( = ?auto_2657527 ?auto_2657532 ) ) ( not ( = ?auto_2657531 ?auto_2657532 ) ) ( TRUCK-AT ?auto_2657535 ?auto_2657533 ) ( SURFACE-AT ?auto_2657526 ?auto_2657533 ) ( CLEAR ?auto_2657526 ) ( LIFTING ?auto_2657536 ?auto_2657527 ) ( IS-CRATE ?auto_2657527 ) ( not ( = ?auto_2657526 ?auto_2657527 ) ) ( not ( = ?auto_2657528 ?auto_2657526 ) ) ( not ( = ?auto_2657529 ?auto_2657526 ) ) ( not ( = ?auto_2657531 ?auto_2657526 ) ) ( not ( = ?auto_2657532 ?auto_2657526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657527 ?auto_2657528 ?auto_2657529 )
      ( MAKE-3CRATE-VERIFY ?auto_2657526 ?auto_2657527 ?auto_2657528 ?auto_2657529 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2657537 - SURFACE
      ?auto_2657538 - SURFACE
      ?auto_2657539 - SURFACE
      ?auto_2657541 - SURFACE
      ?auto_2657540 - SURFACE
    )
    :vars
    (
      ?auto_2657548 - HOIST
      ?auto_2657545 - PLACE
      ?auto_2657542 - PLACE
      ?auto_2657546 - HOIST
      ?auto_2657543 - SURFACE
      ?auto_2657544 - SURFACE
      ?auto_2657547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657548 ?auto_2657545 ) ( IS-CRATE ?auto_2657540 ) ( not ( = ?auto_2657541 ?auto_2657540 ) ) ( not ( = ?auto_2657539 ?auto_2657541 ) ) ( not ( = ?auto_2657539 ?auto_2657540 ) ) ( not ( = ?auto_2657542 ?auto_2657545 ) ) ( HOIST-AT ?auto_2657546 ?auto_2657542 ) ( not ( = ?auto_2657548 ?auto_2657546 ) ) ( SURFACE-AT ?auto_2657540 ?auto_2657542 ) ( ON ?auto_2657540 ?auto_2657543 ) ( CLEAR ?auto_2657540 ) ( not ( = ?auto_2657541 ?auto_2657543 ) ) ( not ( = ?auto_2657540 ?auto_2657543 ) ) ( not ( = ?auto_2657539 ?auto_2657543 ) ) ( IS-CRATE ?auto_2657541 ) ( AVAILABLE ?auto_2657546 ) ( SURFACE-AT ?auto_2657541 ?auto_2657542 ) ( ON ?auto_2657541 ?auto_2657544 ) ( CLEAR ?auto_2657541 ) ( not ( = ?auto_2657541 ?auto_2657544 ) ) ( not ( = ?auto_2657540 ?auto_2657544 ) ) ( not ( = ?auto_2657539 ?auto_2657544 ) ) ( not ( = ?auto_2657543 ?auto_2657544 ) ) ( TRUCK-AT ?auto_2657547 ?auto_2657545 ) ( SURFACE-AT ?auto_2657538 ?auto_2657545 ) ( CLEAR ?auto_2657538 ) ( LIFTING ?auto_2657548 ?auto_2657539 ) ( IS-CRATE ?auto_2657539 ) ( not ( = ?auto_2657538 ?auto_2657539 ) ) ( not ( = ?auto_2657541 ?auto_2657538 ) ) ( not ( = ?auto_2657540 ?auto_2657538 ) ) ( not ( = ?auto_2657543 ?auto_2657538 ) ) ( not ( = ?auto_2657544 ?auto_2657538 ) ) ( ON ?auto_2657538 ?auto_2657537 ) ( not ( = ?auto_2657537 ?auto_2657538 ) ) ( not ( = ?auto_2657537 ?auto_2657539 ) ) ( not ( = ?auto_2657537 ?auto_2657541 ) ) ( not ( = ?auto_2657537 ?auto_2657540 ) ) ( not ( = ?auto_2657537 ?auto_2657543 ) ) ( not ( = ?auto_2657537 ?auto_2657544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657539 ?auto_2657541 ?auto_2657540 )
      ( MAKE-4CRATE-VERIFY ?auto_2657537 ?auto_2657538 ?auto_2657539 ?auto_2657541 ?auto_2657540 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2657549 - SURFACE
      ?auto_2657550 - SURFACE
      ?auto_2657551 - SURFACE
      ?auto_2657553 - SURFACE
      ?auto_2657552 - SURFACE
      ?auto_2657554 - SURFACE
    )
    :vars
    (
      ?auto_2657561 - HOIST
      ?auto_2657558 - PLACE
      ?auto_2657555 - PLACE
      ?auto_2657559 - HOIST
      ?auto_2657556 - SURFACE
      ?auto_2657557 - SURFACE
      ?auto_2657560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657561 ?auto_2657558 ) ( IS-CRATE ?auto_2657554 ) ( not ( = ?auto_2657552 ?auto_2657554 ) ) ( not ( = ?auto_2657553 ?auto_2657552 ) ) ( not ( = ?auto_2657553 ?auto_2657554 ) ) ( not ( = ?auto_2657555 ?auto_2657558 ) ) ( HOIST-AT ?auto_2657559 ?auto_2657555 ) ( not ( = ?auto_2657561 ?auto_2657559 ) ) ( SURFACE-AT ?auto_2657554 ?auto_2657555 ) ( ON ?auto_2657554 ?auto_2657556 ) ( CLEAR ?auto_2657554 ) ( not ( = ?auto_2657552 ?auto_2657556 ) ) ( not ( = ?auto_2657554 ?auto_2657556 ) ) ( not ( = ?auto_2657553 ?auto_2657556 ) ) ( IS-CRATE ?auto_2657552 ) ( AVAILABLE ?auto_2657559 ) ( SURFACE-AT ?auto_2657552 ?auto_2657555 ) ( ON ?auto_2657552 ?auto_2657557 ) ( CLEAR ?auto_2657552 ) ( not ( = ?auto_2657552 ?auto_2657557 ) ) ( not ( = ?auto_2657554 ?auto_2657557 ) ) ( not ( = ?auto_2657553 ?auto_2657557 ) ) ( not ( = ?auto_2657556 ?auto_2657557 ) ) ( TRUCK-AT ?auto_2657560 ?auto_2657558 ) ( SURFACE-AT ?auto_2657551 ?auto_2657558 ) ( CLEAR ?auto_2657551 ) ( LIFTING ?auto_2657561 ?auto_2657553 ) ( IS-CRATE ?auto_2657553 ) ( not ( = ?auto_2657551 ?auto_2657553 ) ) ( not ( = ?auto_2657552 ?auto_2657551 ) ) ( not ( = ?auto_2657554 ?auto_2657551 ) ) ( not ( = ?auto_2657556 ?auto_2657551 ) ) ( not ( = ?auto_2657557 ?auto_2657551 ) ) ( ON ?auto_2657550 ?auto_2657549 ) ( ON ?auto_2657551 ?auto_2657550 ) ( not ( = ?auto_2657549 ?auto_2657550 ) ) ( not ( = ?auto_2657549 ?auto_2657551 ) ) ( not ( = ?auto_2657549 ?auto_2657553 ) ) ( not ( = ?auto_2657549 ?auto_2657552 ) ) ( not ( = ?auto_2657549 ?auto_2657554 ) ) ( not ( = ?auto_2657549 ?auto_2657556 ) ) ( not ( = ?auto_2657549 ?auto_2657557 ) ) ( not ( = ?auto_2657550 ?auto_2657551 ) ) ( not ( = ?auto_2657550 ?auto_2657553 ) ) ( not ( = ?auto_2657550 ?auto_2657552 ) ) ( not ( = ?auto_2657550 ?auto_2657554 ) ) ( not ( = ?auto_2657550 ?auto_2657556 ) ) ( not ( = ?auto_2657550 ?auto_2657557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2657553 ?auto_2657552 ?auto_2657554 )
      ( MAKE-5CRATE-VERIFY ?auto_2657549 ?auto_2657550 ?auto_2657551 ?auto_2657553 ?auto_2657552 ?auto_2657554 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2658470 - SURFACE
      ?auto_2658471 - SURFACE
      ?auto_2658472 - SURFACE
      ?auto_2658474 - SURFACE
      ?auto_2658473 - SURFACE
      ?auto_2658475 - SURFACE
      ?auto_2658476 - SURFACE
    )
    :vars
    (
      ?auto_2658477 - HOIST
      ?auto_2658478 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658477 ?auto_2658478 ) ( SURFACE-AT ?auto_2658475 ?auto_2658478 ) ( CLEAR ?auto_2658475 ) ( LIFTING ?auto_2658477 ?auto_2658476 ) ( IS-CRATE ?auto_2658476 ) ( not ( = ?auto_2658475 ?auto_2658476 ) ) ( ON ?auto_2658471 ?auto_2658470 ) ( ON ?auto_2658472 ?auto_2658471 ) ( ON ?auto_2658474 ?auto_2658472 ) ( ON ?auto_2658473 ?auto_2658474 ) ( ON ?auto_2658475 ?auto_2658473 ) ( not ( = ?auto_2658470 ?auto_2658471 ) ) ( not ( = ?auto_2658470 ?auto_2658472 ) ) ( not ( = ?auto_2658470 ?auto_2658474 ) ) ( not ( = ?auto_2658470 ?auto_2658473 ) ) ( not ( = ?auto_2658470 ?auto_2658475 ) ) ( not ( = ?auto_2658470 ?auto_2658476 ) ) ( not ( = ?auto_2658471 ?auto_2658472 ) ) ( not ( = ?auto_2658471 ?auto_2658474 ) ) ( not ( = ?auto_2658471 ?auto_2658473 ) ) ( not ( = ?auto_2658471 ?auto_2658475 ) ) ( not ( = ?auto_2658471 ?auto_2658476 ) ) ( not ( = ?auto_2658472 ?auto_2658474 ) ) ( not ( = ?auto_2658472 ?auto_2658473 ) ) ( not ( = ?auto_2658472 ?auto_2658475 ) ) ( not ( = ?auto_2658472 ?auto_2658476 ) ) ( not ( = ?auto_2658474 ?auto_2658473 ) ) ( not ( = ?auto_2658474 ?auto_2658475 ) ) ( not ( = ?auto_2658474 ?auto_2658476 ) ) ( not ( = ?auto_2658473 ?auto_2658475 ) ) ( not ( = ?auto_2658473 ?auto_2658476 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2658475 ?auto_2658476 )
      ( MAKE-6CRATE-VERIFY ?auto_2658470 ?auto_2658471 ?auto_2658472 ?auto_2658474 ?auto_2658473 ?auto_2658475 ?auto_2658476 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2658514 - SURFACE
      ?auto_2658515 - SURFACE
      ?auto_2658516 - SURFACE
      ?auto_2658518 - SURFACE
      ?auto_2658517 - SURFACE
      ?auto_2658519 - SURFACE
      ?auto_2658520 - SURFACE
    )
    :vars
    (
      ?auto_2658521 - HOIST
      ?auto_2658523 - PLACE
      ?auto_2658522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658521 ?auto_2658523 ) ( SURFACE-AT ?auto_2658519 ?auto_2658523 ) ( CLEAR ?auto_2658519 ) ( IS-CRATE ?auto_2658520 ) ( not ( = ?auto_2658519 ?auto_2658520 ) ) ( TRUCK-AT ?auto_2658522 ?auto_2658523 ) ( AVAILABLE ?auto_2658521 ) ( IN ?auto_2658520 ?auto_2658522 ) ( ON ?auto_2658519 ?auto_2658517 ) ( not ( = ?auto_2658517 ?auto_2658519 ) ) ( not ( = ?auto_2658517 ?auto_2658520 ) ) ( ON ?auto_2658515 ?auto_2658514 ) ( ON ?auto_2658516 ?auto_2658515 ) ( ON ?auto_2658518 ?auto_2658516 ) ( ON ?auto_2658517 ?auto_2658518 ) ( not ( = ?auto_2658514 ?auto_2658515 ) ) ( not ( = ?auto_2658514 ?auto_2658516 ) ) ( not ( = ?auto_2658514 ?auto_2658518 ) ) ( not ( = ?auto_2658514 ?auto_2658517 ) ) ( not ( = ?auto_2658514 ?auto_2658519 ) ) ( not ( = ?auto_2658514 ?auto_2658520 ) ) ( not ( = ?auto_2658515 ?auto_2658516 ) ) ( not ( = ?auto_2658515 ?auto_2658518 ) ) ( not ( = ?auto_2658515 ?auto_2658517 ) ) ( not ( = ?auto_2658515 ?auto_2658519 ) ) ( not ( = ?auto_2658515 ?auto_2658520 ) ) ( not ( = ?auto_2658516 ?auto_2658518 ) ) ( not ( = ?auto_2658516 ?auto_2658517 ) ) ( not ( = ?auto_2658516 ?auto_2658519 ) ) ( not ( = ?auto_2658516 ?auto_2658520 ) ) ( not ( = ?auto_2658518 ?auto_2658517 ) ) ( not ( = ?auto_2658518 ?auto_2658519 ) ) ( not ( = ?auto_2658518 ?auto_2658520 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658517 ?auto_2658519 ?auto_2658520 )
      ( MAKE-6CRATE-VERIFY ?auto_2658514 ?auto_2658515 ?auto_2658516 ?auto_2658518 ?auto_2658517 ?auto_2658519 ?auto_2658520 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2658565 - SURFACE
      ?auto_2658566 - SURFACE
      ?auto_2658567 - SURFACE
      ?auto_2658569 - SURFACE
      ?auto_2658568 - SURFACE
      ?auto_2658570 - SURFACE
      ?auto_2658571 - SURFACE
    )
    :vars
    (
      ?auto_2658574 - HOIST
      ?auto_2658575 - PLACE
      ?auto_2658573 - TRUCK
      ?auto_2658572 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658574 ?auto_2658575 ) ( SURFACE-AT ?auto_2658570 ?auto_2658575 ) ( CLEAR ?auto_2658570 ) ( IS-CRATE ?auto_2658571 ) ( not ( = ?auto_2658570 ?auto_2658571 ) ) ( AVAILABLE ?auto_2658574 ) ( IN ?auto_2658571 ?auto_2658573 ) ( ON ?auto_2658570 ?auto_2658568 ) ( not ( = ?auto_2658568 ?auto_2658570 ) ) ( not ( = ?auto_2658568 ?auto_2658571 ) ) ( TRUCK-AT ?auto_2658573 ?auto_2658572 ) ( not ( = ?auto_2658572 ?auto_2658575 ) ) ( ON ?auto_2658566 ?auto_2658565 ) ( ON ?auto_2658567 ?auto_2658566 ) ( ON ?auto_2658569 ?auto_2658567 ) ( ON ?auto_2658568 ?auto_2658569 ) ( not ( = ?auto_2658565 ?auto_2658566 ) ) ( not ( = ?auto_2658565 ?auto_2658567 ) ) ( not ( = ?auto_2658565 ?auto_2658569 ) ) ( not ( = ?auto_2658565 ?auto_2658568 ) ) ( not ( = ?auto_2658565 ?auto_2658570 ) ) ( not ( = ?auto_2658565 ?auto_2658571 ) ) ( not ( = ?auto_2658566 ?auto_2658567 ) ) ( not ( = ?auto_2658566 ?auto_2658569 ) ) ( not ( = ?auto_2658566 ?auto_2658568 ) ) ( not ( = ?auto_2658566 ?auto_2658570 ) ) ( not ( = ?auto_2658566 ?auto_2658571 ) ) ( not ( = ?auto_2658567 ?auto_2658569 ) ) ( not ( = ?auto_2658567 ?auto_2658568 ) ) ( not ( = ?auto_2658567 ?auto_2658570 ) ) ( not ( = ?auto_2658567 ?auto_2658571 ) ) ( not ( = ?auto_2658569 ?auto_2658568 ) ) ( not ( = ?auto_2658569 ?auto_2658570 ) ) ( not ( = ?auto_2658569 ?auto_2658571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658568 ?auto_2658570 ?auto_2658571 )
      ( MAKE-6CRATE-VERIFY ?auto_2658565 ?auto_2658566 ?auto_2658567 ?auto_2658569 ?auto_2658568 ?auto_2658570 ?auto_2658571 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2658622 - SURFACE
      ?auto_2658623 - SURFACE
      ?auto_2658624 - SURFACE
      ?auto_2658626 - SURFACE
      ?auto_2658625 - SURFACE
      ?auto_2658627 - SURFACE
      ?auto_2658628 - SURFACE
    )
    :vars
    (
      ?auto_2658632 - HOIST
      ?auto_2658630 - PLACE
      ?auto_2658629 - TRUCK
      ?auto_2658631 - PLACE
      ?auto_2658633 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658632 ?auto_2658630 ) ( SURFACE-AT ?auto_2658627 ?auto_2658630 ) ( CLEAR ?auto_2658627 ) ( IS-CRATE ?auto_2658628 ) ( not ( = ?auto_2658627 ?auto_2658628 ) ) ( AVAILABLE ?auto_2658632 ) ( ON ?auto_2658627 ?auto_2658625 ) ( not ( = ?auto_2658625 ?auto_2658627 ) ) ( not ( = ?auto_2658625 ?auto_2658628 ) ) ( TRUCK-AT ?auto_2658629 ?auto_2658631 ) ( not ( = ?auto_2658631 ?auto_2658630 ) ) ( HOIST-AT ?auto_2658633 ?auto_2658631 ) ( LIFTING ?auto_2658633 ?auto_2658628 ) ( not ( = ?auto_2658632 ?auto_2658633 ) ) ( ON ?auto_2658623 ?auto_2658622 ) ( ON ?auto_2658624 ?auto_2658623 ) ( ON ?auto_2658626 ?auto_2658624 ) ( ON ?auto_2658625 ?auto_2658626 ) ( not ( = ?auto_2658622 ?auto_2658623 ) ) ( not ( = ?auto_2658622 ?auto_2658624 ) ) ( not ( = ?auto_2658622 ?auto_2658626 ) ) ( not ( = ?auto_2658622 ?auto_2658625 ) ) ( not ( = ?auto_2658622 ?auto_2658627 ) ) ( not ( = ?auto_2658622 ?auto_2658628 ) ) ( not ( = ?auto_2658623 ?auto_2658624 ) ) ( not ( = ?auto_2658623 ?auto_2658626 ) ) ( not ( = ?auto_2658623 ?auto_2658625 ) ) ( not ( = ?auto_2658623 ?auto_2658627 ) ) ( not ( = ?auto_2658623 ?auto_2658628 ) ) ( not ( = ?auto_2658624 ?auto_2658626 ) ) ( not ( = ?auto_2658624 ?auto_2658625 ) ) ( not ( = ?auto_2658624 ?auto_2658627 ) ) ( not ( = ?auto_2658624 ?auto_2658628 ) ) ( not ( = ?auto_2658626 ?auto_2658625 ) ) ( not ( = ?auto_2658626 ?auto_2658627 ) ) ( not ( = ?auto_2658626 ?auto_2658628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658625 ?auto_2658627 ?auto_2658628 )
      ( MAKE-6CRATE-VERIFY ?auto_2658622 ?auto_2658623 ?auto_2658624 ?auto_2658626 ?auto_2658625 ?auto_2658627 ?auto_2658628 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2658685 - SURFACE
      ?auto_2658686 - SURFACE
      ?auto_2658687 - SURFACE
      ?auto_2658689 - SURFACE
      ?auto_2658688 - SURFACE
      ?auto_2658690 - SURFACE
      ?auto_2658691 - SURFACE
    )
    :vars
    (
      ?auto_2658697 - HOIST
      ?auto_2658696 - PLACE
      ?auto_2658693 - TRUCK
      ?auto_2658695 - PLACE
      ?auto_2658692 - HOIST
      ?auto_2658694 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658697 ?auto_2658696 ) ( SURFACE-AT ?auto_2658690 ?auto_2658696 ) ( CLEAR ?auto_2658690 ) ( IS-CRATE ?auto_2658691 ) ( not ( = ?auto_2658690 ?auto_2658691 ) ) ( AVAILABLE ?auto_2658697 ) ( ON ?auto_2658690 ?auto_2658688 ) ( not ( = ?auto_2658688 ?auto_2658690 ) ) ( not ( = ?auto_2658688 ?auto_2658691 ) ) ( TRUCK-AT ?auto_2658693 ?auto_2658695 ) ( not ( = ?auto_2658695 ?auto_2658696 ) ) ( HOIST-AT ?auto_2658692 ?auto_2658695 ) ( not ( = ?auto_2658697 ?auto_2658692 ) ) ( AVAILABLE ?auto_2658692 ) ( SURFACE-AT ?auto_2658691 ?auto_2658695 ) ( ON ?auto_2658691 ?auto_2658694 ) ( CLEAR ?auto_2658691 ) ( not ( = ?auto_2658690 ?auto_2658694 ) ) ( not ( = ?auto_2658691 ?auto_2658694 ) ) ( not ( = ?auto_2658688 ?auto_2658694 ) ) ( ON ?auto_2658686 ?auto_2658685 ) ( ON ?auto_2658687 ?auto_2658686 ) ( ON ?auto_2658689 ?auto_2658687 ) ( ON ?auto_2658688 ?auto_2658689 ) ( not ( = ?auto_2658685 ?auto_2658686 ) ) ( not ( = ?auto_2658685 ?auto_2658687 ) ) ( not ( = ?auto_2658685 ?auto_2658689 ) ) ( not ( = ?auto_2658685 ?auto_2658688 ) ) ( not ( = ?auto_2658685 ?auto_2658690 ) ) ( not ( = ?auto_2658685 ?auto_2658691 ) ) ( not ( = ?auto_2658685 ?auto_2658694 ) ) ( not ( = ?auto_2658686 ?auto_2658687 ) ) ( not ( = ?auto_2658686 ?auto_2658689 ) ) ( not ( = ?auto_2658686 ?auto_2658688 ) ) ( not ( = ?auto_2658686 ?auto_2658690 ) ) ( not ( = ?auto_2658686 ?auto_2658691 ) ) ( not ( = ?auto_2658686 ?auto_2658694 ) ) ( not ( = ?auto_2658687 ?auto_2658689 ) ) ( not ( = ?auto_2658687 ?auto_2658688 ) ) ( not ( = ?auto_2658687 ?auto_2658690 ) ) ( not ( = ?auto_2658687 ?auto_2658691 ) ) ( not ( = ?auto_2658687 ?auto_2658694 ) ) ( not ( = ?auto_2658689 ?auto_2658688 ) ) ( not ( = ?auto_2658689 ?auto_2658690 ) ) ( not ( = ?auto_2658689 ?auto_2658691 ) ) ( not ( = ?auto_2658689 ?auto_2658694 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658688 ?auto_2658690 ?auto_2658691 )
      ( MAKE-6CRATE-VERIFY ?auto_2658685 ?auto_2658686 ?auto_2658687 ?auto_2658689 ?auto_2658688 ?auto_2658690 ?auto_2658691 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2658749 - SURFACE
      ?auto_2658750 - SURFACE
      ?auto_2658751 - SURFACE
      ?auto_2658753 - SURFACE
      ?auto_2658752 - SURFACE
      ?auto_2658754 - SURFACE
      ?auto_2658755 - SURFACE
    )
    :vars
    (
      ?auto_2658761 - HOIST
      ?auto_2658758 - PLACE
      ?auto_2658757 - PLACE
      ?auto_2658759 - HOIST
      ?auto_2658756 - SURFACE
      ?auto_2658760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658761 ?auto_2658758 ) ( SURFACE-AT ?auto_2658754 ?auto_2658758 ) ( CLEAR ?auto_2658754 ) ( IS-CRATE ?auto_2658755 ) ( not ( = ?auto_2658754 ?auto_2658755 ) ) ( AVAILABLE ?auto_2658761 ) ( ON ?auto_2658754 ?auto_2658752 ) ( not ( = ?auto_2658752 ?auto_2658754 ) ) ( not ( = ?auto_2658752 ?auto_2658755 ) ) ( not ( = ?auto_2658757 ?auto_2658758 ) ) ( HOIST-AT ?auto_2658759 ?auto_2658757 ) ( not ( = ?auto_2658761 ?auto_2658759 ) ) ( AVAILABLE ?auto_2658759 ) ( SURFACE-AT ?auto_2658755 ?auto_2658757 ) ( ON ?auto_2658755 ?auto_2658756 ) ( CLEAR ?auto_2658755 ) ( not ( = ?auto_2658754 ?auto_2658756 ) ) ( not ( = ?auto_2658755 ?auto_2658756 ) ) ( not ( = ?auto_2658752 ?auto_2658756 ) ) ( TRUCK-AT ?auto_2658760 ?auto_2658758 ) ( ON ?auto_2658750 ?auto_2658749 ) ( ON ?auto_2658751 ?auto_2658750 ) ( ON ?auto_2658753 ?auto_2658751 ) ( ON ?auto_2658752 ?auto_2658753 ) ( not ( = ?auto_2658749 ?auto_2658750 ) ) ( not ( = ?auto_2658749 ?auto_2658751 ) ) ( not ( = ?auto_2658749 ?auto_2658753 ) ) ( not ( = ?auto_2658749 ?auto_2658752 ) ) ( not ( = ?auto_2658749 ?auto_2658754 ) ) ( not ( = ?auto_2658749 ?auto_2658755 ) ) ( not ( = ?auto_2658749 ?auto_2658756 ) ) ( not ( = ?auto_2658750 ?auto_2658751 ) ) ( not ( = ?auto_2658750 ?auto_2658753 ) ) ( not ( = ?auto_2658750 ?auto_2658752 ) ) ( not ( = ?auto_2658750 ?auto_2658754 ) ) ( not ( = ?auto_2658750 ?auto_2658755 ) ) ( not ( = ?auto_2658750 ?auto_2658756 ) ) ( not ( = ?auto_2658751 ?auto_2658753 ) ) ( not ( = ?auto_2658751 ?auto_2658752 ) ) ( not ( = ?auto_2658751 ?auto_2658754 ) ) ( not ( = ?auto_2658751 ?auto_2658755 ) ) ( not ( = ?auto_2658751 ?auto_2658756 ) ) ( not ( = ?auto_2658753 ?auto_2658752 ) ) ( not ( = ?auto_2658753 ?auto_2658754 ) ) ( not ( = ?auto_2658753 ?auto_2658755 ) ) ( not ( = ?auto_2658753 ?auto_2658756 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658752 ?auto_2658754 ?auto_2658755 )
      ( MAKE-6CRATE-VERIFY ?auto_2658749 ?auto_2658750 ?auto_2658751 ?auto_2658753 ?auto_2658752 ?auto_2658754 ?auto_2658755 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2658813 - SURFACE
      ?auto_2658814 - SURFACE
      ?auto_2658815 - SURFACE
      ?auto_2658817 - SURFACE
      ?auto_2658816 - SURFACE
      ?auto_2658818 - SURFACE
      ?auto_2658819 - SURFACE
    )
    :vars
    (
      ?auto_2658825 - HOIST
      ?auto_2658821 - PLACE
      ?auto_2658822 - PLACE
      ?auto_2658824 - HOIST
      ?auto_2658820 - SURFACE
      ?auto_2658823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658825 ?auto_2658821 ) ( IS-CRATE ?auto_2658819 ) ( not ( = ?auto_2658818 ?auto_2658819 ) ) ( not ( = ?auto_2658816 ?auto_2658818 ) ) ( not ( = ?auto_2658816 ?auto_2658819 ) ) ( not ( = ?auto_2658822 ?auto_2658821 ) ) ( HOIST-AT ?auto_2658824 ?auto_2658822 ) ( not ( = ?auto_2658825 ?auto_2658824 ) ) ( AVAILABLE ?auto_2658824 ) ( SURFACE-AT ?auto_2658819 ?auto_2658822 ) ( ON ?auto_2658819 ?auto_2658820 ) ( CLEAR ?auto_2658819 ) ( not ( = ?auto_2658818 ?auto_2658820 ) ) ( not ( = ?auto_2658819 ?auto_2658820 ) ) ( not ( = ?auto_2658816 ?auto_2658820 ) ) ( TRUCK-AT ?auto_2658823 ?auto_2658821 ) ( SURFACE-AT ?auto_2658816 ?auto_2658821 ) ( CLEAR ?auto_2658816 ) ( LIFTING ?auto_2658825 ?auto_2658818 ) ( IS-CRATE ?auto_2658818 ) ( ON ?auto_2658814 ?auto_2658813 ) ( ON ?auto_2658815 ?auto_2658814 ) ( ON ?auto_2658817 ?auto_2658815 ) ( ON ?auto_2658816 ?auto_2658817 ) ( not ( = ?auto_2658813 ?auto_2658814 ) ) ( not ( = ?auto_2658813 ?auto_2658815 ) ) ( not ( = ?auto_2658813 ?auto_2658817 ) ) ( not ( = ?auto_2658813 ?auto_2658816 ) ) ( not ( = ?auto_2658813 ?auto_2658818 ) ) ( not ( = ?auto_2658813 ?auto_2658819 ) ) ( not ( = ?auto_2658813 ?auto_2658820 ) ) ( not ( = ?auto_2658814 ?auto_2658815 ) ) ( not ( = ?auto_2658814 ?auto_2658817 ) ) ( not ( = ?auto_2658814 ?auto_2658816 ) ) ( not ( = ?auto_2658814 ?auto_2658818 ) ) ( not ( = ?auto_2658814 ?auto_2658819 ) ) ( not ( = ?auto_2658814 ?auto_2658820 ) ) ( not ( = ?auto_2658815 ?auto_2658817 ) ) ( not ( = ?auto_2658815 ?auto_2658816 ) ) ( not ( = ?auto_2658815 ?auto_2658818 ) ) ( not ( = ?auto_2658815 ?auto_2658819 ) ) ( not ( = ?auto_2658815 ?auto_2658820 ) ) ( not ( = ?auto_2658817 ?auto_2658816 ) ) ( not ( = ?auto_2658817 ?auto_2658818 ) ) ( not ( = ?auto_2658817 ?auto_2658819 ) ) ( not ( = ?auto_2658817 ?auto_2658820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658816 ?auto_2658818 ?auto_2658819 )
      ( MAKE-6CRATE-VERIFY ?auto_2658813 ?auto_2658814 ?auto_2658815 ?auto_2658817 ?auto_2658816 ?auto_2658818 ?auto_2658819 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2658877 - SURFACE
      ?auto_2658878 - SURFACE
      ?auto_2658879 - SURFACE
      ?auto_2658881 - SURFACE
      ?auto_2658880 - SURFACE
      ?auto_2658882 - SURFACE
      ?auto_2658883 - SURFACE
    )
    :vars
    (
      ?auto_2658888 - HOIST
      ?auto_2658884 - PLACE
      ?auto_2658885 - PLACE
      ?auto_2658887 - HOIST
      ?auto_2658886 - SURFACE
      ?auto_2658889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658888 ?auto_2658884 ) ( IS-CRATE ?auto_2658883 ) ( not ( = ?auto_2658882 ?auto_2658883 ) ) ( not ( = ?auto_2658880 ?auto_2658882 ) ) ( not ( = ?auto_2658880 ?auto_2658883 ) ) ( not ( = ?auto_2658885 ?auto_2658884 ) ) ( HOIST-AT ?auto_2658887 ?auto_2658885 ) ( not ( = ?auto_2658888 ?auto_2658887 ) ) ( AVAILABLE ?auto_2658887 ) ( SURFACE-AT ?auto_2658883 ?auto_2658885 ) ( ON ?auto_2658883 ?auto_2658886 ) ( CLEAR ?auto_2658883 ) ( not ( = ?auto_2658882 ?auto_2658886 ) ) ( not ( = ?auto_2658883 ?auto_2658886 ) ) ( not ( = ?auto_2658880 ?auto_2658886 ) ) ( TRUCK-AT ?auto_2658889 ?auto_2658884 ) ( SURFACE-AT ?auto_2658880 ?auto_2658884 ) ( CLEAR ?auto_2658880 ) ( IS-CRATE ?auto_2658882 ) ( AVAILABLE ?auto_2658888 ) ( IN ?auto_2658882 ?auto_2658889 ) ( ON ?auto_2658878 ?auto_2658877 ) ( ON ?auto_2658879 ?auto_2658878 ) ( ON ?auto_2658881 ?auto_2658879 ) ( ON ?auto_2658880 ?auto_2658881 ) ( not ( = ?auto_2658877 ?auto_2658878 ) ) ( not ( = ?auto_2658877 ?auto_2658879 ) ) ( not ( = ?auto_2658877 ?auto_2658881 ) ) ( not ( = ?auto_2658877 ?auto_2658880 ) ) ( not ( = ?auto_2658877 ?auto_2658882 ) ) ( not ( = ?auto_2658877 ?auto_2658883 ) ) ( not ( = ?auto_2658877 ?auto_2658886 ) ) ( not ( = ?auto_2658878 ?auto_2658879 ) ) ( not ( = ?auto_2658878 ?auto_2658881 ) ) ( not ( = ?auto_2658878 ?auto_2658880 ) ) ( not ( = ?auto_2658878 ?auto_2658882 ) ) ( not ( = ?auto_2658878 ?auto_2658883 ) ) ( not ( = ?auto_2658878 ?auto_2658886 ) ) ( not ( = ?auto_2658879 ?auto_2658881 ) ) ( not ( = ?auto_2658879 ?auto_2658880 ) ) ( not ( = ?auto_2658879 ?auto_2658882 ) ) ( not ( = ?auto_2658879 ?auto_2658883 ) ) ( not ( = ?auto_2658879 ?auto_2658886 ) ) ( not ( = ?auto_2658881 ?auto_2658880 ) ) ( not ( = ?auto_2658881 ?auto_2658882 ) ) ( not ( = ?auto_2658881 ?auto_2658883 ) ) ( not ( = ?auto_2658881 ?auto_2658886 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2658880 ?auto_2658882 ?auto_2658883 )
      ( MAKE-6CRATE-VERIFY ?auto_2658877 ?auto_2658878 ?auto_2658879 ?auto_2658881 ?auto_2658880 ?auto_2658882 ?auto_2658883 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2659347 - SURFACE
      ?auto_2659348 - SURFACE
    )
    :vars
    (
      ?auto_2659355 - HOIST
      ?auto_2659349 - PLACE
      ?auto_2659351 - SURFACE
      ?auto_2659352 - PLACE
      ?auto_2659350 - HOIST
      ?auto_2659353 - SURFACE
      ?auto_2659354 - TRUCK
      ?auto_2659356 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2659355 ?auto_2659349 ) ( SURFACE-AT ?auto_2659347 ?auto_2659349 ) ( CLEAR ?auto_2659347 ) ( IS-CRATE ?auto_2659348 ) ( not ( = ?auto_2659347 ?auto_2659348 ) ) ( ON ?auto_2659347 ?auto_2659351 ) ( not ( = ?auto_2659351 ?auto_2659347 ) ) ( not ( = ?auto_2659351 ?auto_2659348 ) ) ( not ( = ?auto_2659352 ?auto_2659349 ) ) ( HOIST-AT ?auto_2659350 ?auto_2659352 ) ( not ( = ?auto_2659355 ?auto_2659350 ) ) ( AVAILABLE ?auto_2659350 ) ( SURFACE-AT ?auto_2659348 ?auto_2659352 ) ( ON ?auto_2659348 ?auto_2659353 ) ( CLEAR ?auto_2659348 ) ( not ( = ?auto_2659347 ?auto_2659353 ) ) ( not ( = ?auto_2659348 ?auto_2659353 ) ) ( not ( = ?auto_2659351 ?auto_2659353 ) ) ( TRUCK-AT ?auto_2659354 ?auto_2659349 ) ( LIFTING ?auto_2659355 ?auto_2659356 ) ( IS-CRATE ?auto_2659356 ) ( not ( = ?auto_2659347 ?auto_2659356 ) ) ( not ( = ?auto_2659348 ?auto_2659356 ) ) ( not ( = ?auto_2659351 ?auto_2659356 ) ) ( not ( = ?auto_2659353 ?auto_2659356 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2659355 ?auto_2659356 ?auto_2659354 ?auto_2659349 )
      ( MAKE-1CRATE ?auto_2659347 ?auto_2659348 )
      ( MAKE-1CRATE-VERIFY ?auto_2659347 ?auto_2659348 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2660826 - SURFACE
      ?auto_2660827 - SURFACE
      ?auto_2660828 - SURFACE
      ?auto_2660830 - SURFACE
      ?auto_2660829 - SURFACE
      ?auto_2660831 - SURFACE
      ?auto_2660832 - SURFACE
      ?auto_2660833 - SURFACE
    )
    :vars
    (
      ?auto_2660835 - HOIST
      ?auto_2660834 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2660835 ?auto_2660834 ) ( SURFACE-AT ?auto_2660832 ?auto_2660834 ) ( CLEAR ?auto_2660832 ) ( LIFTING ?auto_2660835 ?auto_2660833 ) ( IS-CRATE ?auto_2660833 ) ( not ( = ?auto_2660832 ?auto_2660833 ) ) ( ON ?auto_2660827 ?auto_2660826 ) ( ON ?auto_2660828 ?auto_2660827 ) ( ON ?auto_2660830 ?auto_2660828 ) ( ON ?auto_2660829 ?auto_2660830 ) ( ON ?auto_2660831 ?auto_2660829 ) ( ON ?auto_2660832 ?auto_2660831 ) ( not ( = ?auto_2660826 ?auto_2660827 ) ) ( not ( = ?auto_2660826 ?auto_2660828 ) ) ( not ( = ?auto_2660826 ?auto_2660830 ) ) ( not ( = ?auto_2660826 ?auto_2660829 ) ) ( not ( = ?auto_2660826 ?auto_2660831 ) ) ( not ( = ?auto_2660826 ?auto_2660832 ) ) ( not ( = ?auto_2660826 ?auto_2660833 ) ) ( not ( = ?auto_2660827 ?auto_2660828 ) ) ( not ( = ?auto_2660827 ?auto_2660830 ) ) ( not ( = ?auto_2660827 ?auto_2660829 ) ) ( not ( = ?auto_2660827 ?auto_2660831 ) ) ( not ( = ?auto_2660827 ?auto_2660832 ) ) ( not ( = ?auto_2660827 ?auto_2660833 ) ) ( not ( = ?auto_2660828 ?auto_2660830 ) ) ( not ( = ?auto_2660828 ?auto_2660829 ) ) ( not ( = ?auto_2660828 ?auto_2660831 ) ) ( not ( = ?auto_2660828 ?auto_2660832 ) ) ( not ( = ?auto_2660828 ?auto_2660833 ) ) ( not ( = ?auto_2660830 ?auto_2660829 ) ) ( not ( = ?auto_2660830 ?auto_2660831 ) ) ( not ( = ?auto_2660830 ?auto_2660832 ) ) ( not ( = ?auto_2660830 ?auto_2660833 ) ) ( not ( = ?auto_2660829 ?auto_2660831 ) ) ( not ( = ?auto_2660829 ?auto_2660832 ) ) ( not ( = ?auto_2660829 ?auto_2660833 ) ) ( not ( = ?auto_2660831 ?auto_2660832 ) ) ( not ( = ?auto_2660831 ?auto_2660833 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2660832 ?auto_2660833 )
      ( MAKE-7CRATE-VERIFY ?auto_2660826 ?auto_2660827 ?auto_2660828 ?auto_2660830 ?auto_2660829 ?auto_2660831 ?auto_2660832 ?auto_2660833 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2660881 - SURFACE
      ?auto_2660882 - SURFACE
      ?auto_2660883 - SURFACE
      ?auto_2660885 - SURFACE
      ?auto_2660884 - SURFACE
      ?auto_2660886 - SURFACE
      ?auto_2660887 - SURFACE
      ?auto_2660888 - SURFACE
    )
    :vars
    (
      ?auto_2660889 - HOIST
      ?auto_2660890 - PLACE
      ?auto_2660891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2660889 ?auto_2660890 ) ( SURFACE-AT ?auto_2660887 ?auto_2660890 ) ( CLEAR ?auto_2660887 ) ( IS-CRATE ?auto_2660888 ) ( not ( = ?auto_2660887 ?auto_2660888 ) ) ( TRUCK-AT ?auto_2660891 ?auto_2660890 ) ( AVAILABLE ?auto_2660889 ) ( IN ?auto_2660888 ?auto_2660891 ) ( ON ?auto_2660887 ?auto_2660886 ) ( not ( = ?auto_2660886 ?auto_2660887 ) ) ( not ( = ?auto_2660886 ?auto_2660888 ) ) ( ON ?auto_2660882 ?auto_2660881 ) ( ON ?auto_2660883 ?auto_2660882 ) ( ON ?auto_2660885 ?auto_2660883 ) ( ON ?auto_2660884 ?auto_2660885 ) ( ON ?auto_2660886 ?auto_2660884 ) ( not ( = ?auto_2660881 ?auto_2660882 ) ) ( not ( = ?auto_2660881 ?auto_2660883 ) ) ( not ( = ?auto_2660881 ?auto_2660885 ) ) ( not ( = ?auto_2660881 ?auto_2660884 ) ) ( not ( = ?auto_2660881 ?auto_2660886 ) ) ( not ( = ?auto_2660881 ?auto_2660887 ) ) ( not ( = ?auto_2660881 ?auto_2660888 ) ) ( not ( = ?auto_2660882 ?auto_2660883 ) ) ( not ( = ?auto_2660882 ?auto_2660885 ) ) ( not ( = ?auto_2660882 ?auto_2660884 ) ) ( not ( = ?auto_2660882 ?auto_2660886 ) ) ( not ( = ?auto_2660882 ?auto_2660887 ) ) ( not ( = ?auto_2660882 ?auto_2660888 ) ) ( not ( = ?auto_2660883 ?auto_2660885 ) ) ( not ( = ?auto_2660883 ?auto_2660884 ) ) ( not ( = ?auto_2660883 ?auto_2660886 ) ) ( not ( = ?auto_2660883 ?auto_2660887 ) ) ( not ( = ?auto_2660883 ?auto_2660888 ) ) ( not ( = ?auto_2660885 ?auto_2660884 ) ) ( not ( = ?auto_2660885 ?auto_2660886 ) ) ( not ( = ?auto_2660885 ?auto_2660887 ) ) ( not ( = ?auto_2660885 ?auto_2660888 ) ) ( not ( = ?auto_2660884 ?auto_2660886 ) ) ( not ( = ?auto_2660884 ?auto_2660887 ) ) ( not ( = ?auto_2660884 ?auto_2660888 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2660886 ?auto_2660887 ?auto_2660888 )
      ( MAKE-7CRATE-VERIFY ?auto_2660881 ?auto_2660882 ?auto_2660883 ?auto_2660885 ?auto_2660884 ?auto_2660886 ?auto_2660887 ?auto_2660888 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2660944 - SURFACE
      ?auto_2660945 - SURFACE
      ?auto_2660946 - SURFACE
      ?auto_2660948 - SURFACE
      ?auto_2660947 - SURFACE
      ?auto_2660949 - SURFACE
      ?auto_2660950 - SURFACE
      ?auto_2660951 - SURFACE
    )
    :vars
    (
      ?auto_2660954 - HOIST
      ?auto_2660952 - PLACE
      ?auto_2660953 - TRUCK
      ?auto_2660955 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2660954 ?auto_2660952 ) ( SURFACE-AT ?auto_2660950 ?auto_2660952 ) ( CLEAR ?auto_2660950 ) ( IS-CRATE ?auto_2660951 ) ( not ( = ?auto_2660950 ?auto_2660951 ) ) ( AVAILABLE ?auto_2660954 ) ( IN ?auto_2660951 ?auto_2660953 ) ( ON ?auto_2660950 ?auto_2660949 ) ( not ( = ?auto_2660949 ?auto_2660950 ) ) ( not ( = ?auto_2660949 ?auto_2660951 ) ) ( TRUCK-AT ?auto_2660953 ?auto_2660955 ) ( not ( = ?auto_2660955 ?auto_2660952 ) ) ( ON ?auto_2660945 ?auto_2660944 ) ( ON ?auto_2660946 ?auto_2660945 ) ( ON ?auto_2660948 ?auto_2660946 ) ( ON ?auto_2660947 ?auto_2660948 ) ( ON ?auto_2660949 ?auto_2660947 ) ( not ( = ?auto_2660944 ?auto_2660945 ) ) ( not ( = ?auto_2660944 ?auto_2660946 ) ) ( not ( = ?auto_2660944 ?auto_2660948 ) ) ( not ( = ?auto_2660944 ?auto_2660947 ) ) ( not ( = ?auto_2660944 ?auto_2660949 ) ) ( not ( = ?auto_2660944 ?auto_2660950 ) ) ( not ( = ?auto_2660944 ?auto_2660951 ) ) ( not ( = ?auto_2660945 ?auto_2660946 ) ) ( not ( = ?auto_2660945 ?auto_2660948 ) ) ( not ( = ?auto_2660945 ?auto_2660947 ) ) ( not ( = ?auto_2660945 ?auto_2660949 ) ) ( not ( = ?auto_2660945 ?auto_2660950 ) ) ( not ( = ?auto_2660945 ?auto_2660951 ) ) ( not ( = ?auto_2660946 ?auto_2660948 ) ) ( not ( = ?auto_2660946 ?auto_2660947 ) ) ( not ( = ?auto_2660946 ?auto_2660949 ) ) ( not ( = ?auto_2660946 ?auto_2660950 ) ) ( not ( = ?auto_2660946 ?auto_2660951 ) ) ( not ( = ?auto_2660948 ?auto_2660947 ) ) ( not ( = ?auto_2660948 ?auto_2660949 ) ) ( not ( = ?auto_2660948 ?auto_2660950 ) ) ( not ( = ?auto_2660948 ?auto_2660951 ) ) ( not ( = ?auto_2660947 ?auto_2660949 ) ) ( not ( = ?auto_2660947 ?auto_2660950 ) ) ( not ( = ?auto_2660947 ?auto_2660951 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2660949 ?auto_2660950 ?auto_2660951 )
      ( MAKE-7CRATE-VERIFY ?auto_2660944 ?auto_2660945 ?auto_2660946 ?auto_2660948 ?auto_2660947 ?auto_2660949 ?auto_2660950 ?auto_2660951 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2661014 - SURFACE
      ?auto_2661015 - SURFACE
      ?auto_2661016 - SURFACE
      ?auto_2661018 - SURFACE
      ?auto_2661017 - SURFACE
      ?auto_2661019 - SURFACE
      ?auto_2661020 - SURFACE
      ?auto_2661021 - SURFACE
    )
    :vars
    (
      ?auto_2661022 - HOIST
      ?auto_2661025 - PLACE
      ?auto_2661026 - TRUCK
      ?auto_2661023 - PLACE
      ?auto_2661024 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2661022 ?auto_2661025 ) ( SURFACE-AT ?auto_2661020 ?auto_2661025 ) ( CLEAR ?auto_2661020 ) ( IS-CRATE ?auto_2661021 ) ( not ( = ?auto_2661020 ?auto_2661021 ) ) ( AVAILABLE ?auto_2661022 ) ( ON ?auto_2661020 ?auto_2661019 ) ( not ( = ?auto_2661019 ?auto_2661020 ) ) ( not ( = ?auto_2661019 ?auto_2661021 ) ) ( TRUCK-AT ?auto_2661026 ?auto_2661023 ) ( not ( = ?auto_2661023 ?auto_2661025 ) ) ( HOIST-AT ?auto_2661024 ?auto_2661023 ) ( LIFTING ?auto_2661024 ?auto_2661021 ) ( not ( = ?auto_2661022 ?auto_2661024 ) ) ( ON ?auto_2661015 ?auto_2661014 ) ( ON ?auto_2661016 ?auto_2661015 ) ( ON ?auto_2661018 ?auto_2661016 ) ( ON ?auto_2661017 ?auto_2661018 ) ( ON ?auto_2661019 ?auto_2661017 ) ( not ( = ?auto_2661014 ?auto_2661015 ) ) ( not ( = ?auto_2661014 ?auto_2661016 ) ) ( not ( = ?auto_2661014 ?auto_2661018 ) ) ( not ( = ?auto_2661014 ?auto_2661017 ) ) ( not ( = ?auto_2661014 ?auto_2661019 ) ) ( not ( = ?auto_2661014 ?auto_2661020 ) ) ( not ( = ?auto_2661014 ?auto_2661021 ) ) ( not ( = ?auto_2661015 ?auto_2661016 ) ) ( not ( = ?auto_2661015 ?auto_2661018 ) ) ( not ( = ?auto_2661015 ?auto_2661017 ) ) ( not ( = ?auto_2661015 ?auto_2661019 ) ) ( not ( = ?auto_2661015 ?auto_2661020 ) ) ( not ( = ?auto_2661015 ?auto_2661021 ) ) ( not ( = ?auto_2661016 ?auto_2661018 ) ) ( not ( = ?auto_2661016 ?auto_2661017 ) ) ( not ( = ?auto_2661016 ?auto_2661019 ) ) ( not ( = ?auto_2661016 ?auto_2661020 ) ) ( not ( = ?auto_2661016 ?auto_2661021 ) ) ( not ( = ?auto_2661018 ?auto_2661017 ) ) ( not ( = ?auto_2661018 ?auto_2661019 ) ) ( not ( = ?auto_2661018 ?auto_2661020 ) ) ( not ( = ?auto_2661018 ?auto_2661021 ) ) ( not ( = ?auto_2661017 ?auto_2661019 ) ) ( not ( = ?auto_2661017 ?auto_2661020 ) ) ( not ( = ?auto_2661017 ?auto_2661021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2661019 ?auto_2661020 ?auto_2661021 )
      ( MAKE-7CRATE-VERIFY ?auto_2661014 ?auto_2661015 ?auto_2661016 ?auto_2661018 ?auto_2661017 ?auto_2661019 ?auto_2661020 ?auto_2661021 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2661091 - SURFACE
      ?auto_2661092 - SURFACE
      ?auto_2661093 - SURFACE
      ?auto_2661095 - SURFACE
      ?auto_2661094 - SURFACE
      ?auto_2661096 - SURFACE
      ?auto_2661097 - SURFACE
      ?auto_2661098 - SURFACE
    )
    :vars
    (
      ?auto_2661102 - HOIST
      ?auto_2661101 - PLACE
      ?auto_2661100 - TRUCK
      ?auto_2661099 - PLACE
      ?auto_2661103 - HOIST
      ?auto_2661104 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2661102 ?auto_2661101 ) ( SURFACE-AT ?auto_2661097 ?auto_2661101 ) ( CLEAR ?auto_2661097 ) ( IS-CRATE ?auto_2661098 ) ( not ( = ?auto_2661097 ?auto_2661098 ) ) ( AVAILABLE ?auto_2661102 ) ( ON ?auto_2661097 ?auto_2661096 ) ( not ( = ?auto_2661096 ?auto_2661097 ) ) ( not ( = ?auto_2661096 ?auto_2661098 ) ) ( TRUCK-AT ?auto_2661100 ?auto_2661099 ) ( not ( = ?auto_2661099 ?auto_2661101 ) ) ( HOIST-AT ?auto_2661103 ?auto_2661099 ) ( not ( = ?auto_2661102 ?auto_2661103 ) ) ( AVAILABLE ?auto_2661103 ) ( SURFACE-AT ?auto_2661098 ?auto_2661099 ) ( ON ?auto_2661098 ?auto_2661104 ) ( CLEAR ?auto_2661098 ) ( not ( = ?auto_2661097 ?auto_2661104 ) ) ( not ( = ?auto_2661098 ?auto_2661104 ) ) ( not ( = ?auto_2661096 ?auto_2661104 ) ) ( ON ?auto_2661092 ?auto_2661091 ) ( ON ?auto_2661093 ?auto_2661092 ) ( ON ?auto_2661095 ?auto_2661093 ) ( ON ?auto_2661094 ?auto_2661095 ) ( ON ?auto_2661096 ?auto_2661094 ) ( not ( = ?auto_2661091 ?auto_2661092 ) ) ( not ( = ?auto_2661091 ?auto_2661093 ) ) ( not ( = ?auto_2661091 ?auto_2661095 ) ) ( not ( = ?auto_2661091 ?auto_2661094 ) ) ( not ( = ?auto_2661091 ?auto_2661096 ) ) ( not ( = ?auto_2661091 ?auto_2661097 ) ) ( not ( = ?auto_2661091 ?auto_2661098 ) ) ( not ( = ?auto_2661091 ?auto_2661104 ) ) ( not ( = ?auto_2661092 ?auto_2661093 ) ) ( not ( = ?auto_2661092 ?auto_2661095 ) ) ( not ( = ?auto_2661092 ?auto_2661094 ) ) ( not ( = ?auto_2661092 ?auto_2661096 ) ) ( not ( = ?auto_2661092 ?auto_2661097 ) ) ( not ( = ?auto_2661092 ?auto_2661098 ) ) ( not ( = ?auto_2661092 ?auto_2661104 ) ) ( not ( = ?auto_2661093 ?auto_2661095 ) ) ( not ( = ?auto_2661093 ?auto_2661094 ) ) ( not ( = ?auto_2661093 ?auto_2661096 ) ) ( not ( = ?auto_2661093 ?auto_2661097 ) ) ( not ( = ?auto_2661093 ?auto_2661098 ) ) ( not ( = ?auto_2661093 ?auto_2661104 ) ) ( not ( = ?auto_2661095 ?auto_2661094 ) ) ( not ( = ?auto_2661095 ?auto_2661096 ) ) ( not ( = ?auto_2661095 ?auto_2661097 ) ) ( not ( = ?auto_2661095 ?auto_2661098 ) ) ( not ( = ?auto_2661095 ?auto_2661104 ) ) ( not ( = ?auto_2661094 ?auto_2661096 ) ) ( not ( = ?auto_2661094 ?auto_2661097 ) ) ( not ( = ?auto_2661094 ?auto_2661098 ) ) ( not ( = ?auto_2661094 ?auto_2661104 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2661096 ?auto_2661097 ?auto_2661098 )
      ( MAKE-7CRATE-VERIFY ?auto_2661091 ?auto_2661092 ?auto_2661093 ?auto_2661095 ?auto_2661094 ?auto_2661096 ?auto_2661097 ?auto_2661098 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2661169 - SURFACE
      ?auto_2661170 - SURFACE
      ?auto_2661171 - SURFACE
      ?auto_2661173 - SURFACE
      ?auto_2661172 - SURFACE
      ?auto_2661174 - SURFACE
      ?auto_2661175 - SURFACE
      ?auto_2661176 - SURFACE
    )
    :vars
    (
      ?auto_2661181 - HOIST
      ?auto_2661180 - PLACE
      ?auto_2661179 - PLACE
      ?auto_2661178 - HOIST
      ?auto_2661177 - SURFACE
      ?auto_2661182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2661181 ?auto_2661180 ) ( SURFACE-AT ?auto_2661175 ?auto_2661180 ) ( CLEAR ?auto_2661175 ) ( IS-CRATE ?auto_2661176 ) ( not ( = ?auto_2661175 ?auto_2661176 ) ) ( AVAILABLE ?auto_2661181 ) ( ON ?auto_2661175 ?auto_2661174 ) ( not ( = ?auto_2661174 ?auto_2661175 ) ) ( not ( = ?auto_2661174 ?auto_2661176 ) ) ( not ( = ?auto_2661179 ?auto_2661180 ) ) ( HOIST-AT ?auto_2661178 ?auto_2661179 ) ( not ( = ?auto_2661181 ?auto_2661178 ) ) ( AVAILABLE ?auto_2661178 ) ( SURFACE-AT ?auto_2661176 ?auto_2661179 ) ( ON ?auto_2661176 ?auto_2661177 ) ( CLEAR ?auto_2661176 ) ( not ( = ?auto_2661175 ?auto_2661177 ) ) ( not ( = ?auto_2661176 ?auto_2661177 ) ) ( not ( = ?auto_2661174 ?auto_2661177 ) ) ( TRUCK-AT ?auto_2661182 ?auto_2661180 ) ( ON ?auto_2661170 ?auto_2661169 ) ( ON ?auto_2661171 ?auto_2661170 ) ( ON ?auto_2661173 ?auto_2661171 ) ( ON ?auto_2661172 ?auto_2661173 ) ( ON ?auto_2661174 ?auto_2661172 ) ( not ( = ?auto_2661169 ?auto_2661170 ) ) ( not ( = ?auto_2661169 ?auto_2661171 ) ) ( not ( = ?auto_2661169 ?auto_2661173 ) ) ( not ( = ?auto_2661169 ?auto_2661172 ) ) ( not ( = ?auto_2661169 ?auto_2661174 ) ) ( not ( = ?auto_2661169 ?auto_2661175 ) ) ( not ( = ?auto_2661169 ?auto_2661176 ) ) ( not ( = ?auto_2661169 ?auto_2661177 ) ) ( not ( = ?auto_2661170 ?auto_2661171 ) ) ( not ( = ?auto_2661170 ?auto_2661173 ) ) ( not ( = ?auto_2661170 ?auto_2661172 ) ) ( not ( = ?auto_2661170 ?auto_2661174 ) ) ( not ( = ?auto_2661170 ?auto_2661175 ) ) ( not ( = ?auto_2661170 ?auto_2661176 ) ) ( not ( = ?auto_2661170 ?auto_2661177 ) ) ( not ( = ?auto_2661171 ?auto_2661173 ) ) ( not ( = ?auto_2661171 ?auto_2661172 ) ) ( not ( = ?auto_2661171 ?auto_2661174 ) ) ( not ( = ?auto_2661171 ?auto_2661175 ) ) ( not ( = ?auto_2661171 ?auto_2661176 ) ) ( not ( = ?auto_2661171 ?auto_2661177 ) ) ( not ( = ?auto_2661173 ?auto_2661172 ) ) ( not ( = ?auto_2661173 ?auto_2661174 ) ) ( not ( = ?auto_2661173 ?auto_2661175 ) ) ( not ( = ?auto_2661173 ?auto_2661176 ) ) ( not ( = ?auto_2661173 ?auto_2661177 ) ) ( not ( = ?auto_2661172 ?auto_2661174 ) ) ( not ( = ?auto_2661172 ?auto_2661175 ) ) ( not ( = ?auto_2661172 ?auto_2661176 ) ) ( not ( = ?auto_2661172 ?auto_2661177 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2661174 ?auto_2661175 ?auto_2661176 )
      ( MAKE-7CRATE-VERIFY ?auto_2661169 ?auto_2661170 ?auto_2661171 ?auto_2661173 ?auto_2661172 ?auto_2661174 ?auto_2661175 ?auto_2661176 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2661247 - SURFACE
      ?auto_2661248 - SURFACE
      ?auto_2661249 - SURFACE
      ?auto_2661251 - SURFACE
      ?auto_2661250 - SURFACE
      ?auto_2661252 - SURFACE
      ?auto_2661253 - SURFACE
      ?auto_2661254 - SURFACE
    )
    :vars
    (
      ?auto_2661259 - HOIST
      ?auto_2661256 - PLACE
      ?auto_2661260 - PLACE
      ?auto_2661255 - HOIST
      ?auto_2661257 - SURFACE
      ?auto_2661258 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2661259 ?auto_2661256 ) ( IS-CRATE ?auto_2661254 ) ( not ( = ?auto_2661253 ?auto_2661254 ) ) ( not ( = ?auto_2661252 ?auto_2661253 ) ) ( not ( = ?auto_2661252 ?auto_2661254 ) ) ( not ( = ?auto_2661260 ?auto_2661256 ) ) ( HOIST-AT ?auto_2661255 ?auto_2661260 ) ( not ( = ?auto_2661259 ?auto_2661255 ) ) ( AVAILABLE ?auto_2661255 ) ( SURFACE-AT ?auto_2661254 ?auto_2661260 ) ( ON ?auto_2661254 ?auto_2661257 ) ( CLEAR ?auto_2661254 ) ( not ( = ?auto_2661253 ?auto_2661257 ) ) ( not ( = ?auto_2661254 ?auto_2661257 ) ) ( not ( = ?auto_2661252 ?auto_2661257 ) ) ( TRUCK-AT ?auto_2661258 ?auto_2661256 ) ( SURFACE-AT ?auto_2661252 ?auto_2661256 ) ( CLEAR ?auto_2661252 ) ( LIFTING ?auto_2661259 ?auto_2661253 ) ( IS-CRATE ?auto_2661253 ) ( ON ?auto_2661248 ?auto_2661247 ) ( ON ?auto_2661249 ?auto_2661248 ) ( ON ?auto_2661251 ?auto_2661249 ) ( ON ?auto_2661250 ?auto_2661251 ) ( ON ?auto_2661252 ?auto_2661250 ) ( not ( = ?auto_2661247 ?auto_2661248 ) ) ( not ( = ?auto_2661247 ?auto_2661249 ) ) ( not ( = ?auto_2661247 ?auto_2661251 ) ) ( not ( = ?auto_2661247 ?auto_2661250 ) ) ( not ( = ?auto_2661247 ?auto_2661252 ) ) ( not ( = ?auto_2661247 ?auto_2661253 ) ) ( not ( = ?auto_2661247 ?auto_2661254 ) ) ( not ( = ?auto_2661247 ?auto_2661257 ) ) ( not ( = ?auto_2661248 ?auto_2661249 ) ) ( not ( = ?auto_2661248 ?auto_2661251 ) ) ( not ( = ?auto_2661248 ?auto_2661250 ) ) ( not ( = ?auto_2661248 ?auto_2661252 ) ) ( not ( = ?auto_2661248 ?auto_2661253 ) ) ( not ( = ?auto_2661248 ?auto_2661254 ) ) ( not ( = ?auto_2661248 ?auto_2661257 ) ) ( not ( = ?auto_2661249 ?auto_2661251 ) ) ( not ( = ?auto_2661249 ?auto_2661250 ) ) ( not ( = ?auto_2661249 ?auto_2661252 ) ) ( not ( = ?auto_2661249 ?auto_2661253 ) ) ( not ( = ?auto_2661249 ?auto_2661254 ) ) ( not ( = ?auto_2661249 ?auto_2661257 ) ) ( not ( = ?auto_2661251 ?auto_2661250 ) ) ( not ( = ?auto_2661251 ?auto_2661252 ) ) ( not ( = ?auto_2661251 ?auto_2661253 ) ) ( not ( = ?auto_2661251 ?auto_2661254 ) ) ( not ( = ?auto_2661251 ?auto_2661257 ) ) ( not ( = ?auto_2661250 ?auto_2661252 ) ) ( not ( = ?auto_2661250 ?auto_2661253 ) ) ( not ( = ?auto_2661250 ?auto_2661254 ) ) ( not ( = ?auto_2661250 ?auto_2661257 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2661252 ?auto_2661253 ?auto_2661254 )
      ( MAKE-7CRATE-VERIFY ?auto_2661247 ?auto_2661248 ?auto_2661249 ?auto_2661251 ?auto_2661250 ?auto_2661252 ?auto_2661253 ?auto_2661254 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2661325 - SURFACE
      ?auto_2661326 - SURFACE
      ?auto_2661327 - SURFACE
      ?auto_2661329 - SURFACE
      ?auto_2661328 - SURFACE
      ?auto_2661330 - SURFACE
      ?auto_2661331 - SURFACE
      ?auto_2661332 - SURFACE
    )
    :vars
    (
      ?auto_2661333 - HOIST
      ?auto_2661335 - PLACE
      ?auto_2661337 - PLACE
      ?auto_2661334 - HOIST
      ?auto_2661336 - SURFACE
      ?auto_2661338 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2661333 ?auto_2661335 ) ( IS-CRATE ?auto_2661332 ) ( not ( = ?auto_2661331 ?auto_2661332 ) ) ( not ( = ?auto_2661330 ?auto_2661331 ) ) ( not ( = ?auto_2661330 ?auto_2661332 ) ) ( not ( = ?auto_2661337 ?auto_2661335 ) ) ( HOIST-AT ?auto_2661334 ?auto_2661337 ) ( not ( = ?auto_2661333 ?auto_2661334 ) ) ( AVAILABLE ?auto_2661334 ) ( SURFACE-AT ?auto_2661332 ?auto_2661337 ) ( ON ?auto_2661332 ?auto_2661336 ) ( CLEAR ?auto_2661332 ) ( not ( = ?auto_2661331 ?auto_2661336 ) ) ( not ( = ?auto_2661332 ?auto_2661336 ) ) ( not ( = ?auto_2661330 ?auto_2661336 ) ) ( TRUCK-AT ?auto_2661338 ?auto_2661335 ) ( SURFACE-AT ?auto_2661330 ?auto_2661335 ) ( CLEAR ?auto_2661330 ) ( IS-CRATE ?auto_2661331 ) ( AVAILABLE ?auto_2661333 ) ( IN ?auto_2661331 ?auto_2661338 ) ( ON ?auto_2661326 ?auto_2661325 ) ( ON ?auto_2661327 ?auto_2661326 ) ( ON ?auto_2661329 ?auto_2661327 ) ( ON ?auto_2661328 ?auto_2661329 ) ( ON ?auto_2661330 ?auto_2661328 ) ( not ( = ?auto_2661325 ?auto_2661326 ) ) ( not ( = ?auto_2661325 ?auto_2661327 ) ) ( not ( = ?auto_2661325 ?auto_2661329 ) ) ( not ( = ?auto_2661325 ?auto_2661328 ) ) ( not ( = ?auto_2661325 ?auto_2661330 ) ) ( not ( = ?auto_2661325 ?auto_2661331 ) ) ( not ( = ?auto_2661325 ?auto_2661332 ) ) ( not ( = ?auto_2661325 ?auto_2661336 ) ) ( not ( = ?auto_2661326 ?auto_2661327 ) ) ( not ( = ?auto_2661326 ?auto_2661329 ) ) ( not ( = ?auto_2661326 ?auto_2661328 ) ) ( not ( = ?auto_2661326 ?auto_2661330 ) ) ( not ( = ?auto_2661326 ?auto_2661331 ) ) ( not ( = ?auto_2661326 ?auto_2661332 ) ) ( not ( = ?auto_2661326 ?auto_2661336 ) ) ( not ( = ?auto_2661327 ?auto_2661329 ) ) ( not ( = ?auto_2661327 ?auto_2661328 ) ) ( not ( = ?auto_2661327 ?auto_2661330 ) ) ( not ( = ?auto_2661327 ?auto_2661331 ) ) ( not ( = ?auto_2661327 ?auto_2661332 ) ) ( not ( = ?auto_2661327 ?auto_2661336 ) ) ( not ( = ?auto_2661329 ?auto_2661328 ) ) ( not ( = ?auto_2661329 ?auto_2661330 ) ) ( not ( = ?auto_2661329 ?auto_2661331 ) ) ( not ( = ?auto_2661329 ?auto_2661332 ) ) ( not ( = ?auto_2661329 ?auto_2661336 ) ) ( not ( = ?auto_2661328 ?auto_2661330 ) ) ( not ( = ?auto_2661328 ?auto_2661331 ) ) ( not ( = ?auto_2661328 ?auto_2661332 ) ) ( not ( = ?auto_2661328 ?auto_2661336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2661330 ?auto_2661331 ?auto_2661332 )
      ( MAKE-7CRATE-VERIFY ?auto_2661325 ?auto_2661326 ?auto_2661327 ?auto_2661329 ?auto_2661328 ?auto_2661330 ?auto_2661331 ?auto_2661332 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2664244 - SURFACE
      ?auto_2664245 - SURFACE
      ?auto_2664246 - SURFACE
      ?auto_2664248 - SURFACE
      ?auto_2664247 - SURFACE
      ?auto_2664249 - SURFACE
      ?auto_2664250 - SURFACE
      ?auto_2664251 - SURFACE
      ?auto_2664252 - SURFACE
    )
    :vars
    (
      ?auto_2664254 - HOIST
      ?auto_2664253 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2664254 ?auto_2664253 ) ( SURFACE-AT ?auto_2664251 ?auto_2664253 ) ( CLEAR ?auto_2664251 ) ( LIFTING ?auto_2664254 ?auto_2664252 ) ( IS-CRATE ?auto_2664252 ) ( not ( = ?auto_2664251 ?auto_2664252 ) ) ( ON ?auto_2664245 ?auto_2664244 ) ( ON ?auto_2664246 ?auto_2664245 ) ( ON ?auto_2664248 ?auto_2664246 ) ( ON ?auto_2664247 ?auto_2664248 ) ( ON ?auto_2664249 ?auto_2664247 ) ( ON ?auto_2664250 ?auto_2664249 ) ( ON ?auto_2664251 ?auto_2664250 ) ( not ( = ?auto_2664244 ?auto_2664245 ) ) ( not ( = ?auto_2664244 ?auto_2664246 ) ) ( not ( = ?auto_2664244 ?auto_2664248 ) ) ( not ( = ?auto_2664244 ?auto_2664247 ) ) ( not ( = ?auto_2664244 ?auto_2664249 ) ) ( not ( = ?auto_2664244 ?auto_2664250 ) ) ( not ( = ?auto_2664244 ?auto_2664251 ) ) ( not ( = ?auto_2664244 ?auto_2664252 ) ) ( not ( = ?auto_2664245 ?auto_2664246 ) ) ( not ( = ?auto_2664245 ?auto_2664248 ) ) ( not ( = ?auto_2664245 ?auto_2664247 ) ) ( not ( = ?auto_2664245 ?auto_2664249 ) ) ( not ( = ?auto_2664245 ?auto_2664250 ) ) ( not ( = ?auto_2664245 ?auto_2664251 ) ) ( not ( = ?auto_2664245 ?auto_2664252 ) ) ( not ( = ?auto_2664246 ?auto_2664248 ) ) ( not ( = ?auto_2664246 ?auto_2664247 ) ) ( not ( = ?auto_2664246 ?auto_2664249 ) ) ( not ( = ?auto_2664246 ?auto_2664250 ) ) ( not ( = ?auto_2664246 ?auto_2664251 ) ) ( not ( = ?auto_2664246 ?auto_2664252 ) ) ( not ( = ?auto_2664248 ?auto_2664247 ) ) ( not ( = ?auto_2664248 ?auto_2664249 ) ) ( not ( = ?auto_2664248 ?auto_2664250 ) ) ( not ( = ?auto_2664248 ?auto_2664251 ) ) ( not ( = ?auto_2664248 ?auto_2664252 ) ) ( not ( = ?auto_2664247 ?auto_2664249 ) ) ( not ( = ?auto_2664247 ?auto_2664250 ) ) ( not ( = ?auto_2664247 ?auto_2664251 ) ) ( not ( = ?auto_2664247 ?auto_2664252 ) ) ( not ( = ?auto_2664249 ?auto_2664250 ) ) ( not ( = ?auto_2664249 ?auto_2664251 ) ) ( not ( = ?auto_2664249 ?auto_2664252 ) ) ( not ( = ?auto_2664250 ?auto_2664251 ) ) ( not ( = ?auto_2664250 ?auto_2664252 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2664251 ?auto_2664252 )
      ( MAKE-8CRATE-VERIFY ?auto_2664244 ?auto_2664245 ?auto_2664246 ?auto_2664248 ?auto_2664247 ?auto_2664249 ?auto_2664250 ?auto_2664251 ?auto_2664252 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2664311 - SURFACE
      ?auto_2664312 - SURFACE
      ?auto_2664313 - SURFACE
      ?auto_2664315 - SURFACE
      ?auto_2664314 - SURFACE
      ?auto_2664316 - SURFACE
      ?auto_2664317 - SURFACE
      ?auto_2664318 - SURFACE
      ?auto_2664319 - SURFACE
    )
    :vars
    (
      ?auto_2664320 - HOIST
      ?auto_2664321 - PLACE
      ?auto_2664322 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2664320 ?auto_2664321 ) ( SURFACE-AT ?auto_2664318 ?auto_2664321 ) ( CLEAR ?auto_2664318 ) ( IS-CRATE ?auto_2664319 ) ( not ( = ?auto_2664318 ?auto_2664319 ) ) ( TRUCK-AT ?auto_2664322 ?auto_2664321 ) ( AVAILABLE ?auto_2664320 ) ( IN ?auto_2664319 ?auto_2664322 ) ( ON ?auto_2664318 ?auto_2664317 ) ( not ( = ?auto_2664317 ?auto_2664318 ) ) ( not ( = ?auto_2664317 ?auto_2664319 ) ) ( ON ?auto_2664312 ?auto_2664311 ) ( ON ?auto_2664313 ?auto_2664312 ) ( ON ?auto_2664315 ?auto_2664313 ) ( ON ?auto_2664314 ?auto_2664315 ) ( ON ?auto_2664316 ?auto_2664314 ) ( ON ?auto_2664317 ?auto_2664316 ) ( not ( = ?auto_2664311 ?auto_2664312 ) ) ( not ( = ?auto_2664311 ?auto_2664313 ) ) ( not ( = ?auto_2664311 ?auto_2664315 ) ) ( not ( = ?auto_2664311 ?auto_2664314 ) ) ( not ( = ?auto_2664311 ?auto_2664316 ) ) ( not ( = ?auto_2664311 ?auto_2664317 ) ) ( not ( = ?auto_2664311 ?auto_2664318 ) ) ( not ( = ?auto_2664311 ?auto_2664319 ) ) ( not ( = ?auto_2664312 ?auto_2664313 ) ) ( not ( = ?auto_2664312 ?auto_2664315 ) ) ( not ( = ?auto_2664312 ?auto_2664314 ) ) ( not ( = ?auto_2664312 ?auto_2664316 ) ) ( not ( = ?auto_2664312 ?auto_2664317 ) ) ( not ( = ?auto_2664312 ?auto_2664318 ) ) ( not ( = ?auto_2664312 ?auto_2664319 ) ) ( not ( = ?auto_2664313 ?auto_2664315 ) ) ( not ( = ?auto_2664313 ?auto_2664314 ) ) ( not ( = ?auto_2664313 ?auto_2664316 ) ) ( not ( = ?auto_2664313 ?auto_2664317 ) ) ( not ( = ?auto_2664313 ?auto_2664318 ) ) ( not ( = ?auto_2664313 ?auto_2664319 ) ) ( not ( = ?auto_2664315 ?auto_2664314 ) ) ( not ( = ?auto_2664315 ?auto_2664316 ) ) ( not ( = ?auto_2664315 ?auto_2664317 ) ) ( not ( = ?auto_2664315 ?auto_2664318 ) ) ( not ( = ?auto_2664315 ?auto_2664319 ) ) ( not ( = ?auto_2664314 ?auto_2664316 ) ) ( not ( = ?auto_2664314 ?auto_2664317 ) ) ( not ( = ?auto_2664314 ?auto_2664318 ) ) ( not ( = ?auto_2664314 ?auto_2664319 ) ) ( not ( = ?auto_2664316 ?auto_2664317 ) ) ( not ( = ?auto_2664316 ?auto_2664318 ) ) ( not ( = ?auto_2664316 ?auto_2664319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2664317 ?auto_2664318 ?auto_2664319 )
      ( MAKE-8CRATE-VERIFY ?auto_2664311 ?auto_2664312 ?auto_2664313 ?auto_2664315 ?auto_2664314 ?auto_2664316 ?auto_2664317 ?auto_2664318 ?auto_2664319 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2664387 - SURFACE
      ?auto_2664388 - SURFACE
      ?auto_2664389 - SURFACE
      ?auto_2664391 - SURFACE
      ?auto_2664390 - SURFACE
      ?auto_2664392 - SURFACE
      ?auto_2664393 - SURFACE
      ?auto_2664394 - SURFACE
      ?auto_2664395 - SURFACE
    )
    :vars
    (
      ?auto_2664396 - HOIST
      ?auto_2664398 - PLACE
      ?auto_2664397 - TRUCK
      ?auto_2664399 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2664396 ?auto_2664398 ) ( SURFACE-AT ?auto_2664394 ?auto_2664398 ) ( CLEAR ?auto_2664394 ) ( IS-CRATE ?auto_2664395 ) ( not ( = ?auto_2664394 ?auto_2664395 ) ) ( AVAILABLE ?auto_2664396 ) ( IN ?auto_2664395 ?auto_2664397 ) ( ON ?auto_2664394 ?auto_2664393 ) ( not ( = ?auto_2664393 ?auto_2664394 ) ) ( not ( = ?auto_2664393 ?auto_2664395 ) ) ( TRUCK-AT ?auto_2664397 ?auto_2664399 ) ( not ( = ?auto_2664399 ?auto_2664398 ) ) ( ON ?auto_2664388 ?auto_2664387 ) ( ON ?auto_2664389 ?auto_2664388 ) ( ON ?auto_2664391 ?auto_2664389 ) ( ON ?auto_2664390 ?auto_2664391 ) ( ON ?auto_2664392 ?auto_2664390 ) ( ON ?auto_2664393 ?auto_2664392 ) ( not ( = ?auto_2664387 ?auto_2664388 ) ) ( not ( = ?auto_2664387 ?auto_2664389 ) ) ( not ( = ?auto_2664387 ?auto_2664391 ) ) ( not ( = ?auto_2664387 ?auto_2664390 ) ) ( not ( = ?auto_2664387 ?auto_2664392 ) ) ( not ( = ?auto_2664387 ?auto_2664393 ) ) ( not ( = ?auto_2664387 ?auto_2664394 ) ) ( not ( = ?auto_2664387 ?auto_2664395 ) ) ( not ( = ?auto_2664388 ?auto_2664389 ) ) ( not ( = ?auto_2664388 ?auto_2664391 ) ) ( not ( = ?auto_2664388 ?auto_2664390 ) ) ( not ( = ?auto_2664388 ?auto_2664392 ) ) ( not ( = ?auto_2664388 ?auto_2664393 ) ) ( not ( = ?auto_2664388 ?auto_2664394 ) ) ( not ( = ?auto_2664388 ?auto_2664395 ) ) ( not ( = ?auto_2664389 ?auto_2664391 ) ) ( not ( = ?auto_2664389 ?auto_2664390 ) ) ( not ( = ?auto_2664389 ?auto_2664392 ) ) ( not ( = ?auto_2664389 ?auto_2664393 ) ) ( not ( = ?auto_2664389 ?auto_2664394 ) ) ( not ( = ?auto_2664389 ?auto_2664395 ) ) ( not ( = ?auto_2664391 ?auto_2664390 ) ) ( not ( = ?auto_2664391 ?auto_2664392 ) ) ( not ( = ?auto_2664391 ?auto_2664393 ) ) ( not ( = ?auto_2664391 ?auto_2664394 ) ) ( not ( = ?auto_2664391 ?auto_2664395 ) ) ( not ( = ?auto_2664390 ?auto_2664392 ) ) ( not ( = ?auto_2664390 ?auto_2664393 ) ) ( not ( = ?auto_2664390 ?auto_2664394 ) ) ( not ( = ?auto_2664390 ?auto_2664395 ) ) ( not ( = ?auto_2664392 ?auto_2664393 ) ) ( not ( = ?auto_2664392 ?auto_2664394 ) ) ( not ( = ?auto_2664392 ?auto_2664395 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2664393 ?auto_2664394 ?auto_2664395 )
      ( MAKE-8CRATE-VERIFY ?auto_2664387 ?auto_2664388 ?auto_2664389 ?auto_2664391 ?auto_2664390 ?auto_2664392 ?auto_2664393 ?auto_2664394 ?auto_2664395 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2664471 - SURFACE
      ?auto_2664472 - SURFACE
      ?auto_2664473 - SURFACE
      ?auto_2664475 - SURFACE
      ?auto_2664474 - SURFACE
      ?auto_2664476 - SURFACE
      ?auto_2664477 - SURFACE
      ?auto_2664478 - SURFACE
      ?auto_2664479 - SURFACE
    )
    :vars
    (
      ?auto_2664484 - HOIST
      ?auto_2664482 - PLACE
      ?auto_2664483 - TRUCK
      ?auto_2664480 - PLACE
      ?auto_2664481 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2664484 ?auto_2664482 ) ( SURFACE-AT ?auto_2664478 ?auto_2664482 ) ( CLEAR ?auto_2664478 ) ( IS-CRATE ?auto_2664479 ) ( not ( = ?auto_2664478 ?auto_2664479 ) ) ( AVAILABLE ?auto_2664484 ) ( ON ?auto_2664478 ?auto_2664477 ) ( not ( = ?auto_2664477 ?auto_2664478 ) ) ( not ( = ?auto_2664477 ?auto_2664479 ) ) ( TRUCK-AT ?auto_2664483 ?auto_2664480 ) ( not ( = ?auto_2664480 ?auto_2664482 ) ) ( HOIST-AT ?auto_2664481 ?auto_2664480 ) ( LIFTING ?auto_2664481 ?auto_2664479 ) ( not ( = ?auto_2664484 ?auto_2664481 ) ) ( ON ?auto_2664472 ?auto_2664471 ) ( ON ?auto_2664473 ?auto_2664472 ) ( ON ?auto_2664475 ?auto_2664473 ) ( ON ?auto_2664474 ?auto_2664475 ) ( ON ?auto_2664476 ?auto_2664474 ) ( ON ?auto_2664477 ?auto_2664476 ) ( not ( = ?auto_2664471 ?auto_2664472 ) ) ( not ( = ?auto_2664471 ?auto_2664473 ) ) ( not ( = ?auto_2664471 ?auto_2664475 ) ) ( not ( = ?auto_2664471 ?auto_2664474 ) ) ( not ( = ?auto_2664471 ?auto_2664476 ) ) ( not ( = ?auto_2664471 ?auto_2664477 ) ) ( not ( = ?auto_2664471 ?auto_2664478 ) ) ( not ( = ?auto_2664471 ?auto_2664479 ) ) ( not ( = ?auto_2664472 ?auto_2664473 ) ) ( not ( = ?auto_2664472 ?auto_2664475 ) ) ( not ( = ?auto_2664472 ?auto_2664474 ) ) ( not ( = ?auto_2664472 ?auto_2664476 ) ) ( not ( = ?auto_2664472 ?auto_2664477 ) ) ( not ( = ?auto_2664472 ?auto_2664478 ) ) ( not ( = ?auto_2664472 ?auto_2664479 ) ) ( not ( = ?auto_2664473 ?auto_2664475 ) ) ( not ( = ?auto_2664473 ?auto_2664474 ) ) ( not ( = ?auto_2664473 ?auto_2664476 ) ) ( not ( = ?auto_2664473 ?auto_2664477 ) ) ( not ( = ?auto_2664473 ?auto_2664478 ) ) ( not ( = ?auto_2664473 ?auto_2664479 ) ) ( not ( = ?auto_2664475 ?auto_2664474 ) ) ( not ( = ?auto_2664475 ?auto_2664476 ) ) ( not ( = ?auto_2664475 ?auto_2664477 ) ) ( not ( = ?auto_2664475 ?auto_2664478 ) ) ( not ( = ?auto_2664475 ?auto_2664479 ) ) ( not ( = ?auto_2664474 ?auto_2664476 ) ) ( not ( = ?auto_2664474 ?auto_2664477 ) ) ( not ( = ?auto_2664474 ?auto_2664478 ) ) ( not ( = ?auto_2664474 ?auto_2664479 ) ) ( not ( = ?auto_2664476 ?auto_2664477 ) ) ( not ( = ?auto_2664476 ?auto_2664478 ) ) ( not ( = ?auto_2664476 ?auto_2664479 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2664477 ?auto_2664478 ?auto_2664479 )
      ( MAKE-8CRATE-VERIFY ?auto_2664471 ?auto_2664472 ?auto_2664473 ?auto_2664475 ?auto_2664474 ?auto_2664476 ?auto_2664477 ?auto_2664478 ?auto_2664479 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2664563 - SURFACE
      ?auto_2664564 - SURFACE
      ?auto_2664565 - SURFACE
      ?auto_2664567 - SURFACE
      ?auto_2664566 - SURFACE
      ?auto_2664568 - SURFACE
      ?auto_2664569 - SURFACE
      ?auto_2664570 - SURFACE
      ?auto_2664571 - SURFACE
    )
    :vars
    (
      ?auto_2664575 - HOIST
      ?auto_2664573 - PLACE
      ?auto_2664572 - TRUCK
      ?auto_2664576 - PLACE
      ?auto_2664577 - HOIST
      ?auto_2664574 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2664575 ?auto_2664573 ) ( SURFACE-AT ?auto_2664570 ?auto_2664573 ) ( CLEAR ?auto_2664570 ) ( IS-CRATE ?auto_2664571 ) ( not ( = ?auto_2664570 ?auto_2664571 ) ) ( AVAILABLE ?auto_2664575 ) ( ON ?auto_2664570 ?auto_2664569 ) ( not ( = ?auto_2664569 ?auto_2664570 ) ) ( not ( = ?auto_2664569 ?auto_2664571 ) ) ( TRUCK-AT ?auto_2664572 ?auto_2664576 ) ( not ( = ?auto_2664576 ?auto_2664573 ) ) ( HOIST-AT ?auto_2664577 ?auto_2664576 ) ( not ( = ?auto_2664575 ?auto_2664577 ) ) ( AVAILABLE ?auto_2664577 ) ( SURFACE-AT ?auto_2664571 ?auto_2664576 ) ( ON ?auto_2664571 ?auto_2664574 ) ( CLEAR ?auto_2664571 ) ( not ( = ?auto_2664570 ?auto_2664574 ) ) ( not ( = ?auto_2664571 ?auto_2664574 ) ) ( not ( = ?auto_2664569 ?auto_2664574 ) ) ( ON ?auto_2664564 ?auto_2664563 ) ( ON ?auto_2664565 ?auto_2664564 ) ( ON ?auto_2664567 ?auto_2664565 ) ( ON ?auto_2664566 ?auto_2664567 ) ( ON ?auto_2664568 ?auto_2664566 ) ( ON ?auto_2664569 ?auto_2664568 ) ( not ( = ?auto_2664563 ?auto_2664564 ) ) ( not ( = ?auto_2664563 ?auto_2664565 ) ) ( not ( = ?auto_2664563 ?auto_2664567 ) ) ( not ( = ?auto_2664563 ?auto_2664566 ) ) ( not ( = ?auto_2664563 ?auto_2664568 ) ) ( not ( = ?auto_2664563 ?auto_2664569 ) ) ( not ( = ?auto_2664563 ?auto_2664570 ) ) ( not ( = ?auto_2664563 ?auto_2664571 ) ) ( not ( = ?auto_2664563 ?auto_2664574 ) ) ( not ( = ?auto_2664564 ?auto_2664565 ) ) ( not ( = ?auto_2664564 ?auto_2664567 ) ) ( not ( = ?auto_2664564 ?auto_2664566 ) ) ( not ( = ?auto_2664564 ?auto_2664568 ) ) ( not ( = ?auto_2664564 ?auto_2664569 ) ) ( not ( = ?auto_2664564 ?auto_2664570 ) ) ( not ( = ?auto_2664564 ?auto_2664571 ) ) ( not ( = ?auto_2664564 ?auto_2664574 ) ) ( not ( = ?auto_2664565 ?auto_2664567 ) ) ( not ( = ?auto_2664565 ?auto_2664566 ) ) ( not ( = ?auto_2664565 ?auto_2664568 ) ) ( not ( = ?auto_2664565 ?auto_2664569 ) ) ( not ( = ?auto_2664565 ?auto_2664570 ) ) ( not ( = ?auto_2664565 ?auto_2664571 ) ) ( not ( = ?auto_2664565 ?auto_2664574 ) ) ( not ( = ?auto_2664567 ?auto_2664566 ) ) ( not ( = ?auto_2664567 ?auto_2664568 ) ) ( not ( = ?auto_2664567 ?auto_2664569 ) ) ( not ( = ?auto_2664567 ?auto_2664570 ) ) ( not ( = ?auto_2664567 ?auto_2664571 ) ) ( not ( = ?auto_2664567 ?auto_2664574 ) ) ( not ( = ?auto_2664566 ?auto_2664568 ) ) ( not ( = ?auto_2664566 ?auto_2664569 ) ) ( not ( = ?auto_2664566 ?auto_2664570 ) ) ( not ( = ?auto_2664566 ?auto_2664571 ) ) ( not ( = ?auto_2664566 ?auto_2664574 ) ) ( not ( = ?auto_2664568 ?auto_2664569 ) ) ( not ( = ?auto_2664568 ?auto_2664570 ) ) ( not ( = ?auto_2664568 ?auto_2664571 ) ) ( not ( = ?auto_2664568 ?auto_2664574 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2664569 ?auto_2664570 ?auto_2664571 )
      ( MAKE-8CRATE-VERIFY ?auto_2664563 ?auto_2664564 ?auto_2664565 ?auto_2664567 ?auto_2664566 ?auto_2664568 ?auto_2664569 ?auto_2664570 ?auto_2664571 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2664656 - SURFACE
      ?auto_2664657 - SURFACE
      ?auto_2664658 - SURFACE
      ?auto_2664660 - SURFACE
      ?auto_2664659 - SURFACE
      ?auto_2664661 - SURFACE
      ?auto_2664662 - SURFACE
      ?auto_2664663 - SURFACE
      ?auto_2664664 - SURFACE
    )
    :vars
    (
      ?auto_2664666 - HOIST
      ?auto_2664670 - PLACE
      ?auto_2664667 - PLACE
      ?auto_2664665 - HOIST
      ?auto_2664669 - SURFACE
      ?auto_2664668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2664666 ?auto_2664670 ) ( SURFACE-AT ?auto_2664663 ?auto_2664670 ) ( CLEAR ?auto_2664663 ) ( IS-CRATE ?auto_2664664 ) ( not ( = ?auto_2664663 ?auto_2664664 ) ) ( AVAILABLE ?auto_2664666 ) ( ON ?auto_2664663 ?auto_2664662 ) ( not ( = ?auto_2664662 ?auto_2664663 ) ) ( not ( = ?auto_2664662 ?auto_2664664 ) ) ( not ( = ?auto_2664667 ?auto_2664670 ) ) ( HOIST-AT ?auto_2664665 ?auto_2664667 ) ( not ( = ?auto_2664666 ?auto_2664665 ) ) ( AVAILABLE ?auto_2664665 ) ( SURFACE-AT ?auto_2664664 ?auto_2664667 ) ( ON ?auto_2664664 ?auto_2664669 ) ( CLEAR ?auto_2664664 ) ( not ( = ?auto_2664663 ?auto_2664669 ) ) ( not ( = ?auto_2664664 ?auto_2664669 ) ) ( not ( = ?auto_2664662 ?auto_2664669 ) ) ( TRUCK-AT ?auto_2664668 ?auto_2664670 ) ( ON ?auto_2664657 ?auto_2664656 ) ( ON ?auto_2664658 ?auto_2664657 ) ( ON ?auto_2664660 ?auto_2664658 ) ( ON ?auto_2664659 ?auto_2664660 ) ( ON ?auto_2664661 ?auto_2664659 ) ( ON ?auto_2664662 ?auto_2664661 ) ( not ( = ?auto_2664656 ?auto_2664657 ) ) ( not ( = ?auto_2664656 ?auto_2664658 ) ) ( not ( = ?auto_2664656 ?auto_2664660 ) ) ( not ( = ?auto_2664656 ?auto_2664659 ) ) ( not ( = ?auto_2664656 ?auto_2664661 ) ) ( not ( = ?auto_2664656 ?auto_2664662 ) ) ( not ( = ?auto_2664656 ?auto_2664663 ) ) ( not ( = ?auto_2664656 ?auto_2664664 ) ) ( not ( = ?auto_2664656 ?auto_2664669 ) ) ( not ( = ?auto_2664657 ?auto_2664658 ) ) ( not ( = ?auto_2664657 ?auto_2664660 ) ) ( not ( = ?auto_2664657 ?auto_2664659 ) ) ( not ( = ?auto_2664657 ?auto_2664661 ) ) ( not ( = ?auto_2664657 ?auto_2664662 ) ) ( not ( = ?auto_2664657 ?auto_2664663 ) ) ( not ( = ?auto_2664657 ?auto_2664664 ) ) ( not ( = ?auto_2664657 ?auto_2664669 ) ) ( not ( = ?auto_2664658 ?auto_2664660 ) ) ( not ( = ?auto_2664658 ?auto_2664659 ) ) ( not ( = ?auto_2664658 ?auto_2664661 ) ) ( not ( = ?auto_2664658 ?auto_2664662 ) ) ( not ( = ?auto_2664658 ?auto_2664663 ) ) ( not ( = ?auto_2664658 ?auto_2664664 ) ) ( not ( = ?auto_2664658 ?auto_2664669 ) ) ( not ( = ?auto_2664660 ?auto_2664659 ) ) ( not ( = ?auto_2664660 ?auto_2664661 ) ) ( not ( = ?auto_2664660 ?auto_2664662 ) ) ( not ( = ?auto_2664660 ?auto_2664663 ) ) ( not ( = ?auto_2664660 ?auto_2664664 ) ) ( not ( = ?auto_2664660 ?auto_2664669 ) ) ( not ( = ?auto_2664659 ?auto_2664661 ) ) ( not ( = ?auto_2664659 ?auto_2664662 ) ) ( not ( = ?auto_2664659 ?auto_2664663 ) ) ( not ( = ?auto_2664659 ?auto_2664664 ) ) ( not ( = ?auto_2664659 ?auto_2664669 ) ) ( not ( = ?auto_2664661 ?auto_2664662 ) ) ( not ( = ?auto_2664661 ?auto_2664663 ) ) ( not ( = ?auto_2664661 ?auto_2664664 ) ) ( not ( = ?auto_2664661 ?auto_2664669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2664662 ?auto_2664663 ?auto_2664664 )
      ( MAKE-8CRATE-VERIFY ?auto_2664656 ?auto_2664657 ?auto_2664658 ?auto_2664660 ?auto_2664659 ?auto_2664661 ?auto_2664662 ?auto_2664663 ?auto_2664664 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2664749 - SURFACE
      ?auto_2664750 - SURFACE
      ?auto_2664751 - SURFACE
      ?auto_2664753 - SURFACE
      ?auto_2664752 - SURFACE
      ?auto_2664754 - SURFACE
      ?auto_2664755 - SURFACE
      ?auto_2664756 - SURFACE
      ?auto_2664757 - SURFACE
    )
    :vars
    (
      ?auto_2664762 - HOIST
      ?auto_2664759 - PLACE
      ?auto_2664760 - PLACE
      ?auto_2664761 - HOIST
      ?auto_2664758 - SURFACE
      ?auto_2664763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2664762 ?auto_2664759 ) ( IS-CRATE ?auto_2664757 ) ( not ( = ?auto_2664756 ?auto_2664757 ) ) ( not ( = ?auto_2664755 ?auto_2664756 ) ) ( not ( = ?auto_2664755 ?auto_2664757 ) ) ( not ( = ?auto_2664760 ?auto_2664759 ) ) ( HOIST-AT ?auto_2664761 ?auto_2664760 ) ( not ( = ?auto_2664762 ?auto_2664761 ) ) ( AVAILABLE ?auto_2664761 ) ( SURFACE-AT ?auto_2664757 ?auto_2664760 ) ( ON ?auto_2664757 ?auto_2664758 ) ( CLEAR ?auto_2664757 ) ( not ( = ?auto_2664756 ?auto_2664758 ) ) ( not ( = ?auto_2664757 ?auto_2664758 ) ) ( not ( = ?auto_2664755 ?auto_2664758 ) ) ( TRUCK-AT ?auto_2664763 ?auto_2664759 ) ( SURFACE-AT ?auto_2664755 ?auto_2664759 ) ( CLEAR ?auto_2664755 ) ( LIFTING ?auto_2664762 ?auto_2664756 ) ( IS-CRATE ?auto_2664756 ) ( ON ?auto_2664750 ?auto_2664749 ) ( ON ?auto_2664751 ?auto_2664750 ) ( ON ?auto_2664753 ?auto_2664751 ) ( ON ?auto_2664752 ?auto_2664753 ) ( ON ?auto_2664754 ?auto_2664752 ) ( ON ?auto_2664755 ?auto_2664754 ) ( not ( = ?auto_2664749 ?auto_2664750 ) ) ( not ( = ?auto_2664749 ?auto_2664751 ) ) ( not ( = ?auto_2664749 ?auto_2664753 ) ) ( not ( = ?auto_2664749 ?auto_2664752 ) ) ( not ( = ?auto_2664749 ?auto_2664754 ) ) ( not ( = ?auto_2664749 ?auto_2664755 ) ) ( not ( = ?auto_2664749 ?auto_2664756 ) ) ( not ( = ?auto_2664749 ?auto_2664757 ) ) ( not ( = ?auto_2664749 ?auto_2664758 ) ) ( not ( = ?auto_2664750 ?auto_2664751 ) ) ( not ( = ?auto_2664750 ?auto_2664753 ) ) ( not ( = ?auto_2664750 ?auto_2664752 ) ) ( not ( = ?auto_2664750 ?auto_2664754 ) ) ( not ( = ?auto_2664750 ?auto_2664755 ) ) ( not ( = ?auto_2664750 ?auto_2664756 ) ) ( not ( = ?auto_2664750 ?auto_2664757 ) ) ( not ( = ?auto_2664750 ?auto_2664758 ) ) ( not ( = ?auto_2664751 ?auto_2664753 ) ) ( not ( = ?auto_2664751 ?auto_2664752 ) ) ( not ( = ?auto_2664751 ?auto_2664754 ) ) ( not ( = ?auto_2664751 ?auto_2664755 ) ) ( not ( = ?auto_2664751 ?auto_2664756 ) ) ( not ( = ?auto_2664751 ?auto_2664757 ) ) ( not ( = ?auto_2664751 ?auto_2664758 ) ) ( not ( = ?auto_2664753 ?auto_2664752 ) ) ( not ( = ?auto_2664753 ?auto_2664754 ) ) ( not ( = ?auto_2664753 ?auto_2664755 ) ) ( not ( = ?auto_2664753 ?auto_2664756 ) ) ( not ( = ?auto_2664753 ?auto_2664757 ) ) ( not ( = ?auto_2664753 ?auto_2664758 ) ) ( not ( = ?auto_2664752 ?auto_2664754 ) ) ( not ( = ?auto_2664752 ?auto_2664755 ) ) ( not ( = ?auto_2664752 ?auto_2664756 ) ) ( not ( = ?auto_2664752 ?auto_2664757 ) ) ( not ( = ?auto_2664752 ?auto_2664758 ) ) ( not ( = ?auto_2664754 ?auto_2664755 ) ) ( not ( = ?auto_2664754 ?auto_2664756 ) ) ( not ( = ?auto_2664754 ?auto_2664757 ) ) ( not ( = ?auto_2664754 ?auto_2664758 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2664755 ?auto_2664756 ?auto_2664757 )
      ( MAKE-8CRATE-VERIFY ?auto_2664749 ?auto_2664750 ?auto_2664751 ?auto_2664753 ?auto_2664752 ?auto_2664754 ?auto_2664755 ?auto_2664756 ?auto_2664757 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2664842 - SURFACE
      ?auto_2664843 - SURFACE
      ?auto_2664844 - SURFACE
      ?auto_2664846 - SURFACE
      ?auto_2664845 - SURFACE
      ?auto_2664847 - SURFACE
      ?auto_2664848 - SURFACE
      ?auto_2664849 - SURFACE
      ?auto_2664850 - SURFACE
    )
    :vars
    (
      ?auto_2664856 - HOIST
      ?auto_2664852 - PLACE
      ?auto_2664851 - PLACE
      ?auto_2664854 - HOIST
      ?auto_2664853 - SURFACE
      ?auto_2664855 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2664856 ?auto_2664852 ) ( IS-CRATE ?auto_2664850 ) ( not ( = ?auto_2664849 ?auto_2664850 ) ) ( not ( = ?auto_2664848 ?auto_2664849 ) ) ( not ( = ?auto_2664848 ?auto_2664850 ) ) ( not ( = ?auto_2664851 ?auto_2664852 ) ) ( HOIST-AT ?auto_2664854 ?auto_2664851 ) ( not ( = ?auto_2664856 ?auto_2664854 ) ) ( AVAILABLE ?auto_2664854 ) ( SURFACE-AT ?auto_2664850 ?auto_2664851 ) ( ON ?auto_2664850 ?auto_2664853 ) ( CLEAR ?auto_2664850 ) ( not ( = ?auto_2664849 ?auto_2664853 ) ) ( not ( = ?auto_2664850 ?auto_2664853 ) ) ( not ( = ?auto_2664848 ?auto_2664853 ) ) ( TRUCK-AT ?auto_2664855 ?auto_2664852 ) ( SURFACE-AT ?auto_2664848 ?auto_2664852 ) ( CLEAR ?auto_2664848 ) ( IS-CRATE ?auto_2664849 ) ( AVAILABLE ?auto_2664856 ) ( IN ?auto_2664849 ?auto_2664855 ) ( ON ?auto_2664843 ?auto_2664842 ) ( ON ?auto_2664844 ?auto_2664843 ) ( ON ?auto_2664846 ?auto_2664844 ) ( ON ?auto_2664845 ?auto_2664846 ) ( ON ?auto_2664847 ?auto_2664845 ) ( ON ?auto_2664848 ?auto_2664847 ) ( not ( = ?auto_2664842 ?auto_2664843 ) ) ( not ( = ?auto_2664842 ?auto_2664844 ) ) ( not ( = ?auto_2664842 ?auto_2664846 ) ) ( not ( = ?auto_2664842 ?auto_2664845 ) ) ( not ( = ?auto_2664842 ?auto_2664847 ) ) ( not ( = ?auto_2664842 ?auto_2664848 ) ) ( not ( = ?auto_2664842 ?auto_2664849 ) ) ( not ( = ?auto_2664842 ?auto_2664850 ) ) ( not ( = ?auto_2664842 ?auto_2664853 ) ) ( not ( = ?auto_2664843 ?auto_2664844 ) ) ( not ( = ?auto_2664843 ?auto_2664846 ) ) ( not ( = ?auto_2664843 ?auto_2664845 ) ) ( not ( = ?auto_2664843 ?auto_2664847 ) ) ( not ( = ?auto_2664843 ?auto_2664848 ) ) ( not ( = ?auto_2664843 ?auto_2664849 ) ) ( not ( = ?auto_2664843 ?auto_2664850 ) ) ( not ( = ?auto_2664843 ?auto_2664853 ) ) ( not ( = ?auto_2664844 ?auto_2664846 ) ) ( not ( = ?auto_2664844 ?auto_2664845 ) ) ( not ( = ?auto_2664844 ?auto_2664847 ) ) ( not ( = ?auto_2664844 ?auto_2664848 ) ) ( not ( = ?auto_2664844 ?auto_2664849 ) ) ( not ( = ?auto_2664844 ?auto_2664850 ) ) ( not ( = ?auto_2664844 ?auto_2664853 ) ) ( not ( = ?auto_2664846 ?auto_2664845 ) ) ( not ( = ?auto_2664846 ?auto_2664847 ) ) ( not ( = ?auto_2664846 ?auto_2664848 ) ) ( not ( = ?auto_2664846 ?auto_2664849 ) ) ( not ( = ?auto_2664846 ?auto_2664850 ) ) ( not ( = ?auto_2664846 ?auto_2664853 ) ) ( not ( = ?auto_2664845 ?auto_2664847 ) ) ( not ( = ?auto_2664845 ?auto_2664848 ) ) ( not ( = ?auto_2664845 ?auto_2664849 ) ) ( not ( = ?auto_2664845 ?auto_2664850 ) ) ( not ( = ?auto_2664845 ?auto_2664853 ) ) ( not ( = ?auto_2664847 ?auto_2664848 ) ) ( not ( = ?auto_2664847 ?auto_2664849 ) ) ( not ( = ?auto_2664847 ?auto_2664850 ) ) ( not ( = ?auto_2664847 ?auto_2664853 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2664848 ?auto_2664849 ?auto_2664850 )
      ( MAKE-8CRATE-VERIFY ?auto_2664842 ?auto_2664843 ?auto_2664844 ?auto_2664846 ?auto_2664845 ?auto_2664847 ?auto_2664848 ?auto_2664849 ?auto_2664850 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2668958 - SURFACE
      ?auto_2668959 - SURFACE
      ?auto_2668960 - SURFACE
      ?auto_2668962 - SURFACE
      ?auto_2668961 - SURFACE
      ?auto_2668963 - SURFACE
      ?auto_2668964 - SURFACE
      ?auto_2668965 - SURFACE
      ?auto_2668966 - SURFACE
      ?auto_2668967 - SURFACE
    )
    :vars
    (
      ?auto_2668969 - HOIST
      ?auto_2668968 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2668969 ?auto_2668968 ) ( SURFACE-AT ?auto_2668966 ?auto_2668968 ) ( CLEAR ?auto_2668966 ) ( LIFTING ?auto_2668969 ?auto_2668967 ) ( IS-CRATE ?auto_2668967 ) ( not ( = ?auto_2668966 ?auto_2668967 ) ) ( ON ?auto_2668959 ?auto_2668958 ) ( ON ?auto_2668960 ?auto_2668959 ) ( ON ?auto_2668962 ?auto_2668960 ) ( ON ?auto_2668961 ?auto_2668962 ) ( ON ?auto_2668963 ?auto_2668961 ) ( ON ?auto_2668964 ?auto_2668963 ) ( ON ?auto_2668965 ?auto_2668964 ) ( ON ?auto_2668966 ?auto_2668965 ) ( not ( = ?auto_2668958 ?auto_2668959 ) ) ( not ( = ?auto_2668958 ?auto_2668960 ) ) ( not ( = ?auto_2668958 ?auto_2668962 ) ) ( not ( = ?auto_2668958 ?auto_2668961 ) ) ( not ( = ?auto_2668958 ?auto_2668963 ) ) ( not ( = ?auto_2668958 ?auto_2668964 ) ) ( not ( = ?auto_2668958 ?auto_2668965 ) ) ( not ( = ?auto_2668958 ?auto_2668966 ) ) ( not ( = ?auto_2668958 ?auto_2668967 ) ) ( not ( = ?auto_2668959 ?auto_2668960 ) ) ( not ( = ?auto_2668959 ?auto_2668962 ) ) ( not ( = ?auto_2668959 ?auto_2668961 ) ) ( not ( = ?auto_2668959 ?auto_2668963 ) ) ( not ( = ?auto_2668959 ?auto_2668964 ) ) ( not ( = ?auto_2668959 ?auto_2668965 ) ) ( not ( = ?auto_2668959 ?auto_2668966 ) ) ( not ( = ?auto_2668959 ?auto_2668967 ) ) ( not ( = ?auto_2668960 ?auto_2668962 ) ) ( not ( = ?auto_2668960 ?auto_2668961 ) ) ( not ( = ?auto_2668960 ?auto_2668963 ) ) ( not ( = ?auto_2668960 ?auto_2668964 ) ) ( not ( = ?auto_2668960 ?auto_2668965 ) ) ( not ( = ?auto_2668960 ?auto_2668966 ) ) ( not ( = ?auto_2668960 ?auto_2668967 ) ) ( not ( = ?auto_2668962 ?auto_2668961 ) ) ( not ( = ?auto_2668962 ?auto_2668963 ) ) ( not ( = ?auto_2668962 ?auto_2668964 ) ) ( not ( = ?auto_2668962 ?auto_2668965 ) ) ( not ( = ?auto_2668962 ?auto_2668966 ) ) ( not ( = ?auto_2668962 ?auto_2668967 ) ) ( not ( = ?auto_2668961 ?auto_2668963 ) ) ( not ( = ?auto_2668961 ?auto_2668964 ) ) ( not ( = ?auto_2668961 ?auto_2668965 ) ) ( not ( = ?auto_2668961 ?auto_2668966 ) ) ( not ( = ?auto_2668961 ?auto_2668967 ) ) ( not ( = ?auto_2668963 ?auto_2668964 ) ) ( not ( = ?auto_2668963 ?auto_2668965 ) ) ( not ( = ?auto_2668963 ?auto_2668966 ) ) ( not ( = ?auto_2668963 ?auto_2668967 ) ) ( not ( = ?auto_2668964 ?auto_2668965 ) ) ( not ( = ?auto_2668964 ?auto_2668966 ) ) ( not ( = ?auto_2668964 ?auto_2668967 ) ) ( not ( = ?auto_2668965 ?auto_2668966 ) ) ( not ( = ?auto_2668965 ?auto_2668967 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2668966 ?auto_2668967 )
      ( MAKE-9CRATE-VERIFY ?auto_2668958 ?auto_2668959 ?auto_2668960 ?auto_2668962 ?auto_2668961 ?auto_2668963 ?auto_2668964 ?auto_2668965 ?auto_2668966 ?auto_2668967 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2669038 - SURFACE
      ?auto_2669039 - SURFACE
      ?auto_2669040 - SURFACE
      ?auto_2669042 - SURFACE
      ?auto_2669041 - SURFACE
      ?auto_2669043 - SURFACE
      ?auto_2669044 - SURFACE
      ?auto_2669045 - SURFACE
      ?auto_2669046 - SURFACE
      ?auto_2669047 - SURFACE
    )
    :vars
    (
      ?auto_2669050 - HOIST
      ?auto_2669049 - PLACE
      ?auto_2669048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2669050 ?auto_2669049 ) ( SURFACE-AT ?auto_2669046 ?auto_2669049 ) ( CLEAR ?auto_2669046 ) ( IS-CRATE ?auto_2669047 ) ( not ( = ?auto_2669046 ?auto_2669047 ) ) ( TRUCK-AT ?auto_2669048 ?auto_2669049 ) ( AVAILABLE ?auto_2669050 ) ( IN ?auto_2669047 ?auto_2669048 ) ( ON ?auto_2669046 ?auto_2669045 ) ( not ( = ?auto_2669045 ?auto_2669046 ) ) ( not ( = ?auto_2669045 ?auto_2669047 ) ) ( ON ?auto_2669039 ?auto_2669038 ) ( ON ?auto_2669040 ?auto_2669039 ) ( ON ?auto_2669042 ?auto_2669040 ) ( ON ?auto_2669041 ?auto_2669042 ) ( ON ?auto_2669043 ?auto_2669041 ) ( ON ?auto_2669044 ?auto_2669043 ) ( ON ?auto_2669045 ?auto_2669044 ) ( not ( = ?auto_2669038 ?auto_2669039 ) ) ( not ( = ?auto_2669038 ?auto_2669040 ) ) ( not ( = ?auto_2669038 ?auto_2669042 ) ) ( not ( = ?auto_2669038 ?auto_2669041 ) ) ( not ( = ?auto_2669038 ?auto_2669043 ) ) ( not ( = ?auto_2669038 ?auto_2669044 ) ) ( not ( = ?auto_2669038 ?auto_2669045 ) ) ( not ( = ?auto_2669038 ?auto_2669046 ) ) ( not ( = ?auto_2669038 ?auto_2669047 ) ) ( not ( = ?auto_2669039 ?auto_2669040 ) ) ( not ( = ?auto_2669039 ?auto_2669042 ) ) ( not ( = ?auto_2669039 ?auto_2669041 ) ) ( not ( = ?auto_2669039 ?auto_2669043 ) ) ( not ( = ?auto_2669039 ?auto_2669044 ) ) ( not ( = ?auto_2669039 ?auto_2669045 ) ) ( not ( = ?auto_2669039 ?auto_2669046 ) ) ( not ( = ?auto_2669039 ?auto_2669047 ) ) ( not ( = ?auto_2669040 ?auto_2669042 ) ) ( not ( = ?auto_2669040 ?auto_2669041 ) ) ( not ( = ?auto_2669040 ?auto_2669043 ) ) ( not ( = ?auto_2669040 ?auto_2669044 ) ) ( not ( = ?auto_2669040 ?auto_2669045 ) ) ( not ( = ?auto_2669040 ?auto_2669046 ) ) ( not ( = ?auto_2669040 ?auto_2669047 ) ) ( not ( = ?auto_2669042 ?auto_2669041 ) ) ( not ( = ?auto_2669042 ?auto_2669043 ) ) ( not ( = ?auto_2669042 ?auto_2669044 ) ) ( not ( = ?auto_2669042 ?auto_2669045 ) ) ( not ( = ?auto_2669042 ?auto_2669046 ) ) ( not ( = ?auto_2669042 ?auto_2669047 ) ) ( not ( = ?auto_2669041 ?auto_2669043 ) ) ( not ( = ?auto_2669041 ?auto_2669044 ) ) ( not ( = ?auto_2669041 ?auto_2669045 ) ) ( not ( = ?auto_2669041 ?auto_2669046 ) ) ( not ( = ?auto_2669041 ?auto_2669047 ) ) ( not ( = ?auto_2669043 ?auto_2669044 ) ) ( not ( = ?auto_2669043 ?auto_2669045 ) ) ( not ( = ?auto_2669043 ?auto_2669046 ) ) ( not ( = ?auto_2669043 ?auto_2669047 ) ) ( not ( = ?auto_2669044 ?auto_2669045 ) ) ( not ( = ?auto_2669044 ?auto_2669046 ) ) ( not ( = ?auto_2669044 ?auto_2669047 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2669045 ?auto_2669046 ?auto_2669047 )
      ( MAKE-9CRATE-VERIFY ?auto_2669038 ?auto_2669039 ?auto_2669040 ?auto_2669042 ?auto_2669041 ?auto_2669043 ?auto_2669044 ?auto_2669045 ?auto_2669046 ?auto_2669047 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2669128 - SURFACE
      ?auto_2669129 - SURFACE
      ?auto_2669130 - SURFACE
      ?auto_2669132 - SURFACE
      ?auto_2669131 - SURFACE
      ?auto_2669133 - SURFACE
      ?auto_2669134 - SURFACE
      ?auto_2669135 - SURFACE
      ?auto_2669136 - SURFACE
      ?auto_2669137 - SURFACE
    )
    :vars
    (
      ?auto_2669138 - HOIST
      ?auto_2669141 - PLACE
      ?auto_2669139 - TRUCK
      ?auto_2669140 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2669138 ?auto_2669141 ) ( SURFACE-AT ?auto_2669136 ?auto_2669141 ) ( CLEAR ?auto_2669136 ) ( IS-CRATE ?auto_2669137 ) ( not ( = ?auto_2669136 ?auto_2669137 ) ) ( AVAILABLE ?auto_2669138 ) ( IN ?auto_2669137 ?auto_2669139 ) ( ON ?auto_2669136 ?auto_2669135 ) ( not ( = ?auto_2669135 ?auto_2669136 ) ) ( not ( = ?auto_2669135 ?auto_2669137 ) ) ( TRUCK-AT ?auto_2669139 ?auto_2669140 ) ( not ( = ?auto_2669140 ?auto_2669141 ) ) ( ON ?auto_2669129 ?auto_2669128 ) ( ON ?auto_2669130 ?auto_2669129 ) ( ON ?auto_2669132 ?auto_2669130 ) ( ON ?auto_2669131 ?auto_2669132 ) ( ON ?auto_2669133 ?auto_2669131 ) ( ON ?auto_2669134 ?auto_2669133 ) ( ON ?auto_2669135 ?auto_2669134 ) ( not ( = ?auto_2669128 ?auto_2669129 ) ) ( not ( = ?auto_2669128 ?auto_2669130 ) ) ( not ( = ?auto_2669128 ?auto_2669132 ) ) ( not ( = ?auto_2669128 ?auto_2669131 ) ) ( not ( = ?auto_2669128 ?auto_2669133 ) ) ( not ( = ?auto_2669128 ?auto_2669134 ) ) ( not ( = ?auto_2669128 ?auto_2669135 ) ) ( not ( = ?auto_2669128 ?auto_2669136 ) ) ( not ( = ?auto_2669128 ?auto_2669137 ) ) ( not ( = ?auto_2669129 ?auto_2669130 ) ) ( not ( = ?auto_2669129 ?auto_2669132 ) ) ( not ( = ?auto_2669129 ?auto_2669131 ) ) ( not ( = ?auto_2669129 ?auto_2669133 ) ) ( not ( = ?auto_2669129 ?auto_2669134 ) ) ( not ( = ?auto_2669129 ?auto_2669135 ) ) ( not ( = ?auto_2669129 ?auto_2669136 ) ) ( not ( = ?auto_2669129 ?auto_2669137 ) ) ( not ( = ?auto_2669130 ?auto_2669132 ) ) ( not ( = ?auto_2669130 ?auto_2669131 ) ) ( not ( = ?auto_2669130 ?auto_2669133 ) ) ( not ( = ?auto_2669130 ?auto_2669134 ) ) ( not ( = ?auto_2669130 ?auto_2669135 ) ) ( not ( = ?auto_2669130 ?auto_2669136 ) ) ( not ( = ?auto_2669130 ?auto_2669137 ) ) ( not ( = ?auto_2669132 ?auto_2669131 ) ) ( not ( = ?auto_2669132 ?auto_2669133 ) ) ( not ( = ?auto_2669132 ?auto_2669134 ) ) ( not ( = ?auto_2669132 ?auto_2669135 ) ) ( not ( = ?auto_2669132 ?auto_2669136 ) ) ( not ( = ?auto_2669132 ?auto_2669137 ) ) ( not ( = ?auto_2669131 ?auto_2669133 ) ) ( not ( = ?auto_2669131 ?auto_2669134 ) ) ( not ( = ?auto_2669131 ?auto_2669135 ) ) ( not ( = ?auto_2669131 ?auto_2669136 ) ) ( not ( = ?auto_2669131 ?auto_2669137 ) ) ( not ( = ?auto_2669133 ?auto_2669134 ) ) ( not ( = ?auto_2669133 ?auto_2669135 ) ) ( not ( = ?auto_2669133 ?auto_2669136 ) ) ( not ( = ?auto_2669133 ?auto_2669137 ) ) ( not ( = ?auto_2669134 ?auto_2669135 ) ) ( not ( = ?auto_2669134 ?auto_2669136 ) ) ( not ( = ?auto_2669134 ?auto_2669137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2669135 ?auto_2669136 ?auto_2669137 )
      ( MAKE-9CRATE-VERIFY ?auto_2669128 ?auto_2669129 ?auto_2669130 ?auto_2669132 ?auto_2669131 ?auto_2669133 ?auto_2669134 ?auto_2669135 ?auto_2669136 ?auto_2669137 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2669227 - SURFACE
      ?auto_2669228 - SURFACE
      ?auto_2669229 - SURFACE
      ?auto_2669231 - SURFACE
      ?auto_2669230 - SURFACE
      ?auto_2669232 - SURFACE
      ?auto_2669233 - SURFACE
      ?auto_2669234 - SURFACE
      ?auto_2669235 - SURFACE
      ?auto_2669236 - SURFACE
    )
    :vars
    (
      ?auto_2669240 - HOIST
      ?auto_2669237 - PLACE
      ?auto_2669239 - TRUCK
      ?auto_2669241 - PLACE
      ?auto_2669238 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2669240 ?auto_2669237 ) ( SURFACE-AT ?auto_2669235 ?auto_2669237 ) ( CLEAR ?auto_2669235 ) ( IS-CRATE ?auto_2669236 ) ( not ( = ?auto_2669235 ?auto_2669236 ) ) ( AVAILABLE ?auto_2669240 ) ( ON ?auto_2669235 ?auto_2669234 ) ( not ( = ?auto_2669234 ?auto_2669235 ) ) ( not ( = ?auto_2669234 ?auto_2669236 ) ) ( TRUCK-AT ?auto_2669239 ?auto_2669241 ) ( not ( = ?auto_2669241 ?auto_2669237 ) ) ( HOIST-AT ?auto_2669238 ?auto_2669241 ) ( LIFTING ?auto_2669238 ?auto_2669236 ) ( not ( = ?auto_2669240 ?auto_2669238 ) ) ( ON ?auto_2669228 ?auto_2669227 ) ( ON ?auto_2669229 ?auto_2669228 ) ( ON ?auto_2669231 ?auto_2669229 ) ( ON ?auto_2669230 ?auto_2669231 ) ( ON ?auto_2669232 ?auto_2669230 ) ( ON ?auto_2669233 ?auto_2669232 ) ( ON ?auto_2669234 ?auto_2669233 ) ( not ( = ?auto_2669227 ?auto_2669228 ) ) ( not ( = ?auto_2669227 ?auto_2669229 ) ) ( not ( = ?auto_2669227 ?auto_2669231 ) ) ( not ( = ?auto_2669227 ?auto_2669230 ) ) ( not ( = ?auto_2669227 ?auto_2669232 ) ) ( not ( = ?auto_2669227 ?auto_2669233 ) ) ( not ( = ?auto_2669227 ?auto_2669234 ) ) ( not ( = ?auto_2669227 ?auto_2669235 ) ) ( not ( = ?auto_2669227 ?auto_2669236 ) ) ( not ( = ?auto_2669228 ?auto_2669229 ) ) ( not ( = ?auto_2669228 ?auto_2669231 ) ) ( not ( = ?auto_2669228 ?auto_2669230 ) ) ( not ( = ?auto_2669228 ?auto_2669232 ) ) ( not ( = ?auto_2669228 ?auto_2669233 ) ) ( not ( = ?auto_2669228 ?auto_2669234 ) ) ( not ( = ?auto_2669228 ?auto_2669235 ) ) ( not ( = ?auto_2669228 ?auto_2669236 ) ) ( not ( = ?auto_2669229 ?auto_2669231 ) ) ( not ( = ?auto_2669229 ?auto_2669230 ) ) ( not ( = ?auto_2669229 ?auto_2669232 ) ) ( not ( = ?auto_2669229 ?auto_2669233 ) ) ( not ( = ?auto_2669229 ?auto_2669234 ) ) ( not ( = ?auto_2669229 ?auto_2669235 ) ) ( not ( = ?auto_2669229 ?auto_2669236 ) ) ( not ( = ?auto_2669231 ?auto_2669230 ) ) ( not ( = ?auto_2669231 ?auto_2669232 ) ) ( not ( = ?auto_2669231 ?auto_2669233 ) ) ( not ( = ?auto_2669231 ?auto_2669234 ) ) ( not ( = ?auto_2669231 ?auto_2669235 ) ) ( not ( = ?auto_2669231 ?auto_2669236 ) ) ( not ( = ?auto_2669230 ?auto_2669232 ) ) ( not ( = ?auto_2669230 ?auto_2669233 ) ) ( not ( = ?auto_2669230 ?auto_2669234 ) ) ( not ( = ?auto_2669230 ?auto_2669235 ) ) ( not ( = ?auto_2669230 ?auto_2669236 ) ) ( not ( = ?auto_2669232 ?auto_2669233 ) ) ( not ( = ?auto_2669232 ?auto_2669234 ) ) ( not ( = ?auto_2669232 ?auto_2669235 ) ) ( not ( = ?auto_2669232 ?auto_2669236 ) ) ( not ( = ?auto_2669233 ?auto_2669234 ) ) ( not ( = ?auto_2669233 ?auto_2669235 ) ) ( not ( = ?auto_2669233 ?auto_2669236 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2669234 ?auto_2669235 ?auto_2669236 )
      ( MAKE-9CRATE-VERIFY ?auto_2669227 ?auto_2669228 ?auto_2669229 ?auto_2669231 ?auto_2669230 ?auto_2669232 ?auto_2669233 ?auto_2669234 ?auto_2669235 ?auto_2669236 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2669335 - SURFACE
      ?auto_2669336 - SURFACE
      ?auto_2669337 - SURFACE
      ?auto_2669339 - SURFACE
      ?auto_2669338 - SURFACE
      ?auto_2669340 - SURFACE
      ?auto_2669341 - SURFACE
      ?auto_2669342 - SURFACE
      ?auto_2669343 - SURFACE
      ?auto_2669344 - SURFACE
    )
    :vars
    (
      ?auto_2669348 - HOIST
      ?auto_2669349 - PLACE
      ?auto_2669345 - TRUCK
      ?auto_2669350 - PLACE
      ?auto_2669347 - HOIST
      ?auto_2669346 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2669348 ?auto_2669349 ) ( SURFACE-AT ?auto_2669343 ?auto_2669349 ) ( CLEAR ?auto_2669343 ) ( IS-CRATE ?auto_2669344 ) ( not ( = ?auto_2669343 ?auto_2669344 ) ) ( AVAILABLE ?auto_2669348 ) ( ON ?auto_2669343 ?auto_2669342 ) ( not ( = ?auto_2669342 ?auto_2669343 ) ) ( not ( = ?auto_2669342 ?auto_2669344 ) ) ( TRUCK-AT ?auto_2669345 ?auto_2669350 ) ( not ( = ?auto_2669350 ?auto_2669349 ) ) ( HOIST-AT ?auto_2669347 ?auto_2669350 ) ( not ( = ?auto_2669348 ?auto_2669347 ) ) ( AVAILABLE ?auto_2669347 ) ( SURFACE-AT ?auto_2669344 ?auto_2669350 ) ( ON ?auto_2669344 ?auto_2669346 ) ( CLEAR ?auto_2669344 ) ( not ( = ?auto_2669343 ?auto_2669346 ) ) ( not ( = ?auto_2669344 ?auto_2669346 ) ) ( not ( = ?auto_2669342 ?auto_2669346 ) ) ( ON ?auto_2669336 ?auto_2669335 ) ( ON ?auto_2669337 ?auto_2669336 ) ( ON ?auto_2669339 ?auto_2669337 ) ( ON ?auto_2669338 ?auto_2669339 ) ( ON ?auto_2669340 ?auto_2669338 ) ( ON ?auto_2669341 ?auto_2669340 ) ( ON ?auto_2669342 ?auto_2669341 ) ( not ( = ?auto_2669335 ?auto_2669336 ) ) ( not ( = ?auto_2669335 ?auto_2669337 ) ) ( not ( = ?auto_2669335 ?auto_2669339 ) ) ( not ( = ?auto_2669335 ?auto_2669338 ) ) ( not ( = ?auto_2669335 ?auto_2669340 ) ) ( not ( = ?auto_2669335 ?auto_2669341 ) ) ( not ( = ?auto_2669335 ?auto_2669342 ) ) ( not ( = ?auto_2669335 ?auto_2669343 ) ) ( not ( = ?auto_2669335 ?auto_2669344 ) ) ( not ( = ?auto_2669335 ?auto_2669346 ) ) ( not ( = ?auto_2669336 ?auto_2669337 ) ) ( not ( = ?auto_2669336 ?auto_2669339 ) ) ( not ( = ?auto_2669336 ?auto_2669338 ) ) ( not ( = ?auto_2669336 ?auto_2669340 ) ) ( not ( = ?auto_2669336 ?auto_2669341 ) ) ( not ( = ?auto_2669336 ?auto_2669342 ) ) ( not ( = ?auto_2669336 ?auto_2669343 ) ) ( not ( = ?auto_2669336 ?auto_2669344 ) ) ( not ( = ?auto_2669336 ?auto_2669346 ) ) ( not ( = ?auto_2669337 ?auto_2669339 ) ) ( not ( = ?auto_2669337 ?auto_2669338 ) ) ( not ( = ?auto_2669337 ?auto_2669340 ) ) ( not ( = ?auto_2669337 ?auto_2669341 ) ) ( not ( = ?auto_2669337 ?auto_2669342 ) ) ( not ( = ?auto_2669337 ?auto_2669343 ) ) ( not ( = ?auto_2669337 ?auto_2669344 ) ) ( not ( = ?auto_2669337 ?auto_2669346 ) ) ( not ( = ?auto_2669339 ?auto_2669338 ) ) ( not ( = ?auto_2669339 ?auto_2669340 ) ) ( not ( = ?auto_2669339 ?auto_2669341 ) ) ( not ( = ?auto_2669339 ?auto_2669342 ) ) ( not ( = ?auto_2669339 ?auto_2669343 ) ) ( not ( = ?auto_2669339 ?auto_2669344 ) ) ( not ( = ?auto_2669339 ?auto_2669346 ) ) ( not ( = ?auto_2669338 ?auto_2669340 ) ) ( not ( = ?auto_2669338 ?auto_2669341 ) ) ( not ( = ?auto_2669338 ?auto_2669342 ) ) ( not ( = ?auto_2669338 ?auto_2669343 ) ) ( not ( = ?auto_2669338 ?auto_2669344 ) ) ( not ( = ?auto_2669338 ?auto_2669346 ) ) ( not ( = ?auto_2669340 ?auto_2669341 ) ) ( not ( = ?auto_2669340 ?auto_2669342 ) ) ( not ( = ?auto_2669340 ?auto_2669343 ) ) ( not ( = ?auto_2669340 ?auto_2669344 ) ) ( not ( = ?auto_2669340 ?auto_2669346 ) ) ( not ( = ?auto_2669341 ?auto_2669342 ) ) ( not ( = ?auto_2669341 ?auto_2669343 ) ) ( not ( = ?auto_2669341 ?auto_2669344 ) ) ( not ( = ?auto_2669341 ?auto_2669346 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2669342 ?auto_2669343 ?auto_2669344 )
      ( MAKE-9CRATE-VERIFY ?auto_2669335 ?auto_2669336 ?auto_2669337 ?auto_2669339 ?auto_2669338 ?auto_2669340 ?auto_2669341 ?auto_2669342 ?auto_2669343 ?auto_2669344 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2669444 - SURFACE
      ?auto_2669445 - SURFACE
      ?auto_2669446 - SURFACE
      ?auto_2669448 - SURFACE
      ?auto_2669447 - SURFACE
      ?auto_2669449 - SURFACE
      ?auto_2669450 - SURFACE
      ?auto_2669451 - SURFACE
      ?auto_2669452 - SURFACE
      ?auto_2669453 - SURFACE
    )
    :vars
    (
      ?auto_2669459 - HOIST
      ?auto_2669454 - PLACE
      ?auto_2669455 - PLACE
      ?auto_2669456 - HOIST
      ?auto_2669458 - SURFACE
      ?auto_2669457 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2669459 ?auto_2669454 ) ( SURFACE-AT ?auto_2669452 ?auto_2669454 ) ( CLEAR ?auto_2669452 ) ( IS-CRATE ?auto_2669453 ) ( not ( = ?auto_2669452 ?auto_2669453 ) ) ( AVAILABLE ?auto_2669459 ) ( ON ?auto_2669452 ?auto_2669451 ) ( not ( = ?auto_2669451 ?auto_2669452 ) ) ( not ( = ?auto_2669451 ?auto_2669453 ) ) ( not ( = ?auto_2669455 ?auto_2669454 ) ) ( HOIST-AT ?auto_2669456 ?auto_2669455 ) ( not ( = ?auto_2669459 ?auto_2669456 ) ) ( AVAILABLE ?auto_2669456 ) ( SURFACE-AT ?auto_2669453 ?auto_2669455 ) ( ON ?auto_2669453 ?auto_2669458 ) ( CLEAR ?auto_2669453 ) ( not ( = ?auto_2669452 ?auto_2669458 ) ) ( not ( = ?auto_2669453 ?auto_2669458 ) ) ( not ( = ?auto_2669451 ?auto_2669458 ) ) ( TRUCK-AT ?auto_2669457 ?auto_2669454 ) ( ON ?auto_2669445 ?auto_2669444 ) ( ON ?auto_2669446 ?auto_2669445 ) ( ON ?auto_2669448 ?auto_2669446 ) ( ON ?auto_2669447 ?auto_2669448 ) ( ON ?auto_2669449 ?auto_2669447 ) ( ON ?auto_2669450 ?auto_2669449 ) ( ON ?auto_2669451 ?auto_2669450 ) ( not ( = ?auto_2669444 ?auto_2669445 ) ) ( not ( = ?auto_2669444 ?auto_2669446 ) ) ( not ( = ?auto_2669444 ?auto_2669448 ) ) ( not ( = ?auto_2669444 ?auto_2669447 ) ) ( not ( = ?auto_2669444 ?auto_2669449 ) ) ( not ( = ?auto_2669444 ?auto_2669450 ) ) ( not ( = ?auto_2669444 ?auto_2669451 ) ) ( not ( = ?auto_2669444 ?auto_2669452 ) ) ( not ( = ?auto_2669444 ?auto_2669453 ) ) ( not ( = ?auto_2669444 ?auto_2669458 ) ) ( not ( = ?auto_2669445 ?auto_2669446 ) ) ( not ( = ?auto_2669445 ?auto_2669448 ) ) ( not ( = ?auto_2669445 ?auto_2669447 ) ) ( not ( = ?auto_2669445 ?auto_2669449 ) ) ( not ( = ?auto_2669445 ?auto_2669450 ) ) ( not ( = ?auto_2669445 ?auto_2669451 ) ) ( not ( = ?auto_2669445 ?auto_2669452 ) ) ( not ( = ?auto_2669445 ?auto_2669453 ) ) ( not ( = ?auto_2669445 ?auto_2669458 ) ) ( not ( = ?auto_2669446 ?auto_2669448 ) ) ( not ( = ?auto_2669446 ?auto_2669447 ) ) ( not ( = ?auto_2669446 ?auto_2669449 ) ) ( not ( = ?auto_2669446 ?auto_2669450 ) ) ( not ( = ?auto_2669446 ?auto_2669451 ) ) ( not ( = ?auto_2669446 ?auto_2669452 ) ) ( not ( = ?auto_2669446 ?auto_2669453 ) ) ( not ( = ?auto_2669446 ?auto_2669458 ) ) ( not ( = ?auto_2669448 ?auto_2669447 ) ) ( not ( = ?auto_2669448 ?auto_2669449 ) ) ( not ( = ?auto_2669448 ?auto_2669450 ) ) ( not ( = ?auto_2669448 ?auto_2669451 ) ) ( not ( = ?auto_2669448 ?auto_2669452 ) ) ( not ( = ?auto_2669448 ?auto_2669453 ) ) ( not ( = ?auto_2669448 ?auto_2669458 ) ) ( not ( = ?auto_2669447 ?auto_2669449 ) ) ( not ( = ?auto_2669447 ?auto_2669450 ) ) ( not ( = ?auto_2669447 ?auto_2669451 ) ) ( not ( = ?auto_2669447 ?auto_2669452 ) ) ( not ( = ?auto_2669447 ?auto_2669453 ) ) ( not ( = ?auto_2669447 ?auto_2669458 ) ) ( not ( = ?auto_2669449 ?auto_2669450 ) ) ( not ( = ?auto_2669449 ?auto_2669451 ) ) ( not ( = ?auto_2669449 ?auto_2669452 ) ) ( not ( = ?auto_2669449 ?auto_2669453 ) ) ( not ( = ?auto_2669449 ?auto_2669458 ) ) ( not ( = ?auto_2669450 ?auto_2669451 ) ) ( not ( = ?auto_2669450 ?auto_2669452 ) ) ( not ( = ?auto_2669450 ?auto_2669453 ) ) ( not ( = ?auto_2669450 ?auto_2669458 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2669451 ?auto_2669452 ?auto_2669453 )
      ( MAKE-9CRATE-VERIFY ?auto_2669444 ?auto_2669445 ?auto_2669446 ?auto_2669448 ?auto_2669447 ?auto_2669449 ?auto_2669450 ?auto_2669451 ?auto_2669452 ?auto_2669453 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2669553 - SURFACE
      ?auto_2669554 - SURFACE
      ?auto_2669555 - SURFACE
      ?auto_2669557 - SURFACE
      ?auto_2669556 - SURFACE
      ?auto_2669558 - SURFACE
      ?auto_2669559 - SURFACE
      ?auto_2669560 - SURFACE
      ?auto_2669561 - SURFACE
      ?auto_2669562 - SURFACE
    )
    :vars
    (
      ?auto_2669568 - HOIST
      ?auto_2669567 - PLACE
      ?auto_2669565 - PLACE
      ?auto_2669564 - HOIST
      ?auto_2669563 - SURFACE
      ?auto_2669566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2669568 ?auto_2669567 ) ( IS-CRATE ?auto_2669562 ) ( not ( = ?auto_2669561 ?auto_2669562 ) ) ( not ( = ?auto_2669560 ?auto_2669561 ) ) ( not ( = ?auto_2669560 ?auto_2669562 ) ) ( not ( = ?auto_2669565 ?auto_2669567 ) ) ( HOIST-AT ?auto_2669564 ?auto_2669565 ) ( not ( = ?auto_2669568 ?auto_2669564 ) ) ( AVAILABLE ?auto_2669564 ) ( SURFACE-AT ?auto_2669562 ?auto_2669565 ) ( ON ?auto_2669562 ?auto_2669563 ) ( CLEAR ?auto_2669562 ) ( not ( = ?auto_2669561 ?auto_2669563 ) ) ( not ( = ?auto_2669562 ?auto_2669563 ) ) ( not ( = ?auto_2669560 ?auto_2669563 ) ) ( TRUCK-AT ?auto_2669566 ?auto_2669567 ) ( SURFACE-AT ?auto_2669560 ?auto_2669567 ) ( CLEAR ?auto_2669560 ) ( LIFTING ?auto_2669568 ?auto_2669561 ) ( IS-CRATE ?auto_2669561 ) ( ON ?auto_2669554 ?auto_2669553 ) ( ON ?auto_2669555 ?auto_2669554 ) ( ON ?auto_2669557 ?auto_2669555 ) ( ON ?auto_2669556 ?auto_2669557 ) ( ON ?auto_2669558 ?auto_2669556 ) ( ON ?auto_2669559 ?auto_2669558 ) ( ON ?auto_2669560 ?auto_2669559 ) ( not ( = ?auto_2669553 ?auto_2669554 ) ) ( not ( = ?auto_2669553 ?auto_2669555 ) ) ( not ( = ?auto_2669553 ?auto_2669557 ) ) ( not ( = ?auto_2669553 ?auto_2669556 ) ) ( not ( = ?auto_2669553 ?auto_2669558 ) ) ( not ( = ?auto_2669553 ?auto_2669559 ) ) ( not ( = ?auto_2669553 ?auto_2669560 ) ) ( not ( = ?auto_2669553 ?auto_2669561 ) ) ( not ( = ?auto_2669553 ?auto_2669562 ) ) ( not ( = ?auto_2669553 ?auto_2669563 ) ) ( not ( = ?auto_2669554 ?auto_2669555 ) ) ( not ( = ?auto_2669554 ?auto_2669557 ) ) ( not ( = ?auto_2669554 ?auto_2669556 ) ) ( not ( = ?auto_2669554 ?auto_2669558 ) ) ( not ( = ?auto_2669554 ?auto_2669559 ) ) ( not ( = ?auto_2669554 ?auto_2669560 ) ) ( not ( = ?auto_2669554 ?auto_2669561 ) ) ( not ( = ?auto_2669554 ?auto_2669562 ) ) ( not ( = ?auto_2669554 ?auto_2669563 ) ) ( not ( = ?auto_2669555 ?auto_2669557 ) ) ( not ( = ?auto_2669555 ?auto_2669556 ) ) ( not ( = ?auto_2669555 ?auto_2669558 ) ) ( not ( = ?auto_2669555 ?auto_2669559 ) ) ( not ( = ?auto_2669555 ?auto_2669560 ) ) ( not ( = ?auto_2669555 ?auto_2669561 ) ) ( not ( = ?auto_2669555 ?auto_2669562 ) ) ( not ( = ?auto_2669555 ?auto_2669563 ) ) ( not ( = ?auto_2669557 ?auto_2669556 ) ) ( not ( = ?auto_2669557 ?auto_2669558 ) ) ( not ( = ?auto_2669557 ?auto_2669559 ) ) ( not ( = ?auto_2669557 ?auto_2669560 ) ) ( not ( = ?auto_2669557 ?auto_2669561 ) ) ( not ( = ?auto_2669557 ?auto_2669562 ) ) ( not ( = ?auto_2669557 ?auto_2669563 ) ) ( not ( = ?auto_2669556 ?auto_2669558 ) ) ( not ( = ?auto_2669556 ?auto_2669559 ) ) ( not ( = ?auto_2669556 ?auto_2669560 ) ) ( not ( = ?auto_2669556 ?auto_2669561 ) ) ( not ( = ?auto_2669556 ?auto_2669562 ) ) ( not ( = ?auto_2669556 ?auto_2669563 ) ) ( not ( = ?auto_2669558 ?auto_2669559 ) ) ( not ( = ?auto_2669558 ?auto_2669560 ) ) ( not ( = ?auto_2669558 ?auto_2669561 ) ) ( not ( = ?auto_2669558 ?auto_2669562 ) ) ( not ( = ?auto_2669558 ?auto_2669563 ) ) ( not ( = ?auto_2669559 ?auto_2669560 ) ) ( not ( = ?auto_2669559 ?auto_2669561 ) ) ( not ( = ?auto_2669559 ?auto_2669562 ) ) ( not ( = ?auto_2669559 ?auto_2669563 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2669560 ?auto_2669561 ?auto_2669562 )
      ( MAKE-9CRATE-VERIFY ?auto_2669553 ?auto_2669554 ?auto_2669555 ?auto_2669557 ?auto_2669556 ?auto_2669558 ?auto_2669559 ?auto_2669560 ?auto_2669561 ?auto_2669562 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2669662 - SURFACE
      ?auto_2669663 - SURFACE
      ?auto_2669664 - SURFACE
      ?auto_2669666 - SURFACE
      ?auto_2669665 - SURFACE
      ?auto_2669667 - SURFACE
      ?auto_2669668 - SURFACE
      ?auto_2669669 - SURFACE
      ?auto_2669670 - SURFACE
      ?auto_2669671 - SURFACE
    )
    :vars
    (
      ?auto_2669673 - HOIST
      ?auto_2669675 - PLACE
      ?auto_2669677 - PLACE
      ?auto_2669676 - HOIST
      ?auto_2669674 - SURFACE
      ?auto_2669672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2669673 ?auto_2669675 ) ( IS-CRATE ?auto_2669671 ) ( not ( = ?auto_2669670 ?auto_2669671 ) ) ( not ( = ?auto_2669669 ?auto_2669670 ) ) ( not ( = ?auto_2669669 ?auto_2669671 ) ) ( not ( = ?auto_2669677 ?auto_2669675 ) ) ( HOIST-AT ?auto_2669676 ?auto_2669677 ) ( not ( = ?auto_2669673 ?auto_2669676 ) ) ( AVAILABLE ?auto_2669676 ) ( SURFACE-AT ?auto_2669671 ?auto_2669677 ) ( ON ?auto_2669671 ?auto_2669674 ) ( CLEAR ?auto_2669671 ) ( not ( = ?auto_2669670 ?auto_2669674 ) ) ( not ( = ?auto_2669671 ?auto_2669674 ) ) ( not ( = ?auto_2669669 ?auto_2669674 ) ) ( TRUCK-AT ?auto_2669672 ?auto_2669675 ) ( SURFACE-AT ?auto_2669669 ?auto_2669675 ) ( CLEAR ?auto_2669669 ) ( IS-CRATE ?auto_2669670 ) ( AVAILABLE ?auto_2669673 ) ( IN ?auto_2669670 ?auto_2669672 ) ( ON ?auto_2669663 ?auto_2669662 ) ( ON ?auto_2669664 ?auto_2669663 ) ( ON ?auto_2669666 ?auto_2669664 ) ( ON ?auto_2669665 ?auto_2669666 ) ( ON ?auto_2669667 ?auto_2669665 ) ( ON ?auto_2669668 ?auto_2669667 ) ( ON ?auto_2669669 ?auto_2669668 ) ( not ( = ?auto_2669662 ?auto_2669663 ) ) ( not ( = ?auto_2669662 ?auto_2669664 ) ) ( not ( = ?auto_2669662 ?auto_2669666 ) ) ( not ( = ?auto_2669662 ?auto_2669665 ) ) ( not ( = ?auto_2669662 ?auto_2669667 ) ) ( not ( = ?auto_2669662 ?auto_2669668 ) ) ( not ( = ?auto_2669662 ?auto_2669669 ) ) ( not ( = ?auto_2669662 ?auto_2669670 ) ) ( not ( = ?auto_2669662 ?auto_2669671 ) ) ( not ( = ?auto_2669662 ?auto_2669674 ) ) ( not ( = ?auto_2669663 ?auto_2669664 ) ) ( not ( = ?auto_2669663 ?auto_2669666 ) ) ( not ( = ?auto_2669663 ?auto_2669665 ) ) ( not ( = ?auto_2669663 ?auto_2669667 ) ) ( not ( = ?auto_2669663 ?auto_2669668 ) ) ( not ( = ?auto_2669663 ?auto_2669669 ) ) ( not ( = ?auto_2669663 ?auto_2669670 ) ) ( not ( = ?auto_2669663 ?auto_2669671 ) ) ( not ( = ?auto_2669663 ?auto_2669674 ) ) ( not ( = ?auto_2669664 ?auto_2669666 ) ) ( not ( = ?auto_2669664 ?auto_2669665 ) ) ( not ( = ?auto_2669664 ?auto_2669667 ) ) ( not ( = ?auto_2669664 ?auto_2669668 ) ) ( not ( = ?auto_2669664 ?auto_2669669 ) ) ( not ( = ?auto_2669664 ?auto_2669670 ) ) ( not ( = ?auto_2669664 ?auto_2669671 ) ) ( not ( = ?auto_2669664 ?auto_2669674 ) ) ( not ( = ?auto_2669666 ?auto_2669665 ) ) ( not ( = ?auto_2669666 ?auto_2669667 ) ) ( not ( = ?auto_2669666 ?auto_2669668 ) ) ( not ( = ?auto_2669666 ?auto_2669669 ) ) ( not ( = ?auto_2669666 ?auto_2669670 ) ) ( not ( = ?auto_2669666 ?auto_2669671 ) ) ( not ( = ?auto_2669666 ?auto_2669674 ) ) ( not ( = ?auto_2669665 ?auto_2669667 ) ) ( not ( = ?auto_2669665 ?auto_2669668 ) ) ( not ( = ?auto_2669665 ?auto_2669669 ) ) ( not ( = ?auto_2669665 ?auto_2669670 ) ) ( not ( = ?auto_2669665 ?auto_2669671 ) ) ( not ( = ?auto_2669665 ?auto_2669674 ) ) ( not ( = ?auto_2669667 ?auto_2669668 ) ) ( not ( = ?auto_2669667 ?auto_2669669 ) ) ( not ( = ?auto_2669667 ?auto_2669670 ) ) ( not ( = ?auto_2669667 ?auto_2669671 ) ) ( not ( = ?auto_2669667 ?auto_2669674 ) ) ( not ( = ?auto_2669668 ?auto_2669669 ) ) ( not ( = ?auto_2669668 ?auto_2669670 ) ) ( not ( = ?auto_2669668 ?auto_2669671 ) ) ( not ( = ?auto_2669668 ?auto_2669674 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2669669 ?auto_2669670 ?auto_2669671 )
      ( MAKE-9CRATE-VERIFY ?auto_2669662 ?auto_2669663 ?auto_2669664 ?auto_2669666 ?auto_2669665 ?auto_2669667 ?auto_2669668 ?auto_2669669 ?auto_2669670 ?auto_2669671 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2675227 - SURFACE
      ?auto_2675228 - SURFACE
      ?auto_2675229 - SURFACE
      ?auto_2675231 - SURFACE
      ?auto_2675230 - SURFACE
      ?auto_2675232 - SURFACE
      ?auto_2675233 - SURFACE
      ?auto_2675234 - SURFACE
      ?auto_2675235 - SURFACE
      ?auto_2675236 - SURFACE
      ?auto_2675237 - SURFACE
    )
    :vars
    (
      ?auto_2675238 - HOIST
      ?auto_2675239 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2675238 ?auto_2675239 ) ( SURFACE-AT ?auto_2675236 ?auto_2675239 ) ( CLEAR ?auto_2675236 ) ( LIFTING ?auto_2675238 ?auto_2675237 ) ( IS-CRATE ?auto_2675237 ) ( not ( = ?auto_2675236 ?auto_2675237 ) ) ( ON ?auto_2675228 ?auto_2675227 ) ( ON ?auto_2675229 ?auto_2675228 ) ( ON ?auto_2675231 ?auto_2675229 ) ( ON ?auto_2675230 ?auto_2675231 ) ( ON ?auto_2675232 ?auto_2675230 ) ( ON ?auto_2675233 ?auto_2675232 ) ( ON ?auto_2675234 ?auto_2675233 ) ( ON ?auto_2675235 ?auto_2675234 ) ( ON ?auto_2675236 ?auto_2675235 ) ( not ( = ?auto_2675227 ?auto_2675228 ) ) ( not ( = ?auto_2675227 ?auto_2675229 ) ) ( not ( = ?auto_2675227 ?auto_2675231 ) ) ( not ( = ?auto_2675227 ?auto_2675230 ) ) ( not ( = ?auto_2675227 ?auto_2675232 ) ) ( not ( = ?auto_2675227 ?auto_2675233 ) ) ( not ( = ?auto_2675227 ?auto_2675234 ) ) ( not ( = ?auto_2675227 ?auto_2675235 ) ) ( not ( = ?auto_2675227 ?auto_2675236 ) ) ( not ( = ?auto_2675227 ?auto_2675237 ) ) ( not ( = ?auto_2675228 ?auto_2675229 ) ) ( not ( = ?auto_2675228 ?auto_2675231 ) ) ( not ( = ?auto_2675228 ?auto_2675230 ) ) ( not ( = ?auto_2675228 ?auto_2675232 ) ) ( not ( = ?auto_2675228 ?auto_2675233 ) ) ( not ( = ?auto_2675228 ?auto_2675234 ) ) ( not ( = ?auto_2675228 ?auto_2675235 ) ) ( not ( = ?auto_2675228 ?auto_2675236 ) ) ( not ( = ?auto_2675228 ?auto_2675237 ) ) ( not ( = ?auto_2675229 ?auto_2675231 ) ) ( not ( = ?auto_2675229 ?auto_2675230 ) ) ( not ( = ?auto_2675229 ?auto_2675232 ) ) ( not ( = ?auto_2675229 ?auto_2675233 ) ) ( not ( = ?auto_2675229 ?auto_2675234 ) ) ( not ( = ?auto_2675229 ?auto_2675235 ) ) ( not ( = ?auto_2675229 ?auto_2675236 ) ) ( not ( = ?auto_2675229 ?auto_2675237 ) ) ( not ( = ?auto_2675231 ?auto_2675230 ) ) ( not ( = ?auto_2675231 ?auto_2675232 ) ) ( not ( = ?auto_2675231 ?auto_2675233 ) ) ( not ( = ?auto_2675231 ?auto_2675234 ) ) ( not ( = ?auto_2675231 ?auto_2675235 ) ) ( not ( = ?auto_2675231 ?auto_2675236 ) ) ( not ( = ?auto_2675231 ?auto_2675237 ) ) ( not ( = ?auto_2675230 ?auto_2675232 ) ) ( not ( = ?auto_2675230 ?auto_2675233 ) ) ( not ( = ?auto_2675230 ?auto_2675234 ) ) ( not ( = ?auto_2675230 ?auto_2675235 ) ) ( not ( = ?auto_2675230 ?auto_2675236 ) ) ( not ( = ?auto_2675230 ?auto_2675237 ) ) ( not ( = ?auto_2675232 ?auto_2675233 ) ) ( not ( = ?auto_2675232 ?auto_2675234 ) ) ( not ( = ?auto_2675232 ?auto_2675235 ) ) ( not ( = ?auto_2675232 ?auto_2675236 ) ) ( not ( = ?auto_2675232 ?auto_2675237 ) ) ( not ( = ?auto_2675233 ?auto_2675234 ) ) ( not ( = ?auto_2675233 ?auto_2675235 ) ) ( not ( = ?auto_2675233 ?auto_2675236 ) ) ( not ( = ?auto_2675233 ?auto_2675237 ) ) ( not ( = ?auto_2675234 ?auto_2675235 ) ) ( not ( = ?auto_2675234 ?auto_2675236 ) ) ( not ( = ?auto_2675234 ?auto_2675237 ) ) ( not ( = ?auto_2675235 ?auto_2675236 ) ) ( not ( = ?auto_2675235 ?auto_2675237 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2675236 ?auto_2675237 )
      ( MAKE-10CRATE-VERIFY ?auto_2675227 ?auto_2675228 ?auto_2675229 ?auto_2675231 ?auto_2675230 ?auto_2675232 ?auto_2675233 ?auto_2675234 ?auto_2675235 ?auto_2675236 ?auto_2675237 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2675321 - SURFACE
      ?auto_2675322 - SURFACE
      ?auto_2675323 - SURFACE
      ?auto_2675325 - SURFACE
      ?auto_2675324 - SURFACE
      ?auto_2675326 - SURFACE
      ?auto_2675327 - SURFACE
      ?auto_2675328 - SURFACE
      ?auto_2675329 - SURFACE
      ?auto_2675330 - SURFACE
      ?auto_2675331 - SURFACE
    )
    :vars
    (
      ?auto_2675333 - HOIST
      ?auto_2675334 - PLACE
      ?auto_2675332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2675333 ?auto_2675334 ) ( SURFACE-AT ?auto_2675330 ?auto_2675334 ) ( CLEAR ?auto_2675330 ) ( IS-CRATE ?auto_2675331 ) ( not ( = ?auto_2675330 ?auto_2675331 ) ) ( TRUCK-AT ?auto_2675332 ?auto_2675334 ) ( AVAILABLE ?auto_2675333 ) ( IN ?auto_2675331 ?auto_2675332 ) ( ON ?auto_2675330 ?auto_2675329 ) ( not ( = ?auto_2675329 ?auto_2675330 ) ) ( not ( = ?auto_2675329 ?auto_2675331 ) ) ( ON ?auto_2675322 ?auto_2675321 ) ( ON ?auto_2675323 ?auto_2675322 ) ( ON ?auto_2675325 ?auto_2675323 ) ( ON ?auto_2675324 ?auto_2675325 ) ( ON ?auto_2675326 ?auto_2675324 ) ( ON ?auto_2675327 ?auto_2675326 ) ( ON ?auto_2675328 ?auto_2675327 ) ( ON ?auto_2675329 ?auto_2675328 ) ( not ( = ?auto_2675321 ?auto_2675322 ) ) ( not ( = ?auto_2675321 ?auto_2675323 ) ) ( not ( = ?auto_2675321 ?auto_2675325 ) ) ( not ( = ?auto_2675321 ?auto_2675324 ) ) ( not ( = ?auto_2675321 ?auto_2675326 ) ) ( not ( = ?auto_2675321 ?auto_2675327 ) ) ( not ( = ?auto_2675321 ?auto_2675328 ) ) ( not ( = ?auto_2675321 ?auto_2675329 ) ) ( not ( = ?auto_2675321 ?auto_2675330 ) ) ( not ( = ?auto_2675321 ?auto_2675331 ) ) ( not ( = ?auto_2675322 ?auto_2675323 ) ) ( not ( = ?auto_2675322 ?auto_2675325 ) ) ( not ( = ?auto_2675322 ?auto_2675324 ) ) ( not ( = ?auto_2675322 ?auto_2675326 ) ) ( not ( = ?auto_2675322 ?auto_2675327 ) ) ( not ( = ?auto_2675322 ?auto_2675328 ) ) ( not ( = ?auto_2675322 ?auto_2675329 ) ) ( not ( = ?auto_2675322 ?auto_2675330 ) ) ( not ( = ?auto_2675322 ?auto_2675331 ) ) ( not ( = ?auto_2675323 ?auto_2675325 ) ) ( not ( = ?auto_2675323 ?auto_2675324 ) ) ( not ( = ?auto_2675323 ?auto_2675326 ) ) ( not ( = ?auto_2675323 ?auto_2675327 ) ) ( not ( = ?auto_2675323 ?auto_2675328 ) ) ( not ( = ?auto_2675323 ?auto_2675329 ) ) ( not ( = ?auto_2675323 ?auto_2675330 ) ) ( not ( = ?auto_2675323 ?auto_2675331 ) ) ( not ( = ?auto_2675325 ?auto_2675324 ) ) ( not ( = ?auto_2675325 ?auto_2675326 ) ) ( not ( = ?auto_2675325 ?auto_2675327 ) ) ( not ( = ?auto_2675325 ?auto_2675328 ) ) ( not ( = ?auto_2675325 ?auto_2675329 ) ) ( not ( = ?auto_2675325 ?auto_2675330 ) ) ( not ( = ?auto_2675325 ?auto_2675331 ) ) ( not ( = ?auto_2675324 ?auto_2675326 ) ) ( not ( = ?auto_2675324 ?auto_2675327 ) ) ( not ( = ?auto_2675324 ?auto_2675328 ) ) ( not ( = ?auto_2675324 ?auto_2675329 ) ) ( not ( = ?auto_2675324 ?auto_2675330 ) ) ( not ( = ?auto_2675324 ?auto_2675331 ) ) ( not ( = ?auto_2675326 ?auto_2675327 ) ) ( not ( = ?auto_2675326 ?auto_2675328 ) ) ( not ( = ?auto_2675326 ?auto_2675329 ) ) ( not ( = ?auto_2675326 ?auto_2675330 ) ) ( not ( = ?auto_2675326 ?auto_2675331 ) ) ( not ( = ?auto_2675327 ?auto_2675328 ) ) ( not ( = ?auto_2675327 ?auto_2675329 ) ) ( not ( = ?auto_2675327 ?auto_2675330 ) ) ( not ( = ?auto_2675327 ?auto_2675331 ) ) ( not ( = ?auto_2675328 ?auto_2675329 ) ) ( not ( = ?auto_2675328 ?auto_2675330 ) ) ( not ( = ?auto_2675328 ?auto_2675331 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2675329 ?auto_2675330 ?auto_2675331 )
      ( MAKE-10CRATE-VERIFY ?auto_2675321 ?auto_2675322 ?auto_2675323 ?auto_2675325 ?auto_2675324 ?auto_2675326 ?auto_2675327 ?auto_2675328 ?auto_2675329 ?auto_2675330 ?auto_2675331 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2675426 - SURFACE
      ?auto_2675427 - SURFACE
      ?auto_2675428 - SURFACE
      ?auto_2675430 - SURFACE
      ?auto_2675429 - SURFACE
      ?auto_2675431 - SURFACE
      ?auto_2675432 - SURFACE
      ?auto_2675433 - SURFACE
      ?auto_2675434 - SURFACE
      ?auto_2675435 - SURFACE
      ?auto_2675436 - SURFACE
    )
    :vars
    (
      ?auto_2675437 - HOIST
      ?auto_2675438 - PLACE
      ?auto_2675439 - TRUCK
      ?auto_2675440 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2675437 ?auto_2675438 ) ( SURFACE-AT ?auto_2675435 ?auto_2675438 ) ( CLEAR ?auto_2675435 ) ( IS-CRATE ?auto_2675436 ) ( not ( = ?auto_2675435 ?auto_2675436 ) ) ( AVAILABLE ?auto_2675437 ) ( IN ?auto_2675436 ?auto_2675439 ) ( ON ?auto_2675435 ?auto_2675434 ) ( not ( = ?auto_2675434 ?auto_2675435 ) ) ( not ( = ?auto_2675434 ?auto_2675436 ) ) ( TRUCK-AT ?auto_2675439 ?auto_2675440 ) ( not ( = ?auto_2675440 ?auto_2675438 ) ) ( ON ?auto_2675427 ?auto_2675426 ) ( ON ?auto_2675428 ?auto_2675427 ) ( ON ?auto_2675430 ?auto_2675428 ) ( ON ?auto_2675429 ?auto_2675430 ) ( ON ?auto_2675431 ?auto_2675429 ) ( ON ?auto_2675432 ?auto_2675431 ) ( ON ?auto_2675433 ?auto_2675432 ) ( ON ?auto_2675434 ?auto_2675433 ) ( not ( = ?auto_2675426 ?auto_2675427 ) ) ( not ( = ?auto_2675426 ?auto_2675428 ) ) ( not ( = ?auto_2675426 ?auto_2675430 ) ) ( not ( = ?auto_2675426 ?auto_2675429 ) ) ( not ( = ?auto_2675426 ?auto_2675431 ) ) ( not ( = ?auto_2675426 ?auto_2675432 ) ) ( not ( = ?auto_2675426 ?auto_2675433 ) ) ( not ( = ?auto_2675426 ?auto_2675434 ) ) ( not ( = ?auto_2675426 ?auto_2675435 ) ) ( not ( = ?auto_2675426 ?auto_2675436 ) ) ( not ( = ?auto_2675427 ?auto_2675428 ) ) ( not ( = ?auto_2675427 ?auto_2675430 ) ) ( not ( = ?auto_2675427 ?auto_2675429 ) ) ( not ( = ?auto_2675427 ?auto_2675431 ) ) ( not ( = ?auto_2675427 ?auto_2675432 ) ) ( not ( = ?auto_2675427 ?auto_2675433 ) ) ( not ( = ?auto_2675427 ?auto_2675434 ) ) ( not ( = ?auto_2675427 ?auto_2675435 ) ) ( not ( = ?auto_2675427 ?auto_2675436 ) ) ( not ( = ?auto_2675428 ?auto_2675430 ) ) ( not ( = ?auto_2675428 ?auto_2675429 ) ) ( not ( = ?auto_2675428 ?auto_2675431 ) ) ( not ( = ?auto_2675428 ?auto_2675432 ) ) ( not ( = ?auto_2675428 ?auto_2675433 ) ) ( not ( = ?auto_2675428 ?auto_2675434 ) ) ( not ( = ?auto_2675428 ?auto_2675435 ) ) ( not ( = ?auto_2675428 ?auto_2675436 ) ) ( not ( = ?auto_2675430 ?auto_2675429 ) ) ( not ( = ?auto_2675430 ?auto_2675431 ) ) ( not ( = ?auto_2675430 ?auto_2675432 ) ) ( not ( = ?auto_2675430 ?auto_2675433 ) ) ( not ( = ?auto_2675430 ?auto_2675434 ) ) ( not ( = ?auto_2675430 ?auto_2675435 ) ) ( not ( = ?auto_2675430 ?auto_2675436 ) ) ( not ( = ?auto_2675429 ?auto_2675431 ) ) ( not ( = ?auto_2675429 ?auto_2675432 ) ) ( not ( = ?auto_2675429 ?auto_2675433 ) ) ( not ( = ?auto_2675429 ?auto_2675434 ) ) ( not ( = ?auto_2675429 ?auto_2675435 ) ) ( not ( = ?auto_2675429 ?auto_2675436 ) ) ( not ( = ?auto_2675431 ?auto_2675432 ) ) ( not ( = ?auto_2675431 ?auto_2675433 ) ) ( not ( = ?auto_2675431 ?auto_2675434 ) ) ( not ( = ?auto_2675431 ?auto_2675435 ) ) ( not ( = ?auto_2675431 ?auto_2675436 ) ) ( not ( = ?auto_2675432 ?auto_2675433 ) ) ( not ( = ?auto_2675432 ?auto_2675434 ) ) ( not ( = ?auto_2675432 ?auto_2675435 ) ) ( not ( = ?auto_2675432 ?auto_2675436 ) ) ( not ( = ?auto_2675433 ?auto_2675434 ) ) ( not ( = ?auto_2675433 ?auto_2675435 ) ) ( not ( = ?auto_2675433 ?auto_2675436 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2675434 ?auto_2675435 ?auto_2675436 )
      ( MAKE-10CRATE-VERIFY ?auto_2675426 ?auto_2675427 ?auto_2675428 ?auto_2675430 ?auto_2675429 ?auto_2675431 ?auto_2675432 ?auto_2675433 ?auto_2675434 ?auto_2675435 ?auto_2675436 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2675541 - SURFACE
      ?auto_2675542 - SURFACE
      ?auto_2675543 - SURFACE
      ?auto_2675545 - SURFACE
      ?auto_2675544 - SURFACE
      ?auto_2675546 - SURFACE
      ?auto_2675547 - SURFACE
      ?auto_2675548 - SURFACE
      ?auto_2675549 - SURFACE
      ?auto_2675550 - SURFACE
      ?auto_2675551 - SURFACE
    )
    :vars
    (
      ?auto_2675554 - HOIST
      ?auto_2675555 - PLACE
      ?auto_2675556 - TRUCK
      ?auto_2675553 - PLACE
      ?auto_2675552 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2675554 ?auto_2675555 ) ( SURFACE-AT ?auto_2675550 ?auto_2675555 ) ( CLEAR ?auto_2675550 ) ( IS-CRATE ?auto_2675551 ) ( not ( = ?auto_2675550 ?auto_2675551 ) ) ( AVAILABLE ?auto_2675554 ) ( ON ?auto_2675550 ?auto_2675549 ) ( not ( = ?auto_2675549 ?auto_2675550 ) ) ( not ( = ?auto_2675549 ?auto_2675551 ) ) ( TRUCK-AT ?auto_2675556 ?auto_2675553 ) ( not ( = ?auto_2675553 ?auto_2675555 ) ) ( HOIST-AT ?auto_2675552 ?auto_2675553 ) ( LIFTING ?auto_2675552 ?auto_2675551 ) ( not ( = ?auto_2675554 ?auto_2675552 ) ) ( ON ?auto_2675542 ?auto_2675541 ) ( ON ?auto_2675543 ?auto_2675542 ) ( ON ?auto_2675545 ?auto_2675543 ) ( ON ?auto_2675544 ?auto_2675545 ) ( ON ?auto_2675546 ?auto_2675544 ) ( ON ?auto_2675547 ?auto_2675546 ) ( ON ?auto_2675548 ?auto_2675547 ) ( ON ?auto_2675549 ?auto_2675548 ) ( not ( = ?auto_2675541 ?auto_2675542 ) ) ( not ( = ?auto_2675541 ?auto_2675543 ) ) ( not ( = ?auto_2675541 ?auto_2675545 ) ) ( not ( = ?auto_2675541 ?auto_2675544 ) ) ( not ( = ?auto_2675541 ?auto_2675546 ) ) ( not ( = ?auto_2675541 ?auto_2675547 ) ) ( not ( = ?auto_2675541 ?auto_2675548 ) ) ( not ( = ?auto_2675541 ?auto_2675549 ) ) ( not ( = ?auto_2675541 ?auto_2675550 ) ) ( not ( = ?auto_2675541 ?auto_2675551 ) ) ( not ( = ?auto_2675542 ?auto_2675543 ) ) ( not ( = ?auto_2675542 ?auto_2675545 ) ) ( not ( = ?auto_2675542 ?auto_2675544 ) ) ( not ( = ?auto_2675542 ?auto_2675546 ) ) ( not ( = ?auto_2675542 ?auto_2675547 ) ) ( not ( = ?auto_2675542 ?auto_2675548 ) ) ( not ( = ?auto_2675542 ?auto_2675549 ) ) ( not ( = ?auto_2675542 ?auto_2675550 ) ) ( not ( = ?auto_2675542 ?auto_2675551 ) ) ( not ( = ?auto_2675543 ?auto_2675545 ) ) ( not ( = ?auto_2675543 ?auto_2675544 ) ) ( not ( = ?auto_2675543 ?auto_2675546 ) ) ( not ( = ?auto_2675543 ?auto_2675547 ) ) ( not ( = ?auto_2675543 ?auto_2675548 ) ) ( not ( = ?auto_2675543 ?auto_2675549 ) ) ( not ( = ?auto_2675543 ?auto_2675550 ) ) ( not ( = ?auto_2675543 ?auto_2675551 ) ) ( not ( = ?auto_2675545 ?auto_2675544 ) ) ( not ( = ?auto_2675545 ?auto_2675546 ) ) ( not ( = ?auto_2675545 ?auto_2675547 ) ) ( not ( = ?auto_2675545 ?auto_2675548 ) ) ( not ( = ?auto_2675545 ?auto_2675549 ) ) ( not ( = ?auto_2675545 ?auto_2675550 ) ) ( not ( = ?auto_2675545 ?auto_2675551 ) ) ( not ( = ?auto_2675544 ?auto_2675546 ) ) ( not ( = ?auto_2675544 ?auto_2675547 ) ) ( not ( = ?auto_2675544 ?auto_2675548 ) ) ( not ( = ?auto_2675544 ?auto_2675549 ) ) ( not ( = ?auto_2675544 ?auto_2675550 ) ) ( not ( = ?auto_2675544 ?auto_2675551 ) ) ( not ( = ?auto_2675546 ?auto_2675547 ) ) ( not ( = ?auto_2675546 ?auto_2675548 ) ) ( not ( = ?auto_2675546 ?auto_2675549 ) ) ( not ( = ?auto_2675546 ?auto_2675550 ) ) ( not ( = ?auto_2675546 ?auto_2675551 ) ) ( not ( = ?auto_2675547 ?auto_2675548 ) ) ( not ( = ?auto_2675547 ?auto_2675549 ) ) ( not ( = ?auto_2675547 ?auto_2675550 ) ) ( not ( = ?auto_2675547 ?auto_2675551 ) ) ( not ( = ?auto_2675548 ?auto_2675549 ) ) ( not ( = ?auto_2675548 ?auto_2675550 ) ) ( not ( = ?auto_2675548 ?auto_2675551 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2675549 ?auto_2675550 ?auto_2675551 )
      ( MAKE-10CRATE-VERIFY ?auto_2675541 ?auto_2675542 ?auto_2675543 ?auto_2675545 ?auto_2675544 ?auto_2675546 ?auto_2675547 ?auto_2675548 ?auto_2675549 ?auto_2675550 ?auto_2675551 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2675666 - SURFACE
      ?auto_2675667 - SURFACE
      ?auto_2675668 - SURFACE
      ?auto_2675670 - SURFACE
      ?auto_2675669 - SURFACE
      ?auto_2675671 - SURFACE
      ?auto_2675672 - SURFACE
      ?auto_2675673 - SURFACE
      ?auto_2675674 - SURFACE
      ?auto_2675675 - SURFACE
      ?auto_2675676 - SURFACE
    )
    :vars
    (
      ?auto_2675677 - HOIST
      ?auto_2675682 - PLACE
      ?auto_2675680 - TRUCK
      ?auto_2675681 - PLACE
      ?auto_2675678 - HOIST
      ?auto_2675679 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2675677 ?auto_2675682 ) ( SURFACE-AT ?auto_2675675 ?auto_2675682 ) ( CLEAR ?auto_2675675 ) ( IS-CRATE ?auto_2675676 ) ( not ( = ?auto_2675675 ?auto_2675676 ) ) ( AVAILABLE ?auto_2675677 ) ( ON ?auto_2675675 ?auto_2675674 ) ( not ( = ?auto_2675674 ?auto_2675675 ) ) ( not ( = ?auto_2675674 ?auto_2675676 ) ) ( TRUCK-AT ?auto_2675680 ?auto_2675681 ) ( not ( = ?auto_2675681 ?auto_2675682 ) ) ( HOIST-AT ?auto_2675678 ?auto_2675681 ) ( not ( = ?auto_2675677 ?auto_2675678 ) ) ( AVAILABLE ?auto_2675678 ) ( SURFACE-AT ?auto_2675676 ?auto_2675681 ) ( ON ?auto_2675676 ?auto_2675679 ) ( CLEAR ?auto_2675676 ) ( not ( = ?auto_2675675 ?auto_2675679 ) ) ( not ( = ?auto_2675676 ?auto_2675679 ) ) ( not ( = ?auto_2675674 ?auto_2675679 ) ) ( ON ?auto_2675667 ?auto_2675666 ) ( ON ?auto_2675668 ?auto_2675667 ) ( ON ?auto_2675670 ?auto_2675668 ) ( ON ?auto_2675669 ?auto_2675670 ) ( ON ?auto_2675671 ?auto_2675669 ) ( ON ?auto_2675672 ?auto_2675671 ) ( ON ?auto_2675673 ?auto_2675672 ) ( ON ?auto_2675674 ?auto_2675673 ) ( not ( = ?auto_2675666 ?auto_2675667 ) ) ( not ( = ?auto_2675666 ?auto_2675668 ) ) ( not ( = ?auto_2675666 ?auto_2675670 ) ) ( not ( = ?auto_2675666 ?auto_2675669 ) ) ( not ( = ?auto_2675666 ?auto_2675671 ) ) ( not ( = ?auto_2675666 ?auto_2675672 ) ) ( not ( = ?auto_2675666 ?auto_2675673 ) ) ( not ( = ?auto_2675666 ?auto_2675674 ) ) ( not ( = ?auto_2675666 ?auto_2675675 ) ) ( not ( = ?auto_2675666 ?auto_2675676 ) ) ( not ( = ?auto_2675666 ?auto_2675679 ) ) ( not ( = ?auto_2675667 ?auto_2675668 ) ) ( not ( = ?auto_2675667 ?auto_2675670 ) ) ( not ( = ?auto_2675667 ?auto_2675669 ) ) ( not ( = ?auto_2675667 ?auto_2675671 ) ) ( not ( = ?auto_2675667 ?auto_2675672 ) ) ( not ( = ?auto_2675667 ?auto_2675673 ) ) ( not ( = ?auto_2675667 ?auto_2675674 ) ) ( not ( = ?auto_2675667 ?auto_2675675 ) ) ( not ( = ?auto_2675667 ?auto_2675676 ) ) ( not ( = ?auto_2675667 ?auto_2675679 ) ) ( not ( = ?auto_2675668 ?auto_2675670 ) ) ( not ( = ?auto_2675668 ?auto_2675669 ) ) ( not ( = ?auto_2675668 ?auto_2675671 ) ) ( not ( = ?auto_2675668 ?auto_2675672 ) ) ( not ( = ?auto_2675668 ?auto_2675673 ) ) ( not ( = ?auto_2675668 ?auto_2675674 ) ) ( not ( = ?auto_2675668 ?auto_2675675 ) ) ( not ( = ?auto_2675668 ?auto_2675676 ) ) ( not ( = ?auto_2675668 ?auto_2675679 ) ) ( not ( = ?auto_2675670 ?auto_2675669 ) ) ( not ( = ?auto_2675670 ?auto_2675671 ) ) ( not ( = ?auto_2675670 ?auto_2675672 ) ) ( not ( = ?auto_2675670 ?auto_2675673 ) ) ( not ( = ?auto_2675670 ?auto_2675674 ) ) ( not ( = ?auto_2675670 ?auto_2675675 ) ) ( not ( = ?auto_2675670 ?auto_2675676 ) ) ( not ( = ?auto_2675670 ?auto_2675679 ) ) ( not ( = ?auto_2675669 ?auto_2675671 ) ) ( not ( = ?auto_2675669 ?auto_2675672 ) ) ( not ( = ?auto_2675669 ?auto_2675673 ) ) ( not ( = ?auto_2675669 ?auto_2675674 ) ) ( not ( = ?auto_2675669 ?auto_2675675 ) ) ( not ( = ?auto_2675669 ?auto_2675676 ) ) ( not ( = ?auto_2675669 ?auto_2675679 ) ) ( not ( = ?auto_2675671 ?auto_2675672 ) ) ( not ( = ?auto_2675671 ?auto_2675673 ) ) ( not ( = ?auto_2675671 ?auto_2675674 ) ) ( not ( = ?auto_2675671 ?auto_2675675 ) ) ( not ( = ?auto_2675671 ?auto_2675676 ) ) ( not ( = ?auto_2675671 ?auto_2675679 ) ) ( not ( = ?auto_2675672 ?auto_2675673 ) ) ( not ( = ?auto_2675672 ?auto_2675674 ) ) ( not ( = ?auto_2675672 ?auto_2675675 ) ) ( not ( = ?auto_2675672 ?auto_2675676 ) ) ( not ( = ?auto_2675672 ?auto_2675679 ) ) ( not ( = ?auto_2675673 ?auto_2675674 ) ) ( not ( = ?auto_2675673 ?auto_2675675 ) ) ( not ( = ?auto_2675673 ?auto_2675676 ) ) ( not ( = ?auto_2675673 ?auto_2675679 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2675674 ?auto_2675675 ?auto_2675676 )
      ( MAKE-10CRATE-VERIFY ?auto_2675666 ?auto_2675667 ?auto_2675668 ?auto_2675670 ?auto_2675669 ?auto_2675671 ?auto_2675672 ?auto_2675673 ?auto_2675674 ?auto_2675675 ?auto_2675676 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2675792 - SURFACE
      ?auto_2675793 - SURFACE
      ?auto_2675794 - SURFACE
      ?auto_2675796 - SURFACE
      ?auto_2675795 - SURFACE
      ?auto_2675797 - SURFACE
      ?auto_2675798 - SURFACE
      ?auto_2675799 - SURFACE
      ?auto_2675800 - SURFACE
      ?auto_2675801 - SURFACE
      ?auto_2675802 - SURFACE
    )
    :vars
    (
      ?auto_2675807 - HOIST
      ?auto_2675805 - PLACE
      ?auto_2675806 - PLACE
      ?auto_2675803 - HOIST
      ?auto_2675808 - SURFACE
      ?auto_2675804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2675807 ?auto_2675805 ) ( SURFACE-AT ?auto_2675801 ?auto_2675805 ) ( CLEAR ?auto_2675801 ) ( IS-CRATE ?auto_2675802 ) ( not ( = ?auto_2675801 ?auto_2675802 ) ) ( AVAILABLE ?auto_2675807 ) ( ON ?auto_2675801 ?auto_2675800 ) ( not ( = ?auto_2675800 ?auto_2675801 ) ) ( not ( = ?auto_2675800 ?auto_2675802 ) ) ( not ( = ?auto_2675806 ?auto_2675805 ) ) ( HOIST-AT ?auto_2675803 ?auto_2675806 ) ( not ( = ?auto_2675807 ?auto_2675803 ) ) ( AVAILABLE ?auto_2675803 ) ( SURFACE-AT ?auto_2675802 ?auto_2675806 ) ( ON ?auto_2675802 ?auto_2675808 ) ( CLEAR ?auto_2675802 ) ( not ( = ?auto_2675801 ?auto_2675808 ) ) ( not ( = ?auto_2675802 ?auto_2675808 ) ) ( not ( = ?auto_2675800 ?auto_2675808 ) ) ( TRUCK-AT ?auto_2675804 ?auto_2675805 ) ( ON ?auto_2675793 ?auto_2675792 ) ( ON ?auto_2675794 ?auto_2675793 ) ( ON ?auto_2675796 ?auto_2675794 ) ( ON ?auto_2675795 ?auto_2675796 ) ( ON ?auto_2675797 ?auto_2675795 ) ( ON ?auto_2675798 ?auto_2675797 ) ( ON ?auto_2675799 ?auto_2675798 ) ( ON ?auto_2675800 ?auto_2675799 ) ( not ( = ?auto_2675792 ?auto_2675793 ) ) ( not ( = ?auto_2675792 ?auto_2675794 ) ) ( not ( = ?auto_2675792 ?auto_2675796 ) ) ( not ( = ?auto_2675792 ?auto_2675795 ) ) ( not ( = ?auto_2675792 ?auto_2675797 ) ) ( not ( = ?auto_2675792 ?auto_2675798 ) ) ( not ( = ?auto_2675792 ?auto_2675799 ) ) ( not ( = ?auto_2675792 ?auto_2675800 ) ) ( not ( = ?auto_2675792 ?auto_2675801 ) ) ( not ( = ?auto_2675792 ?auto_2675802 ) ) ( not ( = ?auto_2675792 ?auto_2675808 ) ) ( not ( = ?auto_2675793 ?auto_2675794 ) ) ( not ( = ?auto_2675793 ?auto_2675796 ) ) ( not ( = ?auto_2675793 ?auto_2675795 ) ) ( not ( = ?auto_2675793 ?auto_2675797 ) ) ( not ( = ?auto_2675793 ?auto_2675798 ) ) ( not ( = ?auto_2675793 ?auto_2675799 ) ) ( not ( = ?auto_2675793 ?auto_2675800 ) ) ( not ( = ?auto_2675793 ?auto_2675801 ) ) ( not ( = ?auto_2675793 ?auto_2675802 ) ) ( not ( = ?auto_2675793 ?auto_2675808 ) ) ( not ( = ?auto_2675794 ?auto_2675796 ) ) ( not ( = ?auto_2675794 ?auto_2675795 ) ) ( not ( = ?auto_2675794 ?auto_2675797 ) ) ( not ( = ?auto_2675794 ?auto_2675798 ) ) ( not ( = ?auto_2675794 ?auto_2675799 ) ) ( not ( = ?auto_2675794 ?auto_2675800 ) ) ( not ( = ?auto_2675794 ?auto_2675801 ) ) ( not ( = ?auto_2675794 ?auto_2675802 ) ) ( not ( = ?auto_2675794 ?auto_2675808 ) ) ( not ( = ?auto_2675796 ?auto_2675795 ) ) ( not ( = ?auto_2675796 ?auto_2675797 ) ) ( not ( = ?auto_2675796 ?auto_2675798 ) ) ( not ( = ?auto_2675796 ?auto_2675799 ) ) ( not ( = ?auto_2675796 ?auto_2675800 ) ) ( not ( = ?auto_2675796 ?auto_2675801 ) ) ( not ( = ?auto_2675796 ?auto_2675802 ) ) ( not ( = ?auto_2675796 ?auto_2675808 ) ) ( not ( = ?auto_2675795 ?auto_2675797 ) ) ( not ( = ?auto_2675795 ?auto_2675798 ) ) ( not ( = ?auto_2675795 ?auto_2675799 ) ) ( not ( = ?auto_2675795 ?auto_2675800 ) ) ( not ( = ?auto_2675795 ?auto_2675801 ) ) ( not ( = ?auto_2675795 ?auto_2675802 ) ) ( not ( = ?auto_2675795 ?auto_2675808 ) ) ( not ( = ?auto_2675797 ?auto_2675798 ) ) ( not ( = ?auto_2675797 ?auto_2675799 ) ) ( not ( = ?auto_2675797 ?auto_2675800 ) ) ( not ( = ?auto_2675797 ?auto_2675801 ) ) ( not ( = ?auto_2675797 ?auto_2675802 ) ) ( not ( = ?auto_2675797 ?auto_2675808 ) ) ( not ( = ?auto_2675798 ?auto_2675799 ) ) ( not ( = ?auto_2675798 ?auto_2675800 ) ) ( not ( = ?auto_2675798 ?auto_2675801 ) ) ( not ( = ?auto_2675798 ?auto_2675802 ) ) ( not ( = ?auto_2675798 ?auto_2675808 ) ) ( not ( = ?auto_2675799 ?auto_2675800 ) ) ( not ( = ?auto_2675799 ?auto_2675801 ) ) ( not ( = ?auto_2675799 ?auto_2675802 ) ) ( not ( = ?auto_2675799 ?auto_2675808 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2675800 ?auto_2675801 ?auto_2675802 )
      ( MAKE-10CRATE-VERIFY ?auto_2675792 ?auto_2675793 ?auto_2675794 ?auto_2675796 ?auto_2675795 ?auto_2675797 ?auto_2675798 ?auto_2675799 ?auto_2675800 ?auto_2675801 ?auto_2675802 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2675918 - SURFACE
      ?auto_2675919 - SURFACE
      ?auto_2675920 - SURFACE
      ?auto_2675922 - SURFACE
      ?auto_2675921 - SURFACE
      ?auto_2675923 - SURFACE
      ?auto_2675924 - SURFACE
      ?auto_2675925 - SURFACE
      ?auto_2675926 - SURFACE
      ?auto_2675927 - SURFACE
      ?auto_2675928 - SURFACE
    )
    :vars
    (
      ?auto_2675930 - HOIST
      ?auto_2675933 - PLACE
      ?auto_2675932 - PLACE
      ?auto_2675934 - HOIST
      ?auto_2675931 - SURFACE
      ?auto_2675929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2675930 ?auto_2675933 ) ( IS-CRATE ?auto_2675928 ) ( not ( = ?auto_2675927 ?auto_2675928 ) ) ( not ( = ?auto_2675926 ?auto_2675927 ) ) ( not ( = ?auto_2675926 ?auto_2675928 ) ) ( not ( = ?auto_2675932 ?auto_2675933 ) ) ( HOIST-AT ?auto_2675934 ?auto_2675932 ) ( not ( = ?auto_2675930 ?auto_2675934 ) ) ( AVAILABLE ?auto_2675934 ) ( SURFACE-AT ?auto_2675928 ?auto_2675932 ) ( ON ?auto_2675928 ?auto_2675931 ) ( CLEAR ?auto_2675928 ) ( not ( = ?auto_2675927 ?auto_2675931 ) ) ( not ( = ?auto_2675928 ?auto_2675931 ) ) ( not ( = ?auto_2675926 ?auto_2675931 ) ) ( TRUCK-AT ?auto_2675929 ?auto_2675933 ) ( SURFACE-AT ?auto_2675926 ?auto_2675933 ) ( CLEAR ?auto_2675926 ) ( LIFTING ?auto_2675930 ?auto_2675927 ) ( IS-CRATE ?auto_2675927 ) ( ON ?auto_2675919 ?auto_2675918 ) ( ON ?auto_2675920 ?auto_2675919 ) ( ON ?auto_2675922 ?auto_2675920 ) ( ON ?auto_2675921 ?auto_2675922 ) ( ON ?auto_2675923 ?auto_2675921 ) ( ON ?auto_2675924 ?auto_2675923 ) ( ON ?auto_2675925 ?auto_2675924 ) ( ON ?auto_2675926 ?auto_2675925 ) ( not ( = ?auto_2675918 ?auto_2675919 ) ) ( not ( = ?auto_2675918 ?auto_2675920 ) ) ( not ( = ?auto_2675918 ?auto_2675922 ) ) ( not ( = ?auto_2675918 ?auto_2675921 ) ) ( not ( = ?auto_2675918 ?auto_2675923 ) ) ( not ( = ?auto_2675918 ?auto_2675924 ) ) ( not ( = ?auto_2675918 ?auto_2675925 ) ) ( not ( = ?auto_2675918 ?auto_2675926 ) ) ( not ( = ?auto_2675918 ?auto_2675927 ) ) ( not ( = ?auto_2675918 ?auto_2675928 ) ) ( not ( = ?auto_2675918 ?auto_2675931 ) ) ( not ( = ?auto_2675919 ?auto_2675920 ) ) ( not ( = ?auto_2675919 ?auto_2675922 ) ) ( not ( = ?auto_2675919 ?auto_2675921 ) ) ( not ( = ?auto_2675919 ?auto_2675923 ) ) ( not ( = ?auto_2675919 ?auto_2675924 ) ) ( not ( = ?auto_2675919 ?auto_2675925 ) ) ( not ( = ?auto_2675919 ?auto_2675926 ) ) ( not ( = ?auto_2675919 ?auto_2675927 ) ) ( not ( = ?auto_2675919 ?auto_2675928 ) ) ( not ( = ?auto_2675919 ?auto_2675931 ) ) ( not ( = ?auto_2675920 ?auto_2675922 ) ) ( not ( = ?auto_2675920 ?auto_2675921 ) ) ( not ( = ?auto_2675920 ?auto_2675923 ) ) ( not ( = ?auto_2675920 ?auto_2675924 ) ) ( not ( = ?auto_2675920 ?auto_2675925 ) ) ( not ( = ?auto_2675920 ?auto_2675926 ) ) ( not ( = ?auto_2675920 ?auto_2675927 ) ) ( not ( = ?auto_2675920 ?auto_2675928 ) ) ( not ( = ?auto_2675920 ?auto_2675931 ) ) ( not ( = ?auto_2675922 ?auto_2675921 ) ) ( not ( = ?auto_2675922 ?auto_2675923 ) ) ( not ( = ?auto_2675922 ?auto_2675924 ) ) ( not ( = ?auto_2675922 ?auto_2675925 ) ) ( not ( = ?auto_2675922 ?auto_2675926 ) ) ( not ( = ?auto_2675922 ?auto_2675927 ) ) ( not ( = ?auto_2675922 ?auto_2675928 ) ) ( not ( = ?auto_2675922 ?auto_2675931 ) ) ( not ( = ?auto_2675921 ?auto_2675923 ) ) ( not ( = ?auto_2675921 ?auto_2675924 ) ) ( not ( = ?auto_2675921 ?auto_2675925 ) ) ( not ( = ?auto_2675921 ?auto_2675926 ) ) ( not ( = ?auto_2675921 ?auto_2675927 ) ) ( not ( = ?auto_2675921 ?auto_2675928 ) ) ( not ( = ?auto_2675921 ?auto_2675931 ) ) ( not ( = ?auto_2675923 ?auto_2675924 ) ) ( not ( = ?auto_2675923 ?auto_2675925 ) ) ( not ( = ?auto_2675923 ?auto_2675926 ) ) ( not ( = ?auto_2675923 ?auto_2675927 ) ) ( not ( = ?auto_2675923 ?auto_2675928 ) ) ( not ( = ?auto_2675923 ?auto_2675931 ) ) ( not ( = ?auto_2675924 ?auto_2675925 ) ) ( not ( = ?auto_2675924 ?auto_2675926 ) ) ( not ( = ?auto_2675924 ?auto_2675927 ) ) ( not ( = ?auto_2675924 ?auto_2675928 ) ) ( not ( = ?auto_2675924 ?auto_2675931 ) ) ( not ( = ?auto_2675925 ?auto_2675926 ) ) ( not ( = ?auto_2675925 ?auto_2675927 ) ) ( not ( = ?auto_2675925 ?auto_2675928 ) ) ( not ( = ?auto_2675925 ?auto_2675931 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2675926 ?auto_2675927 ?auto_2675928 )
      ( MAKE-10CRATE-VERIFY ?auto_2675918 ?auto_2675919 ?auto_2675920 ?auto_2675922 ?auto_2675921 ?auto_2675923 ?auto_2675924 ?auto_2675925 ?auto_2675926 ?auto_2675927 ?auto_2675928 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2676044 - SURFACE
      ?auto_2676045 - SURFACE
      ?auto_2676046 - SURFACE
      ?auto_2676048 - SURFACE
      ?auto_2676047 - SURFACE
      ?auto_2676049 - SURFACE
      ?auto_2676050 - SURFACE
      ?auto_2676051 - SURFACE
      ?auto_2676052 - SURFACE
      ?auto_2676053 - SURFACE
      ?auto_2676054 - SURFACE
    )
    :vars
    (
      ?auto_2676055 - HOIST
      ?auto_2676056 - PLACE
      ?auto_2676058 - PLACE
      ?auto_2676060 - HOIST
      ?auto_2676057 - SURFACE
      ?auto_2676059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2676055 ?auto_2676056 ) ( IS-CRATE ?auto_2676054 ) ( not ( = ?auto_2676053 ?auto_2676054 ) ) ( not ( = ?auto_2676052 ?auto_2676053 ) ) ( not ( = ?auto_2676052 ?auto_2676054 ) ) ( not ( = ?auto_2676058 ?auto_2676056 ) ) ( HOIST-AT ?auto_2676060 ?auto_2676058 ) ( not ( = ?auto_2676055 ?auto_2676060 ) ) ( AVAILABLE ?auto_2676060 ) ( SURFACE-AT ?auto_2676054 ?auto_2676058 ) ( ON ?auto_2676054 ?auto_2676057 ) ( CLEAR ?auto_2676054 ) ( not ( = ?auto_2676053 ?auto_2676057 ) ) ( not ( = ?auto_2676054 ?auto_2676057 ) ) ( not ( = ?auto_2676052 ?auto_2676057 ) ) ( TRUCK-AT ?auto_2676059 ?auto_2676056 ) ( SURFACE-AT ?auto_2676052 ?auto_2676056 ) ( CLEAR ?auto_2676052 ) ( IS-CRATE ?auto_2676053 ) ( AVAILABLE ?auto_2676055 ) ( IN ?auto_2676053 ?auto_2676059 ) ( ON ?auto_2676045 ?auto_2676044 ) ( ON ?auto_2676046 ?auto_2676045 ) ( ON ?auto_2676048 ?auto_2676046 ) ( ON ?auto_2676047 ?auto_2676048 ) ( ON ?auto_2676049 ?auto_2676047 ) ( ON ?auto_2676050 ?auto_2676049 ) ( ON ?auto_2676051 ?auto_2676050 ) ( ON ?auto_2676052 ?auto_2676051 ) ( not ( = ?auto_2676044 ?auto_2676045 ) ) ( not ( = ?auto_2676044 ?auto_2676046 ) ) ( not ( = ?auto_2676044 ?auto_2676048 ) ) ( not ( = ?auto_2676044 ?auto_2676047 ) ) ( not ( = ?auto_2676044 ?auto_2676049 ) ) ( not ( = ?auto_2676044 ?auto_2676050 ) ) ( not ( = ?auto_2676044 ?auto_2676051 ) ) ( not ( = ?auto_2676044 ?auto_2676052 ) ) ( not ( = ?auto_2676044 ?auto_2676053 ) ) ( not ( = ?auto_2676044 ?auto_2676054 ) ) ( not ( = ?auto_2676044 ?auto_2676057 ) ) ( not ( = ?auto_2676045 ?auto_2676046 ) ) ( not ( = ?auto_2676045 ?auto_2676048 ) ) ( not ( = ?auto_2676045 ?auto_2676047 ) ) ( not ( = ?auto_2676045 ?auto_2676049 ) ) ( not ( = ?auto_2676045 ?auto_2676050 ) ) ( not ( = ?auto_2676045 ?auto_2676051 ) ) ( not ( = ?auto_2676045 ?auto_2676052 ) ) ( not ( = ?auto_2676045 ?auto_2676053 ) ) ( not ( = ?auto_2676045 ?auto_2676054 ) ) ( not ( = ?auto_2676045 ?auto_2676057 ) ) ( not ( = ?auto_2676046 ?auto_2676048 ) ) ( not ( = ?auto_2676046 ?auto_2676047 ) ) ( not ( = ?auto_2676046 ?auto_2676049 ) ) ( not ( = ?auto_2676046 ?auto_2676050 ) ) ( not ( = ?auto_2676046 ?auto_2676051 ) ) ( not ( = ?auto_2676046 ?auto_2676052 ) ) ( not ( = ?auto_2676046 ?auto_2676053 ) ) ( not ( = ?auto_2676046 ?auto_2676054 ) ) ( not ( = ?auto_2676046 ?auto_2676057 ) ) ( not ( = ?auto_2676048 ?auto_2676047 ) ) ( not ( = ?auto_2676048 ?auto_2676049 ) ) ( not ( = ?auto_2676048 ?auto_2676050 ) ) ( not ( = ?auto_2676048 ?auto_2676051 ) ) ( not ( = ?auto_2676048 ?auto_2676052 ) ) ( not ( = ?auto_2676048 ?auto_2676053 ) ) ( not ( = ?auto_2676048 ?auto_2676054 ) ) ( not ( = ?auto_2676048 ?auto_2676057 ) ) ( not ( = ?auto_2676047 ?auto_2676049 ) ) ( not ( = ?auto_2676047 ?auto_2676050 ) ) ( not ( = ?auto_2676047 ?auto_2676051 ) ) ( not ( = ?auto_2676047 ?auto_2676052 ) ) ( not ( = ?auto_2676047 ?auto_2676053 ) ) ( not ( = ?auto_2676047 ?auto_2676054 ) ) ( not ( = ?auto_2676047 ?auto_2676057 ) ) ( not ( = ?auto_2676049 ?auto_2676050 ) ) ( not ( = ?auto_2676049 ?auto_2676051 ) ) ( not ( = ?auto_2676049 ?auto_2676052 ) ) ( not ( = ?auto_2676049 ?auto_2676053 ) ) ( not ( = ?auto_2676049 ?auto_2676054 ) ) ( not ( = ?auto_2676049 ?auto_2676057 ) ) ( not ( = ?auto_2676050 ?auto_2676051 ) ) ( not ( = ?auto_2676050 ?auto_2676052 ) ) ( not ( = ?auto_2676050 ?auto_2676053 ) ) ( not ( = ?auto_2676050 ?auto_2676054 ) ) ( not ( = ?auto_2676050 ?auto_2676057 ) ) ( not ( = ?auto_2676051 ?auto_2676052 ) ) ( not ( = ?auto_2676051 ?auto_2676053 ) ) ( not ( = ?auto_2676051 ?auto_2676054 ) ) ( not ( = ?auto_2676051 ?auto_2676057 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2676052 ?auto_2676053 ?auto_2676054 )
      ( MAKE-10CRATE-VERIFY ?auto_2676044 ?auto_2676045 ?auto_2676046 ?auto_2676048 ?auto_2676047 ?auto_2676049 ?auto_2676050 ?auto_2676051 ?auto_2676052 ?auto_2676053 ?auto_2676054 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2683328 - SURFACE
      ?auto_2683329 - SURFACE
      ?auto_2683330 - SURFACE
      ?auto_2683332 - SURFACE
      ?auto_2683331 - SURFACE
      ?auto_2683333 - SURFACE
      ?auto_2683334 - SURFACE
      ?auto_2683335 - SURFACE
      ?auto_2683336 - SURFACE
      ?auto_2683337 - SURFACE
      ?auto_2683338 - SURFACE
      ?auto_2683339 - SURFACE
    )
    :vars
    (
      ?auto_2683340 - HOIST
      ?auto_2683341 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2683340 ?auto_2683341 ) ( SURFACE-AT ?auto_2683338 ?auto_2683341 ) ( CLEAR ?auto_2683338 ) ( LIFTING ?auto_2683340 ?auto_2683339 ) ( IS-CRATE ?auto_2683339 ) ( not ( = ?auto_2683338 ?auto_2683339 ) ) ( ON ?auto_2683329 ?auto_2683328 ) ( ON ?auto_2683330 ?auto_2683329 ) ( ON ?auto_2683332 ?auto_2683330 ) ( ON ?auto_2683331 ?auto_2683332 ) ( ON ?auto_2683333 ?auto_2683331 ) ( ON ?auto_2683334 ?auto_2683333 ) ( ON ?auto_2683335 ?auto_2683334 ) ( ON ?auto_2683336 ?auto_2683335 ) ( ON ?auto_2683337 ?auto_2683336 ) ( ON ?auto_2683338 ?auto_2683337 ) ( not ( = ?auto_2683328 ?auto_2683329 ) ) ( not ( = ?auto_2683328 ?auto_2683330 ) ) ( not ( = ?auto_2683328 ?auto_2683332 ) ) ( not ( = ?auto_2683328 ?auto_2683331 ) ) ( not ( = ?auto_2683328 ?auto_2683333 ) ) ( not ( = ?auto_2683328 ?auto_2683334 ) ) ( not ( = ?auto_2683328 ?auto_2683335 ) ) ( not ( = ?auto_2683328 ?auto_2683336 ) ) ( not ( = ?auto_2683328 ?auto_2683337 ) ) ( not ( = ?auto_2683328 ?auto_2683338 ) ) ( not ( = ?auto_2683328 ?auto_2683339 ) ) ( not ( = ?auto_2683329 ?auto_2683330 ) ) ( not ( = ?auto_2683329 ?auto_2683332 ) ) ( not ( = ?auto_2683329 ?auto_2683331 ) ) ( not ( = ?auto_2683329 ?auto_2683333 ) ) ( not ( = ?auto_2683329 ?auto_2683334 ) ) ( not ( = ?auto_2683329 ?auto_2683335 ) ) ( not ( = ?auto_2683329 ?auto_2683336 ) ) ( not ( = ?auto_2683329 ?auto_2683337 ) ) ( not ( = ?auto_2683329 ?auto_2683338 ) ) ( not ( = ?auto_2683329 ?auto_2683339 ) ) ( not ( = ?auto_2683330 ?auto_2683332 ) ) ( not ( = ?auto_2683330 ?auto_2683331 ) ) ( not ( = ?auto_2683330 ?auto_2683333 ) ) ( not ( = ?auto_2683330 ?auto_2683334 ) ) ( not ( = ?auto_2683330 ?auto_2683335 ) ) ( not ( = ?auto_2683330 ?auto_2683336 ) ) ( not ( = ?auto_2683330 ?auto_2683337 ) ) ( not ( = ?auto_2683330 ?auto_2683338 ) ) ( not ( = ?auto_2683330 ?auto_2683339 ) ) ( not ( = ?auto_2683332 ?auto_2683331 ) ) ( not ( = ?auto_2683332 ?auto_2683333 ) ) ( not ( = ?auto_2683332 ?auto_2683334 ) ) ( not ( = ?auto_2683332 ?auto_2683335 ) ) ( not ( = ?auto_2683332 ?auto_2683336 ) ) ( not ( = ?auto_2683332 ?auto_2683337 ) ) ( not ( = ?auto_2683332 ?auto_2683338 ) ) ( not ( = ?auto_2683332 ?auto_2683339 ) ) ( not ( = ?auto_2683331 ?auto_2683333 ) ) ( not ( = ?auto_2683331 ?auto_2683334 ) ) ( not ( = ?auto_2683331 ?auto_2683335 ) ) ( not ( = ?auto_2683331 ?auto_2683336 ) ) ( not ( = ?auto_2683331 ?auto_2683337 ) ) ( not ( = ?auto_2683331 ?auto_2683338 ) ) ( not ( = ?auto_2683331 ?auto_2683339 ) ) ( not ( = ?auto_2683333 ?auto_2683334 ) ) ( not ( = ?auto_2683333 ?auto_2683335 ) ) ( not ( = ?auto_2683333 ?auto_2683336 ) ) ( not ( = ?auto_2683333 ?auto_2683337 ) ) ( not ( = ?auto_2683333 ?auto_2683338 ) ) ( not ( = ?auto_2683333 ?auto_2683339 ) ) ( not ( = ?auto_2683334 ?auto_2683335 ) ) ( not ( = ?auto_2683334 ?auto_2683336 ) ) ( not ( = ?auto_2683334 ?auto_2683337 ) ) ( not ( = ?auto_2683334 ?auto_2683338 ) ) ( not ( = ?auto_2683334 ?auto_2683339 ) ) ( not ( = ?auto_2683335 ?auto_2683336 ) ) ( not ( = ?auto_2683335 ?auto_2683337 ) ) ( not ( = ?auto_2683335 ?auto_2683338 ) ) ( not ( = ?auto_2683335 ?auto_2683339 ) ) ( not ( = ?auto_2683336 ?auto_2683337 ) ) ( not ( = ?auto_2683336 ?auto_2683338 ) ) ( not ( = ?auto_2683336 ?auto_2683339 ) ) ( not ( = ?auto_2683337 ?auto_2683338 ) ) ( not ( = ?auto_2683337 ?auto_2683339 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2683338 ?auto_2683339 )
      ( MAKE-11CRATE-VERIFY ?auto_2683328 ?auto_2683329 ?auto_2683330 ?auto_2683332 ?auto_2683331 ?auto_2683333 ?auto_2683334 ?auto_2683335 ?auto_2683336 ?auto_2683337 ?auto_2683338 ?auto_2683339 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2683437 - SURFACE
      ?auto_2683438 - SURFACE
      ?auto_2683439 - SURFACE
      ?auto_2683441 - SURFACE
      ?auto_2683440 - SURFACE
      ?auto_2683442 - SURFACE
      ?auto_2683443 - SURFACE
      ?auto_2683444 - SURFACE
      ?auto_2683445 - SURFACE
      ?auto_2683446 - SURFACE
      ?auto_2683447 - SURFACE
      ?auto_2683448 - SURFACE
    )
    :vars
    (
      ?auto_2683451 - HOIST
      ?auto_2683449 - PLACE
      ?auto_2683450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2683451 ?auto_2683449 ) ( SURFACE-AT ?auto_2683447 ?auto_2683449 ) ( CLEAR ?auto_2683447 ) ( IS-CRATE ?auto_2683448 ) ( not ( = ?auto_2683447 ?auto_2683448 ) ) ( TRUCK-AT ?auto_2683450 ?auto_2683449 ) ( AVAILABLE ?auto_2683451 ) ( IN ?auto_2683448 ?auto_2683450 ) ( ON ?auto_2683447 ?auto_2683446 ) ( not ( = ?auto_2683446 ?auto_2683447 ) ) ( not ( = ?auto_2683446 ?auto_2683448 ) ) ( ON ?auto_2683438 ?auto_2683437 ) ( ON ?auto_2683439 ?auto_2683438 ) ( ON ?auto_2683441 ?auto_2683439 ) ( ON ?auto_2683440 ?auto_2683441 ) ( ON ?auto_2683442 ?auto_2683440 ) ( ON ?auto_2683443 ?auto_2683442 ) ( ON ?auto_2683444 ?auto_2683443 ) ( ON ?auto_2683445 ?auto_2683444 ) ( ON ?auto_2683446 ?auto_2683445 ) ( not ( = ?auto_2683437 ?auto_2683438 ) ) ( not ( = ?auto_2683437 ?auto_2683439 ) ) ( not ( = ?auto_2683437 ?auto_2683441 ) ) ( not ( = ?auto_2683437 ?auto_2683440 ) ) ( not ( = ?auto_2683437 ?auto_2683442 ) ) ( not ( = ?auto_2683437 ?auto_2683443 ) ) ( not ( = ?auto_2683437 ?auto_2683444 ) ) ( not ( = ?auto_2683437 ?auto_2683445 ) ) ( not ( = ?auto_2683437 ?auto_2683446 ) ) ( not ( = ?auto_2683437 ?auto_2683447 ) ) ( not ( = ?auto_2683437 ?auto_2683448 ) ) ( not ( = ?auto_2683438 ?auto_2683439 ) ) ( not ( = ?auto_2683438 ?auto_2683441 ) ) ( not ( = ?auto_2683438 ?auto_2683440 ) ) ( not ( = ?auto_2683438 ?auto_2683442 ) ) ( not ( = ?auto_2683438 ?auto_2683443 ) ) ( not ( = ?auto_2683438 ?auto_2683444 ) ) ( not ( = ?auto_2683438 ?auto_2683445 ) ) ( not ( = ?auto_2683438 ?auto_2683446 ) ) ( not ( = ?auto_2683438 ?auto_2683447 ) ) ( not ( = ?auto_2683438 ?auto_2683448 ) ) ( not ( = ?auto_2683439 ?auto_2683441 ) ) ( not ( = ?auto_2683439 ?auto_2683440 ) ) ( not ( = ?auto_2683439 ?auto_2683442 ) ) ( not ( = ?auto_2683439 ?auto_2683443 ) ) ( not ( = ?auto_2683439 ?auto_2683444 ) ) ( not ( = ?auto_2683439 ?auto_2683445 ) ) ( not ( = ?auto_2683439 ?auto_2683446 ) ) ( not ( = ?auto_2683439 ?auto_2683447 ) ) ( not ( = ?auto_2683439 ?auto_2683448 ) ) ( not ( = ?auto_2683441 ?auto_2683440 ) ) ( not ( = ?auto_2683441 ?auto_2683442 ) ) ( not ( = ?auto_2683441 ?auto_2683443 ) ) ( not ( = ?auto_2683441 ?auto_2683444 ) ) ( not ( = ?auto_2683441 ?auto_2683445 ) ) ( not ( = ?auto_2683441 ?auto_2683446 ) ) ( not ( = ?auto_2683441 ?auto_2683447 ) ) ( not ( = ?auto_2683441 ?auto_2683448 ) ) ( not ( = ?auto_2683440 ?auto_2683442 ) ) ( not ( = ?auto_2683440 ?auto_2683443 ) ) ( not ( = ?auto_2683440 ?auto_2683444 ) ) ( not ( = ?auto_2683440 ?auto_2683445 ) ) ( not ( = ?auto_2683440 ?auto_2683446 ) ) ( not ( = ?auto_2683440 ?auto_2683447 ) ) ( not ( = ?auto_2683440 ?auto_2683448 ) ) ( not ( = ?auto_2683442 ?auto_2683443 ) ) ( not ( = ?auto_2683442 ?auto_2683444 ) ) ( not ( = ?auto_2683442 ?auto_2683445 ) ) ( not ( = ?auto_2683442 ?auto_2683446 ) ) ( not ( = ?auto_2683442 ?auto_2683447 ) ) ( not ( = ?auto_2683442 ?auto_2683448 ) ) ( not ( = ?auto_2683443 ?auto_2683444 ) ) ( not ( = ?auto_2683443 ?auto_2683445 ) ) ( not ( = ?auto_2683443 ?auto_2683446 ) ) ( not ( = ?auto_2683443 ?auto_2683447 ) ) ( not ( = ?auto_2683443 ?auto_2683448 ) ) ( not ( = ?auto_2683444 ?auto_2683445 ) ) ( not ( = ?auto_2683444 ?auto_2683446 ) ) ( not ( = ?auto_2683444 ?auto_2683447 ) ) ( not ( = ?auto_2683444 ?auto_2683448 ) ) ( not ( = ?auto_2683445 ?auto_2683446 ) ) ( not ( = ?auto_2683445 ?auto_2683447 ) ) ( not ( = ?auto_2683445 ?auto_2683448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2683446 ?auto_2683447 ?auto_2683448 )
      ( MAKE-11CRATE-VERIFY ?auto_2683437 ?auto_2683438 ?auto_2683439 ?auto_2683441 ?auto_2683440 ?auto_2683442 ?auto_2683443 ?auto_2683444 ?auto_2683445 ?auto_2683446 ?auto_2683447 ?auto_2683448 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2683558 - SURFACE
      ?auto_2683559 - SURFACE
      ?auto_2683560 - SURFACE
      ?auto_2683562 - SURFACE
      ?auto_2683561 - SURFACE
      ?auto_2683563 - SURFACE
      ?auto_2683564 - SURFACE
      ?auto_2683565 - SURFACE
      ?auto_2683566 - SURFACE
      ?auto_2683567 - SURFACE
      ?auto_2683568 - SURFACE
      ?auto_2683569 - SURFACE
    )
    :vars
    (
      ?auto_2683572 - HOIST
      ?auto_2683571 - PLACE
      ?auto_2683573 - TRUCK
      ?auto_2683570 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2683572 ?auto_2683571 ) ( SURFACE-AT ?auto_2683568 ?auto_2683571 ) ( CLEAR ?auto_2683568 ) ( IS-CRATE ?auto_2683569 ) ( not ( = ?auto_2683568 ?auto_2683569 ) ) ( AVAILABLE ?auto_2683572 ) ( IN ?auto_2683569 ?auto_2683573 ) ( ON ?auto_2683568 ?auto_2683567 ) ( not ( = ?auto_2683567 ?auto_2683568 ) ) ( not ( = ?auto_2683567 ?auto_2683569 ) ) ( TRUCK-AT ?auto_2683573 ?auto_2683570 ) ( not ( = ?auto_2683570 ?auto_2683571 ) ) ( ON ?auto_2683559 ?auto_2683558 ) ( ON ?auto_2683560 ?auto_2683559 ) ( ON ?auto_2683562 ?auto_2683560 ) ( ON ?auto_2683561 ?auto_2683562 ) ( ON ?auto_2683563 ?auto_2683561 ) ( ON ?auto_2683564 ?auto_2683563 ) ( ON ?auto_2683565 ?auto_2683564 ) ( ON ?auto_2683566 ?auto_2683565 ) ( ON ?auto_2683567 ?auto_2683566 ) ( not ( = ?auto_2683558 ?auto_2683559 ) ) ( not ( = ?auto_2683558 ?auto_2683560 ) ) ( not ( = ?auto_2683558 ?auto_2683562 ) ) ( not ( = ?auto_2683558 ?auto_2683561 ) ) ( not ( = ?auto_2683558 ?auto_2683563 ) ) ( not ( = ?auto_2683558 ?auto_2683564 ) ) ( not ( = ?auto_2683558 ?auto_2683565 ) ) ( not ( = ?auto_2683558 ?auto_2683566 ) ) ( not ( = ?auto_2683558 ?auto_2683567 ) ) ( not ( = ?auto_2683558 ?auto_2683568 ) ) ( not ( = ?auto_2683558 ?auto_2683569 ) ) ( not ( = ?auto_2683559 ?auto_2683560 ) ) ( not ( = ?auto_2683559 ?auto_2683562 ) ) ( not ( = ?auto_2683559 ?auto_2683561 ) ) ( not ( = ?auto_2683559 ?auto_2683563 ) ) ( not ( = ?auto_2683559 ?auto_2683564 ) ) ( not ( = ?auto_2683559 ?auto_2683565 ) ) ( not ( = ?auto_2683559 ?auto_2683566 ) ) ( not ( = ?auto_2683559 ?auto_2683567 ) ) ( not ( = ?auto_2683559 ?auto_2683568 ) ) ( not ( = ?auto_2683559 ?auto_2683569 ) ) ( not ( = ?auto_2683560 ?auto_2683562 ) ) ( not ( = ?auto_2683560 ?auto_2683561 ) ) ( not ( = ?auto_2683560 ?auto_2683563 ) ) ( not ( = ?auto_2683560 ?auto_2683564 ) ) ( not ( = ?auto_2683560 ?auto_2683565 ) ) ( not ( = ?auto_2683560 ?auto_2683566 ) ) ( not ( = ?auto_2683560 ?auto_2683567 ) ) ( not ( = ?auto_2683560 ?auto_2683568 ) ) ( not ( = ?auto_2683560 ?auto_2683569 ) ) ( not ( = ?auto_2683562 ?auto_2683561 ) ) ( not ( = ?auto_2683562 ?auto_2683563 ) ) ( not ( = ?auto_2683562 ?auto_2683564 ) ) ( not ( = ?auto_2683562 ?auto_2683565 ) ) ( not ( = ?auto_2683562 ?auto_2683566 ) ) ( not ( = ?auto_2683562 ?auto_2683567 ) ) ( not ( = ?auto_2683562 ?auto_2683568 ) ) ( not ( = ?auto_2683562 ?auto_2683569 ) ) ( not ( = ?auto_2683561 ?auto_2683563 ) ) ( not ( = ?auto_2683561 ?auto_2683564 ) ) ( not ( = ?auto_2683561 ?auto_2683565 ) ) ( not ( = ?auto_2683561 ?auto_2683566 ) ) ( not ( = ?auto_2683561 ?auto_2683567 ) ) ( not ( = ?auto_2683561 ?auto_2683568 ) ) ( not ( = ?auto_2683561 ?auto_2683569 ) ) ( not ( = ?auto_2683563 ?auto_2683564 ) ) ( not ( = ?auto_2683563 ?auto_2683565 ) ) ( not ( = ?auto_2683563 ?auto_2683566 ) ) ( not ( = ?auto_2683563 ?auto_2683567 ) ) ( not ( = ?auto_2683563 ?auto_2683568 ) ) ( not ( = ?auto_2683563 ?auto_2683569 ) ) ( not ( = ?auto_2683564 ?auto_2683565 ) ) ( not ( = ?auto_2683564 ?auto_2683566 ) ) ( not ( = ?auto_2683564 ?auto_2683567 ) ) ( not ( = ?auto_2683564 ?auto_2683568 ) ) ( not ( = ?auto_2683564 ?auto_2683569 ) ) ( not ( = ?auto_2683565 ?auto_2683566 ) ) ( not ( = ?auto_2683565 ?auto_2683567 ) ) ( not ( = ?auto_2683565 ?auto_2683568 ) ) ( not ( = ?auto_2683565 ?auto_2683569 ) ) ( not ( = ?auto_2683566 ?auto_2683567 ) ) ( not ( = ?auto_2683566 ?auto_2683568 ) ) ( not ( = ?auto_2683566 ?auto_2683569 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2683567 ?auto_2683568 ?auto_2683569 )
      ( MAKE-11CRATE-VERIFY ?auto_2683558 ?auto_2683559 ?auto_2683560 ?auto_2683562 ?auto_2683561 ?auto_2683563 ?auto_2683564 ?auto_2683565 ?auto_2683566 ?auto_2683567 ?auto_2683568 ?auto_2683569 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2683690 - SURFACE
      ?auto_2683691 - SURFACE
      ?auto_2683692 - SURFACE
      ?auto_2683694 - SURFACE
      ?auto_2683693 - SURFACE
      ?auto_2683695 - SURFACE
      ?auto_2683696 - SURFACE
      ?auto_2683697 - SURFACE
      ?auto_2683698 - SURFACE
      ?auto_2683699 - SURFACE
      ?auto_2683700 - SURFACE
      ?auto_2683701 - SURFACE
    )
    :vars
    (
      ?auto_2683706 - HOIST
      ?auto_2683703 - PLACE
      ?auto_2683704 - TRUCK
      ?auto_2683702 - PLACE
      ?auto_2683705 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2683706 ?auto_2683703 ) ( SURFACE-AT ?auto_2683700 ?auto_2683703 ) ( CLEAR ?auto_2683700 ) ( IS-CRATE ?auto_2683701 ) ( not ( = ?auto_2683700 ?auto_2683701 ) ) ( AVAILABLE ?auto_2683706 ) ( ON ?auto_2683700 ?auto_2683699 ) ( not ( = ?auto_2683699 ?auto_2683700 ) ) ( not ( = ?auto_2683699 ?auto_2683701 ) ) ( TRUCK-AT ?auto_2683704 ?auto_2683702 ) ( not ( = ?auto_2683702 ?auto_2683703 ) ) ( HOIST-AT ?auto_2683705 ?auto_2683702 ) ( LIFTING ?auto_2683705 ?auto_2683701 ) ( not ( = ?auto_2683706 ?auto_2683705 ) ) ( ON ?auto_2683691 ?auto_2683690 ) ( ON ?auto_2683692 ?auto_2683691 ) ( ON ?auto_2683694 ?auto_2683692 ) ( ON ?auto_2683693 ?auto_2683694 ) ( ON ?auto_2683695 ?auto_2683693 ) ( ON ?auto_2683696 ?auto_2683695 ) ( ON ?auto_2683697 ?auto_2683696 ) ( ON ?auto_2683698 ?auto_2683697 ) ( ON ?auto_2683699 ?auto_2683698 ) ( not ( = ?auto_2683690 ?auto_2683691 ) ) ( not ( = ?auto_2683690 ?auto_2683692 ) ) ( not ( = ?auto_2683690 ?auto_2683694 ) ) ( not ( = ?auto_2683690 ?auto_2683693 ) ) ( not ( = ?auto_2683690 ?auto_2683695 ) ) ( not ( = ?auto_2683690 ?auto_2683696 ) ) ( not ( = ?auto_2683690 ?auto_2683697 ) ) ( not ( = ?auto_2683690 ?auto_2683698 ) ) ( not ( = ?auto_2683690 ?auto_2683699 ) ) ( not ( = ?auto_2683690 ?auto_2683700 ) ) ( not ( = ?auto_2683690 ?auto_2683701 ) ) ( not ( = ?auto_2683691 ?auto_2683692 ) ) ( not ( = ?auto_2683691 ?auto_2683694 ) ) ( not ( = ?auto_2683691 ?auto_2683693 ) ) ( not ( = ?auto_2683691 ?auto_2683695 ) ) ( not ( = ?auto_2683691 ?auto_2683696 ) ) ( not ( = ?auto_2683691 ?auto_2683697 ) ) ( not ( = ?auto_2683691 ?auto_2683698 ) ) ( not ( = ?auto_2683691 ?auto_2683699 ) ) ( not ( = ?auto_2683691 ?auto_2683700 ) ) ( not ( = ?auto_2683691 ?auto_2683701 ) ) ( not ( = ?auto_2683692 ?auto_2683694 ) ) ( not ( = ?auto_2683692 ?auto_2683693 ) ) ( not ( = ?auto_2683692 ?auto_2683695 ) ) ( not ( = ?auto_2683692 ?auto_2683696 ) ) ( not ( = ?auto_2683692 ?auto_2683697 ) ) ( not ( = ?auto_2683692 ?auto_2683698 ) ) ( not ( = ?auto_2683692 ?auto_2683699 ) ) ( not ( = ?auto_2683692 ?auto_2683700 ) ) ( not ( = ?auto_2683692 ?auto_2683701 ) ) ( not ( = ?auto_2683694 ?auto_2683693 ) ) ( not ( = ?auto_2683694 ?auto_2683695 ) ) ( not ( = ?auto_2683694 ?auto_2683696 ) ) ( not ( = ?auto_2683694 ?auto_2683697 ) ) ( not ( = ?auto_2683694 ?auto_2683698 ) ) ( not ( = ?auto_2683694 ?auto_2683699 ) ) ( not ( = ?auto_2683694 ?auto_2683700 ) ) ( not ( = ?auto_2683694 ?auto_2683701 ) ) ( not ( = ?auto_2683693 ?auto_2683695 ) ) ( not ( = ?auto_2683693 ?auto_2683696 ) ) ( not ( = ?auto_2683693 ?auto_2683697 ) ) ( not ( = ?auto_2683693 ?auto_2683698 ) ) ( not ( = ?auto_2683693 ?auto_2683699 ) ) ( not ( = ?auto_2683693 ?auto_2683700 ) ) ( not ( = ?auto_2683693 ?auto_2683701 ) ) ( not ( = ?auto_2683695 ?auto_2683696 ) ) ( not ( = ?auto_2683695 ?auto_2683697 ) ) ( not ( = ?auto_2683695 ?auto_2683698 ) ) ( not ( = ?auto_2683695 ?auto_2683699 ) ) ( not ( = ?auto_2683695 ?auto_2683700 ) ) ( not ( = ?auto_2683695 ?auto_2683701 ) ) ( not ( = ?auto_2683696 ?auto_2683697 ) ) ( not ( = ?auto_2683696 ?auto_2683698 ) ) ( not ( = ?auto_2683696 ?auto_2683699 ) ) ( not ( = ?auto_2683696 ?auto_2683700 ) ) ( not ( = ?auto_2683696 ?auto_2683701 ) ) ( not ( = ?auto_2683697 ?auto_2683698 ) ) ( not ( = ?auto_2683697 ?auto_2683699 ) ) ( not ( = ?auto_2683697 ?auto_2683700 ) ) ( not ( = ?auto_2683697 ?auto_2683701 ) ) ( not ( = ?auto_2683698 ?auto_2683699 ) ) ( not ( = ?auto_2683698 ?auto_2683700 ) ) ( not ( = ?auto_2683698 ?auto_2683701 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2683699 ?auto_2683700 ?auto_2683701 )
      ( MAKE-11CRATE-VERIFY ?auto_2683690 ?auto_2683691 ?auto_2683692 ?auto_2683694 ?auto_2683693 ?auto_2683695 ?auto_2683696 ?auto_2683697 ?auto_2683698 ?auto_2683699 ?auto_2683700 ?auto_2683701 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2683833 - SURFACE
      ?auto_2683834 - SURFACE
      ?auto_2683835 - SURFACE
      ?auto_2683837 - SURFACE
      ?auto_2683836 - SURFACE
      ?auto_2683838 - SURFACE
      ?auto_2683839 - SURFACE
      ?auto_2683840 - SURFACE
      ?auto_2683841 - SURFACE
      ?auto_2683842 - SURFACE
      ?auto_2683843 - SURFACE
      ?auto_2683844 - SURFACE
    )
    :vars
    (
      ?auto_2683848 - HOIST
      ?auto_2683847 - PLACE
      ?auto_2683849 - TRUCK
      ?auto_2683846 - PLACE
      ?auto_2683845 - HOIST
      ?auto_2683850 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2683848 ?auto_2683847 ) ( SURFACE-AT ?auto_2683843 ?auto_2683847 ) ( CLEAR ?auto_2683843 ) ( IS-CRATE ?auto_2683844 ) ( not ( = ?auto_2683843 ?auto_2683844 ) ) ( AVAILABLE ?auto_2683848 ) ( ON ?auto_2683843 ?auto_2683842 ) ( not ( = ?auto_2683842 ?auto_2683843 ) ) ( not ( = ?auto_2683842 ?auto_2683844 ) ) ( TRUCK-AT ?auto_2683849 ?auto_2683846 ) ( not ( = ?auto_2683846 ?auto_2683847 ) ) ( HOIST-AT ?auto_2683845 ?auto_2683846 ) ( not ( = ?auto_2683848 ?auto_2683845 ) ) ( AVAILABLE ?auto_2683845 ) ( SURFACE-AT ?auto_2683844 ?auto_2683846 ) ( ON ?auto_2683844 ?auto_2683850 ) ( CLEAR ?auto_2683844 ) ( not ( = ?auto_2683843 ?auto_2683850 ) ) ( not ( = ?auto_2683844 ?auto_2683850 ) ) ( not ( = ?auto_2683842 ?auto_2683850 ) ) ( ON ?auto_2683834 ?auto_2683833 ) ( ON ?auto_2683835 ?auto_2683834 ) ( ON ?auto_2683837 ?auto_2683835 ) ( ON ?auto_2683836 ?auto_2683837 ) ( ON ?auto_2683838 ?auto_2683836 ) ( ON ?auto_2683839 ?auto_2683838 ) ( ON ?auto_2683840 ?auto_2683839 ) ( ON ?auto_2683841 ?auto_2683840 ) ( ON ?auto_2683842 ?auto_2683841 ) ( not ( = ?auto_2683833 ?auto_2683834 ) ) ( not ( = ?auto_2683833 ?auto_2683835 ) ) ( not ( = ?auto_2683833 ?auto_2683837 ) ) ( not ( = ?auto_2683833 ?auto_2683836 ) ) ( not ( = ?auto_2683833 ?auto_2683838 ) ) ( not ( = ?auto_2683833 ?auto_2683839 ) ) ( not ( = ?auto_2683833 ?auto_2683840 ) ) ( not ( = ?auto_2683833 ?auto_2683841 ) ) ( not ( = ?auto_2683833 ?auto_2683842 ) ) ( not ( = ?auto_2683833 ?auto_2683843 ) ) ( not ( = ?auto_2683833 ?auto_2683844 ) ) ( not ( = ?auto_2683833 ?auto_2683850 ) ) ( not ( = ?auto_2683834 ?auto_2683835 ) ) ( not ( = ?auto_2683834 ?auto_2683837 ) ) ( not ( = ?auto_2683834 ?auto_2683836 ) ) ( not ( = ?auto_2683834 ?auto_2683838 ) ) ( not ( = ?auto_2683834 ?auto_2683839 ) ) ( not ( = ?auto_2683834 ?auto_2683840 ) ) ( not ( = ?auto_2683834 ?auto_2683841 ) ) ( not ( = ?auto_2683834 ?auto_2683842 ) ) ( not ( = ?auto_2683834 ?auto_2683843 ) ) ( not ( = ?auto_2683834 ?auto_2683844 ) ) ( not ( = ?auto_2683834 ?auto_2683850 ) ) ( not ( = ?auto_2683835 ?auto_2683837 ) ) ( not ( = ?auto_2683835 ?auto_2683836 ) ) ( not ( = ?auto_2683835 ?auto_2683838 ) ) ( not ( = ?auto_2683835 ?auto_2683839 ) ) ( not ( = ?auto_2683835 ?auto_2683840 ) ) ( not ( = ?auto_2683835 ?auto_2683841 ) ) ( not ( = ?auto_2683835 ?auto_2683842 ) ) ( not ( = ?auto_2683835 ?auto_2683843 ) ) ( not ( = ?auto_2683835 ?auto_2683844 ) ) ( not ( = ?auto_2683835 ?auto_2683850 ) ) ( not ( = ?auto_2683837 ?auto_2683836 ) ) ( not ( = ?auto_2683837 ?auto_2683838 ) ) ( not ( = ?auto_2683837 ?auto_2683839 ) ) ( not ( = ?auto_2683837 ?auto_2683840 ) ) ( not ( = ?auto_2683837 ?auto_2683841 ) ) ( not ( = ?auto_2683837 ?auto_2683842 ) ) ( not ( = ?auto_2683837 ?auto_2683843 ) ) ( not ( = ?auto_2683837 ?auto_2683844 ) ) ( not ( = ?auto_2683837 ?auto_2683850 ) ) ( not ( = ?auto_2683836 ?auto_2683838 ) ) ( not ( = ?auto_2683836 ?auto_2683839 ) ) ( not ( = ?auto_2683836 ?auto_2683840 ) ) ( not ( = ?auto_2683836 ?auto_2683841 ) ) ( not ( = ?auto_2683836 ?auto_2683842 ) ) ( not ( = ?auto_2683836 ?auto_2683843 ) ) ( not ( = ?auto_2683836 ?auto_2683844 ) ) ( not ( = ?auto_2683836 ?auto_2683850 ) ) ( not ( = ?auto_2683838 ?auto_2683839 ) ) ( not ( = ?auto_2683838 ?auto_2683840 ) ) ( not ( = ?auto_2683838 ?auto_2683841 ) ) ( not ( = ?auto_2683838 ?auto_2683842 ) ) ( not ( = ?auto_2683838 ?auto_2683843 ) ) ( not ( = ?auto_2683838 ?auto_2683844 ) ) ( not ( = ?auto_2683838 ?auto_2683850 ) ) ( not ( = ?auto_2683839 ?auto_2683840 ) ) ( not ( = ?auto_2683839 ?auto_2683841 ) ) ( not ( = ?auto_2683839 ?auto_2683842 ) ) ( not ( = ?auto_2683839 ?auto_2683843 ) ) ( not ( = ?auto_2683839 ?auto_2683844 ) ) ( not ( = ?auto_2683839 ?auto_2683850 ) ) ( not ( = ?auto_2683840 ?auto_2683841 ) ) ( not ( = ?auto_2683840 ?auto_2683842 ) ) ( not ( = ?auto_2683840 ?auto_2683843 ) ) ( not ( = ?auto_2683840 ?auto_2683844 ) ) ( not ( = ?auto_2683840 ?auto_2683850 ) ) ( not ( = ?auto_2683841 ?auto_2683842 ) ) ( not ( = ?auto_2683841 ?auto_2683843 ) ) ( not ( = ?auto_2683841 ?auto_2683844 ) ) ( not ( = ?auto_2683841 ?auto_2683850 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2683842 ?auto_2683843 ?auto_2683844 )
      ( MAKE-11CRATE-VERIFY ?auto_2683833 ?auto_2683834 ?auto_2683835 ?auto_2683837 ?auto_2683836 ?auto_2683838 ?auto_2683839 ?auto_2683840 ?auto_2683841 ?auto_2683842 ?auto_2683843 ?auto_2683844 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2683977 - SURFACE
      ?auto_2683978 - SURFACE
      ?auto_2683979 - SURFACE
      ?auto_2683981 - SURFACE
      ?auto_2683980 - SURFACE
      ?auto_2683982 - SURFACE
      ?auto_2683983 - SURFACE
      ?auto_2683984 - SURFACE
      ?auto_2683985 - SURFACE
      ?auto_2683986 - SURFACE
      ?auto_2683987 - SURFACE
      ?auto_2683988 - SURFACE
    )
    :vars
    (
      ?auto_2683994 - HOIST
      ?auto_2683992 - PLACE
      ?auto_2683991 - PLACE
      ?auto_2683989 - HOIST
      ?auto_2683990 - SURFACE
      ?auto_2683993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2683994 ?auto_2683992 ) ( SURFACE-AT ?auto_2683987 ?auto_2683992 ) ( CLEAR ?auto_2683987 ) ( IS-CRATE ?auto_2683988 ) ( not ( = ?auto_2683987 ?auto_2683988 ) ) ( AVAILABLE ?auto_2683994 ) ( ON ?auto_2683987 ?auto_2683986 ) ( not ( = ?auto_2683986 ?auto_2683987 ) ) ( not ( = ?auto_2683986 ?auto_2683988 ) ) ( not ( = ?auto_2683991 ?auto_2683992 ) ) ( HOIST-AT ?auto_2683989 ?auto_2683991 ) ( not ( = ?auto_2683994 ?auto_2683989 ) ) ( AVAILABLE ?auto_2683989 ) ( SURFACE-AT ?auto_2683988 ?auto_2683991 ) ( ON ?auto_2683988 ?auto_2683990 ) ( CLEAR ?auto_2683988 ) ( not ( = ?auto_2683987 ?auto_2683990 ) ) ( not ( = ?auto_2683988 ?auto_2683990 ) ) ( not ( = ?auto_2683986 ?auto_2683990 ) ) ( TRUCK-AT ?auto_2683993 ?auto_2683992 ) ( ON ?auto_2683978 ?auto_2683977 ) ( ON ?auto_2683979 ?auto_2683978 ) ( ON ?auto_2683981 ?auto_2683979 ) ( ON ?auto_2683980 ?auto_2683981 ) ( ON ?auto_2683982 ?auto_2683980 ) ( ON ?auto_2683983 ?auto_2683982 ) ( ON ?auto_2683984 ?auto_2683983 ) ( ON ?auto_2683985 ?auto_2683984 ) ( ON ?auto_2683986 ?auto_2683985 ) ( not ( = ?auto_2683977 ?auto_2683978 ) ) ( not ( = ?auto_2683977 ?auto_2683979 ) ) ( not ( = ?auto_2683977 ?auto_2683981 ) ) ( not ( = ?auto_2683977 ?auto_2683980 ) ) ( not ( = ?auto_2683977 ?auto_2683982 ) ) ( not ( = ?auto_2683977 ?auto_2683983 ) ) ( not ( = ?auto_2683977 ?auto_2683984 ) ) ( not ( = ?auto_2683977 ?auto_2683985 ) ) ( not ( = ?auto_2683977 ?auto_2683986 ) ) ( not ( = ?auto_2683977 ?auto_2683987 ) ) ( not ( = ?auto_2683977 ?auto_2683988 ) ) ( not ( = ?auto_2683977 ?auto_2683990 ) ) ( not ( = ?auto_2683978 ?auto_2683979 ) ) ( not ( = ?auto_2683978 ?auto_2683981 ) ) ( not ( = ?auto_2683978 ?auto_2683980 ) ) ( not ( = ?auto_2683978 ?auto_2683982 ) ) ( not ( = ?auto_2683978 ?auto_2683983 ) ) ( not ( = ?auto_2683978 ?auto_2683984 ) ) ( not ( = ?auto_2683978 ?auto_2683985 ) ) ( not ( = ?auto_2683978 ?auto_2683986 ) ) ( not ( = ?auto_2683978 ?auto_2683987 ) ) ( not ( = ?auto_2683978 ?auto_2683988 ) ) ( not ( = ?auto_2683978 ?auto_2683990 ) ) ( not ( = ?auto_2683979 ?auto_2683981 ) ) ( not ( = ?auto_2683979 ?auto_2683980 ) ) ( not ( = ?auto_2683979 ?auto_2683982 ) ) ( not ( = ?auto_2683979 ?auto_2683983 ) ) ( not ( = ?auto_2683979 ?auto_2683984 ) ) ( not ( = ?auto_2683979 ?auto_2683985 ) ) ( not ( = ?auto_2683979 ?auto_2683986 ) ) ( not ( = ?auto_2683979 ?auto_2683987 ) ) ( not ( = ?auto_2683979 ?auto_2683988 ) ) ( not ( = ?auto_2683979 ?auto_2683990 ) ) ( not ( = ?auto_2683981 ?auto_2683980 ) ) ( not ( = ?auto_2683981 ?auto_2683982 ) ) ( not ( = ?auto_2683981 ?auto_2683983 ) ) ( not ( = ?auto_2683981 ?auto_2683984 ) ) ( not ( = ?auto_2683981 ?auto_2683985 ) ) ( not ( = ?auto_2683981 ?auto_2683986 ) ) ( not ( = ?auto_2683981 ?auto_2683987 ) ) ( not ( = ?auto_2683981 ?auto_2683988 ) ) ( not ( = ?auto_2683981 ?auto_2683990 ) ) ( not ( = ?auto_2683980 ?auto_2683982 ) ) ( not ( = ?auto_2683980 ?auto_2683983 ) ) ( not ( = ?auto_2683980 ?auto_2683984 ) ) ( not ( = ?auto_2683980 ?auto_2683985 ) ) ( not ( = ?auto_2683980 ?auto_2683986 ) ) ( not ( = ?auto_2683980 ?auto_2683987 ) ) ( not ( = ?auto_2683980 ?auto_2683988 ) ) ( not ( = ?auto_2683980 ?auto_2683990 ) ) ( not ( = ?auto_2683982 ?auto_2683983 ) ) ( not ( = ?auto_2683982 ?auto_2683984 ) ) ( not ( = ?auto_2683982 ?auto_2683985 ) ) ( not ( = ?auto_2683982 ?auto_2683986 ) ) ( not ( = ?auto_2683982 ?auto_2683987 ) ) ( not ( = ?auto_2683982 ?auto_2683988 ) ) ( not ( = ?auto_2683982 ?auto_2683990 ) ) ( not ( = ?auto_2683983 ?auto_2683984 ) ) ( not ( = ?auto_2683983 ?auto_2683985 ) ) ( not ( = ?auto_2683983 ?auto_2683986 ) ) ( not ( = ?auto_2683983 ?auto_2683987 ) ) ( not ( = ?auto_2683983 ?auto_2683988 ) ) ( not ( = ?auto_2683983 ?auto_2683990 ) ) ( not ( = ?auto_2683984 ?auto_2683985 ) ) ( not ( = ?auto_2683984 ?auto_2683986 ) ) ( not ( = ?auto_2683984 ?auto_2683987 ) ) ( not ( = ?auto_2683984 ?auto_2683988 ) ) ( not ( = ?auto_2683984 ?auto_2683990 ) ) ( not ( = ?auto_2683985 ?auto_2683986 ) ) ( not ( = ?auto_2683985 ?auto_2683987 ) ) ( not ( = ?auto_2683985 ?auto_2683988 ) ) ( not ( = ?auto_2683985 ?auto_2683990 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2683986 ?auto_2683987 ?auto_2683988 )
      ( MAKE-11CRATE-VERIFY ?auto_2683977 ?auto_2683978 ?auto_2683979 ?auto_2683981 ?auto_2683980 ?auto_2683982 ?auto_2683983 ?auto_2683984 ?auto_2683985 ?auto_2683986 ?auto_2683987 ?auto_2683988 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2684121 - SURFACE
      ?auto_2684122 - SURFACE
      ?auto_2684123 - SURFACE
      ?auto_2684125 - SURFACE
      ?auto_2684124 - SURFACE
      ?auto_2684126 - SURFACE
      ?auto_2684127 - SURFACE
      ?auto_2684128 - SURFACE
      ?auto_2684129 - SURFACE
      ?auto_2684130 - SURFACE
      ?auto_2684131 - SURFACE
      ?auto_2684132 - SURFACE
    )
    :vars
    (
      ?auto_2684137 - HOIST
      ?auto_2684133 - PLACE
      ?auto_2684136 - PLACE
      ?auto_2684135 - HOIST
      ?auto_2684138 - SURFACE
      ?auto_2684134 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2684137 ?auto_2684133 ) ( IS-CRATE ?auto_2684132 ) ( not ( = ?auto_2684131 ?auto_2684132 ) ) ( not ( = ?auto_2684130 ?auto_2684131 ) ) ( not ( = ?auto_2684130 ?auto_2684132 ) ) ( not ( = ?auto_2684136 ?auto_2684133 ) ) ( HOIST-AT ?auto_2684135 ?auto_2684136 ) ( not ( = ?auto_2684137 ?auto_2684135 ) ) ( AVAILABLE ?auto_2684135 ) ( SURFACE-AT ?auto_2684132 ?auto_2684136 ) ( ON ?auto_2684132 ?auto_2684138 ) ( CLEAR ?auto_2684132 ) ( not ( = ?auto_2684131 ?auto_2684138 ) ) ( not ( = ?auto_2684132 ?auto_2684138 ) ) ( not ( = ?auto_2684130 ?auto_2684138 ) ) ( TRUCK-AT ?auto_2684134 ?auto_2684133 ) ( SURFACE-AT ?auto_2684130 ?auto_2684133 ) ( CLEAR ?auto_2684130 ) ( LIFTING ?auto_2684137 ?auto_2684131 ) ( IS-CRATE ?auto_2684131 ) ( ON ?auto_2684122 ?auto_2684121 ) ( ON ?auto_2684123 ?auto_2684122 ) ( ON ?auto_2684125 ?auto_2684123 ) ( ON ?auto_2684124 ?auto_2684125 ) ( ON ?auto_2684126 ?auto_2684124 ) ( ON ?auto_2684127 ?auto_2684126 ) ( ON ?auto_2684128 ?auto_2684127 ) ( ON ?auto_2684129 ?auto_2684128 ) ( ON ?auto_2684130 ?auto_2684129 ) ( not ( = ?auto_2684121 ?auto_2684122 ) ) ( not ( = ?auto_2684121 ?auto_2684123 ) ) ( not ( = ?auto_2684121 ?auto_2684125 ) ) ( not ( = ?auto_2684121 ?auto_2684124 ) ) ( not ( = ?auto_2684121 ?auto_2684126 ) ) ( not ( = ?auto_2684121 ?auto_2684127 ) ) ( not ( = ?auto_2684121 ?auto_2684128 ) ) ( not ( = ?auto_2684121 ?auto_2684129 ) ) ( not ( = ?auto_2684121 ?auto_2684130 ) ) ( not ( = ?auto_2684121 ?auto_2684131 ) ) ( not ( = ?auto_2684121 ?auto_2684132 ) ) ( not ( = ?auto_2684121 ?auto_2684138 ) ) ( not ( = ?auto_2684122 ?auto_2684123 ) ) ( not ( = ?auto_2684122 ?auto_2684125 ) ) ( not ( = ?auto_2684122 ?auto_2684124 ) ) ( not ( = ?auto_2684122 ?auto_2684126 ) ) ( not ( = ?auto_2684122 ?auto_2684127 ) ) ( not ( = ?auto_2684122 ?auto_2684128 ) ) ( not ( = ?auto_2684122 ?auto_2684129 ) ) ( not ( = ?auto_2684122 ?auto_2684130 ) ) ( not ( = ?auto_2684122 ?auto_2684131 ) ) ( not ( = ?auto_2684122 ?auto_2684132 ) ) ( not ( = ?auto_2684122 ?auto_2684138 ) ) ( not ( = ?auto_2684123 ?auto_2684125 ) ) ( not ( = ?auto_2684123 ?auto_2684124 ) ) ( not ( = ?auto_2684123 ?auto_2684126 ) ) ( not ( = ?auto_2684123 ?auto_2684127 ) ) ( not ( = ?auto_2684123 ?auto_2684128 ) ) ( not ( = ?auto_2684123 ?auto_2684129 ) ) ( not ( = ?auto_2684123 ?auto_2684130 ) ) ( not ( = ?auto_2684123 ?auto_2684131 ) ) ( not ( = ?auto_2684123 ?auto_2684132 ) ) ( not ( = ?auto_2684123 ?auto_2684138 ) ) ( not ( = ?auto_2684125 ?auto_2684124 ) ) ( not ( = ?auto_2684125 ?auto_2684126 ) ) ( not ( = ?auto_2684125 ?auto_2684127 ) ) ( not ( = ?auto_2684125 ?auto_2684128 ) ) ( not ( = ?auto_2684125 ?auto_2684129 ) ) ( not ( = ?auto_2684125 ?auto_2684130 ) ) ( not ( = ?auto_2684125 ?auto_2684131 ) ) ( not ( = ?auto_2684125 ?auto_2684132 ) ) ( not ( = ?auto_2684125 ?auto_2684138 ) ) ( not ( = ?auto_2684124 ?auto_2684126 ) ) ( not ( = ?auto_2684124 ?auto_2684127 ) ) ( not ( = ?auto_2684124 ?auto_2684128 ) ) ( not ( = ?auto_2684124 ?auto_2684129 ) ) ( not ( = ?auto_2684124 ?auto_2684130 ) ) ( not ( = ?auto_2684124 ?auto_2684131 ) ) ( not ( = ?auto_2684124 ?auto_2684132 ) ) ( not ( = ?auto_2684124 ?auto_2684138 ) ) ( not ( = ?auto_2684126 ?auto_2684127 ) ) ( not ( = ?auto_2684126 ?auto_2684128 ) ) ( not ( = ?auto_2684126 ?auto_2684129 ) ) ( not ( = ?auto_2684126 ?auto_2684130 ) ) ( not ( = ?auto_2684126 ?auto_2684131 ) ) ( not ( = ?auto_2684126 ?auto_2684132 ) ) ( not ( = ?auto_2684126 ?auto_2684138 ) ) ( not ( = ?auto_2684127 ?auto_2684128 ) ) ( not ( = ?auto_2684127 ?auto_2684129 ) ) ( not ( = ?auto_2684127 ?auto_2684130 ) ) ( not ( = ?auto_2684127 ?auto_2684131 ) ) ( not ( = ?auto_2684127 ?auto_2684132 ) ) ( not ( = ?auto_2684127 ?auto_2684138 ) ) ( not ( = ?auto_2684128 ?auto_2684129 ) ) ( not ( = ?auto_2684128 ?auto_2684130 ) ) ( not ( = ?auto_2684128 ?auto_2684131 ) ) ( not ( = ?auto_2684128 ?auto_2684132 ) ) ( not ( = ?auto_2684128 ?auto_2684138 ) ) ( not ( = ?auto_2684129 ?auto_2684130 ) ) ( not ( = ?auto_2684129 ?auto_2684131 ) ) ( not ( = ?auto_2684129 ?auto_2684132 ) ) ( not ( = ?auto_2684129 ?auto_2684138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2684130 ?auto_2684131 ?auto_2684132 )
      ( MAKE-11CRATE-VERIFY ?auto_2684121 ?auto_2684122 ?auto_2684123 ?auto_2684125 ?auto_2684124 ?auto_2684126 ?auto_2684127 ?auto_2684128 ?auto_2684129 ?auto_2684130 ?auto_2684131 ?auto_2684132 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2684265 - SURFACE
      ?auto_2684266 - SURFACE
      ?auto_2684267 - SURFACE
      ?auto_2684269 - SURFACE
      ?auto_2684268 - SURFACE
      ?auto_2684270 - SURFACE
      ?auto_2684271 - SURFACE
      ?auto_2684272 - SURFACE
      ?auto_2684273 - SURFACE
      ?auto_2684274 - SURFACE
      ?auto_2684275 - SURFACE
      ?auto_2684276 - SURFACE
    )
    :vars
    (
      ?auto_2684277 - HOIST
      ?auto_2684278 - PLACE
      ?auto_2684279 - PLACE
      ?auto_2684280 - HOIST
      ?auto_2684282 - SURFACE
      ?auto_2684281 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2684277 ?auto_2684278 ) ( IS-CRATE ?auto_2684276 ) ( not ( = ?auto_2684275 ?auto_2684276 ) ) ( not ( = ?auto_2684274 ?auto_2684275 ) ) ( not ( = ?auto_2684274 ?auto_2684276 ) ) ( not ( = ?auto_2684279 ?auto_2684278 ) ) ( HOIST-AT ?auto_2684280 ?auto_2684279 ) ( not ( = ?auto_2684277 ?auto_2684280 ) ) ( AVAILABLE ?auto_2684280 ) ( SURFACE-AT ?auto_2684276 ?auto_2684279 ) ( ON ?auto_2684276 ?auto_2684282 ) ( CLEAR ?auto_2684276 ) ( not ( = ?auto_2684275 ?auto_2684282 ) ) ( not ( = ?auto_2684276 ?auto_2684282 ) ) ( not ( = ?auto_2684274 ?auto_2684282 ) ) ( TRUCK-AT ?auto_2684281 ?auto_2684278 ) ( SURFACE-AT ?auto_2684274 ?auto_2684278 ) ( CLEAR ?auto_2684274 ) ( IS-CRATE ?auto_2684275 ) ( AVAILABLE ?auto_2684277 ) ( IN ?auto_2684275 ?auto_2684281 ) ( ON ?auto_2684266 ?auto_2684265 ) ( ON ?auto_2684267 ?auto_2684266 ) ( ON ?auto_2684269 ?auto_2684267 ) ( ON ?auto_2684268 ?auto_2684269 ) ( ON ?auto_2684270 ?auto_2684268 ) ( ON ?auto_2684271 ?auto_2684270 ) ( ON ?auto_2684272 ?auto_2684271 ) ( ON ?auto_2684273 ?auto_2684272 ) ( ON ?auto_2684274 ?auto_2684273 ) ( not ( = ?auto_2684265 ?auto_2684266 ) ) ( not ( = ?auto_2684265 ?auto_2684267 ) ) ( not ( = ?auto_2684265 ?auto_2684269 ) ) ( not ( = ?auto_2684265 ?auto_2684268 ) ) ( not ( = ?auto_2684265 ?auto_2684270 ) ) ( not ( = ?auto_2684265 ?auto_2684271 ) ) ( not ( = ?auto_2684265 ?auto_2684272 ) ) ( not ( = ?auto_2684265 ?auto_2684273 ) ) ( not ( = ?auto_2684265 ?auto_2684274 ) ) ( not ( = ?auto_2684265 ?auto_2684275 ) ) ( not ( = ?auto_2684265 ?auto_2684276 ) ) ( not ( = ?auto_2684265 ?auto_2684282 ) ) ( not ( = ?auto_2684266 ?auto_2684267 ) ) ( not ( = ?auto_2684266 ?auto_2684269 ) ) ( not ( = ?auto_2684266 ?auto_2684268 ) ) ( not ( = ?auto_2684266 ?auto_2684270 ) ) ( not ( = ?auto_2684266 ?auto_2684271 ) ) ( not ( = ?auto_2684266 ?auto_2684272 ) ) ( not ( = ?auto_2684266 ?auto_2684273 ) ) ( not ( = ?auto_2684266 ?auto_2684274 ) ) ( not ( = ?auto_2684266 ?auto_2684275 ) ) ( not ( = ?auto_2684266 ?auto_2684276 ) ) ( not ( = ?auto_2684266 ?auto_2684282 ) ) ( not ( = ?auto_2684267 ?auto_2684269 ) ) ( not ( = ?auto_2684267 ?auto_2684268 ) ) ( not ( = ?auto_2684267 ?auto_2684270 ) ) ( not ( = ?auto_2684267 ?auto_2684271 ) ) ( not ( = ?auto_2684267 ?auto_2684272 ) ) ( not ( = ?auto_2684267 ?auto_2684273 ) ) ( not ( = ?auto_2684267 ?auto_2684274 ) ) ( not ( = ?auto_2684267 ?auto_2684275 ) ) ( not ( = ?auto_2684267 ?auto_2684276 ) ) ( not ( = ?auto_2684267 ?auto_2684282 ) ) ( not ( = ?auto_2684269 ?auto_2684268 ) ) ( not ( = ?auto_2684269 ?auto_2684270 ) ) ( not ( = ?auto_2684269 ?auto_2684271 ) ) ( not ( = ?auto_2684269 ?auto_2684272 ) ) ( not ( = ?auto_2684269 ?auto_2684273 ) ) ( not ( = ?auto_2684269 ?auto_2684274 ) ) ( not ( = ?auto_2684269 ?auto_2684275 ) ) ( not ( = ?auto_2684269 ?auto_2684276 ) ) ( not ( = ?auto_2684269 ?auto_2684282 ) ) ( not ( = ?auto_2684268 ?auto_2684270 ) ) ( not ( = ?auto_2684268 ?auto_2684271 ) ) ( not ( = ?auto_2684268 ?auto_2684272 ) ) ( not ( = ?auto_2684268 ?auto_2684273 ) ) ( not ( = ?auto_2684268 ?auto_2684274 ) ) ( not ( = ?auto_2684268 ?auto_2684275 ) ) ( not ( = ?auto_2684268 ?auto_2684276 ) ) ( not ( = ?auto_2684268 ?auto_2684282 ) ) ( not ( = ?auto_2684270 ?auto_2684271 ) ) ( not ( = ?auto_2684270 ?auto_2684272 ) ) ( not ( = ?auto_2684270 ?auto_2684273 ) ) ( not ( = ?auto_2684270 ?auto_2684274 ) ) ( not ( = ?auto_2684270 ?auto_2684275 ) ) ( not ( = ?auto_2684270 ?auto_2684276 ) ) ( not ( = ?auto_2684270 ?auto_2684282 ) ) ( not ( = ?auto_2684271 ?auto_2684272 ) ) ( not ( = ?auto_2684271 ?auto_2684273 ) ) ( not ( = ?auto_2684271 ?auto_2684274 ) ) ( not ( = ?auto_2684271 ?auto_2684275 ) ) ( not ( = ?auto_2684271 ?auto_2684276 ) ) ( not ( = ?auto_2684271 ?auto_2684282 ) ) ( not ( = ?auto_2684272 ?auto_2684273 ) ) ( not ( = ?auto_2684272 ?auto_2684274 ) ) ( not ( = ?auto_2684272 ?auto_2684275 ) ) ( not ( = ?auto_2684272 ?auto_2684276 ) ) ( not ( = ?auto_2684272 ?auto_2684282 ) ) ( not ( = ?auto_2684273 ?auto_2684274 ) ) ( not ( = ?auto_2684273 ?auto_2684275 ) ) ( not ( = ?auto_2684273 ?auto_2684276 ) ) ( not ( = ?auto_2684273 ?auto_2684282 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2684274 ?auto_2684275 ?auto_2684276 )
      ( MAKE-11CRATE-VERIFY ?auto_2684265 ?auto_2684266 ?auto_2684267 ?auto_2684269 ?auto_2684268 ?auto_2684270 ?auto_2684271 ?auto_2684272 ?auto_2684273 ?auto_2684274 ?auto_2684275 ?auto_2684276 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2691944 - SURFACE
      ?auto_2691945 - SURFACE
    )
    :vars
    (
      ?auto_2691947 - HOIST
      ?auto_2691949 - PLACE
      ?auto_2691950 - SURFACE
      ?auto_2691951 - TRUCK
      ?auto_2691952 - PLACE
      ?auto_2691948 - HOIST
      ?auto_2691946 - SURFACE
      ?auto_2691953 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2691947 ?auto_2691949 ) ( SURFACE-AT ?auto_2691944 ?auto_2691949 ) ( CLEAR ?auto_2691944 ) ( IS-CRATE ?auto_2691945 ) ( not ( = ?auto_2691944 ?auto_2691945 ) ) ( AVAILABLE ?auto_2691947 ) ( ON ?auto_2691944 ?auto_2691950 ) ( not ( = ?auto_2691950 ?auto_2691944 ) ) ( not ( = ?auto_2691950 ?auto_2691945 ) ) ( TRUCK-AT ?auto_2691951 ?auto_2691952 ) ( not ( = ?auto_2691952 ?auto_2691949 ) ) ( HOIST-AT ?auto_2691948 ?auto_2691952 ) ( not ( = ?auto_2691947 ?auto_2691948 ) ) ( SURFACE-AT ?auto_2691945 ?auto_2691952 ) ( ON ?auto_2691945 ?auto_2691946 ) ( CLEAR ?auto_2691945 ) ( not ( = ?auto_2691944 ?auto_2691946 ) ) ( not ( = ?auto_2691945 ?auto_2691946 ) ) ( not ( = ?auto_2691950 ?auto_2691946 ) ) ( LIFTING ?auto_2691948 ?auto_2691953 ) ( IS-CRATE ?auto_2691953 ) ( not ( = ?auto_2691944 ?auto_2691953 ) ) ( not ( = ?auto_2691945 ?auto_2691953 ) ) ( not ( = ?auto_2691950 ?auto_2691953 ) ) ( not ( = ?auto_2691946 ?auto_2691953 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2691948 ?auto_2691953 ?auto_2691951 ?auto_2691952 )
      ( MAKE-1CRATE ?auto_2691944 ?auto_2691945 )
      ( MAKE-1CRATE-VERIFY ?auto_2691944 ?auto_2691945 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2693541 - SURFACE
      ?auto_2693542 - SURFACE
      ?auto_2693543 - SURFACE
      ?auto_2693545 - SURFACE
      ?auto_2693544 - SURFACE
      ?auto_2693546 - SURFACE
      ?auto_2693547 - SURFACE
      ?auto_2693548 - SURFACE
      ?auto_2693549 - SURFACE
      ?auto_2693550 - SURFACE
      ?auto_2693551 - SURFACE
      ?auto_2693552 - SURFACE
      ?auto_2693553 - SURFACE
    )
    :vars
    (
      ?auto_2693554 - HOIST
      ?auto_2693555 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2693554 ?auto_2693555 ) ( SURFACE-AT ?auto_2693552 ?auto_2693555 ) ( CLEAR ?auto_2693552 ) ( LIFTING ?auto_2693554 ?auto_2693553 ) ( IS-CRATE ?auto_2693553 ) ( not ( = ?auto_2693552 ?auto_2693553 ) ) ( ON ?auto_2693542 ?auto_2693541 ) ( ON ?auto_2693543 ?auto_2693542 ) ( ON ?auto_2693545 ?auto_2693543 ) ( ON ?auto_2693544 ?auto_2693545 ) ( ON ?auto_2693546 ?auto_2693544 ) ( ON ?auto_2693547 ?auto_2693546 ) ( ON ?auto_2693548 ?auto_2693547 ) ( ON ?auto_2693549 ?auto_2693548 ) ( ON ?auto_2693550 ?auto_2693549 ) ( ON ?auto_2693551 ?auto_2693550 ) ( ON ?auto_2693552 ?auto_2693551 ) ( not ( = ?auto_2693541 ?auto_2693542 ) ) ( not ( = ?auto_2693541 ?auto_2693543 ) ) ( not ( = ?auto_2693541 ?auto_2693545 ) ) ( not ( = ?auto_2693541 ?auto_2693544 ) ) ( not ( = ?auto_2693541 ?auto_2693546 ) ) ( not ( = ?auto_2693541 ?auto_2693547 ) ) ( not ( = ?auto_2693541 ?auto_2693548 ) ) ( not ( = ?auto_2693541 ?auto_2693549 ) ) ( not ( = ?auto_2693541 ?auto_2693550 ) ) ( not ( = ?auto_2693541 ?auto_2693551 ) ) ( not ( = ?auto_2693541 ?auto_2693552 ) ) ( not ( = ?auto_2693541 ?auto_2693553 ) ) ( not ( = ?auto_2693542 ?auto_2693543 ) ) ( not ( = ?auto_2693542 ?auto_2693545 ) ) ( not ( = ?auto_2693542 ?auto_2693544 ) ) ( not ( = ?auto_2693542 ?auto_2693546 ) ) ( not ( = ?auto_2693542 ?auto_2693547 ) ) ( not ( = ?auto_2693542 ?auto_2693548 ) ) ( not ( = ?auto_2693542 ?auto_2693549 ) ) ( not ( = ?auto_2693542 ?auto_2693550 ) ) ( not ( = ?auto_2693542 ?auto_2693551 ) ) ( not ( = ?auto_2693542 ?auto_2693552 ) ) ( not ( = ?auto_2693542 ?auto_2693553 ) ) ( not ( = ?auto_2693543 ?auto_2693545 ) ) ( not ( = ?auto_2693543 ?auto_2693544 ) ) ( not ( = ?auto_2693543 ?auto_2693546 ) ) ( not ( = ?auto_2693543 ?auto_2693547 ) ) ( not ( = ?auto_2693543 ?auto_2693548 ) ) ( not ( = ?auto_2693543 ?auto_2693549 ) ) ( not ( = ?auto_2693543 ?auto_2693550 ) ) ( not ( = ?auto_2693543 ?auto_2693551 ) ) ( not ( = ?auto_2693543 ?auto_2693552 ) ) ( not ( = ?auto_2693543 ?auto_2693553 ) ) ( not ( = ?auto_2693545 ?auto_2693544 ) ) ( not ( = ?auto_2693545 ?auto_2693546 ) ) ( not ( = ?auto_2693545 ?auto_2693547 ) ) ( not ( = ?auto_2693545 ?auto_2693548 ) ) ( not ( = ?auto_2693545 ?auto_2693549 ) ) ( not ( = ?auto_2693545 ?auto_2693550 ) ) ( not ( = ?auto_2693545 ?auto_2693551 ) ) ( not ( = ?auto_2693545 ?auto_2693552 ) ) ( not ( = ?auto_2693545 ?auto_2693553 ) ) ( not ( = ?auto_2693544 ?auto_2693546 ) ) ( not ( = ?auto_2693544 ?auto_2693547 ) ) ( not ( = ?auto_2693544 ?auto_2693548 ) ) ( not ( = ?auto_2693544 ?auto_2693549 ) ) ( not ( = ?auto_2693544 ?auto_2693550 ) ) ( not ( = ?auto_2693544 ?auto_2693551 ) ) ( not ( = ?auto_2693544 ?auto_2693552 ) ) ( not ( = ?auto_2693544 ?auto_2693553 ) ) ( not ( = ?auto_2693546 ?auto_2693547 ) ) ( not ( = ?auto_2693546 ?auto_2693548 ) ) ( not ( = ?auto_2693546 ?auto_2693549 ) ) ( not ( = ?auto_2693546 ?auto_2693550 ) ) ( not ( = ?auto_2693546 ?auto_2693551 ) ) ( not ( = ?auto_2693546 ?auto_2693552 ) ) ( not ( = ?auto_2693546 ?auto_2693553 ) ) ( not ( = ?auto_2693547 ?auto_2693548 ) ) ( not ( = ?auto_2693547 ?auto_2693549 ) ) ( not ( = ?auto_2693547 ?auto_2693550 ) ) ( not ( = ?auto_2693547 ?auto_2693551 ) ) ( not ( = ?auto_2693547 ?auto_2693552 ) ) ( not ( = ?auto_2693547 ?auto_2693553 ) ) ( not ( = ?auto_2693548 ?auto_2693549 ) ) ( not ( = ?auto_2693548 ?auto_2693550 ) ) ( not ( = ?auto_2693548 ?auto_2693551 ) ) ( not ( = ?auto_2693548 ?auto_2693552 ) ) ( not ( = ?auto_2693548 ?auto_2693553 ) ) ( not ( = ?auto_2693549 ?auto_2693550 ) ) ( not ( = ?auto_2693549 ?auto_2693551 ) ) ( not ( = ?auto_2693549 ?auto_2693552 ) ) ( not ( = ?auto_2693549 ?auto_2693553 ) ) ( not ( = ?auto_2693550 ?auto_2693551 ) ) ( not ( = ?auto_2693550 ?auto_2693552 ) ) ( not ( = ?auto_2693550 ?auto_2693553 ) ) ( not ( = ?auto_2693551 ?auto_2693552 ) ) ( not ( = ?auto_2693551 ?auto_2693553 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2693552 ?auto_2693553 )
      ( MAKE-12CRATE-VERIFY ?auto_2693541 ?auto_2693542 ?auto_2693543 ?auto_2693545 ?auto_2693544 ?auto_2693546 ?auto_2693547 ?auto_2693548 ?auto_2693549 ?auto_2693550 ?auto_2693551 ?auto_2693552 ?auto_2693553 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2693666 - SURFACE
      ?auto_2693667 - SURFACE
      ?auto_2693668 - SURFACE
      ?auto_2693670 - SURFACE
      ?auto_2693669 - SURFACE
      ?auto_2693671 - SURFACE
      ?auto_2693672 - SURFACE
      ?auto_2693673 - SURFACE
      ?auto_2693674 - SURFACE
      ?auto_2693675 - SURFACE
      ?auto_2693676 - SURFACE
      ?auto_2693677 - SURFACE
      ?auto_2693678 - SURFACE
    )
    :vars
    (
      ?auto_2693681 - HOIST
      ?auto_2693680 - PLACE
      ?auto_2693679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2693681 ?auto_2693680 ) ( SURFACE-AT ?auto_2693677 ?auto_2693680 ) ( CLEAR ?auto_2693677 ) ( IS-CRATE ?auto_2693678 ) ( not ( = ?auto_2693677 ?auto_2693678 ) ) ( TRUCK-AT ?auto_2693679 ?auto_2693680 ) ( AVAILABLE ?auto_2693681 ) ( IN ?auto_2693678 ?auto_2693679 ) ( ON ?auto_2693677 ?auto_2693676 ) ( not ( = ?auto_2693676 ?auto_2693677 ) ) ( not ( = ?auto_2693676 ?auto_2693678 ) ) ( ON ?auto_2693667 ?auto_2693666 ) ( ON ?auto_2693668 ?auto_2693667 ) ( ON ?auto_2693670 ?auto_2693668 ) ( ON ?auto_2693669 ?auto_2693670 ) ( ON ?auto_2693671 ?auto_2693669 ) ( ON ?auto_2693672 ?auto_2693671 ) ( ON ?auto_2693673 ?auto_2693672 ) ( ON ?auto_2693674 ?auto_2693673 ) ( ON ?auto_2693675 ?auto_2693674 ) ( ON ?auto_2693676 ?auto_2693675 ) ( not ( = ?auto_2693666 ?auto_2693667 ) ) ( not ( = ?auto_2693666 ?auto_2693668 ) ) ( not ( = ?auto_2693666 ?auto_2693670 ) ) ( not ( = ?auto_2693666 ?auto_2693669 ) ) ( not ( = ?auto_2693666 ?auto_2693671 ) ) ( not ( = ?auto_2693666 ?auto_2693672 ) ) ( not ( = ?auto_2693666 ?auto_2693673 ) ) ( not ( = ?auto_2693666 ?auto_2693674 ) ) ( not ( = ?auto_2693666 ?auto_2693675 ) ) ( not ( = ?auto_2693666 ?auto_2693676 ) ) ( not ( = ?auto_2693666 ?auto_2693677 ) ) ( not ( = ?auto_2693666 ?auto_2693678 ) ) ( not ( = ?auto_2693667 ?auto_2693668 ) ) ( not ( = ?auto_2693667 ?auto_2693670 ) ) ( not ( = ?auto_2693667 ?auto_2693669 ) ) ( not ( = ?auto_2693667 ?auto_2693671 ) ) ( not ( = ?auto_2693667 ?auto_2693672 ) ) ( not ( = ?auto_2693667 ?auto_2693673 ) ) ( not ( = ?auto_2693667 ?auto_2693674 ) ) ( not ( = ?auto_2693667 ?auto_2693675 ) ) ( not ( = ?auto_2693667 ?auto_2693676 ) ) ( not ( = ?auto_2693667 ?auto_2693677 ) ) ( not ( = ?auto_2693667 ?auto_2693678 ) ) ( not ( = ?auto_2693668 ?auto_2693670 ) ) ( not ( = ?auto_2693668 ?auto_2693669 ) ) ( not ( = ?auto_2693668 ?auto_2693671 ) ) ( not ( = ?auto_2693668 ?auto_2693672 ) ) ( not ( = ?auto_2693668 ?auto_2693673 ) ) ( not ( = ?auto_2693668 ?auto_2693674 ) ) ( not ( = ?auto_2693668 ?auto_2693675 ) ) ( not ( = ?auto_2693668 ?auto_2693676 ) ) ( not ( = ?auto_2693668 ?auto_2693677 ) ) ( not ( = ?auto_2693668 ?auto_2693678 ) ) ( not ( = ?auto_2693670 ?auto_2693669 ) ) ( not ( = ?auto_2693670 ?auto_2693671 ) ) ( not ( = ?auto_2693670 ?auto_2693672 ) ) ( not ( = ?auto_2693670 ?auto_2693673 ) ) ( not ( = ?auto_2693670 ?auto_2693674 ) ) ( not ( = ?auto_2693670 ?auto_2693675 ) ) ( not ( = ?auto_2693670 ?auto_2693676 ) ) ( not ( = ?auto_2693670 ?auto_2693677 ) ) ( not ( = ?auto_2693670 ?auto_2693678 ) ) ( not ( = ?auto_2693669 ?auto_2693671 ) ) ( not ( = ?auto_2693669 ?auto_2693672 ) ) ( not ( = ?auto_2693669 ?auto_2693673 ) ) ( not ( = ?auto_2693669 ?auto_2693674 ) ) ( not ( = ?auto_2693669 ?auto_2693675 ) ) ( not ( = ?auto_2693669 ?auto_2693676 ) ) ( not ( = ?auto_2693669 ?auto_2693677 ) ) ( not ( = ?auto_2693669 ?auto_2693678 ) ) ( not ( = ?auto_2693671 ?auto_2693672 ) ) ( not ( = ?auto_2693671 ?auto_2693673 ) ) ( not ( = ?auto_2693671 ?auto_2693674 ) ) ( not ( = ?auto_2693671 ?auto_2693675 ) ) ( not ( = ?auto_2693671 ?auto_2693676 ) ) ( not ( = ?auto_2693671 ?auto_2693677 ) ) ( not ( = ?auto_2693671 ?auto_2693678 ) ) ( not ( = ?auto_2693672 ?auto_2693673 ) ) ( not ( = ?auto_2693672 ?auto_2693674 ) ) ( not ( = ?auto_2693672 ?auto_2693675 ) ) ( not ( = ?auto_2693672 ?auto_2693676 ) ) ( not ( = ?auto_2693672 ?auto_2693677 ) ) ( not ( = ?auto_2693672 ?auto_2693678 ) ) ( not ( = ?auto_2693673 ?auto_2693674 ) ) ( not ( = ?auto_2693673 ?auto_2693675 ) ) ( not ( = ?auto_2693673 ?auto_2693676 ) ) ( not ( = ?auto_2693673 ?auto_2693677 ) ) ( not ( = ?auto_2693673 ?auto_2693678 ) ) ( not ( = ?auto_2693674 ?auto_2693675 ) ) ( not ( = ?auto_2693674 ?auto_2693676 ) ) ( not ( = ?auto_2693674 ?auto_2693677 ) ) ( not ( = ?auto_2693674 ?auto_2693678 ) ) ( not ( = ?auto_2693675 ?auto_2693676 ) ) ( not ( = ?auto_2693675 ?auto_2693677 ) ) ( not ( = ?auto_2693675 ?auto_2693678 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2693676 ?auto_2693677 ?auto_2693678 )
      ( MAKE-12CRATE-VERIFY ?auto_2693666 ?auto_2693667 ?auto_2693668 ?auto_2693670 ?auto_2693669 ?auto_2693671 ?auto_2693672 ?auto_2693673 ?auto_2693674 ?auto_2693675 ?auto_2693676 ?auto_2693677 ?auto_2693678 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2693804 - SURFACE
      ?auto_2693805 - SURFACE
      ?auto_2693806 - SURFACE
      ?auto_2693808 - SURFACE
      ?auto_2693807 - SURFACE
      ?auto_2693809 - SURFACE
      ?auto_2693810 - SURFACE
      ?auto_2693811 - SURFACE
      ?auto_2693812 - SURFACE
      ?auto_2693813 - SURFACE
      ?auto_2693814 - SURFACE
      ?auto_2693815 - SURFACE
      ?auto_2693816 - SURFACE
    )
    :vars
    (
      ?auto_2693819 - HOIST
      ?auto_2693818 - PLACE
      ?auto_2693820 - TRUCK
      ?auto_2693817 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2693819 ?auto_2693818 ) ( SURFACE-AT ?auto_2693815 ?auto_2693818 ) ( CLEAR ?auto_2693815 ) ( IS-CRATE ?auto_2693816 ) ( not ( = ?auto_2693815 ?auto_2693816 ) ) ( AVAILABLE ?auto_2693819 ) ( IN ?auto_2693816 ?auto_2693820 ) ( ON ?auto_2693815 ?auto_2693814 ) ( not ( = ?auto_2693814 ?auto_2693815 ) ) ( not ( = ?auto_2693814 ?auto_2693816 ) ) ( TRUCK-AT ?auto_2693820 ?auto_2693817 ) ( not ( = ?auto_2693817 ?auto_2693818 ) ) ( ON ?auto_2693805 ?auto_2693804 ) ( ON ?auto_2693806 ?auto_2693805 ) ( ON ?auto_2693808 ?auto_2693806 ) ( ON ?auto_2693807 ?auto_2693808 ) ( ON ?auto_2693809 ?auto_2693807 ) ( ON ?auto_2693810 ?auto_2693809 ) ( ON ?auto_2693811 ?auto_2693810 ) ( ON ?auto_2693812 ?auto_2693811 ) ( ON ?auto_2693813 ?auto_2693812 ) ( ON ?auto_2693814 ?auto_2693813 ) ( not ( = ?auto_2693804 ?auto_2693805 ) ) ( not ( = ?auto_2693804 ?auto_2693806 ) ) ( not ( = ?auto_2693804 ?auto_2693808 ) ) ( not ( = ?auto_2693804 ?auto_2693807 ) ) ( not ( = ?auto_2693804 ?auto_2693809 ) ) ( not ( = ?auto_2693804 ?auto_2693810 ) ) ( not ( = ?auto_2693804 ?auto_2693811 ) ) ( not ( = ?auto_2693804 ?auto_2693812 ) ) ( not ( = ?auto_2693804 ?auto_2693813 ) ) ( not ( = ?auto_2693804 ?auto_2693814 ) ) ( not ( = ?auto_2693804 ?auto_2693815 ) ) ( not ( = ?auto_2693804 ?auto_2693816 ) ) ( not ( = ?auto_2693805 ?auto_2693806 ) ) ( not ( = ?auto_2693805 ?auto_2693808 ) ) ( not ( = ?auto_2693805 ?auto_2693807 ) ) ( not ( = ?auto_2693805 ?auto_2693809 ) ) ( not ( = ?auto_2693805 ?auto_2693810 ) ) ( not ( = ?auto_2693805 ?auto_2693811 ) ) ( not ( = ?auto_2693805 ?auto_2693812 ) ) ( not ( = ?auto_2693805 ?auto_2693813 ) ) ( not ( = ?auto_2693805 ?auto_2693814 ) ) ( not ( = ?auto_2693805 ?auto_2693815 ) ) ( not ( = ?auto_2693805 ?auto_2693816 ) ) ( not ( = ?auto_2693806 ?auto_2693808 ) ) ( not ( = ?auto_2693806 ?auto_2693807 ) ) ( not ( = ?auto_2693806 ?auto_2693809 ) ) ( not ( = ?auto_2693806 ?auto_2693810 ) ) ( not ( = ?auto_2693806 ?auto_2693811 ) ) ( not ( = ?auto_2693806 ?auto_2693812 ) ) ( not ( = ?auto_2693806 ?auto_2693813 ) ) ( not ( = ?auto_2693806 ?auto_2693814 ) ) ( not ( = ?auto_2693806 ?auto_2693815 ) ) ( not ( = ?auto_2693806 ?auto_2693816 ) ) ( not ( = ?auto_2693808 ?auto_2693807 ) ) ( not ( = ?auto_2693808 ?auto_2693809 ) ) ( not ( = ?auto_2693808 ?auto_2693810 ) ) ( not ( = ?auto_2693808 ?auto_2693811 ) ) ( not ( = ?auto_2693808 ?auto_2693812 ) ) ( not ( = ?auto_2693808 ?auto_2693813 ) ) ( not ( = ?auto_2693808 ?auto_2693814 ) ) ( not ( = ?auto_2693808 ?auto_2693815 ) ) ( not ( = ?auto_2693808 ?auto_2693816 ) ) ( not ( = ?auto_2693807 ?auto_2693809 ) ) ( not ( = ?auto_2693807 ?auto_2693810 ) ) ( not ( = ?auto_2693807 ?auto_2693811 ) ) ( not ( = ?auto_2693807 ?auto_2693812 ) ) ( not ( = ?auto_2693807 ?auto_2693813 ) ) ( not ( = ?auto_2693807 ?auto_2693814 ) ) ( not ( = ?auto_2693807 ?auto_2693815 ) ) ( not ( = ?auto_2693807 ?auto_2693816 ) ) ( not ( = ?auto_2693809 ?auto_2693810 ) ) ( not ( = ?auto_2693809 ?auto_2693811 ) ) ( not ( = ?auto_2693809 ?auto_2693812 ) ) ( not ( = ?auto_2693809 ?auto_2693813 ) ) ( not ( = ?auto_2693809 ?auto_2693814 ) ) ( not ( = ?auto_2693809 ?auto_2693815 ) ) ( not ( = ?auto_2693809 ?auto_2693816 ) ) ( not ( = ?auto_2693810 ?auto_2693811 ) ) ( not ( = ?auto_2693810 ?auto_2693812 ) ) ( not ( = ?auto_2693810 ?auto_2693813 ) ) ( not ( = ?auto_2693810 ?auto_2693814 ) ) ( not ( = ?auto_2693810 ?auto_2693815 ) ) ( not ( = ?auto_2693810 ?auto_2693816 ) ) ( not ( = ?auto_2693811 ?auto_2693812 ) ) ( not ( = ?auto_2693811 ?auto_2693813 ) ) ( not ( = ?auto_2693811 ?auto_2693814 ) ) ( not ( = ?auto_2693811 ?auto_2693815 ) ) ( not ( = ?auto_2693811 ?auto_2693816 ) ) ( not ( = ?auto_2693812 ?auto_2693813 ) ) ( not ( = ?auto_2693812 ?auto_2693814 ) ) ( not ( = ?auto_2693812 ?auto_2693815 ) ) ( not ( = ?auto_2693812 ?auto_2693816 ) ) ( not ( = ?auto_2693813 ?auto_2693814 ) ) ( not ( = ?auto_2693813 ?auto_2693815 ) ) ( not ( = ?auto_2693813 ?auto_2693816 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2693814 ?auto_2693815 ?auto_2693816 )
      ( MAKE-12CRATE-VERIFY ?auto_2693804 ?auto_2693805 ?auto_2693806 ?auto_2693808 ?auto_2693807 ?auto_2693809 ?auto_2693810 ?auto_2693811 ?auto_2693812 ?auto_2693813 ?auto_2693814 ?auto_2693815 ?auto_2693816 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2693954 - SURFACE
      ?auto_2693955 - SURFACE
      ?auto_2693956 - SURFACE
      ?auto_2693958 - SURFACE
      ?auto_2693957 - SURFACE
      ?auto_2693959 - SURFACE
      ?auto_2693960 - SURFACE
      ?auto_2693961 - SURFACE
      ?auto_2693962 - SURFACE
      ?auto_2693963 - SURFACE
      ?auto_2693964 - SURFACE
      ?auto_2693965 - SURFACE
      ?auto_2693966 - SURFACE
    )
    :vars
    (
      ?auto_2693969 - HOIST
      ?auto_2693971 - PLACE
      ?auto_2693967 - TRUCK
      ?auto_2693968 - PLACE
      ?auto_2693970 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2693969 ?auto_2693971 ) ( SURFACE-AT ?auto_2693965 ?auto_2693971 ) ( CLEAR ?auto_2693965 ) ( IS-CRATE ?auto_2693966 ) ( not ( = ?auto_2693965 ?auto_2693966 ) ) ( AVAILABLE ?auto_2693969 ) ( ON ?auto_2693965 ?auto_2693964 ) ( not ( = ?auto_2693964 ?auto_2693965 ) ) ( not ( = ?auto_2693964 ?auto_2693966 ) ) ( TRUCK-AT ?auto_2693967 ?auto_2693968 ) ( not ( = ?auto_2693968 ?auto_2693971 ) ) ( HOIST-AT ?auto_2693970 ?auto_2693968 ) ( LIFTING ?auto_2693970 ?auto_2693966 ) ( not ( = ?auto_2693969 ?auto_2693970 ) ) ( ON ?auto_2693955 ?auto_2693954 ) ( ON ?auto_2693956 ?auto_2693955 ) ( ON ?auto_2693958 ?auto_2693956 ) ( ON ?auto_2693957 ?auto_2693958 ) ( ON ?auto_2693959 ?auto_2693957 ) ( ON ?auto_2693960 ?auto_2693959 ) ( ON ?auto_2693961 ?auto_2693960 ) ( ON ?auto_2693962 ?auto_2693961 ) ( ON ?auto_2693963 ?auto_2693962 ) ( ON ?auto_2693964 ?auto_2693963 ) ( not ( = ?auto_2693954 ?auto_2693955 ) ) ( not ( = ?auto_2693954 ?auto_2693956 ) ) ( not ( = ?auto_2693954 ?auto_2693958 ) ) ( not ( = ?auto_2693954 ?auto_2693957 ) ) ( not ( = ?auto_2693954 ?auto_2693959 ) ) ( not ( = ?auto_2693954 ?auto_2693960 ) ) ( not ( = ?auto_2693954 ?auto_2693961 ) ) ( not ( = ?auto_2693954 ?auto_2693962 ) ) ( not ( = ?auto_2693954 ?auto_2693963 ) ) ( not ( = ?auto_2693954 ?auto_2693964 ) ) ( not ( = ?auto_2693954 ?auto_2693965 ) ) ( not ( = ?auto_2693954 ?auto_2693966 ) ) ( not ( = ?auto_2693955 ?auto_2693956 ) ) ( not ( = ?auto_2693955 ?auto_2693958 ) ) ( not ( = ?auto_2693955 ?auto_2693957 ) ) ( not ( = ?auto_2693955 ?auto_2693959 ) ) ( not ( = ?auto_2693955 ?auto_2693960 ) ) ( not ( = ?auto_2693955 ?auto_2693961 ) ) ( not ( = ?auto_2693955 ?auto_2693962 ) ) ( not ( = ?auto_2693955 ?auto_2693963 ) ) ( not ( = ?auto_2693955 ?auto_2693964 ) ) ( not ( = ?auto_2693955 ?auto_2693965 ) ) ( not ( = ?auto_2693955 ?auto_2693966 ) ) ( not ( = ?auto_2693956 ?auto_2693958 ) ) ( not ( = ?auto_2693956 ?auto_2693957 ) ) ( not ( = ?auto_2693956 ?auto_2693959 ) ) ( not ( = ?auto_2693956 ?auto_2693960 ) ) ( not ( = ?auto_2693956 ?auto_2693961 ) ) ( not ( = ?auto_2693956 ?auto_2693962 ) ) ( not ( = ?auto_2693956 ?auto_2693963 ) ) ( not ( = ?auto_2693956 ?auto_2693964 ) ) ( not ( = ?auto_2693956 ?auto_2693965 ) ) ( not ( = ?auto_2693956 ?auto_2693966 ) ) ( not ( = ?auto_2693958 ?auto_2693957 ) ) ( not ( = ?auto_2693958 ?auto_2693959 ) ) ( not ( = ?auto_2693958 ?auto_2693960 ) ) ( not ( = ?auto_2693958 ?auto_2693961 ) ) ( not ( = ?auto_2693958 ?auto_2693962 ) ) ( not ( = ?auto_2693958 ?auto_2693963 ) ) ( not ( = ?auto_2693958 ?auto_2693964 ) ) ( not ( = ?auto_2693958 ?auto_2693965 ) ) ( not ( = ?auto_2693958 ?auto_2693966 ) ) ( not ( = ?auto_2693957 ?auto_2693959 ) ) ( not ( = ?auto_2693957 ?auto_2693960 ) ) ( not ( = ?auto_2693957 ?auto_2693961 ) ) ( not ( = ?auto_2693957 ?auto_2693962 ) ) ( not ( = ?auto_2693957 ?auto_2693963 ) ) ( not ( = ?auto_2693957 ?auto_2693964 ) ) ( not ( = ?auto_2693957 ?auto_2693965 ) ) ( not ( = ?auto_2693957 ?auto_2693966 ) ) ( not ( = ?auto_2693959 ?auto_2693960 ) ) ( not ( = ?auto_2693959 ?auto_2693961 ) ) ( not ( = ?auto_2693959 ?auto_2693962 ) ) ( not ( = ?auto_2693959 ?auto_2693963 ) ) ( not ( = ?auto_2693959 ?auto_2693964 ) ) ( not ( = ?auto_2693959 ?auto_2693965 ) ) ( not ( = ?auto_2693959 ?auto_2693966 ) ) ( not ( = ?auto_2693960 ?auto_2693961 ) ) ( not ( = ?auto_2693960 ?auto_2693962 ) ) ( not ( = ?auto_2693960 ?auto_2693963 ) ) ( not ( = ?auto_2693960 ?auto_2693964 ) ) ( not ( = ?auto_2693960 ?auto_2693965 ) ) ( not ( = ?auto_2693960 ?auto_2693966 ) ) ( not ( = ?auto_2693961 ?auto_2693962 ) ) ( not ( = ?auto_2693961 ?auto_2693963 ) ) ( not ( = ?auto_2693961 ?auto_2693964 ) ) ( not ( = ?auto_2693961 ?auto_2693965 ) ) ( not ( = ?auto_2693961 ?auto_2693966 ) ) ( not ( = ?auto_2693962 ?auto_2693963 ) ) ( not ( = ?auto_2693962 ?auto_2693964 ) ) ( not ( = ?auto_2693962 ?auto_2693965 ) ) ( not ( = ?auto_2693962 ?auto_2693966 ) ) ( not ( = ?auto_2693963 ?auto_2693964 ) ) ( not ( = ?auto_2693963 ?auto_2693965 ) ) ( not ( = ?auto_2693963 ?auto_2693966 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2693964 ?auto_2693965 ?auto_2693966 )
      ( MAKE-12CRATE-VERIFY ?auto_2693954 ?auto_2693955 ?auto_2693956 ?auto_2693958 ?auto_2693957 ?auto_2693959 ?auto_2693960 ?auto_2693961 ?auto_2693962 ?auto_2693963 ?auto_2693964 ?auto_2693965 ?auto_2693966 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2694116 - SURFACE
      ?auto_2694117 - SURFACE
      ?auto_2694118 - SURFACE
      ?auto_2694120 - SURFACE
      ?auto_2694119 - SURFACE
      ?auto_2694121 - SURFACE
      ?auto_2694122 - SURFACE
      ?auto_2694123 - SURFACE
      ?auto_2694124 - SURFACE
      ?auto_2694125 - SURFACE
      ?auto_2694126 - SURFACE
      ?auto_2694127 - SURFACE
      ?auto_2694128 - SURFACE
    )
    :vars
    (
      ?auto_2694130 - HOIST
      ?auto_2694133 - PLACE
      ?auto_2694131 - TRUCK
      ?auto_2694132 - PLACE
      ?auto_2694129 - HOIST
      ?auto_2694134 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2694130 ?auto_2694133 ) ( SURFACE-AT ?auto_2694127 ?auto_2694133 ) ( CLEAR ?auto_2694127 ) ( IS-CRATE ?auto_2694128 ) ( not ( = ?auto_2694127 ?auto_2694128 ) ) ( AVAILABLE ?auto_2694130 ) ( ON ?auto_2694127 ?auto_2694126 ) ( not ( = ?auto_2694126 ?auto_2694127 ) ) ( not ( = ?auto_2694126 ?auto_2694128 ) ) ( TRUCK-AT ?auto_2694131 ?auto_2694132 ) ( not ( = ?auto_2694132 ?auto_2694133 ) ) ( HOIST-AT ?auto_2694129 ?auto_2694132 ) ( not ( = ?auto_2694130 ?auto_2694129 ) ) ( AVAILABLE ?auto_2694129 ) ( SURFACE-AT ?auto_2694128 ?auto_2694132 ) ( ON ?auto_2694128 ?auto_2694134 ) ( CLEAR ?auto_2694128 ) ( not ( = ?auto_2694127 ?auto_2694134 ) ) ( not ( = ?auto_2694128 ?auto_2694134 ) ) ( not ( = ?auto_2694126 ?auto_2694134 ) ) ( ON ?auto_2694117 ?auto_2694116 ) ( ON ?auto_2694118 ?auto_2694117 ) ( ON ?auto_2694120 ?auto_2694118 ) ( ON ?auto_2694119 ?auto_2694120 ) ( ON ?auto_2694121 ?auto_2694119 ) ( ON ?auto_2694122 ?auto_2694121 ) ( ON ?auto_2694123 ?auto_2694122 ) ( ON ?auto_2694124 ?auto_2694123 ) ( ON ?auto_2694125 ?auto_2694124 ) ( ON ?auto_2694126 ?auto_2694125 ) ( not ( = ?auto_2694116 ?auto_2694117 ) ) ( not ( = ?auto_2694116 ?auto_2694118 ) ) ( not ( = ?auto_2694116 ?auto_2694120 ) ) ( not ( = ?auto_2694116 ?auto_2694119 ) ) ( not ( = ?auto_2694116 ?auto_2694121 ) ) ( not ( = ?auto_2694116 ?auto_2694122 ) ) ( not ( = ?auto_2694116 ?auto_2694123 ) ) ( not ( = ?auto_2694116 ?auto_2694124 ) ) ( not ( = ?auto_2694116 ?auto_2694125 ) ) ( not ( = ?auto_2694116 ?auto_2694126 ) ) ( not ( = ?auto_2694116 ?auto_2694127 ) ) ( not ( = ?auto_2694116 ?auto_2694128 ) ) ( not ( = ?auto_2694116 ?auto_2694134 ) ) ( not ( = ?auto_2694117 ?auto_2694118 ) ) ( not ( = ?auto_2694117 ?auto_2694120 ) ) ( not ( = ?auto_2694117 ?auto_2694119 ) ) ( not ( = ?auto_2694117 ?auto_2694121 ) ) ( not ( = ?auto_2694117 ?auto_2694122 ) ) ( not ( = ?auto_2694117 ?auto_2694123 ) ) ( not ( = ?auto_2694117 ?auto_2694124 ) ) ( not ( = ?auto_2694117 ?auto_2694125 ) ) ( not ( = ?auto_2694117 ?auto_2694126 ) ) ( not ( = ?auto_2694117 ?auto_2694127 ) ) ( not ( = ?auto_2694117 ?auto_2694128 ) ) ( not ( = ?auto_2694117 ?auto_2694134 ) ) ( not ( = ?auto_2694118 ?auto_2694120 ) ) ( not ( = ?auto_2694118 ?auto_2694119 ) ) ( not ( = ?auto_2694118 ?auto_2694121 ) ) ( not ( = ?auto_2694118 ?auto_2694122 ) ) ( not ( = ?auto_2694118 ?auto_2694123 ) ) ( not ( = ?auto_2694118 ?auto_2694124 ) ) ( not ( = ?auto_2694118 ?auto_2694125 ) ) ( not ( = ?auto_2694118 ?auto_2694126 ) ) ( not ( = ?auto_2694118 ?auto_2694127 ) ) ( not ( = ?auto_2694118 ?auto_2694128 ) ) ( not ( = ?auto_2694118 ?auto_2694134 ) ) ( not ( = ?auto_2694120 ?auto_2694119 ) ) ( not ( = ?auto_2694120 ?auto_2694121 ) ) ( not ( = ?auto_2694120 ?auto_2694122 ) ) ( not ( = ?auto_2694120 ?auto_2694123 ) ) ( not ( = ?auto_2694120 ?auto_2694124 ) ) ( not ( = ?auto_2694120 ?auto_2694125 ) ) ( not ( = ?auto_2694120 ?auto_2694126 ) ) ( not ( = ?auto_2694120 ?auto_2694127 ) ) ( not ( = ?auto_2694120 ?auto_2694128 ) ) ( not ( = ?auto_2694120 ?auto_2694134 ) ) ( not ( = ?auto_2694119 ?auto_2694121 ) ) ( not ( = ?auto_2694119 ?auto_2694122 ) ) ( not ( = ?auto_2694119 ?auto_2694123 ) ) ( not ( = ?auto_2694119 ?auto_2694124 ) ) ( not ( = ?auto_2694119 ?auto_2694125 ) ) ( not ( = ?auto_2694119 ?auto_2694126 ) ) ( not ( = ?auto_2694119 ?auto_2694127 ) ) ( not ( = ?auto_2694119 ?auto_2694128 ) ) ( not ( = ?auto_2694119 ?auto_2694134 ) ) ( not ( = ?auto_2694121 ?auto_2694122 ) ) ( not ( = ?auto_2694121 ?auto_2694123 ) ) ( not ( = ?auto_2694121 ?auto_2694124 ) ) ( not ( = ?auto_2694121 ?auto_2694125 ) ) ( not ( = ?auto_2694121 ?auto_2694126 ) ) ( not ( = ?auto_2694121 ?auto_2694127 ) ) ( not ( = ?auto_2694121 ?auto_2694128 ) ) ( not ( = ?auto_2694121 ?auto_2694134 ) ) ( not ( = ?auto_2694122 ?auto_2694123 ) ) ( not ( = ?auto_2694122 ?auto_2694124 ) ) ( not ( = ?auto_2694122 ?auto_2694125 ) ) ( not ( = ?auto_2694122 ?auto_2694126 ) ) ( not ( = ?auto_2694122 ?auto_2694127 ) ) ( not ( = ?auto_2694122 ?auto_2694128 ) ) ( not ( = ?auto_2694122 ?auto_2694134 ) ) ( not ( = ?auto_2694123 ?auto_2694124 ) ) ( not ( = ?auto_2694123 ?auto_2694125 ) ) ( not ( = ?auto_2694123 ?auto_2694126 ) ) ( not ( = ?auto_2694123 ?auto_2694127 ) ) ( not ( = ?auto_2694123 ?auto_2694128 ) ) ( not ( = ?auto_2694123 ?auto_2694134 ) ) ( not ( = ?auto_2694124 ?auto_2694125 ) ) ( not ( = ?auto_2694124 ?auto_2694126 ) ) ( not ( = ?auto_2694124 ?auto_2694127 ) ) ( not ( = ?auto_2694124 ?auto_2694128 ) ) ( not ( = ?auto_2694124 ?auto_2694134 ) ) ( not ( = ?auto_2694125 ?auto_2694126 ) ) ( not ( = ?auto_2694125 ?auto_2694127 ) ) ( not ( = ?auto_2694125 ?auto_2694128 ) ) ( not ( = ?auto_2694125 ?auto_2694134 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2694126 ?auto_2694127 ?auto_2694128 )
      ( MAKE-12CRATE-VERIFY ?auto_2694116 ?auto_2694117 ?auto_2694118 ?auto_2694120 ?auto_2694119 ?auto_2694121 ?auto_2694122 ?auto_2694123 ?auto_2694124 ?auto_2694125 ?auto_2694126 ?auto_2694127 ?auto_2694128 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2694279 - SURFACE
      ?auto_2694280 - SURFACE
      ?auto_2694281 - SURFACE
      ?auto_2694283 - SURFACE
      ?auto_2694282 - SURFACE
      ?auto_2694284 - SURFACE
      ?auto_2694285 - SURFACE
      ?auto_2694286 - SURFACE
      ?auto_2694287 - SURFACE
      ?auto_2694288 - SURFACE
      ?auto_2694289 - SURFACE
      ?auto_2694290 - SURFACE
      ?auto_2694291 - SURFACE
    )
    :vars
    (
      ?auto_2694294 - HOIST
      ?auto_2694296 - PLACE
      ?auto_2694297 - PLACE
      ?auto_2694295 - HOIST
      ?auto_2694293 - SURFACE
      ?auto_2694292 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2694294 ?auto_2694296 ) ( SURFACE-AT ?auto_2694290 ?auto_2694296 ) ( CLEAR ?auto_2694290 ) ( IS-CRATE ?auto_2694291 ) ( not ( = ?auto_2694290 ?auto_2694291 ) ) ( AVAILABLE ?auto_2694294 ) ( ON ?auto_2694290 ?auto_2694289 ) ( not ( = ?auto_2694289 ?auto_2694290 ) ) ( not ( = ?auto_2694289 ?auto_2694291 ) ) ( not ( = ?auto_2694297 ?auto_2694296 ) ) ( HOIST-AT ?auto_2694295 ?auto_2694297 ) ( not ( = ?auto_2694294 ?auto_2694295 ) ) ( AVAILABLE ?auto_2694295 ) ( SURFACE-AT ?auto_2694291 ?auto_2694297 ) ( ON ?auto_2694291 ?auto_2694293 ) ( CLEAR ?auto_2694291 ) ( not ( = ?auto_2694290 ?auto_2694293 ) ) ( not ( = ?auto_2694291 ?auto_2694293 ) ) ( not ( = ?auto_2694289 ?auto_2694293 ) ) ( TRUCK-AT ?auto_2694292 ?auto_2694296 ) ( ON ?auto_2694280 ?auto_2694279 ) ( ON ?auto_2694281 ?auto_2694280 ) ( ON ?auto_2694283 ?auto_2694281 ) ( ON ?auto_2694282 ?auto_2694283 ) ( ON ?auto_2694284 ?auto_2694282 ) ( ON ?auto_2694285 ?auto_2694284 ) ( ON ?auto_2694286 ?auto_2694285 ) ( ON ?auto_2694287 ?auto_2694286 ) ( ON ?auto_2694288 ?auto_2694287 ) ( ON ?auto_2694289 ?auto_2694288 ) ( not ( = ?auto_2694279 ?auto_2694280 ) ) ( not ( = ?auto_2694279 ?auto_2694281 ) ) ( not ( = ?auto_2694279 ?auto_2694283 ) ) ( not ( = ?auto_2694279 ?auto_2694282 ) ) ( not ( = ?auto_2694279 ?auto_2694284 ) ) ( not ( = ?auto_2694279 ?auto_2694285 ) ) ( not ( = ?auto_2694279 ?auto_2694286 ) ) ( not ( = ?auto_2694279 ?auto_2694287 ) ) ( not ( = ?auto_2694279 ?auto_2694288 ) ) ( not ( = ?auto_2694279 ?auto_2694289 ) ) ( not ( = ?auto_2694279 ?auto_2694290 ) ) ( not ( = ?auto_2694279 ?auto_2694291 ) ) ( not ( = ?auto_2694279 ?auto_2694293 ) ) ( not ( = ?auto_2694280 ?auto_2694281 ) ) ( not ( = ?auto_2694280 ?auto_2694283 ) ) ( not ( = ?auto_2694280 ?auto_2694282 ) ) ( not ( = ?auto_2694280 ?auto_2694284 ) ) ( not ( = ?auto_2694280 ?auto_2694285 ) ) ( not ( = ?auto_2694280 ?auto_2694286 ) ) ( not ( = ?auto_2694280 ?auto_2694287 ) ) ( not ( = ?auto_2694280 ?auto_2694288 ) ) ( not ( = ?auto_2694280 ?auto_2694289 ) ) ( not ( = ?auto_2694280 ?auto_2694290 ) ) ( not ( = ?auto_2694280 ?auto_2694291 ) ) ( not ( = ?auto_2694280 ?auto_2694293 ) ) ( not ( = ?auto_2694281 ?auto_2694283 ) ) ( not ( = ?auto_2694281 ?auto_2694282 ) ) ( not ( = ?auto_2694281 ?auto_2694284 ) ) ( not ( = ?auto_2694281 ?auto_2694285 ) ) ( not ( = ?auto_2694281 ?auto_2694286 ) ) ( not ( = ?auto_2694281 ?auto_2694287 ) ) ( not ( = ?auto_2694281 ?auto_2694288 ) ) ( not ( = ?auto_2694281 ?auto_2694289 ) ) ( not ( = ?auto_2694281 ?auto_2694290 ) ) ( not ( = ?auto_2694281 ?auto_2694291 ) ) ( not ( = ?auto_2694281 ?auto_2694293 ) ) ( not ( = ?auto_2694283 ?auto_2694282 ) ) ( not ( = ?auto_2694283 ?auto_2694284 ) ) ( not ( = ?auto_2694283 ?auto_2694285 ) ) ( not ( = ?auto_2694283 ?auto_2694286 ) ) ( not ( = ?auto_2694283 ?auto_2694287 ) ) ( not ( = ?auto_2694283 ?auto_2694288 ) ) ( not ( = ?auto_2694283 ?auto_2694289 ) ) ( not ( = ?auto_2694283 ?auto_2694290 ) ) ( not ( = ?auto_2694283 ?auto_2694291 ) ) ( not ( = ?auto_2694283 ?auto_2694293 ) ) ( not ( = ?auto_2694282 ?auto_2694284 ) ) ( not ( = ?auto_2694282 ?auto_2694285 ) ) ( not ( = ?auto_2694282 ?auto_2694286 ) ) ( not ( = ?auto_2694282 ?auto_2694287 ) ) ( not ( = ?auto_2694282 ?auto_2694288 ) ) ( not ( = ?auto_2694282 ?auto_2694289 ) ) ( not ( = ?auto_2694282 ?auto_2694290 ) ) ( not ( = ?auto_2694282 ?auto_2694291 ) ) ( not ( = ?auto_2694282 ?auto_2694293 ) ) ( not ( = ?auto_2694284 ?auto_2694285 ) ) ( not ( = ?auto_2694284 ?auto_2694286 ) ) ( not ( = ?auto_2694284 ?auto_2694287 ) ) ( not ( = ?auto_2694284 ?auto_2694288 ) ) ( not ( = ?auto_2694284 ?auto_2694289 ) ) ( not ( = ?auto_2694284 ?auto_2694290 ) ) ( not ( = ?auto_2694284 ?auto_2694291 ) ) ( not ( = ?auto_2694284 ?auto_2694293 ) ) ( not ( = ?auto_2694285 ?auto_2694286 ) ) ( not ( = ?auto_2694285 ?auto_2694287 ) ) ( not ( = ?auto_2694285 ?auto_2694288 ) ) ( not ( = ?auto_2694285 ?auto_2694289 ) ) ( not ( = ?auto_2694285 ?auto_2694290 ) ) ( not ( = ?auto_2694285 ?auto_2694291 ) ) ( not ( = ?auto_2694285 ?auto_2694293 ) ) ( not ( = ?auto_2694286 ?auto_2694287 ) ) ( not ( = ?auto_2694286 ?auto_2694288 ) ) ( not ( = ?auto_2694286 ?auto_2694289 ) ) ( not ( = ?auto_2694286 ?auto_2694290 ) ) ( not ( = ?auto_2694286 ?auto_2694291 ) ) ( not ( = ?auto_2694286 ?auto_2694293 ) ) ( not ( = ?auto_2694287 ?auto_2694288 ) ) ( not ( = ?auto_2694287 ?auto_2694289 ) ) ( not ( = ?auto_2694287 ?auto_2694290 ) ) ( not ( = ?auto_2694287 ?auto_2694291 ) ) ( not ( = ?auto_2694287 ?auto_2694293 ) ) ( not ( = ?auto_2694288 ?auto_2694289 ) ) ( not ( = ?auto_2694288 ?auto_2694290 ) ) ( not ( = ?auto_2694288 ?auto_2694291 ) ) ( not ( = ?auto_2694288 ?auto_2694293 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2694289 ?auto_2694290 ?auto_2694291 )
      ( MAKE-12CRATE-VERIFY ?auto_2694279 ?auto_2694280 ?auto_2694281 ?auto_2694283 ?auto_2694282 ?auto_2694284 ?auto_2694285 ?auto_2694286 ?auto_2694287 ?auto_2694288 ?auto_2694289 ?auto_2694290 ?auto_2694291 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2694442 - SURFACE
      ?auto_2694443 - SURFACE
      ?auto_2694444 - SURFACE
      ?auto_2694446 - SURFACE
      ?auto_2694445 - SURFACE
      ?auto_2694447 - SURFACE
      ?auto_2694448 - SURFACE
      ?auto_2694449 - SURFACE
      ?auto_2694450 - SURFACE
      ?auto_2694451 - SURFACE
      ?auto_2694452 - SURFACE
      ?auto_2694453 - SURFACE
      ?auto_2694454 - SURFACE
    )
    :vars
    (
      ?auto_2694456 - HOIST
      ?auto_2694457 - PLACE
      ?auto_2694455 - PLACE
      ?auto_2694460 - HOIST
      ?auto_2694458 - SURFACE
      ?auto_2694459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2694456 ?auto_2694457 ) ( IS-CRATE ?auto_2694454 ) ( not ( = ?auto_2694453 ?auto_2694454 ) ) ( not ( = ?auto_2694452 ?auto_2694453 ) ) ( not ( = ?auto_2694452 ?auto_2694454 ) ) ( not ( = ?auto_2694455 ?auto_2694457 ) ) ( HOIST-AT ?auto_2694460 ?auto_2694455 ) ( not ( = ?auto_2694456 ?auto_2694460 ) ) ( AVAILABLE ?auto_2694460 ) ( SURFACE-AT ?auto_2694454 ?auto_2694455 ) ( ON ?auto_2694454 ?auto_2694458 ) ( CLEAR ?auto_2694454 ) ( not ( = ?auto_2694453 ?auto_2694458 ) ) ( not ( = ?auto_2694454 ?auto_2694458 ) ) ( not ( = ?auto_2694452 ?auto_2694458 ) ) ( TRUCK-AT ?auto_2694459 ?auto_2694457 ) ( SURFACE-AT ?auto_2694452 ?auto_2694457 ) ( CLEAR ?auto_2694452 ) ( LIFTING ?auto_2694456 ?auto_2694453 ) ( IS-CRATE ?auto_2694453 ) ( ON ?auto_2694443 ?auto_2694442 ) ( ON ?auto_2694444 ?auto_2694443 ) ( ON ?auto_2694446 ?auto_2694444 ) ( ON ?auto_2694445 ?auto_2694446 ) ( ON ?auto_2694447 ?auto_2694445 ) ( ON ?auto_2694448 ?auto_2694447 ) ( ON ?auto_2694449 ?auto_2694448 ) ( ON ?auto_2694450 ?auto_2694449 ) ( ON ?auto_2694451 ?auto_2694450 ) ( ON ?auto_2694452 ?auto_2694451 ) ( not ( = ?auto_2694442 ?auto_2694443 ) ) ( not ( = ?auto_2694442 ?auto_2694444 ) ) ( not ( = ?auto_2694442 ?auto_2694446 ) ) ( not ( = ?auto_2694442 ?auto_2694445 ) ) ( not ( = ?auto_2694442 ?auto_2694447 ) ) ( not ( = ?auto_2694442 ?auto_2694448 ) ) ( not ( = ?auto_2694442 ?auto_2694449 ) ) ( not ( = ?auto_2694442 ?auto_2694450 ) ) ( not ( = ?auto_2694442 ?auto_2694451 ) ) ( not ( = ?auto_2694442 ?auto_2694452 ) ) ( not ( = ?auto_2694442 ?auto_2694453 ) ) ( not ( = ?auto_2694442 ?auto_2694454 ) ) ( not ( = ?auto_2694442 ?auto_2694458 ) ) ( not ( = ?auto_2694443 ?auto_2694444 ) ) ( not ( = ?auto_2694443 ?auto_2694446 ) ) ( not ( = ?auto_2694443 ?auto_2694445 ) ) ( not ( = ?auto_2694443 ?auto_2694447 ) ) ( not ( = ?auto_2694443 ?auto_2694448 ) ) ( not ( = ?auto_2694443 ?auto_2694449 ) ) ( not ( = ?auto_2694443 ?auto_2694450 ) ) ( not ( = ?auto_2694443 ?auto_2694451 ) ) ( not ( = ?auto_2694443 ?auto_2694452 ) ) ( not ( = ?auto_2694443 ?auto_2694453 ) ) ( not ( = ?auto_2694443 ?auto_2694454 ) ) ( not ( = ?auto_2694443 ?auto_2694458 ) ) ( not ( = ?auto_2694444 ?auto_2694446 ) ) ( not ( = ?auto_2694444 ?auto_2694445 ) ) ( not ( = ?auto_2694444 ?auto_2694447 ) ) ( not ( = ?auto_2694444 ?auto_2694448 ) ) ( not ( = ?auto_2694444 ?auto_2694449 ) ) ( not ( = ?auto_2694444 ?auto_2694450 ) ) ( not ( = ?auto_2694444 ?auto_2694451 ) ) ( not ( = ?auto_2694444 ?auto_2694452 ) ) ( not ( = ?auto_2694444 ?auto_2694453 ) ) ( not ( = ?auto_2694444 ?auto_2694454 ) ) ( not ( = ?auto_2694444 ?auto_2694458 ) ) ( not ( = ?auto_2694446 ?auto_2694445 ) ) ( not ( = ?auto_2694446 ?auto_2694447 ) ) ( not ( = ?auto_2694446 ?auto_2694448 ) ) ( not ( = ?auto_2694446 ?auto_2694449 ) ) ( not ( = ?auto_2694446 ?auto_2694450 ) ) ( not ( = ?auto_2694446 ?auto_2694451 ) ) ( not ( = ?auto_2694446 ?auto_2694452 ) ) ( not ( = ?auto_2694446 ?auto_2694453 ) ) ( not ( = ?auto_2694446 ?auto_2694454 ) ) ( not ( = ?auto_2694446 ?auto_2694458 ) ) ( not ( = ?auto_2694445 ?auto_2694447 ) ) ( not ( = ?auto_2694445 ?auto_2694448 ) ) ( not ( = ?auto_2694445 ?auto_2694449 ) ) ( not ( = ?auto_2694445 ?auto_2694450 ) ) ( not ( = ?auto_2694445 ?auto_2694451 ) ) ( not ( = ?auto_2694445 ?auto_2694452 ) ) ( not ( = ?auto_2694445 ?auto_2694453 ) ) ( not ( = ?auto_2694445 ?auto_2694454 ) ) ( not ( = ?auto_2694445 ?auto_2694458 ) ) ( not ( = ?auto_2694447 ?auto_2694448 ) ) ( not ( = ?auto_2694447 ?auto_2694449 ) ) ( not ( = ?auto_2694447 ?auto_2694450 ) ) ( not ( = ?auto_2694447 ?auto_2694451 ) ) ( not ( = ?auto_2694447 ?auto_2694452 ) ) ( not ( = ?auto_2694447 ?auto_2694453 ) ) ( not ( = ?auto_2694447 ?auto_2694454 ) ) ( not ( = ?auto_2694447 ?auto_2694458 ) ) ( not ( = ?auto_2694448 ?auto_2694449 ) ) ( not ( = ?auto_2694448 ?auto_2694450 ) ) ( not ( = ?auto_2694448 ?auto_2694451 ) ) ( not ( = ?auto_2694448 ?auto_2694452 ) ) ( not ( = ?auto_2694448 ?auto_2694453 ) ) ( not ( = ?auto_2694448 ?auto_2694454 ) ) ( not ( = ?auto_2694448 ?auto_2694458 ) ) ( not ( = ?auto_2694449 ?auto_2694450 ) ) ( not ( = ?auto_2694449 ?auto_2694451 ) ) ( not ( = ?auto_2694449 ?auto_2694452 ) ) ( not ( = ?auto_2694449 ?auto_2694453 ) ) ( not ( = ?auto_2694449 ?auto_2694454 ) ) ( not ( = ?auto_2694449 ?auto_2694458 ) ) ( not ( = ?auto_2694450 ?auto_2694451 ) ) ( not ( = ?auto_2694450 ?auto_2694452 ) ) ( not ( = ?auto_2694450 ?auto_2694453 ) ) ( not ( = ?auto_2694450 ?auto_2694454 ) ) ( not ( = ?auto_2694450 ?auto_2694458 ) ) ( not ( = ?auto_2694451 ?auto_2694452 ) ) ( not ( = ?auto_2694451 ?auto_2694453 ) ) ( not ( = ?auto_2694451 ?auto_2694454 ) ) ( not ( = ?auto_2694451 ?auto_2694458 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2694452 ?auto_2694453 ?auto_2694454 )
      ( MAKE-12CRATE-VERIFY ?auto_2694442 ?auto_2694443 ?auto_2694444 ?auto_2694446 ?auto_2694445 ?auto_2694447 ?auto_2694448 ?auto_2694449 ?auto_2694450 ?auto_2694451 ?auto_2694452 ?auto_2694453 ?auto_2694454 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2694605 - SURFACE
      ?auto_2694606 - SURFACE
      ?auto_2694607 - SURFACE
      ?auto_2694609 - SURFACE
      ?auto_2694608 - SURFACE
      ?auto_2694610 - SURFACE
      ?auto_2694611 - SURFACE
      ?auto_2694612 - SURFACE
      ?auto_2694613 - SURFACE
      ?auto_2694614 - SURFACE
      ?auto_2694615 - SURFACE
      ?auto_2694616 - SURFACE
      ?auto_2694617 - SURFACE
    )
    :vars
    (
      ?auto_2694623 - HOIST
      ?auto_2694621 - PLACE
      ?auto_2694622 - PLACE
      ?auto_2694619 - HOIST
      ?auto_2694620 - SURFACE
      ?auto_2694618 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2694623 ?auto_2694621 ) ( IS-CRATE ?auto_2694617 ) ( not ( = ?auto_2694616 ?auto_2694617 ) ) ( not ( = ?auto_2694615 ?auto_2694616 ) ) ( not ( = ?auto_2694615 ?auto_2694617 ) ) ( not ( = ?auto_2694622 ?auto_2694621 ) ) ( HOIST-AT ?auto_2694619 ?auto_2694622 ) ( not ( = ?auto_2694623 ?auto_2694619 ) ) ( AVAILABLE ?auto_2694619 ) ( SURFACE-AT ?auto_2694617 ?auto_2694622 ) ( ON ?auto_2694617 ?auto_2694620 ) ( CLEAR ?auto_2694617 ) ( not ( = ?auto_2694616 ?auto_2694620 ) ) ( not ( = ?auto_2694617 ?auto_2694620 ) ) ( not ( = ?auto_2694615 ?auto_2694620 ) ) ( TRUCK-AT ?auto_2694618 ?auto_2694621 ) ( SURFACE-AT ?auto_2694615 ?auto_2694621 ) ( CLEAR ?auto_2694615 ) ( IS-CRATE ?auto_2694616 ) ( AVAILABLE ?auto_2694623 ) ( IN ?auto_2694616 ?auto_2694618 ) ( ON ?auto_2694606 ?auto_2694605 ) ( ON ?auto_2694607 ?auto_2694606 ) ( ON ?auto_2694609 ?auto_2694607 ) ( ON ?auto_2694608 ?auto_2694609 ) ( ON ?auto_2694610 ?auto_2694608 ) ( ON ?auto_2694611 ?auto_2694610 ) ( ON ?auto_2694612 ?auto_2694611 ) ( ON ?auto_2694613 ?auto_2694612 ) ( ON ?auto_2694614 ?auto_2694613 ) ( ON ?auto_2694615 ?auto_2694614 ) ( not ( = ?auto_2694605 ?auto_2694606 ) ) ( not ( = ?auto_2694605 ?auto_2694607 ) ) ( not ( = ?auto_2694605 ?auto_2694609 ) ) ( not ( = ?auto_2694605 ?auto_2694608 ) ) ( not ( = ?auto_2694605 ?auto_2694610 ) ) ( not ( = ?auto_2694605 ?auto_2694611 ) ) ( not ( = ?auto_2694605 ?auto_2694612 ) ) ( not ( = ?auto_2694605 ?auto_2694613 ) ) ( not ( = ?auto_2694605 ?auto_2694614 ) ) ( not ( = ?auto_2694605 ?auto_2694615 ) ) ( not ( = ?auto_2694605 ?auto_2694616 ) ) ( not ( = ?auto_2694605 ?auto_2694617 ) ) ( not ( = ?auto_2694605 ?auto_2694620 ) ) ( not ( = ?auto_2694606 ?auto_2694607 ) ) ( not ( = ?auto_2694606 ?auto_2694609 ) ) ( not ( = ?auto_2694606 ?auto_2694608 ) ) ( not ( = ?auto_2694606 ?auto_2694610 ) ) ( not ( = ?auto_2694606 ?auto_2694611 ) ) ( not ( = ?auto_2694606 ?auto_2694612 ) ) ( not ( = ?auto_2694606 ?auto_2694613 ) ) ( not ( = ?auto_2694606 ?auto_2694614 ) ) ( not ( = ?auto_2694606 ?auto_2694615 ) ) ( not ( = ?auto_2694606 ?auto_2694616 ) ) ( not ( = ?auto_2694606 ?auto_2694617 ) ) ( not ( = ?auto_2694606 ?auto_2694620 ) ) ( not ( = ?auto_2694607 ?auto_2694609 ) ) ( not ( = ?auto_2694607 ?auto_2694608 ) ) ( not ( = ?auto_2694607 ?auto_2694610 ) ) ( not ( = ?auto_2694607 ?auto_2694611 ) ) ( not ( = ?auto_2694607 ?auto_2694612 ) ) ( not ( = ?auto_2694607 ?auto_2694613 ) ) ( not ( = ?auto_2694607 ?auto_2694614 ) ) ( not ( = ?auto_2694607 ?auto_2694615 ) ) ( not ( = ?auto_2694607 ?auto_2694616 ) ) ( not ( = ?auto_2694607 ?auto_2694617 ) ) ( not ( = ?auto_2694607 ?auto_2694620 ) ) ( not ( = ?auto_2694609 ?auto_2694608 ) ) ( not ( = ?auto_2694609 ?auto_2694610 ) ) ( not ( = ?auto_2694609 ?auto_2694611 ) ) ( not ( = ?auto_2694609 ?auto_2694612 ) ) ( not ( = ?auto_2694609 ?auto_2694613 ) ) ( not ( = ?auto_2694609 ?auto_2694614 ) ) ( not ( = ?auto_2694609 ?auto_2694615 ) ) ( not ( = ?auto_2694609 ?auto_2694616 ) ) ( not ( = ?auto_2694609 ?auto_2694617 ) ) ( not ( = ?auto_2694609 ?auto_2694620 ) ) ( not ( = ?auto_2694608 ?auto_2694610 ) ) ( not ( = ?auto_2694608 ?auto_2694611 ) ) ( not ( = ?auto_2694608 ?auto_2694612 ) ) ( not ( = ?auto_2694608 ?auto_2694613 ) ) ( not ( = ?auto_2694608 ?auto_2694614 ) ) ( not ( = ?auto_2694608 ?auto_2694615 ) ) ( not ( = ?auto_2694608 ?auto_2694616 ) ) ( not ( = ?auto_2694608 ?auto_2694617 ) ) ( not ( = ?auto_2694608 ?auto_2694620 ) ) ( not ( = ?auto_2694610 ?auto_2694611 ) ) ( not ( = ?auto_2694610 ?auto_2694612 ) ) ( not ( = ?auto_2694610 ?auto_2694613 ) ) ( not ( = ?auto_2694610 ?auto_2694614 ) ) ( not ( = ?auto_2694610 ?auto_2694615 ) ) ( not ( = ?auto_2694610 ?auto_2694616 ) ) ( not ( = ?auto_2694610 ?auto_2694617 ) ) ( not ( = ?auto_2694610 ?auto_2694620 ) ) ( not ( = ?auto_2694611 ?auto_2694612 ) ) ( not ( = ?auto_2694611 ?auto_2694613 ) ) ( not ( = ?auto_2694611 ?auto_2694614 ) ) ( not ( = ?auto_2694611 ?auto_2694615 ) ) ( not ( = ?auto_2694611 ?auto_2694616 ) ) ( not ( = ?auto_2694611 ?auto_2694617 ) ) ( not ( = ?auto_2694611 ?auto_2694620 ) ) ( not ( = ?auto_2694612 ?auto_2694613 ) ) ( not ( = ?auto_2694612 ?auto_2694614 ) ) ( not ( = ?auto_2694612 ?auto_2694615 ) ) ( not ( = ?auto_2694612 ?auto_2694616 ) ) ( not ( = ?auto_2694612 ?auto_2694617 ) ) ( not ( = ?auto_2694612 ?auto_2694620 ) ) ( not ( = ?auto_2694613 ?auto_2694614 ) ) ( not ( = ?auto_2694613 ?auto_2694615 ) ) ( not ( = ?auto_2694613 ?auto_2694616 ) ) ( not ( = ?auto_2694613 ?auto_2694617 ) ) ( not ( = ?auto_2694613 ?auto_2694620 ) ) ( not ( = ?auto_2694614 ?auto_2694615 ) ) ( not ( = ?auto_2694614 ?auto_2694616 ) ) ( not ( = ?auto_2694614 ?auto_2694617 ) ) ( not ( = ?auto_2694614 ?auto_2694620 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2694615 ?auto_2694616 ?auto_2694617 )
      ( MAKE-12CRATE-VERIFY ?auto_2694605 ?auto_2694606 ?auto_2694607 ?auto_2694609 ?auto_2694608 ?auto_2694610 ?auto_2694611 ?auto_2694612 ?auto_2694613 ?auto_2694614 ?auto_2694615 ?auto_2694616 ?auto_2694617 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2706137 - SURFACE
      ?auto_2706138 - SURFACE
      ?auto_2706139 - SURFACE
      ?auto_2706141 - SURFACE
      ?auto_2706140 - SURFACE
      ?auto_2706142 - SURFACE
      ?auto_2706143 - SURFACE
      ?auto_2706144 - SURFACE
      ?auto_2706145 - SURFACE
      ?auto_2706146 - SURFACE
      ?auto_2706147 - SURFACE
      ?auto_2706148 - SURFACE
      ?auto_2706149 - SURFACE
      ?auto_2706150 - SURFACE
    )
    :vars
    (
      ?auto_2706151 - HOIST
      ?auto_2706152 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2706151 ?auto_2706152 ) ( SURFACE-AT ?auto_2706149 ?auto_2706152 ) ( CLEAR ?auto_2706149 ) ( LIFTING ?auto_2706151 ?auto_2706150 ) ( IS-CRATE ?auto_2706150 ) ( not ( = ?auto_2706149 ?auto_2706150 ) ) ( ON ?auto_2706138 ?auto_2706137 ) ( ON ?auto_2706139 ?auto_2706138 ) ( ON ?auto_2706141 ?auto_2706139 ) ( ON ?auto_2706140 ?auto_2706141 ) ( ON ?auto_2706142 ?auto_2706140 ) ( ON ?auto_2706143 ?auto_2706142 ) ( ON ?auto_2706144 ?auto_2706143 ) ( ON ?auto_2706145 ?auto_2706144 ) ( ON ?auto_2706146 ?auto_2706145 ) ( ON ?auto_2706147 ?auto_2706146 ) ( ON ?auto_2706148 ?auto_2706147 ) ( ON ?auto_2706149 ?auto_2706148 ) ( not ( = ?auto_2706137 ?auto_2706138 ) ) ( not ( = ?auto_2706137 ?auto_2706139 ) ) ( not ( = ?auto_2706137 ?auto_2706141 ) ) ( not ( = ?auto_2706137 ?auto_2706140 ) ) ( not ( = ?auto_2706137 ?auto_2706142 ) ) ( not ( = ?auto_2706137 ?auto_2706143 ) ) ( not ( = ?auto_2706137 ?auto_2706144 ) ) ( not ( = ?auto_2706137 ?auto_2706145 ) ) ( not ( = ?auto_2706137 ?auto_2706146 ) ) ( not ( = ?auto_2706137 ?auto_2706147 ) ) ( not ( = ?auto_2706137 ?auto_2706148 ) ) ( not ( = ?auto_2706137 ?auto_2706149 ) ) ( not ( = ?auto_2706137 ?auto_2706150 ) ) ( not ( = ?auto_2706138 ?auto_2706139 ) ) ( not ( = ?auto_2706138 ?auto_2706141 ) ) ( not ( = ?auto_2706138 ?auto_2706140 ) ) ( not ( = ?auto_2706138 ?auto_2706142 ) ) ( not ( = ?auto_2706138 ?auto_2706143 ) ) ( not ( = ?auto_2706138 ?auto_2706144 ) ) ( not ( = ?auto_2706138 ?auto_2706145 ) ) ( not ( = ?auto_2706138 ?auto_2706146 ) ) ( not ( = ?auto_2706138 ?auto_2706147 ) ) ( not ( = ?auto_2706138 ?auto_2706148 ) ) ( not ( = ?auto_2706138 ?auto_2706149 ) ) ( not ( = ?auto_2706138 ?auto_2706150 ) ) ( not ( = ?auto_2706139 ?auto_2706141 ) ) ( not ( = ?auto_2706139 ?auto_2706140 ) ) ( not ( = ?auto_2706139 ?auto_2706142 ) ) ( not ( = ?auto_2706139 ?auto_2706143 ) ) ( not ( = ?auto_2706139 ?auto_2706144 ) ) ( not ( = ?auto_2706139 ?auto_2706145 ) ) ( not ( = ?auto_2706139 ?auto_2706146 ) ) ( not ( = ?auto_2706139 ?auto_2706147 ) ) ( not ( = ?auto_2706139 ?auto_2706148 ) ) ( not ( = ?auto_2706139 ?auto_2706149 ) ) ( not ( = ?auto_2706139 ?auto_2706150 ) ) ( not ( = ?auto_2706141 ?auto_2706140 ) ) ( not ( = ?auto_2706141 ?auto_2706142 ) ) ( not ( = ?auto_2706141 ?auto_2706143 ) ) ( not ( = ?auto_2706141 ?auto_2706144 ) ) ( not ( = ?auto_2706141 ?auto_2706145 ) ) ( not ( = ?auto_2706141 ?auto_2706146 ) ) ( not ( = ?auto_2706141 ?auto_2706147 ) ) ( not ( = ?auto_2706141 ?auto_2706148 ) ) ( not ( = ?auto_2706141 ?auto_2706149 ) ) ( not ( = ?auto_2706141 ?auto_2706150 ) ) ( not ( = ?auto_2706140 ?auto_2706142 ) ) ( not ( = ?auto_2706140 ?auto_2706143 ) ) ( not ( = ?auto_2706140 ?auto_2706144 ) ) ( not ( = ?auto_2706140 ?auto_2706145 ) ) ( not ( = ?auto_2706140 ?auto_2706146 ) ) ( not ( = ?auto_2706140 ?auto_2706147 ) ) ( not ( = ?auto_2706140 ?auto_2706148 ) ) ( not ( = ?auto_2706140 ?auto_2706149 ) ) ( not ( = ?auto_2706140 ?auto_2706150 ) ) ( not ( = ?auto_2706142 ?auto_2706143 ) ) ( not ( = ?auto_2706142 ?auto_2706144 ) ) ( not ( = ?auto_2706142 ?auto_2706145 ) ) ( not ( = ?auto_2706142 ?auto_2706146 ) ) ( not ( = ?auto_2706142 ?auto_2706147 ) ) ( not ( = ?auto_2706142 ?auto_2706148 ) ) ( not ( = ?auto_2706142 ?auto_2706149 ) ) ( not ( = ?auto_2706142 ?auto_2706150 ) ) ( not ( = ?auto_2706143 ?auto_2706144 ) ) ( not ( = ?auto_2706143 ?auto_2706145 ) ) ( not ( = ?auto_2706143 ?auto_2706146 ) ) ( not ( = ?auto_2706143 ?auto_2706147 ) ) ( not ( = ?auto_2706143 ?auto_2706148 ) ) ( not ( = ?auto_2706143 ?auto_2706149 ) ) ( not ( = ?auto_2706143 ?auto_2706150 ) ) ( not ( = ?auto_2706144 ?auto_2706145 ) ) ( not ( = ?auto_2706144 ?auto_2706146 ) ) ( not ( = ?auto_2706144 ?auto_2706147 ) ) ( not ( = ?auto_2706144 ?auto_2706148 ) ) ( not ( = ?auto_2706144 ?auto_2706149 ) ) ( not ( = ?auto_2706144 ?auto_2706150 ) ) ( not ( = ?auto_2706145 ?auto_2706146 ) ) ( not ( = ?auto_2706145 ?auto_2706147 ) ) ( not ( = ?auto_2706145 ?auto_2706148 ) ) ( not ( = ?auto_2706145 ?auto_2706149 ) ) ( not ( = ?auto_2706145 ?auto_2706150 ) ) ( not ( = ?auto_2706146 ?auto_2706147 ) ) ( not ( = ?auto_2706146 ?auto_2706148 ) ) ( not ( = ?auto_2706146 ?auto_2706149 ) ) ( not ( = ?auto_2706146 ?auto_2706150 ) ) ( not ( = ?auto_2706147 ?auto_2706148 ) ) ( not ( = ?auto_2706147 ?auto_2706149 ) ) ( not ( = ?auto_2706147 ?auto_2706150 ) ) ( not ( = ?auto_2706148 ?auto_2706149 ) ) ( not ( = ?auto_2706148 ?auto_2706150 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2706149 ?auto_2706150 )
      ( MAKE-13CRATE-VERIFY ?auto_2706137 ?auto_2706138 ?auto_2706139 ?auto_2706141 ?auto_2706140 ?auto_2706142 ?auto_2706143 ?auto_2706144 ?auto_2706145 ?auto_2706146 ?auto_2706147 ?auto_2706148 ?auto_2706149 ?auto_2706150 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2706279 - SURFACE
      ?auto_2706280 - SURFACE
      ?auto_2706281 - SURFACE
      ?auto_2706283 - SURFACE
      ?auto_2706282 - SURFACE
      ?auto_2706284 - SURFACE
      ?auto_2706285 - SURFACE
      ?auto_2706286 - SURFACE
      ?auto_2706287 - SURFACE
      ?auto_2706288 - SURFACE
      ?auto_2706289 - SURFACE
      ?auto_2706290 - SURFACE
      ?auto_2706291 - SURFACE
      ?auto_2706292 - SURFACE
    )
    :vars
    (
      ?auto_2706294 - HOIST
      ?auto_2706295 - PLACE
      ?auto_2706293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2706294 ?auto_2706295 ) ( SURFACE-AT ?auto_2706291 ?auto_2706295 ) ( CLEAR ?auto_2706291 ) ( IS-CRATE ?auto_2706292 ) ( not ( = ?auto_2706291 ?auto_2706292 ) ) ( TRUCK-AT ?auto_2706293 ?auto_2706295 ) ( AVAILABLE ?auto_2706294 ) ( IN ?auto_2706292 ?auto_2706293 ) ( ON ?auto_2706291 ?auto_2706290 ) ( not ( = ?auto_2706290 ?auto_2706291 ) ) ( not ( = ?auto_2706290 ?auto_2706292 ) ) ( ON ?auto_2706280 ?auto_2706279 ) ( ON ?auto_2706281 ?auto_2706280 ) ( ON ?auto_2706283 ?auto_2706281 ) ( ON ?auto_2706282 ?auto_2706283 ) ( ON ?auto_2706284 ?auto_2706282 ) ( ON ?auto_2706285 ?auto_2706284 ) ( ON ?auto_2706286 ?auto_2706285 ) ( ON ?auto_2706287 ?auto_2706286 ) ( ON ?auto_2706288 ?auto_2706287 ) ( ON ?auto_2706289 ?auto_2706288 ) ( ON ?auto_2706290 ?auto_2706289 ) ( not ( = ?auto_2706279 ?auto_2706280 ) ) ( not ( = ?auto_2706279 ?auto_2706281 ) ) ( not ( = ?auto_2706279 ?auto_2706283 ) ) ( not ( = ?auto_2706279 ?auto_2706282 ) ) ( not ( = ?auto_2706279 ?auto_2706284 ) ) ( not ( = ?auto_2706279 ?auto_2706285 ) ) ( not ( = ?auto_2706279 ?auto_2706286 ) ) ( not ( = ?auto_2706279 ?auto_2706287 ) ) ( not ( = ?auto_2706279 ?auto_2706288 ) ) ( not ( = ?auto_2706279 ?auto_2706289 ) ) ( not ( = ?auto_2706279 ?auto_2706290 ) ) ( not ( = ?auto_2706279 ?auto_2706291 ) ) ( not ( = ?auto_2706279 ?auto_2706292 ) ) ( not ( = ?auto_2706280 ?auto_2706281 ) ) ( not ( = ?auto_2706280 ?auto_2706283 ) ) ( not ( = ?auto_2706280 ?auto_2706282 ) ) ( not ( = ?auto_2706280 ?auto_2706284 ) ) ( not ( = ?auto_2706280 ?auto_2706285 ) ) ( not ( = ?auto_2706280 ?auto_2706286 ) ) ( not ( = ?auto_2706280 ?auto_2706287 ) ) ( not ( = ?auto_2706280 ?auto_2706288 ) ) ( not ( = ?auto_2706280 ?auto_2706289 ) ) ( not ( = ?auto_2706280 ?auto_2706290 ) ) ( not ( = ?auto_2706280 ?auto_2706291 ) ) ( not ( = ?auto_2706280 ?auto_2706292 ) ) ( not ( = ?auto_2706281 ?auto_2706283 ) ) ( not ( = ?auto_2706281 ?auto_2706282 ) ) ( not ( = ?auto_2706281 ?auto_2706284 ) ) ( not ( = ?auto_2706281 ?auto_2706285 ) ) ( not ( = ?auto_2706281 ?auto_2706286 ) ) ( not ( = ?auto_2706281 ?auto_2706287 ) ) ( not ( = ?auto_2706281 ?auto_2706288 ) ) ( not ( = ?auto_2706281 ?auto_2706289 ) ) ( not ( = ?auto_2706281 ?auto_2706290 ) ) ( not ( = ?auto_2706281 ?auto_2706291 ) ) ( not ( = ?auto_2706281 ?auto_2706292 ) ) ( not ( = ?auto_2706283 ?auto_2706282 ) ) ( not ( = ?auto_2706283 ?auto_2706284 ) ) ( not ( = ?auto_2706283 ?auto_2706285 ) ) ( not ( = ?auto_2706283 ?auto_2706286 ) ) ( not ( = ?auto_2706283 ?auto_2706287 ) ) ( not ( = ?auto_2706283 ?auto_2706288 ) ) ( not ( = ?auto_2706283 ?auto_2706289 ) ) ( not ( = ?auto_2706283 ?auto_2706290 ) ) ( not ( = ?auto_2706283 ?auto_2706291 ) ) ( not ( = ?auto_2706283 ?auto_2706292 ) ) ( not ( = ?auto_2706282 ?auto_2706284 ) ) ( not ( = ?auto_2706282 ?auto_2706285 ) ) ( not ( = ?auto_2706282 ?auto_2706286 ) ) ( not ( = ?auto_2706282 ?auto_2706287 ) ) ( not ( = ?auto_2706282 ?auto_2706288 ) ) ( not ( = ?auto_2706282 ?auto_2706289 ) ) ( not ( = ?auto_2706282 ?auto_2706290 ) ) ( not ( = ?auto_2706282 ?auto_2706291 ) ) ( not ( = ?auto_2706282 ?auto_2706292 ) ) ( not ( = ?auto_2706284 ?auto_2706285 ) ) ( not ( = ?auto_2706284 ?auto_2706286 ) ) ( not ( = ?auto_2706284 ?auto_2706287 ) ) ( not ( = ?auto_2706284 ?auto_2706288 ) ) ( not ( = ?auto_2706284 ?auto_2706289 ) ) ( not ( = ?auto_2706284 ?auto_2706290 ) ) ( not ( = ?auto_2706284 ?auto_2706291 ) ) ( not ( = ?auto_2706284 ?auto_2706292 ) ) ( not ( = ?auto_2706285 ?auto_2706286 ) ) ( not ( = ?auto_2706285 ?auto_2706287 ) ) ( not ( = ?auto_2706285 ?auto_2706288 ) ) ( not ( = ?auto_2706285 ?auto_2706289 ) ) ( not ( = ?auto_2706285 ?auto_2706290 ) ) ( not ( = ?auto_2706285 ?auto_2706291 ) ) ( not ( = ?auto_2706285 ?auto_2706292 ) ) ( not ( = ?auto_2706286 ?auto_2706287 ) ) ( not ( = ?auto_2706286 ?auto_2706288 ) ) ( not ( = ?auto_2706286 ?auto_2706289 ) ) ( not ( = ?auto_2706286 ?auto_2706290 ) ) ( not ( = ?auto_2706286 ?auto_2706291 ) ) ( not ( = ?auto_2706286 ?auto_2706292 ) ) ( not ( = ?auto_2706287 ?auto_2706288 ) ) ( not ( = ?auto_2706287 ?auto_2706289 ) ) ( not ( = ?auto_2706287 ?auto_2706290 ) ) ( not ( = ?auto_2706287 ?auto_2706291 ) ) ( not ( = ?auto_2706287 ?auto_2706292 ) ) ( not ( = ?auto_2706288 ?auto_2706289 ) ) ( not ( = ?auto_2706288 ?auto_2706290 ) ) ( not ( = ?auto_2706288 ?auto_2706291 ) ) ( not ( = ?auto_2706288 ?auto_2706292 ) ) ( not ( = ?auto_2706289 ?auto_2706290 ) ) ( not ( = ?auto_2706289 ?auto_2706291 ) ) ( not ( = ?auto_2706289 ?auto_2706292 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2706290 ?auto_2706291 ?auto_2706292 )
      ( MAKE-13CRATE-VERIFY ?auto_2706279 ?auto_2706280 ?auto_2706281 ?auto_2706283 ?auto_2706282 ?auto_2706284 ?auto_2706285 ?auto_2706286 ?auto_2706287 ?auto_2706288 ?auto_2706289 ?auto_2706290 ?auto_2706291 ?auto_2706292 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2706435 - SURFACE
      ?auto_2706436 - SURFACE
      ?auto_2706437 - SURFACE
      ?auto_2706439 - SURFACE
      ?auto_2706438 - SURFACE
      ?auto_2706440 - SURFACE
      ?auto_2706441 - SURFACE
      ?auto_2706442 - SURFACE
      ?auto_2706443 - SURFACE
      ?auto_2706444 - SURFACE
      ?auto_2706445 - SURFACE
      ?auto_2706446 - SURFACE
      ?auto_2706447 - SURFACE
      ?auto_2706448 - SURFACE
    )
    :vars
    (
      ?auto_2706450 - HOIST
      ?auto_2706449 - PLACE
      ?auto_2706451 - TRUCK
      ?auto_2706452 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2706450 ?auto_2706449 ) ( SURFACE-AT ?auto_2706447 ?auto_2706449 ) ( CLEAR ?auto_2706447 ) ( IS-CRATE ?auto_2706448 ) ( not ( = ?auto_2706447 ?auto_2706448 ) ) ( AVAILABLE ?auto_2706450 ) ( IN ?auto_2706448 ?auto_2706451 ) ( ON ?auto_2706447 ?auto_2706446 ) ( not ( = ?auto_2706446 ?auto_2706447 ) ) ( not ( = ?auto_2706446 ?auto_2706448 ) ) ( TRUCK-AT ?auto_2706451 ?auto_2706452 ) ( not ( = ?auto_2706452 ?auto_2706449 ) ) ( ON ?auto_2706436 ?auto_2706435 ) ( ON ?auto_2706437 ?auto_2706436 ) ( ON ?auto_2706439 ?auto_2706437 ) ( ON ?auto_2706438 ?auto_2706439 ) ( ON ?auto_2706440 ?auto_2706438 ) ( ON ?auto_2706441 ?auto_2706440 ) ( ON ?auto_2706442 ?auto_2706441 ) ( ON ?auto_2706443 ?auto_2706442 ) ( ON ?auto_2706444 ?auto_2706443 ) ( ON ?auto_2706445 ?auto_2706444 ) ( ON ?auto_2706446 ?auto_2706445 ) ( not ( = ?auto_2706435 ?auto_2706436 ) ) ( not ( = ?auto_2706435 ?auto_2706437 ) ) ( not ( = ?auto_2706435 ?auto_2706439 ) ) ( not ( = ?auto_2706435 ?auto_2706438 ) ) ( not ( = ?auto_2706435 ?auto_2706440 ) ) ( not ( = ?auto_2706435 ?auto_2706441 ) ) ( not ( = ?auto_2706435 ?auto_2706442 ) ) ( not ( = ?auto_2706435 ?auto_2706443 ) ) ( not ( = ?auto_2706435 ?auto_2706444 ) ) ( not ( = ?auto_2706435 ?auto_2706445 ) ) ( not ( = ?auto_2706435 ?auto_2706446 ) ) ( not ( = ?auto_2706435 ?auto_2706447 ) ) ( not ( = ?auto_2706435 ?auto_2706448 ) ) ( not ( = ?auto_2706436 ?auto_2706437 ) ) ( not ( = ?auto_2706436 ?auto_2706439 ) ) ( not ( = ?auto_2706436 ?auto_2706438 ) ) ( not ( = ?auto_2706436 ?auto_2706440 ) ) ( not ( = ?auto_2706436 ?auto_2706441 ) ) ( not ( = ?auto_2706436 ?auto_2706442 ) ) ( not ( = ?auto_2706436 ?auto_2706443 ) ) ( not ( = ?auto_2706436 ?auto_2706444 ) ) ( not ( = ?auto_2706436 ?auto_2706445 ) ) ( not ( = ?auto_2706436 ?auto_2706446 ) ) ( not ( = ?auto_2706436 ?auto_2706447 ) ) ( not ( = ?auto_2706436 ?auto_2706448 ) ) ( not ( = ?auto_2706437 ?auto_2706439 ) ) ( not ( = ?auto_2706437 ?auto_2706438 ) ) ( not ( = ?auto_2706437 ?auto_2706440 ) ) ( not ( = ?auto_2706437 ?auto_2706441 ) ) ( not ( = ?auto_2706437 ?auto_2706442 ) ) ( not ( = ?auto_2706437 ?auto_2706443 ) ) ( not ( = ?auto_2706437 ?auto_2706444 ) ) ( not ( = ?auto_2706437 ?auto_2706445 ) ) ( not ( = ?auto_2706437 ?auto_2706446 ) ) ( not ( = ?auto_2706437 ?auto_2706447 ) ) ( not ( = ?auto_2706437 ?auto_2706448 ) ) ( not ( = ?auto_2706439 ?auto_2706438 ) ) ( not ( = ?auto_2706439 ?auto_2706440 ) ) ( not ( = ?auto_2706439 ?auto_2706441 ) ) ( not ( = ?auto_2706439 ?auto_2706442 ) ) ( not ( = ?auto_2706439 ?auto_2706443 ) ) ( not ( = ?auto_2706439 ?auto_2706444 ) ) ( not ( = ?auto_2706439 ?auto_2706445 ) ) ( not ( = ?auto_2706439 ?auto_2706446 ) ) ( not ( = ?auto_2706439 ?auto_2706447 ) ) ( not ( = ?auto_2706439 ?auto_2706448 ) ) ( not ( = ?auto_2706438 ?auto_2706440 ) ) ( not ( = ?auto_2706438 ?auto_2706441 ) ) ( not ( = ?auto_2706438 ?auto_2706442 ) ) ( not ( = ?auto_2706438 ?auto_2706443 ) ) ( not ( = ?auto_2706438 ?auto_2706444 ) ) ( not ( = ?auto_2706438 ?auto_2706445 ) ) ( not ( = ?auto_2706438 ?auto_2706446 ) ) ( not ( = ?auto_2706438 ?auto_2706447 ) ) ( not ( = ?auto_2706438 ?auto_2706448 ) ) ( not ( = ?auto_2706440 ?auto_2706441 ) ) ( not ( = ?auto_2706440 ?auto_2706442 ) ) ( not ( = ?auto_2706440 ?auto_2706443 ) ) ( not ( = ?auto_2706440 ?auto_2706444 ) ) ( not ( = ?auto_2706440 ?auto_2706445 ) ) ( not ( = ?auto_2706440 ?auto_2706446 ) ) ( not ( = ?auto_2706440 ?auto_2706447 ) ) ( not ( = ?auto_2706440 ?auto_2706448 ) ) ( not ( = ?auto_2706441 ?auto_2706442 ) ) ( not ( = ?auto_2706441 ?auto_2706443 ) ) ( not ( = ?auto_2706441 ?auto_2706444 ) ) ( not ( = ?auto_2706441 ?auto_2706445 ) ) ( not ( = ?auto_2706441 ?auto_2706446 ) ) ( not ( = ?auto_2706441 ?auto_2706447 ) ) ( not ( = ?auto_2706441 ?auto_2706448 ) ) ( not ( = ?auto_2706442 ?auto_2706443 ) ) ( not ( = ?auto_2706442 ?auto_2706444 ) ) ( not ( = ?auto_2706442 ?auto_2706445 ) ) ( not ( = ?auto_2706442 ?auto_2706446 ) ) ( not ( = ?auto_2706442 ?auto_2706447 ) ) ( not ( = ?auto_2706442 ?auto_2706448 ) ) ( not ( = ?auto_2706443 ?auto_2706444 ) ) ( not ( = ?auto_2706443 ?auto_2706445 ) ) ( not ( = ?auto_2706443 ?auto_2706446 ) ) ( not ( = ?auto_2706443 ?auto_2706447 ) ) ( not ( = ?auto_2706443 ?auto_2706448 ) ) ( not ( = ?auto_2706444 ?auto_2706445 ) ) ( not ( = ?auto_2706444 ?auto_2706446 ) ) ( not ( = ?auto_2706444 ?auto_2706447 ) ) ( not ( = ?auto_2706444 ?auto_2706448 ) ) ( not ( = ?auto_2706445 ?auto_2706446 ) ) ( not ( = ?auto_2706445 ?auto_2706447 ) ) ( not ( = ?auto_2706445 ?auto_2706448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2706446 ?auto_2706447 ?auto_2706448 )
      ( MAKE-13CRATE-VERIFY ?auto_2706435 ?auto_2706436 ?auto_2706437 ?auto_2706439 ?auto_2706438 ?auto_2706440 ?auto_2706441 ?auto_2706442 ?auto_2706443 ?auto_2706444 ?auto_2706445 ?auto_2706446 ?auto_2706447 ?auto_2706448 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2706604 - SURFACE
      ?auto_2706605 - SURFACE
      ?auto_2706606 - SURFACE
      ?auto_2706608 - SURFACE
      ?auto_2706607 - SURFACE
      ?auto_2706609 - SURFACE
      ?auto_2706610 - SURFACE
      ?auto_2706611 - SURFACE
      ?auto_2706612 - SURFACE
      ?auto_2706613 - SURFACE
      ?auto_2706614 - SURFACE
      ?auto_2706615 - SURFACE
      ?auto_2706616 - SURFACE
      ?auto_2706617 - SURFACE
    )
    :vars
    (
      ?auto_2706621 - HOIST
      ?auto_2706620 - PLACE
      ?auto_2706619 - TRUCK
      ?auto_2706618 - PLACE
      ?auto_2706622 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2706621 ?auto_2706620 ) ( SURFACE-AT ?auto_2706616 ?auto_2706620 ) ( CLEAR ?auto_2706616 ) ( IS-CRATE ?auto_2706617 ) ( not ( = ?auto_2706616 ?auto_2706617 ) ) ( AVAILABLE ?auto_2706621 ) ( ON ?auto_2706616 ?auto_2706615 ) ( not ( = ?auto_2706615 ?auto_2706616 ) ) ( not ( = ?auto_2706615 ?auto_2706617 ) ) ( TRUCK-AT ?auto_2706619 ?auto_2706618 ) ( not ( = ?auto_2706618 ?auto_2706620 ) ) ( HOIST-AT ?auto_2706622 ?auto_2706618 ) ( LIFTING ?auto_2706622 ?auto_2706617 ) ( not ( = ?auto_2706621 ?auto_2706622 ) ) ( ON ?auto_2706605 ?auto_2706604 ) ( ON ?auto_2706606 ?auto_2706605 ) ( ON ?auto_2706608 ?auto_2706606 ) ( ON ?auto_2706607 ?auto_2706608 ) ( ON ?auto_2706609 ?auto_2706607 ) ( ON ?auto_2706610 ?auto_2706609 ) ( ON ?auto_2706611 ?auto_2706610 ) ( ON ?auto_2706612 ?auto_2706611 ) ( ON ?auto_2706613 ?auto_2706612 ) ( ON ?auto_2706614 ?auto_2706613 ) ( ON ?auto_2706615 ?auto_2706614 ) ( not ( = ?auto_2706604 ?auto_2706605 ) ) ( not ( = ?auto_2706604 ?auto_2706606 ) ) ( not ( = ?auto_2706604 ?auto_2706608 ) ) ( not ( = ?auto_2706604 ?auto_2706607 ) ) ( not ( = ?auto_2706604 ?auto_2706609 ) ) ( not ( = ?auto_2706604 ?auto_2706610 ) ) ( not ( = ?auto_2706604 ?auto_2706611 ) ) ( not ( = ?auto_2706604 ?auto_2706612 ) ) ( not ( = ?auto_2706604 ?auto_2706613 ) ) ( not ( = ?auto_2706604 ?auto_2706614 ) ) ( not ( = ?auto_2706604 ?auto_2706615 ) ) ( not ( = ?auto_2706604 ?auto_2706616 ) ) ( not ( = ?auto_2706604 ?auto_2706617 ) ) ( not ( = ?auto_2706605 ?auto_2706606 ) ) ( not ( = ?auto_2706605 ?auto_2706608 ) ) ( not ( = ?auto_2706605 ?auto_2706607 ) ) ( not ( = ?auto_2706605 ?auto_2706609 ) ) ( not ( = ?auto_2706605 ?auto_2706610 ) ) ( not ( = ?auto_2706605 ?auto_2706611 ) ) ( not ( = ?auto_2706605 ?auto_2706612 ) ) ( not ( = ?auto_2706605 ?auto_2706613 ) ) ( not ( = ?auto_2706605 ?auto_2706614 ) ) ( not ( = ?auto_2706605 ?auto_2706615 ) ) ( not ( = ?auto_2706605 ?auto_2706616 ) ) ( not ( = ?auto_2706605 ?auto_2706617 ) ) ( not ( = ?auto_2706606 ?auto_2706608 ) ) ( not ( = ?auto_2706606 ?auto_2706607 ) ) ( not ( = ?auto_2706606 ?auto_2706609 ) ) ( not ( = ?auto_2706606 ?auto_2706610 ) ) ( not ( = ?auto_2706606 ?auto_2706611 ) ) ( not ( = ?auto_2706606 ?auto_2706612 ) ) ( not ( = ?auto_2706606 ?auto_2706613 ) ) ( not ( = ?auto_2706606 ?auto_2706614 ) ) ( not ( = ?auto_2706606 ?auto_2706615 ) ) ( not ( = ?auto_2706606 ?auto_2706616 ) ) ( not ( = ?auto_2706606 ?auto_2706617 ) ) ( not ( = ?auto_2706608 ?auto_2706607 ) ) ( not ( = ?auto_2706608 ?auto_2706609 ) ) ( not ( = ?auto_2706608 ?auto_2706610 ) ) ( not ( = ?auto_2706608 ?auto_2706611 ) ) ( not ( = ?auto_2706608 ?auto_2706612 ) ) ( not ( = ?auto_2706608 ?auto_2706613 ) ) ( not ( = ?auto_2706608 ?auto_2706614 ) ) ( not ( = ?auto_2706608 ?auto_2706615 ) ) ( not ( = ?auto_2706608 ?auto_2706616 ) ) ( not ( = ?auto_2706608 ?auto_2706617 ) ) ( not ( = ?auto_2706607 ?auto_2706609 ) ) ( not ( = ?auto_2706607 ?auto_2706610 ) ) ( not ( = ?auto_2706607 ?auto_2706611 ) ) ( not ( = ?auto_2706607 ?auto_2706612 ) ) ( not ( = ?auto_2706607 ?auto_2706613 ) ) ( not ( = ?auto_2706607 ?auto_2706614 ) ) ( not ( = ?auto_2706607 ?auto_2706615 ) ) ( not ( = ?auto_2706607 ?auto_2706616 ) ) ( not ( = ?auto_2706607 ?auto_2706617 ) ) ( not ( = ?auto_2706609 ?auto_2706610 ) ) ( not ( = ?auto_2706609 ?auto_2706611 ) ) ( not ( = ?auto_2706609 ?auto_2706612 ) ) ( not ( = ?auto_2706609 ?auto_2706613 ) ) ( not ( = ?auto_2706609 ?auto_2706614 ) ) ( not ( = ?auto_2706609 ?auto_2706615 ) ) ( not ( = ?auto_2706609 ?auto_2706616 ) ) ( not ( = ?auto_2706609 ?auto_2706617 ) ) ( not ( = ?auto_2706610 ?auto_2706611 ) ) ( not ( = ?auto_2706610 ?auto_2706612 ) ) ( not ( = ?auto_2706610 ?auto_2706613 ) ) ( not ( = ?auto_2706610 ?auto_2706614 ) ) ( not ( = ?auto_2706610 ?auto_2706615 ) ) ( not ( = ?auto_2706610 ?auto_2706616 ) ) ( not ( = ?auto_2706610 ?auto_2706617 ) ) ( not ( = ?auto_2706611 ?auto_2706612 ) ) ( not ( = ?auto_2706611 ?auto_2706613 ) ) ( not ( = ?auto_2706611 ?auto_2706614 ) ) ( not ( = ?auto_2706611 ?auto_2706615 ) ) ( not ( = ?auto_2706611 ?auto_2706616 ) ) ( not ( = ?auto_2706611 ?auto_2706617 ) ) ( not ( = ?auto_2706612 ?auto_2706613 ) ) ( not ( = ?auto_2706612 ?auto_2706614 ) ) ( not ( = ?auto_2706612 ?auto_2706615 ) ) ( not ( = ?auto_2706612 ?auto_2706616 ) ) ( not ( = ?auto_2706612 ?auto_2706617 ) ) ( not ( = ?auto_2706613 ?auto_2706614 ) ) ( not ( = ?auto_2706613 ?auto_2706615 ) ) ( not ( = ?auto_2706613 ?auto_2706616 ) ) ( not ( = ?auto_2706613 ?auto_2706617 ) ) ( not ( = ?auto_2706614 ?auto_2706615 ) ) ( not ( = ?auto_2706614 ?auto_2706616 ) ) ( not ( = ?auto_2706614 ?auto_2706617 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2706615 ?auto_2706616 ?auto_2706617 )
      ( MAKE-13CRATE-VERIFY ?auto_2706604 ?auto_2706605 ?auto_2706606 ?auto_2706608 ?auto_2706607 ?auto_2706609 ?auto_2706610 ?auto_2706611 ?auto_2706612 ?auto_2706613 ?auto_2706614 ?auto_2706615 ?auto_2706616 ?auto_2706617 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2706786 - SURFACE
      ?auto_2706787 - SURFACE
      ?auto_2706788 - SURFACE
      ?auto_2706790 - SURFACE
      ?auto_2706789 - SURFACE
      ?auto_2706791 - SURFACE
      ?auto_2706792 - SURFACE
      ?auto_2706793 - SURFACE
      ?auto_2706794 - SURFACE
      ?auto_2706795 - SURFACE
      ?auto_2706796 - SURFACE
      ?auto_2706797 - SURFACE
      ?auto_2706798 - SURFACE
      ?auto_2706799 - SURFACE
    )
    :vars
    (
      ?auto_2706800 - HOIST
      ?auto_2706802 - PLACE
      ?auto_2706804 - TRUCK
      ?auto_2706805 - PLACE
      ?auto_2706801 - HOIST
      ?auto_2706803 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2706800 ?auto_2706802 ) ( SURFACE-AT ?auto_2706798 ?auto_2706802 ) ( CLEAR ?auto_2706798 ) ( IS-CRATE ?auto_2706799 ) ( not ( = ?auto_2706798 ?auto_2706799 ) ) ( AVAILABLE ?auto_2706800 ) ( ON ?auto_2706798 ?auto_2706797 ) ( not ( = ?auto_2706797 ?auto_2706798 ) ) ( not ( = ?auto_2706797 ?auto_2706799 ) ) ( TRUCK-AT ?auto_2706804 ?auto_2706805 ) ( not ( = ?auto_2706805 ?auto_2706802 ) ) ( HOIST-AT ?auto_2706801 ?auto_2706805 ) ( not ( = ?auto_2706800 ?auto_2706801 ) ) ( AVAILABLE ?auto_2706801 ) ( SURFACE-AT ?auto_2706799 ?auto_2706805 ) ( ON ?auto_2706799 ?auto_2706803 ) ( CLEAR ?auto_2706799 ) ( not ( = ?auto_2706798 ?auto_2706803 ) ) ( not ( = ?auto_2706799 ?auto_2706803 ) ) ( not ( = ?auto_2706797 ?auto_2706803 ) ) ( ON ?auto_2706787 ?auto_2706786 ) ( ON ?auto_2706788 ?auto_2706787 ) ( ON ?auto_2706790 ?auto_2706788 ) ( ON ?auto_2706789 ?auto_2706790 ) ( ON ?auto_2706791 ?auto_2706789 ) ( ON ?auto_2706792 ?auto_2706791 ) ( ON ?auto_2706793 ?auto_2706792 ) ( ON ?auto_2706794 ?auto_2706793 ) ( ON ?auto_2706795 ?auto_2706794 ) ( ON ?auto_2706796 ?auto_2706795 ) ( ON ?auto_2706797 ?auto_2706796 ) ( not ( = ?auto_2706786 ?auto_2706787 ) ) ( not ( = ?auto_2706786 ?auto_2706788 ) ) ( not ( = ?auto_2706786 ?auto_2706790 ) ) ( not ( = ?auto_2706786 ?auto_2706789 ) ) ( not ( = ?auto_2706786 ?auto_2706791 ) ) ( not ( = ?auto_2706786 ?auto_2706792 ) ) ( not ( = ?auto_2706786 ?auto_2706793 ) ) ( not ( = ?auto_2706786 ?auto_2706794 ) ) ( not ( = ?auto_2706786 ?auto_2706795 ) ) ( not ( = ?auto_2706786 ?auto_2706796 ) ) ( not ( = ?auto_2706786 ?auto_2706797 ) ) ( not ( = ?auto_2706786 ?auto_2706798 ) ) ( not ( = ?auto_2706786 ?auto_2706799 ) ) ( not ( = ?auto_2706786 ?auto_2706803 ) ) ( not ( = ?auto_2706787 ?auto_2706788 ) ) ( not ( = ?auto_2706787 ?auto_2706790 ) ) ( not ( = ?auto_2706787 ?auto_2706789 ) ) ( not ( = ?auto_2706787 ?auto_2706791 ) ) ( not ( = ?auto_2706787 ?auto_2706792 ) ) ( not ( = ?auto_2706787 ?auto_2706793 ) ) ( not ( = ?auto_2706787 ?auto_2706794 ) ) ( not ( = ?auto_2706787 ?auto_2706795 ) ) ( not ( = ?auto_2706787 ?auto_2706796 ) ) ( not ( = ?auto_2706787 ?auto_2706797 ) ) ( not ( = ?auto_2706787 ?auto_2706798 ) ) ( not ( = ?auto_2706787 ?auto_2706799 ) ) ( not ( = ?auto_2706787 ?auto_2706803 ) ) ( not ( = ?auto_2706788 ?auto_2706790 ) ) ( not ( = ?auto_2706788 ?auto_2706789 ) ) ( not ( = ?auto_2706788 ?auto_2706791 ) ) ( not ( = ?auto_2706788 ?auto_2706792 ) ) ( not ( = ?auto_2706788 ?auto_2706793 ) ) ( not ( = ?auto_2706788 ?auto_2706794 ) ) ( not ( = ?auto_2706788 ?auto_2706795 ) ) ( not ( = ?auto_2706788 ?auto_2706796 ) ) ( not ( = ?auto_2706788 ?auto_2706797 ) ) ( not ( = ?auto_2706788 ?auto_2706798 ) ) ( not ( = ?auto_2706788 ?auto_2706799 ) ) ( not ( = ?auto_2706788 ?auto_2706803 ) ) ( not ( = ?auto_2706790 ?auto_2706789 ) ) ( not ( = ?auto_2706790 ?auto_2706791 ) ) ( not ( = ?auto_2706790 ?auto_2706792 ) ) ( not ( = ?auto_2706790 ?auto_2706793 ) ) ( not ( = ?auto_2706790 ?auto_2706794 ) ) ( not ( = ?auto_2706790 ?auto_2706795 ) ) ( not ( = ?auto_2706790 ?auto_2706796 ) ) ( not ( = ?auto_2706790 ?auto_2706797 ) ) ( not ( = ?auto_2706790 ?auto_2706798 ) ) ( not ( = ?auto_2706790 ?auto_2706799 ) ) ( not ( = ?auto_2706790 ?auto_2706803 ) ) ( not ( = ?auto_2706789 ?auto_2706791 ) ) ( not ( = ?auto_2706789 ?auto_2706792 ) ) ( not ( = ?auto_2706789 ?auto_2706793 ) ) ( not ( = ?auto_2706789 ?auto_2706794 ) ) ( not ( = ?auto_2706789 ?auto_2706795 ) ) ( not ( = ?auto_2706789 ?auto_2706796 ) ) ( not ( = ?auto_2706789 ?auto_2706797 ) ) ( not ( = ?auto_2706789 ?auto_2706798 ) ) ( not ( = ?auto_2706789 ?auto_2706799 ) ) ( not ( = ?auto_2706789 ?auto_2706803 ) ) ( not ( = ?auto_2706791 ?auto_2706792 ) ) ( not ( = ?auto_2706791 ?auto_2706793 ) ) ( not ( = ?auto_2706791 ?auto_2706794 ) ) ( not ( = ?auto_2706791 ?auto_2706795 ) ) ( not ( = ?auto_2706791 ?auto_2706796 ) ) ( not ( = ?auto_2706791 ?auto_2706797 ) ) ( not ( = ?auto_2706791 ?auto_2706798 ) ) ( not ( = ?auto_2706791 ?auto_2706799 ) ) ( not ( = ?auto_2706791 ?auto_2706803 ) ) ( not ( = ?auto_2706792 ?auto_2706793 ) ) ( not ( = ?auto_2706792 ?auto_2706794 ) ) ( not ( = ?auto_2706792 ?auto_2706795 ) ) ( not ( = ?auto_2706792 ?auto_2706796 ) ) ( not ( = ?auto_2706792 ?auto_2706797 ) ) ( not ( = ?auto_2706792 ?auto_2706798 ) ) ( not ( = ?auto_2706792 ?auto_2706799 ) ) ( not ( = ?auto_2706792 ?auto_2706803 ) ) ( not ( = ?auto_2706793 ?auto_2706794 ) ) ( not ( = ?auto_2706793 ?auto_2706795 ) ) ( not ( = ?auto_2706793 ?auto_2706796 ) ) ( not ( = ?auto_2706793 ?auto_2706797 ) ) ( not ( = ?auto_2706793 ?auto_2706798 ) ) ( not ( = ?auto_2706793 ?auto_2706799 ) ) ( not ( = ?auto_2706793 ?auto_2706803 ) ) ( not ( = ?auto_2706794 ?auto_2706795 ) ) ( not ( = ?auto_2706794 ?auto_2706796 ) ) ( not ( = ?auto_2706794 ?auto_2706797 ) ) ( not ( = ?auto_2706794 ?auto_2706798 ) ) ( not ( = ?auto_2706794 ?auto_2706799 ) ) ( not ( = ?auto_2706794 ?auto_2706803 ) ) ( not ( = ?auto_2706795 ?auto_2706796 ) ) ( not ( = ?auto_2706795 ?auto_2706797 ) ) ( not ( = ?auto_2706795 ?auto_2706798 ) ) ( not ( = ?auto_2706795 ?auto_2706799 ) ) ( not ( = ?auto_2706795 ?auto_2706803 ) ) ( not ( = ?auto_2706796 ?auto_2706797 ) ) ( not ( = ?auto_2706796 ?auto_2706798 ) ) ( not ( = ?auto_2706796 ?auto_2706799 ) ) ( not ( = ?auto_2706796 ?auto_2706803 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2706797 ?auto_2706798 ?auto_2706799 )
      ( MAKE-13CRATE-VERIFY ?auto_2706786 ?auto_2706787 ?auto_2706788 ?auto_2706790 ?auto_2706789 ?auto_2706791 ?auto_2706792 ?auto_2706793 ?auto_2706794 ?auto_2706795 ?auto_2706796 ?auto_2706797 ?auto_2706798 ?auto_2706799 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2706969 - SURFACE
      ?auto_2706970 - SURFACE
      ?auto_2706971 - SURFACE
      ?auto_2706973 - SURFACE
      ?auto_2706972 - SURFACE
      ?auto_2706974 - SURFACE
      ?auto_2706975 - SURFACE
      ?auto_2706976 - SURFACE
      ?auto_2706977 - SURFACE
      ?auto_2706978 - SURFACE
      ?auto_2706979 - SURFACE
      ?auto_2706980 - SURFACE
      ?auto_2706981 - SURFACE
      ?auto_2706982 - SURFACE
    )
    :vars
    (
      ?auto_2706988 - HOIST
      ?auto_2706986 - PLACE
      ?auto_2706984 - PLACE
      ?auto_2706987 - HOIST
      ?auto_2706985 - SURFACE
      ?auto_2706983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2706988 ?auto_2706986 ) ( SURFACE-AT ?auto_2706981 ?auto_2706986 ) ( CLEAR ?auto_2706981 ) ( IS-CRATE ?auto_2706982 ) ( not ( = ?auto_2706981 ?auto_2706982 ) ) ( AVAILABLE ?auto_2706988 ) ( ON ?auto_2706981 ?auto_2706980 ) ( not ( = ?auto_2706980 ?auto_2706981 ) ) ( not ( = ?auto_2706980 ?auto_2706982 ) ) ( not ( = ?auto_2706984 ?auto_2706986 ) ) ( HOIST-AT ?auto_2706987 ?auto_2706984 ) ( not ( = ?auto_2706988 ?auto_2706987 ) ) ( AVAILABLE ?auto_2706987 ) ( SURFACE-AT ?auto_2706982 ?auto_2706984 ) ( ON ?auto_2706982 ?auto_2706985 ) ( CLEAR ?auto_2706982 ) ( not ( = ?auto_2706981 ?auto_2706985 ) ) ( not ( = ?auto_2706982 ?auto_2706985 ) ) ( not ( = ?auto_2706980 ?auto_2706985 ) ) ( TRUCK-AT ?auto_2706983 ?auto_2706986 ) ( ON ?auto_2706970 ?auto_2706969 ) ( ON ?auto_2706971 ?auto_2706970 ) ( ON ?auto_2706973 ?auto_2706971 ) ( ON ?auto_2706972 ?auto_2706973 ) ( ON ?auto_2706974 ?auto_2706972 ) ( ON ?auto_2706975 ?auto_2706974 ) ( ON ?auto_2706976 ?auto_2706975 ) ( ON ?auto_2706977 ?auto_2706976 ) ( ON ?auto_2706978 ?auto_2706977 ) ( ON ?auto_2706979 ?auto_2706978 ) ( ON ?auto_2706980 ?auto_2706979 ) ( not ( = ?auto_2706969 ?auto_2706970 ) ) ( not ( = ?auto_2706969 ?auto_2706971 ) ) ( not ( = ?auto_2706969 ?auto_2706973 ) ) ( not ( = ?auto_2706969 ?auto_2706972 ) ) ( not ( = ?auto_2706969 ?auto_2706974 ) ) ( not ( = ?auto_2706969 ?auto_2706975 ) ) ( not ( = ?auto_2706969 ?auto_2706976 ) ) ( not ( = ?auto_2706969 ?auto_2706977 ) ) ( not ( = ?auto_2706969 ?auto_2706978 ) ) ( not ( = ?auto_2706969 ?auto_2706979 ) ) ( not ( = ?auto_2706969 ?auto_2706980 ) ) ( not ( = ?auto_2706969 ?auto_2706981 ) ) ( not ( = ?auto_2706969 ?auto_2706982 ) ) ( not ( = ?auto_2706969 ?auto_2706985 ) ) ( not ( = ?auto_2706970 ?auto_2706971 ) ) ( not ( = ?auto_2706970 ?auto_2706973 ) ) ( not ( = ?auto_2706970 ?auto_2706972 ) ) ( not ( = ?auto_2706970 ?auto_2706974 ) ) ( not ( = ?auto_2706970 ?auto_2706975 ) ) ( not ( = ?auto_2706970 ?auto_2706976 ) ) ( not ( = ?auto_2706970 ?auto_2706977 ) ) ( not ( = ?auto_2706970 ?auto_2706978 ) ) ( not ( = ?auto_2706970 ?auto_2706979 ) ) ( not ( = ?auto_2706970 ?auto_2706980 ) ) ( not ( = ?auto_2706970 ?auto_2706981 ) ) ( not ( = ?auto_2706970 ?auto_2706982 ) ) ( not ( = ?auto_2706970 ?auto_2706985 ) ) ( not ( = ?auto_2706971 ?auto_2706973 ) ) ( not ( = ?auto_2706971 ?auto_2706972 ) ) ( not ( = ?auto_2706971 ?auto_2706974 ) ) ( not ( = ?auto_2706971 ?auto_2706975 ) ) ( not ( = ?auto_2706971 ?auto_2706976 ) ) ( not ( = ?auto_2706971 ?auto_2706977 ) ) ( not ( = ?auto_2706971 ?auto_2706978 ) ) ( not ( = ?auto_2706971 ?auto_2706979 ) ) ( not ( = ?auto_2706971 ?auto_2706980 ) ) ( not ( = ?auto_2706971 ?auto_2706981 ) ) ( not ( = ?auto_2706971 ?auto_2706982 ) ) ( not ( = ?auto_2706971 ?auto_2706985 ) ) ( not ( = ?auto_2706973 ?auto_2706972 ) ) ( not ( = ?auto_2706973 ?auto_2706974 ) ) ( not ( = ?auto_2706973 ?auto_2706975 ) ) ( not ( = ?auto_2706973 ?auto_2706976 ) ) ( not ( = ?auto_2706973 ?auto_2706977 ) ) ( not ( = ?auto_2706973 ?auto_2706978 ) ) ( not ( = ?auto_2706973 ?auto_2706979 ) ) ( not ( = ?auto_2706973 ?auto_2706980 ) ) ( not ( = ?auto_2706973 ?auto_2706981 ) ) ( not ( = ?auto_2706973 ?auto_2706982 ) ) ( not ( = ?auto_2706973 ?auto_2706985 ) ) ( not ( = ?auto_2706972 ?auto_2706974 ) ) ( not ( = ?auto_2706972 ?auto_2706975 ) ) ( not ( = ?auto_2706972 ?auto_2706976 ) ) ( not ( = ?auto_2706972 ?auto_2706977 ) ) ( not ( = ?auto_2706972 ?auto_2706978 ) ) ( not ( = ?auto_2706972 ?auto_2706979 ) ) ( not ( = ?auto_2706972 ?auto_2706980 ) ) ( not ( = ?auto_2706972 ?auto_2706981 ) ) ( not ( = ?auto_2706972 ?auto_2706982 ) ) ( not ( = ?auto_2706972 ?auto_2706985 ) ) ( not ( = ?auto_2706974 ?auto_2706975 ) ) ( not ( = ?auto_2706974 ?auto_2706976 ) ) ( not ( = ?auto_2706974 ?auto_2706977 ) ) ( not ( = ?auto_2706974 ?auto_2706978 ) ) ( not ( = ?auto_2706974 ?auto_2706979 ) ) ( not ( = ?auto_2706974 ?auto_2706980 ) ) ( not ( = ?auto_2706974 ?auto_2706981 ) ) ( not ( = ?auto_2706974 ?auto_2706982 ) ) ( not ( = ?auto_2706974 ?auto_2706985 ) ) ( not ( = ?auto_2706975 ?auto_2706976 ) ) ( not ( = ?auto_2706975 ?auto_2706977 ) ) ( not ( = ?auto_2706975 ?auto_2706978 ) ) ( not ( = ?auto_2706975 ?auto_2706979 ) ) ( not ( = ?auto_2706975 ?auto_2706980 ) ) ( not ( = ?auto_2706975 ?auto_2706981 ) ) ( not ( = ?auto_2706975 ?auto_2706982 ) ) ( not ( = ?auto_2706975 ?auto_2706985 ) ) ( not ( = ?auto_2706976 ?auto_2706977 ) ) ( not ( = ?auto_2706976 ?auto_2706978 ) ) ( not ( = ?auto_2706976 ?auto_2706979 ) ) ( not ( = ?auto_2706976 ?auto_2706980 ) ) ( not ( = ?auto_2706976 ?auto_2706981 ) ) ( not ( = ?auto_2706976 ?auto_2706982 ) ) ( not ( = ?auto_2706976 ?auto_2706985 ) ) ( not ( = ?auto_2706977 ?auto_2706978 ) ) ( not ( = ?auto_2706977 ?auto_2706979 ) ) ( not ( = ?auto_2706977 ?auto_2706980 ) ) ( not ( = ?auto_2706977 ?auto_2706981 ) ) ( not ( = ?auto_2706977 ?auto_2706982 ) ) ( not ( = ?auto_2706977 ?auto_2706985 ) ) ( not ( = ?auto_2706978 ?auto_2706979 ) ) ( not ( = ?auto_2706978 ?auto_2706980 ) ) ( not ( = ?auto_2706978 ?auto_2706981 ) ) ( not ( = ?auto_2706978 ?auto_2706982 ) ) ( not ( = ?auto_2706978 ?auto_2706985 ) ) ( not ( = ?auto_2706979 ?auto_2706980 ) ) ( not ( = ?auto_2706979 ?auto_2706981 ) ) ( not ( = ?auto_2706979 ?auto_2706982 ) ) ( not ( = ?auto_2706979 ?auto_2706985 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2706980 ?auto_2706981 ?auto_2706982 )
      ( MAKE-13CRATE-VERIFY ?auto_2706969 ?auto_2706970 ?auto_2706971 ?auto_2706973 ?auto_2706972 ?auto_2706974 ?auto_2706975 ?auto_2706976 ?auto_2706977 ?auto_2706978 ?auto_2706979 ?auto_2706980 ?auto_2706981 ?auto_2706982 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2707152 - SURFACE
      ?auto_2707153 - SURFACE
      ?auto_2707154 - SURFACE
      ?auto_2707156 - SURFACE
      ?auto_2707155 - SURFACE
      ?auto_2707157 - SURFACE
      ?auto_2707158 - SURFACE
      ?auto_2707159 - SURFACE
      ?auto_2707160 - SURFACE
      ?auto_2707161 - SURFACE
      ?auto_2707162 - SURFACE
      ?auto_2707163 - SURFACE
      ?auto_2707164 - SURFACE
      ?auto_2707165 - SURFACE
    )
    :vars
    (
      ?auto_2707171 - HOIST
      ?auto_2707166 - PLACE
      ?auto_2707170 - PLACE
      ?auto_2707167 - HOIST
      ?auto_2707169 - SURFACE
      ?auto_2707168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2707171 ?auto_2707166 ) ( IS-CRATE ?auto_2707165 ) ( not ( = ?auto_2707164 ?auto_2707165 ) ) ( not ( = ?auto_2707163 ?auto_2707164 ) ) ( not ( = ?auto_2707163 ?auto_2707165 ) ) ( not ( = ?auto_2707170 ?auto_2707166 ) ) ( HOIST-AT ?auto_2707167 ?auto_2707170 ) ( not ( = ?auto_2707171 ?auto_2707167 ) ) ( AVAILABLE ?auto_2707167 ) ( SURFACE-AT ?auto_2707165 ?auto_2707170 ) ( ON ?auto_2707165 ?auto_2707169 ) ( CLEAR ?auto_2707165 ) ( not ( = ?auto_2707164 ?auto_2707169 ) ) ( not ( = ?auto_2707165 ?auto_2707169 ) ) ( not ( = ?auto_2707163 ?auto_2707169 ) ) ( TRUCK-AT ?auto_2707168 ?auto_2707166 ) ( SURFACE-AT ?auto_2707163 ?auto_2707166 ) ( CLEAR ?auto_2707163 ) ( LIFTING ?auto_2707171 ?auto_2707164 ) ( IS-CRATE ?auto_2707164 ) ( ON ?auto_2707153 ?auto_2707152 ) ( ON ?auto_2707154 ?auto_2707153 ) ( ON ?auto_2707156 ?auto_2707154 ) ( ON ?auto_2707155 ?auto_2707156 ) ( ON ?auto_2707157 ?auto_2707155 ) ( ON ?auto_2707158 ?auto_2707157 ) ( ON ?auto_2707159 ?auto_2707158 ) ( ON ?auto_2707160 ?auto_2707159 ) ( ON ?auto_2707161 ?auto_2707160 ) ( ON ?auto_2707162 ?auto_2707161 ) ( ON ?auto_2707163 ?auto_2707162 ) ( not ( = ?auto_2707152 ?auto_2707153 ) ) ( not ( = ?auto_2707152 ?auto_2707154 ) ) ( not ( = ?auto_2707152 ?auto_2707156 ) ) ( not ( = ?auto_2707152 ?auto_2707155 ) ) ( not ( = ?auto_2707152 ?auto_2707157 ) ) ( not ( = ?auto_2707152 ?auto_2707158 ) ) ( not ( = ?auto_2707152 ?auto_2707159 ) ) ( not ( = ?auto_2707152 ?auto_2707160 ) ) ( not ( = ?auto_2707152 ?auto_2707161 ) ) ( not ( = ?auto_2707152 ?auto_2707162 ) ) ( not ( = ?auto_2707152 ?auto_2707163 ) ) ( not ( = ?auto_2707152 ?auto_2707164 ) ) ( not ( = ?auto_2707152 ?auto_2707165 ) ) ( not ( = ?auto_2707152 ?auto_2707169 ) ) ( not ( = ?auto_2707153 ?auto_2707154 ) ) ( not ( = ?auto_2707153 ?auto_2707156 ) ) ( not ( = ?auto_2707153 ?auto_2707155 ) ) ( not ( = ?auto_2707153 ?auto_2707157 ) ) ( not ( = ?auto_2707153 ?auto_2707158 ) ) ( not ( = ?auto_2707153 ?auto_2707159 ) ) ( not ( = ?auto_2707153 ?auto_2707160 ) ) ( not ( = ?auto_2707153 ?auto_2707161 ) ) ( not ( = ?auto_2707153 ?auto_2707162 ) ) ( not ( = ?auto_2707153 ?auto_2707163 ) ) ( not ( = ?auto_2707153 ?auto_2707164 ) ) ( not ( = ?auto_2707153 ?auto_2707165 ) ) ( not ( = ?auto_2707153 ?auto_2707169 ) ) ( not ( = ?auto_2707154 ?auto_2707156 ) ) ( not ( = ?auto_2707154 ?auto_2707155 ) ) ( not ( = ?auto_2707154 ?auto_2707157 ) ) ( not ( = ?auto_2707154 ?auto_2707158 ) ) ( not ( = ?auto_2707154 ?auto_2707159 ) ) ( not ( = ?auto_2707154 ?auto_2707160 ) ) ( not ( = ?auto_2707154 ?auto_2707161 ) ) ( not ( = ?auto_2707154 ?auto_2707162 ) ) ( not ( = ?auto_2707154 ?auto_2707163 ) ) ( not ( = ?auto_2707154 ?auto_2707164 ) ) ( not ( = ?auto_2707154 ?auto_2707165 ) ) ( not ( = ?auto_2707154 ?auto_2707169 ) ) ( not ( = ?auto_2707156 ?auto_2707155 ) ) ( not ( = ?auto_2707156 ?auto_2707157 ) ) ( not ( = ?auto_2707156 ?auto_2707158 ) ) ( not ( = ?auto_2707156 ?auto_2707159 ) ) ( not ( = ?auto_2707156 ?auto_2707160 ) ) ( not ( = ?auto_2707156 ?auto_2707161 ) ) ( not ( = ?auto_2707156 ?auto_2707162 ) ) ( not ( = ?auto_2707156 ?auto_2707163 ) ) ( not ( = ?auto_2707156 ?auto_2707164 ) ) ( not ( = ?auto_2707156 ?auto_2707165 ) ) ( not ( = ?auto_2707156 ?auto_2707169 ) ) ( not ( = ?auto_2707155 ?auto_2707157 ) ) ( not ( = ?auto_2707155 ?auto_2707158 ) ) ( not ( = ?auto_2707155 ?auto_2707159 ) ) ( not ( = ?auto_2707155 ?auto_2707160 ) ) ( not ( = ?auto_2707155 ?auto_2707161 ) ) ( not ( = ?auto_2707155 ?auto_2707162 ) ) ( not ( = ?auto_2707155 ?auto_2707163 ) ) ( not ( = ?auto_2707155 ?auto_2707164 ) ) ( not ( = ?auto_2707155 ?auto_2707165 ) ) ( not ( = ?auto_2707155 ?auto_2707169 ) ) ( not ( = ?auto_2707157 ?auto_2707158 ) ) ( not ( = ?auto_2707157 ?auto_2707159 ) ) ( not ( = ?auto_2707157 ?auto_2707160 ) ) ( not ( = ?auto_2707157 ?auto_2707161 ) ) ( not ( = ?auto_2707157 ?auto_2707162 ) ) ( not ( = ?auto_2707157 ?auto_2707163 ) ) ( not ( = ?auto_2707157 ?auto_2707164 ) ) ( not ( = ?auto_2707157 ?auto_2707165 ) ) ( not ( = ?auto_2707157 ?auto_2707169 ) ) ( not ( = ?auto_2707158 ?auto_2707159 ) ) ( not ( = ?auto_2707158 ?auto_2707160 ) ) ( not ( = ?auto_2707158 ?auto_2707161 ) ) ( not ( = ?auto_2707158 ?auto_2707162 ) ) ( not ( = ?auto_2707158 ?auto_2707163 ) ) ( not ( = ?auto_2707158 ?auto_2707164 ) ) ( not ( = ?auto_2707158 ?auto_2707165 ) ) ( not ( = ?auto_2707158 ?auto_2707169 ) ) ( not ( = ?auto_2707159 ?auto_2707160 ) ) ( not ( = ?auto_2707159 ?auto_2707161 ) ) ( not ( = ?auto_2707159 ?auto_2707162 ) ) ( not ( = ?auto_2707159 ?auto_2707163 ) ) ( not ( = ?auto_2707159 ?auto_2707164 ) ) ( not ( = ?auto_2707159 ?auto_2707165 ) ) ( not ( = ?auto_2707159 ?auto_2707169 ) ) ( not ( = ?auto_2707160 ?auto_2707161 ) ) ( not ( = ?auto_2707160 ?auto_2707162 ) ) ( not ( = ?auto_2707160 ?auto_2707163 ) ) ( not ( = ?auto_2707160 ?auto_2707164 ) ) ( not ( = ?auto_2707160 ?auto_2707165 ) ) ( not ( = ?auto_2707160 ?auto_2707169 ) ) ( not ( = ?auto_2707161 ?auto_2707162 ) ) ( not ( = ?auto_2707161 ?auto_2707163 ) ) ( not ( = ?auto_2707161 ?auto_2707164 ) ) ( not ( = ?auto_2707161 ?auto_2707165 ) ) ( not ( = ?auto_2707161 ?auto_2707169 ) ) ( not ( = ?auto_2707162 ?auto_2707163 ) ) ( not ( = ?auto_2707162 ?auto_2707164 ) ) ( not ( = ?auto_2707162 ?auto_2707165 ) ) ( not ( = ?auto_2707162 ?auto_2707169 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2707163 ?auto_2707164 ?auto_2707165 )
      ( MAKE-13CRATE-VERIFY ?auto_2707152 ?auto_2707153 ?auto_2707154 ?auto_2707156 ?auto_2707155 ?auto_2707157 ?auto_2707158 ?auto_2707159 ?auto_2707160 ?auto_2707161 ?auto_2707162 ?auto_2707163 ?auto_2707164 ?auto_2707165 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2707335 - SURFACE
      ?auto_2707336 - SURFACE
      ?auto_2707337 - SURFACE
      ?auto_2707339 - SURFACE
      ?auto_2707338 - SURFACE
      ?auto_2707340 - SURFACE
      ?auto_2707341 - SURFACE
      ?auto_2707342 - SURFACE
      ?auto_2707343 - SURFACE
      ?auto_2707344 - SURFACE
      ?auto_2707345 - SURFACE
      ?auto_2707346 - SURFACE
      ?auto_2707347 - SURFACE
      ?auto_2707348 - SURFACE
    )
    :vars
    (
      ?auto_2707352 - HOIST
      ?auto_2707354 - PLACE
      ?auto_2707349 - PLACE
      ?auto_2707350 - HOIST
      ?auto_2707351 - SURFACE
      ?auto_2707353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2707352 ?auto_2707354 ) ( IS-CRATE ?auto_2707348 ) ( not ( = ?auto_2707347 ?auto_2707348 ) ) ( not ( = ?auto_2707346 ?auto_2707347 ) ) ( not ( = ?auto_2707346 ?auto_2707348 ) ) ( not ( = ?auto_2707349 ?auto_2707354 ) ) ( HOIST-AT ?auto_2707350 ?auto_2707349 ) ( not ( = ?auto_2707352 ?auto_2707350 ) ) ( AVAILABLE ?auto_2707350 ) ( SURFACE-AT ?auto_2707348 ?auto_2707349 ) ( ON ?auto_2707348 ?auto_2707351 ) ( CLEAR ?auto_2707348 ) ( not ( = ?auto_2707347 ?auto_2707351 ) ) ( not ( = ?auto_2707348 ?auto_2707351 ) ) ( not ( = ?auto_2707346 ?auto_2707351 ) ) ( TRUCK-AT ?auto_2707353 ?auto_2707354 ) ( SURFACE-AT ?auto_2707346 ?auto_2707354 ) ( CLEAR ?auto_2707346 ) ( IS-CRATE ?auto_2707347 ) ( AVAILABLE ?auto_2707352 ) ( IN ?auto_2707347 ?auto_2707353 ) ( ON ?auto_2707336 ?auto_2707335 ) ( ON ?auto_2707337 ?auto_2707336 ) ( ON ?auto_2707339 ?auto_2707337 ) ( ON ?auto_2707338 ?auto_2707339 ) ( ON ?auto_2707340 ?auto_2707338 ) ( ON ?auto_2707341 ?auto_2707340 ) ( ON ?auto_2707342 ?auto_2707341 ) ( ON ?auto_2707343 ?auto_2707342 ) ( ON ?auto_2707344 ?auto_2707343 ) ( ON ?auto_2707345 ?auto_2707344 ) ( ON ?auto_2707346 ?auto_2707345 ) ( not ( = ?auto_2707335 ?auto_2707336 ) ) ( not ( = ?auto_2707335 ?auto_2707337 ) ) ( not ( = ?auto_2707335 ?auto_2707339 ) ) ( not ( = ?auto_2707335 ?auto_2707338 ) ) ( not ( = ?auto_2707335 ?auto_2707340 ) ) ( not ( = ?auto_2707335 ?auto_2707341 ) ) ( not ( = ?auto_2707335 ?auto_2707342 ) ) ( not ( = ?auto_2707335 ?auto_2707343 ) ) ( not ( = ?auto_2707335 ?auto_2707344 ) ) ( not ( = ?auto_2707335 ?auto_2707345 ) ) ( not ( = ?auto_2707335 ?auto_2707346 ) ) ( not ( = ?auto_2707335 ?auto_2707347 ) ) ( not ( = ?auto_2707335 ?auto_2707348 ) ) ( not ( = ?auto_2707335 ?auto_2707351 ) ) ( not ( = ?auto_2707336 ?auto_2707337 ) ) ( not ( = ?auto_2707336 ?auto_2707339 ) ) ( not ( = ?auto_2707336 ?auto_2707338 ) ) ( not ( = ?auto_2707336 ?auto_2707340 ) ) ( not ( = ?auto_2707336 ?auto_2707341 ) ) ( not ( = ?auto_2707336 ?auto_2707342 ) ) ( not ( = ?auto_2707336 ?auto_2707343 ) ) ( not ( = ?auto_2707336 ?auto_2707344 ) ) ( not ( = ?auto_2707336 ?auto_2707345 ) ) ( not ( = ?auto_2707336 ?auto_2707346 ) ) ( not ( = ?auto_2707336 ?auto_2707347 ) ) ( not ( = ?auto_2707336 ?auto_2707348 ) ) ( not ( = ?auto_2707336 ?auto_2707351 ) ) ( not ( = ?auto_2707337 ?auto_2707339 ) ) ( not ( = ?auto_2707337 ?auto_2707338 ) ) ( not ( = ?auto_2707337 ?auto_2707340 ) ) ( not ( = ?auto_2707337 ?auto_2707341 ) ) ( not ( = ?auto_2707337 ?auto_2707342 ) ) ( not ( = ?auto_2707337 ?auto_2707343 ) ) ( not ( = ?auto_2707337 ?auto_2707344 ) ) ( not ( = ?auto_2707337 ?auto_2707345 ) ) ( not ( = ?auto_2707337 ?auto_2707346 ) ) ( not ( = ?auto_2707337 ?auto_2707347 ) ) ( not ( = ?auto_2707337 ?auto_2707348 ) ) ( not ( = ?auto_2707337 ?auto_2707351 ) ) ( not ( = ?auto_2707339 ?auto_2707338 ) ) ( not ( = ?auto_2707339 ?auto_2707340 ) ) ( not ( = ?auto_2707339 ?auto_2707341 ) ) ( not ( = ?auto_2707339 ?auto_2707342 ) ) ( not ( = ?auto_2707339 ?auto_2707343 ) ) ( not ( = ?auto_2707339 ?auto_2707344 ) ) ( not ( = ?auto_2707339 ?auto_2707345 ) ) ( not ( = ?auto_2707339 ?auto_2707346 ) ) ( not ( = ?auto_2707339 ?auto_2707347 ) ) ( not ( = ?auto_2707339 ?auto_2707348 ) ) ( not ( = ?auto_2707339 ?auto_2707351 ) ) ( not ( = ?auto_2707338 ?auto_2707340 ) ) ( not ( = ?auto_2707338 ?auto_2707341 ) ) ( not ( = ?auto_2707338 ?auto_2707342 ) ) ( not ( = ?auto_2707338 ?auto_2707343 ) ) ( not ( = ?auto_2707338 ?auto_2707344 ) ) ( not ( = ?auto_2707338 ?auto_2707345 ) ) ( not ( = ?auto_2707338 ?auto_2707346 ) ) ( not ( = ?auto_2707338 ?auto_2707347 ) ) ( not ( = ?auto_2707338 ?auto_2707348 ) ) ( not ( = ?auto_2707338 ?auto_2707351 ) ) ( not ( = ?auto_2707340 ?auto_2707341 ) ) ( not ( = ?auto_2707340 ?auto_2707342 ) ) ( not ( = ?auto_2707340 ?auto_2707343 ) ) ( not ( = ?auto_2707340 ?auto_2707344 ) ) ( not ( = ?auto_2707340 ?auto_2707345 ) ) ( not ( = ?auto_2707340 ?auto_2707346 ) ) ( not ( = ?auto_2707340 ?auto_2707347 ) ) ( not ( = ?auto_2707340 ?auto_2707348 ) ) ( not ( = ?auto_2707340 ?auto_2707351 ) ) ( not ( = ?auto_2707341 ?auto_2707342 ) ) ( not ( = ?auto_2707341 ?auto_2707343 ) ) ( not ( = ?auto_2707341 ?auto_2707344 ) ) ( not ( = ?auto_2707341 ?auto_2707345 ) ) ( not ( = ?auto_2707341 ?auto_2707346 ) ) ( not ( = ?auto_2707341 ?auto_2707347 ) ) ( not ( = ?auto_2707341 ?auto_2707348 ) ) ( not ( = ?auto_2707341 ?auto_2707351 ) ) ( not ( = ?auto_2707342 ?auto_2707343 ) ) ( not ( = ?auto_2707342 ?auto_2707344 ) ) ( not ( = ?auto_2707342 ?auto_2707345 ) ) ( not ( = ?auto_2707342 ?auto_2707346 ) ) ( not ( = ?auto_2707342 ?auto_2707347 ) ) ( not ( = ?auto_2707342 ?auto_2707348 ) ) ( not ( = ?auto_2707342 ?auto_2707351 ) ) ( not ( = ?auto_2707343 ?auto_2707344 ) ) ( not ( = ?auto_2707343 ?auto_2707345 ) ) ( not ( = ?auto_2707343 ?auto_2707346 ) ) ( not ( = ?auto_2707343 ?auto_2707347 ) ) ( not ( = ?auto_2707343 ?auto_2707348 ) ) ( not ( = ?auto_2707343 ?auto_2707351 ) ) ( not ( = ?auto_2707344 ?auto_2707345 ) ) ( not ( = ?auto_2707344 ?auto_2707346 ) ) ( not ( = ?auto_2707344 ?auto_2707347 ) ) ( not ( = ?auto_2707344 ?auto_2707348 ) ) ( not ( = ?auto_2707344 ?auto_2707351 ) ) ( not ( = ?auto_2707345 ?auto_2707346 ) ) ( not ( = ?auto_2707345 ?auto_2707347 ) ) ( not ( = ?auto_2707345 ?auto_2707348 ) ) ( not ( = ?auto_2707345 ?auto_2707351 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2707346 ?auto_2707347 ?auto_2707348 )
      ( MAKE-13CRATE-VERIFY ?auto_2707335 ?auto_2707336 ?auto_2707337 ?auto_2707339 ?auto_2707338 ?auto_2707340 ?auto_2707341 ?auto_2707342 ?auto_2707343 ?auto_2707344 ?auto_2707345 ?auto_2707346 ?auto_2707347 ?auto_2707348 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2721499 - SURFACE
      ?auto_2721500 - SURFACE
      ?auto_2721501 - SURFACE
      ?auto_2721503 - SURFACE
      ?auto_2721502 - SURFACE
      ?auto_2721504 - SURFACE
      ?auto_2721505 - SURFACE
      ?auto_2721506 - SURFACE
      ?auto_2721507 - SURFACE
      ?auto_2721508 - SURFACE
      ?auto_2721509 - SURFACE
      ?auto_2721510 - SURFACE
      ?auto_2721511 - SURFACE
      ?auto_2721512 - SURFACE
      ?auto_2721513 - SURFACE
    )
    :vars
    (
      ?auto_2721515 - HOIST
      ?auto_2721514 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2721515 ?auto_2721514 ) ( SURFACE-AT ?auto_2721512 ?auto_2721514 ) ( CLEAR ?auto_2721512 ) ( LIFTING ?auto_2721515 ?auto_2721513 ) ( IS-CRATE ?auto_2721513 ) ( not ( = ?auto_2721512 ?auto_2721513 ) ) ( ON ?auto_2721500 ?auto_2721499 ) ( ON ?auto_2721501 ?auto_2721500 ) ( ON ?auto_2721503 ?auto_2721501 ) ( ON ?auto_2721502 ?auto_2721503 ) ( ON ?auto_2721504 ?auto_2721502 ) ( ON ?auto_2721505 ?auto_2721504 ) ( ON ?auto_2721506 ?auto_2721505 ) ( ON ?auto_2721507 ?auto_2721506 ) ( ON ?auto_2721508 ?auto_2721507 ) ( ON ?auto_2721509 ?auto_2721508 ) ( ON ?auto_2721510 ?auto_2721509 ) ( ON ?auto_2721511 ?auto_2721510 ) ( ON ?auto_2721512 ?auto_2721511 ) ( not ( = ?auto_2721499 ?auto_2721500 ) ) ( not ( = ?auto_2721499 ?auto_2721501 ) ) ( not ( = ?auto_2721499 ?auto_2721503 ) ) ( not ( = ?auto_2721499 ?auto_2721502 ) ) ( not ( = ?auto_2721499 ?auto_2721504 ) ) ( not ( = ?auto_2721499 ?auto_2721505 ) ) ( not ( = ?auto_2721499 ?auto_2721506 ) ) ( not ( = ?auto_2721499 ?auto_2721507 ) ) ( not ( = ?auto_2721499 ?auto_2721508 ) ) ( not ( = ?auto_2721499 ?auto_2721509 ) ) ( not ( = ?auto_2721499 ?auto_2721510 ) ) ( not ( = ?auto_2721499 ?auto_2721511 ) ) ( not ( = ?auto_2721499 ?auto_2721512 ) ) ( not ( = ?auto_2721499 ?auto_2721513 ) ) ( not ( = ?auto_2721500 ?auto_2721501 ) ) ( not ( = ?auto_2721500 ?auto_2721503 ) ) ( not ( = ?auto_2721500 ?auto_2721502 ) ) ( not ( = ?auto_2721500 ?auto_2721504 ) ) ( not ( = ?auto_2721500 ?auto_2721505 ) ) ( not ( = ?auto_2721500 ?auto_2721506 ) ) ( not ( = ?auto_2721500 ?auto_2721507 ) ) ( not ( = ?auto_2721500 ?auto_2721508 ) ) ( not ( = ?auto_2721500 ?auto_2721509 ) ) ( not ( = ?auto_2721500 ?auto_2721510 ) ) ( not ( = ?auto_2721500 ?auto_2721511 ) ) ( not ( = ?auto_2721500 ?auto_2721512 ) ) ( not ( = ?auto_2721500 ?auto_2721513 ) ) ( not ( = ?auto_2721501 ?auto_2721503 ) ) ( not ( = ?auto_2721501 ?auto_2721502 ) ) ( not ( = ?auto_2721501 ?auto_2721504 ) ) ( not ( = ?auto_2721501 ?auto_2721505 ) ) ( not ( = ?auto_2721501 ?auto_2721506 ) ) ( not ( = ?auto_2721501 ?auto_2721507 ) ) ( not ( = ?auto_2721501 ?auto_2721508 ) ) ( not ( = ?auto_2721501 ?auto_2721509 ) ) ( not ( = ?auto_2721501 ?auto_2721510 ) ) ( not ( = ?auto_2721501 ?auto_2721511 ) ) ( not ( = ?auto_2721501 ?auto_2721512 ) ) ( not ( = ?auto_2721501 ?auto_2721513 ) ) ( not ( = ?auto_2721503 ?auto_2721502 ) ) ( not ( = ?auto_2721503 ?auto_2721504 ) ) ( not ( = ?auto_2721503 ?auto_2721505 ) ) ( not ( = ?auto_2721503 ?auto_2721506 ) ) ( not ( = ?auto_2721503 ?auto_2721507 ) ) ( not ( = ?auto_2721503 ?auto_2721508 ) ) ( not ( = ?auto_2721503 ?auto_2721509 ) ) ( not ( = ?auto_2721503 ?auto_2721510 ) ) ( not ( = ?auto_2721503 ?auto_2721511 ) ) ( not ( = ?auto_2721503 ?auto_2721512 ) ) ( not ( = ?auto_2721503 ?auto_2721513 ) ) ( not ( = ?auto_2721502 ?auto_2721504 ) ) ( not ( = ?auto_2721502 ?auto_2721505 ) ) ( not ( = ?auto_2721502 ?auto_2721506 ) ) ( not ( = ?auto_2721502 ?auto_2721507 ) ) ( not ( = ?auto_2721502 ?auto_2721508 ) ) ( not ( = ?auto_2721502 ?auto_2721509 ) ) ( not ( = ?auto_2721502 ?auto_2721510 ) ) ( not ( = ?auto_2721502 ?auto_2721511 ) ) ( not ( = ?auto_2721502 ?auto_2721512 ) ) ( not ( = ?auto_2721502 ?auto_2721513 ) ) ( not ( = ?auto_2721504 ?auto_2721505 ) ) ( not ( = ?auto_2721504 ?auto_2721506 ) ) ( not ( = ?auto_2721504 ?auto_2721507 ) ) ( not ( = ?auto_2721504 ?auto_2721508 ) ) ( not ( = ?auto_2721504 ?auto_2721509 ) ) ( not ( = ?auto_2721504 ?auto_2721510 ) ) ( not ( = ?auto_2721504 ?auto_2721511 ) ) ( not ( = ?auto_2721504 ?auto_2721512 ) ) ( not ( = ?auto_2721504 ?auto_2721513 ) ) ( not ( = ?auto_2721505 ?auto_2721506 ) ) ( not ( = ?auto_2721505 ?auto_2721507 ) ) ( not ( = ?auto_2721505 ?auto_2721508 ) ) ( not ( = ?auto_2721505 ?auto_2721509 ) ) ( not ( = ?auto_2721505 ?auto_2721510 ) ) ( not ( = ?auto_2721505 ?auto_2721511 ) ) ( not ( = ?auto_2721505 ?auto_2721512 ) ) ( not ( = ?auto_2721505 ?auto_2721513 ) ) ( not ( = ?auto_2721506 ?auto_2721507 ) ) ( not ( = ?auto_2721506 ?auto_2721508 ) ) ( not ( = ?auto_2721506 ?auto_2721509 ) ) ( not ( = ?auto_2721506 ?auto_2721510 ) ) ( not ( = ?auto_2721506 ?auto_2721511 ) ) ( not ( = ?auto_2721506 ?auto_2721512 ) ) ( not ( = ?auto_2721506 ?auto_2721513 ) ) ( not ( = ?auto_2721507 ?auto_2721508 ) ) ( not ( = ?auto_2721507 ?auto_2721509 ) ) ( not ( = ?auto_2721507 ?auto_2721510 ) ) ( not ( = ?auto_2721507 ?auto_2721511 ) ) ( not ( = ?auto_2721507 ?auto_2721512 ) ) ( not ( = ?auto_2721507 ?auto_2721513 ) ) ( not ( = ?auto_2721508 ?auto_2721509 ) ) ( not ( = ?auto_2721508 ?auto_2721510 ) ) ( not ( = ?auto_2721508 ?auto_2721511 ) ) ( not ( = ?auto_2721508 ?auto_2721512 ) ) ( not ( = ?auto_2721508 ?auto_2721513 ) ) ( not ( = ?auto_2721509 ?auto_2721510 ) ) ( not ( = ?auto_2721509 ?auto_2721511 ) ) ( not ( = ?auto_2721509 ?auto_2721512 ) ) ( not ( = ?auto_2721509 ?auto_2721513 ) ) ( not ( = ?auto_2721510 ?auto_2721511 ) ) ( not ( = ?auto_2721510 ?auto_2721512 ) ) ( not ( = ?auto_2721510 ?auto_2721513 ) ) ( not ( = ?auto_2721511 ?auto_2721512 ) ) ( not ( = ?auto_2721511 ?auto_2721513 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2721512 ?auto_2721513 )
      ( MAKE-14CRATE-VERIFY ?auto_2721499 ?auto_2721500 ?auto_2721501 ?auto_2721503 ?auto_2721502 ?auto_2721504 ?auto_2721505 ?auto_2721506 ?auto_2721507 ?auto_2721508 ?auto_2721509 ?auto_2721510 ?auto_2721511 ?auto_2721512 ?auto_2721513 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2721659 - SURFACE
      ?auto_2721660 - SURFACE
      ?auto_2721661 - SURFACE
      ?auto_2721663 - SURFACE
      ?auto_2721662 - SURFACE
      ?auto_2721664 - SURFACE
      ?auto_2721665 - SURFACE
      ?auto_2721666 - SURFACE
      ?auto_2721667 - SURFACE
      ?auto_2721668 - SURFACE
      ?auto_2721669 - SURFACE
      ?auto_2721670 - SURFACE
      ?auto_2721671 - SURFACE
      ?auto_2721672 - SURFACE
      ?auto_2721673 - SURFACE
    )
    :vars
    (
      ?auto_2721675 - HOIST
      ?auto_2721676 - PLACE
      ?auto_2721674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2721675 ?auto_2721676 ) ( SURFACE-AT ?auto_2721672 ?auto_2721676 ) ( CLEAR ?auto_2721672 ) ( IS-CRATE ?auto_2721673 ) ( not ( = ?auto_2721672 ?auto_2721673 ) ) ( TRUCK-AT ?auto_2721674 ?auto_2721676 ) ( AVAILABLE ?auto_2721675 ) ( IN ?auto_2721673 ?auto_2721674 ) ( ON ?auto_2721672 ?auto_2721671 ) ( not ( = ?auto_2721671 ?auto_2721672 ) ) ( not ( = ?auto_2721671 ?auto_2721673 ) ) ( ON ?auto_2721660 ?auto_2721659 ) ( ON ?auto_2721661 ?auto_2721660 ) ( ON ?auto_2721663 ?auto_2721661 ) ( ON ?auto_2721662 ?auto_2721663 ) ( ON ?auto_2721664 ?auto_2721662 ) ( ON ?auto_2721665 ?auto_2721664 ) ( ON ?auto_2721666 ?auto_2721665 ) ( ON ?auto_2721667 ?auto_2721666 ) ( ON ?auto_2721668 ?auto_2721667 ) ( ON ?auto_2721669 ?auto_2721668 ) ( ON ?auto_2721670 ?auto_2721669 ) ( ON ?auto_2721671 ?auto_2721670 ) ( not ( = ?auto_2721659 ?auto_2721660 ) ) ( not ( = ?auto_2721659 ?auto_2721661 ) ) ( not ( = ?auto_2721659 ?auto_2721663 ) ) ( not ( = ?auto_2721659 ?auto_2721662 ) ) ( not ( = ?auto_2721659 ?auto_2721664 ) ) ( not ( = ?auto_2721659 ?auto_2721665 ) ) ( not ( = ?auto_2721659 ?auto_2721666 ) ) ( not ( = ?auto_2721659 ?auto_2721667 ) ) ( not ( = ?auto_2721659 ?auto_2721668 ) ) ( not ( = ?auto_2721659 ?auto_2721669 ) ) ( not ( = ?auto_2721659 ?auto_2721670 ) ) ( not ( = ?auto_2721659 ?auto_2721671 ) ) ( not ( = ?auto_2721659 ?auto_2721672 ) ) ( not ( = ?auto_2721659 ?auto_2721673 ) ) ( not ( = ?auto_2721660 ?auto_2721661 ) ) ( not ( = ?auto_2721660 ?auto_2721663 ) ) ( not ( = ?auto_2721660 ?auto_2721662 ) ) ( not ( = ?auto_2721660 ?auto_2721664 ) ) ( not ( = ?auto_2721660 ?auto_2721665 ) ) ( not ( = ?auto_2721660 ?auto_2721666 ) ) ( not ( = ?auto_2721660 ?auto_2721667 ) ) ( not ( = ?auto_2721660 ?auto_2721668 ) ) ( not ( = ?auto_2721660 ?auto_2721669 ) ) ( not ( = ?auto_2721660 ?auto_2721670 ) ) ( not ( = ?auto_2721660 ?auto_2721671 ) ) ( not ( = ?auto_2721660 ?auto_2721672 ) ) ( not ( = ?auto_2721660 ?auto_2721673 ) ) ( not ( = ?auto_2721661 ?auto_2721663 ) ) ( not ( = ?auto_2721661 ?auto_2721662 ) ) ( not ( = ?auto_2721661 ?auto_2721664 ) ) ( not ( = ?auto_2721661 ?auto_2721665 ) ) ( not ( = ?auto_2721661 ?auto_2721666 ) ) ( not ( = ?auto_2721661 ?auto_2721667 ) ) ( not ( = ?auto_2721661 ?auto_2721668 ) ) ( not ( = ?auto_2721661 ?auto_2721669 ) ) ( not ( = ?auto_2721661 ?auto_2721670 ) ) ( not ( = ?auto_2721661 ?auto_2721671 ) ) ( not ( = ?auto_2721661 ?auto_2721672 ) ) ( not ( = ?auto_2721661 ?auto_2721673 ) ) ( not ( = ?auto_2721663 ?auto_2721662 ) ) ( not ( = ?auto_2721663 ?auto_2721664 ) ) ( not ( = ?auto_2721663 ?auto_2721665 ) ) ( not ( = ?auto_2721663 ?auto_2721666 ) ) ( not ( = ?auto_2721663 ?auto_2721667 ) ) ( not ( = ?auto_2721663 ?auto_2721668 ) ) ( not ( = ?auto_2721663 ?auto_2721669 ) ) ( not ( = ?auto_2721663 ?auto_2721670 ) ) ( not ( = ?auto_2721663 ?auto_2721671 ) ) ( not ( = ?auto_2721663 ?auto_2721672 ) ) ( not ( = ?auto_2721663 ?auto_2721673 ) ) ( not ( = ?auto_2721662 ?auto_2721664 ) ) ( not ( = ?auto_2721662 ?auto_2721665 ) ) ( not ( = ?auto_2721662 ?auto_2721666 ) ) ( not ( = ?auto_2721662 ?auto_2721667 ) ) ( not ( = ?auto_2721662 ?auto_2721668 ) ) ( not ( = ?auto_2721662 ?auto_2721669 ) ) ( not ( = ?auto_2721662 ?auto_2721670 ) ) ( not ( = ?auto_2721662 ?auto_2721671 ) ) ( not ( = ?auto_2721662 ?auto_2721672 ) ) ( not ( = ?auto_2721662 ?auto_2721673 ) ) ( not ( = ?auto_2721664 ?auto_2721665 ) ) ( not ( = ?auto_2721664 ?auto_2721666 ) ) ( not ( = ?auto_2721664 ?auto_2721667 ) ) ( not ( = ?auto_2721664 ?auto_2721668 ) ) ( not ( = ?auto_2721664 ?auto_2721669 ) ) ( not ( = ?auto_2721664 ?auto_2721670 ) ) ( not ( = ?auto_2721664 ?auto_2721671 ) ) ( not ( = ?auto_2721664 ?auto_2721672 ) ) ( not ( = ?auto_2721664 ?auto_2721673 ) ) ( not ( = ?auto_2721665 ?auto_2721666 ) ) ( not ( = ?auto_2721665 ?auto_2721667 ) ) ( not ( = ?auto_2721665 ?auto_2721668 ) ) ( not ( = ?auto_2721665 ?auto_2721669 ) ) ( not ( = ?auto_2721665 ?auto_2721670 ) ) ( not ( = ?auto_2721665 ?auto_2721671 ) ) ( not ( = ?auto_2721665 ?auto_2721672 ) ) ( not ( = ?auto_2721665 ?auto_2721673 ) ) ( not ( = ?auto_2721666 ?auto_2721667 ) ) ( not ( = ?auto_2721666 ?auto_2721668 ) ) ( not ( = ?auto_2721666 ?auto_2721669 ) ) ( not ( = ?auto_2721666 ?auto_2721670 ) ) ( not ( = ?auto_2721666 ?auto_2721671 ) ) ( not ( = ?auto_2721666 ?auto_2721672 ) ) ( not ( = ?auto_2721666 ?auto_2721673 ) ) ( not ( = ?auto_2721667 ?auto_2721668 ) ) ( not ( = ?auto_2721667 ?auto_2721669 ) ) ( not ( = ?auto_2721667 ?auto_2721670 ) ) ( not ( = ?auto_2721667 ?auto_2721671 ) ) ( not ( = ?auto_2721667 ?auto_2721672 ) ) ( not ( = ?auto_2721667 ?auto_2721673 ) ) ( not ( = ?auto_2721668 ?auto_2721669 ) ) ( not ( = ?auto_2721668 ?auto_2721670 ) ) ( not ( = ?auto_2721668 ?auto_2721671 ) ) ( not ( = ?auto_2721668 ?auto_2721672 ) ) ( not ( = ?auto_2721668 ?auto_2721673 ) ) ( not ( = ?auto_2721669 ?auto_2721670 ) ) ( not ( = ?auto_2721669 ?auto_2721671 ) ) ( not ( = ?auto_2721669 ?auto_2721672 ) ) ( not ( = ?auto_2721669 ?auto_2721673 ) ) ( not ( = ?auto_2721670 ?auto_2721671 ) ) ( not ( = ?auto_2721670 ?auto_2721672 ) ) ( not ( = ?auto_2721670 ?auto_2721673 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2721671 ?auto_2721672 ?auto_2721673 )
      ( MAKE-14CRATE-VERIFY ?auto_2721659 ?auto_2721660 ?auto_2721661 ?auto_2721663 ?auto_2721662 ?auto_2721664 ?auto_2721665 ?auto_2721666 ?auto_2721667 ?auto_2721668 ?auto_2721669 ?auto_2721670 ?auto_2721671 ?auto_2721672 ?auto_2721673 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2721834 - SURFACE
      ?auto_2721835 - SURFACE
      ?auto_2721836 - SURFACE
      ?auto_2721838 - SURFACE
      ?auto_2721837 - SURFACE
      ?auto_2721839 - SURFACE
      ?auto_2721840 - SURFACE
      ?auto_2721841 - SURFACE
      ?auto_2721842 - SURFACE
      ?auto_2721843 - SURFACE
      ?auto_2721844 - SURFACE
      ?auto_2721845 - SURFACE
      ?auto_2721846 - SURFACE
      ?auto_2721847 - SURFACE
      ?auto_2721848 - SURFACE
    )
    :vars
    (
      ?auto_2721852 - HOIST
      ?auto_2721849 - PLACE
      ?auto_2721850 - TRUCK
      ?auto_2721851 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2721852 ?auto_2721849 ) ( SURFACE-AT ?auto_2721847 ?auto_2721849 ) ( CLEAR ?auto_2721847 ) ( IS-CRATE ?auto_2721848 ) ( not ( = ?auto_2721847 ?auto_2721848 ) ) ( AVAILABLE ?auto_2721852 ) ( IN ?auto_2721848 ?auto_2721850 ) ( ON ?auto_2721847 ?auto_2721846 ) ( not ( = ?auto_2721846 ?auto_2721847 ) ) ( not ( = ?auto_2721846 ?auto_2721848 ) ) ( TRUCK-AT ?auto_2721850 ?auto_2721851 ) ( not ( = ?auto_2721851 ?auto_2721849 ) ) ( ON ?auto_2721835 ?auto_2721834 ) ( ON ?auto_2721836 ?auto_2721835 ) ( ON ?auto_2721838 ?auto_2721836 ) ( ON ?auto_2721837 ?auto_2721838 ) ( ON ?auto_2721839 ?auto_2721837 ) ( ON ?auto_2721840 ?auto_2721839 ) ( ON ?auto_2721841 ?auto_2721840 ) ( ON ?auto_2721842 ?auto_2721841 ) ( ON ?auto_2721843 ?auto_2721842 ) ( ON ?auto_2721844 ?auto_2721843 ) ( ON ?auto_2721845 ?auto_2721844 ) ( ON ?auto_2721846 ?auto_2721845 ) ( not ( = ?auto_2721834 ?auto_2721835 ) ) ( not ( = ?auto_2721834 ?auto_2721836 ) ) ( not ( = ?auto_2721834 ?auto_2721838 ) ) ( not ( = ?auto_2721834 ?auto_2721837 ) ) ( not ( = ?auto_2721834 ?auto_2721839 ) ) ( not ( = ?auto_2721834 ?auto_2721840 ) ) ( not ( = ?auto_2721834 ?auto_2721841 ) ) ( not ( = ?auto_2721834 ?auto_2721842 ) ) ( not ( = ?auto_2721834 ?auto_2721843 ) ) ( not ( = ?auto_2721834 ?auto_2721844 ) ) ( not ( = ?auto_2721834 ?auto_2721845 ) ) ( not ( = ?auto_2721834 ?auto_2721846 ) ) ( not ( = ?auto_2721834 ?auto_2721847 ) ) ( not ( = ?auto_2721834 ?auto_2721848 ) ) ( not ( = ?auto_2721835 ?auto_2721836 ) ) ( not ( = ?auto_2721835 ?auto_2721838 ) ) ( not ( = ?auto_2721835 ?auto_2721837 ) ) ( not ( = ?auto_2721835 ?auto_2721839 ) ) ( not ( = ?auto_2721835 ?auto_2721840 ) ) ( not ( = ?auto_2721835 ?auto_2721841 ) ) ( not ( = ?auto_2721835 ?auto_2721842 ) ) ( not ( = ?auto_2721835 ?auto_2721843 ) ) ( not ( = ?auto_2721835 ?auto_2721844 ) ) ( not ( = ?auto_2721835 ?auto_2721845 ) ) ( not ( = ?auto_2721835 ?auto_2721846 ) ) ( not ( = ?auto_2721835 ?auto_2721847 ) ) ( not ( = ?auto_2721835 ?auto_2721848 ) ) ( not ( = ?auto_2721836 ?auto_2721838 ) ) ( not ( = ?auto_2721836 ?auto_2721837 ) ) ( not ( = ?auto_2721836 ?auto_2721839 ) ) ( not ( = ?auto_2721836 ?auto_2721840 ) ) ( not ( = ?auto_2721836 ?auto_2721841 ) ) ( not ( = ?auto_2721836 ?auto_2721842 ) ) ( not ( = ?auto_2721836 ?auto_2721843 ) ) ( not ( = ?auto_2721836 ?auto_2721844 ) ) ( not ( = ?auto_2721836 ?auto_2721845 ) ) ( not ( = ?auto_2721836 ?auto_2721846 ) ) ( not ( = ?auto_2721836 ?auto_2721847 ) ) ( not ( = ?auto_2721836 ?auto_2721848 ) ) ( not ( = ?auto_2721838 ?auto_2721837 ) ) ( not ( = ?auto_2721838 ?auto_2721839 ) ) ( not ( = ?auto_2721838 ?auto_2721840 ) ) ( not ( = ?auto_2721838 ?auto_2721841 ) ) ( not ( = ?auto_2721838 ?auto_2721842 ) ) ( not ( = ?auto_2721838 ?auto_2721843 ) ) ( not ( = ?auto_2721838 ?auto_2721844 ) ) ( not ( = ?auto_2721838 ?auto_2721845 ) ) ( not ( = ?auto_2721838 ?auto_2721846 ) ) ( not ( = ?auto_2721838 ?auto_2721847 ) ) ( not ( = ?auto_2721838 ?auto_2721848 ) ) ( not ( = ?auto_2721837 ?auto_2721839 ) ) ( not ( = ?auto_2721837 ?auto_2721840 ) ) ( not ( = ?auto_2721837 ?auto_2721841 ) ) ( not ( = ?auto_2721837 ?auto_2721842 ) ) ( not ( = ?auto_2721837 ?auto_2721843 ) ) ( not ( = ?auto_2721837 ?auto_2721844 ) ) ( not ( = ?auto_2721837 ?auto_2721845 ) ) ( not ( = ?auto_2721837 ?auto_2721846 ) ) ( not ( = ?auto_2721837 ?auto_2721847 ) ) ( not ( = ?auto_2721837 ?auto_2721848 ) ) ( not ( = ?auto_2721839 ?auto_2721840 ) ) ( not ( = ?auto_2721839 ?auto_2721841 ) ) ( not ( = ?auto_2721839 ?auto_2721842 ) ) ( not ( = ?auto_2721839 ?auto_2721843 ) ) ( not ( = ?auto_2721839 ?auto_2721844 ) ) ( not ( = ?auto_2721839 ?auto_2721845 ) ) ( not ( = ?auto_2721839 ?auto_2721846 ) ) ( not ( = ?auto_2721839 ?auto_2721847 ) ) ( not ( = ?auto_2721839 ?auto_2721848 ) ) ( not ( = ?auto_2721840 ?auto_2721841 ) ) ( not ( = ?auto_2721840 ?auto_2721842 ) ) ( not ( = ?auto_2721840 ?auto_2721843 ) ) ( not ( = ?auto_2721840 ?auto_2721844 ) ) ( not ( = ?auto_2721840 ?auto_2721845 ) ) ( not ( = ?auto_2721840 ?auto_2721846 ) ) ( not ( = ?auto_2721840 ?auto_2721847 ) ) ( not ( = ?auto_2721840 ?auto_2721848 ) ) ( not ( = ?auto_2721841 ?auto_2721842 ) ) ( not ( = ?auto_2721841 ?auto_2721843 ) ) ( not ( = ?auto_2721841 ?auto_2721844 ) ) ( not ( = ?auto_2721841 ?auto_2721845 ) ) ( not ( = ?auto_2721841 ?auto_2721846 ) ) ( not ( = ?auto_2721841 ?auto_2721847 ) ) ( not ( = ?auto_2721841 ?auto_2721848 ) ) ( not ( = ?auto_2721842 ?auto_2721843 ) ) ( not ( = ?auto_2721842 ?auto_2721844 ) ) ( not ( = ?auto_2721842 ?auto_2721845 ) ) ( not ( = ?auto_2721842 ?auto_2721846 ) ) ( not ( = ?auto_2721842 ?auto_2721847 ) ) ( not ( = ?auto_2721842 ?auto_2721848 ) ) ( not ( = ?auto_2721843 ?auto_2721844 ) ) ( not ( = ?auto_2721843 ?auto_2721845 ) ) ( not ( = ?auto_2721843 ?auto_2721846 ) ) ( not ( = ?auto_2721843 ?auto_2721847 ) ) ( not ( = ?auto_2721843 ?auto_2721848 ) ) ( not ( = ?auto_2721844 ?auto_2721845 ) ) ( not ( = ?auto_2721844 ?auto_2721846 ) ) ( not ( = ?auto_2721844 ?auto_2721847 ) ) ( not ( = ?auto_2721844 ?auto_2721848 ) ) ( not ( = ?auto_2721845 ?auto_2721846 ) ) ( not ( = ?auto_2721845 ?auto_2721847 ) ) ( not ( = ?auto_2721845 ?auto_2721848 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2721846 ?auto_2721847 ?auto_2721848 )
      ( MAKE-14CRATE-VERIFY ?auto_2721834 ?auto_2721835 ?auto_2721836 ?auto_2721838 ?auto_2721837 ?auto_2721839 ?auto_2721840 ?auto_2721841 ?auto_2721842 ?auto_2721843 ?auto_2721844 ?auto_2721845 ?auto_2721846 ?auto_2721847 ?auto_2721848 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2722023 - SURFACE
      ?auto_2722024 - SURFACE
      ?auto_2722025 - SURFACE
      ?auto_2722027 - SURFACE
      ?auto_2722026 - SURFACE
      ?auto_2722028 - SURFACE
      ?auto_2722029 - SURFACE
      ?auto_2722030 - SURFACE
      ?auto_2722031 - SURFACE
      ?auto_2722032 - SURFACE
      ?auto_2722033 - SURFACE
      ?auto_2722034 - SURFACE
      ?auto_2722035 - SURFACE
      ?auto_2722036 - SURFACE
      ?auto_2722037 - SURFACE
    )
    :vars
    (
      ?auto_2722042 - HOIST
      ?auto_2722038 - PLACE
      ?auto_2722040 - TRUCK
      ?auto_2722041 - PLACE
      ?auto_2722039 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2722042 ?auto_2722038 ) ( SURFACE-AT ?auto_2722036 ?auto_2722038 ) ( CLEAR ?auto_2722036 ) ( IS-CRATE ?auto_2722037 ) ( not ( = ?auto_2722036 ?auto_2722037 ) ) ( AVAILABLE ?auto_2722042 ) ( ON ?auto_2722036 ?auto_2722035 ) ( not ( = ?auto_2722035 ?auto_2722036 ) ) ( not ( = ?auto_2722035 ?auto_2722037 ) ) ( TRUCK-AT ?auto_2722040 ?auto_2722041 ) ( not ( = ?auto_2722041 ?auto_2722038 ) ) ( HOIST-AT ?auto_2722039 ?auto_2722041 ) ( LIFTING ?auto_2722039 ?auto_2722037 ) ( not ( = ?auto_2722042 ?auto_2722039 ) ) ( ON ?auto_2722024 ?auto_2722023 ) ( ON ?auto_2722025 ?auto_2722024 ) ( ON ?auto_2722027 ?auto_2722025 ) ( ON ?auto_2722026 ?auto_2722027 ) ( ON ?auto_2722028 ?auto_2722026 ) ( ON ?auto_2722029 ?auto_2722028 ) ( ON ?auto_2722030 ?auto_2722029 ) ( ON ?auto_2722031 ?auto_2722030 ) ( ON ?auto_2722032 ?auto_2722031 ) ( ON ?auto_2722033 ?auto_2722032 ) ( ON ?auto_2722034 ?auto_2722033 ) ( ON ?auto_2722035 ?auto_2722034 ) ( not ( = ?auto_2722023 ?auto_2722024 ) ) ( not ( = ?auto_2722023 ?auto_2722025 ) ) ( not ( = ?auto_2722023 ?auto_2722027 ) ) ( not ( = ?auto_2722023 ?auto_2722026 ) ) ( not ( = ?auto_2722023 ?auto_2722028 ) ) ( not ( = ?auto_2722023 ?auto_2722029 ) ) ( not ( = ?auto_2722023 ?auto_2722030 ) ) ( not ( = ?auto_2722023 ?auto_2722031 ) ) ( not ( = ?auto_2722023 ?auto_2722032 ) ) ( not ( = ?auto_2722023 ?auto_2722033 ) ) ( not ( = ?auto_2722023 ?auto_2722034 ) ) ( not ( = ?auto_2722023 ?auto_2722035 ) ) ( not ( = ?auto_2722023 ?auto_2722036 ) ) ( not ( = ?auto_2722023 ?auto_2722037 ) ) ( not ( = ?auto_2722024 ?auto_2722025 ) ) ( not ( = ?auto_2722024 ?auto_2722027 ) ) ( not ( = ?auto_2722024 ?auto_2722026 ) ) ( not ( = ?auto_2722024 ?auto_2722028 ) ) ( not ( = ?auto_2722024 ?auto_2722029 ) ) ( not ( = ?auto_2722024 ?auto_2722030 ) ) ( not ( = ?auto_2722024 ?auto_2722031 ) ) ( not ( = ?auto_2722024 ?auto_2722032 ) ) ( not ( = ?auto_2722024 ?auto_2722033 ) ) ( not ( = ?auto_2722024 ?auto_2722034 ) ) ( not ( = ?auto_2722024 ?auto_2722035 ) ) ( not ( = ?auto_2722024 ?auto_2722036 ) ) ( not ( = ?auto_2722024 ?auto_2722037 ) ) ( not ( = ?auto_2722025 ?auto_2722027 ) ) ( not ( = ?auto_2722025 ?auto_2722026 ) ) ( not ( = ?auto_2722025 ?auto_2722028 ) ) ( not ( = ?auto_2722025 ?auto_2722029 ) ) ( not ( = ?auto_2722025 ?auto_2722030 ) ) ( not ( = ?auto_2722025 ?auto_2722031 ) ) ( not ( = ?auto_2722025 ?auto_2722032 ) ) ( not ( = ?auto_2722025 ?auto_2722033 ) ) ( not ( = ?auto_2722025 ?auto_2722034 ) ) ( not ( = ?auto_2722025 ?auto_2722035 ) ) ( not ( = ?auto_2722025 ?auto_2722036 ) ) ( not ( = ?auto_2722025 ?auto_2722037 ) ) ( not ( = ?auto_2722027 ?auto_2722026 ) ) ( not ( = ?auto_2722027 ?auto_2722028 ) ) ( not ( = ?auto_2722027 ?auto_2722029 ) ) ( not ( = ?auto_2722027 ?auto_2722030 ) ) ( not ( = ?auto_2722027 ?auto_2722031 ) ) ( not ( = ?auto_2722027 ?auto_2722032 ) ) ( not ( = ?auto_2722027 ?auto_2722033 ) ) ( not ( = ?auto_2722027 ?auto_2722034 ) ) ( not ( = ?auto_2722027 ?auto_2722035 ) ) ( not ( = ?auto_2722027 ?auto_2722036 ) ) ( not ( = ?auto_2722027 ?auto_2722037 ) ) ( not ( = ?auto_2722026 ?auto_2722028 ) ) ( not ( = ?auto_2722026 ?auto_2722029 ) ) ( not ( = ?auto_2722026 ?auto_2722030 ) ) ( not ( = ?auto_2722026 ?auto_2722031 ) ) ( not ( = ?auto_2722026 ?auto_2722032 ) ) ( not ( = ?auto_2722026 ?auto_2722033 ) ) ( not ( = ?auto_2722026 ?auto_2722034 ) ) ( not ( = ?auto_2722026 ?auto_2722035 ) ) ( not ( = ?auto_2722026 ?auto_2722036 ) ) ( not ( = ?auto_2722026 ?auto_2722037 ) ) ( not ( = ?auto_2722028 ?auto_2722029 ) ) ( not ( = ?auto_2722028 ?auto_2722030 ) ) ( not ( = ?auto_2722028 ?auto_2722031 ) ) ( not ( = ?auto_2722028 ?auto_2722032 ) ) ( not ( = ?auto_2722028 ?auto_2722033 ) ) ( not ( = ?auto_2722028 ?auto_2722034 ) ) ( not ( = ?auto_2722028 ?auto_2722035 ) ) ( not ( = ?auto_2722028 ?auto_2722036 ) ) ( not ( = ?auto_2722028 ?auto_2722037 ) ) ( not ( = ?auto_2722029 ?auto_2722030 ) ) ( not ( = ?auto_2722029 ?auto_2722031 ) ) ( not ( = ?auto_2722029 ?auto_2722032 ) ) ( not ( = ?auto_2722029 ?auto_2722033 ) ) ( not ( = ?auto_2722029 ?auto_2722034 ) ) ( not ( = ?auto_2722029 ?auto_2722035 ) ) ( not ( = ?auto_2722029 ?auto_2722036 ) ) ( not ( = ?auto_2722029 ?auto_2722037 ) ) ( not ( = ?auto_2722030 ?auto_2722031 ) ) ( not ( = ?auto_2722030 ?auto_2722032 ) ) ( not ( = ?auto_2722030 ?auto_2722033 ) ) ( not ( = ?auto_2722030 ?auto_2722034 ) ) ( not ( = ?auto_2722030 ?auto_2722035 ) ) ( not ( = ?auto_2722030 ?auto_2722036 ) ) ( not ( = ?auto_2722030 ?auto_2722037 ) ) ( not ( = ?auto_2722031 ?auto_2722032 ) ) ( not ( = ?auto_2722031 ?auto_2722033 ) ) ( not ( = ?auto_2722031 ?auto_2722034 ) ) ( not ( = ?auto_2722031 ?auto_2722035 ) ) ( not ( = ?auto_2722031 ?auto_2722036 ) ) ( not ( = ?auto_2722031 ?auto_2722037 ) ) ( not ( = ?auto_2722032 ?auto_2722033 ) ) ( not ( = ?auto_2722032 ?auto_2722034 ) ) ( not ( = ?auto_2722032 ?auto_2722035 ) ) ( not ( = ?auto_2722032 ?auto_2722036 ) ) ( not ( = ?auto_2722032 ?auto_2722037 ) ) ( not ( = ?auto_2722033 ?auto_2722034 ) ) ( not ( = ?auto_2722033 ?auto_2722035 ) ) ( not ( = ?auto_2722033 ?auto_2722036 ) ) ( not ( = ?auto_2722033 ?auto_2722037 ) ) ( not ( = ?auto_2722034 ?auto_2722035 ) ) ( not ( = ?auto_2722034 ?auto_2722036 ) ) ( not ( = ?auto_2722034 ?auto_2722037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2722035 ?auto_2722036 ?auto_2722037 )
      ( MAKE-14CRATE-VERIFY ?auto_2722023 ?auto_2722024 ?auto_2722025 ?auto_2722027 ?auto_2722026 ?auto_2722028 ?auto_2722029 ?auto_2722030 ?auto_2722031 ?auto_2722032 ?auto_2722033 ?auto_2722034 ?auto_2722035 ?auto_2722036 ?auto_2722037 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2722226 - SURFACE
      ?auto_2722227 - SURFACE
      ?auto_2722228 - SURFACE
      ?auto_2722230 - SURFACE
      ?auto_2722229 - SURFACE
      ?auto_2722231 - SURFACE
      ?auto_2722232 - SURFACE
      ?auto_2722233 - SURFACE
      ?auto_2722234 - SURFACE
      ?auto_2722235 - SURFACE
      ?auto_2722236 - SURFACE
      ?auto_2722237 - SURFACE
      ?auto_2722238 - SURFACE
      ?auto_2722239 - SURFACE
      ?auto_2722240 - SURFACE
    )
    :vars
    (
      ?auto_2722243 - HOIST
      ?auto_2722245 - PLACE
      ?auto_2722246 - TRUCK
      ?auto_2722241 - PLACE
      ?auto_2722242 - HOIST
      ?auto_2722244 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2722243 ?auto_2722245 ) ( SURFACE-AT ?auto_2722239 ?auto_2722245 ) ( CLEAR ?auto_2722239 ) ( IS-CRATE ?auto_2722240 ) ( not ( = ?auto_2722239 ?auto_2722240 ) ) ( AVAILABLE ?auto_2722243 ) ( ON ?auto_2722239 ?auto_2722238 ) ( not ( = ?auto_2722238 ?auto_2722239 ) ) ( not ( = ?auto_2722238 ?auto_2722240 ) ) ( TRUCK-AT ?auto_2722246 ?auto_2722241 ) ( not ( = ?auto_2722241 ?auto_2722245 ) ) ( HOIST-AT ?auto_2722242 ?auto_2722241 ) ( not ( = ?auto_2722243 ?auto_2722242 ) ) ( AVAILABLE ?auto_2722242 ) ( SURFACE-AT ?auto_2722240 ?auto_2722241 ) ( ON ?auto_2722240 ?auto_2722244 ) ( CLEAR ?auto_2722240 ) ( not ( = ?auto_2722239 ?auto_2722244 ) ) ( not ( = ?auto_2722240 ?auto_2722244 ) ) ( not ( = ?auto_2722238 ?auto_2722244 ) ) ( ON ?auto_2722227 ?auto_2722226 ) ( ON ?auto_2722228 ?auto_2722227 ) ( ON ?auto_2722230 ?auto_2722228 ) ( ON ?auto_2722229 ?auto_2722230 ) ( ON ?auto_2722231 ?auto_2722229 ) ( ON ?auto_2722232 ?auto_2722231 ) ( ON ?auto_2722233 ?auto_2722232 ) ( ON ?auto_2722234 ?auto_2722233 ) ( ON ?auto_2722235 ?auto_2722234 ) ( ON ?auto_2722236 ?auto_2722235 ) ( ON ?auto_2722237 ?auto_2722236 ) ( ON ?auto_2722238 ?auto_2722237 ) ( not ( = ?auto_2722226 ?auto_2722227 ) ) ( not ( = ?auto_2722226 ?auto_2722228 ) ) ( not ( = ?auto_2722226 ?auto_2722230 ) ) ( not ( = ?auto_2722226 ?auto_2722229 ) ) ( not ( = ?auto_2722226 ?auto_2722231 ) ) ( not ( = ?auto_2722226 ?auto_2722232 ) ) ( not ( = ?auto_2722226 ?auto_2722233 ) ) ( not ( = ?auto_2722226 ?auto_2722234 ) ) ( not ( = ?auto_2722226 ?auto_2722235 ) ) ( not ( = ?auto_2722226 ?auto_2722236 ) ) ( not ( = ?auto_2722226 ?auto_2722237 ) ) ( not ( = ?auto_2722226 ?auto_2722238 ) ) ( not ( = ?auto_2722226 ?auto_2722239 ) ) ( not ( = ?auto_2722226 ?auto_2722240 ) ) ( not ( = ?auto_2722226 ?auto_2722244 ) ) ( not ( = ?auto_2722227 ?auto_2722228 ) ) ( not ( = ?auto_2722227 ?auto_2722230 ) ) ( not ( = ?auto_2722227 ?auto_2722229 ) ) ( not ( = ?auto_2722227 ?auto_2722231 ) ) ( not ( = ?auto_2722227 ?auto_2722232 ) ) ( not ( = ?auto_2722227 ?auto_2722233 ) ) ( not ( = ?auto_2722227 ?auto_2722234 ) ) ( not ( = ?auto_2722227 ?auto_2722235 ) ) ( not ( = ?auto_2722227 ?auto_2722236 ) ) ( not ( = ?auto_2722227 ?auto_2722237 ) ) ( not ( = ?auto_2722227 ?auto_2722238 ) ) ( not ( = ?auto_2722227 ?auto_2722239 ) ) ( not ( = ?auto_2722227 ?auto_2722240 ) ) ( not ( = ?auto_2722227 ?auto_2722244 ) ) ( not ( = ?auto_2722228 ?auto_2722230 ) ) ( not ( = ?auto_2722228 ?auto_2722229 ) ) ( not ( = ?auto_2722228 ?auto_2722231 ) ) ( not ( = ?auto_2722228 ?auto_2722232 ) ) ( not ( = ?auto_2722228 ?auto_2722233 ) ) ( not ( = ?auto_2722228 ?auto_2722234 ) ) ( not ( = ?auto_2722228 ?auto_2722235 ) ) ( not ( = ?auto_2722228 ?auto_2722236 ) ) ( not ( = ?auto_2722228 ?auto_2722237 ) ) ( not ( = ?auto_2722228 ?auto_2722238 ) ) ( not ( = ?auto_2722228 ?auto_2722239 ) ) ( not ( = ?auto_2722228 ?auto_2722240 ) ) ( not ( = ?auto_2722228 ?auto_2722244 ) ) ( not ( = ?auto_2722230 ?auto_2722229 ) ) ( not ( = ?auto_2722230 ?auto_2722231 ) ) ( not ( = ?auto_2722230 ?auto_2722232 ) ) ( not ( = ?auto_2722230 ?auto_2722233 ) ) ( not ( = ?auto_2722230 ?auto_2722234 ) ) ( not ( = ?auto_2722230 ?auto_2722235 ) ) ( not ( = ?auto_2722230 ?auto_2722236 ) ) ( not ( = ?auto_2722230 ?auto_2722237 ) ) ( not ( = ?auto_2722230 ?auto_2722238 ) ) ( not ( = ?auto_2722230 ?auto_2722239 ) ) ( not ( = ?auto_2722230 ?auto_2722240 ) ) ( not ( = ?auto_2722230 ?auto_2722244 ) ) ( not ( = ?auto_2722229 ?auto_2722231 ) ) ( not ( = ?auto_2722229 ?auto_2722232 ) ) ( not ( = ?auto_2722229 ?auto_2722233 ) ) ( not ( = ?auto_2722229 ?auto_2722234 ) ) ( not ( = ?auto_2722229 ?auto_2722235 ) ) ( not ( = ?auto_2722229 ?auto_2722236 ) ) ( not ( = ?auto_2722229 ?auto_2722237 ) ) ( not ( = ?auto_2722229 ?auto_2722238 ) ) ( not ( = ?auto_2722229 ?auto_2722239 ) ) ( not ( = ?auto_2722229 ?auto_2722240 ) ) ( not ( = ?auto_2722229 ?auto_2722244 ) ) ( not ( = ?auto_2722231 ?auto_2722232 ) ) ( not ( = ?auto_2722231 ?auto_2722233 ) ) ( not ( = ?auto_2722231 ?auto_2722234 ) ) ( not ( = ?auto_2722231 ?auto_2722235 ) ) ( not ( = ?auto_2722231 ?auto_2722236 ) ) ( not ( = ?auto_2722231 ?auto_2722237 ) ) ( not ( = ?auto_2722231 ?auto_2722238 ) ) ( not ( = ?auto_2722231 ?auto_2722239 ) ) ( not ( = ?auto_2722231 ?auto_2722240 ) ) ( not ( = ?auto_2722231 ?auto_2722244 ) ) ( not ( = ?auto_2722232 ?auto_2722233 ) ) ( not ( = ?auto_2722232 ?auto_2722234 ) ) ( not ( = ?auto_2722232 ?auto_2722235 ) ) ( not ( = ?auto_2722232 ?auto_2722236 ) ) ( not ( = ?auto_2722232 ?auto_2722237 ) ) ( not ( = ?auto_2722232 ?auto_2722238 ) ) ( not ( = ?auto_2722232 ?auto_2722239 ) ) ( not ( = ?auto_2722232 ?auto_2722240 ) ) ( not ( = ?auto_2722232 ?auto_2722244 ) ) ( not ( = ?auto_2722233 ?auto_2722234 ) ) ( not ( = ?auto_2722233 ?auto_2722235 ) ) ( not ( = ?auto_2722233 ?auto_2722236 ) ) ( not ( = ?auto_2722233 ?auto_2722237 ) ) ( not ( = ?auto_2722233 ?auto_2722238 ) ) ( not ( = ?auto_2722233 ?auto_2722239 ) ) ( not ( = ?auto_2722233 ?auto_2722240 ) ) ( not ( = ?auto_2722233 ?auto_2722244 ) ) ( not ( = ?auto_2722234 ?auto_2722235 ) ) ( not ( = ?auto_2722234 ?auto_2722236 ) ) ( not ( = ?auto_2722234 ?auto_2722237 ) ) ( not ( = ?auto_2722234 ?auto_2722238 ) ) ( not ( = ?auto_2722234 ?auto_2722239 ) ) ( not ( = ?auto_2722234 ?auto_2722240 ) ) ( not ( = ?auto_2722234 ?auto_2722244 ) ) ( not ( = ?auto_2722235 ?auto_2722236 ) ) ( not ( = ?auto_2722235 ?auto_2722237 ) ) ( not ( = ?auto_2722235 ?auto_2722238 ) ) ( not ( = ?auto_2722235 ?auto_2722239 ) ) ( not ( = ?auto_2722235 ?auto_2722240 ) ) ( not ( = ?auto_2722235 ?auto_2722244 ) ) ( not ( = ?auto_2722236 ?auto_2722237 ) ) ( not ( = ?auto_2722236 ?auto_2722238 ) ) ( not ( = ?auto_2722236 ?auto_2722239 ) ) ( not ( = ?auto_2722236 ?auto_2722240 ) ) ( not ( = ?auto_2722236 ?auto_2722244 ) ) ( not ( = ?auto_2722237 ?auto_2722238 ) ) ( not ( = ?auto_2722237 ?auto_2722239 ) ) ( not ( = ?auto_2722237 ?auto_2722240 ) ) ( not ( = ?auto_2722237 ?auto_2722244 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2722238 ?auto_2722239 ?auto_2722240 )
      ( MAKE-14CRATE-VERIFY ?auto_2722226 ?auto_2722227 ?auto_2722228 ?auto_2722230 ?auto_2722229 ?auto_2722231 ?auto_2722232 ?auto_2722233 ?auto_2722234 ?auto_2722235 ?auto_2722236 ?auto_2722237 ?auto_2722238 ?auto_2722239 ?auto_2722240 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2722430 - SURFACE
      ?auto_2722431 - SURFACE
      ?auto_2722432 - SURFACE
      ?auto_2722434 - SURFACE
      ?auto_2722433 - SURFACE
      ?auto_2722435 - SURFACE
      ?auto_2722436 - SURFACE
      ?auto_2722437 - SURFACE
      ?auto_2722438 - SURFACE
      ?auto_2722439 - SURFACE
      ?auto_2722440 - SURFACE
      ?auto_2722441 - SURFACE
      ?auto_2722442 - SURFACE
      ?auto_2722443 - SURFACE
      ?auto_2722444 - SURFACE
    )
    :vars
    (
      ?auto_2722449 - HOIST
      ?auto_2722445 - PLACE
      ?auto_2722446 - PLACE
      ?auto_2722448 - HOIST
      ?auto_2722450 - SURFACE
      ?auto_2722447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2722449 ?auto_2722445 ) ( SURFACE-AT ?auto_2722443 ?auto_2722445 ) ( CLEAR ?auto_2722443 ) ( IS-CRATE ?auto_2722444 ) ( not ( = ?auto_2722443 ?auto_2722444 ) ) ( AVAILABLE ?auto_2722449 ) ( ON ?auto_2722443 ?auto_2722442 ) ( not ( = ?auto_2722442 ?auto_2722443 ) ) ( not ( = ?auto_2722442 ?auto_2722444 ) ) ( not ( = ?auto_2722446 ?auto_2722445 ) ) ( HOIST-AT ?auto_2722448 ?auto_2722446 ) ( not ( = ?auto_2722449 ?auto_2722448 ) ) ( AVAILABLE ?auto_2722448 ) ( SURFACE-AT ?auto_2722444 ?auto_2722446 ) ( ON ?auto_2722444 ?auto_2722450 ) ( CLEAR ?auto_2722444 ) ( not ( = ?auto_2722443 ?auto_2722450 ) ) ( not ( = ?auto_2722444 ?auto_2722450 ) ) ( not ( = ?auto_2722442 ?auto_2722450 ) ) ( TRUCK-AT ?auto_2722447 ?auto_2722445 ) ( ON ?auto_2722431 ?auto_2722430 ) ( ON ?auto_2722432 ?auto_2722431 ) ( ON ?auto_2722434 ?auto_2722432 ) ( ON ?auto_2722433 ?auto_2722434 ) ( ON ?auto_2722435 ?auto_2722433 ) ( ON ?auto_2722436 ?auto_2722435 ) ( ON ?auto_2722437 ?auto_2722436 ) ( ON ?auto_2722438 ?auto_2722437 ) ( ON ?auto_2722439 ?auto_2722438 ) ( ON ?auto_2722440 ?auto_2722439 ) ( ON ?auto_2722441 ?auto_2722440 ) ( ON ?auto_2722442 ?auto_2722441 ) ( not ( = ?auto_2722430 ?auto_2722431 ) ) ( not ( = ?auto_2722430 ?auto_2722432 ) ) ( not ( = ?auto_2722430 ?auto_2722434 ) ) ( not ( = ?auto_2722430 ?auto_2722433 ) ) ( not ( = ?auto_2722430 ?auto_2722435 ) ) ( not ( = ?auto_2722430 ?auto_2722436 ) ) ( not ( = ?auto_2722430 ?auto_2722437 ) ) ( not ( = ?auto_2722430 ?auto_2722438 ) ) ( not ( = ?auto_2722430 ?auto_2722439 ) ) ( not ( = ?auto_2722430 ?auto_2722440 ) ) ( not ( = ?auto_2722430 ?auto_2722441 ) ) ( not ( = ?auto_2722430 ?auto_2722442 ) ) ( not ( = ?auto_2722430 ?auto_2722443 ) ) ( not ( = ?auto_2722430 ?auto_2722444 ) ) ( not ( = ?auto_2722430 ?auto_2722450 ) ) ( not ( = ?auto_2722431 ?auto_2722432 ) ) ( not ( = ?auto_2722431 ?auto_2722434 ) ) ( not ( = ?auto_2722431 ?auto_2722433 ) ) ( not ( = ?auto_2722431 ?auto_2722435 ) ) ( not ( = ?auto_2722431 ?auto_2722436 ) ) ( not ( = ?auto_2722431 ?auto_2722437 ) ) ( not ( = ?auto_2722431 ?auto_2722438 ) ) ( not ( = ?auto_2722431 ?auto_2722439 ) ) ( not ( = ?auto_2722431 ?auto_2722440 ) ) ( not ( = ?auto_2722431 ?auto_2722441 ) ) ( not ( = ?auto_2722431 ?auto_2722442 ) ) ( not ( = ?auto_2722431 ?auto_2722443 ) ) ( not ( = ?auto_2722431 ?auto_2722444 ) ) ( not ( = ?auto_2722431 ?auto_2722450 ) ) ( not ( = ?auto_2722432 ?auto_2722434 ) ) ( not ( = ?auto_2722432 ?auto_2722433 ) ) ( not ( = ?auto_2722432 ?auto_2722435 ) ) ( not ( = ?auto_2722432 ?auto_2722436 ) ) ( not ( = ?auto_2722432 ?auto_2722437 ) ) ( not ( = ?auto_2722432 ?auto_2722438 ) ) ( not ( = ?auto_2722432 ?auto_2722439 ) ) ( not ( = ?auto_2722432 ?auto_2722440 ) ) ( not ( = ?auto_2722432 ?auto_2722441 ) ) ( not ( = ?auto_2722432 ?auto_2722442 ) ) ( not ( = ?auto_2722432 ?auto_2722443 ) ) ( not ( = ?auto_2722432 ?auto_2722444 ) ) ( not ( = ?auto_2722432 ?auto_2722450 ) ) ( not ( = ?auto_2722434 ?auto_2722433 ) ) ( not ( = ?auto_2722434 ?auto_2722435 ) ) ( not ( = ?auto_2722434 ?auto_2722436 ) ) ( not ( = ?auto_2722434 ?auto_2722437 ) ) ( not ( = ?auto_2722434 ?auto_2722438 ) ) ( not ( = ?auto_2722434 ?auto_2722439 ) ) ( not ( = ?auto_2722434 ?auto_2722440 ) ) ( not ( = ?auto_2722434 ?auto_2722441 ) ) ( not ( = ?auto_2722434 ?auto_2722442 ) ) ( not ( = ?auto_2722434 ?auto_2722443 ) ) ( not ( = ?auto_2722434 ?auto_2722444 ) ) ( not ( = ?auto_2722434 ?auto_2722450 ) ) ( not ( = ?auto_2722433 ?auto_2722435 ) ) ( not ( = ?auto_2722433 ?auto_2722436 ) ) ( not ( = ?auto_2722433 ?auto_2722437 ) ) ( not ( = ?auto_2722433 ?auto_2722438 ) ) ( not ( = ?auto_2722433 ?auto_2722439 ) ) ( not ( = ?auto_2722433 ?auto_2722440 ) ) ( not ( = ?auto_2722433 ?auto_2722441 ) ) ( not ( = ?auto_2722433 ?auto_2722442 ) ) ( not ( = ?auto_2722433 ?auto_2722443 ) ) ( not ( = ?auto_2722433 ?auto_2722444 ) ) ( not ( = ?auto_2722433 ?auto_2722450 ) ) ( not ( = ?auto_2722435 ?auto_2722436 ) ) ( not ( = ?auto_2722435 ?auto_2722437 ) ) ( not ( = ?auto_2722435 ?auto_2722438 ) ) ( not ( = ?auto_2722435 ?auto_2722439 ) ) ( not ( = ?auto_2722435 ?auto_2722440 ) ) ( not ( = ?auto_2722435 ?auto_2722441 ) ) ( not ( = ?auto_2722435 ?auto_2722442 ) ) ( not ( = ?auto_2722435 ?auto_2722443 ) ) ( not ( = ?auto_2722435 ?auto_2722444 ) ) ( not ( = ?auto_2722435 ?auto_2722450 ) ) ( not ( = ?auto_2722436 ?auto_2722437 ) ) ( not ( = ?auto_2722436 ?auto_2722438 ) ) ( not ( = ?auto_2722436 ?auto_2722439 ) ) ( not ( = ?auto_2722436 ?auto_2722440 ) ) ( not ( = ?auto_2722436 ?auto_2722441 ) ) ( not ( = ?auto_2722436 ?auto_2722442 ) ) ( not ( = ?auto_2722436 ?auto_2722443 ) ) ( not ( = ?auto_2722436 ?auto_2722444 ) ) ( not ( = ?auto_2722436 ?auto_2722450 ) ) ( not ( = ?auto_2722437 ?auto_2722438 ) ) ( not ( = ?auto_2722437 ?auto_2722439 ) ) ( not ( = ?auto_2722437 ?auto_2722440 ) ) ( not ( = ?auto_2722437 ?auto_2722441 ) ) ( not ( = ?auto_2722437 ?auto_2722442 ) ) ( not ( = ?auto_2722437 ?auto_2722443 ) ) ( not ( = ?auto_2722437 ?auto_2722444 ) ) ( not ( = ?auto_2722437 ?auto_2722450 ) ) ( not ( = ?auto_2722438 ?auto_2722439 ) ) ( not ( = ?auto_2722438 ?auto_2722440 ) ) ( not ( = ?auto_2722438 ?auto_2722441 ) ) ( not ( = ?auto_2722438 ?auto_2722442 ) ) ( not ( = ?auto_2722438 ?auto_2722443 ) ) ( not ( = ?auto_2722438 ?auto_2722444 ) ) ( not ( = ?auto_2722438 ?auto_2722450 ) ) ( not ( = ?auto_2722439 ?auto_2722440 ) ) ( not ( = ?auto_2722439 ?auto_2722441 ) ) ( not ( = ?auto_2722439 ?auto_2722442 ) ) ( not ( = ?auto_2722439 ?auto_2722443 ) ) ( not ( = ?auto_2722439 ?auto_2722444 ) ) ( not ( = ?auto_2722439 ?auto_2722450 ) ) ( not ( = ?auto_2722440 ?auto_2722441 ) ) ( not ( = ?auto_2722440 ?auto_2722442 ) ) ( not ( = ?auto_2722440 ?auto_2722443 ) ) ( not ( = ?auto_2722440 ?auto_2722444 ) ) ( not ( = ?auto_2722440 ?auto_2722450 ) ) ( not ( = ?auto_2722441 ?auto_2722442 ) ) ( not ( = ?auto_2722441 ?auto_2722443 ) ) ( not ( = ?auto_2722441 ?auto_2722444 ) ) ( not ( = ?auto_2722441 ?auto_2722450 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2722442 ?auto_2722443 ?auto_2722444 )
      ( MAKE-14CRATE-VERIFY ?auto_2722430 ?auto_2722431 ?auto_2722432 ?auto_2722434 ?auto_2722433 ?auto_2722435 ?auto_2722436 ?auto_2722437 ?auto_2722438 ?auto_2722439 ?auto_2722440 ?auto_2722441 ?auto_2722442 ?auto_2722443 ?auto_2722444 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2722634 - SURFACE
      ?auto_2722635 - SURFACE
      ?auto_2722636 - SURFACE
      ?auto_2722638 - SURFACE
      ?auto_2722637 - SURFACE
      ?auto_2722639 - SURFACE
      ?auto_2722640 - SURFACE
      ?auto_2722641 - SURFACE
      ?auto_2722642 - SURFACE
      ?auto_2722643 - SURFACE
      ?auto_2722644 - SURFACE
      ?auto_2722645 - SURFACE
      ?auto_2722646 - SURFACE
      ?auto_2722647 - SURFACE
      ?auto_2722648 - SURFACE
    )
    :vars
    (
      ?auto_2722653 - HOIST
      ?auto_2722649 - PLACE
      ?auto_2722652 - PLACE
      ?auto_2722651 - HOIST
      ?auto_2722650 - SURFACE
      ?auto_2722654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2722653 ?auto_2722649 ) ( IS-CRATE ?auto_2722648 ) ( not ( = ?auto_2722647 ?auto_2722648 ) ) ( not ( = ?auto_2722646 ?auto_2722647 ) ) ( not ( = ?auto_2722646 ?auto_2722648 ) ) ( not ( = ?auto_2722652 ?auto_2722649 ) ) ( HOIST-AT ?auto_2722651 ?auto_2722652 ) ( not ( = ?auto_2722653 ?auto_2722651 ) ) ( AVAILABLE ?auto_2722651 ) ( SURFACE-AT ?auto_2722648 ?auto_2722652 ) ( ON ?auto_2722648 ?auto_2722650 ) ( CLEAR ?auto_2722648 ) ( not ( = ?auto_2722647 ?auto_2722650 ) ) ( not ( = ?auto_2722648 ?auto_2722650 ) ) ( not ( = ?auto_2722646 ?auto_2722650 ) ) ( TRUCK-AT ?auto_2722654 ?auto_2722649 ) ( SURFACE-AT ?auto_2722646 ?auto_2722649 ) ( CLEAR ?auto_2722646 ) ( LIFTING ?auto_2722653 ?auto_2722647 ) ( IS-CRATE ?auto_2722647 ) ( ON ?auto_2722635 ?auto_2722634 ) ( ON ?auto_2722636 ?auto_2722635 ) ( ON ?auto_2722638 ?auto_2722636 ) ( ON ?auto_2722637 ?auto_2722638 ) ( ON ?auto_2722639 ?auto_2722637 ) ( ON ?auto_2722640 ?auto_2722639 ) ( ON ?auto_2722641 ?auto_2722640 ) ( ON ?auto_2722642 ?auto_2722641 ) ( ON ?auto_2722643 ?auto_2722642 ) ( ON ?auto_2722644 ?auto_2722643 ) ( ON ?auto_2722645 ?auto_2722644 ) ( ON ?auto_2722646 ?auto_2722645 ) ( not ( = ?auto_2722634 ?auto_2722635 ) ) ( not ( = ?auto_2722634 ?auto_2722636 ) ) ( not ( = ?auto_2722634 ?auto_2722638 ) ) ( not ( = ?auto_2722634 ?auto_2722637 ) ) ( not ( = ?auto_2722634 ?auto_2722639 ) ) ( not ( = ?auto_2722634 ?auto_2722640 ) ) ( not ( = ?auto_2722634 ?auto_2722641 ) ) ( not ( = ?auto_2722634 ?auto_2722642 ) ) ( not ( = ?auto_2722634 ?auto_2722643 ) ) ( not ( = ?auto_2722634 ?auto_2722644 ) ) ( not ( = ?auto_2722634 ?auto_2722645 ) ) ( not ( = ?auto_2722634 ?auto_2722646 ) ) ( not ( = ?auto_2722634 ?auto_2722647 ) ) ( not ( = ?auto_2722634 ?auto_2722648 ) ) ( not ( = ?auto_2722634 ?auto_2722650 ) ) ( not ( = ?auto_2722635 ?auto_2722636 ) ) ( not ( = ?auto_2722635 ?auto_2722638 ) ) ( not ( = ?auto_2722635 ?auto_2722637 ) ) ( not ( = ?auto_2722635 ?auto_2722639 ) ) ( not ( = ?auto_2722635 ?auto_2722640 ) ) ( not ( = ?auto_2722635 ?auto_2722641 ) ) ( not ( = ?auto_2722635 ?auto_2722642 ) ) ( not ( = ?auto_2722635 ?auto_2722643 ) ) ( not ( = ?auto_2722635 ?auto_2722644 ) ) ( not ( = ?auto_2722635 ?auto_2722645 ) ) ( not ( = ?auto_2722635 ?auto_2722646 ) ) ( not ( = ?auto_2722635 ?auto_2722647 ) ) ( not ( = ?auto_2722635 ?auto_2722648 ) ) ( not ( = ?auto_2722635 ?auto_2722650 ) ) ( not ( = ?auto_2722636 ?auto_2722638 ) ) ( not ( = ?auto_2722636 ?auto_2722637 ) ) ( not ( = ?auto_2722636 ?auto_2722639 ) ) ( not ( = ?auto_2722636 ?auto_2722640 ) ) ( not ( = ?auto_2722636 ?auto_2722641 ) ) ( not ( = ?auto_2722636 ?auto_2722642 ) ) ( not ( = ?auto_2722636 ?auto_2722643 ) ) ( not ( = ?auto_2722636 ?auto_2722644 ) ) ( not ( = ?auto_2722636 ?auto_2722645 ) ) ( not ( = ?auto_2722636 ?auto_2722646 ) ) ( not ( = ?auto_2722636 ?auto_2722647 ) ) ( not ( = ?auto_2722636 ?auto_2722648 ) ) ( not ( = ?auto_2722636 ?auto_2722650 ) ) ( not ( = ?auto_2722638 ?auto_2722637 ) ) ( not ( = ?auto_2722638 ?auto_2722639 ) ) ( not ( = ?auto_2722638 ?auto_2722640 ) ) ( not ( = ?auto_2722638 ?auto_2722641 ) ) ( not ( = ?auto_2722638 ?auto_2722642 ) ) ( not ( = ?auto_2722638 ?auto_2722643 ) ) ( not ( = ?auto_2722638 ?auto_2722644 ) ) ( not ( = ?auto_2722638 ?auto_2722645 ) ) ( not ( = ?auto_2722638 ?auto_2722646 ) ) ( not ( = ?auto_2722638 ?auto_2722647 ) ) ( not ( = ?auto_2722638 ?auto_2722648 ) ) ( not ( = ?auto_2722638 ?auto_2722650 ) ) ( not ( = ?auto_2722637 ?auto_2722639 ) ) ( not ( = ?auto_2722637 ?auto_2722640 ) ) ( not ( = ?auto_2722637 ?auto_2722641 ) ) ( not ( = ?auto_2722637 ?auto_2722642 ) ) ( not ( = ?auto_2722637 ?auto_2722643 ) ) ( not ( = ?auto_2722637 ?auto_2722644 ) ) ( not ( = ?auto_2722637 ?auto_2722645 ) ) ( not ( = ?auto_2722637 ?auto_2722646 ) ) ( not ( = ?auto_2722637 ?auto_2722647 ) ) ( not ( = ?auto_2722637 ?auto_2722648 ) ) ( not ( = ?auto_2722637 ?auto_2722650 ) ) ( not ( = ?auto_2722639 ?auto_2722640 ) ) ( not ( = ?auto_2722639 ?auto_2722641 ) ) ( not ( = ?auto_2722639 ?auto_2722642 ) ) ( not ( = ?auto_2722639 ?auto_2722643 ) ) ( not ( = ?auto_2722639 ?auto_2722644 ) ) ( not ( = ?auto_2722639 ?auto_2722645 ) ) ( not ( = ?auto_2722639 ?auto_2722646 ) ) ( not ( = ?auto_2722639 ?auto_2722647 ) ) ( not ( = ?auto_2722639 ?auto_2722648 ) ) ( not ( = ?auto_2722639 ?auto_2722650 ) ) ( not ( = ?auto_2722640 ?auto_2722641 ) ) ( not ( = ?auto_2722640 ?auto_2722642 ) ) ( not ( = ?auto_2722640 ?auto_2722643 ) ) ( not ( = ?auto_2722640 ?auto_2722644 ) ) ( not ( = ?auto_2722640 ?auto_2722645 ) ) ( not ( = ?auto_2722640 ?auto_2722646 ) ) ( not ( = ?auto_2722640 ?auto_2722647 ) ) ( not ( = ?auto_2722640 ?auto_2722648 ) ) ( not ( = ?auto_2722640 ?auto_2722650 ) ) ( not ( = ?auto_2722641 ?auto_2722642 ) ) ( not ( = ?auto_2722641 ?auto_2722643 ) ) ( not ( = ?auto_2722641 ?auto_2722644 ) ) ( not ( = ?auto_2722641 ?auto_2722645 ) ) ( not ( = ?auto_2722641 ?auto_2722646 ) ) ( not ( = ?auto_2722641 ?auto_2722647 ) ) ( not ( = ?auto_2722641 ?auto_2722648 ) ) ( not ( = ?auto_2722641 ?auto_2722650 ) ) ( not ( = ?auto_2722642 ?auto_2722643 ) ) ( not ( = ?auto_2722642 ?auto_2722644 ) ) ( not ( = ?auto_2722642 ?auto_2722645 ) ) ( not ( = ?auto_2722642 ?auto_2722646 ) ) ( not ( = ?auto_2722642 ?auto_2722647 ) ) ( not ( = ?auto_2722642 ?auto_2722648 ) ) ( not ( = ?auto_2722642 ?auto_2722650 ) ) ( not ( = ?auto_2722643 ?auto_2722644 ) ) ( not ( = ?auto_2722643 ?auto_2722645 ) ) ( not ( = ?auto_2722643 ?auto_2722646 ) ) ( not ( = ?auto_2722643 ?auto_2722647 ) ) ( not ( = ?auto_2722643 ?auto_2722648 ) ) ( not ( = ?auto_2722643 ?auto_2722650 ) ) ( not ( = ?auto_2722644 ?auto_2722645 ) ) ( not ( = ?auto_2722644 ?auto_2722646 ) ) ( not ( = ?auto_2722644 ?auto_2722647 ) ) ( not ( = ?auto_2722644 ?auto_2722648 ) ) ( not ( = ?auto_2722644 ?auto_2722650 ) ) ( not ( = ?auto_2722645 ?auto_2722646 ) ) ( not ( = ?auto_2722645 ?auto_2722647 ) ) ( not ( = ?auto_2722645 ?auto_2722648 ) ) ( not ( = ?auto_2722645 ?auto_2722650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2722646 ?auto_2722647 ?auto_2722648 )
      ( MAKE-14CRATE-VERIFY ?auto_2722634 ?auto_2722635 ?auto_2722636 ?auto_2722638 ?auto_2722637 ?auto_2722639 ?auto_2722640 ?auto_2722641 ?auto_2722642 ?auto_2722643 ?auto_2722644 ?auto_2722645 ?auto_2722646 ?auto_2722647 ?auto_2722648 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2722838 - SURFACE
      ?auto_2722839 - SURFACE
      ?auto_2722840 - SURFACE
      ?auto_2722842 - SURFACE
      ?auto_2722841 - SURFACE
      ?auto_2722843 - SURFACE
      ?auto_2722844 - SURFACE
      ?auto_2722845 - SURFACE
      ?auto_2722846 - SURFACE
      ?auto_2722847 - SURFACE
      ?auto_2722848 - SURFACE
      ?auto_2722849 - SURFACE
      ?auto_2722850 - SURFACE
      ?auto_2722851 - SURFACE
      ?auto_2722852 - SURFACE
    )
    :vars
    (
      ?auto_2722858 - HOIST
      ?auto_2722857 - PLACE
      ?auto_2722856 - PLACE
      ?auto_2722853 - HOIST
      ?auto_2722854 - SURFACE
      ?auto_2722855 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2722858 ?auto_2722857 ) ( IS-CRATE ?auto_2722852 ) ( not ( = ?auto_2722851 ?auto_2722852 ) ) ( not ( = ?auto_2722850 ?auto_2722851 ) ) ( not ( = ?auto_2722850 ?auto_2722852 ) ) ( not ( = ?auto_2722856 ?auto_2722857 ) ) ( HOIST-AT ?auto_2722853 ?auto_2722856 ) ( not ( = ?auto_2722858 ?auto_2722853 ) ) ( AVAILABLE ?auto_2722853 ) ( SURFACE-AT ?auto_2722852 ?auto_2722856 ) ( ON ?auto_2722852 ?auto_2722854 ) ( CLEAR ?auto_2722852 ) ( not ( = ?auto_2722851 ?auto_2722854 ) ) ( not ( = ?auto_2722852 ?auto_2722854 ) ) ( not ( = ?auto_2722850 ?auto_2722854 ) ) ( TRUCK-AT ?auto_2722855 ?auto_2722857 ) ( SURFACE-AT ?auto_2722850 ?auto_2722857 ) ( CLEAR ?auto_2722850 ) ( IS-CRATE ?auto_2722851 ) ( AVAILABLE ?auto_2722858 ) ( IN ?auto_2722851 ?auto_2722855 ) ( ON ?auto_2722839 ?auto_2722838 ) ( ON ?auto_2722840 ?auto_2722839 ) ( ON ?auto_2722842 ?auto_2722840 ) ( ON ?auto_2722841 ?auto_2722842 ) ( ON ?auto_2722843 ?auto_2722841 ) ( ON ?auto_2722844 ?auto_2722843 ) ( ON ?auto_2722845 ?auto_2722844 ) ( ON ?auto_2722846 ?auto_2722845 ) ( ON ?auto_2722847 ?auto_2722846 ) ( ON ?auto_2722848 ?auto_2722847 ) ( ON ?auto_2722849 ?auto_2722848 ) ( ON ?auto_2722850 ?auto_2722849 ) ( not ( = ?auto_2722838 ?auto_2722839 ) ) ( not ( = ?auto_2722838 ?auto_2722840 ) ) ( not ( = ?auto_2722838 ?auto_2722842 ) ) ( not ( = ?auto_2722838 ?auto_2722841 ) ) ( not ( = ?auto_2722838 ?auto_2722843 ) ) ( not ( = ?auto_2722838 ?auto_2722844 ) ) ( not ( = ?auto_2722838 ?auto_2722845 ) ) ( not ( = ?auto_2722838 ?auto_2722846 ) ) ( not ( = ?auto_2722838 ?auto_2722847 ) ) ( not ( = ?auto_2722838 ?auto_2722848 ) ) ( not ( = ?auto_2722838 ?auto_2722849 ) ) ( not ( = ?auto_2722838 ?auto_2722850 ) ) ( not ( = ?auto_2722838 ?auto_2722851 ) ) ( not ( = ?auto_2722838 ?auto_2722852 ) ) ( not ( = ?auto_2722838 ?auto_2722854 ) ) ( not ( = ?auto_2722839 ?auto_2722840 ) ) ( not ( = ?auto_2722839 ?auto_2722842 ) ) ( not ( = ?auto_2722839 ?auto_2722841 ) ) ( not ( = ?auto_2722839 ?auto_2722843 ) ) ( not ( = ?auto_2722839 ?auto_2722844 ) ) ( not ( = ?auto_2722839 ?auto_2722845 ) ) ( not ( = ?auto_2722839 ?auto_2722846 ) ) ( not ( = ?auto_2722839 ?auto_2722847 ) ) ( not ( = ?auto_2722839 ?auto_2722848 ) ) ( not ( = ?auto_2722839 ?auto_2722849 ) ) ( not ( = ?auto_2722839 ?auto_2722850 ) ) ( not ( = ?auto_2722839 ?auto_2722851 ) ) ( not ( = ?auto_2722839 ?auto_2722852 ) ) ( not ( = ?auto_2722839 ?auto_2722854 ) ) ( not ( = ?auto_2722840 ?auto_2722842 ) ) ( not ( = ?auto_2722840 ?auto_2722841 ) ) ( not ( = ?auto_2722840 ?auto_2722843 ) ) ( not ( = ?auto_2722840 ?auto_2722844 ) ) ( not ( = ?auto_2722840 ?auto_2722845 ) ) ( not ( = ?auto_2722840 ?auto_2722846 ) ) ( not ( = ?auto_2722840 ?auto_2722847 ) ) ( not ( = ?auto_2722840 ?auto_2722848 ) ) ( not ( = ?auto_2722840 ?auto_2722849 ) ) ( not ( = ?auto_2722840 ?auto_2722850 ) ) ( not ( = ?auto_2722840 ?auto_2722851 ) ) ( not ( = ?auto_2722840 ?auto_2722852 ) ) ( not ( = ?auto_2722840 ?auto_2722854 ) ) ( not ( = ?auto_2722842 ?auto_2722841 ) ) ( not ( = ?auto_2722842 ?auto_2722843 ) ) ( not ( = ?auto_2722842 ?auto_2722844 ) ) ( not ( = ?auto_2722842 ?auto_2722845 ) ) ( not ( = ?auto_2722842 ?auto_2722846 ) ) ( not ( = ?auto_2722842 ?auto_2722847 ) ) ( not ( = ?auto_2722842 ?auto_2722848 ) ) ( not ( = ?auto_2722842 ?auto_2722849 ) ) ( not ( = ?auto_2722842 ?auto_2722850 ) ) ( not ( = ?auto_2722842 ?auto_2722851 ) ) ( not ( = ?auto_2722842 ?auto_2722852 ) ) ( not ( = ?auto_2722842 ?auto_2722854 ) ) ( not ( = ?auto_2722841 ?auto_2722843 ) ) ( not ( = ?auto_2722841 ?auto_2722844 ) ) ( not ( = ?auto_2722841 ?auto_2722845 ) ) ( not ( = ?auto_2722841 ?auto_2722846 ) ) ( not ( = ?auto_2722841 ?auto_2722847 ) ) ( not ( = ?auto_2722841 ?auto_2722848 ) ) ( not ( = ?auto_2722841 ?auto_2722849 ) ) ( not ( = ?auto_2722841 ?auto_2722850 ) ) ( not ( = ?auto_2722841 ?auto_2722851 ) ) ( not ( = ?auto_2722841 ?auto_2722852 ) ) ( not ( = ?auto_2722841 ?auto_2722854 ) ) ( not ( = ?auto_2722843 ?auto_2722844 ) ) ( not ( = ?auto_2722843 ?auto_2722845 ) ) ( not ( = ?auto_2722843 ?auto_2722846 ) ) ( not ( = ?auto_2722843 ?auto_2722847 ) ) ( not ( = ?auto_2722843 ?auto_2722848 ) ) ( not ( = ?auto_2722843 ?auto_2722849 ) ) ( not ( = ?auto_2722843 ?auto_2722850 ) ) ( not ( = ?auto_2722843 ?auto_2722851 ) ) ( not ( = ?auto_2722843 ?auto_2722852 ) ) ( not ( = ?auto_2722843 ?auto_2722854 ) ) ( not ( = ?auto_2722844 ?auto_2722845 ) ) ( not ( = ?auto_2722844 ?auto_2722846 ) ) ( not ( = ?auto_2722844 ?auto_2722847 ) ) ( not ( = ?auto_2722844 ?auto_2722848 ) ) ( not ( = ?auto_2722844 ?auto_2722849 ) ) ( not ( = ?auto_2722844 ?auto_2722850 ) ) ( not ( = ?auto_2722844 ?auto_2722851 ) ) ( not ( = ?auto_2722844 ?auto_2722852 ) ) ( not ( = ?auto_2722844 ?auto_2722854 ) ) ( not ( = ?auto_2722845 ?auto_2722846 ) ) ( not ( = ?auto_2722845 ?auto_2722847 ) ) ( not ( = ?auto_2722845 ?auto_2722848 ) ) ( not ( = ?auto_2722845 ?auto_2722849 ) ) ( not ( = ?auto_2722845 ?auto_2722850 ) ) ( not ( = ?auto_2722845 ?auto_2722851 ) ) ( not ( = ?auto_2722845 ?auto_2722852 ) ) ( not ( = ?auto_2722845 ?auto_2722854 ) ) ( not ( = ?auto_2722846 ?auto_2722847 ) ) ( not ( = ?auto_2722846 ?auto_2722848 ) ) ( not ( = ?auto_2722846 ?auto_2722849 ) ) ( not ( = ?auto_2722846 ?auto_2722850 ) ) ( not ( = ?auto_2722846 ?auto_2722851 ) ) ( not ( = ?auto_2722846 ?auto_2722852 ) ) ( not ( = ?auto_2722846 ?auto_2722854 ) ) ( not ( = ?auto_2722847 ?auto_2722848 ) ) ( not ( = ?auto_2722847 ?auto_2722849 ) ) ( not ( = ?auto_2722847 ?auto_2722850 ) ) ( not ( = ?auto_2722847 ?auto_2722851 ) ) ( not ( = ?auto_2722847 ?auto_2722852 ) ) ( not ( = ?auto_2722847 ?auto_2722854 ) ) ( not ( = ?auto_2722848 ?auto_2722849 ) ) ( not ( = ?auto_2722848 ?auto_2722850 ) ) ( not ( = ?auto_2722848 ?auto_2722851 ) ) ( not ( = ?auto_2722848 ?auto_2722852 ) ) ( not ( = ?auto_2722848 ?auto_2722854 ) ) ( not ( = ?auto_2722849 ?auto_2722850 ) ) ( not ( = ?auto_2722849 ?auto_2722851 ) ) ( not ( = ?auto_2722849 ?auto_2722852 ) ) ( not ( = ?auto_2722849 ?auto_2722854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2722850 ?auto_2722851 ?auto_2722852 )
      ( MAKE-14CRATE-VERIFY ?auto_2722838 ?auto_2722839 ?auto_2722840 ?auto_2722842 ?auto_2722841 ?auto_2722843 ?auto_2722844 ?auto_2722845 ?auto_2722846 ?auto_2722847 ?auto_2722848 ?auto_2722849 ?auto_2722850 ?auto_2722851 ?auto_2722852 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2740003 - SURFACE
      ?auto_2740004 - SURFACE
      ?auto_2740005 - SURFACE
      ?auto_2740007 - SURFACE
      ?auto_2740006 - SURFACE
      ?auto_2740008 - SURFACE
      ?auto_2740009 - SURFACE
      ?auto_2740010 - SURFACE
      ?auto_2740011 - SURFACE
      ?auto_2740012 - SURFACE
      ?auto_2740013 - SURFACE
      ?auto_2740014 - SURFACE
      ?auto_2740015 - SURFACE
      ?auto_2740016 - SURFACE
      ?auto_2740017 - SURFACE
      ?auto_2740018 - SURFACE
    )
    :vars
    (
      ?auto_2740020 - HOIST
      ?auto_2740019 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2740020 ?auto_2740019 ) ( SURFACE-AT ?auto_2740017 ?auto_2740019 ) ( CLEAR ?auto_2740017 ) ( LIFTING ?auto_2740020 ?auto_2740018 ) ( IS-CRATE ?auto_2740018 ) ( not ( = ?auto_2740017 ?auto_2740018 ) ) ( ON ?auto_2740004 ?auto_2740003 ) ( ON ?auto_2740005 ?auto_2740004 ) ( ON ?auto_2740007 ?auto_2740005 ) ( ON ?auto_2740006 ?auto_2740007 ) ( ON ?auto_2740008 ?auto_2740006 ) ( ON ?auto_2740009 ?auto_2740008 ) ( ON ?auto_2740010 ?auto_2740009 ) ( ON ?auto_2740011 ?auto_2740010 ) ( ON ?auto_2740012 ?auto_2740011 ) ( ON ?auto_2740013 ?auto_2740012 ) ( ON ?auto_2740014 ?auto_2740013 ) ( ON ?auto_2740015 ?auto_2740014 ) ( ON ?auto_2740016 ?auto_2740015 ) ( ON ?auto_2740017 ?auto_2740016 ) ( not ( = ?auto_2740003 ?auto_2740004 ) ) ( not ( = ?auto_2740003 ?auto_2740005 ) ) ( not ( = ?auto_2740003 ?auto_2740007 ) ) ( not ( = ?auto_2740003 ?auto_2740006 ) ) ( not ( = ?auto_2740003 ?auto_2740008 ) ) ( not ( = ?auto_2740003 ?auto_2740009 ) ) ( not ( = ?auto_2740003 ?auto_2740010 ) ) ( not ( = ?auto_2740003 ?auto_2740011 ) ) ( not ( = ?auto_2740003 ?auto_2740012 ) ) ( not ( = ?auto_2740003 ?auto_2740013 ) ) ( not ( = ?auto_2740003 ?auto_2740014 ) ) ( not ( = ?auto_2740003 ?auto_2740015 ) ) ( not ( = ?auto_2740003 ?auto_2740016 ) ) ( not ( = ?auto_2740003 ?auto_2740017 ) ) ( not ( = ?auto_2740003 ?auto_2740018 ) ) ( not ( = ?auto_2740004 ?auto_2740005 ) ) ( not ( = ?auto_2740004 ?auto_2740007 ) ) ( not ( = ?auto_2740004 ?auto_2740006 ) ) ( not ( = ?auto_2740004 ?auto_2740008 ) ) ( not ( = ?auto_2740004 ?auto_2740009 ) ) ( not ( = ?auto_2740004 ?auto_2740010 ) ) ( not ( = ?auto_2740004 ?auto_2740011 ) ) ( not ( = ?auto_2740004 ?auto_2740012 ) ) ( not ( = ?auto_2740004 ?auto_2740013 ) ) ( not ( = ?auto_2740004 ?auto_2740014 ) ) ( not ( = ?auto_2740004 ?auto_2740015 ) ) ( not ( = ?auto_2740004 ?auto_2740016 ) ) ( not ( = ?auto_2740004 ?auto_2740017 ) ) ( not ( = ?auto_2740004 ?auto_2740018 ) ) ( not ( = ?auto_2740005 ?auto_2740007 ) ) ( not ( = ?auto_2740005 ?auto_2740006 ) ) ( not ( = ?auto_2740005 ?auto_2740008 ) ) ( not ( = ?auto_2740005 ?auto_2740009 ) ) ( not ( = ?auto_2740005 ?auto_2740010 ) ) ( not ( = ?auto_2740005 ?auto_2740011 ) ) ( not ( = ?auto_2740005 ?auto_2740012 ) ) ( not ( = ?auto_2740005 ?auto_2740013 ) ) ( not ( = ?auto_2740005 ?auto_2740014 ) ) ( not ( = ?auto_2740005 ?auto_2740015 ) ) ( not ( = ?auto_2740005 ?auto_2740016 ) ) ( not ( = ?auto_2740005 ?auto_2740017 ) ) ( not ( = ?auto_2740005 ?auto_2740018 ) ) ( not ( = ?auto_2740007 ?auto_2740006 ) ) ( not ( = ?auto_2740007 ?auto_2740008 ) ) ( not ( = ?auto_2740007 ?auto_2740009 ) ) ( not ( = ?auto_2740007 ?auto_2740010 ) ) ( not ( = ?auto_2740007 ?auto_2740011 ) ) ( not ( = ?auto_2740007 ?auto_2740012 ) ) ( not ( = ?auto_2740007 ?auto_2740013 ) ) ( not ( = ?auto_2740007 ?auto_2740014 ) ) ( not ( = ?auto_2740007 ?auto_2740015 ) ) ( not ( = ?auto_2740007 ?auto_2740016 ) ) ( not ( = ?auto_2740007 ?auto_2740017 ) ) ( not ( = ?auto_2740007 ?auto_2740018 ) ) ( not ( = ?auto_2740006 ?auto_2740008 ) ) ( not ( = ?auto_2740006 ?auto_2740009 ) ) ( not ( = ?auto_2740006 ?auto_2740010 ) ) ( not ( = ?auto_2740006 ?auto_2740011 ) ) ( not ( = ?auto_2740006 ?auto_2740012 ) ) ( not ( = ?auto_2740006 ?auto_2740013 ) ) ( not ( = ?auto_2740006 ?auto_2740014 ) ) ( not ( = ?auto_2740006 ?auto_2740015 ) ) ( not ( = ?auto_2740006 ?auto_2740016 ) ) ( not ( = ?auto_2740006 ?auto_2740017 ) ) ( not ( = ?auto_2740006 ?auto_2740018 ) ) ( not ( = ?auto_2740008 ?auto_2740009 ) ) ( not ( = ?auto_2740008 ?auto_2740010 ) ) ( not ( = ?auto_2740008 ?auto_2740011 ) ) ( not ( = ?auto_2740008 ?auto_2740012 ) ) ( not ( = ?auto_2740008 ?auto_2740013 ) ) ( not ( = ?auto_2740008 ?auto_2740014 ) ) ( not ( = ?auto_2740008 ?auto_2740015 ) ) ( not ( = ?auto_2740008 ?auto_2740016 ) ) ( not ( = ?auto_2740008 ?auto_2740017 ) ) ( not ( = ?auto_2740008 ?auto_2740018 ) ) ( not ( = ?auto_2740009 ?auto_2740010 ) ) ( not ( = ?auto_2740009 ?auto_2740011 ) ) ( not ( = ?auto_2740009 ?auto_2740012 ) ) ( not ( = ?auto_2740009 ?auto_2740013 ) ) ( not ( = ?auto_2740009 ?auto_2740014 ) ) ( not ( = ?auto_2740009 ?auto_2740015 ) ) ( not ( = ?auto_2740009 ?auto_2740016 ) ) ( not ( = ?auto_2740009 ?auto_2740017 ) ) ( not ( = ?auto_2740009 ?auto_2740018 ) ) ( not ( = ?auto_2740010 ?auto_2740011 ) ) ( not ( = ?auto_2740010 ?auto_2740012 ) ) ( not ( = ?auto_2740010 ?auto_2740013 ) ) ( not ( = ?auto_2740010 ?auto_2740014 ) ) ( not ( = ?auto_2740010 ?auto_2740015 ) ) ( not ( = ?auto_2740010 ?auto_2740016 ) ) ( not ( = ?auto_2740010 ?auto_2740017 ) ) ( not ( = ?auto_2740010 ?auto_2740018 ) ) ( not ( = ?auto_2740011 ?auto_2740012 ) ) ( not ( = ?auto_2740011 ?auto_2740013 ) ) ( not ( = ?auto_2740011 ?auto_2740014 ) ) ( not ( = ?auto_2740011 ?auto_2740015 ) ) ( not ( = ?auto_2740011 ?auto_2740016 ) ) ( not ( = ?auto_2740011 ?auto_2740017 ) ) ( not ( = ?auto_2740011 ?auto_2740018 ) ) ( not ( = ?auto_2740012 ?auto_2740013 ) ) ( not ( = ?auto_2740012 ?auto_2740014 ) ) ( not ( = ?auto_2740012 ?auto_2740015 ) ) ( not ( = ?auto_2740012 ?auto_2740016 ) ) ( not ( = ?auto_2740012 ?auto_2740017 ) ) ( not ( = ?auto_2740012 ?auto_2740018 ) ) ( not ( = ?auto_2740013 ?auto_2740014 ) ) ( not ( = ?auto_2740013 ?auto_2740015 ) ) ( not ( = ?auto_2740013 ?auto_2740016 ) ) ( not ( = ?auto_2740013 ?auto_2740017 ) ) ( not ( = ?auto_2740013 ?auto_2740018 ) ) ( not ( = ?auto_2740014 ?auto_2740015 ) ) ( not ( = ?auto_2740014 ?auto_2740016 ) ) ( not ( = ?auto_2740014 ?auto_2740017 ) ) ( not ( = ?auto_2740014 ?auto_2740018 ) ) ( not ( = ?auto_2740015 ?auto_2740016 ) ) ( not ( = ?auto_2740015 ?auto_2740017 ) ) ( not ( = ?auto_2740015 ?auto_2740018 ) ) ( not ( = ?auto_2740016 ?auto_2740017 ) ) ( not ( = ?auto_2740016 ?auto_2740018 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2740017 ?auto_2740018 )
      ( MAKE-15CRATE-VERIFY ?auto_2740003 ?auto_2740004 ?auto_2740005 ?auto_2740007 ?auto_2740006 ?auto_2740008 ?auto_2740009 ?auto_2740010 ?auto_2740011 ?auto_2740012 ?auto_2740013 ?auto_2740014 ?auto_2740015 ?auto_2740016 ?auto_2740017 ?auto_2740018 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2740182 - SURFACE
      ?auto_2740183 - SURFACE
      ?auto_2740184 - SURFACE
      ?auto_2740186 - SURFACE
      ?auto_2740185 - SURFACE
      ?auto_2740187 - SURFACE
      ?auto_2740188 - SURFACE
      ?auto_2740189 - SURFACE
      ?auto_2740190 - SURFACE
      ?auto_2740191 - SURFACE
      ?auto_2740192 - SURFACE
      ?auto_2740193 - SURFACE
      ?auto_2740194 - SURFACE
      ?auto_2740195 - SURFACE
      ?auto_2740196 - SURFACE
      ?auto_2740197 - SURFACE
    )
    :vars
    (
      ?auto_2740200 - HOIST
      ?auto_2740199 - PLACE
      ?auto_2740198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2740200 ?auto_2740199 ) ( SURFACE-AT ?auto_2740196 ?auto_2740199 ) ( CLEAR ?auto_2740196 ) ( IS-CRATE ?auto_2740197 ) ( not ( = ?auto_2740196 ?auto_2740197 ) ) ( TRUCK-AT ?auto_2740198 ?auto_2740199 ) ( AVAILABLE ?auto_2740200 ) ( IN ?auto_2740197 ?auto_2740198 ) ( ON ?auto_2740196 ?auto_2740195 ) ( not ( = ?auto_2740195 ?auto_2740196 ) ) ( not ( = ?auto_2740195 ?auto_2740197 ) ) ( ON ?auto_2740183 ?auto_2740182 ) ( ON ?auto_2740184 ?auto_2740183 ) ( ON ?auto_2740186 ?auto_2740184 ) ( ON ?auto_2740185 ?auto_2740186 ) ( ON ?auto_2740187 ?auto_2740185 ) ( ON ?auto_2740188 ?auto_2740187 ) ( ON ?auto_2740189 ?auto_2740188 ) ( ON ?auto_2740190 ?auto_2740189 ) ( ON ?auto_2740191 ?auto_2740190 ) ( ON ?auto_2740192 ?auto_2740191 ) ( ON ?auto_2740193 ?auto_2740192 ) ( ON ?auto_2740194 ?auto_2740193 ) ( ON ?auto_2740195 ?auto_2740194 ) ( not ( = ?auto_2740182 ?auto_2740183 ) ) ( not ( = ?auto_2740182 ?auto_2740184 ) ) ( not ( = ?auto_2740182 ?auto_2740186 ) ) ( not ( = ?auto_2740182 ?auto_2740185 ) ) ( not ( = ?auto_2740182 ?auto_2740187 ) ) ( not ( = ?auto_2740182 ?auto_2740188 ) ) ( not ( = ?auto_2740182 ?auto_2740189 ) ) ( not ( = ?auto_2740182 ?auto_2740190 ) ) ( not ( = ?auto_2740182 ?auto_2740191 ) ) ( not ( = ?auto_2740182 ?auto_2740192 ) ) ( not ( = ?auto_2740182 ?auto_2740193 ) ) ( not ( = ?auto_2740182 ?auto_2740194 ) ) ( not ( = ?auto_2740182 ?auto_2740195 ) ) ( not ( = ?auto_2740182 ?auto_2740196 ) ) ( not ( = ?auto_2740182 ?auto_2740197 ) ) ( not ( = ?auto_2740183 ?auto_2740184 ) ) ( not ( = ?auto_2740183 ?auto_2740186 ) ) ( not ( = ?auto_2740183 ?auto_2740185 ) ) ( not ( = ?auto_2740183 ?auto_2740187 ) ) ( not ( = ?auto_2740183 ?auto_2740188 ) ) ( not ( = ?auto_2740183 ?auto_2740189 ) ) ( not ( = ?auto_2740183 ?auto_2740190 ) ) ( not ( = ?auto_2740183 ?auto_2740191 ) ) ( not ( = ?auto_2740183 ?auto_2740192 ) ) ( not ( = ?auto_2740183 ?auto_2740193 ) ) ( not ( = ?auto_2740183 ?auto_2740194 ) ) ( not ( = ?auto_2740183 ?auto_2740195 ) ) ( not ( = ?auto_2740183 ?auto_2740196 ) ) ( not ( = ?auto_2740183 ?auto_2740197 ) ) ( not ( = ?auto_2740184 ?auto_2740186 ) ) ( not ( = ?auto_2740184 ?auto_2740185 ) ) ( not ( = ?auto_2740184 ?auto_2740187 ) ) ( not ( = ?auto_2740184 ?auto_2740188 ) ) ( not ( = ?auto_2740184 ?auto_2740189 ) ) ( not ( = ?auto_2740184 ?auto_2740190 ) ) ( not ( = ?auto_2740184 ?auto_2740191 ) ) ( not ( = ?auto_2740184 ?auto_2740192 ) ) ( not ( = ?auto_2740184 ?auto_2740193 ) ) ( not ( = ?auto_2740184 ?auto_2740194 ) ) ( not ( = ?auto_2740184 ?auto_2740195 ) ) ( not ( = ?auto_2740184 ?auto_2740196 ) ) ( not ( = ?auto_2740184 ?auto_2740197 ) ) ( not ( = ?auto_2740186 ?auto_2740185 ) ) ( not ( = ?auto_2740186 ?auto_2740187 ) ) ( not ( = ?auto_2740186 ?auto_2740188 ) ) ( not ( = ?auto_2740186 ?auto_2740189 ) ) ( not ( = ?auto_2740186 ?auto_2740190 ) ) ( not ( = ?auto_2740186 ?auto_2740191 ) ) ( not ( = ?auto_2740186 ?auto_2740192 ) ) ( not ( = ?auto_2740186 ?auto_2740193 ) ) ( not ( = ?auto_2740186 ?auto_2740194 ) ) ( not ( = ?auto_2740186 ?auto_2740195 ) ) ( not ( = ?auto_2740186 ?auto_2740196 ) ) ( not ( = ?auto_2740186 ?auto_2740197 ) ) ( not ( = ?auto_2740185 ?auto_2740187 ) ) ( not ( = ?auto_2740185 ?auto_2740188 ) ) ( not ( = ?auto_2740185 ?auto_2740189 ) ) ( not ( = ?auto_2740185 ?auto_2740190 ) ) ( not ( = ?auto_2740185 ?auto_2740191 ) ) ( not ( = ?auto_2740185 ?auto_2740192 ) ) ( not ( = ?auto_2740185 ?auto_2740193 ) ) ( not ( = ?auto_2740185 ?auto_2740194 ) ) ( not ( = ?auto_2740185 ?auto_2740195 ) ) ( not ( = ?auto_2740185 ?auto_2740196 ) ) ( not ( = ?auto_2740185 ?auto_2740197 ) ) ( not ( = ?auto_2740187 ?auto_2740188 ) ) ( not ( = ?auto_2740187 ?auto_2740189 ) ) ( not ( = ?auto_2740187 ?auto_2740190 ) ) ( not ( = ?auto_2740187 ?auto_2740191 ) ) ( not ( = ?auto_2740187 ?auto_2740192 ) ) ( not ( = ?auto_2740187 ?auto_2740193 ) ) ( not ( = ?auto_2740187 ?auto_2740194 ) ) ( not ( = ?auto_2740187 ?auto_2740195 ) ) ( not ( = ?auto_2740187 ?auto_2740196 ) ) ( not ( = ?auto_2740187 ?auto_2740197 ) ) ( not ( = ?auto_2740188 ?auto_2740189 ) ) ( not ( = ?auto_2740188 ?auto_2740190 ) ) ( not ( = ?auto_2740188 ?auto_2740191 ) ) ( not ( = ?auto_2740188 ?auto_2740192 ) ) ( not ( = ?auto_2740188 ?auto_2740193 ) ) ( not ( = ?auto_2740188 ?auto_2740194 ) ) ( not ( = ?auto_2740188 ?auto_2740195 ) ) ( not ( = ?auto_2740188 ?auto_2740196 ) ) ( not ( = ?auto_2740188 ?auto_2740197 ) ) ( not ( = ?auto_2740189 ?auto_2740190 ) ) ( not ( = ?auto_2740189 ?auto_2740191 ) ) ( not ( = ?auto_2740189 ?auto_2740192 ) ) ( not ( = ?auto_2740189 ?auto_2740193 ) ) ( not ( = ?auto_2740189 ?auto_2740194 ) ) ( not ( = ?auto_2740189 ?auto_2740195 ) ) ( not ( = ?auto_2740189 ?auto_2740196 ) ) ( not ( = ?auto_2740189 ?auto_2740197 ) ) ( not ( = ?auto_2740190 ?auto_2740191 ) ) ( not ( = ?auto_2740190 ?auto_2740192 ) ) ( not ( = ?auto_2740190 ?auto_2740193 ) ) ( not ( = ?auto_2740190 ?auto_2740194 ) ) ( not ( = ?auto_2740190 ?auto_2740195 ) ) ( not ( = ?auto_2740190 ?auto_2740196 ) ) ( not ( = ?auto_2740190 ?auto_2740197 ) ) ( not ( = ?auto_2740191 ?auto_2740192 ) ) ( not ( = ?auto_2740191 ?auto_2740193 ) ) ( not ( = ?auto_2740191 ?auto_2740194 ) ) ( not ( = ?auto_2740191 ?auto_2740195 ) ) ( not ( = ?auto_2740191 ?auto_2740196 ) ) ( not ( = ?auto_2740191 ?auto_2740197 ) ) ( not ( = ?auto_2740192 ?auto_2740193 ) ) ( not ( = ?auto_2740192 ?auto_2740194 ) ) ( not ( = ?auto_2740192 ?auto_2740195 ) ) ( not ( = ?auto_2740192 ?auto_2740196 ) ) ( not ( = ?auto_2740192 ?auto_2740197 ) ) ( not ( = ?auto_2740193 ?auto_2740194 ) ) ( not ( = ?auto_2740193 ?auto_2740195 ) ) ( not ( = ?auto_2740193 ?auto_2740196 ) ) ( not ( = ?auto_2740193 ?auto_2740197 ) ) ( not ( = ?auto_2740194 ?auto_2740195 ) ) ( not ( = ?auto_2740194 ?auto_2740196 ) ) ( not ( = ?auto_2740194 ?auto_2740197 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2740195 ?auto_2740196 ?auto_2740197 )
      ( MAKE-15CRATE-VERIFY ?auto_2740182 ?auto_2740183 ?auto_2740184 ?auto_2740186 ?auto_2740185 ?auto_2740187 ?auto_2740188 ?auto_2740189 ?auto_2740190 ?auto_2740191 ?auto_2740192 ?auto_2740193 ?auto_2740194 ?auto_2740195 ?auto_2740196 ?auto_2740197 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2740377 - SURFACE
      ?auto_2740378 - SURFACE
      ?auto_2740379 - SURFACE
      ?auto_2740381 - SURFACE
      ?auto_2740380 - SURFACE
      ?auto_2740382 - SURFACE
      ?auto_2740383 - SURFACE
      ?auto_2740384 - SURFACE
      ?auto_2740385 - SURFACE
      ?auto_2740386 - SURFACE
      ?auto_2740387 - SURFACE
      ?auto_2740388 - SURFACE
      ?auto_2740389 - SURFACE
      ?auto_2740390 - SURFACE
      ?auto_2740391 - SURFACE
      ?auto_2740392 - SURFACE
    )
    :vars
    (
      ?auto_2740396 - HOIST
      ?auto_2740394 - PLACE
      ?auto_2740395 - TRUCK
      ?auto_2740393 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2740396 ?auto_2740394 ) ( SURFACE-AT ?auto_2740391 ?auto_2740394 ) ( CLEAR ?auto_2740391 ) ( IS-CRATE ?auto_2740392 ) ( not ( = ?auto_2740391 ?auto_2740392 ) ) ( AVAILABLE ?auto_2740396 ) ( IN ?auto_2740392 ?auto_2740395 ) ( ON ?auto_2740391 ?auto_2740390 ) ( not ( = ?auto_2740390 ?auto_2740391 ) ) ( not ( = ?auto_2740390 ?auto_2740392 ) ) ( TRUCK-AT ?auto_2740395 ?auto_2740393 ) ( not ( = ?auto_2740393 ?auto_2740394 ) ) ( ON ?auto_2740378 ?auto_2740377 ) ( ON ?auto_2740379 ?auto_2740378 ) ( ON ?auto_2740381 ?auto_2740379 ) ( ON ?auto_2740380 ?auto_2740381 ) ( ON ?auto_2740382 ?auto_2740380 ) ( ON ?auto_2740383 ?auto_2740382 ) ( ON ?auto_2740384 ?auto_2740383 ) ( ON ?auto_2740385 ?auto_2740384 ) ( ON ?auto_2740386 ?auto_2740385 ) ( ON ?auto_2740387 ?auto_2740386 ) ( ON ?auto_2740388 ?auto_2740387 ) ( ON ?auto_2740389 ?auto_2740388 ) ( ON ?auto_2740390 ?auto_2740389 ) ( not ( = ?auto_2740377 ?auto_2740378 ) ) ( not ( = ?auto_2740377 ?auto_2740379 ) ) ( not ( = ?auto_2740377 ?auto_2740381 ) ) ( not ( = ?auto_2740377 ?auto_2740380 ) ) ( not ( = ?auto_2740377 ?auto_2740382 ) ) ( not ( = ?auto_2740377 ?auto_2740383 ) ) ( not ( = ?auto_2740377 ?auto_2740384 ) ) ( not ( = ?auto_2740377 ?auto_2740385 ) ) ( not ( = ?auto_2740377 ?auto_2740386 ) ) ( not ( = ?auto_2740377 ?auto_2740387 ) ) ( not ( = ?auto_2740377 ?auto_2740388 ) ) ( not ( = ?auto_2740377 ?auto_2740389 ) ) ( not ( = ?auto_2740377 ?auto_2740390 ) ) ( not ( = ?auto_2740377 ?auto_2740391 ) ) ( not ( = ?auto_2740377 ?auto_2740392 ) ) ( not ( = ?auto_2740378 ?auto_2740379 ) ) ( not ( = ?auto_2740378 ?auto_2740381 ) ) ( not ( = ?auto_2740378 ?auto_2740380 ) ) ( not ( = ?auto_2740378 ?auto_2740382 ) ) ( not ( = ?auto_2740378 ?auto_2740383 ) ) ( not ( = ?auto_2740378 ?auto_2740384 ) ) ( not ( = ?auto_2740378 ?auto_2740385 ) ) ( not ( = ?auto_2740378 ?auto_2740386 ) ) ( not ( = ?auto_2740378 ?auto_2740387 ) ) ( not ( = ?auto_2740378 ?auto_2740388 ) ) ( not ( = ?auto_2740378 ?auto_2740389 ) ) ( not ( = ?auto_2740378 ?auto_2740390 ) ) ( not ( = ?auto_2740378 ?auto_2740391 ) ) ( not ( = ?auto_2740378 ?auto_2740392 ) ) ( not ( = ?auto_2740379 ?auto_2740381 ) ) ( not ( = ?auto_2740379 ?auto_2740380 ) ) ( not ( = ?auto_2740379 ?auto_2740382 ) ) ( not ( = ?auto_2740379 ?auto_2740383 ) ) ( not ( = ?auto_2740379 ?auto_2740384 ) ) ( not ( = ?auto_2740379 ?auto_2740385 ) ) ( not ( = ?auto_2740379 ?auto_2740386 ) ) ( not ( = ?auto_2740379 ?auto_2740387 ) ) ( not ( = ?auto_2740379 ?auto_2740388 ) ) ( not ( = ?auto_2740379 ?auto_2740389 ) ) ( not ( = ?auto_2740379 ?auto_2740390 ) ) ( not ( = ?auto_2740379 ?auto_2740391 ) ) ( not ( = ?auto_2740379 ?auto_2740392 ) ) ( not ( = ?auto_2740381 ?auto_2740380 ) ) ( not ( = ?auto_2740381 ?auto_2740382 ) ) ( not ( = ?auto_2740381 ?auto_2740383 ) ) ( not ( = ?auto_2740381 ?auto_2740384 ) ) ( not ( = ?auto_2740381 ?auto_2740385 ) ) ( not ( = ?auto_2740381 ?auto_2740386 ) ) ( not ( = ?auto_2740381 ?auto_2740387 ) ) ( not ( = ?auto_2740381 ?auto_2740388 ) ) ( not ( = ?auto_2740381 ?auto_2740389 ) ) ( not ( = ?auto_2740381 ?auto_2740390 ) ) ( not ( = ?auto_2740381 ?auto_2740391 ) ) ( not ( = ?auto_2740381 ?auto_2740392 ) ) ( not ( = ?auto_2740380 ?auto_2740382 ) ) ( not ( = ?auto_2740380 ?auto_2740383 ) ) ( not ( = ?auto_2740380 ?auto_2740384 ) ) ( not ( = ?auto_2740380 ?auto_2740385 ) ) ( not ( = ?auto_2740380 ?auto_2740386 ) ) ( not ( = ?auto_2740380 ?auto_2740387 ) ) ( not ( = ?auto_2740380 ?auto_2740388 ) ) ( not ( = ?auto_2740380 ?auto_2740389 ) ) ( not ( = ?auto_2740380 ?auto_2740390 ) ) ( not ( = ?auto_2740380 ?auto_2740391 ) ) ( not ( = ?auto_2740380 ?auto_2740392 ) ) ( not ( = ?auto_2740382 ?auto_2740383 ) ) ( not ( = ?auto_2740382 ?auto_2740384 ) ) ( not ( = ?auto_2740382 ?auto_2740385 ) ) ( not ( = ?auto_2740382 ?auto_2740386 ) ) ( not ( = ?auto_2740382 ?auto_2740387 ) ) ( not ( = ?auto_2740382 ?auto_2740388 ) ) ( not ( = ?auto_2740382 ?auto_2740389 ) ) ( not ( = ?auto_2740382 ?auto_2740390 ) ) ( not ( = ?auto_2740382 ?auto_2740391 ) ) ( not ( = ?auto_2740382 ?auto_2740392 ) ) ( not ( = ?auto_2740383 ?auto_2740384 ) ) ( not ( = ?auto_2740383 ?auto_2740385 ) ) ( not ( = ?auto_2740383 ?auto_2740386 ) ) ( not ( = ?auto_2740383 ?auto_2740387 ) ) ( not ( = ?auto_2740383 ?auto_2740388 ) ) ( not ( = ?auto_2740383 ?auto_2740389 ) ) ( not ( = ?auto_2740383 ?auto_2740390 ) ) ( not ( = ?auto_2740383 ?auto_2740391 ) ) ( not ( = ?auto_2740383 ?auto_2740392 ) ) ( not ( = ?auto_2740384 ?auto_2740385 ) ) ( not ( = ?auto_2740384 ?auto_2740386 ) ) ( not ( = ?auto_2740384 ?auto_2740387 ) ) ( not ( = ?auto_2740384 ?auto_2740388 ) ) ( not ( = ?auto_2740384 ?auto_2740389 ) ) ( not ( = ?auto_2740384 ?auto_2740390 ) ) ( not ( = ?auto_2740384 ?auto_2740391 ) ) ( not ( = ?auto_2740384 ?auto_2740392 ) ) ( not ( = ?auto_2740385 ?auto_2740386 ) ) ( not ( = ?auto_2740385 ?auto_2740387 ) ) ( not ( = ?auto_2740385 ?auto_2740388 ) ) ( not ( = ?auto_2740385 ?auto_2740389 ) ) ( not ( = ?auto_2740385 ?auto_2740390 ) ) ( not ( = ?auto_2740385 ?auto_2740391 ) ) ( not ( = ?auto_2740385 ?auto_2740392 ) ) ( not ( = ?auto_2740386 ?auto_2740387 ) ) ( not ( = ?auto_2740386 ?auto_2740388 ) ) ( not ( = ?auto_2740386 ?auto_2740389 ) ) ( not ( = ?auto_2740386 ?auto_2740390 ) ) ( not ( = ?auto_2740386 ?auto_2740391 ) ) ( not ( = ?auto_2740386 ?auto_2740392 ) ) ( not ( = ?auto_2740387 ?auto_2740388 ) ) ( not ( = ?auto_2740387 ?auto_2740389 ) ) ( not ( = ?auto_2740387 ?auto_2740390 ) ) ( not ( = ?auto_2740387 ?auto_2740391 ) ) ( not ( = ?auto_2740387 ?auto_2740392 ) ) ( not ( = ?auto_2740388 ?auto_2740389 ) ) ( not ( = ?auto_2740388 ?auto_2740390 ) ) ( not ( = ?auto_2740388 ?auto_2740391 ) ) ( not ( = ?auto_2740388 ?auto_2740392 ) ) ( not ( = ?auto_2740389 ?auto_2740390 ) ) ( not ( = ?auto_2740389 ?auto_2740391 ) ) ( not ( = ?auto_2740389 ?auto_2740392 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2740390 ?auto_2740391 ?auto_2740392 )
      ( MAKE-15CRATE-VERIFY ?auto_2740377 ?auto_2740378 ?auto_2740379 ?auto_2740381 ?auto_2740380 ?auto_2740382 ?auto_2740383 ?auto_2740384 ?auto_2740385 ?auto_2740386 ?auto_2740387 ?auto_2740388 ?auto_2740389 ?auto_2740390 ?auto_2740391 ?auto_2740392 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2740587 - SURFACE
      ?auto_2740588 - SURFACE
      ?auto_2740589 - SURFACE
      ?auto_2740591 - SURFACE
      ?auto_2740590 - SURFACE
      ?auto_2740592 - SURFACE
      ?auto_2740593 - SURFACE
      ?auto_2740594 - SURFACE
      ?auto_2740595 - SURFACE
      ?auto_2740596 - SURFACE
      ?auto_2740597 - SURFACE
      ?auto_2740598 - SURFACE
      ?auto_2740599 - SURFACE
      ?auto_2740600 - SURFACE
      ?auto_2740601 - SURFACE
      ?auto_2740602 - SURFACE
    )
    :vars
    (
      ?auto_2740603 - HOIST
      ?auto_2740606 - PLACE
      ?auto_2740607 - TRUCK
      ?auto_2740605 - PLACE
      ?auto_2740604 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2740603 ?auto_2740606 ) ( SURFACE-AT ?auto_2740601 ?auto_2740606 ) ( CLEAR ?auto_2740601 ) ( IS-CRATE ?auto_2740602 ) ( not ( = ?auto_2740601 ?auto_2740602 ) ) ( AVAILABLE ?auto_2740603 ) ( ON ?auto_2740601 ?auto_2740600 ) ( not ( = ?auto_2740600 ?auto_2740601 ) ) ( not ( = ?auto_2740600 ?auto_2740602 ) ) ( TRUCK-AT ?auto_2740607 ?auto_2740605 ) ( not ( = ?auto_2740605 ?auto_2740606 ) ) ( HOIST-AT ?auto_2740604 ?auto_2740605 ) ( LIFTING ?auto_2740604 ?auto_2740602 ) ( not ( = ?auto_2740603 ?auto_2740604 ) ) ( ON ?auto_2740588 ?auto_2740587 ) ( ON ?auto_2740589 ?auto_2740588 ) ( ON ?auto_2740591 ?auto_2740589 ) ( ON ?auto_2740590 ?auto_2740591 ) ( ON ?auto_2740592 ?auto_2740590 ) ( ON ?auto_2740593 ?auto_2740592 ) ( ON ?auto_2740594 ?auto_2740593 ) ( ON ?auto_2740595 ?auto_2740594 ) ( ON ?auto_2740596 ?auto_2740595 ) ( ON ?auto_2740597 ?auto_2740596 ) ( ON ?auto_2740598 ?auto_2740597 ) ( ON ?auto_2740599 ?auto_2740598 ) ( ON ?auto_2740600 ?auto_2740599 ) ( not ( = ?auto_2740587 ?auto_2740588 ) ) ( not ( = ?auto_2740587 ?auto_2740589 ) ) ( not ( = ?auto_2740587 ?auto_2740591 ) ) ( not ( = ?auto_2740587 ?auto_2740590 ) ) ( not ( = ?auto_2740587 ?auto_2740592 ) ) ( not ( = ?auto_2740587 ?auto_2740593 ) ) ( not ( = ?auto_2740587 ?auto_2740594 ) ) ( not ( = ?auto_2740587 ?auto_2740595 ) ) ( not ( = ?auto_2740587 ?auto_2740596 ) ) ( not ( = ?auto_2740587 ?auto_2740597 ) ) ( not ( = ?auto_2740587 ?auto_2740598 ) ) ( not ( = ?auto_2740587 ?auto_2740599 ) ) ( not ( = ?auto_2740587 ?auto_2740600 ) ) ( not ( = ?auto_2740587 ?auto_2740601 ) ) ( not ( = ?auto_2740587 ?auto_2740602 ) ) ( not ( = ?auto_2740588 ?auto_2740589 ) ) ( not ( = ?auto_2740588 ?auto_2740591 ) ) ( not ( = ?auto_2740588 ?auto_2740590 ) ) ( not ( = ?auto_2740588 ?auto_2740592 ) ) ( not ( = ?auto_2740588 ?auto_2740593 ) ) ( not ( = ?auto_2740588 ?auto_2740594 ) ) ( not ( = ?auto_2740588 ?auto_2740595 ) ) ( not ( = ?auto_2740588 ?auto_2740596 ) ) ( not ( = ?auto_2740588 ?auto_2740597 ) ) ( not ( = ?auto_2740588 ?auto_2740598 ) ) ( not ( = ?auto_2740588 ?auto_2740599 ) ) ( not ( = ?auto_2740588 ?auto_2740600 ) ) ( not ( = ?auto_2740588 ?auto_2740601 ) ) ( not ( = ?auto_2740588 ?auto_2740602 ) ) ( not ( = ?auto_2740589 ?auto_2740591 ) ) ( not ( = ?auto_2740589 ?auto_2740590 ) ) ( not ( = ?auto_2740589 ?auto_2740592 ) ) ( not ( = ?auto_2740589 ?auto_2740593 ) ) ( not ( = ?auto_2740589 ?auto_2740594 ) ) ( not ( = ?auto_2740589 ?auto_2740595 ) ) ( not ( = ?auto_2740589 ?auto_2740596 ) ) ( not ( = ?auto_2740589 ?auto_2740597 ) ) ( not ( = ?auto_2740589 ?auto_2740598 ) ) ( not ( = ?auto_2740589 ?auto_2740599 ) ) ( not ( = ?auto_2740589 ?auto_2740600 ) ) ( not ( = ?auto_2740589 ?auto_2740601 ) ) ( not ( = ?auto_2740589 ?auto_2740602 ) ) ( not ( = ?auto_2740591 ?auto_2740590 ) ) ( not ( = ?auto_2740591 ?auto_2740592 ) ) ( not ( = ?auto_2740591 ?auto_2740593 ) ) ( not ( = ?auto_2740591 ?auto_2740594 ) ) ( not ( = ?auto_2740591 ?auto_2740595 ) ) ( not ( = ?auto_2740591 ?auto_2740596 ) ) ( not ( = ?auto_2740591 ?auto_2740597 ) ) ( not ( = ?auto_2740591 ?auto_2740598 ) ) ( not ( = ?auto_2740591 ?auto_2740599 ) ) ( not ( = ?auto_2740591 ?auto_2740600 ) ) ( not ( = ?auto_2740591 ?auto_2740601 ) ) ( not ( = ?auto_2740591 ?auto_2740602 ) ) ( not ( = ?auto_2740590 ?auto_2740592 ) ) ( not ( = ?auto_2740590 ?auto_2740593 ) ) ( not ( = ?auto_2740590 ?auto_2740594 ) ) ( not ( = ?auto_2740590 ?auto_2740595 ) ) ( not ( = ?auto_2740590 ?auto_2740596 ) ) ( not ( = ?auto_2740590 ?auto_2740597 ) ) ( not ( = ?auto_2740590 ?auto_2740598 ) ) ( not ( = ?auto_2740590 ?auto_2740599 ) ) ( not ( = ?auto_2740590 ?auto_2740600 ) ) ( not ( = ?auto_2740590 ?auto_2740601 ) ) ( not ( = ?auto_2740590 ?auto_2740602 ) ) ( not ( = ?auto_2740592 ?auto_2740593 ) ) ( not ( = ?auto_2740592 ?auto_2740594 ) ) ( not ( = ?auto_2740592 ?auto_2740595 ) ) ( not ( = ?auto_2740592 ?auto_2740596 ) ) ( not ( = ?auto_2740592 ?auto_2740597 ) ) ( not ( = ?auto_2740592 ?auto_2740598 ) ) ( not ( = ?auto_2740592 ?auto_2740599 ) ) ( not ( = ?auto_2740592 ?auto_2740600 ) ) ( not ( = ?auto_2740592 ?auto_2740601 ) ) ( not ( = ?auto_2740592 ?auto_2740602 ) ) ( not ( = ?auto_2740593 ?auto_2740594 ) ) ( not ( = ?auto_2740593 ?auto_2740595 ) ) ( not ( = ?auto_2740593 ?auto_2740596 ) ) ( not ( = ?auto_2740593 ?auto_2740597 ) ) ( not ( = ?auto_2740593 ?auto_2740598 ) ) ( not ( = ?auto_2740593 ?auto_2740599 ) ) ( not ( = ?auto_2740593 ?auto_2740600 ) ) ( not ( = ?auto_2740593 ?auto_2740601 ) ) ( not ( = ?auto_2740593 ?auto_2740602 ) ) ( not ( = ?auto_2740594 ?auto_2740595 ) ) ( not ( = ?auto_2740594 ?auto_2740596 ) ) ( not ( = ?auto_2740594 ?auto_2740597 ) ) ( not ( = ?auto_2740594 ?auto_2740598 ) ) ( not ( = ?auto_2740594 ?auto_2740599 ) ) ( not ( = ?auto_2740594 ?auto_2740600 ) ) ( not ( = ?auto_2740594 ?auto_2740601 ) ) ( not ( = ?auto_2740594 ?auto_2740602 ) ) ( not ( = ?auto_2740595 ?auto_2740596 ) ) ( not ( = ?auto_2740595 ?auto_2740597 ) ) ( not ( = ?auto_2740595 ?auto_2740598 ) ) ( not ( = ?auto_2740595 ?auto_2740599 ) ) ( not ( = ?auto_2740595 ?auto_2740600 ) ) ( not ( = ?auto_2740595 ?auto_2740601 ) ) ( not ( = ?auto_2740595 ?auto_2740602 ) ) ( not ( = ?auto_2740596 ?auto_2740597 ) ) ( not ( = ?auto_2740596 ?auto_2740598 ) ) ( not ( = ?auto_2740596 ?auto_2740599 ) ) ( not ( = ?auto_2740596 ?auto_2740600 ) ) ( not ( = ?auto_2740596 ?auto_2740601 ) ) ( not ( = ?auto_2740596 ?auto_2740602 ) ) ( not ( = ?auto_2740597 ?auto_2740598 ) ) ( not ( = ?auto_2740597 ?auto_2740599 ) ) ( not ( = ?auto_2740597 ?auto_2740600 ) ) ( not ( = ?auto_2740597 ?auto_2740601 ) ) ( not ( = ?auto_2740597 ?auto_2740602 ) ) ( not ( = ?auto_2740598 ?auto_2740599 ) ) ( not ( = ?auto_2740598 ?auto_2740600 ) ) ( not ( = ?auto_2740598 ?auto_2740601 ) ) ( not ( = ?auto_2740598 ?auto_2740602 ) ) ( not ( = ?auto_2740599 ?auto_2740600 ) ) ( not ( = ?auto_2740599 ?auto_2740601 ) ) ( not ( = ?auto_2740599 ?auto_2740602 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2740600 ?auto_2740601 ?auto_2740602 )
      ( MAKE-15CRATE-VERIFY ?auto_2740587 ?auto_2740588 ?auto_2740589 ?auto_2740591 ?auto_2740590 ?auto_2740592 ?auto_2740593 ?auto_2740594 ?auto_2740595 ?auto_2740596 ?auto_2740597 ?auto_2740598 ?auto_2740599 ?auto_2740600 ?auto_2740601 ?auto_2740602 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2740812 - SURFACE
      ?auto_2740813 - SURFACE
      ?auto_2740814 - SURFACE
      ?auto_2740816 - SURFACE
      ?auto_2740815 - SURFACE
      ?auto_2740817 - SURFACE
      ?auto_2740818 - SURFACE
      ?auto_2740819 - SURFACE
      ?auto_2740820 - SURFACE
      ?auto_2740821 - SURFACE
      ?auto_2740822 - SURFACE
      ?auto_2740823 - SURFACE
      ?auto_2740824 - SURFACE
      ?auto_2740825 - SURFACE
      ?auto_2740826 - SURFACE
      ?auto_2740827 - SURFACE
    )
    :vars
    (
      ?auto_2740829 - HOIST
      ?auto_2740833 - PLACE
      ?auto_2740830 - TRUCK
      ?auto_2740832 - PLACE
      ?auto_2740831 - HOIST
      ?auto_2740828 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2740829 ?auto_2740833 ) ( SURFACE-AT ?auto_2740826 ?auto_2740833 ) ( CLEAR ?auto_2740826 ) ( IS-CRATE ?auto_2740827 ) ( not ( = ?auto_2740826 ?auto_2740827 ) ) ( AVAILABLE ?auto_2740829 ) ( ON ?auto_2740826 ?auto_2740825 ) ( not ( = ?auto_2740825 ?auto_2740826 ) ) ( not ( = ?auto_2740825 ?auto_2740827 ) ) ( TRUCK-AT ?auto_2740830 ?auto_2740832 ) ( not ( = ?auto_2740832 ?auto_2740833 ) ) ( HOIST-AT ?auto_2740831 ?auto_2740832 ) ( not ( = ?auto_2740829 ?auto_2740831 ) ) ( AVAILABLE ?auto_2740831 ) ( SURFACE-AT ?auto_2740827 ?auto_2740832 ) ( ON ?auto_2740827 ?auto_2740828 ) ( CLEAR ?auto_2740827 ) ( not ( = ?auto_2740826 ?auto_2740828 ) ) ( not ( = ?auto_2740827 ?auto_2740828 ) ) ( not ( = ?auto_2740825 ?auto_2740828 ) ) ( ON ?auto_2740813 ?auto_2740812 ) ( ON ?auto_2740814 ?auto_2740813 ) ( ON ?auto_2740816 ?auto_2740814 ) ( ON ?auto_2740815 ?auto_2740816 ) ( ON ?auto_2740817 ?auto_2740815 ) ( ON ?auto_2740818 ?auto_2740817 ) ( ON ?auto_2740819 ?auto_2740818 ) ( ON ?auto_2740820 ?auto_2740819 ) ( ON ?auto_2740821 ?auto_2740820 ) ( ON ?auto_2740822 ?auto_2740821 ) ( ON ?auto_2740823 ?auto_2740822 ) ( ON ?auto_2740824 ?auto_2740823 ) ( ON ?auto_2740825 ?auto_2740824 ) ( not ( = ?auto_2740812 ?auto_2740813 ) ) ( not ( = ?auto_2740812 ?auto_2740814 ) ) ( not ( = ?auto_2740812 ?auto_2740816 ) ) ( not ( = ?auto_2740812 ?auto_2740815 ) ) ( not ( = ?auto_2740812 ?auto_2740817 ) ) ( not ( = ?auto_2740812 ?auto_2740818 ) ) ( not ( = ?auto_2740812 ?auto_2740819 ) ) ( not ( = ?auto_2740812 ?auto_2740820 ) ) ( not ( = ?auto_2740812 ?auto_2740821 ) ) ( not ( = ?auto_2740812 ?auto_2740822 ) ) ( not ( = ?auto_2740812 ?auto_2740823 ) ) ( not ( = ?auto_2740812 ?auto_2740824 ) ) ( not ( = ?auto_2740812 ?auto_2740825 ) ) ( not ( = ?auto_2740812 ?auto_2740826 ) ) ( not ( = ?auto_2740812 ?auto_2740827 ) ) ( not ( = ?auto_2740812 ?auto_2740828 ) ) ( not ( = ?auto_2740813 ?auto_2740814 ) ) ( not ( = ?auto_2740813 ?auto_2740816 ) ) ( not ( = ?auto_2740813 ?auto_2740815 ) ) ( not ( = ?auto_2740813 ?auto_2740817 ) ) ( not ( = ?auto_2740813 ?auto_2740818 ) ) ( not ( = ?auto_2740813 ?auto_2740819 ) ) ( not ( = ?auto_2740813 ?auto_2740820 ) ) ( not ( = ?auto_2740813 ?auto_2740821 ) ) ( not ( = ?auto_2740813 ?auto_2740822 ) ) ( not ( = ?auto_2740813 ?auto_2740823 ) ) ( not ( = ?auto_2740813 ?auto_2740824 ) ) ( not ( = ?auto_2740813 ?auto_2740825 ) ) ( not ( = ?auto_2740813 ?auto_2740826 ) ) ( not ( = ?auto_2740813 ?auto_2740827 ) ) ( not ( = ?auto_2740813 ?auto_2740828 ) ) ( not ( = ?auto_2740814 ?auto_2740816 ) ) ( not ( = ?auto_2740814 ?auto_2740815 ) ) ( not ( = ?auto_2740814 ?auto_2740817 ) ) ( not ( = ?auto_2740814 ?auto_2740818 ) ) ( not ( = ?auto_2740814 ?auto_2740819 ) ) ( not ( = ?auto_2740814 ?auto_2740820 ) ) ( not ( = ?auto_2740814 ?auto_2740821 ) ) ( not ( = ?auto_2740814 ?auto_2740822 ) ) ( not ( = ?auto_2740814 ?auto_2740823 ) ) ( not ( = ?auto_2740814 ?auto_2740824 ) ) ( not ( = ?auto_2740814 ?auto_2740825 ) ) ( not ( = ?auto_2740814 ?auto_2740826 ) ) ( not ( = ?auto_2740814 ?auto_2740827 ) ) ( not ( = ?auto_2740814 ?auto_2740828 ) ) ( not ( = ?auto_2740816 ?auto_2740815 ) ) ( not ( = ?auto_2740816 ?auto_2740817 ) ) ( not ( = ?auto_2740816 ?auto_2740818 ) ) ( not ( = ?auto_2740816 ?auto_2740819 ) ) ( not ( = ?auto_2740816 ?auto_2740820 ) ) ( not ( = ?auto_2740816 ?auto_2740821 ) ) ( not ( = ?auto_2740816 ?auto_2740822 ) ) ( not ( = ?auto_2740816 ?auto_2740823 ) ) ( not ( = ?auto_2740816 ?auto_2740824 ) ) ( not ( = ?auto_2740816 ?auto_2740825 ) ) ( not ( = ?auto_2740816 ?auto_2740826 ) ) ( not ( = ?auto_2740816 ?auto_2740827 ) ) ( not ( = ?auto_2740816 ?auto_2740828 ) ) ( not ( = ?auto_2740815 ?auto_2740817 ) ) ( not ( = ?auto_2740815 ?auto_2740818 ) ) ( not ( = ?auto_2740815 ?auto_2740819 ) ) ( not ( = ?auto_2740815 ?auto_2740820 ) ) ( not ( = ?auto_2740815 ?auto_2740821 ) ) ( not ( = ?auto_2740815 ?auto_2740822 ) ) ( not ( = ?auto_2740815 ?auto_2740823 ) ) ( not ( = ?auto_2740815 ?auto_2740824 ) ) ( not ( = ?auto_2740815 ?auto_2740825 ) ) ( not ( = ?auto_2740815 ?auto_2740826 ) ) ( not ( = ?auto_2740815 ?auto_2740827 ) ) ( not ( = ?auto_2740815 ?auto_2740828 ) ) ( not ( = ?auto_2740817 ?auto_2740818 ) ) ( not ( = ?auto_2740817 ?auto_2740819 ) ) ( not ( = ?auto_2740817 ?auto_2740820 ) ) ( not ( = ?auto_2740817 ?auto_2740821 ) ) ( not ( = ?auto_2740817 ?auto_2740822 ) ) ( not ( = ?auto_2740817 ?auto_2740823 ) ) ( not ( = ?auto_2740817 ?auto_2740824 ) ) ( not ( = ?auto_2740817 ?auto_2740825 ) ) ( not ( = ?auto_2740817 ?auto_2740826 ) ) ( not ( = ?auto_2740817 ?auto_2740827 ) ) ( not ( = ?auto_2740817 ?auto_2740828 ) ) ( not ( = ?auto_2740818 ?auto_2740819 ) ) ( not ( = ?auto_2740818 ?auto_2740820 ) ) ( not ( = ?auto_2740818 ?auto_2740821 ) ) ( not ( = ?auto_2740818 ?auto_2740822 ) ) ( not ( = ?auto_2740818 ?auto_2740823 ) ) ( not ( = ?auto_2740818 ?auto_2740824 ) ) ( not ( = ?auto_2740818 ?auto_2740825 ) ) ( not ( = ?auto_2740818 ?auto_2740826 ) ) ( not ( = ?auto_2740818 ?auto_2740827 ) ) ( not ( = ?auto_2740818 ?auto_2740828 ) ) ( not ( = ?auto_2740819 ?auto_2740820 ) ) ( not ( = ?auto_2740819 ?auto_2740821 ) ) ( not ( = ?auto_2740819 ?auto_2740822 ) ) ( not ( = ?auto_2740819 ?auto_2740823 ) ) ( not ( = ?auto_2740819 ?auto_2740824 ) ) ( not ( = ?auto_2740819 ?auto_2740825 ) ) ( not ( = ?auto_2740819 ?auto_2740826 ) ) ( not ( = ?auto_2740819 ?auto_2740827 ) ) ( not ( = ?auto_2740819 ?auto_2740828 ) ) ( not ( = ?auto_2740820 ?auto_2740821 ) ) ( not ( = ?auto_2740820 ?auto_2740822 ) ) ( not ( = ?auto_2740820 ?auto_2740823 ) ) ( not ( = ?auto_2740820 ?auto_2740824 ) ) ( not ( = ?auto_2740820 ?auto_2740825 ) ) ( not ( = ?auto_2740820 ?auto_2740826 ) ) ( not ( = ?auto_2740820 ?auto_2740827 ) ) ( not ( = ?auto_2740820 ?auto_2740828 ) ) ( not ( = ?auto_2740821 ?auto_2740822 ) ) ( not ( = ?auto_2740821 ?auto_2740823 ) ) ( not ( = ?auto_2740821 ?auto_2740824 ) ) ( not ( = ?auto_2740821 ?auto_2740825 ) ) ( not ( = ?auto_2740821 ?auto_2740826 ) ) ( not ( = ?auto_2740821 ?auto_2740827 ) ) ( not ( = ?auto_2740821 ?auto_2740828 ) ) ( not ( = ?auto_2740822 ?auto_2740823 ) ) ( not ( = ?auto_2740822 ?auto_2740824 ) ) ( not ( = ?auto_2740822 ?auto_2740825 ) ) ( not ( = ?auto_2740822 ?auto_2740826 ) ) ( not ( = ?auto_2740822 ?auto_2740827 ) ) ( not ( = ?auto_2740822 ?auto_2740828 ) ) ( not ( = ?auto_2740823 ?auto_2740824 ) ) ( not ( = ?auto_2740823 ?auto_2740825 ) ) ( not ( = ?auto_2740823 ?auto_2740826 ) ) ( not ( = ?auto_2740823 ?auto_2740827 ) ) ( not ( = ?auto_2740823 ?auto_2740828 ) ) ( not ( = ?auto_2740824 ?auto_2740825 ) ) ( not ( = ?auto_2740824 ?auto_2740826 ) ) ( not ( = ?auto_2740824 ?auto_2740827 ) ) ( not ( = ?auto_2740824 ?auto_2740828 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2740825 ?auto_2740826 ?auto_2740827 )
      ( MAKE-15CRATE-VERIFY ?auto_2740812 ?auto_2740813 ?auto_2740814 ?auto_2740816 ?auto_2740815 ?auto_2740817 ?auto_2740818 ?auto_2740819 ?auto_2740820 ?auto_2740821 ?auto_2740822 ?auto_2740823 ?auto_2740824 ?auto_2740825 ?auto_2740826 ?auto_2740827 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2741038 - SURFACE
      ?auto_2741039 - SURFACE
      ?auto_2741040 - SURFACE
      ?auto_2741042 - SURFACE
      ?auto_2741041 - SURFACE
      ?auto_2741043 - SURFACE
      ?auto_2741044 - SURFACE
      ?auto_2741045 - SURFACE
      ?auto_2741046 - SURFACE
      ?auto_2741047 - SURFACE
      ?auto_2741048 - SURFACE
      ?auto_2741049 - SURFACE
      ?auto_2741050 - SURFACE
      ?auto_2741051 - SURFACE
      ?auto_2741052 - SURFACE
      ?auto_2741053 - SURFACE
    )
    :vars
    (
      ?auto_2741059 - HOIST
      ?auto_2741055 - PLACE
      ?auto_2741057 - PLACE
      ?auto_2741058 - HOIST
      ?auto_2741054 - SURFACE
      ?auto_2741056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2741059 ?auto_2741055 ) ( SURFACE-AT ?auto_2741052 ?auto_2741055 ) ( CLEAR ?auto_2741052 ) ( IS-CRATE ?auto_2741053 ) ( not ( = ?auto_2741052 ?auto_2741053 ) ) ( AVAILABLE ?auto_2741059 ) ( ON ?auto_2741052 ?auto_2741051 ) ( not ( = ?auto_2741051 ?auto_2741052 ) ) ( not ( = ?auto_2741051 ?auto_2741053 ) ) ( not ( = ?auto_2741057 ?auto_2741055 ) ) ( HOIST-AT ?auto_2741058 ?auto_2741057 ) ( not ( = ?auto_2741059 ?auto_2741058 ) ) ( AVAILABLE ?auto_2741058 ) ( SURFACE-AT ?auto_2741053 ?auto_2741057 ) ( ON ?auto_2741053 ?auto_2741054 ) ( CLEAR ?auto_2741053 ) ( not ( = ?auto_2741052 ?auto_2741054 ) ) ( not ( = ?auto_2741053 ?auto_2741054 ) ) ( not ( = ?auto_2741051 ?auto_2741054 ) ) ( TRUCK-AT ?auto_2741056 ?auto_2741055 ) ( ON ?auto_2741039 ?auto_2741038 ) ( ON ?auto_2741040 ?auto_2741039 ) ( ON ?auto_2741042 ?auto_2741040 ) ( ON ?auto_2741041 ?auto_2741042 ) ( ON ?auto_2741043 ?auto_2741041 ) ( ON ?auto_2741044 ?auto_2741043 ) ( ON ?auto_2741045 ?auto_2741044 ) ( ON ?auto_2741046 ?auto_2741045 ) ( ON ?auto_2741047 ?auto_2741046 ) ( ON ?auto_2741048 ?auto_2741047 ) ( ON ?auto_2741049 ?auto_2741048 ) ( ON ?auto_2741050 ?auto_2741049 ) ( ON ?auto_2741051 ?auto_2741050 ) ( not ( = ?auto_2741038 ?auto_2741039 ) ) ( not ( = ?auto_2741038 ?auto_2741040 ) ) ( not ( = ?auto_2741038 ?auto_2741042 ) ) ( not ( = ?auto_2741038 ?auto_2741041 ) ) ( not ( = ?auto_2741038 ?auto_2741043 ) ) ( not ( = ?auto_2741038 ?auto_2741044 ) ) ( not ( = ?auto_2741038 ?auto_2741045 ) ) ( not ( = ?auto_2741038 ?auto_2741046 ) ) ( not ( = ?auto_2741038 ?auto_2741047 ) ) ( not ( = ?auto_2741038 ?auto_2741048 ) ) ( not ( = ?auto_2741038 ?auto_2741049 ) ) ( not ( = ?auto_2741038 ?auto_2741050 ) ) ( not ( = ?auto_2741038 ?auto_2741051 ) ) ( not ( = ?auto_2741038 ?auto_2741052 ) ) ( not ( = ?auto_2741038 ?auto_2741053 ) ) ( not ( = ?auto_2741038 ?auto_2741054 ) ) ( not ( = ?auto_2741039 ?auto_2741040 ) ) ( not ( = ?auto_2741039 ?auto_2741042 ) ) ( not ( = ?auto_2741039 ?auto_2741041 ) ) ( not ( = ?auto_2741039 ?auto_2741043 ) ) ( not ( = ?auto_2741039 ?auto_2741044 ) ) ( not ( = ?auto_2741039 ?auto_2741045 ) ) ( not ( = ?auto_2741039 ?auto_2741046 ) ) ( not ( = ?auto_2741039 ?auto_2741047 ) ) ( not ( = ?auto_2741039 ?auto_2741048 ) ) ( not ( = ?auto_2741039 ?auto_2741049 ) ) ( not ( = ?auto_2741039 ?auto_2741050 ) ) ( not ( = ?auto_2741039 ?auto_2741051 ) ) ( not ( = ?auto_2741039 ?auto_2741052 ) ) ( not ( = ?auto_2741039 ?auto_2741053 ) ) ( not ( = ?auto_2741039 ?auto_2741054 ) ) ( not ( = ?auto_2741040 ?auto_2741042 ) ) ( not ( = ?auto_2741040 ?auto_2741041 ) ) ( not ( = ?auto_2741040 ?auto_2741043 ) ) ( not ( = ?auto_2741040 ?auto_2741044 ) ) ( not ( = ?auto_2741040 ?auto_2741045 ) ) ( not ( = ?auto_2741040 ?auto_2741046 ) ) ( not ( = ?auto_2741040 ?auto_2741047 ) ) ( not ( = ?auto_2741040 ?auto_2741048 ) ) ( not ( = ?auto_2741040 ?auto_2741049 ) ) ( not ( = ?auto_2741040 ?auto_2741050 ) ) ( not ( = ?auto_2741040 ?auto_2741051 ) ) ( not ( = ?auto_2741040 ?auto_2741052 ) ) ( not ( = ?auto_2741040 ?auto_2741053 ) ) ( not ( = ?auto_2741040 ?auto_2741054 ) ) ( not ( = ?auto_2741042 ?auto_2741041 ) ) ( not ( = ?auto_2741042 ?auto_2741043 ) ) ( not ( = ?auto_2741042 ?auto_2741044 ) ) ( not ( = ?auto_2741042 ?auto_2741045 ) ) ( not ( = ?auto_2741042 ?auto_2741046 ) ) ( not ( = ?auto_2741042 ?auto_2741047 ) ) ( not ( = ?auto_2741042 ?auto_2741048 ) ) ( not ( = ?auto_2741042 ?auto_2741049 ) ) ( not ( = ?auto_2741042 ?auto_2741050 ) ) ( not ( = ?auto_2741042 ?auto_2741051 ) ) ( not ( = ?auto_2741042 ?auto_2741052 ) ) ( not ( = ?auto_2741042 ?auto_2741053 ) ) ( not ( = ?auto_2741042 ?auto_2741054 ) ) ( not ( = ?auto_2741041 ?auto_2741043 ) ) ( not ( = ?auto_2741041 ?auto_2741044 ) ) ( not ( = ?auto_2741041 ?auto_2741045 ) ) ( not ( = ?auto_2741041 ?auto_2741046 ) ) ( not ( = ?auto_2741041 ?auto_2741047 ) ) ( not ( = ?auto_2741041 ?auto_2741048 ) ) ( not ( = ?auto_2741041 ?auto_2741049 ) ) ( not ( = ?auto_2741041 ?auto_2741050 ) ) ( not ( = ?auto_2741041 ?auto_2741051 ) ) ( not ( = ?auto_2741041 ?auto_2741052 ) ) ( not ( = ?auto_2741041 ?auto_2741053 ) ) ( not ( = ?auto_2741041 ?auto_2741054 ) ) ( not ( = ?auto_2741043 ?auto_2741044 ) ) ( not ( = ?auto_2741043 ?auto_2741045 ) ) ( not ( = ?auto_2741043 ?auto_2741046 ) ) ( not ( = ?auto_2741043 ?auto_2741047 ) ) ( not ( = ?auto_2741043 ?auto_2741048 ) ) ( not ( = ?auto_2741043 ?auto_2741049 ) ) ( not ( = ?auto_2741043 ?auto_2741050 ) ) ( not ( = ?auto_2741043 ?auto_2741051 ) ) ( not ( = ?auto_2741043 ?auto_2741052 ) ) ( not ( = ?auto_2741043 ?auto_2741053 ) ) ( not ( = ?auto_2741043 ?auto_2741054 ) ) ( not ( = ?auto_2741044 ?auto_2741045 ) ) ( not ( = ?auto_2741044 ?auto_2741046 ) ) ( not ( = ?auto_2741044 ?auto_2741047 ) ) ( not ( = ?auto_2741044 ?auto_2741048 ) ) ( not ( = ?auto_2741044 ?auto_2741049 ) ) ( not ( = ?auto_2741044 ?auto_2741050 ) ) ( not ( = ?auto_2741044 ?auto_2741051 ) ) ( not ( = ?auto_2741044 ?auto_2741052 ) ) ( not ( = ?auto_2741044 ?auto_2741053 ) ) ( not ( = ?auto_2741044 ?auto_2741054 ) ) ( not ( = ?auto_2741045 ?auto_2741046 ) ) ( not ( = ?auto_2741045 ?auto_2741047 ) ) ( not ( = ?auto_2741045 ?auto_2741048 ) ) ( not ( = ?auto_2741045 ?auto_2741049 ) ) ( not ( = ?auto_2741045 ?auto_2741050 ) ) ( not ( = ?auto_2741045 ?auto_2741051 ) ) ( not ( = ?auto_2741045 ?auto_2741052 ) ) ( not ( = ?auto_2741045 ?auto_2741053 ) ) ( not ( = ?auto_2741045 ?auto_2741054 ) ) ( not ( = ?auto_2741046 ?auto_2741047 ) ) ( not ( = ?auto_2741046 ?auto_2741048 ) ) ( not ( = ?auto_2741046 ?auto_2741049 ) ) ( not ( = ?auto_2741046 ?auto_2741050 ) ) ( not ( = ?auto_2741046 ?auto_2741051 ) ) ( not ( = ?auto_2741046 ?auto_2741052 ) ) ( not ( = ?auto_2741046 ?auto_2741053 ) ) ( not ( = ?auto_2741046 ?auto_2741054 ) ) ( not ( = ?auto_2741047 ?auto_2741048 ) ) ( not ( = ?auto_2741047 ?auto_2741049 ) ) ( not ( = ?auto_2741047 ?auto_2741050 ) ) ( not ( = ?auto_2741047 ?auto_2741051 ) ) ( not ( = ?auto_2741047 ?auto_2741052 ) ) ( not ( = ?auto_2741047 ?auto_2741053 ) ) ( not ( = ?auto_2741047 ?auto_2741054 ) ) ( not ( = ?auto_2741048 ?auto_2741049 ) ) ( not ( = ?auto_2741048 ?auto_2741050 ) ) ( not ( = ?auto_2741048 ?auto_2741051 ) ) ( not ( = ?auto_2741048 ?auto_2741052 ) ) ( not ( = ?auto_2741048 ?auto_2741053 ) ) ( not ( = ?auto_2741048 ?auto_2741054 ) ) ( not ( = ?auto_2741049 ?auto_2741050 ) ) ( not ( = ?auto_2741049 ?auto_2741051 ) ) ( not ( = ?auto_2741049 ?auto_2741052 ) ) ( not ( = ?auto_2741049 ?auto_2741053 ) ) ( not ( = ?auto_2741049 ?auto_2741054 ) ) ( not ( = ?auto_2741050 ?auto_2741051 ) ) ( not ( = ?auto_2741050 ?auto_2741052 ) ) ( not ( = ?auto_2741050 ?auto_2741053 ) ) ( not ( = ?auto_2741050 ?auto_2741054 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2741051 ?auto_2741052 ?auto_2741053 )
      ( MAKE-15CRATE-VERIFY ?auto_2741038 ?auto_2741039 ?auto_2741040 ?auto_2741042 ?auto_2741041 ?auto_2741043 ?auto_2741044 ?auto_2741045 ?auto_2741046 ?auto_2741047 ?auto_2741048 ?auto_2741049 ?auto_2741050 ?auto_2741051 ?auto_2741052 ?auto_2741053 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2741264 - SURFACE
      ?auto_2741265 - SURFACE
      ?auto_2741266 - SURFACE
      ?auto_2741268 - SURFACE
      ?auto_2741267 - SURFACE
      ?auto_2741269 - SURFACE
      ?auto_2741270 - SURFACE
      ?auto_2741271 - SURFACE
      ?auto_2741272 - SURFACE
      ?auto_2741273 - SURFACE
      ?auto_2741274 - SURFACE
      ?auto_2741275 - SURFACE
      ?auto_2741276 - SURFACE
      ?auto_2741277 - SURFACE
      ?auto_2741278 - SURFACE
      ?auto_2741279 - SURFACE
    )
    :vars
    (
      ?auto_2741281 - HOIST
      ?auto_2741284 - PLACE
      ?auto_2741283 - PLACE
      ?auto_2741282 - HOIST
      ?auto_2741285 - SURFACE
      ?auto_2741280 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2741281 ?auto_2741284 ) ( IS-CRATE ?auto_2741279 ) ( not ( = ?auto_2741278 ?auto_2741279 ) ) ( not ( = ?auto_2741277 ?auto_2741278 ) ) ( not ( = ?auto_2741277 ?auto_2741279 ) ) ( not ( = ?auto_2741283 ?auto_2741284 ) ) ( HOIST-AT ?auto_2741282 ?auto_2741283 ) ( not ( = ?auto_2741281 ?auto_2741282 ) ) ( AVAILABLE ?auto_2741282 ) ( SURFACE-AT ?auto_2741279 ?auto_2741283 ) ( ON ?auto_2741279 ?auto_2741285 ) ( CLEAR ?auto_2741279 ) ( not ( = ?auto_2741278 ?auto_2741285 ) ) ( not ( = ?auto_2741279 ?auto_2741285 ) ) ( not ( = ?auto_2741277 ?auto_2741285 ) ) ( TRUCK-AT ?auto_2741280 ?auto_2741284 ) ( SURFACE-AT ?auto_2741277 ?auto_2741284 ) ( CLEAR ?auto_2741277 ) ( LIFTING ?auto_2741281 ?auto_2741278 ) ( IS-CRATE ?auto_2741278 ) ( ON ?auto_2741265 ?auto_2741264 ) ( ON ?auto_2741266 ?auto_2741265 ) ( ON ?auto_2741268 ?auto_2741266 ) ( ON ?auto_2741267 ?auto_2741268 ) ( ON ?auto_2741269 ?auto_2741267 ) ( ON ?auto_2741270 ?auto_2741269 ) ( ON ?auto_2741271 ?auto_2741270 ) ( ON ?auto_2741272 ?auto_2741271 ) ( ON ?auto_2741273 ?auto_2741272 ) ( ON ?auto_2741274 ?auto_2741273 ) ( ON ?auto_2741275 ?auto_2741274 ) ( ON ?auto_2741276 ?auto_2741275 ) ( ON ?auto_2741277 ?auto_2741276 ) ( not ( = ?auto_2741264 ?auto_2741265 ) ) ( not ( = ?auto_2741264 ?auto_2741266 ) ) ( not ( = ?auto_2741264 ?auto_2741268 ) ) ( not ( = ?auto_2741264 ?auto_2741267 ) ) ( not ( = ?auto_2741264 ?auto_2741269 ) ) ( not ( = ?auto_2741264 ?auto_2741270 ) ) ( not ( = ?auto_2741264 ?auto_2741271 ) ) ( not ( = ?auto_2741264 ?auto_2741272 ) ) ( not ( = ?auto_2741264 ?auto_2741273 ) ) ( not ( = ?auto_2741264 ?auto_2741274 ) ) ( not ( = ?auto_2741264 ?auto_2741275 ) ) ( not ( = ?auto_2741264 ?auto_2741276 ) ) ( not ( = ?auto_2741264 ?auto_2741277 ) ) ( not ( = ?auto_2741264 ?auto_2741278 ) ) ( not ( = ?auto_2741264 ?auto_2741279 ) ) ( not ( = ?auto_2741264 ?auto_2741285 ) ) ( not ( = ?auto_2741265 ?auto_2741266 ) ) ( not ( = ?auto_2741265 ?auto_2741268 ) ) ( not ( = ?auto_2741265 ?auto_2741267 ) ) ( not ( = ?auto_2741265 ?auto_2741269 ) ) ( not ( = ?auto_2741265 ?auto_2741270 ) ) ( not ( = ?auto_2741265 ?auto_2741271 ) ) ( not ( = ?auto_2741265 ?auto_2741272 ) ) ( not ( = ?auto_2741265 ?auto_2741273 ) ) ( not ( = ?auto_2741265 ?auto_2741274 ) ) ( not ( = ?auto_2741265 ?auto_2741275 ) ) ( not ( = ?auto_2741265 ?auto_2741276 ) ) ( not ( = ?auto_2741265 ?auto_2741277 ) ) ( not ( = ?auto_2741265 ?auto_2741278 ) ) ( not ( = ?auto_2741265 ?auto_2741279 ) ) ( not ( = ?auto_2741265 ?auto_2741285 ) ) ( not ( = ?auto_2741266 ?auto_2741268 ) ) ( not ( = ?auto_2741266 ?auto_2741267 ) ) ( not ( = ?auto_2741266 ?auto_2741269 ) ) ( not ( = ?auto_2741266 ?auto_2741270 ) ) ( not ( = ?auto_2741266 ?auto_2741271 ) ) ( not ( = ?auto_2741266 ?auto_2741272 ) ) ( not ( = ?auto_2741266 ?auto_2741273 ) ) ( not ( = ?auto_2741266 ?auto_2741274 ) ) ( not ( = ?auto_2741266 ?auto_2741275 ) ) ( not ( = ?auto_2741266 ?auto_2741276 ) ) ( not ( = ?auto_2741266 ?auto_2741277 ) ) ( not ( = ?auto_2741266 ?auto_2741278 ) ) ( not ( = ?auto_2741266 ?auto_2741279 ) ) ( not ( = ?auto_2741266 ?auto_2741285 ) ) ( not ( = ?auto_2741268 ?auto_2741267 ) ) ( not ( = ?auto_2741268 ?auto_2741269 ) ) ( not ( = ?auto_2741268 ?auto_2741270 ) ) ( not ( = ?auto_2741268 ?auto_2741271 ) ) ( not ( = ?auto_2741268 ?auto_2741272 ) ) ( not ( = ?auto_2741268 ?auto_2741273 ) ) ( not ( = ?auto_2741268 ?auto_2741274 ) ) ( not ( = ?auto_2741268 ?auto_2741275 ) ) ( not ( = ?auto_2741268 ?auto_2741276 ) ) ( not ( = ?auto_2741268 ?auto_2741277 ) ) ( not ( = ?auto_2741268 ?auto_2741278 ) ) ( not ( = ?auto_2741268 ?auto_2741279 ) ) ( not ( = ?auto_2741268 ?auto_2741285 ) ) ( not ( = ?auto_2741267 ?auto_2741269 ) ) ( not ( = ?auto_2741267 ?auto_2741270 ) ) ( not ( = ?auto_2741267 ?auto_2741271 ) ) ( not ( = ?auto_2741267 ?auto_2741272 ) ) ( not ( = ?auto_2741267 ?auto_2741273 ) ) ( not ( = ?auto_2741267 ?auto_2741274 ) ) ( not ( = ?auto_2741267 ?auto_2741275 ) ) ( not ( = ?auto_2741267 ?auto_2741276 ) ) ( not ( = ?auto_2741267 ?auto_2741277 ) ) ( not ( = ?auto_2741267 ?auto_2741278 ) ) ( not ( = ?auto_2741267 ?auto_2741279 ) ) ( not ( = ?auto_2741267 ?auto_2741285 ) ) ( not ( = ?auto_2741269 ?auto_2741270 ) ) ( not ( = ?auto_2741269 ?auto_2741271 ) ) ( not ( = ?auto_2741269 ?auto_2741272 ) ) ( not ( = ?auto_2741269 ?auto_2741273 ) ) ( not ( = ?auto_2741269 ?auto_2741274 ) ) ( not ( = ?auto_2741269 ?auto_2741275 ) ) ( not ( = ?auto_2741269 ?auto_2741276 ) ) ( not ( = ?auto_2741269 ?auto_2741277 ) ) ( not ( = ?auto_2741269 ?auto_2741278 ) ) ( not ( = ?auto_2741269 ?auto_2741279 ) ) ( not ( = ?auto_2741269 ?auto_2741285 ) ) ( not ( = ?auto_2741270 ?auto_2741271 ) ) ( not ( = ?auto_2741270 ?auto_2741272 ) ) ( not ( = ?auto_2741270 ?auto_2741273 ) ) ( not ( = ?auto_2741270 ?auto_2741274 ) ) ( not ( = ?auto_2741270 ?auto_2741275 ) ) ( not ( = ?auto_2741270 ?auto_2741276 ) ) ( not ( = ?auto_2741270 ?auto_2741277 ) ) ( not ( = ?auto_2741270 ?auto_2741278 ) ) ( not ( = ?auto_2741270 ?auto_2741279 ) ) ( not ( = ?auto_2741270 ?auto_2741285 ) ) ( not ( = ?auto_2741271 ?auto_2741272 ) ) ( not ( = ?auto_2741271 ?auto_2741273 ) ) ( not ( = ?auto_2741271 ?auto_2741274 ) ) ( not ( = ?auto_2741271 ?auto_2741275 ) ) ( not ( = ?auto_2741271 ?auto_2741276 ) ) ( not ( = ?auto_2741271 ?auto_2741277 ) ) ( not ( = ?auto_2741271 ?auto_2741278 ) ) ( not ( = ?auto_2741271 ?auto_2741279 ) ) ( not ( = ?auto_2741271 ?auto_2741285 ) ) ( not ( = ?auto_2741272 ?auto_2741273 ) ) ( not ( = ?auto_2741272 ?auto_2741274 ) ) ( not ( = ?auto_2741272 ?auto_2741275 ) ) ( not ( = ?auto_2741272 ?auto_2741276 ) ) ( not ( = ?auto_2741272 ?auto_2741277 ) ) ( not ( = ?auto_2741272 ?auto_2741278 ) ) ( not ( = ?auto_2741272 ?auto_2741279 ) ) ( not ( = ?auto_2741272 ?auto_2741285 ) ) ( not ( = ?auto_2741273 ?auto_2741274 ) ) ( not ( = ?auto_2741273 ?auto_2741275 ) ) ( not ( = ?auto_2741273 ?auto_2741276 ) ) ( not ( = ?auto_2741273 ?auto_2741277 ) ) ( not ( = ?auto_2741273 ?auto_2741278 ) ) ( not ( = ?auto_2741273 ?auto_2741279 ) ) ( not ( = ?auto_2741273 ?auto_2741285 ) ) ( not ( = ?auto_2741274 ?auto_2741275 ) ) ( not ( = ?auto_2741274 ?auto_2741276 ) ) ( not ( = ?auto_2741274 ?auto_2741277 ) ) ( not ( = ?auto_2741274 ?auto_2741278 ) ) ( not ( = ?auto_2741274 ?auto_2741279 ) ) ( not ( = ?auto_2741274 ?auto_2741285 ) ) ( not ( = ?auto_2741275 ?auto_2741276 ) ) ( not ( = ?auto_2741275 ?auto_2741277 ) ) ( not ( = ?auto_2741275 ?auto_2741278 ) ) ( not ( = ?auto_2741275 ?auto_2741279 ) ) ( not ( = ?auto_2741275 ?auto_2741285 ) ) ( not ( = ?auto_2741276 ?auto_2741277 ) ) ( not ( = ?auto_2741276 ?auto_2741278 ) ) ( not ( = ?auto_2741276 ?auto_2741279 ) ) ( not ( = ?auto_2741276 ?auto_2741285 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2741277 ?auto_2741278 ?auto_2741279 )
      ( MAKE-15CRATE-VERIFY ?auto_2741264 ?auto_2741265 ?auto_2741266 ?auto_2741268 ?auto_2741267 ?auto_2741269 ?auto_2741270 ?auto_2741271 ?auto_2741272 ?auto_2741273 ?auto_2741274 ?auto_2741275 ?auto_2741276 ?auto_2741277 ?auto_2741278 ?auto_2741279 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2741490 - SURFACE
      ?auto_2741491 - SURFACE
      ?auto_2741492 - SURFACE
      ?auto_2741494 - SURFACE
      ?auto_2741493 - SURFACE
      ?auto_2741495 - SURFACE
      ?auto_2741496 - SURFACE
      ?auto_2741497 - SURFACE
      ?auto_2741498 - SURFACE
      ?auto_2741499 - SURFACE
      ?auto_2741500 - SURFACE
      ?auto_2741501 - SURFACE
      ?auto_2741502 - SURFACE
      ?auto_2741503 - SURFACE
      ?auto_2741504 - SURFACE
      ?auto_2741505 - SURFACE
    )
    :vars
    (
      ?auto_2741507 - HOIST
      ?auto_2741509 - PLACE
      ?auto_2741506 - PLACE
      ?auto_2741511 - HOIST
      ?auto_2741510 - SURFACE
      ?auto_2741508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2741507 ?auto_2741509 ) ( IS-CRATE ?auto_2741505 ) ( not ( = ?auto_2741504 ?auto_2741505 ) ) ( not ( = ?auto_2741503 ?auto_2741504 ) ) ( not ( = ?auto_2741503 ?auto_2741505 ) ) ( not ( = ?auto_2741506 ?auto_2741509 ) ) ( HOIST-AT ?auto_2741511 ?auto_2741506 ) ( not ( = ?auto_2741507 ?auto_2741511 ) ) ( AVAILABLE ?auto_2741511 ) ( SURFACE-AT ?auto_2741505 ?auto_2741506 ) ( ON ?auto_2741505 ?auto_2741510 ) ( CLEAR ?auto_2741505 ) ( not ( = ?auto_2741504 ?auto_2741510 ) ) ( not ( = ?auto_2741505 ?auto_2741510 ) ) ( not ( = ?auto_2741503 ?auto_2741510 ) ) ( TRUCK-AT ?auto_2741508 ?auto_2741509 ) ( SURFACE-AT ?auto_2741503 ?auto_2741509 ) ( CLEAR ?auto_2741503 ) ( IS-CRATE ?auto_2741504 ) ( AVAILABLE ?auto_2741507 ) ( IN ?auto_2741504 ?auto_2741508 ) ( ON ?auto_2741491 ?auto_2741490 ) ( ON ?auto_2741492 ?auto_2741491 ) ( ON ?auto_2741494 ?auto_2741492 ) ( ON ?auto_2741493 ?auto_2741494 ) ( ON ?auto_2741495 ?auto_2741493 ) ( ON ?auto_2741496 ?auto_2741495 ) ( ON ?auto_2741497 ?auto_2741496 ) ( ON ?auto_2741498 ?auto_2741497 ) ( ON ?auto_2741499 ?auto_2741498 ) ( ON ?auto_2741500 ?auto_2741499 ) ( ON ?auto_2741501 ?auto_2741500 ) ( ON ?auto_2741502 ?auto_2741501 ) ( ON ?auto_2741503 ?auto_2741502 ) ( not ( = ?auto_2741490 ?auto_2741491 ) ) ( not ( = ?auto_2741490 ?auto_2741492 ) ) ( not ( = ?auto_2741490 ?auto_2741494 ) ) ( not ( = ?auto_2741490 ?auto_2741493 ) ) ( not ( = ?auto_2741490 ?auto_2741495 ) ) ( not ( = ?auto_2741490 ?auto_2741496 ) ) ( not ( = ?auto_2741490 ?auto_2741497 ) ) ( not ( = ?auto_2741490 ?auto_2741498 ) ) ( not ( = ?auto_2741490 ?auto_2741499 ) ) ( not ( = ?auto_2741490 ?auto_2741500 ) ) ( not ( = ?auto_2741490 ?auto_2741501 ) ) ( not ( = ?auto_2741490 ?auto_2741502 ) ) ( not ( = ?auto_2741490 ?auto_2741503 ) ) ( not ( = ?auto_2741490 ?auto_2741504 ) ) ( not ( = ?auto_2741490 ?auto_2741505 ) ) ( not ( = ?auto_2741490 ?auto_2741510 ) ) ( not ( = ?auto_2741491 ?auto_2741492 ) ) ( not ( = ?auto_2741491 ?auto_2741494 ) ) ( not ( = ?auto_2741491 ?auto_2741493 ) ) ( not ( = ?auto_2741491 ?auto_2741495 ) ) ( not ( = ?auto_2741491 ?auto_2741496 ) ) ( not ( = ?auto_2741491 ?auto_2741497 ) ) ( not ( = ?auto_2741491 ?auto_2741498 ) ) ( not ( = ?auto_2741491 ?auto_2741499 ) ) ( not ( = ?auto_2741491 ?auto_2741500 ) ) ( not ( = ?auto_2741491 ?auto_2741501 ) ) ( not ( = ?auto_2741491 ?auto_2741502 ) ) ( not ( = ?auto_2741491 ?auto_2741503 ) ) ( not ( = ?auto_2741491 ?auto_2741504 ) ) ( not ( = ?auto_2741491 ?auto_2741505 ) ) ( not ( = ?auto_2741491 ?auto_2741510 ) ) ( not ( = ?auto_2741492 ?auto_2741494 ) ) ( not ( = ?auto_2741492 ?auto_2741493 ) ) ( not ( = ?auto_2741492 ?auto_2741495 ) ) ( not ( = ?auto_2741492 ?auto_2741496 ) ) ( not ( = ?auto_2741492 ?auto_2741497 ) ) ( not ( = ?auto_2741492 ?auto_2741498 ) ) ( not ( = ?auto_2741492 ?auto_2741499 ) ) ( not ( = ?auto_2741492 ?auto_2741500 ) ) ( not ( = ?auto_2741492 ?auto_2741501 ) ) ( not ( = ?auto_2741492 ?auto_2741502 ) ) ( not ( = ?auto_2741492 ?auto_2741503 ) ) ( not ( = ?auto_2741492 ?auto_2741504 ) ) ( not ( = ?auto_2741492 ?auto_2741505 ) ) ( not ( = ?auto_2741492 ?auto_2741510 ) ) ( not ( = ?auto_2741494 ?auto_2741493 ) ) ( not ( = ?auto_2741494 ?auto_2741495 ) ) ( not ( = ?auto_2741494 ?auto_2741496 ) ) ( not ( = ?auto_2741494 ?auto_2741497 ) ) ( not ( = ?auto_2741494 ?auto_2741498 ) ) ( not ( = ?auto_2741494 ?auto_2741499 ) ) ( not ( = ?auto_2741494 ?auto_2741500 ) ) ( not ( = ?auto_2741494 ?auto_2741501 ) ) ( not ( = ?auto_2741494 ?auto_2741502 ) ) ( not ( = ?auto_2741494 ?auto_2741503 ) ) ( not ( = ?auto_2741494 ?auto_2741504 ) ) ( not ( = ?auto_2741494 ?auto_2741505 ) ) ( not ( = ?auto_2741494 ?auto_2741510 ) ) ( not ( = ?auto_2741493 ?auto_2741495 ) ) ( not ( = ?auto_2741493 ?auto_2741496 ) ) ( not ( = ?auto_2741493 ?auto_2741497 ) ) ( not ( = ?auto_2741493 ?auto_2741498 ) ) ( not ( = ?auto_2741493 ?auto_2741499 ) ) ( not ( = ?auto_2741493 ?auto_2741500 ) ) ( not ( = ?auto_2741493 ?auto_2741501 ) ) ( not ( = ?auto_2741493 ?auto_2741502 ) ) ( not ( = ?auto_2741493 ?auto_2741503 ) ) ( not ( = ?auto_2741493 ?auto_2741504 ) ) ( not ( = ?auto_2741493 ?auto_2741505 ) ) ( not ( = ?auto_2741493 ?auto_2741510 ) ) ( not ( = ?auto_2741495 ?auto_2741496 ) ) ( not ( = ?auto_2741495 ?auto_2741497 ) ) ( not ( = ?auto_2741495 ?auto_2741498 ) ) ( not ( = ?auto_2741495 ?auto_2741499 ) ) ( not ( = ?auto_2741495 ?auto_2741500 ) ) ( not ( = ?auto_2741495 ?auto_2741501 ) ) ( not ( = ?auto_2741495 ?auto_2741502 ) ) ( not ( = ?auto_2741495 ?auto_2741503 ) ) ( not ( = ?auto_2741495 ?auto_2741504 ) ) ( not ( = ?auto_2741495 ?auto_2741505 ) ) ( not ( = ?auto_2741495 ?auto_2741510 ) ) ( not ( = ?auto_2741496 ?auto_2741497 ) ) ( not ( = ?auto_2741496 ?auto_2741498 ) ) ( not ( = ?auto_2741496 ?auto_2741499 ) ) ( not ( = ?auto_2741496 ?auto_2741500 ) ) ( not ( = ?auto_2741496 ?auto_2741501 ) ) ( not ( = ?auto_2741496 ?auto_2741502 ) ) ( not ( = ?auto_2741496 ?auto_2741503 ) ) ( not ( = ?auto_2741496 ?auto_2741504 ) ) ( not ( = ?auto_2741496 ?auto_2741505 ) ) ( not ( = ?auto_2741496 ?auto_2741510 ) ) ( not ( = ?auto_2741497 ?auto_2741498 ) ) ( not ( = ?auto_2741497 ?auto_2741499 ) ) ( not ( = ?auto_2741497 ?auto_2741500 ) ) ( not ( = ?auto_2741497 ?auto_2741501 ) ) ( not ( = ?auto_2741497 ?auto_2741502 ) ) ( not ( = ?auto_2741497 ?auto_2741503 ) ) ( not ( = ?auto_2741497 ?auto_2741504 ) ) ( not ( = ?auto_2741497 ?auto_2741505 ) ) ( not ( = ?auto_2741497 ?auto_2741510 ) ) ( not ( = ?auto_2741498 ?auto_2741499 ) ) ( not ( = ?auto_2741498 ?auto_2741500 ) ) ( not ( = ?auto_2741498 ?auto_2741501 ) ) ( not ( = ?auto_2741498 ?auto_2741502 ) ) ( not ( = ?auto_2741498 ?auto_2741503 ) ) ( not ( = ?auto_2741498 ?auto_2741504 ) ) ( not ( = ?auto_2741498 ?auto_2741505 ) ) ( not ( = ?auto_2741498 ?auto_2741510 ) ) ( not ( = ?auto_2741499 ?auto_2741500 ) ) ( not ( = ?auto_2741499 ?auto_2741501 ) ) ( not ( = ?auto_2741499 ?auto_2741502 ) ) ( not ( = ?auto_2741499 ?auto_2741503 ) ) ( not ( = ?auto_2741499 ?auto_2741504 ) ) ( not ( = ?auto_2741499 ?auto_2741505 ) ) ( not ( = ?auto_2741499 ?auto_2741510 ) ) ( not ( = ?auto_2741500 ?auto_2741501 ) ) ( not ( = ?auto_2741500 ?auto_2741502 ) ) ( not ( = ?auto_2741500 ?auto_2741503 ) ) ( not ( = ?auto_2741500 ?auto_2741504 ) ) ( not ( = ?auto_2741500 ?auto_2741505 ) ) ( not ( = ?auto_2741500 ?auto_2741510 ) ) ( not ( = ?auto_2741501 ?auto_2741502 ) ) ( not ( = ?auto_2741501 ?auto_2741503 ) ) ( not ( = ?auto_2741501 ?auto_2741504 ) ) ( not ( = ?auto_2741501 ?auto_2741505 ) ) ( not ( = ?auto_2741501 ?auto_2741510 ) ) ( not ( = ?auto_2741502 ?auto_2741503 ) ) ( not ( = ?auto_2741502 ?auto_2741504 ) ) ( not ( = ?auto_2741502 ?auto_2741505 ) ) ( not ( = ?auto_2741502 ?auto_2741510 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2741503 ?auto_2741504 ?auto_2741505 )
      ( MAKE-15CRATE-VERIFY ?auto_2741490 ?auto_2741491 ?auto_2741492 ?auto_2741494 ?auto_2741493 ?auto_2741495 ?auto_2741496 ?auto_2741497 ?auto_2741498 ?auto_2741499 ?auto_2741500 ?auto_2741501 ?auto_2741502 ?auto_2741503 ?auto_2741504 ?auto_2741505 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2762020 - SURFACE
      ?auto_2762021 - SURFACE
      ?auto_2762022 - SURFACE
      ?auto_2762024 - SURFACE
      ?auto_2762023 - SURFACE
      ?auto_2762025 - SURFACE
      ?auto_2762026 - SURFACE
      ?auto_2762027 - SURFACE
      ?auto_2762028 - SURFACE
      ?auto_2762029 - SURFACE
      ?auto_2762030 - SURFACE
      ?auto_2762031 - SURFACE
      ?auto_2762032 - SURFACE
      ?auto_2762033 - SURFACE
      ?auto_2762034 - SURFACE
      ?auto_2762035 - SURFACE
      ?auto_2762036 - SURFACE
    )
    :vars
    (
      ?auto_2762038 - HOIST
      ?auto_2762037 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2762038 ?auto_2762037 ) ( SURFACE-AT ?auto_2762035 ?auto_2762037 ) ( CLEAR ?auto_2762035 ) ( LIFTING ?auto_2762038 ?auto_2762036 ) ( IS-CRATE ?auto_2762036 ) ( not ( = ?auto_2762035 ?auto_2762036 ) ) ( ON ?auto_2762021 ?auto_2762020 ) ( ON ?auto_2762022 ?auto_2762021 ) ( ON ?auto_2762024 ?auto_2762022 ) ( ON ?auto_2762023 ?auto_2762024 ) ( ON ?auto_2762025 ?auto_2762023 ) ( ON ?auto_2762026 ?auto_2762025 ) ( ON ?auto_2762027 ?auto_2762026 ) ( ON ?auto_2762028 ?auto_2762027 ) ( ON ?auto_2762029 ?auto_2762028 ) ( ON ?auto_2762030 ?auto_2762029 ) ( ON ?auto_2762031 ?auto_2762030 ) ( ON ?auto_2762032 ?auto_2762031 ) ( ON ?auto_2762033 ?auto_2762032 ) ( ON ?auto_2762034 ?auto_2762033 ) ( ON ?auto_2762035 ?auto_2762034 ) ( not ( = ?auto_2762020 ?auto_2762021 ) ) ( not ( = ?auto_2762020 ?auto_2762022 ) ) ( not ( = ?auto_2762020 ?auto_2762024 ) ) ( not ( = ?auto_2762020 ?auto_2762023 ) ) ( not ( = ?auto_2762020 ?auto_2762025 ) ) ( not ( = ?auto_2762020 ?auto_2762026 ) ) ( not ( = ?auto_2762020 ?auto_2762027 ) ) ( not ( = ?auto_2762020 ?auto_2762028 ) ) ( not ( = ?auto_2762020 ?auto_2762029 ) ) ( not ( = ?auto_2762020 ?auto_2762030 ) ) ( not ( = ?auto_2762020 ?auto_2762031 ) ) ( not ( = ?auto_2762020 ?auto_2762032 ) ) ( not ( = ?auto_2762020 ?auto_2762033 ) ) ( not ( = ?auto_2762020 ?auto_2762034 ) ) ( not ( = ?auto_2762020 ?auto_2762035 ) ) ( not ( = ?auto_2762020 ?auto_2762036 ) ) ( not ( = ?auto_2762021 ?auto_2762022 ) ) ( not ( = ?auto_2762021 ?auto_2762024 ) ) ( not ( = ?auto_2762021 ?auto_2762023 ) ) ( not ( = ?auto_2762021 ?auto_2762025 ) ) ( not ( = ?auto_2762021 ?auto_2762026 ) ) ( not ( = ?auto_2762021 ?auto_2762027 ) ) ( not ( = ?auto_2762021 ?auto_2762028 ) ) ( not ( = ?auto_2762021 ?auto_2762029 ) ) ( not ( = ?auto_2762021 ?auto_2762030 ) ) ( not ( = ?auto_2762021 ?auto_2762031 ) ) ( not ( = ?auto_2762021 ?auto_2762032 ) ) ( not ( = ?auto_2762021 ?auto_2762033 ) ) ( not ( = ?auto_2762021 ?auto_2762034 ) ) ( not ( = ?auto_2762021 ?auto_2762035 ) ) ( not ( = ?auto_2762021 ?auto_2762036 ) ) ( not ( = ?auto_2762022 ?auto_2762024 ) ) ( not ( = ?auto_2762022 ?auto_2762023 ) ) ( not ( = ?auto_2762022 ?auto_2762025 ) ) ( not ( = ?auto_2762022 ?auto_2762026 ) ) ( not ( = ?auto_2762022 ?auto_2762027 ) ) ( not ( = ?auto_2762022 ?auto_2762028 ) ) ( not ( = ?auto_2762022 ?auto_2762029 ) ) ( not ( = ?auto_2762022 ?auto_2762030 ) ) ( not ( = ?auto_2762022 ?auto_2762031 ) ) ( not ( = ?auto_2762022 ?auto_2762032 ) ) ( not ( = ?auto_2762022 ?auto_2762033 ) ) ( not ( = ?auto_2762022 ?auto_2762034 ) ) ( not ( = ?auto_2762022 ?auto_2762035 ) ) ( not ( = ?auto_2762022 ?auto_2762036 ) ) ( not ( = ?auto_2762024 ?auto_2762023 ) ) ( not ( = ?auto_2762024 ?auto_2762025 ) ) ( not ( = ?auto_2762024 ?auto_2762026 ) ) ( not ( = ?auto_2762024 ?auto_2762027 ) ) ( not ( = ?auto_2762024 ?auto_2762028 ) ) ( not ( = ?auto_2762024 ?auto_2762029 ) ) ( not ( = ?auto_2762024 ?auto_2762030 ) ) ( not ( = ?auto_2762024 ?auto_2762031 ) ) ( not ( = ?auto_2762024 ?auto_2762032 ) ) ( not ( = ?auto_2762024 ?auto_2762033 ) ) ( not ( = ?auto_2762024 ?auto_2762034 ) ) ( not ( = ?auto_2762024 ?auto_2762035 ) ) ( not ( = ?auto_2762024 ?auto_2762036 ) ) ( not ( = ?auto_2762023 ?auto_2762025 ) ) ( not ( = ?auto_2762023 ?auto_2762026 ) ) ( not ( = ?auto_2762023 ?auto_2762027 ) ) ( not ( = ?auto_2762023 ?auto_2762028 ) ) ( not ( = ?auto_2762023 ?auto_2762029 ) ) ( not ( = ?auto_2762023 ?auto_2762030 ) ) ( not ( = ?auto_2762023 ?auto_2762031 ) ) ( not ( = ?auto_2762023 ?auto_2762032 ) ) ( not ( = ?auto_2762023 ?auto_2762033 ) ) ( not ( = ?auto_2762023 ?auto_2762034 ) ) ( not ( = ?auto_2762023 ?auto_2762035 ) ) ( not ( = ?auto_2762023 ?auto_2762036 ) ) ( not ( = ?auto_2762025 ?auto_2762026 ) ) ( not ( = ?auto_2762025 ?auto_2762027 ) ) ( not ( = ?auto_2762025 ?auto_2762028 ) ) ( not ( = ?auto_2762025 ?auto_2762029 ) ) ( not ( = ?auto_2762025 ?auto_2762030 ) ) ( not ( = ?auto_2762025 ?auto_2762031 ) ) ( not ( = ?auto_2762025 ?auto_2762032 ) ) ( not ( = ?auto_2762025 ?auto_2762033 ) ) ( not ( = ?auto_2762025 ?auto_2762034 ) ) ( not ( = ?auto_2762025 ?auto_2762035 ) ) ( not ( = ?auto_2762025 ?auto_2762036 ) ) ( not ( = ?auto_2762026 ?auto_2762027 ) ) ( not ( = ?auto_2762026 ?auto_2762028 ) ) ( not ( = ?auto_2762026 ?auto_2762029 ) ) ( not ( = ?auto_2762026 ?auto_2762030 ) ) ( not ( = ?auto_2762026 ?auto_2762031 ) ) ( not ( = ?auto_2762026 ?auto_2762032 ) ) ( not ( = ?auto_2762026 ?auto_2762033 ) ) ( not ( = ?auto_2762026 ?auto_2762034 ) ) ( not ( = ?auto_2762026 ?auto_2762035 ) ) ( not ( = ?auto_2762026 ?auto_2762036 ) ) ( not ( = ?auto_2762027 ?auto_2762028 ) ) ( not ( = ?auto_2762027 ?auto_2762029 ) ) ( not ( = ?auto_2762027 ?auto_2762030 ) ) ( not ( = ?auto_2762027 ?auto_2762031 ) ) ( not ( = ?auto_2762027 ?auto_2762032 ) ) ( not ( = ?auto_2762027 ?auto_2762033 ) ) ( not ( = ?auto_2762027 ?auto_2762034 ) ) ( not ( = ?auto_2762027 ?auto_2762035 ) ) ( not ( = ?auto_2762027 ?auto_2762036 ) ) ( not ( = ?auto_2762028 ?auto_2762029 ) ) ( not ( = ?auto_2762028 ?auto_2762030 ) ) ( not ( = ?auto_2762028 ?auto_2762031 ) ) ( not ( = ?auto_2762028 ?auto_2762032 ) ) ( not ( = ?auto_2762028 ?auto_2762033 ) ) ( not ( = ?auto_2762028 ?auto_2762034 ) ) ( not ( = ?auto_2762028 ?auto_2762035 ) ) ( not ( = ?auto_2762028 ?auto_2762036 ) ) ( not ( = ?auto_2762029 ?auto_2762030 ) ) ( not ( = ?auto_2762029 ?auto_2762031 ) ) ( not ( = ?auto_2762029 ?auto_2762032 ) ) ( not ( = ?auto_2762029 ?auto_2762033 ) ) ( not ( = ?auto_2762029 ?auto_2762034 ) ) ( not ( = ?auto_2762029 ?auto_2762035 ) ) ( not ( = ?auto_2762029 ?auto_2762036 ) ) ( not ( = ?auto_2762030 ?auto_2762031 ) ) ( not ( = ?auto_2762030 ?auto_2762032 ) ) ( not ( = ?auto_2762030 ?auto_2762033 ) ) ( not ( = ?auto_2762030 ?auto_2762034 ) ) ( not ( = ?auto_2762030 ?auto_2762035 ) ) ( not ( = ?auto_2762030 ?auto_2762036 ) ) ( not ( = ?auto_2762031 ?auto_2762032 ) ) ( not ( = ?auto_2762031 ?auto_2762033 ) ) ( not ( = ?auto_2762031 ?auto_2762034 ) ) ( not ( = ?auto_2762031 ?auto_2762035 ) ) ( not ( = ?auto_2762031 ?auto_2762036 ) ) ( not ( = ?auto_2762032 ?auto_2762033 ) ) ( not ( = ?auto_2762032 ?auto_2762034 ) ) ( not ( = ?auto_2762032 ?auto_2762035 ) ) ( not ( = ?auto_2762032 ?auto_2762036 ) ) ( not ( = ?auto_2762033 ?auto_2762034 ) ) ( not ( = ?auto_2762033 ?auto_2762035 ) ) ( not ( = ?auto_2762033 ?auto_2762036 ) ) ( not ( = ?auto_2762034 ?auto_2762035 ) ) ( not ( = ?auto_2762034 ?auto_2762036 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2762035 ?auto_2762036 )
      ( MAKE-16CRATE-VERIFY ?auto_2762020 ?auto_2762021 ?auto_2762022 ?auto_2762024 ?auto_2762023 ?auto_2762025 ?auto_2762026 ?auto_2762027 ?auto_2762028 ?auto_2762029 ?auto_2762030 ?auto_2762031 ?auto_2762032 ?auto_2762033 ?auto_2762034 ?auto_2762035 ?auto_2762036 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2762219 - SURFACE
      ?auto_2762220 - SURFACE
      ?auto_2762221 - SURFACE
      ?auto_2762223 - SURFACE
      ?auto_2762222 - SURFACE
      ?auto_2762224 - SURFACE
      ?auto_2762225 - SURFACE
      ?auto_2762226 - SURFACE
      ?auto_2762227 - SURFACE
      ?auto_2762228 - SURFACE
      ?auto_2762229 - SURFACE
      ?auto_2762230 - SURFACE
      ?auto_2762231 - SURFACE
      ?auto_2762232 - SURFACE
      ?auto_2762233 - SURFACE
      ?auto_2762234 - SURFACE
      ?auto_2762235 - SURFACE
    )
    :vars
    (
      ?auto_2762237 - HOIST
      ?auto_2762236 - PLACE
      ?auto_2762238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2762237 ?auto_2762236 ) ( SURFACE-AT ?auto_2762234 ?auto_2762236 ) ( CLEAR ?auto_2762234 ) ( IS-CRATE ?auto_2762235 ) ( not ( = ?auto_2762234 ?auto_2762235 ) ) ( TRUCK-AT ?auto_2762238 ?auto_2762236 ) ( AVAILABLE ?auto_2762237 ) ( IN ?auto_2762235 ?auto_2762238 ) ( ON ?auto_2762234 ?auto_2762233 ) ( not ( = ?auto_2762233 ?auto_2762234 ) ) ( not ( = ?auto_2762233 ?auto_2762235 ) ) ( ON ?auto_2762220 ?auto_2762219 ) ( ON ?auto_2762221 ?auto_2762220 ) ( ON ?auto_2762223 ?auto_2762221 ) ( ON ?auto_2762222 ?auto_2762223 ) ( ON ?auto_2762224 ?auto_2762222 ) ( ON ?auto_2762225 ?auto_2762224 ) ( ON ?auto_2762226 ?auto_2762225 ) ( ON ?auto_2762227 ?auto_2762226 ) ( ON ?auto_2762228 ?auto_2762227 ) ( ON ?auto_2762229 ?auto_2762228 ) ( ON ?auto_2762230 ?auto_2762229 ) ( ON ?auto_2762231 ?auto_2762230 ) ( ON ?auto_2762232 ?auto_2762231 ) ( ON ?auto_2762233 ?auto_2762232 ) ( not ( = ?auto_2762219 ?auto_2762220 ) ) ( not ( = ?auto_2762219 ?auto_2762221 ) ) ( not ( = ?auto_2762219 ?auto_2762223 ) ) ( not ( = ?auto_2762219 ?auto_2762222 ) ) ( not ( = ?auto_2762219 ?auto_2762224 ) ) ( not ( = ?auto_2762219 ?auto_2762225 ) ) ( not ( = ?auto_2762219 ?auto_2762226 ) ) ( not ( = ?auto_2762219 ?auto_2762227 ) ) ( not ( = ?auto_2762219 ?auto_2762228 ) ) ( not ( = ?auto_2762219 ?auto_2762229 ) ) ( not ( = ?auto_2762219 ?auto_2762230 ) ) ( not ( = ?auto_2762219 ?auto_2762231 ) ) ( not ( = ?auto_2762219 ?auto_2762232 ) ) ( not ( = ?auto_2762219 ?auto_2762233 ) ) ( not ( = ?auto_2762219 ?auto_2762234 ) ) ( not ( = ?auto_2762219 ?auto_2762235 ) ) ( not ( = ?auto_2762220 ?auto_2762221 ) ) ( not ( = ?auto_2762220 ?auto_2762223 ) ) ( not ( = ?auto_2762220 ?auto_2762222 ) ) ( not ( = ?auto_2762220 ?auto_2762224 ) ) ( not ( = ?auto_2762220 ?auto_2762225 ) ) ( not ( = ?auto_2762220 ?auto_2762226 ) ) ( not ( = ?auto_2762220 ?auto_2762227 ) ) ( not ( = ?auto_2762220 ?auto_2762228 ) ) ( not ( = ?auto_2762220 ?auto_2762229 ) ) ( not ( = ?auto_2762220 ?auto_2762230 ) ) ( not ( = ?auto_2762220 ?auto_2762231 ) ) ( not ( = ?auto_2762220 ?auto_2762232 ) ) ( not ( = ?auto_2762220 ?auto_2762233 ) ) ( not ( = ?auto_2762220 ?auto_2762234 ) ) ( not ( = ?auto_2762220 ?auto_2762235 ) ) ( not ( = ?auto_2762221 ?auto_2762223 ) ) ( not ( = ?auto_2762221 ?auto_2762222 ) ) ( not ( = ?auto_2762221 ?auto_2762224 ) ) ( not ( = ?auto_2762221 ?auto_2762225 ) ) ( not ( = ?auto_2762221 ?auto_2762226 ) ) ( not ( = ?auto_2762221 ?auto_2762227 ) ) ( not ( = ?auto_2762221 ?auto_2762228 ) ) ( not ( = ?auto_2762221 ?auto_2762229 ) ) ( not ( = ?auto_2762221 ?auto_2762230 ) ) ( not ( = ?auto_2762221 ?auto_2762231 ) ) ( not ( = ?auto_2762221 ?auto_2762232 ) ) ( not ( = ?auto_2762221 ?auto_2762233 ) ) ( not ( = ?auto_2762221 ?auto_2762234 ) ) ( not ( = ?auto_2762221 ?auto_2762235 ) ) ( not ( = ?auto_2762223 ?auto_2762222 ) ) ( not ( = ?auto_2762223 ?auto_2762224 ) ) ( not ( = ?auto_2762223 ?auto_2762225 ) ) ( not ( = ?auto_2762223 ?auto_2762226 ) ) ( not ( = ?auto_2762223 ?auto_2762227 ) ) ( not ( = ?auto_2762223 ?auto_2762228 ) ) ( not ( = ?auto_2762223 ?auto_2762229 ) ) ( not ( = ?auto_2762223 ?auto_2762230 ) ) ( not ( = ?auto_2762223 ?auto_2762231 ) ) ( not ( = ?auto_2762223 ?auto_2762232 ) ) ( not ( = ?auto_2762223 ?auto_2762233 ) ) ( not ( = ?auto_2762223 ?auto_2762234 ) ) ( not ( = ?auto_2762223 ?auto_2762235 ) ) ( not ( = ?auto_2762222 ?auto_2762224 ) ) ( not ( = ?auto_2762222 ?auto_2762225 ) ) ( not ( = ?auto_2762222 ?auto_2762226 ) ) ( not ( = ?auto_2762222 ?auto_2762227 ) ) ( not ( = ?auto_2762222 ?auto_2762228 ) ) ( not ( = ?auto_2762222 ?auto_2762229 ) ) ( not ( = ?auto_2762222 ?auto_2762230 ) ) ( not ( = ?auto_2762222 ?auto_2762231 ) ) ( not ( = ?auto_2762222 ?auto_2762232 ) ) ( not ( = ?auto_2762222 ?auto_2762233 ) ) ( not ( = ?auto_2762222 ?auto_2762234 ) ) ( not ( = ?auto_2762222 ?auto_2762235 ) ) ( not ( = ?auto_2762224 ?auto_2762225 ) ) ( not ( = ?auto_2762224 ?auto_2762226 ) ) ( not ( = ?auto_2762224 ?auto_2762227 ) ) ( not ( = ?auto_2762224 ?auto_2762228 ) ) ( not ( = ?auto_2762224 ?auto_2762229 ) ) ( not ( = ?auto_2762224 ?auto_2762230 ) ) ( not ( = ?auto_2762224 ?auto_2762231 ) ) ( not ( = ?auto_2762224 ?auto_2762232 ) ) ( not ( = ?auto_2762224 ?auto_2762233 ) ) ( not ( = ?auto_2762224 ?auto_2762234 ) ) ( not ( = ?auto_2762224 ?auto_2762235 ) ) ( not ( = ?auto_2762225 ?auto_2762226 ) ) ( not ( = ?auto_2762225 ?auto_2762227 ) ) ( not ( = ?auto_2762225 ?auto_2762228 ) ) ( not ( = ?auto_2762225 ?auto_2762229 ) ) ( not ( = ?auto_2762225 ?auto_2762230 ) ) ( not ( = ?auto_2762225 ?auto_2762231 ) ) ( not ( = ?auto_2762225 ?auto_2762232 ) ) ( not ( = ?auto_2762225 ?auto_2762233 ) ) ( not ( = ?auto_2762225 ?auto_2762234 ) ) ( not ( = ?auto_2762225 ?auto_2762235 ) ) ( not ( = ?auto_2762226 ?auto_2762227 ) ) ( not ( = ?auto_2762226 ?auto_2762228 ) ) ( not ( = ?auto_2762226 ?auto_2762229 ) ) ( not ( = ?auto_2762226 ?auto_2762230 ) ) ( not ( = ?auto_2762226 ?auto_2762231 ) ) ( not ( = ?auto_2762226 ?auto_2762232 ) ) ( not ( = ?auto_2762226 ?auto_2762233 ) ) ( not ( = ?auto_2762226 ?auto_2762234 ) ) ( not ( = ?auto_2762226 ?auto_2762235 ) ) ( not ( = ?auto_2762227 ?auto_2762228 ) ) ( not ( = ?auto_2762227 ?auto_2762229 ) ) ( not ( = ?auto_2762227 ?auto_2762230 ) ) ( not ( = ?auto_2762227 ?auto_2762231 ) ) ( not ( = ?auto_2762227 ?auto_2762232 ) ) ( not ( = ?auto_2762227 ?auto_2762233 ) ) ( not ( = ?auto_2762227 ?auto_2762234 ) ) ( not ( = ?auto_2762227 ?auto_2762235 ) ) ( not ( = ?auto_2762228 ?auto_2762229 ) ) ( not ( = ?auto_2762228 ?auto_2762230 ) ) ( not ( = ?auto_2762228 ?auto_2762231 ) ) ( not ( = ?auto_2762228 ?auto_2762232 ) ) ( not ( = ?auto_2762228 ?auto_2762233 ) ) ( not ( = ?auto_2762228 ?auto_2762234 ) ) ( not ( = ?auto_2762228 ?auto_2762235 ) ) ( not ( = ?auto_2762229 ?auto_2762230 ) ) ( not ( = ?auto_2762229 ?auto_2762231 ) ) ( not ( = ?auto_2762229 ?auto_2762232 ) ) ( not ( = ?auto_2762229 ?auto_2762233 ) ) ( not ( = ?auto_2762229 ?auto_2762234 ) ) ( not ( = ?auto_2762229 ?auto_2762235 ) ) ( not ( = ?auto_2762230 ?auto_2762231 ) ) ( not ( = ?auto_2762230 ?auto_2762232 ) ) ( not ( = ?auto_2762230 ?auto_2762233 ) ) ( not ( = ?auto_2762230 ?auto_2762234 ) ) ( not ( = ?auto_2762230 ?auto_2762235 ) ) ( not ( = ?auto_2762231 ?auto_2762232 ) ) ( not ( = ?auto_2762231 ?auto_2762233 ) ) ( not ( = ?auto_2762231 ?auto_2762234 ) ) ( not ( = ?auto_2762231 ?auto_2762235 ) ) ( not ( = ?auto_2762232 ?auto_2762233 ) ) ( not ( = ?auto_2762232 ?auto_2762234 ) ) ( not ( = ?auto_2762232 ?auto_2762235 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2762233 ?auto_2762234 ?auto_2762235 )
      ( MAKE-16CRATE-VERIFY ?auto_2762219 ?auto_2762220 ?auto_2762221 ?auto_2762223 ?auto_2762222 ?auto_2762224 ?auto_2762225 ?auto_2762226 ?auto_2762227 ?auto_2762228 ?auto_2762229 ?auto_2762230 ?auto_2762231 ?auto_2762232 ?auto_2762233 ?auto_2762234 ?auto_2762235 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2762435 - SURFACE
      ?auto_2762436 - SURFACE
      ?auto_2762437 - SURFACE
      ?auto_2762439 - SURFACE
      ?auto_2762438 - SURFACE
      ?auto_2762440 - SURFACE
      ?auto_2762441 - SURFACE
      ?auto_2762442 - SURFACE
      ?auto_2762443 - SURFACE
      ?auto_2762444 - SURFACE
      ?auto_2762445 - SURFACE
      ?auto_2762446 - SURFACE
      ?auto_2762447 - SURFACE
      ?auto_2762448 - SURFACE
      ?auto_2762449 - SURFACE
      ?auto_2762450 - SURFACE
      ?auto_2762451 - SURFACE
    )
    :vars
    (
      ?auto_2762454 - HOIST
      ?auto_2762452 - PLACE
      ?auto_2762453 - TRUCK
      ?auto_2762455 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2762454 ?auto_2762452 ) ( SURFACE-AT ?auto_2762450 ?auto_2762452 ) ( CLEAR ?auto_2762450 ) ( IS-CRATE ?auto_2762451 ) ( not ( = ?auto_2762450 ?auto_2762451 ) ) ( AVAILABLE ?auto_2762454 ) ( IN ?auto_2762451 ?auto_2762453 ) ( ON ?auto_2762450 ?auto_2762449 ) ( not ( = ?auto_2762449 ?auto_2762450 ) ) ( not ( = ?auto_2762449 ?auto_2762451 ) ) ( TRUCK-AT ?auto_2762453 ?auto_2762455 ) ( not ( = ?auto_2762455 ?auto_2762452 ) ) ( ON ?auto_2762436 ?auto_2762435 ) ( ON ?auto_2762437 ?auto_2762436 ) ( ON ?auto_2762439 ?auto_2762437 ) ( ON ?auto_2762438 ?auto_2762439 ) ( ON ?auto_2762440 ?auto_2762438 ) ( ON ?auto_2762441 ?auto_2762440 ) ( ON ?auto_2762442 ?auto_2762441 ) ( ON ?auto_2762443 ?auto_2762442 ) ( ON ?auto_2762444 ?auto_2762443 ) ( ON ?auto_2762445 ?auto_2762444 ) ( ON ?auto_2762446 ?auto_2762445 ) ( ON ?auto_2762447 ?auto_2762446 ) ( ON ?auto_2762448 ?auto_2762447 ) ( ON ?auto_2762449 ?auto_2762448 ) ( not ( = ?auto_2762435 ?auto_2762436 ) ) ( not ( = ?auto_2762435 ?auto_2762437 ) ) ( not ( = ?auto_2762435 ?auto_2762439 ) ) ( not ( = ?auto_2762435 ?auto_2762438 ) ) ( not ( = ?auto_2762435 ?auto_2762440 ) ) ( not ( = ?auto_2762435 ?auto_2762441 ) ) ( not ( = ?auto_2762435 ?auto_2762442 ) ) ( not ( = ?auto_2762435 ?auto_2762443 ) ) ( not ( = ?auto_2762435 ?auto_2762444 ) ) ( not ( = ?auto_2762435 ?auto_2762445 ) ) ( not ( = ?auto_2762435 ?auto_2762446 ) ) ( not ( = ?auto_2762435 ?auto_2762447 ) ) ( not ( = ?auto_2762435 ?auto_2762448 ) ) ( not ( = ?auto_2762435 ?auto_2762449 ) ) ( not ( = ?auto_2762435 ?auto_2762450 ) ) ( not ( = ?auto_2762435 ?auto_2762451 ) ) ( not ( = ?auto_2762436 ?auto_2762437 ) ) ( not ( = ?auto_2762436 ?auto_2762439 ) ) ( not ( = ?auto_2762436 ?auto_2762438 ) ) ( not ( = ?auto_2762436 ?auto_2762440 ) ) ( not ( = ?auto_2762436 ?auto_2762441 ) ) ( not ( = ?auto_2762436 ?auto_2762442 ) ) ( not ( = ?auto_2762436 ?auto_2762443 ) ) ( not ( = ?auto_2762436 ?auto_2762444 ) ) ( not ( = ?auto_2762436 ?auto_2762445 ) ) ( not ( = ?auto_2762436 ?auto_2762446 ) ) ( not ( = ?auto_2762436 ?auto_2762447 ) ) ( not ( = ?auto_2762436 ?auto_2762448 ) ) ( not ( = ?auto_2762436 ?auto_2762449 ) ) ( not ( = ?auto_2762436 ?auto_2762450 ) ) ( not ( = ?auto_2762436 ?auto_2762451 ) ) ( not ( = ?auto_2762437 ?auto_2762439 ) ) ( not ( = ?auto_2762437 ?auto_2762438 ) ) ( not ( = ?auto_2762437 ?auto_2762440 ) ) ( not ( = ?auto_2762437 ?auto_2762441 ) ) ( not ( = ?auto_2762437 ?auto_2762442 ) ) ( not ( = ?auto_2762437 ?auto_2762443 ) ) ( not ( = ?auto_2762437 ?auto_2762444 ) ) ( not ( = ?auto_2762437 ?auto_2762445 ) ) ( not ( = ?auto_2762437 ?auto_2762446 ) ) ( not ( = ?auto_2762437 ?auto_2762447 ) ) ( not ( = ?auto_2762437 ?auto_2762448 ) ) ( not ( = ?auto_2762437 ?auto_2762449 ) ) ( not ( = ?auto_2762437 ?auto_2762450 ) ) ( not ( = ?auto_2762437 ?auto_2762451 ) ) ( not ( = ?auto_2762439 ?auto_2762438 ) ) ( not ( = ?auto_2762439 ?auto_2762440 ) ) ( not ( = ?auto_2762439 ?auto_2762441 ) ) ( not ( = ?auto_2762439 ?auto_2762442 ) ) ( not ( = ?auto_2762439 ?auto_2762443 ) ) ( not ( = ?auto_2762439 ?auto_2762444 ) ) ( not ( = ?auto_2762439 ?auto_2762445 ) ) ( not ( = ?auto_2762439 ?auto_2762446 ) ) ( not ( = ?auto_2762439 ?auto_2762447 ) ) ( not ( = ?auto_2762439 ?auto_2762448 ) ) ( not ( = ?auto_2762439 ?auto_2762449 ) ) ( not ( = ?auto_2762439 ?auto_2762450 ) ) ( not ( = ?auto_2762439 ?auto_2762451 ) ) ( not ( = ?auto_2762438 ?auto_2762440 ) ) ( not ( = ?auto_2762438 ?auto_2762441 ) ) ( not ( = ?auto_2762438 ?auto_2762442 ) ) ( not ( = ?auto_2762438 ?auto_2762443 ) ) ( not ( = ?auto_2762438 ?auto_2762444 ) ) ( not ( = ?auto_2762438 ?auto_2762445 ) ) ( not ( = ?auto_2762438 ?auto_2762446 ) ) ( not ( = ?auto_2762438 ?auto_2762447 ) ) ( not ( = ?auto_2762438 ?auto_2762448 ) ) ( not ( = ?auto_2762438 ?auto_2762449 ) ) ( not ( = ?auto_2762438 ?auto_2762450 ) ) ( not ( = ?auto_2762438 ?auto_2762451 ) ) ( not ( = ?auto_2762440 ?auto_2762441 ) ) ( not ( = ?auto_2762440 ?auto_2762442 ) ) ( not ( = ?auto_2762440 ?auto_2762443 ) ) ( not ( = ?auto_2762440 ?auto_2762444 ) ) ( not ( = ?auto_2762440 ?auto_2762445 ) ) ( not ( = ?auto_2762440 ?auto_2762446 ) ) ( not ( = ?auto_2762440 ?auto_2762447 ) ) ( not ( = ?auto_2762440 ?auto_2762448 ) ) ( not ( = ?auto_2762440 ?auto_2762449 ) ) ( not ( = ?auto_2762440 ?auto_2762450 ) ) ( not ( = ?auto_2762440 ?auto_2762451 ) ) ( not ( = ?auto_2762441 ?auto_2762442 ) ) ( not ( = ?auto_2762441 ?auto_2762443 ) ) ( not ( = ?auto_2762441 ?auto_2762444 ) ) ( not ( = ?auto_2762441 ?auto_2762445 ) ) ( not ( = ?auto_2762441 ?auto_2762446 ) ) ( not ( = ?auto_2762441 ?auto_2762447 ) ) ( not ( = ?auto_2762441 ?auto_2762448 ) ) ( not ( = ?auto_2762441 ?auto_2762449 ) ) ( not ( = ?auto_2762441 ?auto_2762450 ) ) ( not ( = ?auto_2762441 ?auto_2762451 ) ) ( not ( = ?auto_2762442 ?auto_2762443 ) ) ( not ( = ?auto_2762442 ?auto_2762444 ) ) ( not ( = ?auto_2762442 ?auto_2762445 ) ) ( not ( = ?auto_2762442 ?auto_2762446 ) ) ( not ( = ?auto_2762442 ?auto_2762447 ) ) ( not ( = ?auto_2762442 ?auto_2762448 ) ) ( not ( = ?auto_2762442 ?auto_2762449 ) ) ( not ( = ?auto_2762442 ?auto_2762450 ) ) ( not ( = ?auto_2762442 ?auto_2762451 ) ) ( not ( = ?auto_2762443 ?auto_2762444 ) ) ( not ( = ?auto_2762443 ?auto_2762445 ) ) ( not ( = ?auto_2762443 ?auto_2762446 ) ) ( not ( = ?auto_2762443 ?auto_2762447 ) ) ( not ( = ?auto_2762443 ?auto_2762448 ) ) ( not ( = ?auto_2762443 ?auto_2762449 ) ) ( not ( = ?auto_2762443 ?auto_2762450 ) ) ( not ( = ?auto_2762443 ?auto_2762451 ) ) ( not ( = ?auto_2762444 ?auto_2762445 ) ) ( not ( = ?auto_2762444 ?auto_2762446 ) ) ( not ( = ?auto_2762444 ?auto_2762447 ) ) ( not ( = ?auto_2762444 ?auto_2762448 ) ) ( not ( = ?auto_2762444 ?auto_2762449 ) ) ( not ( = ?auto_2762444 ?auto_2762450 ) ) ( not ( = ?auto_2762444 ?auto_2762451 ) ) ( not ( = ?auto_2762445 ?auto_2762446 ) ) ( not ( = ?auto_2762445 ?auto_2762447 ) ) ( not ( = ?auto_2762445 ?auto_2762448 ) ) ( not ( = ?auto_2762445 ?auto_2762449 ) ) ( not ( = ?auto_2762445 ?auto_2762450 ) ) ( not ( = ?auto_2762445 ?auto_2762451 ) ) ( not ( = ?auto_2762446 ?auto_2762447 ) ) ( not ( = ?auto_2762446 ?auto_2762448 ) ) ( not ( = ?auto_2762446 ?auto_2762449 ) ) ( not ( = ?auto_2762446 ?auto_2762450 ) ) ( not ( = ?auto_2762446 ?auto_2762451 ) ) ( not ( = ?auto_2762447 ?auto_2762448 ) ) ( not ( = ?auto_2762447 ?auto_2762449 ) ) ( not ( = ?auto_2762447 ?auto_2762450 ) ) ( not ( = ?auto_2762447 ?auto_2762451 ) ) ( not ( = ?auto_2762448 ?auto_2762449 ) ) ( not ( = ?auto_2762448 ?auto_2762450 ) ) ( not ( = ?auto_2762448 ?auto_2762451 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2762449 ?auto_2762450 ?auto_2762451 )
      ( MAKE-16CRATE-VERIFY ?auto_2762435 ?auto_2762436 ?auto_2762437 ?auto_2762439 ?auto_2762438 ?auto_2762440 ?auto_2762441 ?auto_2762442 ?auto_2762443 ?auto_2762444 ?auto_2762445 ?auto_2762446 ?auto_2762447 ?auto_2762448 ?auto_2762449 ?auto_2762450 ?auto_2762451 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2762667 - SURFACE
      ?auto_2762668 - SURFACE
      ?auto_2762669 - SURFACE
      ?auto_2762671 - SURFACE
      ?auto_2762670 - SURFACE
      ?auto_2762672 - SURFACE
      ?auto_2762673 - SURFACE
      ?auto_2762674 - SURFACE
      ?auto_2762675 - SURFACE
      ?auto_2762676 - SURFACE
      ?auto_2762677 - SURFACE
      ?auto_2762678 - SURFACE
      ?auto_2762679 - SURFACE
      ?auto_2762680 - SURFACE
      ?auto_2762681 - SURFACE
      ?auto_2762682 - SURFACE
      ?auto_2762683 - SURFACE
    )
    :vars
    (
      ?auto_2762686 - HOIST
      ?auto_2762684 - PLACE
      ?auto_2762687 - TRUCK
      ?auto_2762685 - PLACE
      ?auto_2762688 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2762686 ?auto_2762684 ) ( SURFACE-AT ?auto_2762682 ?auto_2762684 ) ( CLEAR ?auto_2762682 ) ( IS-CRATE ?auto_2762683 ) ( not ( = ?auto_2762682 ?auto_2762683 ) ) ( AVAILABLE ?auto_2762686 ) ( ON ?auto_2762682 ?auto_2762681 ) ( not ( = ?auto_2762681 ?auto_2762682 ) ) ( not ( = ?auto_2762681 ?auto_2762683 ) ) ( TRUCK-AT ?auto_2762687 ?auto_2762685 ) ( not ( = ?auto_2762685 ?auto_2762684 ) ) ( HOIST-AT ?auto_2762688 ?auto_2762685 ) ( LIFTING ?auto_2762688 ?auto_2762683 ) ( not ( = ?auto_2762686 ?auto_2762688 ) ) ( ON ?auto_2762668 ?auto_2762667 ) ( ON ?auto_2762669 ?auto_2762668 ) ( ON ?auto_2762671 ?auto_2762669 ) ( ON ?auto_2762670 ?auto_2762671 ) ( ON ?auto_2762672 ?auto_2762670 ) ( ON ?auto_2762673 ?auto_2762672 ) ( ON ?auto_2762674 ?auto_2762673 ) ( ON ?auto_2762675 ?auto_2762674 ) ( ON ?auto_2762676 ?auto_2762675 ) ( ON ?auto_2762677 ?auto_2762676 ) ( ON ?auto_2762678 ?auto_2762677 ) ( ON ?auto_2762679 ?auto_2762678 ) ( ON ?auto_2762680 ?auto_2762679 ) ( ON ?auto_2762681 ?auto_2762680 ) ( not ( = ?auto_2762667 ?auto_2762668 ) ) ( not ( = ?auto_2762667 ?auto_2762669 ) ) ( not ( = ?auto_2762667 ?auto_2762671 ) ) ( not ( = ?auto_2762667 ?auto_2762670 ) ) ( not ( = ?auto_2762667 ?auto_2762672 ) ) ( not ( = ?auto_2762667 ?auto_2762673 ) ) ( not ( = ?auto_2762667 ?auto_2762674 ) ) ( not ( = ?auto_2762667 ?auto_2762675 ) ) ( not ( = ?auto_2762667 ?auto_2762676 ) ) ( not ( = ?auto_2762667 ?auto_2762677 ) ) ( not ( = ?auto_2762667 ?auto_2762678 ) ) ( not ( = ?auto_2762667 ?auto_2762679 ) ) ( not ( = ?auto_2762667 ?auto_2762680 ) ) ( not ( = ?auto_2762667 ?auto_2762681 ) ) ( not ( = ?auto_2762667 ?auto_2762682 ) ) ( not ( = ?auto_2762667 ?auto_2762683 ) ) ( not ( = ?auto_2762668 ?auto_2762669 ) ) ( not ( = ?auto_2762668 ?auto_2762671 ) ) ( not ( = ?auto_2762668 ?auto_2762670 ) ) ( not ( = ?auto_2762668 ?auto_2762672 ) ) ( not ( = ?auto_2762668 ?auto_2762673 ) ) ( not ( = ?auto_2762668 ?auto_2762674 ) ) ( not ( = ?auto_2762668 ?auto_2762675 ) ) ( not ( = ?auto_2762668 ?auto_2762676 ) ) ( not ( = ?auto_2762668 ?auto_2762677 ) ) ( not ( = ?auto_2762668 ?auto_2762678 ) ) ( not ( = ?auto_2762668 ?auto_2762679 ) ) ( not ( = ?auto_2762668 ?auto_2762680 ) ) ( not ( = ?auto_2762668 ?auto_2762681 ) ) ( not ( = ?auto_2762668 ?auto_2762682 ) ) ( not ( = ?auto_2762668 ?auto_2762683 ) ) ( not ( = ?auto_2762669 ?auto_2762671 ) ) ( not ( = ?auto_2762669 ?auto_2762670 ) ) ( not ( = ?auto_2762669 ?auto_2762672 ) ) ( not ( = ?auto_2762669 ?auto_2762673 ) ) ( not ( = ?auto_2762669 ?auto_2762674 ) ) ( not ( = ?auto_2762669 ?auto_2762675 ) ) ( not ( = ?auto_2762669 ?auto_2762676 ) ) ( not ( = ?auto_2762669 ?auto_2762677 ) ) ( not ( = ?auto_2762669 ?auto_2762678 ) ) ( not ( = ?auto_2762669 ?auto_2762679 ) ) ( not ( = ?auto_2762669 ?auto_2762680 ) ) ( not ( = ?auto_2762669 ?auto_2762681 ) ) ( not ( = ?auto_2762669 ?auto_2762682 ) ) ( not ( = ?auto_2762669 ?auto_2762683 ) ) ( not ( = ?auto_2762671 ?auto_2762670 ) ) ( not ( = ?auto_2762671 ?auto_2762672 ) ) ( not ( = ?auto_2762671 ?auto_2762673 ) ) ( not ( = ?auto_2762671 ?auto_2762674 ) ) ( not ( = ?auto_2762671 ?auto_2762675 ) ) ( not ( = ?auto_2762671 ?auto_2762676 ) ) ( not ( = ?auto_2762671 ?auto_2762677 ) ) ( not ( = ?auto_2762671 ?auto_2762678 ) ) ( not ( = ?auto_2762671 ?auto_2762679 ) ) ( not ( = ?auto_2762671 ?auto_2762680 ) ) ( not ( = ?auto_2762671 ?auto_2762681 ) ) ( not ( = ?auto_2762671 ?auto_2762682 ) ) ( not ( = ?auto_2762671 ?auto_2762683 ) ) ( not ( = ?auto_2762670 ?auto_2762672 ) ) ( not ( = ?auto_2762670 ?auto_2762673 ) ) ( not ( = ?auto_2762670 ?auto_2762674 ) ) ( not ( = ?auto_2762670 ?auto_2762675 ) ) ( not ( = ?auto_2762670 ?auto_2762676 ) ) ( not ( = ?auto_2762670 ?auto_2762677 ) ) ( not ( = ?auto_2762670 ?auto_2762678 ) ) ( not ( = ?auto_2762670 ?auto_2762679 ) ) ( not ( = ?auto_2762670 ?auto_2762680 ) ) ( not ( = ?auto_2762670 ?auto_2762681 ) ) ( not ( = ?auto_2762670 ?auto_2762682 ) ) ( not ( = ?auto_2762670 ?auto_2762683 ) ) ( not ( = ?auto_2762672 ?auto_2762673 ) ) ( not ( = ?auto_2762672 ?auto_2762674 ) ) ( not ( = ?auto_2762672 ?auto_2762675 ) ) ( not ( = ?auto_2762672 ?auto_2762676 ) ) ( not ( = ?auto_2762672 ?auto_2762677 ) ) ( not ( = ?auto_2762672 ?auto_2762678 ) ) ( not ( = ?auto_2762672 ?auto_2762679 ) ) ( not ( = ?auto_2762672 ?auto_2762680 ) ) ( not ( = ?auto_2762672 ?auto_2762681 ) ) ( not ( = ?auto_2762672 ?auto_2762682 ) ) ( not ( = ?auto_2762672 ?auto_2762683 ) ) ( not ( = ?auto_2762673 ?auto_2762674 ) ) ( not ( = ?auto_2762673 ?auto_2762675 ) ) ( not ( = ?auto_2762673 ?auto_2762676 ) ) ( not ( = ?auto_2762673 ?auto_2762677 ) ) ( not ( = ?auto_2762673 ?auto_2762678 ) ) ( not ( = ?auto_2762673 ?auto_2762679 ) ) ( not ( = ?auto_2762673 ?auto_2762680 ) ) ( not ( = ?auto_2762673 ?auto_2762681 ) ) ( not ( = ?auto_2762673 ?auto_2762682 ) ) ( not ( = ?auto_2762673 ?auto_2762683 ) ) ( not ( = ?auto_2762674 ?auto_2762675 ) ) ( not ( = ?auto_2762674 ?auto_2762676 ) ) ( not ( = ?auto_2762674 ?auto_2762677 ) ) ( not ( = ?auto_2762674 ?auto_2762678 ) ) ( not ( = ?auto_2762674 ?auto_2762679 ) ) ( not ( = ?auto_2762674 ?auto_2762680 ) ) ( not ( = ?auto_2762674 ?auto_2762681 ) ) ( not ( = ?auto_2762674 ?auto_2762682 ) ) ( not ( = ?auto_2762674 ?auto_2762683 ) ) ( not ( = ?auto_2762675 ?auto_2762676 ) ) ( not ( = ?auto_2762675 ?auto_2762677 ) ) ( not ( = ?auto_2762675 ?auto_2762678 ) ) ( not ( = ?auto_2762675 ?auto_2762679 ) ) ( not ( = ?auto_2762675 ?auto_2762680 ) ) ( not ( = ?auto_2762675 ?auto_2762681 ) ) ( not ( = ?auto_2762675 ?auto_2762682 ) ) ( not ( = ?auto_2762675 ?auto_2762683 ) ) ( not ( = ?auto_2762676 ?auto_2762677 ) ) ( not ( = ?auto_2762676 ?auto_2762678 ) ) ( not ( = ?auto_2762676 ?auto_2762679 ) ) ( not ( = ?auto_2762676 ?auto_2762680 ) ) ( not ( = ?auto_2762676 ?auto_2762681 ) ) ( not ( = ?auto_2762676 ?auto_2762682 ) ) ( not ( = ?auto_2762676 ?auto_2762683 ) ) ( not ( = ?auto_2762677 ?auto_2762678 ) ) ( not ( = ?auto_2762677 ?auto_2762679 ) ) ( not ( = ?auto_2762677 ?auto_2762680 ) ) ( not ( = ?auto_2762677 ?auto_2762681 ) ) ( not ( = ?auto_2762677 ?auto_2762682 ) ) ( not ( = ?auto_2762677 ?auto_2762683 ) ) ( not ( = ?auto_2762678 ?auto_2762679 ) ) ( not ( = ?auto_2762678 ?auto_2762680 ) ) ( not ( = ?auto_2762678 ?auto_2762681 ) ) ( not ( = ?auto_2762678 ?auto_2762682 ) ) ( not ( = ?auto_2762678 ?auto_2762683 ) ) ( not ( = ?auto_2762679 ?auto_2762680 ) ) ( not ( = ?auto_2762679 ?auto_2762681 ) ) ( not ( = ?auto_2762679 ?auto_2762682 ) ) ( not ( = ?auto_2762679 ?auto_2762683 ) ) ( not ( = ?auto_2762680 ?auto_2762681 ) ) ( not ( = ?auto_2762680 ?auto_2762682 ) ) ( not ( = ?auto_2762680 ?auto_2762683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2762681 ?auto_2762682 ?auto_2762683 )
      ( MAKE-16CRATE-VERIFY ?auto_2762667 ?auto_2762668 ?auto_2762669 ?auto_2762671 ?auto_2762670 ?auto_2762672 ?auto_2762673 ?auto_2762674 ?auto_2762675 ?auto_2762676 ?auto_2762677 ?auto_2762678 ?auto_2762679 ?auto_2762680 ?auto_2762681 ?auto_2762682 ?auto_2762683 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2762915 - SURFACE
      ?auto_2762916 - SURFACE
      ?auto_2762917 - SURFACE
      ?auto_2762919 - SURFACE
      ?auto_2762918 - SURFACE
      ?auto_2762920 - SURFACE
      ?auto_2762921 - SURFACE
      ?auto_2762922 - SURFACE
      ?auto_2762923 - SURFACE
      ?auto_2762924 - SURFACE
      ?auto_2762925 - SURFACE
      ?auto_2762926 - SURFACE
      ?auto_2762927 - SURFACE
      ?auto_2762928 - SURFACE
      ?auto_2762929 - SURFACE
      ?auto_2762930 - SURFACE
      ?auto_2762931 - SURFACE
    )
    :vars
    (
      ?auto_2762932 - HOIST
      ?auto_2762933 - PLACE
      ?auto_2762935 - TRUCK
      ?auto_2762934 - PLACE
      ?auto_2762937 - HOIST
      ?auto_2762936 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2762932 ?auto_2762933 ) ( SURFACE-AT ?auto_2762930 ?auto_2762933 ) ( CLEAR ?auto_2762930 ) ( IS-CRATE ?auto_2762931 ) ( not ( = ?auto_2762930 ?auto_2762931 ) ) ( AVAILABLE ?auto_2762932 ) ( ON ?auto_2762930 ?auto_2762929 ) ( not ( = ?auto_2762929 ?auto_2762930 ) ) ( not ( = ?auto_2762929 ?auto_2762931 ) ) ( TRUCK-AT ?auto_2762935 ?auto_2762934 ) ( not ( = ?auto_2762934 ?auto_2762933 ) ) ( HOIST-AT ?auto_2762937 ?auto_2762934 ) ( not ( = ?auto_2762932 ?auto_2762937 ) ) ( AVAILABLE ?auto_2762937 ) ( SURFACE-AT ?auto_2762931 ?auto_2762934 ) ( ON ?auto_2762931 ?auto_2762936 ) ( CLEAR ?auto_2762931 ) ( not ( = ?auto_2762930 ?auto_2762936 ) ) ( not ( = ?auto_2762931 ?auto_2762936 ) ) ( not ( = ?auto_2762929 ?auto_2762936 ) ) ( ON ?auto_2762916 ?auto_2762915 ) ( ON ?auto_2762917 ?auto_2762916 ) ( ON ?auto_2762919 ?auto_2762917 ) ( ON ?auto_2762918 ?auto_2762919 ) ( ON ?auto_2762920 ?auto_2762918 ) ( ON ?auto_2762921 ?auto_2762920 ) ( ON ?auto_2762922 ?auto_2762921 ) ( ON ?auto_2762923 ?auto_2762922 ) ( ON ?auto_2762924 ?auto_2762923 ) ( ON ?auto_2762925 ?auto_2762924 ) ( ON ?auto_2762926 ?auto_2762925 ) ( ON ?auto_2762927 ?auto_2762926 ) ( ON ?auto_2762928 ?auto_2762927 ) ( ON ?auto_2762929 ?auto_2762928 ) ( not ( = ?auto_2762915 ?auto_2762916 ) ) ( not ( = ?auto_2762915 ?auto_2762917 ) ) ( not ( = ?auto_2762915 ?auto_2762919 ) ) ( not ( = ?auto_2762915 ?auto_2762918 ) ) ( not ( = ?auto_2762915 ?auto_2762920 ) ) ( not ( = ?auto_2762915 ?auto_2762921 ) ) ( not ( = ?auto_2762915 ?auto_2762922 ) ) ( not ( = ?auto_2762915 ?auto_2762923 ) ) ( not ( = ?auto_2762915 ?auto_2762924 ) ) ( not ( = ?auto_2762915 ?auto_2762925 ) ) ( not ( = ?auto_2762915 ?auto_2762926 ) ) ( not ( = ?auto_2762915 ?auto_2762927 ) ) ( not ( = ?auto_2762915 ?auto_2762928 ) ) ( not ( = ?auto_2762915 ?auto_2762929 ) ) ( not ( = ?auto_2762915 ?auto_2762930 ) ) ( not ( = ?auto_2762915 ?auto_2762931 ) ) ( not ( = ?auto_2762915 ?auto_2762936 ) ) ( not ( = ?auto_2762916 ?auto_2762917 ) ) ( not ( = ?auto_2762916 ?auto_2762919 ) ) ( not ( = ?auto_2762916 ?auto_2762918 ) ) ( not ( = ?auto_2762916 ?auto_2762920 ) ) ( not ( = ?auto_2762916 ?auto_2762921 ) ) ( not ( = ?auto_2762916 ?auto_2762922 ) ) ( not ( = ?auto_2762916 ?auto_2762923 ) ) ( not ( = ?auto_2762916 ?auto_2762924 ) ) ( not ( = ?auto_2762916 ?auto_2762925 ) ) ( not ( = ?auto_2762916 ?auto_2762926 ) ) ( not ( = ?auto_2762916 ?auto_2762927 ) ) ( not ( = ?auto_2762916 ?auto_2762928 ) ) ( not ( = ?auto_2762916 ?auto_2762929 ) ) ( not ( = ?auto_2762916 ?auto_2762930 ) ) ( not ( = ?auto_2762916 ?auto_2762931 ) ) ( not ( = ?auto_2762916 ?auto_2762936 ) ) ( not ( = ?auto_2762917 ?auto_2762919 ) ) ( not ( = ?auto_2762917 ?auto_2762918 ) ) ( not ( = ?auto_2762917 ?auto_2762920 ) ) ( not ( = ?auto_2762917 ?auto_2762921 ) ) ( not ( = ?auto_2762917 ?auto_2762922 ) ) ( not ( = ?auto_2762917 ?auto_2762923 ) ) ( not ( = ?auto_2762917 ?auto_2762924 ) ) ( not ( = ?auto_2762917 ?auto_2762925 ) ) ( not ( = ?auto_2762917 ?auto_2762926 ) ) ( not ( = ?auto_2762917 ?auto_2762927 ) ) ( not ( = ?auto_2762917 ?auto_2762928 ) ) ( not ( = ?auto_2762917 ?auto_2762929 ) ) ( not ( = ?auto_2762917 ?auto_2762930 ) ) ( not ( = ?auto_2762917 ?auto_2762931 ) ) ( not ( = ?auto_2762917 ?auto_2762936 ) ) ( not ( = ?auto_2762919 ?auto_2762918 ) ) ( not ( = ?auto_2762919 ?auto_2762920 ) ) ( not ( = ?auto_2762919 ?auto_2762921 ) ) ( not ( = ?auto_2762919 ?auto_2762922 ) ) ( not ( = ?auto_2762919 ?auto_2762923 ) ) ( not ( = ?auto_2762919 ?auto_2762924 ) ) ( not ( = ?auto_2762919 ?auto_2762925 ) ) ( not ( = ?auto_2762919 ?auto_2762926 ) ) ( not ( = ?auto_2762919 ?auto_2762927 ) ) ( not ( = ?auto_2762919 ?auto_2762928 ) ) ( not ( = ?auto_2762919 ?auto_2762929 ) ) ( not ( = ?auto_2762919 ?auto_2762930 ) ) ( not ( = ?auto_2762919 ?auto_2762931 ) ) ( not ( = ?auto_2762919 ?auto_2762936 ) ) ( not ( = ?auto_2762918 ?auto_2762920 ) ) ( not ( = ?auto_2762918 ?auto_2762921 ) ) ( not ( = ?auto_2762918 ?auto_2762922 ) ) ( not ( = ?auto_2762918 ?auto_2762923 ) ) ( not ( = ?auto_2762918 ?auto_2762924 ) ) ( not ( = ?auto_2762918 ?auto_2762925 ) ) ( not ( = ?auto_2762918 ?auto_2762926 ) ) ( not ( = ?auto_2762918 ?auto_2762927 ) ) ( not ( = ?auto_2762918 ?auto_2762928 ) ) ( not ( = ?auto_2762918 ?auto_2762929 ) ) ( not ( = ?auto_2762918 ?auto_2762930 ) ) ( not ( = ?auto_2762918 ?auto_2762931 ) ) ( not ( = ?auto_2762918 ?auto_2762936 ) ) ( not ( = ?auto_2762920 ?auto_2762921 ) ) ( not ( = ?auto_2762920 ?auto_2762922 ) ) ( not ( = ?auto_2762920 ?auto_2762923 ) ) ( not ( = ?auto_2762920 ?auto_2762924 ) ) ( not ( = ?auto_2762920 ?auto_2762925 ) ) ( not ( = ?auto_2762920 ?auto_2762926 ) ) ( not ( = ?auto_2762920 ?auto_2762927 ) ) ( not ( = ?auto_2762920 ?auto_2762928 ) ) ( not ( = ?auto_2762920 ?auto_2762929 ) ) ( not ( = ?auto_2762920 ?auto_2762930 ) ) ( not ( = ?auto_2762920 ?auto_2762931 ) ) ( not ( = ?auto_2762920 ?auto_2762936 ) ) ( not ( = ?auto_2762921 ?auto_2762922 ) ) ( not ( = ?auto_2762921 ?auto_2762923 ) ) ( not ( = ?auto_2762921 ?auto_2762924 ) ) ( not ( = ?auto_2762921 ?auto_2762925 ) ) ( not ( = ?auto_2762921 ?auto_2762926 ) ) ( not ( = ?auto_2762921 ?auto_2762927 ) ) ( not ( = ?auto_2762921 ?auto_2762928 ) ) ( not ( = ?auto_2762921 ?auto_2762929 ) ) ( not ( = ?auto_2762921 ?auto_2762930 ) ) ( not ( = ?auto_2762921 ?auto_2762931 ) ) ( not ( = ?auto_2762921 ?auto_2762936 ) ) ( not ( = ?auto_2762922 ?auto_2762923 ) ) ( not ( = ?auto_2762922 ?auto_2762924 ) ) ( not ( = ?auto_2762922 ?auto_2762925 ) ) ( not ( = ?auto_2762922 ?auto_2762926 ) ) ( not ( = ?auto_2762922 ?auto_2762927 ) ) ( not ( = ?auto_2762922 ?auto_2762928 ) ) ( not ( = ?auto_2762922 ?auto_2762929 ) ) ( not ( = ?auto_2762922 ?auto_2762930 ) ) ( not ( = ?auto_2762922 ?auto_2762931 ) ) ( not ( = ?auto_2762922 ?auto_2762936 ) ) ( not ( = ?auto_2762923 ?auto_2762924 ) ) ( not ( = ?auto_2762923 ?auto_2762925 ) ) ( not ( = ?auto_2762923 ?auto_2762926 ) ) ( not ( = ?auto_2762923 ?auto_2762927 ) ) ( not ( = ?auto_2762923 ?auto_2762928 ) ) ( not ( = ?auto_2762923 ?auto_2762929 ) ) ( not ( = ?auto_2762923 ?auto_2762930 ) ) ( not ( = ?auto_2762923 ?auto_2762931 ) ) ( not ( = ?auto_2762923 ?auto_2762936 ) ) ( not ( = ?auto_2762924 ?auto_2762925 ) ) ( not ( = ?auto_2762924 ?auto_2762926 ) ) ( not ( = ?auto_2762924 ?auto_2762927 ) ) ( not ( = ?auto_2762924 ?auto_2762928 ) ) ( not ( = ?auto_2762924 ?auto_2762929 ) ) ( not ( = ?auto_2762924 ?auto_2762930 ) ) ( not ( = ?auto_2762924 ?auto_2762931 ) ) ( not ( = ?auto_2762924 ?auto_2762936 ) ) ( not ( = ?auto_2762925 ?auto_2762926 ) ) ( not ( = ?auto_2762925 ?auto_2762927 ) ) ( not ( = ?auto_2762925 ?auto_2762928 ) ) ( not ( = ?auto_2762925 ?auto_2762929 ) ) ( not ( = ?auto_2762925 ?auto_2762930 ) ) ( not ( = ?auto_2762925 ?auto_2762931 ) ) ( not ( = ?auto_2762925 ?auto_2762936 ) ) ( not ( = ?auto_2762926 ?auto_2762927 ) ) ( not ( = ?auto_2762926 ?auto_2762928 ) ) ( not ( = ?auto_2762926 ?auto_2762929 ) ) ( not ( = ?auto_2762926 ?auto_2762930 ) ) ( not ( = ?auto_2762926 ?auto_2762931 ) ) ( not ( = ?auto_2762926 ?auto_2762936 ) ) ( not ( = ?auto_2762927 ?auto_2762928 ) ) ( not ( = ?auto_2762927 ?auto_2762929 ) ) ( not ( = ?auto_2762927 ?auto_2762930 ) ) ( not ( = ?auto_2762927 ?auto_2762931 ) ) ( not ( = ?auto_2762927 ?auto_2762936 ) ) ( not ( = ?auto_2762928 ?auto_2762929 ) ) ( not ( = ?auto_2762928 ?auto_2762930 ) ) ( not ( = ?auto_2762928 ?auto_2762931 ) ) ( not ( = ?auto_2762928 ?auto_2762936 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2762929 ?auto_2762930 ?auto_2762931 )
      ( MAKE-16CRATE-VERIFY ?auto_2762915 ?auto_2762916 ?auto_2762917 ?auto_2762919 ?auto_2762918 ?auto_2762920 ?auto_2762921 ?auto_2762922 ?auto_2762923 ?auto_2762924 ?auto_2762925 ?auto_2762926 ?auto_2762927 ?auto_2762928 ?auto_2762929 ?auto_2762930 ?auto_2762931 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2763164 - SURFACE
      ?auto_2763165 - SURFACE
      ?auto_2763166 - SURFACE
      ?auto_2763168 - SURFACE
      ?auto_2763167 - SURFACE
      ?auto_2763169 - SURFACE
      ?auto_2763170 - SURFACE
      ?auto_2763171 - SURFACE
      ?auto_2763172 - SURFACE
      ?auto_2763173 - SURFACE
      ?auto_2763174 - SURFACE
      ?auto_2763175 - SURFACE
      ?auto_2763176 - SURFACE
      ?auto_2763177 - SURFACE
      ?auto_2763178 - SURFACE
      ?auto_2763179 - SURFACE
      ?auto_2763180 - SURFACE
    )
    :vars
    (
      ?auto_2763186 - HOIST
      ?auto_2763185 - PLACE
      ?auto_2763182 - PLACE
      ?auto_2763184 - HOIST
      ?auto_2763181 - SURFACE
      ?auto_2763183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2763186 ?auto_2763185 ) ( SURFACE-AT ?auto_2763179 ?auto_2763185 ) ( CLEAR ?auto_2763179 ) ( IS-CRATE ?auto_2763180 ) ( not ( = ?auto_2763179 ?auto_2763180 ) ) ( AVAILABLE ?auto_2763186 ) ( ON ?auto_2763179 ?auto_2763178 ) ( not ( = ?auto_2763178 ?auto_2763179 ) ) ( not ( = ?auto_2763178 ?auto_2763180 ) ) ( not ( = ?auto_2763182 ?auto_2763185 ) ) ( HOIST-AT ?auto_2763184 ?auto_2763182 ) ( not ( = ?auto_2763186 ?auto_2763184 ) ) ( AVAILABLE ?auto_2763184 ) ( SURFACE-AT ?auto_2763180 ?auto_2763182 ) ( ON ?auto_2763180 ?auto_2763181 ) ( CLEAR ?auto_2763180 ) ( not ( = ?auto_2763179 ?auto_2763181 ) ) ( not ( = ?auto_2763180 ?auto_2763181 ) ) ( not ( = ?auto_2763178 ?auto_2763181 ) ) ( TRUCK-AT ?auto_2763183 ?auto_2763185 ) ( ON ?auto_2763165 ?auto_2763164 ) ( ON ?auto_2763166 ?auto_2763165 ) ( ON ?auto_2763168 ?auto_2763166 ) ( ON ?auto_2763167 ?auto_2763168 ) ( ON ?auto_2763169 ?auto_2763167 ) ( ON ?auto_2763170 ?auto_2763169 ) ( ON ?auto_2763171 ?auto_2763170 ) ( ON ?auto_2763172 ?auto_2763171 ) ( ON ?auto_2763173 ?auto_2763172 ) ( ON ?auto_2763174 ?auto_2763173 ) ( ON ?auto_2763175 ?auto_2763174 ) ( ON ?auto_2763176 ?auto_2763175 ) ( ON ?auto_2763177 ?auto_2763176 ) ( ON ?auto_2763178 ?auto_2763177 ) ( not ( = ?auto_2763164 ?auto_2763165 ) ) ( not ( = ?auto_2763164 ?auto_2763166 ) ) ( not ( = ?auto_2763164 ?auto_2763168 ) ) ( not ( = ?auto_2763164 ?auto_2763167 ) ) ( not ( = ?auto_2763164 ?auto_2763169 ) ) ( not ( = ?auto_2763164 ?auto_2763170 ) ) ( not ( = ?auto_2763164 ?auto_2763171 ) ) ( not ( = ?auto_2763164 ?auto_2763172 ) ) ( not ( = ?auto_2763164 ?auto_2763173 ) ) ( not ( = ?auto_2763164 ?auto_2763174 ) ) ( not ( = ?auto_2763164 ?auto_2763175 ) ) ( not ( = ?auto_2763164 ?auto_2763176 ) ) ( not ( = ?auto_2763164 ?auto_2763177 ) ) ( not ( = ?auto_2763164 ?auto_2763178 ) ) ( not ( = ?auto_2763164 ?auto_2763179 ) ) ( not ( = ?auto_2763164 ?auto_2763180 ) ) ( not ( = ?auto_2763164 ?auto_2763181 ) ) ( not ( = ?auto_2763165 ?auto_2763166 ) ) ( not ( = ?auto_2763165 ?auto_2763168 ) ) ( not ( = ?auto_2763165 ?auto_2763167 ) ) ( not ( = ?auto_2763165 ?auto_2763169 ) ) ( not ( = ?auto_2763165 ?auto_2763170 ) ) ( not ( = ?auto_2763165 ?auto_2763171 ) ) ( not ( = ?auto_2763165 ?auto_2763172 ) ) ( not ( = ?auto_2763165 ?auto_2763173 ) ) ( not ( = ?auto_2763165 ?auto_2763174 ) ) ( not ( = ?auto_2763165 ?auto_2763175 ) ) ( not ( = ?auto_2763165 ?auto_2763176 ) ) ( not ( = ?auto_2763165 ?auto_2763177 ) ) ( not ( = ?auto_2763165 ?auto_2763178 ) ) ( not ( = ?auto_2763165 ?auto_2763179 ) ) ( not ( = ?auto_2763165 ?auto_2763180 ) ) ( not ( = ?auto_2763165 ?auto_2763181 ) ) ( not ( = ?auto_2763166 ?auto_2763168 ) ) ( not ( = ?auto_2763166 ?auto_2763167 ) ) ( not ( = ?auto_2763166 ?auto_2763169 ) ) ( not ( = ?auto_2763166 ?auto_2763170 ) ) ( not ( = ?auto_2763166 ?auto_2763171 ) ) ( not ( = ?auto_2763166 ?auto_2763172 ) ) ( not ( = ?auto_2763166 ?auto_2763173 ) ) ( not ( = ?auto_2763166 ?auto_2763174 ) ) ( not ( = ?auto_2763166 ?auto_2763175 ) ) ( not ( = ?auto_2763166 ?auto_2763176 ) ) ( not ( = ?auto_2763166 ?auto_2763177 ) ) ( not ( = ?auto_2763166 ?auto_2763178 ) ) ( not ( = ?auto_2763166 ?auto_2763179 ) ) ( not ( = ?auto_2763166 ?auto_2763180 ) ) ( not ( = ?auto_2763166 ?auto_2763181 ) ) ( not ( = ?auto_2763168 ?auto_2763167 ) ) ( not ( = ?auto_2763168 ?auto_2763169 ) ) ( not ( = ?auto_2763168 ?auto_2763170 ) ) ( not ( = ?auto_2763168 ?auto_2763171 ) ) ( not ( = ?auto_2763168 ?auto_2763172 ) ) ( not ( = ?auto_2763168 ?auto_2763173 ) ) ( not ( = ?auto_2763168 ?auto_2763174 ) ) ( not ( = ?auto_2763168 ?auto_2763175 ) ) ( not ( = ?auto_2763168 ?auto_2763176 ) ) ( not ( = ?auto_2763168 ?auto_2763177 ) ) ( not ( = ?auto_2763168 ?auto_2763178 ) ) ( not ( = ?auto_2763168 ?auto_2763179 ) ) ( not ( = ?auto_2763168 ?auto_2763180 ) ) ( not ( = ?auto_2763168 ?auto_2763181 ) ) ( not ( = ?auto_2763167 ?auto_2763169 ) ) ( not ( = ?auto_2763167 ?auto_2763170 ) ) ( not ( = ?auto_2763167 ?auto_2763171 ) ) ( not ( = ?auto_2763167 ?auto_2763172 ) ) ( not ( = ?auto_2763167 ?auto_2763173 ) ) ( not ( = ?auto_2763167 ?auto_2763174 ) ) ( not ( = ?auto_2763167 ?auto_2763175 ) ) ( not ( = ?auto_2763167 ?auto_2763176 ) ) ( not ( = ?auto_2763167 ?auto_2763177 ) ) ( not ( = ?auto_2763167 ?auto_2763178 ) ) ( not ( = ?auto_2763167 ?auto_2763179 ) ) ( not ( = ?auto_2763167 ?auto_2763180 ) ) ( not ( = ?auto_2763167 ?auto_2763181 ) ) ( not ( = ?auto_2763169 ?auto_2763170 ) ) ( not ( = ?auto_2763169 ?auto_2763171 ) ) ( not ( = ?auto_2763169 ?auto_2763172 ) ) ( not ( = ?auto_2763169 ?auto_2763173 ) ) ( not ( = ?auto_2763169 ?auto_2763174 ) ) ( not ( = ?auto_2763169 ?auto_2763175 ) ) ( not ( = ?auto_2763169 ?auto_2763176 ) ) ( not ( = ?auto_2763169 ?auto_2763177 ) ) ( not ( = ?auto_2763169 ?auto_2763178 ) ) ( not ( = ?auto_2763169 ?auto_2763179 ) ) ( not ( = ?auto_2763169 ?auto_2763180 ) ) ( not ( = ?auto_2763169 ?auto_2763181 ) ) ( not ( = ?auto_2763170 ?auto_2763171 ) ) ( not ( = ?auto_2763170 ?auto_2763172 ) ) ( not ( = ?auto_2763170 ?auto_2763173 ) ) ( not ( = ?auto_2763170 ?auto_2763174 ) ) ( not ( = ?auto_2763170 ?auto_2763175 ) ) ( not ( = ?auto_2763170 ?auto_2763176 ) ) ( not ( = ?auto_2763170 ?auto_2763177 ) ) ( not ( = ?auto_2763170 ?auto_2763178 ) ) ( not ( = ?auto_2763170 ?auto_2763179 ) ) ( not ( = ?auto_2763170 ?auto_2763180 ) ) ( not ( = ?auto_2763170 ?auto_2763181 ) ) ( not ( = ?auto_2763171 ?auto_2763172 ) ) ( not ( = ?auto_2763171 ?auto_2763173 ) ) ( not ( = ?auto_2763171 ?auto_2763174 ) ) ( not ( = ?auto_2763171 ?auto_2763175 ) ) ( not ( = ?auto_2763171 ?auto_2763176 ) ) ( not ( = ?auto_2763171 ?auto_2763177 ) ) ( not ( = ?auto_2763171 ?auto_2763178 ) ) ( not ( = ?auto_2763171 ?auto_2763179 ) ) ( not ( = ?auto_2763171 ?auto_2763180 ) ) ( not ( = ?auto_2763171 ?auto_2763181 ) ) ( not ( = ?auto_2763172 ?auto_2763173 ) ) ( not ( = ?auto_2763172 ?auto_2763174 ) ) ( not ( = ?auto_2763172 ?auto_2763175 ) ) ( not ( = ?auto_2763172 ?auto_2763176 ) ) ( not ( = ?auto_2763172 ?auto_2763177 ) ) ( not ( = ?auto_2763172 ?auto_2763178 ) ) ( not ( = ?auto_2763172 ?auto_2763179 ) ) ( not ( = ?auto_2763172 ?auto_2763180 ) ) ( not ( = ?auto_2763172 ?auto_2763181 ) ) ( not ( = ?auto_2763173 ?auto_2763174 ) ) ( not ( = ?auto_2763173 ?auto_2763175 ) ) ( not ( = ?auto_2763173 ?auto_2763176 ) ) ( not ( = ?auto_2763173 ?auto_2763177 ) ) ( not ( = ?auto_2763173 ?auto_2763178 ) ) ( not ( = ?auto_2763173 ?auto_2763179 ) ) ( not ( = ?auto_2763173 ?auto_2763180 ) ) ( not ( = ?auto_2763173 ?auto_2763181 ) ) ( not ( = ?auto_2763174 ?auto_2763175 ) ) ( not ( = ?auto_2763174 ?auto_2763176 ) ) ( not ( = ?auto_2763174 ?auto_2763177 ) ) ( not ( = ?auto_2763174 ?auto_2763178 ) ) ( not ( = ?auto_2763174 ?auto_2763179 ) ) ( not ( = ?auto_2763174 ?auto_2763180 ) ) ( not ( = ?auto_2763174 ?auto_2763181 ) ) ( not ( = ?auto_2763175 ?auto_2763176 ) ) ( not ( = ?auto_2763175 ?auto_2763177 ) ) ( not ( = ?auto_2763175 ?auto_2763178 ) ) ( not ( = ?auto_2763175 ?auto_2763179 ) ) ( not ( = ?auto_2763175 ?auto_2763180 ) ) ( not ( = ?auto_2763175 ?auto_2763181 ) ) ( not ( = ?auto_2763176 ?auto_2763177 ) ) ( not ( = ?auto_2763176 ?auto_2763178 ) ) ( not ( = ?auto_2763176 ?auto_2763179 ) ) ( not ( = ?auto_2763176 ?auto_2763180 ) ) ( not ( = ?auto_2763176 ?auto_2763181 ) ) ( not ( = ?auto_2763177 ?auto_2763178 ) ) ( not ( = ?auto_2763177 ?auto_2763179 ) ) ( not ( = ?auto_2763177 ?auto_2763180 ) ) ( not ( = ?auto_2763177 ?auto_2763181 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2763178 ?auto_2763179 ?auto_2763180 )
      ( MAKE-16CRATE-VERIFY ?auto_2763164 ?auto_2763165 ?auto_2763166 ?auto_2763168 ?auto_2763167 ?auto_2763169 ?auto_2763170 ?auto_2763171 ?auto_2763172 ?auto_2763173 ?auto_2763174 ?auto_2763175 ?auto_2763176 ?auto_2763177 ?auto_2763178 ?auto_2763179 ?auto_2763180 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2763413 - SURFACE
      ?auto_2763414 - SURFACE
      ?auto_2763415 - SURFACE
      ?auto_2763417 - SURFACE
      ?auto_2763416 - SURFACE
      ?auto_2763418 - SURFACE
      ?auto_2763419 - SURFACE
      ?auto_2763420 - SURFACE
      ?auto_2763421 - SURFACE
      ?auto_2763422 - SURFACE
      ?auto_2763423 - SURFACE
      ?auto_2763424 - SURFACE
      ?auto_2763425 - SURFACE
      ?auto_2763426 - SURFACE
      ?auto_2763427 - SURFACE
      ?auto_2763428 - SURFACE
      ?auto_2763429 - SURFACE
    )
    :vars
    (
      ?auto_2763433 - HOIST
      ?auto_2763435 - PLACE
      ?auto_2763430 - PLACE
      ?auto_2763434 - HOIST
      ?auto_2763431 - SURFACE
      ?auto_2763432 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2763433 ?auto_2763435 ) ( IS-CRATE ?auto_2763429 ) ( not ( = ?auto_2763428 ?auto_2763429 ) ) ( not ( = ?auto_2763427 ?auto_2763428 ) ) ( not ( = ?auto_2763427 ?auto_2763429 ) ) ( not ( = ?auto_2763430 ?auto_2763435 ) ) ( HOIST-AT ?auto_2763434 ?auto_2763430 ) ( not ( = ?auto_2763433 ?auto_2763434 ) ) ( AVAILABLE ?auto_2763434 ) ( SURFACE-AT ?auto_2763429 ?auto_2763430 ) ( ON ?auto_2763429 ?auto_2763431 ) ( CLEAR ?auto_2763429 ) ( not ( = ?auto_2763428 ?auto_2763431 ) ) ( not ( = ?auto_2763429 ?auto_2763431 ) ) ( not ( = ?auto_2763427 ?auto_2763431 ) ) ( TRUCK-AT ?auto_2763432 ?auto_2763435 ) ( SURFACE-AT ?auto_2763427 ?auto_2763435 ) ( CLEAR ?auto_2763427 ) ( LIFTING ?auto_2763433 ?auto_2763428 ) ( IS-CRATE ?auto_2763428 ) ( ON ?auto_2763414 ?auto_2763413 ) ( ON ?auto_2763415 ?auto_2763414 ) ( ON ?auto_2763417 ?auto_2763415 ) ( ON ?auto_2763416 ?auto_2763417 ) ( ON ?auto_2763418 ?auto_2763416 ) ( ON ?auto_2763419 ?auto_2763418 ) ( ON ?auto_2763420 ?auto_2763419 ) ( ON ?auto_2763421 ?auto_2763420 ) ( ON ?auto_2763422 ?auto_2763421 ) ( ON ?auto_2763423 ?auto_2763422 ) ( ON ?auto_2763424 ?auto_2763423 ) ( ON ?auto_2763425 ?auto_2763424 ) ( ON ?auto_2763426 ?auto_2763425 ) ( ON ?auto_2763427 ?auto_2763426 ) ( not ( = ?auto_2763413 ?auto_2763414 ) ) ( not ( = ?auto_2763413 ?auto_2763415 ) ) ( not ( = ?auto_2763413 ?auto_2763417 ) ) ( not ( = ?auto_2763413 ?auto_2763416 ) ) ( not ( = ?auto_2763413 ?auto_2763418 ) ) ( not ( = ?auto_2763413 ?auto_2763419 ) ) ( not ( = ?auto_2763413 ?auto_2763420 ) ) ( not ( = ?auto_2763413 ?auto_2763421 ) ) ( not ( = ?auto_2763413 ?auto_2763422 ) ) ( not ( = ?auto_2763413 ?auto_2763423 ) ) ( not ( = ?auto_2763413 ?auto_2763424 ) ) ( not ( = ?auto_2763413 ?auto_2763425 ) ) ( not ( = ?auto_2763413 ?auto_2763426 ) ) ( not ( = ?auto_2763413 ?auto_2763427 ) ) ( not ( = ?auto_2763413 ?auto_2763428 ) ) ( not ( = ?auto_2763413 ?auto_2763429 ) ) ( not ( = ?auto_2763413 ?auto_2763431 ) ) ( not ( = ?auto_2763414 ?auto_2763415 ) ) ( not ( = ?auto_2763414 ?auto_2763417 ) ) ( not ( = ?auto_2763414 ?auto_2763416 ) ) ( not ( = ?auto_2763414 ?auto_2763418 ) ) ( not ( = ?auto_2763414 ?auto_2763419 ) ) ( not ( = ?auto_2763414 ?auto_2763420 ) ) ( not ( = ?auto_2763414 ?auto_2763421 ) ) ( not ( = ?auto_2763414 ?auto_2763422 ) ) ( not ( = ?auto_2763414 ?auto_2763423 ) ) ( not ( = ?auto_2763414 ?auto_2763424 ) ) ( not ( = ?auto_2763414 ?auto_2763425 ) ) ( not ( = ?auto_2763414 ?auto_2763426 ) ) ( not ( = ?auto_2763414 ?auto_2763427 ) ) ( not ( = ?auto_2763414 ?auto_2763428 ) ) ( not ( = ?auto_2763414 ?auto_2763429 ) ) ( not ( = ?auto_2763414 ?auto_2763431 ) ) ( not ( = ?auto_2763415 ?auto_2763417 ) ) ( not ( = ?auto_2763415 ?auto_2763416 ) ) ( not ( = ?auto_2763415 ?auto_2763418 ) ) ( not ( = ?auto_2763415 ?auto_2763419 ) ) ( not ( = ?auto_2763415 ?auto_2763420 ) ) ( not ( = ?auto_2763415 ?auto_2763421 ) ) ( not ( = ?auto_2763415 ?auto_2763422 ) ) ( not ( = ?auto_2763415 ?auto_2763423 ) ) ( not ( = ?auto_2763415 ?auto_2763424 ) ) ( not ( = ?auto_2763415 ?auto_2763425 ) ) ( not ( = ?auto_2763415 ?auto_2763426 ) ) ( not ( = ?auto_2763415 ?auto_2763427 ) ) ( not ( = ?auto_2763415 ?auto_2763428 ) ) ( not ( = ?auto_2763415 ?auto_2763429 ) ) ( not ( = ?auto_2763415 ?auto_2763431 ) ) ( not ( = ?auto_2763417 ?auto_2763416 ) ) ( not ( = ?auto_2763417 ?auto_2763418 ) ) ( not ( = ?auto_2763417 ?auto_2763419 ) ) ( not ( = ?auto_2763417 ?auto_2763420 ) ) ( not ( = ?auto_2763417 ?auto_2763421 ) ) ( not ( = ?auto_2763417 ?auto_2763422 ) ) ( not ( = ?auto_2763417 ?auto_2763423 ) ) ( not ( = ?auto_2763417 ?auto_2763424 ) ) ( not ( = ?auto_2763417 ?auto_2763425 ) ) ( not ( = ?auto_2763417 ?auto_2763426 ) ) ( not ( = ?auto_2763417 ?auto_2763427 ) ) ( not ( = ?auto_2763417 ?auto_2763428 ) ) ( not ( = ?auto_2763417 ?auto_2763429 ) ) ( not ( = ?auto_2763417 ?auto_2763431 ) ) ( not ( = ?auto_2763416 ?auto_2763418 ) ) ( not ( = ?auto_2763416 ?auto_2763419 ) ) ( not ( = ?auto_2763416 ?auto_2763420 ) ) ( not ( = ?auto_2763416 ?auto_2763421 ) ) ( not ( = ?auto_2763416 ?auto_2763422 ) ) ( not ( = ?auto_2763416 ?auto_2763423 ) ) ( not ( = ?auto_2763416 ?auto_2763424 ) ) ( not ( = ?auto_2763416 ?auto_2763425 ) ) ( not ( = ?auto_2763416 ?auto_2763426 ) ) ( not ( = ?auto_2763416 ?auto_2763427 ) ) ( not ( = ?auto_2763416 ?auto_2763428 ) ) ( not ( = ?auto_2763416 ?auto_2763429 ) ) ( not ( = ?auto_2763416 ?auto_2763431 ) ) ( not ( = ?auto_2763418 ?auto_2763419 ) ) ( not ( = ?auto_2763418 ?auto_2763420 ) ) ( not ( = ?auto_2763418 ?auto_2763421 ) ) ( not ( = ?auto_2763418 ?auto_2763422 ) ) ( not ( = ?auto_2763418 ?auto_2763423 ) ) ( not ( = ?auto_2763418 ?auto_2763424 ) ) ( not ( = ?auto_2763418 ?auto_2763425 ) ) ( not ( = ?auto_2763418 ?auto_2763426 ) ) ( not ( = ?auto_2763418 ?auto_2763427 ) ) ( not ( = ?auto_2763418 ?auto_2763428 ) ) ( not ( = ?auto_2763418 ?auto_2763429 ) ) ( not ( = ?auto_2763418 ?auto_2763431 ) ) ( not ( = ?auto_2763419 ?auto_2763420 ) ) ( not ( = ?auto_2763419 ?auto_2763421 ) ) ( not ( = ?auto_2763419 ?auto_2763422 ) ) ( not ( = ?auto_2763419 ?auto_2763423 ) ) ( not ( = ?auto_2763419 ?auto_2763424 ) ) ( not ( = ?auto_2763419 ?auto_2763425 ) ) ( not ( = ?auto_2763419 ?auto_2763426 ) ) ( not ( = ?auto_2763419 ?auto_2763427 ) ) ( not ( = ?auto_2763419 ?auto_2763428 ) ) ( not ( = ?auto_2763419 ?auto_2763429 ) ) ( not ( = ?auto_2763419 ?auto_2763431 ) ) ( not ( = ?auto_2763420 ?auto_2763421 ) ) ( not ( = ?auto_2763420 ?auto_2763422 ) ) ( not ( = ?auto_2763420 ?auto_2763423 ) ) ( not ( = ?auto_2763420 ?auto_2763424 ) ) ( not ( = ?auto_2763420 ?auto_2763425 ) ) ( not ( = ?auto_2763420 ?auto_2763426 ) ) ( not ( = ?auto_2763420 ?auto_2763427 ) ) ( not ( = ?auto_2763420 ?auto_2763428 ) ) ( not ( = ?auto_2763420 ?auto_2763429 ) ) ( not ( = ?auto_2763420 ?auto_2763431 ) ) ( not ( = ?auto_2763421 ?auto_2763422 ) ) ( not ( = ?auto_2763421 ?auto_2763423 ) ) ( not ( = ?auto_2763421 ?auto_2763424 ) ) ( not ( = ?auto_2763421 ?auto_2763425 ) ) ( not ( = ?auto_2763421 ?auto_2763426 ) ) ( not ( = ?auto_2763421 ?auto_2763427 ) ) ( not ( = ?auto_2763421 ?auto_2763428 ) ) ( not ( = ?auto_2763421 ?auto_2763429 ) ) ( not ( = ?auto_2763421 ?auto_2763431 ) ) ( not ( = ?auto_2763422 ?auto_2763423 ) ) ( not ( = ?auto_2763422 ?auto_2763424 ) ) ( not ( = ?auto_2763422 ?auto_2763425 ) ) ( not ( = ?auto_2763422 ?auto_2763426 ) ) ( not ( = ?auto_2763422 ?auto_2763427 ) ) ( not ( = ?auto_2763422 ?auto_2763428 ) ) ( not ( = ?auto_2763422 ?auto_2763429 ) ) ( not ( = ?auto_2763422 ?auto_2763431 ) ) ( not ( = ?auto_2763423 ?auto_2763424 ) ) ( not ( = ?auto_2763423 ?auto_2763425 ) ) ( not ( = ?auto_2763423 ?auto_2763426 ) ) ( not ( = ?auto_2763423 ?auto_2763427 ) ) ( not ( = ?auto_2763423 ?auto_2763428 ) ) ( not ( = ?auto_2763423 ?auto_2763429 ) ) ( not ( = ?auto_2763423 ?auto_2763431 ) ) ( not ( = ?auto_2763424 ?auto_2763425 ) ) ( not ( = ?auto_2763424 ?auto_2763426 ) ) ( not ( = ?auto_2763424 ?auto_2763427 ) ) ( not ( = ?auto_2763424 ?auto_2763428 ) ) ( not ( = ?auto_2763424 ?auto_2763429 ) ) ( not ( = ?auto_2763424 ?auto_2763431 ) ) ( not ( = ?auto_2763425 ?auto_2763426 ) ) ( not ( = ?auto_2763425 ?auto_2763427 ) ) ( not ( = ?auto_2763425 ?auto_2763428 ) ) ( not ( = ?auto_2763425 ?auto_2763429 ) ) ( not ( = ?auto_2763425 ?auto_2763431 ) ) ( not ( = ?auto_2763426 ?auto_2763427 ) ) ( not ( = ?auto_2763426 ?auto_2763428 ) ) ( not ( = ?auto_2763426 ?auto_2763429 ) ) ( not ( = ?auto_2763426 ?auto_2763431 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2763427 ?auto_2763428 ?auto_2763429 )
      ( MAKE-16CRATE-VERIFY ?auto_2763413 ?auto_2763414 ?auto_2763415 ?auto_2763417 ?auto_2763416 ?auto_2763418 ?auto_2763419 ?auto_2763420 ?auto_2763421 ?auto_2763422 ?auto_2763423 ?auto_2763424 ?auto_2763425 ?auto_2763426 ?auto_2763427 ?auto_2763428 ?auto_2763429 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2763662 - SURFACE
      ?auto_2763663 - SURFACE
      ?auto_2763664 - SURFACE
      ?auto_2763666 - SURFACE
      ?auto_2763665 - SURFACE
      ?auto_2763667 - SURFACE
      ?auto_2763668 - SURFACE
      ?auto_2763669 - SURFACE
      ?auto_2763670 - SURFACE
      ?auto_2763671 - SURFACE
      ?auto_2763672 - SURFACE
      ?auto_2763673 - SURFACE
      ?auto_2763674 - SURFACE
      ?auto_2763675 - SURFACE
      ?auto_2763676 - SURFACE
      ?auto_2763677 - SURFACE
      ?auto_2763678 - SURFACE
    )
    :vars
    (
      ?auto_2763681 - HOIST
      ?auto_2763683 - PLACE
      ?auto_2763680 - PLACE
      ?auto_2763684 - HOIST
      ?auto_2763682 - SURFACE
      ?auto_2763679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2763681 ?auto_2763683 ) ( IS-CRATE ?auto_2763678 ) ( not ( = ?auto_2763677 ?auto_2763678 ) ) ( not ( = ?auto_2763676 ?auto_2763677 ) ) ( not ( = ?auto_2763676 ?auto_2763678 ) ) ( not ( = ?auto_2763680 ?auto_2763683 ) ) ( HOIST-AT ?auto_2763684 ?auto_2763680 ) ( not ( = ?auto_2763681 ?auto_2763684 ) ) ( AVAILABLE ?auto_2763684 ) ( SURFACE-AT ?auto_2763678 ?auto_2763680 ) ( ON ?auto_2763678 ?auto_2763682 ) ( CLEAR ?auto_2763678 ) ( not ( = ?auto_2763677 ?auto_2763682 ) ) ( not ( = ?auto_2763678 ?auto_2763682 ) ) ( not ( = ?auto_2763676 ?auto_2763682 ) ) ( TRUCK-AT ?auto_2763679 ?auto_2763683 ) ( SURFACE-AT ?auto_2763676 ?auto_2763683 ) ( CLEAR ?auto_2763676 ) ( IS-CRATE ?auto_2763677 ) ( AVAILABLE ?auto_2763681 ) ( IN ?auto_2763677 ?auto_2763679 ) ( ON ?auto_2763663 ?auto_2763662 ) ( ON ?auto_2763664 ?auto_2763663 ) ( ON ?auto_2763666 ?auto_2763664 ) ( ON ?auto_2763665 ?auto_2763666 ) ( ON ?auto_2763667 ?auto_2763665 ) ( ON ?auto_2763668 ?auto_2763667 ) ( ON ?auto_2763669 ?auto_2763668 ) ( ON ?auto_2763670 ?auto_2763669 ) ( ON ?auto_2763671 ?auto_2763670 ) ( ON ?auto_2763672 ?auto_2763671 ) ( ON ?auto_2763673 ?auto_2763672 ) ( ON ?auto_2763674 ?auto_2763673 ) ( ON ?auto_2763675 ?auto_2763674 ) ( ON ?auto_2763676 ?auto_2763675 ) ( not ( = ?auto_2763662 ?auto_2763663 ) ) ( not ( = ?auto_2763662 ?auto_2763664 ) ) ( not ( = ?auto_2763662 ?auto_2763666 ) ) ( not ( = ?auto_2763662 ?auto_2763665 ) ) ( not ( = ?auto_2763662 ?auto_2763667 ) ) ( not ( = ?auto_2763662 ?auto_2763668 ) ) ( not ( = ?auto_2763662 ?auto_2763669 ) ) ( not ( = ?auto_2763662 ?auto_2763670 ) ) ( not ( = ?auto_2763662 ?auto_2763671 ) ) ( not ( = ?auto_2763662 ?auto_2763672 ) ) ( not ( = ?auto_2763662 ?auto_2763673 ) ) ( not ( = ?auto_2763662 ?auto_2763674 ) ) ( not ( = ?auto_2763662 ?auto_2763675 ) ) ( not ( = ?auto_2763662 ?auto_2763676 ) ) ( not ( = ?auto_2763662 ?auto_2763677 ) ) ( not ( = ?auto_2763662 ?auto_2763678 ) ) ( not ( = ?auto_2763662 ?auto_2763682 ) ) ( not ( = ?auto_2763663 ?auto_2763664 ) ) ( not ( = ?auto_2763663 ?auto_2763666 ) ) ( not ( = ?auto_2763663 ?auto_2763665 ) ) ( not ( = ?auto_2763663 ?auto_2763667 ) ) ( not ( = ?auto_2763663 ?auto_2763668 ) ) ( not ( = ?auto_2763663 ?auto_2763669 ) ) ( not ( = ?auto_2763663 ?auto_2763670 ) ) ( not ( = ?auto_2763663 ?auto_2763671 ) ) ( not ( = ?auto_2763663 ?auto_2763672 ) ) ( not ( = ?auto_2763663 ?auto_2763673 ) ) ( not ( = ?auto_2763663 ?auto_2763674 ) ) ( not ( = ?auto_2763663 ?auto_2763675 ) ) ( not ( = ?auto_2763663 ?auto_2763676 ) ) ( not ( = ?auto_2763663 ?auto_2763677 ) ) ( not ( = ?auto_2763663 ?auto_2763678 ) ) ( not ( = ?auto_2763663 ?auto_2763682 ) ) ( not ( = ?auto_2763664 ?auto_2763666 ) ) ( not ( = ?auto_2763664 ?auto_2763665 ) ) ( not ( = ?auto_2763664 ?auto_2763667 ) ) ( not ( = ?auto_2763664 ?auto_2763668 ) ) ( not ( = ?auto_2763664 ?auto_2763669 ) ) ( not ( = ?auto_2763664 ?auto_2763670 ) ) ( not ( = ?auto_2763664 ?auto_2763671 ) ) ( not ( = ?auto_2763664 ?auto_2763672 ) ) ( not ( = ?auto_2763664 ?auto_2763673 ) ) ( not ( = ?auto_2763664 ?auto_2763674 ) ) ( not ( = ?auto_2763664 ?auto_2763675 ) ) ( not ( = ?auto_2763664 ?auto_2763676 ) ) ( not ( = ?auto_2763664 ?auto_2763677 ) ) ( not ( = ?auto_2763664 ?auto_2763678 ) ) ( not ( = ?auto_2763664 ?auto_2763682 ) ) ( not ( = ?auto_2763666 ?auto_2763665 ) ) ( not ( = ?auto_2763666 ?auto_2763667 ) ) ( not ( = ?auto_2763666 ?auto_2763668 ) ) ( not ( = ?auto_2763666 ?auto_2763669 ) ) ( not ( = ?auto_2763666 ?auto_2763670 ) ) ( not ( = ?auto_2763666 ?auto_2763671 ) ) ( not ( = ?auto_2763666 ?auto_2763672 ) ) ( not ( = ?auto_2763666 ?auto_2763673 ) ) ( not ( = ?auto_2763666 ?auto_2763674 ) ) ( not ( = ?auto_2763666 ?auto_2763675 ) ) ( not ( = ?auto_2763666 ?auto_2763676 ) ) ( not ( = ?auto_2763666 ?auto_2763677 ) ) ( not ( = ?auto_2763666 ?auto_2763678 ) ) ( not ( = ?auto_2763666 ?auto_2763682 ) ) ( not ( = ?auto_2763665 ?auto_2763667 ) ) ( not ( = ?auto_2763665 ?auto_2763668 ) ) ( not ( = ?auto_2763665 ?auto_2763669 ) ) ( not ( = ?auto_2763665 ?auto_2763670 ) ) ( not ( = ?auto_2763665 ?auto_2763671 ) ) ( not ( = ?auto_2763665 ?auto_2763672 ) ) ( not ( = ?auto_2763665 ?auto_2763673 ) ) ( not ( = ?auto_2763665 ?auto_2763674 ) ) ( not ( = ?auto_2763665 ?auto_2763675 ) ) ( not ( = ?auto_2763665 ?auto_2763676 ) ) ( not ( = ?auto_2763665 ?auto_2763677 ) ) ( not ( = ?auto_2763665 ?auto_2763678 ) ) ( not ( = ?auto_2763665 ?auto_2763682 ) ) ( not ( = ?auto_2763667 ?auto_2763668 ) ) ( not ( = ?auto_2763667 ?auto_2763669 ) ) ( not ( = ?auto_2763667 ?auto_2763670 ) ) ( not ( = ?auto_2763667 ?auto_2763671 ) ) ( not ( = ?auto_2763667 ?auto_2763672 ) ) ( not ( = ?auto_2763667 ?auto_2763673 ) ) ( not ( = ?auto_2763667 ?auto_2763674 ) ) ( not ( = ?auto_2763667 ?auto_2763675 ) ) ( not ( = ?auto_2763667 ?auto_2763676 ) ) ( not ( = ?auto_2763667 ?auto_2763677 ) ) ( not ( = ?auto_2763667 ?auto_2763678 ) ) ( not ( = ?auto_2763667 ?auto_2763682 ) ) ( not ( = ?auto_2763668 ?auto_2763669 ) ) ( not ( = ?auto_2763668 ?auto_2763670 ) ) ( not ( = ?auto_2763668 ?auto_2763671 ) ) ( not ( = ?auto_2763668 ?auto_2763672 ) ) ( not ( = ?auto_2763668 ?auto_2763673 ) ) ( not ( = ?auto_2763668 ?auto_2763674 ) ) ( not ( = ?auto_2763668 ?auto_2763675 ) ) ( not ( = ?auto_2763668 ?auto_2763676 ) ) ( not ( = ?auto_2763668 ?auto_2763677 ) ) ( not ( = ?auto_2763668 ?auto_2763678 ) ) ( not ( = ?auto_2763668 ?auto_2763682 ) ) ( not ( = ?auto_2763669 ?auto_2763670 ) ) ( not ( = ?auto_2763669 ?auto_2763671 ) ) ( not ( = ?auto_2763669 ?auto_2763672 ) ) ( not ( = ?auto_2763669 ?auto_2763673 ) ) ( not ( = ?auto_2763669 ?auto_2763674 ) ) ( not ( = ?auto_2763669 ?auto_2763675 ) ) ( not ( = ?auto_2763669 ?auto_2763676 ) ) ( not ( = ?auto_2763669 ?auto_2763677 ) ) ( not ( = ?auto_2763669 ?auto_2763678 ) ) ( not ( = ?auto_2763669 ?auto_2763682 ) ) ( not ( = ?auto_2763670 ?auto_2763671 ) ) ( not ( = ?auto_2763670 ?auto_2763672 ) ) ( not ( = ?auto_2763670 ?auto_2763673 ) ) ( not ( = ?auto_2763670 ?auto_2763674 ) ) ( not ( = ?auto_2763670 ?auto_2763675 ) ) ( not ( = ?auto_2763670 ?auto_2763676 ) ) ( not ( = ?auto_2763670 ?auto_2763677 ) ) ( not ( = ?auto_2763670 ?auto_2763678 ) ) ( not ( = ?auto_2763670 ?auto_2763682 ) ) ( not ( = ?auto_2763671 ?auto_2763672 ) ) ( not ( = ?auto_2763671 ?auto_2763673 ) ) ( not ( = ?auto_2763671 ?auto_2763674 ) ) ( not ( = ?auto_2763671 ?auto_2763675 ) ) ( not ( = ?auto_2763671 ?auto_2763676 ) ) ( not ( = ?auto_2763671 ?auto_2763677 ) ) ( not ( = ?auto_2763671 ?auto_2763678 ) ) ( not ( = ?auto_2763671 ?auto_2763682 ) ) ( not ( = ?auto_2763672 ?auto_2763673 ) ) ( not ( = ?auto_2763672 ?auto_2763674 ) ) ( not ( = ?auto_2763672 ?auto_2763675 ) ) ( not ( = ?auto_2763672 ?auto_2763676 ) ) ( not ( = ?auto_2763672 ?auto_2763677 ) ) ( not ( = ?auto_2763672 ?auto_2763678 ) ) ( not ( = ?auto_2763672 ?auto_2763682 ) ) ( not ( = ?auto_2763673 ?auto_2763674 ) ) ( not ( = ?auto_2763673 ?auto_2763675 ) ) ( not ( = ?auto_2763673 ?auto_2763676 ) ) ( not ( = ?auto_2763673 ?auto_2763677 ) ) ( not ( = ?auto_2763673 ?auto_2763678 ) ) ( not ( = ?auto_2763673 ?auto_2763682 ) ) ( not ( = ?auto_2763674 ?auto_2763675 ) ) ( not ( = ?auto_2763674 ?auto_2763676 ) ) ( not ( = ?auto_2763674 ?auto_2763677 ) ) ( not ( = ?auto_2763674 ?auto_2763678 ) ) ( not ( = ?auto_2763674 ?auto_2763682 ) ) ( not ( = ?auto_2763675 ?auto_2763676 ) ) ( not ( = ?auto_2763675 ?auto_2763677 ) ) ( not ( = ?auto_2763675 ?auto_2763678 ) ) ( not ( = ?auto_2763675 ?auto_2763682 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2763676 ?auto_2763677 ?auto_2763678 )
      ( MAKE-16CRATE-VERIFY ?auto_2763662 ?auto_2763663 ?auto_2763664 ?auto_2763666 ?auto_2763665 ?auto_2763667 ?auto_2763668 ?auto_2763669 ?auto_2763670 ?auto_2763671 ?auto_2763672 ?auto_2763673 ?auto_2763674 ?auto_2763675 ?auto_2763676 ?auto_2763677 ?auto_2763678 ) )
  )

)

