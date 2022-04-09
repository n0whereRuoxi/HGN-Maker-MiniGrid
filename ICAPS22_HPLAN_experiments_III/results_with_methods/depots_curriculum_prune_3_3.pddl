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
      ?auto_389 - HOIST
      ?auto_384 - PLACE
      ?auto_388 - PLACE
      ?auto_385 - HOIST
      ?auto_386 - SURFACE
      ?auto_390 - SURFACE
      ?auto_387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_389 ?auto_384 ) ( IS-CRATE ?auto_383 ) ( not ( = ?auto_388 ?auto_384 ) ) ( HOIST-AT ?auto_385 ?auto_388 ) ( SURFACE-AT ?auto_383 ?auto_388 ) ( ON ?auto_383 ?auto_386 ) ( CLEAR ?auto_383 ) ( not ( = ?auto_382 ?auto_383 ) ) ( not ( = ?auto_382 ?auto_386 ) ) ( not ( = ?auto_383 ?auto_386 ) ) ( not ( = ?auto_389 ?auto_385 ) ) ( SURFACE-AT ?auto_381 ?auto_384 ) ( CLEAR ?auto_381 ) ( IS-CRATE ?auto_382 ) ( AVAILABLE ?auto_389 ) ( AVAILABLE ?auto_385 ) ( SURFACE-AT ?auto_382 ?auto_388 ) ( ON ?auto_382 ?auto_390 ) ( CLEAR ?auto_382 ) ( TRUCK-AT ?auto_387 ?auto_384 ) ( not ( = ?auto_381 ?auto_382 ) ) ( not ( = ?auto_381 ?auto_390 ) ) ( not ( = ?auto_382 ?auto_390 ) ) ( not ( = ?auto_381 ?auto_383 ) ) ( not ( = ?auto_381 ?auto_386 ) ) ( not ( = ?auto_383 ?auto_390 ) ) ( not ( = ?auto_386 ?auto_390 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_381 ?auto_382 )
      ( MAKE-1CRATE ?auto_382 ?auto_383 )
      ( MAKE-2CRATE-VERIFY ?auto_381 ?auto_382 ?auto_383 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_405 - SURFACE
      ?auto_406 - SURFACE
      ?auto_407 - SURFACE
      ?auto_408 - SURFACE
    )
    :vars
    (
      ?auto_414 - HOIST
      ?auto_411 - PLACE
      ?auto_410 - PLACE
      ?auto_412 - HOIST
      ?auto_409 - SURFACE
      ?auto_415 - SURFACE
      ?auto_416 - SURFACE
      ?auto_413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_414 ?auto_411 ) ( IS-CRATE ?auto_408 ) ( not ( = ?auto_410 ?auto_411 ) ) ( HOIST-AT ?auto_412 ?auto_410 ) ( SURFACE-AT ?auto_408 ?auto_410 ) ( ON ?auto_408 ?auto_409 ) ( CLEAR ?auto_408 ) ( not ( = ?auto_407 ?auto_408 ) ) ( not ( = ?auto_407 ?auto_409 ) ) ( not ( = ?auto_408 ?auto_409 ) ) ( not ( = ?auto_414 ?auto_412 ) ) ( IS-CRATE ?auto_407 ) ( SURFACE-AT ?auto_407 ?auto_410 ) ( ON ?auto_407 ?auto_415 ) ( CLEAR ?auto_407 ) ( not ( = ?auto_406 ?auto_407 ) ) ( not ( = ?auto_406 ?auto_415 ) ) ( not ( = ?auto_407 ?auto_415 ) ) ( SURFACE-AT ?auto_405 ?auto_411 ) ( CLEAR ?auto_405 ) ( IS-CRATE ?auto_406 ) ( AVAILABLE ?auto_414 ) ( AVAILABLE ?auto_412 ) ( SURFACE-AT ?auto_406 ?auto_410 ) ( ON ?auto_406 ?auto_416 ) ( CLEAR ?auto_406 ) ( TRUCK-AT ?auto_413 ?auto_411 ) ( not ( = ?auto_405 ?auto_406 ) ) ( not ( = ?auto_405 ?auto_416 ) ) ( not ( = ?auto_406 ?auto_416 ) ) ( not ( = ?auto_405 ?auto_407 ) ) ( not ( = ?auto_405 ?auto_415 ) ) ( not ( = ?auto_407 ?auto_416 ) ) ( not ( = ?auto_415 ?auto_416 ) ) ( not ( = ?auto_405 ?auto_408 ) ) ( not ( = ?auto_405 ?auto_409 ) ) ( not ( = ?auto_406 ?auto_408 ) ) ( not ( = ?auto_406 ?auto_409 ) ) ( not ( = ?auto_408 ?auto_415 ) ) ( not ( = ?auto_408 ?auto_416 ) ) ( not ( = ?auto_409 ?auto_415 ) ) ( not ( = ?auto_409 ?auto_416 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_405 ?auto_406 ?auto_407 )
      ( MAKE-1CRATE ?auto_407 ?auto_408 )
      ( MAKE-3CRATE-VERIFY ?auto_405 ?auto_406 ?auto_407 ?auto_408 ) )
  )

)

