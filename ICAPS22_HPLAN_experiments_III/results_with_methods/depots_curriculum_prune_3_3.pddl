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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_360 - SURFACE
      ?auto_361 - SURFACE
    )
    :vars
    (
      ?auto_362 - HOIST
      ?auto_363 - PLACE
      ?auto_365 - PLACE
      ?auto_366 - HOIST
      ?auto_367 - SURFACE
      ?auto_364 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_362 ?auto_363 ) ( SURFACE-AT ?auto_360 ?auto_363 ) ( CLEAR ?auto_360 ) ( IS-CRATE ?auto_361 ) ( AVAILABLE ?auto_362 ) ( not ( = ?auto_365 ?auto_363 ) ) ( HOIST-AT ?auto_366 ?auto_365 ) ( AVAILABLE ?auto_366 ) ( SURFACE-AT ?auto_361 ?auto_365 ) ( ON ?auto_361 ?auto_367 ) ( CLEAR ?auto_361 ) ( TRUCK-AT ?auto_364 ?auto_363 ) ( not ( = ?auto_360 ?auto_361 ) ) ( not ( = ?auto_360 ?auto_367 ) ) ( not ( = ?auto_361 ?auto_367 ) ) ( not ( = ?auto_362 ?auto_366 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_364 ?auto_363 ?auto_365 )
      ( !LIFT ?auto_366 ?auto_361 ?auto_367 ?auto_365 )
      ( !LOAD ?auto_366 ?auto_361 ?auto_364 ?auto_365 )
      ( !DRIVE ?auto_364 ?auto_365 ?auto_363 )
      ( !UNLOAD ?auto_362 ?auto_361 ?auto_364 ?auto_363 )
      ( !DROP ?auto_362 ?auto_361 ?auto_360 ?auto_363 )
      ( MAKE-1CRATE-VERIFY ?auto_360 ?auto_361 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_381 - SURFACE
      ?auto_382 - SURFACE
      ?auto_383 - SURFACE
    )
    :vars
    (
      ?auto_386 - HOIST
      ?auto_389 - PLACE
      ?auto_387 - PLACE
      ?auto_384 - HOIST
      ?auto_385 - SURFACE
      ?auto_390 - PLACE
      ?auto_391 - HOIST
      ?auto_392 - SURFACE
      ?auto_388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_386 ?auto_389 ) ( IS-CRATE ?auto_383 ) ( not ( = ?auto_387 ?auto_389 ) ) ( HOIST-AT ?auto_384 ?auto_387 ) ( AVAILABLE ?auto_384 ) ( SURFACE-AT ?auto_383 ?auto_387 ) ( ON ?auto_383 ?auto_385 ) ( CLEAR ?auto_383 ) ( not ( = ?auto_382 ?auto_383 ) ) ( not ( = ?auto_382 ?auto_385 ) ) ( not ( = ?auto_383 ?auto_385 ) ) ( not ( = ?auto_386 ?auto_384 ) ) ( SURFACE-AT ?auto_381 ?auto_389 ) ( CLEAR ?auto_381 ) ( IS-CRATE ?auto_382 ) ( AVAILABLE ?auto_386 ) ( not ( = ?auto_390 ?auto_389 ) ) ( HOIST-AT ?auto_391 ?auto_390 ) ( AVAILABLE ?auto_391 ) ( SURFACE-AT ?auto_382 ?auto_390 ) ( ON ?auto_382 ?auto_392 ) ( CLEAR ?auto_382 ) ( TRUCK-AT ?auto_388 ?auto_389 ) ( not ( = ?auto_381 ?auto_382 ) ) ( not ( = ?auto_381 ?auto_392 ) ) ( not ( = ?auto_382 ?auto_392 ) ) ( not ( = ?auto_386 ?auto_391 ) ) ( not ( = ?auto_381 ?auto_383 ) ) ( not ( = ?auto_381 ?auto_385 ) ) ( not ( = ?auto_383 ?auto_392 ) ) ( not ( = ?auto_387 ?auto_390 ) ) ( not ( = ?auto_384 ?auto_391 ) ) ( not ( = ?auto_385 ?auto_392 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_381 ?auto_382 )
      ( MAKE-1CRATE ?auto_382 ?auto_383 )
      ( MAKE-2CRATE-VERIFY ?auto_381 ?auto_382 ?auto_383 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_407 - SURFACE
      ?auto_408 - SURFACE
      ?auto_409 - SURFACE
      ?auto_410 - SURFACE
    )
    :vars
    (
      ?auto_413 - HOIST
      ?auto_415 - PLACE
      ?auto_414 - PLACE
      ?auto_411 - HOIST
      ?auto_412 - SURFACE
      ?auto_418 - PLACE
      ?auto_419 - HOIST
      ?auto_417 - SURFACE
      ?auto_420 - PLACE
      ?auto_421 - HOIST
      ?auto_422 - SURFACE
      ?auto_416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_413 ?auto_415 ) ( IS-CRATE ?auto_410 ) ( not ( = ?auto_414 ?auto_415 ) ) ( HOIST-AT ?auto_411 ?auto_414 ) ( AVAILABLE ?auto_411 ) ( SURFACE-AT ?auto_410 ?auto_414 ) ( ON ?auto_410 ?auto_412 ) ( CLEAR ?auto_410 ) ( not ( = ?auto_409 ?auto_410 ) ) ( not ( = ?auto_409 ?auto_412 ) ) ( not ( = ?auto_410 ?auto_412 ) ) ( not ( = ?auto_413 ?auto_411 ) ) ( IS-CRATE ?auto_409 ) ( not ( = ?auto_418 ?auto_415 ) ) ( HOIST-AT ?auto_419 ?auto_418 ) ( AVAILABLE ?auto_419 ) ( SURFACE-AT ?auto_409 ?auto_418 ) ( ON ?auto_409 ?auto_417 ) ( CLEAR ?auto_409 ) ( not ( = ?auto_408 ?auto_409 ) ) ( not ( = ?auto_408 ?auto_417 ) ) ( not ( = ?auto_409 ?auto_417 ) ) ( not ( = ?auto_413 ?auto_419 ) ) ( SURFACE-AT ?auto_407 ?auto_415 ) ( CLEAR ?auto_407 ) ( IS-CRATE ?auto_408 ) ( AVAILABLE ?auto_413 ) ( not ( = ?auto_420 ?auto_415 ) ) ( HOIST-AT ?auto_421 ?auto_420 ) ( AVAILABLE ?auto_421 ) ( SURFACE-AT ?auto_408 ?auto_420 ) ( ON ?auto_408 ?auto_422 ) ( CLEAR ?auto_408 ) ( TRUCK-AT ?auto_416 ?auto_415 ) ( not ( = ?auto_407 ?auto_408 ) ) ( not ( = ?auto_407 ?auto_422 ) ) ( not ( = ?auto_408 ?auto_422 ) ) ( not ( = ?auto_413 ?auto_421 ) ) ( not ( = ?auto_407 ?auto_409 ) ) ( not ( = ?auto_407 ?auto_417 ) ) ( not ( = ?auto_409 ?auto_422 ) ) ( not ( = ?auto_418 ?auto_420 ) ) ( not ( = ?auto_419 ?auto_421 ) ) ( not ( = ?auto_417 ?auto_422 ) ) ( not ( = ?auto_407 ?auto_410 ) ) ( not ( = ?auto_407 ?auto_412 ) ) ( not ( = ?auto_408 ?auto_410 ) ) ( not ( = ?auto_408 ?auto_412 ) ) ( not ( = ?auto_410 ?auto_417 ) ) ( not ( = ?auto_410 ?auto_422 ) ) ( not ( = ?auto_414 ?auto_418 ) ) ( not ( = ?auto_414 ?auto_420 ) ) ( not ( = ?auto_411 ?auto_419 ) ) ( not ( = ?auto_411 ?auto_421 ) ) ( not ( = ?auto_412 ?auto_417 ) ) ( not ( = ?auto_412 ?auto_422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_407 ?auto_408 ?auto_409 )
      ( MAKE-1CRATE ?auto_409 ?auto_410 )
      ( MAKE-3CRATE-VERIFY ?auto_407 ?auto_408 ?auto_409 ?auto_410 ) )
  )

)

